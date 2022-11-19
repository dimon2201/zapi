#ifndef _ZAPI_MACROS_H_
#define _ZAPI_MACROS_H_

#define ZAPI_OK                             1
#define ZAPI_FAIL                           0
#define ZAPI_NULL                           0
#define ZAPI_ASSERT(s, error)               if (s) { return error; }

#if defined(__ILP32__) || defined(__arm__) || defined(_M_ARM) || defined(__i386__) || defined(_M_IX86) || defined(_X86_)
    // 32-bit architecture
    #define ZAPI_ARCH_32_BIT
    #define ZAPI_ARCH_BITSIZE               32
    #define ZAPI_ARCH_WORD_BYTE_WIDTH       4
#elif defined(__amd64__) || defined(_M_AMD64) || defined(_M_X64) || defined(__aarch64__) || defined(__ia64__) || defined(_M_IA64)
    // 64-bit architecture
    #define ZAPI_ARCH_64_BIT
    #define ZAPI_ARCH_BITSIZE               64
    #define ZAPI_ARCH_WORD_BYTE_WIDTH       8
#endif

namespace ZAPI
{
    typedef signed char                     iint8;
    typedef unsigned char                   uint8;
    typedef signed short                    iint16;
    typedef unsigned short                  uint16;
    typedef signed int                      iint32;
    typedef unsigned int                    uint32;
    typedef signed long long                iint64;
    typedef unsigned long long              uint64;
    typedef iint64                          isize;
    typedef uint64                          usize;
    #if defined(ZAPI_ARCH_32_BIT)
    typedef iint32                          icpuint;
    typedef uint32                          ucpuint;
    typedef uint32                          cpuword;
    #elif defined(ZAPI_ARCH_64_BIT)
    typedef iint64                          icpuint;
    typedef uint64                          ucpuint;
    typedef uint64                          cpuword;
    #else
    typedef iint32                          icpuint;
    typedef uint32                          ucpuint;
    typedef uint32                          cpuword;
    #endif
    typedef uint32                          word32;
    typedef uint64                          word64;
    typedef word32                          result;
};

#endif