#pragma once

#include <iostream>
#include <string>
#include <fstream>
#include <chrono>
#include <cstdint>
#include <cstring>
#include <immintrin.h>
#include <cstdlib>
#include <string>

#ifdef _MSC_VER
#include <intrin.h>
#else
#include <cpuid.h>
#endif

namespace zapi
{
    using u8 = uint8_t;
	using u16 = unsigned short;
	using u32 = uint32_t;
    using dword = u32;
	using qword = uint64_t;
    using size = size_t;
    using boolean = uint32_t;
    using f64 = double;
    using timepoint = std::chrono::high_resolution_clock::time_point;
    constexpr boolean TRUE = 0;
    constexpr boolean FALSE = 0;

    namespace time
    {
        inline timepoint Now()
        {
            return std::chrono::high_resolution_clock::now();
        }

        inline f64 Milliseconds(const timepoint& begin, const timepoint& end)
        {
            return std::chrono::duration_cast<std::chrono::milliseconds>(end - begin).count();
        }
    }

    namespace storage
    {
		template <typename T>
		struct MemAlloc
		{
			T* mem;
			size alignByteSize;
			size byteSize;
		};
		
		template <typename T>
		MemAlloc<T> Allocate(const size byteSize, const size alignByteSize, const boolean fillZeros)
		{
			MemAlloc<T> alloc;
			
			if (byteSize > 0)
			{
				alloc.byteSize = byteSize;
				
				if (alignByteSize == 0)
				{
					alloc.mem = (T*)malloc(alloc.byteSize);
				}
				else
				{
					alloc.alignByteSize = alignByteSize;
					alloc.mem = (T*)_aligned_malloc(alloc.byteSize, alloc.alignByteSize);
				}
				
				if (fillZeros == TRUE)
					memset(alloc.mem, 0, alloc.byteSize);
			}
			
			return alloc;
		}

		template <typename T>
		void Deallocate(MemAlloc<T>& alloc)
		{
			if (alloc.alignByteSize == 0)
				free(alloc.mem);
			else
				_aligned_free(alloc.mem);
		}
    }

    namespace io
    {
        class File
        {

        public:
            explicit File(const std::string& path);
            explicit File(const std::string& path, const void* data, const size byteSize);
            ~File();

            inline zapi::storage::MemAlloc<void> Data() { return _data; }
            inline size ByteSize() { return _byteSize; }
            
        private:
            std::ifstream _inFile;
            std::ofstream _outFile;
            size _byteSize = 0;
            zapi::storage::MemAlloc<void> _data = {};

        };
		
		void Print(const std::string& message, const boolean newLine);
    }

    namespace codec
    {
		enum class Type
		{
			NONE = 0,
			ENCODE = 1,
			DECODE = 2,
			ZAP_FAST = 4,
			XLZ = 8,
			EXPERIMENT = 16
		};
		inline Type operator|(Type lhs, Type rhs) { return (Type)((dword)lhs | (dword)rhs); }
		inline Type operator&(Type lhs, Type rhs) { return (Type)((dword)lhs & (dword)rhs); }
		inline bool operator&&(Type lhs, Type rhs) { return (dword)lhs && (dword)rhs; }
		
		enum class Result
		{
			ERROR_SMALL_INPUT = 0,
			ERROR_SMALL_DESTINATION = 1,
			ERROR_DESTINATION_OVERFLOW = 2,
			SUCCESS = 3
		};
		
		typedef struct State
		{
			Type codec;
			u8* srcData;
			zapi::storage::MemAlloc<u8> dstData;
			size srcByteSize;
			size dstByteSize;
			size dstMaxByteSize;
			zapi::storage::MemAlloc<u32> hashTable;
			size hashTableByteSize;
			size hashTableSize;
			boolean debugOutput;
		} State;
		
		std::string ResultToString(const Result& result);
		zapi::storage::MemAlloc<State> CreateState(
			const Type codec,
			const zapi::u8* const srcData,
			const size srcByteSize,
			const size maxDstByteSize,
			const boolean debugOutput
		);
		void DestroyState(zapi::storage::MemAlloc<State>& state);
		Result Codec(zapi::storage::MemAlloc<State>& state);
    }
	
	namespace utils
	{
		size GetCacheLineSize();
	}
	
	inline uint16_t hash16(uint64_t x) {
		x ^= x >> 33;
		x *= 0xff51afd7ed558ccdULL;
		x ^= x >> 33;
		x *= 0xc4ceb9fe1a85ec53ULL;
		x ^= x >> 33;
		return (uint16_t)(x >> 48);
	}
}