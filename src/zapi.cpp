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
	
	if (codec & Type::ZAP_FAST && codec & Type::ENCODE)
	{
		/* Zap Encoding */
		
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
		/* Zap Decoding */
		
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
		/* XLZ Encoding */
		
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
		/* XLZ Decoding */
		
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
	
	return Result::SUCCESS;
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