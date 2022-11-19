#include "zapimacros.hpp"
#include <cstdlib>

namespace ZAPI
{
    template <typename T>
    static result MemoryAlloc(const usize byteWidth) {
        ZAPI_ASSERT(byteWidth == 0, ZAPI_FAIL)
        return (T*)malloc(byteWidth);
    }

    static result MemoryFree(void* memory) {
        ZAPI_ASSERT(memory == nullptr, ZAPI_FAIL)
        free(memory);
        return ZAPI_OK;
    }

    static result MemoryCopy(const void* dest, const void* src, const usize byteWidth) {
        ZAPI_ASSERT(((dest == nullptr) || (src == nullptr) || (byteWidth == 0)), ZAPI_FAIL)
        uint8* pDest = (uint8*)dest;
        uint8* pSrc = (uint8*)src;
        for (ucpuint i = 0; i < byteWidth; ++i) { pDest[i] = pSrc[i]; }
        return ZAPI_OK;
    }

    class State
    {
        
    };

    template <typename T>
    class Buffer
    {
        public:
            result Init(const void* memory, const usize byteWidth) {
                if (this->m_Buffer != nullptr) { return ZAPI_FAIL; }
                this->m_Buffer = MemoryAlloc<T>(byteWidth);
                MemoryCopy( this->m_Buffer, memory, byteWidth );
                return ZAPI_OK;
            }

            result Free() {
                if (this->m_Buffer == nullptr) { return ZAPI_FAIL; }
                return MemoryFree(this->m_Buffer);
            }

            T* GetData() { return this->m_Data; }
        
        private:
            T* m_Data;
    };

    class Codec
    {
        ZAPI_XMACRO_DEFINE_STATIC_CLASS(Codec)

        public:
            result Compress(State* zapiState);
    };
};