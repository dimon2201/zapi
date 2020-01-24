#ifndef _XLZ_CODEC_
#define _XLZ_CODEC_

#if defined(__cplusplus)
extern "C" {
#endif

#define XLZ1_VERSION	   100
#define XLZ1_CODECTYPE     10
#define XLZ1_ERROR         0
#define XLZ1_SHORTDATA     1
#define XLZ1_PRIME         4207803889UL

typedef unsigned char      xlz_uint8;
typedef unsigned short     xlz_uint16;
typedef unsigned int       xlz_uint32;
typedef unsigned long long xlz_uint64;

#if defined(__GNUC__) || defined(__INTEL_COMPILER) || defined(__clang__)
#define XLZ_LIKELY(x)   __builtin_expect(x, 1)
#define XLZ_UNLIKELY(x) __builtin_expect(x, 0)
#else
#define XLZ_LIKELY(x) x
#define XLZ_UNLIKELY(x) x
#endif

xlz_uint32 XLZ1_Compress(xlz_uint8* source, xlz_uint8* dest, xlz_uint32 source_size);
xlz_uint32 XLZ1_Decompress(xlz_uint8* source, xlz_uint8* dest, xlz_uint32 source_size);

#if defined(__cplusplus)
}
#endif

#endif
