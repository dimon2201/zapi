#pragma once

#include <cstdlib>
#include "zapi_macros.hpp"

namespace zapi
{
    namespace memory
    {
        template <typename GranularType>
        static GranularType* Allocate(const usize byteWidth)
        {
            ZAPI_CHECK(byteWidth == 0, ErrorCode::ERROR)

            return (GranularType*)malloc(byteWidth);
        }

        static result Free(void* memory)
        {
            ZAPI_CHECK(memory == nullptr, ErrorCode::ERROR)

            free(memory);

            return OK;
        }

        static result Copy(const uint8* src, uint8* dst, const usize byteWidth)
        {
            ZAPI_CHECK(((dst == nullptr) || (src == nullptr) || (byteWidth == 0)), ErrorCode::ERROR)

            for (cpuint i = 0; i < byteWidth; ++i) { dst[i] = src[i]; }

            return OK;
        }

        class AllocatedBaseObject
        {
            public:
                explicit AllocatedBaseObject() {}
                ~AllocatedBaseObject() {}

                void* operator new(size_t size) { return Allocate<void>((usize)size); }
                void operator delete(void* ptr) { Free(ptr); }
        };
    }

    namespace storage
    {
        template <typename ElementType>
        class Buffer : public memory::AllocatedBaseObject
        {
            public:
                explicit Buffer(const void* memory, const usize byteWidth)
                {
                    ZAPI_CHECK(memory == nullptr, ErrorCode::ERROR)

                    _data = memory::Allocate<ElementType>(byteWidth);
                    memory::Copy( _data, memory, byteWidth );
                }

                ~Buffer()
                {
                    ZAPI_CHECK(_data == nullptr, ErrorCode::ERROR)
                    
                    memory::Free(_data);
                }

                ElementType* GetData() { return _data; }
            
            private:
                ElementType* _data;
        };
    }

    namespace io
    {
        class BitStream
        {
            public:
                explicit BitStream(const void* const writeAddress, const void* const readAddress)
                {
                    _startWriteAddress = writeAddress;
                    _startReadAddress = readAddress;
                    _writeAddress = (word32*)_startWriteAddress;
                    _readAddress = (word32*)_startReadAddress;
                    _writeWordBitCount = 0_zus;
                    _writeWord = 0_zw64;
                    _readWordBitCount = 0_zus;
                    _readWord = 0_zw64;
                }

                ~BitStream() {}

                void WriteBits(const usize count, const word64 bits)
                {
                    if (_writeWordBitCount >= 32_zus)
                    {
                        _writeAddress[0] = _writeWord & UINT_MAX;
                        _writeAddress += 1;
                        _writeWordBitCount -= 32_zus;
                        _writeWord >>= 32_zw64;
                    }

                    _writeWord |= bits << (word64)_writeWordBitCount;
                    _writeWordBitCount += count;
                }

                void WriteRemainingBits()
                {
                    while (_writeWordBitCount > 0_zus)
                    {
                        _writeAddress[0] = _writeWord & UINT_MAX;
                        _writeAddress += 1;

                        if (_writeWordBitCount <= 32_zus) { break; }

                        _writeWordBitCount -= 32_zus;
                        _writeWord >>= 32_zw64;
                    }
                }

                word64 ReadBits(const usize count)
                {
                    if (_readWordBitCount < 32_zus)
                    {
                        _readWord |= (word64)_readAddress[0] << (word64)_readWordBitCount;
                        _readWordBitCount += 32_zus;
                    }

                    word64 bits = _readWord & ((1_zus << count) - 1_zus);
                    _readWordBitCount -= count;
                    _readWord >>= (word64)count;

                    return bits;
                }

            private:
                const void* _startWriteAddress;
                const void* _startReadAddress;
                word32* _writeAddress;
                word32* _readAddress;
                usize _writeWordBitCount;
                word64 _writeWord;
                usize _readWordBitCount;
                word64 _readWord;
        };
    }

    namespace codec
    {
        class ICodec
        {
            public:
                virtual void Encode(const void* inputData, void* outputData, const usize inputDataByteWidth, const usize outputDataByteWidth, void* codecData) = 0;
                virtual void Decode(const void* inputData, void* outputData, const usize inputDataByteWidth, const usize outputDataByteWidth, void* codecData) = 0;
        };
    }

    namespace debug
    {
        static void ProcessResult(ErrorCode result)
        {
            switch (result)
            {
                case ErrorCode::ERROR :
                {
                    break;
                }
            }
        }
    }
};