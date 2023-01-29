#include <iostream>
#include <emmintrin.h>

#include "xlzr.h"

void Test2(void* srcData)
{
    // State = State + RangeLR[ 0u ] * CurBit;

    // RangeLR[ CurBit ] = (RangeLR[ CurBit ] * 2u) / 3u;
    // RangeLR[ OppBit ] = (RangeLR[ CurBit ] * 1u) / 3u;

    // SSE
    // 1) Symbol   = 
    // 2) RegRange = R0 R0 R0 R0 R0 R0 R0 R0

    // x   7      x   3   1x
    // - * --  =  - * - + --
    // 1   8      1   8   2

    // 15   1   1   1   1
    // -- = - + - + - + --
    // 16   2   4   8   16

    // Encode nibble
    unsigned short testmem[8], testmem2[8], testmem3[8]; // debug
    
    unsigned char Symbol[8] = { 85, 164, 40, 119, 0, 0, 0, 0 };
    unsigned short DefaultRange = 65535;

    // 1) Load in SSE registers
    __m128i State;
    __m128i RegSymbolsMask;
    __m128i RegSymbolsAndMask;
    __m128i RegRangesMaskMul;
    __m128i RegRangesMaskDiv;
    __m128i RegMaskOnes;
    __m128i RegShiftOne;
    __m128i RegShiftTwo;
    __m128i RegShiftThree;
    __m128i RegShiftFour;
    __m128i RegShiftFive;
    __m128i RegUint16Max;
    __m128i RegUint16Half;
    __m128i RegUint16MSB;
    __m128i RegUint15MSB;
    __m128i RegAmortizer;
    __m128i RegAmortizeIf;
    __m128i RegRanges[3];

    State = _mm_set1_epi16( 0 );

    // RegSymbolsMask = _mm_setr_epi16( ((Symbol[0] & 128) >> 7), ((Symbol[1] & 128) >> 7), ((Symbol[2] & 128) >> 7), ((Symbol[3] & 128) >> 7),
    //                                  ((Symbol[4] & 128) >> 7), ((Symbol[5] & 128) >> 7), ((Symbol[6] & 128) >> 7), ((Symbol[7] & 128) >> 7));    
    RegSymbolsMask = _mm_setr_epi16( Symbol[0], Symbol[1], Symbol[2], Symbol[3],
                                     Symbol[4], Symbol[5], Symbol[6], Symbol[7] );
    RegRangesMaskMul = _mm_set1_epi16( 3 );
    RegRangesMaskDiv = _mm_cvtsi32_si128( 3 );
    RegMaskOnes = _mm_set1_epi16( 1 );
    RegShiftOne = _mm_cvtsi32_si128( 1 );
    RegShiftTwo = _mm_cvtsi32_si128( 2 );
    RegShiftThree = _mm_cvtsi32_si128( 3 );
    RegShiftFour = _mm_cvtsi32_si128( 4 );
    RegShiftFive = _mm_cvtsi32_si128( 5 );
    RegUint16Max = _mm_set1_epi16( 65535 );
    RegUint16Half = _mm_set1_epi16( 32767 );
    RegUint16MSB = _mm_set1_epi16( 32768 );
    RegUint15MSB = _mm_set1_epi16( 16384 );
    RegAmortizer = _mm_set1_epi16( 0 );
    RegAmortizeIf = _mm_set1_epi16( 63 );

    RegRanges[ 0 ] = _mm_set1_epi16( 32767 );
    RegRanges[ 1 ] = _mm_set1_epi16( 32767 );
    RegRanges[ 2 ] = _mm_set1_epi16( DefaultRange );

    __m128i BitMaskIsOne = _mm_set1_epi16( 0 );
    __m128i BitMaskIsZero = _mm_set1_epi16( 65535 );

    // Encoding
    for (int i = 0; i < 8; ++i)
    {
        // Range adjustment
        __m128i Ranges0Cpy = _mm_and_si128( RegRanges[ 2 ], RegRanges[ 2 ] );
        __m128i Ranges0 = _mm_xor_si128( RegRanges[ 2 ], RegRanges[ 2 ] ); // zero

        __m128i Ranges0Div_1 = _mm_srli_epi16( Ranges0Cpy, 1 );
        Ranges0Div_1 = _mm_and_si128( BitMaskIsZero, Ranges0Div_1 );
        Ranges0 = _mm_adds_epu16( Ranges0, Ranges0Div_1 );

        __m128i Ranges0Div_3 = _mm_srli_epi16( Ranges0Cpy, 2 );
        Ranges0 = _mm_adds_epu16( Ranges0, Ranges0Div_3 );

        // __m128i Ranges0Div_4 = _mm_srli_epi16( Ranges0Cpy, 3 );
        // Ranges0 = _mm_adds_epu16( Ranges0, Ranges0Div_4 );

        // __m128i Ranges0Div_5 = _mm_srli_epi16( Ranges0Cpy, 4 );
        // Ranges0 = _mm_adds_epu16( Ranges0, Ranges0Div_5 );

        // Ranges0Div_1 = _mm_srl_epi16( Ranges0Cpy, RegShiftOne ); // amortize
        // Ranges0Div_1 = _mm_and_si128( Ranges0Div_1, RegAmortizerCpy );
        // Ranges0 = _mm_adds_epu16( Ranges0, Ranges0Div_1 );

        // Masking
        __m128i Num = _mm_set1_epi16( 1 << i );
        __m128i NumI = _mm_cvtsi32_si128( i );
        BitMaskIsOne = _mm_and_si128( RegSymbolsMask, Num );
        // RegAmortizer = _mm_or_si128( BitMask, RegAmortizer );
        BitMaskIsOne = _mm_srl_epi16( BitMaskIsOne, NumI );
        BitMaskIsOne = _mm_mullo_epi16( BitMaskIsOne, RegUint16Max );
        BitMaskIsZero = _mm_xor_si128( BitMaskIsOne, RegUint16Max );
        
        RegRanges[ 0 ] = _mm_and_si128( Ranges0, Ranges0 );
        RegRanges[ 1 ] = _mm_subs_epu16( RegRanges[ 2 ], RegRanges[ 0 ] );
        Ranges0 = _mm_and_si128( BitMaskIsZero, RegRanges[ 0 ] );
        __m128i Ranges1 = _mm_and_si128( BitMaskIsOne, RegRanges[ 1 ] );
        RegRanges[ 2 ] = _mm_adds_epu16( Ranges0, Ranges1 );

        _mm_storeu_si128( (__m128i*)testmem, RegRanges[ 0 ] ); // debug
        std::cout << "Ranges 0 :   "  << testmem[0] << ";\t " << testmem[1] << ";\t " << testmem[2] << ";\t " << testmem[3] << ";\t " << testmem[4] << ";\t " << testmem[5] << ";\t " << testmem[6] << ";\t " << testmem[7] << ";\t " << std::endl;
        _mm_storeu_si128( (__m128i*)testmem, RegRanges[ 1 ] ); // debug
        std::cout << "Ranges 1 :   "  << testmem[0] << ";\t " << testmem[1] << ";\t " << testmem[2] << ";\t " << testmem[3] << ";\t " << testmem[4] << ";\t " << testmem[5] << ";\t " << testmem[6] << ";\t " << testmem[7] << ";\t " << std::endl;
        _mm_storeu_si128( (__m128i*)testmem, State ); // debug
        std::cout << "State    :   "  << testmem[0] << ";\t " << testmem[1] << ";\t " << testmem[2] << ";\t " << testmem[3] << ";\t " << testmem[4] << ";\t " << testmem[5] << ";\t " << testmem[6] << ";\t " << testmem[7] << ";\t " << std::endl;
    
        // State summation
        __m128i StateWith = _mm_and_si128( BitMaskIsOne, RegRanges[ 0 ] );
        State = _mm_add_epi16( State, StateWith );
        // State = _mm_add_epi16( State, RegMaskOnes );
        // State = _mm_add_epi16( State, RegMaskOnes );
    }

    _mm_storeu_si128( (__m128i*)testmem, RegRanges[2] ); // debug
    std::cout << "Range2   :   " << testmem[0] << "; " << testmem[1] << "; " << testmem[2] << "; " << testmem[3] << "; "
                                 << testmem[4] << "; " << testmem[5] << "; " << testmem[6] << "; " << testmem[7] << "; "
    << std::endl;

    // Increase ranges
    int i = 0;
    unsigned short bit_buffer_cnt[8] = { 0 };
    unsigned long long bit_buffer[8] = { 0 };
    unsigned long long temp_mem[2] = { 0 };
    RegRanges[ 2 ] = _mm_or_si128( RegRanges[ 2 ], RegMaskOnes );
    
    __m128i OutputBitCounts = _mm_set1_epi16( 0 );
    for (;;)
    {
        __m128i MSBits = _mm_and_si128( RegUint16MSB, RegRanges[ 2 ] );
        __m128i MSBCheck = _mm_cmpeq_epi16( MSBits, RegUint16MSB );
        __m128i InvMSBCheck = _mm_xor_si128( MSBCheck, RegUint16Max );
        __m128i ShiftMask = _mm_and_si128( InvMSBCheck, RegUint16Half );

        __m128i InvMSBits = _mm_xor_si128( MSBits, RegUint16MSB );
        InvMSBits = _mm_srli_epi16( InvMSBits, 15 );
        OutputBitCounts = _mm_add_epi16( OutputBitCounts, InvMSBits );

        _mm_storeu_si128( (__m128i*)temp_mem, MSBCheck );
        if (temp_mem[ 0 ] == 0xffffffffffffffff && temp_mem[ 1 ] == 0xffffffffffffffff)
        {
            break;
        }
        
        __m128i RangesCpy = _mm_and_si128( RegRanges[ 2 ], RegRanges[ 2 ] );
        __m128i Shift = _mm_and_si128( RangesCpy, ShiftMask );
        Shift = _mm_slli_epi16( Shift, 1 );

        __m128i MSBRanges = _mm_and_si128( RangesCpy, MSBCheck );
        RegRanges[ 2 ] = _mm_or_si128( Shift, MSBRanges );

        _mm_storeu_si128( (__m128i*)testmem, OutputBitCounts ); // debug
        std::cout << "Output   :   "  << testmem[0] << ";\t " << testmem[1] << ";\t " << testmem[2] << ";\t " << testmem[3] << ";\t " << testmem[4] << ";\t " << testmem[5] << ";\t " << testmem[6] << ";\t " << testmem[7] << ";\t " << std::endl;
    }

    // Output states bits
    unsigned short states[8] = { 0 };
    unsigned short states_bits_cnt[8] = { 0 };
    unsigned output[8] = { 0 };
    unsigned short extra_bits[8] = { 0 };
    _mm_storeu_si128( (__m128i*)states, State );
    _mm_storeu_si128( (__m128i*)states_bits_cnt, OutputBitCounts );
    
    for (int i = 0; i < 8; ++i)
    {
        unsigned short op0_ = (states[ i ] << states_bits_cnt[ i ]) & 65535;
        unsigned short op1_ = (op0_ | (op0_ << 1)) & 65535;
        unsigned short op2_ = __builtin_clz((~op1_) & 65535) - 16;
        extra_bits[ i ] = states_bits_cnt[i] + op2_;
        std::cout << op0_ << " " << op1_ << " " << op2_ << std::endl;

        // unsigned short OutputStateBits = states[ i ] >> (16 - states_bits_cnt[ i ]);
        // unsigned short Check2MSBits = (1 << (15 - states_bits_cnt[ i ]));
        // std::cout << "i : " << i;
        // {
        //     Check2MSBits = (1 << (15 - states_bits_cnt[ i ]));
        //     unsigned short ShiftedState = (states[ i ] | (states[ i ] << 1));
        //     unsigned short InvState = (~ShiftedState) & (Check2MSBits - 1);
        //     unsigned short ExtraBits = __builtin_clz( InvState ) - 16;
        //     extra_bits[ i ] = ((states[ i ] >> (16 - ExtraBits)) & ((1 << (1 + ExtraBits)) - 1)) | (1 << ExtraBits);
        //     // extra_bits[ i ] = 16 - ExtraBits;
        //     output[ i ] = states[i] >> extra_bits[i];
        //     std::cout << "; " << output[i] << "; " << extra_bits[i];
        // }
        // std::cout << std::endl;
        // SendToOutput( CheckBits, states_bits_cnt[ i ] );
    }
    std::cout << std::endl;

    // Decoding
    __m128i RegOutput;
    for (int i = 0; i < 8; ++i)
    {
        unsigned states32 = (unsigned)states[i];
        unsigned extra_bits32 = (unsigned)extra_bits[i];
        output[ i ] = states[i];//((states32 << extra_bits32) >> 16u) << (16u - extra_bits32);
        std::cout << output[ i ] << " ";
    }
    std::cout << std::endl;

    RegOutput = _mm_set_epi16   ( 
                                    output[7], output[6], output[5], output[4],
                                    output[3], output[2], output[1], output[0]
                                );

    RegRanges[ 0 ] = _mm_set1_epi16( 0 );
    RegRanges[ 1 ] = _mm_set1_epi16( 0 );
    RegRanges[ 2 ] = _mm_set1_epi16( DefaultRange );
    __m128i Lo = _mm_set1_epi16( 0 );

    __m128i _BitMaskIsOne = _mm_set1_epi16( 0 );
    __m128i _BitMaskIsZero = _mm_set1_epi16( 65535 );

    for (int i = 0; i < 8; ++i)
    {
        // [         32783       ]

        // Range adjustment
        __m128i Ranges0Cpy = _mm_and_si128( RegRanges[ 2 ], RegRanges[ 2 ] );
        __m128i Ranges0 = _mm_xor_si128( RegRanges[ 2 ], RegRanges[ 2 ] ); // zero

        __m128i Ranges0Div_1 = _mm_srli_epi16( Ranges0Cpy, 1 );
        Ranges0Div_1 = _mm_and_si128( _BitMaskIsZero, Ranges0Div_1 );
        Ranges0 = _mm_adds_epu16( Ranges0, Ranges0Div_1 );

        __m128i Ranges0Div_3 = _mm_srli_epi16( Ranges0Cpy, 2 );
        Ranges0 = _mm_adds_epu16( Ranges0, Ranges0Div_3 );

        // __m128i Ranges0Div_4 = _mm_srli_epi16( Ranges0Cpy, 3 );
        // Ranges0 = _mm_adds_epu16( Ranges0, Ranges0Div_4 );

        // __m128i Ranges0Div_5 = _mm_srli_epi16( Ranges0Cpy, 4 );
        // Ranges0 = _mm_adds_epu16( Ranges0, Ranges0Div_5 );

        // Compare
        __m128i Val = _mm_add_epi16( Lo, Ranges0 );
        Val = _mm_sub_epi16( Val, RegMaskOnes );
        __m128i SubVal = _mm_sub_epi16( RegOutput, Val );
        __m128i MSBBit = _mm_and_si128( SubVal, RegUint16MSB );
        _BitMaskIsOne = _mm_cmpgt_epi16(
            _mm_xor_si128( RegOutput, RegUint16MSB ),
            _mm_xor_si128( Val, RegUint16MSB )
        );
        _BitMaskIsZero = _mm_xor_si128( _BitMaskIsOne, RegUint16Max );

        // Low
        __m128i LoAddVal = _mm_and_si128( Ranges0, Ranges0 );
        LoAddVal = _mm_and_si128( _BitMaskIsOne, LoAddVal );
        Lo = _mm_add_epi16( Lo, LoAddVal );

        RegRanges[ 0 ] = _mm_and_si128( Ranges0, Ranges0 );
        RegRanges[ 1 ] = _mm_subs_epu16( RegRanges[ 2 ], RegRanges[ 0 ] );
        Ranges0 = _mm_and_si128( _BitMaskIsZero, RegRanges[ 0 ] );
        __m128i Ranges1 = _mm_and_si128( _BitMaskIsOne, RegRanges[ 1 ] );
        RegRanges[ 2 ] = _mm_adds_epu16( Ranges0, Ranges1 );

        _mm_storeu_si128( (__m128i*)testmem, _BitMaskIsOne ); // debuge
        std::cout << "Bit        :   " << testmem[0] << ";\t " << testmem[1] << ";\t " << testmem[2] << ";\t " << testmem[3] << ";\t " << testmem[4] << ";\t " << testmem[5] << ";\t " << testmem[6] << ";\t " << testmem[7] << ";\t " << std::endl;
        // _mm_storeu_si128( (__m128i*)testmem, RegRanges[0] ); // debuge
        // std::cout << "Range0     :   " << testmem[0] << ";\t " << testmem[1] << ";\t " << testmem[2] << ";\t " << testmem[3] << ";\t " << testmem[4] << ";\t " << testmem[5] << ";\t " << testmem[6] << ";\t " << testmem[7] << ";\t " << std::endl;
        // _mm_storeu_si128( (__m128i*)testmem, RegRanges[1] ); // debuge
        // std::cout << "Range1     :   " << testmem[0] << ";\t " << testmem[1] << ";\t " << testmem[2] << ";\t " << testmem[3] << ";\t " << testmem[4] << ";\t " << testmem[5] << ";\t " << testmem[6] << ";\t " << testmem[7] << ";\t " << std::endl;
    }
}

xlz_uint32 Test(void* dstData, void* srcData, xlz_uint32 srcByteWidth)
{
    xlz_uint8* srcAddress = (xlz_uint8*)srcData;
    xlz_uint8* dstAddress = (xlz_uint8*)dstData;
    // xlz_uint8* srcLastAddress = srcAddress + srcByteWidth;

    xlz_uint8* hashTable[1024];
    for (int i = 0; i < 1024; ++i)
    {
        hashTable[i] = srcAddress;
    }
    
    xlz_uint32 size = 0u;
    xlz_uint32 n = 12500000u;

    Test2(srcAddress);

    /*
        K = (K + Tab0[ Word ]) * (256 / Range)
        Range /= Tab1[ Word ]
    */

    /*
        OldRange = (OldMax - OldMin)  
        NewRange = (NewMax - NewMin)  
        NewValue = ((OldValue * NewRange) / OldRange)

        Symbol : 160
        State  : 606
        RL     : 5831
        RR     : 70

        112119
    */

    // xlz_uint32 TabState[256], TabRange[256];
    xlz_uint32 FixedRange = 65536u;
    // xlz_uint32 Range = 1024u;
    // xlz_uint32 State = 0u;

    // xlz_uint32 BitRange = FixedRange / 2u;
    // xlz_uint64 RangeLR[2] = { BitRange, BitRange };
    // xlz_uint32 AccumState = 0u;

    for (int i = 254; i < 256; ++i)
    {
        xlz_uint32 Symbol = (xlz_uint32)i;
        xlz_uint32 BitRange = FixedRange / 2u;
        xlz_uint64 RangeLR[2] = { BitRange, BitRange };
        xlz_uint32 AccumState = 0u;
        
        for (int j = 0; j < 8; ++j)
        {
            xlz_uint32 CurBit = (Symbol >> (xlz_uint32)j) & 1u;
            xlz_uint32 OppBit = CurBit ^ 1u;
            // AccumState += RangeLR[ Bit ] * Bit;
            // RangeLR[ Bit ] = (RangeLR[ Bit ] / RatioLR[ Bit ]) + (RangeLR[ Bit ] / RatioLR[ Bit ^ 1u ] / 2u);
            // RangeLR[ Bit ^ 1u ] = (RangeLR[ Bit ] / RatioLR[ Bit ^ 1u ] / 2u);

            // -------m----C---
            
            //        Rc       Rt
            // R =   ----  /  ----
            //        1        R(x)

            //         Rc*Rc*6
            // Rc =    -------     (Current Range + Adjustment)
            //          Rt*10

            //         Rc*Ro*4
            // Ro =    -------     (Opposite Range + Adjustment)
            //          Rt*10




            xlz_uint64 RangeCur = RangeLR[ CurBit ];
            // xlz_uint64 RangeOpp = RangeLR[ OppBit ];

            AccumState += RangeLR[ 0u ] * CurBit;

            xlz_uint64 TotalRange = RangeCur;
            RangeLR[ CurBit ] = (RangeCur * RangeCur * 19u) / (TotalRange * 20u);
            RangeLR[ OppBit ] = (RangeCur * RangeCur * 1u) / (TotalRange * 20u);

            // 2048 2048 2048 2048
            // *    *    *    *
            // R    R    R    R   
            
            // 0000
            // 2    4    16   ...
            // 3    9    81   ...

            /*
                2048 = 1024
                1024 = 512


                Symbol : 254; State : 31559; Left : 60; Right : 1141
                Symbol : 255; State : 31960; Left : 39; Right : 754

                -------------|------
                ---------------|----

                OldRange = (OldMax - OldMin)  
                NewRange = (NewMax - NewMin)  
                NewValue = (((OldValue - OldMin) * NewRange) / OldRange) + NewMin

                Ro = 21736 + 1144 = 22880
                Rn = 1141 + 60 = 1201
                Vo = 42649 - 31559 = 11090
                Vn = (((11090 - 1144) * 1201) / 22880) + 60
            */

            // std::cout << "Rt : " << TotalRange;
            // std::cout << ";  S : " << AccumState << ";  R0 : " << RangeLR[ 0 ] << ";  R1 : " << RangeLR[ 1 ] << std::endl;
        }

        // std::cout << "Symbol : " << Symbol << "; State : " << AccumState << "; Left : " << RangeLR[0] << "; Right : " << RangeLR[1] << std::endl;
    }

    /*

        32768 , 16384
        49152 , 8192
        57344 , 4096
        61440 , 2048

        62123, 683; , 1365
        62578, 455; , 902
        62879, 301; , 601

        8x   4x   2x     14x
        -- + -- + -- =   ---         (x/2 + x/4 + x/8)
        8    8    8       8

        
        (2x/3 + 2x/3 + 2x/3 + 2x/3) (4x/9 + 4x/9) (8x/81)
        
        __ = x + Rt+1
        St = St + Rt

    */



    while ( n-- > 0u )
    {
        if (n % 1000 == 0)
        {
            void* mem = malloc(65536);
            *srcAddress = *(xlz_uint8*)mem;
            free(mem);
        }

        *((xlz_uint64*)dstAddress) = *((xlz_uint64*)srcAddress);

        xlz_uint64 hash = (((xlz_uint64)(*(xlz_uint32*)srcAddress) * 4207803889ull) >> 32ull) & 1023ull;
        xlz_uint8* match = hashTable[hash];
        hashTable[hash] = srcAddress;

        if (*((xlz_uint64*)srcAddress) == *((xlz_uint64*)match))
        {
            srcAddress += 8;
            dstAddress += 8;
            n -= 1u;
            size += 8u;
        }

        dstAddress += 8, srcAddress += 8;
        size += 1u;
    }

    return size;
}