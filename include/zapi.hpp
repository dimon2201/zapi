#pragma once

#include <cstdlib>
#include "zapi_macros.hpp"

namespace zapi
{
    namespace memory
    {
        template <typename T>
        static T* Allocate(const usize byteWidth)
        {
            ZAPI_CHECK(byteWidth == 0, ErrorCode::ERROR)

            return (T*)malloc(byteWidth);
        }

        static result Free(void* memory)
        {
            ZAPI_CHECK(memory == nullptr, ErrorCode::ERROR)

            free(memory);

            return OK;
        }

        static result Copy(uint8* dest, const uint8* src, const usize byteWidth)
        {
            ZAPI_CHECK(((dest == nullptr) || (src == nullptr) || (byteWidth == 0)), ErrorCode::ERROR)

            for (cpuint i = 0; i < byteWidth; ++i) { dest[i] = src[i]; }

            return OK;
        }
    }

    namespace storage
    {
        template <typename T>
        class Buffer
        {
            public:
                result Init(const void* memory, const usize byteWidth)
                {
                    ZAPI_CHECK(memory == nullptr, ErrorCode::ERROR)

                    _data = memory::Allocate<T>(byteWidth);
                    memory::Copy( _data, memory, byteWidth );

                    return OK;
                }

                result Free()
                {
                    ZAPI_CHECK(_data == nullptr, ErrorCode::ERROR)

                    return memory::Free(_data);
                }

                T* GetData() { return _data; }
            
            private:
                T* _data;
        };
    }

    class State
    {};
};