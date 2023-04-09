#pragma once

namespace zapi
{
    enum ErrorCode
    {
        ERROR = 0,
        NONE = 1
    };

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

    constexpr int OK                                        = 1;
    constexpr int FAIL                                      = 0;
    constexpr int NOTHING                                   = 0;
    constexpr int TRUE                                      = 1;
    constexpr int FALSE                                     = 0;
    #define ZAPI_CHECK(s, err)                              if (s) { ProcessResult(err); }

    #if defined(__ILP32__) || defined(__arm__) || defined(_M_ARM) || defined(__i386__) || defined(_M_IX86) || defined(_X86_)
        // 32-bit architecture
        #define ZAPI_ARCH_32_BIT
        constexpr int ARCH_BIT_SIZE                         = 32;
        constexpr int ARCH_WORD_BYTE_WIDTH                  = 4;
    #elif defined(__amd64__) || defined(_M_AMD64) || defined(_M_X64) || defined(__aarch64__) || defined(__ia64__) || defined(_M_IA64)
        // 64-bit architecture
        #define ZAPI_ARCH_64_BIT
        constexpr int ARCH_BIT_SIZE                         = 64;
        constexpr int ARCH_WORD_BYTE_WIDTH                  = 8;
    #endif

    using sint8                                             = signed char;
    using uint8                                             = unsigned char;
    using sint16                                            = signed short;
    using uint16                                            = unsigned short;
    using sint32                                            = signed int;
    using uint32                                            = unsigned int;
    using sint64                                            = signed long long;
    using uint64                                            = unsigned long long;
    #if defined(ZAPI_ARCH_32_BIT)
        using ssize                                         = sint32;
        using usize                                         = uint32;
        using cpword                                        = uint32;
        using cpsint                                        = sint32;
        using cpuint                                        = uint32;
    #elif defined(ZAPI_ARCH_64_BIT)
        using ssize                                         = sint64;
        using usize                                         = uint64;
        using cpword                                        = uint64;
        using cpsint                                        = sint64;
        using cpuint                                        = uint64;
    #endif
    using word32                                            = uint32;
    using word64                                            = uint64;
    using result                                            = word32;
};

#define ZAPI_IMPORT_TYPES \
    using zapi::sint8;\
    using zapi::uint8;\
    using zapi::sint16;\
    using zapi::uint16;\
    using zapi::sint32;\
    using zapi::uint32;\
    using zapi::sint64;\
    using zapi::uint64;\
    using zapi::ssize;\
    using zapi::usize;\
    using zapi::cpword;\
    using zapi::cpsint;\
    using zapi::cpuint;\
    using zapi::word32;\
    using zapi::word64;\
    using zapi::result;\

constexpr zapi::sint8 operator""_zs8(unsigned long long int val) { return (zapi::sint8)val; }
constexpr zapi::uint8 operator""_zu8(unsigned long long int val) { return (zapi::uint8)val; }
constexpr zapi::sint16 operator""_zs16(unsigned long long int val) { return (zapi::sint16)val; }
constexpr zapi::uint16 operator""_zu16(unsigned long long int val) { return (zapi::uint16)val; }
constexpr zapi::sint32 operator""_zs32(unsigned long long int val) { return (zapi::sint32)val; }
constexpr zapi::uint32 operator""_zu32(unsigned long long int val) { return (zapi::uint32)val; }
constexpr zapi::sint64 operator""_zs64(unsigned long long int val) { return (zapi::sint64)val; }
constexpr zapi::uint64 operator""_zu64(unsigned long long int val) { return (zapi::uint64)val; }
constexpr zapi::ssize operator""_zss(unsigned long long int val) { return (zapi::ssize)val; }
constexpr zapi::usize operator""_zus(unsigned long long int val) { return (zapi::usize)val; }
constexpr zapi::cpword operator""_zcpw(unsigned long long int val) { return (zapi::cpword)val; }
constexpr zapi::cpsint operator""_zcpsi(unsigned long long int val) { return (zapi::cpsint)val; }
constexpr zapi::cpuint operator""_zcpui(unsigned long long int val) { return (zapi::cpuint)val; }
constexpr zapi::word32 operator""_zw32(unsigned long long int val) { return (zapi::word32)val; }
constexpr zapi::word64 operator""_zw64(unsigned long long int val) { return (zapi::word64)val; }
constexpr zapi::result operator""_zr(unsigned long long int val) { return (zapi::result)val; }