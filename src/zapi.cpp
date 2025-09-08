#include "zapi.hpp"

zapi::io::File::File(const std::string& path)
{
    _inFile = std::ifstream(path, std::ios::in | std::ios::binary);
    _inFile.seekg(0, std::ios::end);
    _byteSize = _inFile.tellg();
    _inFile.seekg(0, std::ios::beg);
    _data = zapi::storage::Allocate<void>(_byteSize, 64, FALSE);
    _inFile.read((char*)_data.mem, _byteSize);
    _inFile.close();
}

zapi::io::File::File(const std::string& path, const void* data, const size byteSize)
{
    _outFile = std::ofstream(path, std::ios::out | std::ios::binary);
    _outFile.write((const char*)data, byteSize);
    _outFile.close();
}

zapi::io::File::~File()
{
    zapi::storage::Deallocate(_data);
}

void zapi::io::Print(const std::string& message, const boolean newLine)
{
	std::cout << message;
	
	if (newLine == TRUE)
		std::cout << std::endl;
}

void pollute(volatile zapi::u8* polluter, zapi::size byteSize)
{
	for (volatile zapi::size i = byteSize - 64; i > 0; i -= 64)
		polluter[i] = 0;
}

/*void performance_test(
	const void* srcData,
    void* dstData,
    size srcByteSize,
    size& dstByteSize,
    const size maxDstByteSize,
    const zapi::codec::zap::Type type
)
{
	u8* src = (u8*)srcData;
    u8* dst = (u8*)dstData;
	
	volatile size cachesByteSize = 4849664ull;
	volatile u8* polluter = new u8[cachesByteSize];

	#define ITS 1
	
	pollute(&polluter[0], cachesByteSize);

	// Slow
	double med;
	med = 0.0;
	for (size it = 0; it < ITS; it++)
	{
		auto start = zapi::time::Now();
		for (size i = 0; i < srcByteSize; i++)
		{
			dst[i] = src[i];
		}
		auto end = zapi::time::Now();
		med += zapi::time::Milliseconds(start, end);
	}
	std::cout << "1 byte : " << med / (double)ITS << " ms" <<std::endl;
	pollute(&polluter[0], cachesByteSize);
	
	// Copy 8 byte words
	med = 0.0;
	for (size it = 0; it < ITS; it++)
	{
		auto start = zapi::time::Now();
		size s = srcByteSize >> 3;
		for (size i = 0; i < s; i += 1)
		{
			((unsigned long long*)dst)[i] = ((unsigned long long*)src)[i];
		}
		auto end = zapi::time::Now();
		med += zapi::time::Milliseconds(start, end);
	}
    std::cout << "8 byte : " << med / (double)ITS << " ms" <<std::endl;
	pollute(&polluter[0], cachesByteSize);
	
	// Copy 8 byte words with loop unrolling
	med = 0.0;
	for (size it = 0; it < ITS; it++)
	{
		auto start = zapi::time::Now();
		size s = srcByteSize >> 3;
		volatile size ptr = 0;
		for (; ptr < s;)
		{
			auto data = ((unsigned long long*)src)[ptr];
			((unsigned long long*)dst)[ptr++] = data;
			data = ((unsigned long long*)src)[ptr];
			((unsigned long long*)dst)[ptr++] = data;
			data = ((unsigned long long*)src)[ptr];
			((unsigned long long*)dst)[ptr++] = data;
			data = ((unsigned long long*)src)[ptr];
			((unsigned long long*)dst)[ptr++] = data;
			data = ((unsigned long long*)src)[ptr];
			((unsigned long long*)dst)[ptr++] = data;
			data = ((unsigned long long*)src)[ptr];
			((unsigned long long*)dst)[ptr++] = data;
			data = ((unsigned long long*)src)[ptr];
			((unsigned long long*)dst)[ptr++] = data;
			data = ((unsigned long long*)src)[ptr];
			((unsigned long long*)dst)[ptr++] = data;
		}
		auto end = zapi::time::Now();
		med += zapi::time::Milliseconds(start, end);
	}
    std::cout << "8 byte unrolled : " << med / (double)ITS << " ms" <<std::endl;
	pollute(&polluter[0], cachesByteSize);
	
	// Copy with SSE2
	med = 0.0;
	for (size it = 0; it < ITS; it++)
	{
		auto start = zapi::time::Now();
		for (size i = 0; i < srcByteSize; i += 64)
		{
			auto data = _mm_load_si128((__m128i const*)&src[i]);
			_mm_store_si128((__m128i*)&dst[i], data);
			data = _mm_load_si128((__m128i const*)&src[i + 16]);
			_mm_store_si128((__m128i*)&dst[i + 16], data);
			data = _mm_load_si128((__m128i const*)&src[i + 32]);
			_mm_store_si128((__m128i*)&dst[i + 32], data);
			data = _mm_load_si128((__m128i const*)&src[i + 48]);
			_mm_store_si128((__m128i*)&dst[i + 48], data);
		}
		auto end = zapi::time::Now();
		med += zapi::time::Milliseconds(start, end);
	}
    std::cout << "SSE2 : " << med / (double)ITS << " ms" <<std::endl;
	pollute(&polluter[0], cachesByteSize);
	
	// Copy with AVX
	med = 0.0;
	const __m256i* avxSrc = (const __m256i*)&src[0];
	__m256i* avxDst = (__m256i*)&dst[0];
	for (size it = 0; it < ITS; it++)
	{
		auto start = zapi::time::Now();
		volatile size s = srcByteSize / 128;
		for (size i = 0; i < s; i += 4)
		{
			auto data = _mm256_load_si256(&avxSrc[i]);
			_mm256_store_si256(&avxDst[i], data);
			data = _mm256_load_si256(&avxSrc[i + 1]);
			_mm256_store_si256(&avxDst[i + 1], data);
			data = _mm256_load_si256(&avxSrc[i + 2]);
			_mm256_store_si256(&avxDst[i + 2], data);
			data = _mm256_load_si256(&avxSrc[i + 3]);
			_mm256_store_si256(&avxDst[i + 3], data);
		}
		auto end = zapi::time::Now();
		med += zapi::time::Milliseconds(start, end);
	}
    std::cout << "AVX : " << med / (double)ITS << " ms" <<std::endl;
	pollute(&polluter[0], cachesByteSize);
}*/

std::string zapi::codec::ResultToString(const zapi::codec::Result& result)
{
	switch (result)
	{
		case Result::ERROR_SMALL_INPUT:
			return "Error: small input buffer";
		case Result::ERROR_SMALL_DESTINATION:
			return "Error: small destination buffer";
		case Result::ERROR_DESTINATION_OVERFLOW:
			return "Error: destination buffer overflow";
		case Result::SUCCESS:
			return "Success";
		default:
			return "None";
	}
}

zapi::storage::MemAlloc<zapi::codec::State> zapi::codec::CreateState(
	const zapi::codec::Type codec,
	const zapi::u8* const srcData,
	const size srcByteSize,
	const size maxDstByteSize,
	const boolean debugOutput
)
{
	size hashTableByteSize = 65536 * 4;
	size hashTableSize = 65536;
	if ((codec & Type::XLZ) == Type::XLZ)
	{
		hashTableByteSize = 65536 * 8;
		hashTableSize = 65536;
	}
	
	size cacheLineSize = zapi::utils::GetCacheLineSize();
	zapi::storage::MemAlloc<State> state = zapi::storage::Allocate<State>(sizeof(State), cacheLineSize, TRUE);
	State* stateMem = state.mem;
	stateMem->codec = codec;
	stateMem->srcData = (u8*)srcData;
	stateMem->dstData = zapi::storage::Allocate<u8>(maxDstByteSize, 0, FALSE);
	stateMem->srcByteSize = srcByteSize;
	stateMem->dstByteSize = 0;
	stateMem->dstMaxByteSize = maxDstByteSize;
	stateMem->hashTable = zapi::storage::Allocate<u32>(hashTableByteSize, cacheLineSize, TRUE);
	stateMem->hashTableByteSize = hashTableByteSize;
	stateMem->hashTableSize = hashTableSize;
	stateMem->debugOutput = debugOutput;
	
	return state;
}

void zapi::codec::DestroyState(zapi::storage::MemAlloc<zapi::codec::State>& state)
{
	State* stateMem = state.mem;
	zapi::storage::Deallocate(stateMem->dstData);
	zapi::storage::Deallocate(stateMem->hashTable);
}

zapi::codec::Result zapi::codec::Codec(zapi::storage::MemAlloc<State>& state)
{
	// Extract state data
	Type codec = state.mem->codec;
	u8* src = (u8*)state.mem->srcData;
    u8* dst = (u8*)state.mem->dstData.mem;
	size srcByteSize = state.mem->srcByteSize;
	size dstMaxByteSize = state.mem->dstMaxByteSize;
	size hashTableByteSize = state.mem->hashTableByteSize;
	size hashTableSize = state.mem->hashTableSize;
	size hashTableMask = hashTableSize - 1ull;
	u32* hashTable = state.mem->hashTable.mem;
	boolean debugOutput = state.mem->debugOutput;
	
	// Choose coder
	if (codec & Type::ZAP_FAST && codec & Type::ENCODE)
	{
		// Zap encoder
		
		// Constants
		constexpr size blockByteSize = 32;
		constexpr size wordCountPerBlock = blockByteSize / 4;
		constexpr size dstBufferMinByteSize = 38;
		
		// Checks
		if (srcByteSize < blockByteSize)
			return Result::ERROR_SMALL_INPUT;
		if (dstMaxByteSize < dstBufferMinByteSize)
			return Result::ERROR_SMALL_DESTINATION;
		
		// Initialize
		const u8* src8 = (const u8*)src;
		const u8* const lastSrc8 = (const u8* const)(src8 + srcByteSize);
		u8* dst8 = dst;
		for (size i = 0; i < hashTableSize; i++)
			hashTable[i] = 0;
		u32* const controlCountPos = (u32* const)dst8;
		dst8 += 4;
		u8* const controlLast = (u8* const)dst8++;
		u8* controlPos = dst8++;
		u32 controlCount = 0;
		
		// Time recording
		auto start_1 = zapi::time::Now();
		
		// Loop
		for (;;)
		{
			// Check for loop exit
			size scrBytesLeft = lastSrc8 - src8;
			if (scrBytesLeft < blockByteSize)
			{
				*controlLast = scrBytesLeft;
				memcpy(dst8, src8, scrBytesLeft);
				dst8 += scrBytesLeft;
				break;
			}
			
			// Check for destination buffer overflow
			size dstBytesLeft = dst8 - dst;
			if (dstBytesLeft >= dstMaxByteSize)
				return Result::ERROR_DESTINATION_OVERFLOW;
			
			// Get 32-byte block
			const dword* const block = (const dword* const)src8;
			src8 += blockByteSize;
			
			// Encoding
			size control = 0;
			size controlBitSize = 0;
			for (size j = 0; j < wordCountPerBlock; j += 2)
			{
				// Extract two 4-byte words and hash it
				const dword bytes1 = block[j];
				const qword hash1 = ((bytes1 * 0x9e3779b9ull) >> 32ull) & hashTableMask;
				const dword hashTableBytes1 = hashTable[hash1];
				hashTable[hash1] = bytes1;
				const dword bytes2 = block[j + 1];
				const qword hash2 = ((bytes2 * 0x9e3779b9ull) >> 32ull) & hashTableMask;
				const dword hashTableBytes2 = hashTable[hash2];
				hashTable[hash2] = bytes2;
				
				// Output
				if (bytes1 == hashTableBytes1) {
					control |= 1 << controlBitSize++;
					((u16*)dst8)[0] = hash1;
					dst8 += 2;
				} else {
					controlBitSize++;
					((dword*)dst8)[0] = bytes1;
					dst8 += 4;
				}
				if (bytes2 == hashTableBytes2) {
					control |= 1 << controlBitSize++;
					((u16*)dst8)[0] = hash2;
					dst8 += 2;
				} else {
					controlBitSize++;
					((dword*)dst8)[0] = bytes2;
					dst8 += 4;
				}
			}
			
			// Finish control output
			*controlPos = control;
			controlPos = dst8++;
			controlCount++;
		}
		
		// Time recording
		auto end_1 = zapi::time::Now();
		
		// Write control count for decoding
		*controlCountPos = controlCount;
		
		// Output to codec state
		state.mem->dstByteSize = dst8 - dst;
		
		// Debug console output
		if (debugOutput == TRUE)
		{
			zapi::io::Print("Codec: " + std::to_string((size)state.mem->codec), TRUE);
			zapi::io::Print("Encoded " + std::to_string(state.mem->srcByteSize) + " to " + std::to_string(state.mem->dstByteSize) + " bytes", TRUE);
			zapi::io::Print("Ratio: " + std::to_string((float)state.mem->srcByteSize / (float)state.mem->dstByteSize), TRUE);
			zapi::io::Print("Time: " + std::to_string(zapi::time::Milliseconds(start_1, end_1)) + " ms", TRUE);
		}
	}
	else if (codec & Type::ZAP_FAST && codec & Type::DECODE)
	{
		// Zap decoder
		
		// Initialize
		const u8* src8 = (const u8*)src;
		const u8* const lastSrc8 = (const u8* const)(src8 + srcByteSize);
		dword* dst32 = (dword*)dst;
		for (size i = 0; i < hashTableSize; i++)
			hashTable[i] = 0;
		u32 controlCount = ((u32*)src8)[0];
		src8 += 4;
		u8 controlLast = *src8++;
		const u8* controlPos = src8++;
		
		// Time recording
		auto start_1 = zapi::time::Now();
		
		// Loop
		for (;;)
		{
			// Check for boundary
			if (controlCount == 0)
				break;
			
			// Decoding
			const u8 control = *controlPos;
			for (size i = 0; i < 8; i++)
			{
				qword bit = (control >> i) & 1;
				
				if (!bit)
				{
					dword bytes = ((dword*)src8)[0];
					src8 += 4;
					*dst32++ = bytes;
					
					const qword hash = ((bytes * 0x9e3779b9ull) >> 32ull) & hashTableMask;
					hashTable[hash] = bytes;
				}
				else if (bit)
				{
					dword hash = ((u16*)src8)[0];
					src8 += 2;
					*dst32++ = hashTable[hash];
				}
			}
			
			// Finish control output
			controlPos = src8++;
			controlCount--;
		}
		
		// Time recording
		auto end_1 = zapi::time::Now();
		
		// Emit last bytes
		size srcBytesLeft = controlLast;
		memcpy(dst32, src8, srcBytesLeft);
		
		// Output to codec state
		state.mem->dstByteSize = ((size)dst32 - (size)dst) + srcBytesLeft;
		
		// Debug console output
		if (debugOutput == TRUE)
		{
			zapi::io::Print("Codec: " + std::to_string((dword)state.mem->codec), TRUE);
			zapi::io::Print("Encoded " + std::to_string(state.mem->srcByteSize) + " to " + std::to_string(state.mem->dstByteSize) + " bytes", TRUE);
			zapi::io::Print("Ratio: " + std::to_string((float)state.mem->srcByteSize / (float)state.mem->dstByteSize), TRUE);
			zapi::io::Print("Time: " + std::to_string(zapi::time::Milliseconds(start_1, end_1)) + " ms", TRUE);
		}
	}
	else if (codec & Type::XLZ && codec & Type::ENCODE)
	{
		// XLZ encoder
		
		// Initialize
		const u8* src8 = (const u8*)src;
		const u8* const lastSrc8 = (const u8* const)(src8 + srcByteSize);
		u8* dst8 = (u8*)dst;
		const u8** hashTable64 = (const u8**)hashTable;
		for (size i = 0; i < hashTableSize; i++)
			hashTable64[i] = src8;
		
		// First is always literal
		*dst8++ = *src8++;
		
		// Checks
		if (srcByteSize < 5)
			return Result::ERROR_SMALL_INPUT;

		// Pointer to literals
		const u8* literals = src8;

		// Time recording
		auto start_1 = zapi::time::Now();
	
		// Loop
		for (;;)
		{
			// Hashing
			qword hash = (((qword)(*(dword*)src8) * 0x9e3779b9ull) >> 32ull) & hashTableMask;
			while ((size)(src8 - hashTable64[hash]) > 1048575 || *(dword*)src8 != *(dword*)hashTable64[hash])
			{
				hashTable64[hash] = src8++;
				hash = (((qword)(*(dword*)src8) * 0x9e3779b9ull) >> 32ull) & hashTableMask;
				if (src8 >= lastSrc8)
					break;
			}
			
			// Prevent overflow
			if (src8 >= lastSrc8)
				break;
			
			// Match found
			const u8* match = (const u8*)hashTable64[hash];
			hashTable64[hash] = src8;

			// Output literals
			size literalCount = src8 - literals;
			if (literalCount) 
			{
				while (literalCount > 30)
				{
					*dst8++ = 255;
					memcpy(dst8, literals, 31);
					dst8 += 31;
					literals += 31;
					literalCount -= 31;
				}
				if (literalCount)
				{
					*dst8++ = literalCount | 0xe0;
					memcpy(dst8, literals, literalCount);
					dst8 += literalCount;
					literals += literalCount;
				}
			}

			// Hashing
			qword hash1 = (((qword)(*(dword*)(src8 + 1)) * 0x9e3779b9ull) >> 32ull) & hashTableMask;
			qword hash2 = (((qword)(*(dword*)(src8 + 2)) * 0x9e3779b9ull) >> 32ull) & hashTableMask;
			qword hash3 = (((qword)(*(dword*)(src8 + 3)) * 0x9e3779b9ull) >> 32ull) & hashTableMask;
			hashTable64[hash1] = src8 + 1;
			hashTable64[hash2] = src8 + 2;
			hashTable64[hash3] = src8 + 3;

			// Search for longer match
			size dist = src8 - match;
			size matchByteSize = 4;
			while (src8[matchByteSize] == match[matchByteSize] && src8 + matchByteSize < lastSrc8 && ++matchByteSize < 265);
			src8 += matchByteSize;
			literals = src8;
			
			// Output
			qword x = dist > 4095;
			if (matchByteSize > 9)
			{
				*dst8++ = 0xc0 | (x << 4) | (dist & 0xf);
				*dst8++ = matchByteSize - 10;
				*dst8++ = dist >> 4;
				*dst8 = dist >> 12;
				dst8 += x;
			}
			else
			{
				*dst8++ = ((matchByteSize - 4) << 5) | (x << 4) | (dist & 0xf);
				*dst8++ = dist >> 4;
				*dst8 = dist >> 12;
				dst8 += x;
			}
		}
		
		// Time recording
		auto end_1 = zapi::time::Now();

		// Output pending literals
		size literalCount = lastSrc8 - literals;
		if (literalCount)
		{
			while (literalCount > 30)
			{
				*dst8++ = 0xff;
				memcpy(dst8, literals, 31);
				dst8 += 31;
				literals += 31;
				literalCount -= 31;
			}
			if (literalCount)
			{
				*dst8++ = literalCount | 0xe0;
				memcpy(dst8, literals, literalCount);
				dst8 += literalCount;
				literals += literalCount;
			}
		}

		// Output to codec state
		state.mem->dstByteSize = dst8 - dst;
		
		// Debug console output
		if (debugOutput == TRUE)
		{
			zapi::io::Print("Codec: " + std::to_string((dword)state.mem->codec), TRUE);
			zapi::io::Print("Encoded " + std::to_string(state.mem->srcByteSize) + " to " + std::to_string(state.mem->dstByteSize) + " bytes", TRUE);
			zapi::io::Print("Ratio: " + std::to_string((float)state.mem->srcByteSize / (float)state.mem->dstByteSize), TRUE);
			zapi::io::Print("Time: " + std::to_string(zapi::time::Milliseconds(start_1, end_1)) + " ms", TRUE);
		}
	}
	else if (codec & Type::XLZ && codec & Type::DECODE)
	{
		// XLZ decoder
		
		// Initialize
		const u8* src8 = (const u8*)src;
		const u8* const lastSrc8 = (const u8* const)(src8 + srcByteSize);
		u8* dst8 = (u8*)dst;
		
		// First is always literal
		*dst8++ = *src8++;

		// Get token
		qword token = *src8++;

		// Time recording
		auto start_1 = zapi::time::Now();

		// Loop
		while (src8 < lastSrc8)
		{
			// Literals
			while (token == 255)
			{
				memcpy(dst8, src8, 31);
				dst8 += 31;
				src8 += 31;
				token = *src8++;
			}
			
			// Match or literals
			if ((token >> 5) == 0x7)
			{
				// Literals
				size pending = token & 0x1f;
				memcpy(dst8, src8, pending);
				dst8 += pending;
				src8 += pending;
				token = *src8++;
			}
			else
			{
				// Match
				qword x = (token >> 4) & 1;
				size offset = token & 0xf;
				size matchByteSize = token >> 5;
				
				if (matchByteSize == 6)
					matchByteSize += *src8++;
				
				matchByteSize += 4;
				
				if (x)
				{
					qword hi, lo;
					hi = *src8++;
					lo = *src8++;
					offset |= (hi << 4) | (lo << 12);
				}
				else
				{
					offset |= (*src8++ << 4);
				}
				
				const u8* ptr = dst8 - offset;
				while (matchByteSize--)
					*dst8++ = *ptr++;
				
				token = *src8++;
			}
		}
		
		// Time recording
		auto end_1 = zapi::time::Now();
		
		// Output to codec state
		state.mem->dstByteSize = dst8 - dst;
		
		// Debug console output
		if (debugOutput == TRUE)
		{
			zapi::io::Print("Codec: " + std::to_string((dword)state.mem->codec), TRUE);
			zapi::io::Print("Decoded " + std::to_string(state.mem->srcByteSize) + " to " + std::to_string(state.mem->dstByteSize) + " bytes", TRUE);
			zapi::io::Print("Ratio: " + std::to_string((float)state.mem->srcByteSize / (float)state.mem->dstByteSize), TRUE);
			zapi::io::Print("Time: " + std::to_string(zapi::time::Milliseconds(start_1, end_1)) + " ms", TRUE);
		}
	}
	else if (codec & Type::RC && codec & Type::ENCODE)
	{
		// Time recording
		auto start_1 = zapi::time::Now();
		
		rc::RangeCodec rc(&state);
		
		// Time recording
		auto end_1 = zapi::time::Now();
		
		// Debug console output
		if (debugOutput == TRUE)
		{
			zapi::io::Print("Codec: " + std::to_string((dword)state.mem->codec), TRUE);
			zapi::io::Print("Encoded " + std::to_string(state.mem->srcByteSize) + " to " + std::to_string(state.mem->dstByteSize) + " bytes", TRUE);
			zapi::io::Print("Ratio: " + std::to_string((float)state.mem->srcByteSize / (float)state.mem->dstByteSize), TRUE);
			zapi::io::Print("Time: " + std::to_string(zapi::time::Milliseconds(start_1, end_1)) + " ms", TRUE);
		}
	}
	else if (codec & Type::RC && codec & Type::DECODE)
	{
		// Time recording
		auto start_1 = zapi::time::Now();
		
		rc::RangeCodec rc(&state);
		
		// Time recording
		auto end_1 = zapi::time::Now();
		
		// Debug console output
		if (debugOutput == TRUE)
		{
			zapi::io::Print("Codec: " + std::to_string((dword)state.mem->codec), TRUE);
			zapi::io::Print("Decoded " + std::to_string(state.mem->srcByteSize) + " to " + std::to_string(state.mem->dstByteSize) + " bytes", TRUE);
			zapi::io::Print("Ratio: " + std::to_string((float)state.mem->srcByteSize / (float)state.mem->dstByteSize), TRUE);
			zapi::io::Print("Time: " + std::to_string(zapi::time::Milliseconds(start_1, end_1)) + " ms", TRUE);
		}
	}
	else if (codec & Type::EXPERIMENT && codec & Type::ENCODE)
	{
		// EXPERIMENT
		
		// Initialize
		const u8* src8 = (const u8*)src;
		const u8* const lastSrc8 = (const u8* const)(src8 + srcByteSize);
		u8* dst8 = (u8*)dst;
		dst8++[0] = src8++[0];
		
		dword ht[65536] = {};
		
		// Time recording
		auto start_1 = zapi::time::Now();
		
		// Loop
		size literalCounter = 0;
		const u8* literalPtr = src8;
		for (; src8 < lastSrc8;)
		{
			const dword word = *(dword*)src8;
			const u16 hash = ((qword)(((dword*)src8)[0]) * 0x9e3779b9ull) >> 32ull;
			const size offset = ht[hash];
			ht[hash] = src8 - src;
			const u8* htPtr = src + offset;
			const size distance = src8 - htPtr;
			
			if (distance < 65536 && word == ((dword*)htPtr)[0])
			{
				if (literalCounter != 0)
				{
					if (literalCounter < 14)
					{
						dst8++[0] = 0;
					}
					else
					{
						((dword*)dst8)[0] = 0;
						dst8 += 4;
					}
					memcpy(dst8, literalPtr, literalCounter);
					dst8 += literalCounter;
					literalCounter = 0;
				}
				
				src8 += 4;
				htPtr += 4;
				size matchByteSize = 4;
				while (*src8++ == *htPtr++ && matchByteSize++ < 15);
				
				*dst8++ = hash;
				dst8 += 2;
				literalPtr = src8;
			}
			else
			{
				literalCounter++;
				src8++;
			}
		}
		
		// Time recording
		auto end_1 = zapi::time::Now();
		
		// Output to codec state
		state.mem->dstByteSize = dst8 - dst;
		
		// Debug console output
		if (debugOutput == TRUE)
		{
			zapi::io::Print("Codec: " + std::to_string((dword)state.mem->codec), TRUE);
			zapi::io::Print("Encoded " + std::to_string(state.mem->srcByteSize) + " to " + std::to_string(state.mem->dstByteSize) + " bytes", TRUE);
			zapi::io::Print("Ratio: " + std::to_string((float)state.mem->srcByteSize / (float)state.mem->dstByteSize), TRUE);
			zapi::io::Print("Time: " + std::to_string(zapi::time::Milliseconds(start_1, end_1)) + " ms", TRUE);
		}
	}
	
	return Result::SUCCESS;
}

zapi::codec::rc::RangeCodec::RangeCodec(storage::MemAlloc<State>* const state)
{
	_pState = state->mem;
	
	// Checks
	if (_pState->srcByteSize >= 1ull << 32ull)
	{
		if (_pState->debugOutput == TRUE)
			io::Print("Range codec input size must not exceed 32 bits!", TRUE);
		
		return;
	}
	
	// Initialize
	const u8* src = (const u8*)_pState->srcData;
	const size srcByteSize = _pState->srcByteSize;
	const u8* const lastSrc = (const u8* const)(src + srcByteSize);
	const u8* const dst = (const u8* const)_pState->dstData.mem;
	const u8* src8 = src;
	u8* dst8 = (u8*)dst;
	
	constexpr size TOP = 1 << 24;
	constexpr size BOT = 1 << 16;
	constexpr size MASK32 = 0xFFFFFFFF;
	constexpr size K_BLOCK_SIZE = (1 << 16) - 1;
	const size symbolsByteSize = sizeof(Symbol) * 257;
	
	if ((_pState->codec & Type::ENCODE) != Type::NONE)
	{
		const size blockCount = srcByteSize / K_BLOCK_SIZE;
		const size bytesLeft = srcByteSize - (blockCount * K_BLOCK_SIZE);
		const size extraBlock = bytesLeft > 0 ? 1 : 0;
		
		((size*)dst8)[0] = blockCount;
		dst8 += 8;
		((size*)dst8)[0] = extraBlock;
		dst8 += 8;
		
		for (size b = 0; b < blockCount + extraBlock; b++)
		{
			const size bps = b == blockCount ? blockCount * K_BLOCK_SIZE : b * K_BLOCK_SIZE;
			const size bpe = b == blockCount ? srcByteSize : bps + K_BLOCK_SIZE;
			
			ClearBitBuffer();
			
			// Zero table
			_totalFrequency = 0;
			memset(&_symbols[0], 0, symbolsByteSize);
			_symbols[256].frequency = 1; // EOF
			_totalFrequency++;
			
			// Collect frequencies
			for (size i = bps; i < bpe; i++)
			{
				u8 symbol = src[i];
				_symbols[symbol].code = symbol;
				_symbols[symbol].frequency++;
				_totalFrequency++;
			}
			
			// Make ranges
			size cumFrequency = 0;
			for (size i = 0; i < 257; i++)
			{
				_symbols[i].cumFrequency = cumFrequency;
				cumFrequency += _symbols[i].frequency;
			}
			
			// Write metadata
			((size*)dst8)[0] = _totalFrequency;
			dst8 += 8;
			size* const compressedByteSize = (size* const)&dst8[0];
			dst8 += 8;
			memcpy(&dst8[0], &_symbols[0], symbolsByteSize);
			dst8 += symbolsByteSize;
			
			// Encoding
			size low = 0;
			size high = MASK32 + 1;
			size range = MASK32 + 1;
			size underflowBitCount = 0;
			u8 buffer = 0;
			size carry = 0;
			boolean start = TRUE;
			
			//std::cout << "src count " << (bpe + 1) - bps << std::endl;
			
			u8* const dstBeforeEncoding = dst8;
			
			for (size i = bps; i < bpe + 1; i++)
			{
				const u16 symbol = i == bpe ? 256 : src[i];
				
				const size step = range / _totalFrequency;
				
				low += step * _symbols[symbol].cumFrequency;
				range = step * (size)_symbols[symbol].frequency;
				//high = low + step * (_symbols[symbol].cumFrequency + (size)_symbols[symbol].frequency);
				//const size lowbefore = low;
				//const size rangebefore = range;
				//low   = low + ((range * _symbols[symbol].cumFrequency) / _totalFrequency);
				//range = (range * (size)_symbols[symbol].frequency) / _totalFrequency;
				//if (low > MASK32 || range > MASK32)
				//	std::cout << "overflow " << "lowbefore: " << lowbefore << " low: " << low << " rangebefore: " << rangebefore << " cumfreq: " << _symbols[symbol].cumFrequency << " freq: " << _symbols[symbol].frequency << " totfreq: " << _totalFrequency  << std::endl;
				//std::cout << "sym: " << (char)symbol << " low: " << low << " range: " << range << " cumfreq: " << _symbols[symbol].cumFrequency << std::endl;
				//std::cout << (char)symbol << " " << (size)symbol << std::endl;
				
				// Renormalize
				while ((low ^ low+range)<TOP || range<BOT && ((range= -low & BOT-1),1))
				{
					if (dst8 - dst < _pState->dstMaxByteSize)
						*dst8++ = low >> 24;
					low = (low << 8) & MASK32;
					range = (range << 8) & MASK32;
				}
				/*while (range < BOT)
				{
					if (dst8 - dst < _pState->dstMaxByteSize)
						*dst8++ = low >> 24;
					range = (((~low) & (BOT - 1)) << 8) & MASK32;
					//range = (range << 8) & MASK32;
					low = (low << 8) & MASK32;
				}*/
				
				/*const size range2 = high - low + 1;
				low  = low + ((range2 * _symbols[symbol].cumFrequency) / _totalFrequency);
				high = low + ((range2 * (size)_symbols[symbol].frequency) / _totalFrequency) - 1;
				
				std::cout << low << " " << high << " " << high - low << std::endl;
				
				for (;;)
				{
					if (((high ^ low) >> 31) == 0) // Same MSB
					{
						PutBits(&dst8, low >> 31, underflowBitCount);
						//low -= 1 << 31;
						//high -= 1 << 31;
						low = (low << 1) & MASK32;
						high = (high << 1) & MASK32;
						high |= 1;
					}
					else if ((high >> 30) == 2 && (low >> 30) == 1) // Underflow
					{
						std::cout << "underflow" << std::endl;
						underflowBitCount++;
						//low -= 1 << 30;
						//high -= 1 << 30;
						low = (low << 1) & MASK32;
						high = (high << 1) & MASK32;
					}
					else break;
				}*/
			}
			
			*dst8++ = low >> 24;
			*dst8++ = low >> 16;
			*dst8++ = low >> 8;
			*dst8++ = low;
			
			*compressedByteSize = dst8 - dstBeforeEncoding;
			//std::cout << "compressed byte size " << *compressedByteSize << std::endl;
			
			//FlushBits(&dst8, low, underflowBitCount);
		}
		
		_pState->dstByteSize = dst8 - dst;
	}
	else if ((_pState->codec & Type::DECODE) != Type::NONE)
	{
		size blockCount = ((size*)src8)[0];
		src8 += 8;
		size extraBlock = ((size*)src8)[0];
		src8 += 8;
		
		for (size b = 0; b < blockCount + extraBlock; b++)
		{
			ClearBitBuffer();
			
			// Read table
			_totalFrequency = ((size*)src8)[0];
			src8 += 8;
			const size compressedByteSize = ((size*)src8)[0];
			src8 += 8;
			memcpy(&_symbols[0], &src8[0], symbolsByteSize);
			src8 += symbolsByteSize;
			
			//std::cout << "block id " << b << std::endl;
			//std::cout << "tot " << _totalFrequency << std::endl;
			//std::cout << "compressed byte size " << compressedByteSize << std::endl;
			
			const u8* srcBeforeDecoding = src8;
			
			// Read first 4 bytes
			size code = 0;
			code = (code << 8) | *src8++;
			code = (code << 8) | *src8++;
			code = (code << 8) | *src8++;
			code = (code << 8) | *src8++;
			/*int bit = 0;
			for (size i = 0; i < 32; i++)
			{
				bit = GetBit(&src8, lastSrc);
				code |= bit << i;
			}*/
			//std::cout << "code " << code << std::endl;
			
			// Decoding
			size low = 0;
			size high = MASK32 + 1;
			size range = MASK32 + 1;
			size underflowBitCount = 0;
			u8* p = dst8;
			for (;;)
			{
				const size step = range / _totalFrequency;
				//std::cout << "low range " << low << " " << range << std::endl;
				//if (step == 0)
				//	std::cout << "zero " << range << " " << _totalFrequency << std::endl;
				
				//const size count = (code - low) / step;
				//const size range2 = high - low + 1;
				
				//std::cout << " low: " << low << " range: " << range << " code: " << code << " count: " << (code - low) / (range / _totalFrequency) << std::endl;
				
				//const size count = ((code - low) * _totalFrequency) / range;
				const size count = (code - low) / (range / _totalFrequency);
				
				// Find symbol
				u16 symbol = 0;
				for (size j = 0; j < 257; j++)
				{
					if (count >= _symbols[j].cumFrequency && count < _symbols[j].cumFrequency + _symbols[j].frequency)
					{
						symbol = j;
						break;
					}
				}
				if (symbol == 256) // EOF
					break;
				
				//freq = 0 count: 29562089861707749 code: 3170973349 low: 3174889472 range: 40928512
				
				if (_symbols[symbol].frequency == 0)
					std::cout << "freq = 0 count: " << count << " code: " << code << " low: " << low << " range: " << range << std::endl;
				
				low += step * _symbols[symbol].cumFrequency;
				range = step * (size)_symbols[symbol].frequency;
				//low   = low + (range * _symbols[symbol].cumFrequency) / _totalFrequency;
				//range = (range * (size)_symbols[symbol].frequency) / _totalFrequency;
				
				// Renormalize
				while ((low ^ low+range)<TOP || range<BOT && ((range= -low & BOT-1),1))
				{
					code = ((code << 8) & MASK32) | *src8++;
					low = (low << 8) & MASK32;
					range = (range << 8) & MASK32;
				}
				/*while (range < BOT)
				{
					code = ((code << 8) & MASK32) | *src8++;
					range = (((~low) & (BOT - 1)) << 8) & MASK32;
					//range = (range << 8) & MASK32;
					low = (low << 8) & MASK32;
				}*/
				
				/*low  = low + ((range2 * _symbols[symbol].cumFrequency) / _totalFrequency);
				high = low + ((range2 * (size)_symbols[symbol].frequency) / _totalFrequency) - 1;
				
				std::cout << (char)symbol << " " << code << " " << low << " " << high << " " << high - low << std::endl;
				
				for (;;)
				{
					if (((high ^ low) >> 31) == 0) // Same MSB
					{
						auto bit = GetBit(&src8, lastSrc);
						if (bit != -1)
						{
							underflowBitCount++;
							while (underflowBitCount--)
								code = ((code << 1) | GetBit(&src8, lastSrc)) & MASK32;
						}
						else
						{
							code = (code << 1) & MASK32;
						}
						low = (low << 1) & MASK32;
						high = (high << 1) & MASK32;
						high |= 1;
					}
					else if ((high >> 30) == 2 && (low >> 30) == 1) // Underflow
					{
						underflowBitCount++;
						low = (low << 1) & MASK32;
						high = (high << 1) & MASK32;
					}
					else break;
				}*/
				
				*dst8++ = symbol;
			}
			//std::cout << "dest count " << dst8 - p + 1 << std::endl;
			
			if (compressedByteSize > 4)
				src8 += 4;
			
			src8 = srcBeforeDecoding + compressedByteSize;
		}
		
		_pState->dstByteSize = dst8 - dst;
	}
}

zapi::codec::rc::RangeCodec::~RangeCodec()
{
}

void zapi::codec::rc::RangeCodec::ClearBitBuffer()
{
	_bitBuffer = 0;
	_bitBufferBitSize = 0;
}

void zapi::codec::rc::RangeCodec::PutBits(u8** const buffer, boolean bit, size& underflowBitCount)
{
	WriteBit(buffer, bit);
	
	boolean invBit = bit ^ 1;
	while (underflowBitCount > 0)
	{
		WriteBit(buffer, bit);
		underflowBitCount--;
	}
}

int zapi::codec::rc::RangeCodec::GetBit(const u8** const buffer, const u8* bufferLast)
{
	if (buffer[0] >= bufferLast)
	{
		if (_bitBufferBitSize == 0)
			return -1;
		
		boolean bit = (_bitBuffer >> (_bitBufferBitSize - 1)) & 1;
		_bitBufferBitSize--;
		
		return bit;
	}
	else
	{
		if (_bitBufferBitSize == 0)
		{
			_bitBuffer = ((dword*)buffer[0])[0];
			buffer[0] += 4;
			_bitBufferBitSize = 32;
		}
		
		boolean bit = (_bitBuffer >> (_bitBufferBitSize - 1)) & 1;
		_bitBufferBitSize--;
		
		return bit;
	}
	
	return -1;
}

void zapi::codec::rc::RangeCodec::FlushBits(u8** const buffer, size state, size& underflowBitCount)
{
	PutBits(buffer, 0, underflowBitCount);
	
	for (size i = 0; i < 32; i++)
	{
		WriteBit(buffer, (state >> (31 - i)) & 1);
	}
}
	

void zapi::codec::rc::RangeCodec::WriteBit(u8** const buffer, boolean bit)
{
	_bitBuffer |= bit << _bitBufferBitSize++;
	std::cout << "bit " << bit << std::endl;
	
	if (_bitBufferBitSize == 32)
	{
		((dword*)buffer[0])[0] = _bitBuffer & 0xFFFFFFFF;
		buffer[0] += 4;
		_bitBuffer >>= 32ull;
		_bitBufferBitSize -= 32;
	}
}

zapi::size zapi::utils::GetCacheLineSize()
{
	int lineSize = 0;
	
#ifdef _MSC_VER
    int cpuInfo[4];
    __cpuid(cpuInfo, 1);
    lineSize = ((cpuInfo[1] >> 8) & 0xFF) * 8;
#else
    unsigned int eax, ebx, ecx, edx;
    __cpuid(1, eax, ebx, ecx, edx);
    lineSize = ((ebx >> 8) & 0xFF) * 8;
#endif

	return (size)lineSize;
}

/*u8* src = (u8*)srcData;
    u8* dst = (u8*)dstData;
	
	size hashTableSize = 65536;
	#define HASH(x) (((x ^ 0xdeadbeefull) * 0x9e3779b9ull) & (hashTableSize - 1ull))
	
	// Initialize hash table
	volatile u32* hashTable_1 = new u32[hashTableSize];
	for (size i = 0; i < hashTableMaxSize; i++)
		hashTable_1[i] = 0;
	
	dstByteSize = 0;
	size accPos = dstByteSize++;
	size accSize = 0;
	const __m256i* src256 = (const __m256i*)&src[0];
	const size src256Size = srcByteSize >> 5ull;
	const u8* src8 = (const u8*)src;
	auto start_1 = zapi::time::Now();
	size i = 0;
	for (;;)
	{
		if (i >= srcByteSize)
			break;
		
		const u8* pBlock = (const u8*)&src8[i];
		
		size acc = 0;
		for (size j = 0; j < 8; j += 2)
		{
			const dword bytes_1 = ((const dword*)pBlock)[j];
			const qword hash_1 = ((bytes_1 * 0xBDD56B29BA6C1579ull) >> 32ull) & (hashTableMaxSize - 1ull);
			const dword hashBytes_1 = hashTable_1[hash_1];
			hashTable_1[hash_1] = bytes_1;
			const dword bytes_2 = ((const dword*)pBlock)[j + 1];
			const qword hash_2 = ((bytes_2 * 0xBDD56B29BA6C1579ull) >> 32ull) & (hashTableMaxSize - 1ull);
			const dword hashBytes_2 = hashTable_1[hash_2];
			hashTable_1[hash_2] = bytes_2;
			
			if (bytes_1 == hashBytes_1) {
				acc |= 1 << accSize++;
				((u16*)&dst[dstByteSize])[0] = hash_1;
				dstByteSize += 2;
			} else {
				accSize++;
				((dword*)&dst[dstByteSize])[0] = bytes_1;
				dstByteSize += 4;
			}
			if (bytes_2 == hashBytes_2) {
				acc |= 1 << accSize++;
				((u16*)&dst[dstByteSize])[0] = hash_1;
				dstByteSize += 2;
			} else {
				accSize++;
				((dword*)&dst[dstByteSize])[0] = bytes_2;
				dstByteSize += 4;
			}
		}
		dst[accPos] = acc;
		accPos = dstByteSize++;
		
		i += 32;
	}
	auto end_1 = zapi::time::Now();
	std::cout << "Zap default: " << zapi::time::Milliseconds(start_1, end_1) << " ms" <<std::endl;*/