/*
*	XLZ1 Compression algorithm
*	Copyright 2019-20. Banebyte
*
*	Extremely fast data compression algorithm which
*	also achieves rather good compression ratio.
*	Written in pure C for portability.
*
*	Format:
*	111xxxxx - Literals
*	mmm0xxxx xxxxxxxx - Match
*	1100xxxx mmmmmmmm xxxxxxxx - Match (extra ML)
*	mmm1xxxx xxxxxxxx xxxxxxxx - Long match
*	1101xxxx mmmmmmmm xxxxxxxx xxxxxxxx - Long match (extra ML)
*/

#include <stdio.h>

#include "xlz.h"

xlz_uint32 XLZ1_Compress(xlz_uint8* source, xlz_uint8* dest, xlz_uint32 source_size) {

	if (source_size < 5) { return XLZ1_SHORTDATA; }

	xlz_uint8* src = source;
	xlz_uint8* dst = dest;
	xlz_uint8* src_lim = (source + source_size) - 4;

	xlz_uint32 i;

	xlz_uint8* htab[65536];
	for (i = 0; i < 65536; ++i) { htab[i] = src; }

	*dst++ = *src++;

	xlz_uint8* lit = src;

	for (;;) {

		xlz_uint16 hash = (((xlz_uint64)(*(xlz_uint32*)src) * XLZ1_PRIME) >> 32) & 65535;

		while (XLZ_UNLIKELY((src - htab[hash]) > 1048575) || XLZ_LIKELY(*(xlz_uint32*)src != *(xlz_uint32*)htab[hash])) {
			htab[hash] = src++;
			hash = (((xlz_uint64)(*(xlz_uint32*)src) * XLZ1_PRIME) >> 32) & 65535;
			if (src >= src_lim) { goto stop; }
		}

		if (src >= src_lim) { goto stop; }

		const xlz_uint8* match = htab[hash];
		htab[hash] = src;

		xlz_uint32 literals = src - lit;

		if (XLZ_LIKELY(literals)) {

			while (XLZ_UNLIKELY(literals > 30)) {
				*dst++ = 0xff;
				memcpy(dst, lit, 31);
				dst += 31, lit += 31;
				literals -= 31;
			}

			if (XLZ_LIKELY(literals)) {
				*dst++ = literals | 0xe0;
				memcpy(dst, lit, literals);
				dst += literals, lit += literals;
			}

		}

		xlz_uint16 hash1 = (((xlz_uint64)(*(xlz_uint32*)(src + 1)) * XLZ1_PRIME) >> 32) & 65535;
		xlz_uint16 hash2 = (((xlz_uint64)(*(xlz_uint32*)(src + 2)) * XLZ1_PRIME) >> 32) & 65535;
		xlz_uint16 hash3 = (((xlz_uint64)(*(xlz_uint32*)(src + 3)) * XLZ1_PRIME) >> 32) & 65535;
		htab[hash1] = src + 1;
		htab[hash2] = src + 2;
		htab[hash3] = src + 3;

		xlz_uint32 dist = src - match;

		xlz_uint32 mlen = 4;
		while (src[mlen] == match[mlen] && src + mlen < src_lim && ++mlen < 265);
		src += mlen;
		lit = src;

		xlz_uint8 v = dist > 4095;

		if (XLZ_LIKELY(mlen > 9)) {
			*dst++ = 0xc0 | (v << 4) | (dist & 0xf);
			*dst++ = mlen - 10;
			*dst++ = dist >> 4;
			*dst = dist >> 12;
			dst += v;
		} else {
			*dst++ = ((mlen - 4) << 5) | (v << 4) | (dist & 0xf);
			*dst++ = dist >> 4;
			*dst = dist >> 12;
			dst += v;
		}

	}

stop:
	{
		src_lim += 4;
		xlz_uint32 literals = src_lim - lit;

		if (XLZ_LIKELY(literals)) {

			while (XLZ_UNLIKELY(literals > 32)) {
				*dst++ = 0xff;
				memcpy(dst, lit, 32);
				dst += 32, lit += 32;
				literals -= 32;
			}

			if (XLZ_LIKELY(literals)) {
				*dst++ = literals | 0xe0;
				memcpy(dst, lit, literals);
				dst += literals, lit += literals;
			}

		}
	}

	xlz_uint32 compressed_size = dst - dest;

	return compressed_size;
}

xlz_uint32 XLZ1_Decompress(xlz_uint8* source, xlz_uint8* dest, xlz_uint32 source_size) {
	
	xlz_uint8* src = source;
	xlz_uint8* dst = dest;
	xlz_uint8* src_lim = source + source_size;

	*dst++ = *src++;
	xlz_uint8 token = *src++;

	while (src < src_lim) {
		
		while (token == 0xff) {
			memcpy(dst, src, 31);
			dst += 31, src += 31;
			token = *src++;
		}
		
		if ((token >> 5) == 0x7) {

			xlz_uint8 pending = token & 0x1f;
			memcpy(dst, src, pending);
			dst += pending, src += pending;
			token = *src++;

		} else {

			xlz_uint8 L = (token >> 4) & 1;
			xlz_uint32 offset = token & 0xf;
			xlz_uint32 mlen = (token >> 5);

			if (mlen == 6) {
				mlen += *src++;
			}

			mlen += 4;

			if (L) {
				xlz_uint8 hi, lo;
				hi = *src++;
				lo = *src++;
				offset |= (hi << 4) | (lo << 12);
			} else {
				offset |= (*src++ << 4);
			}

			xlz_uint8* ptr = dst - offset;
			while (mlen--) { *dst++ = *ptr++; }

			token = *src++;
		}

	}

	xlz_uint32 decompressed_size = dst - dest;

	return decompressed_size;
}
