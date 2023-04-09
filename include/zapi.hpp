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

        static result Copy(const uint8* src, uint8* dest, const usize byteWidth)
        {
            ZAPI_CHECK(((dest == nullptr) || (src == nullptr) || (byteWidth == 0)), ErrorCode::ERROR)

            for (cpuint i = 0; i < byteWidth; ++i) { dest[i] = src[i]; }

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

    namespace codec
    {
        struct CodecResult
        {
            result ReturnedCode;
            usize OutputByteWidth;
        };

        class Codec_Interface
        {
            public:
                virtual void Compress(const uint8* src, uint8* dest, const usize byteWidth, CodecResult* const codecResult) = 0;
                virtual void Decompress(const uint8* src, uint8* dest, const usize byteWidth, CodecResult* const codecResult) = 0;

                cpword GetUniqueType() { return ((cpword*)this)[0]; }
        };

        class Instance
        {
            public:
                explicit Instance() {}
                ~Instance() {}
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