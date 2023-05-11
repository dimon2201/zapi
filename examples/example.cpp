#include <iostream>
#include <fstream>
#include <chrono>
#include "../src/zapi.hpp"
#include <emmintrin.h>
#include <cstring>

void EncodeData(const void* inputData, void* outputData, size_t inputDataByteWidth, size_t* outputDataByteWidth)
{
    struct Symbol
    {
        uint8_t Code;
        uint32_t Freq;
    };
    Symbol freqTable[256] = {};
    const uint8_t* inputBytes = (const uint8_t*)inputData;

    // Count frequencies
    for (uint32_t i = 0; i < inputDataByteWidth; i++)
    {
        freqTable[inputBytes[i]].Code = (uint8_t)inputBytes[i];
        freqTable[inputBytes[i]].Freq += 1;
    }

    // Find total frequency count
    uint32_t totalFreqCount = 0;
    for (int i = 0; i < 256; i++) { totalFreqCount += freqTable[i].Freq; }

    // Round down to power of 2
    for (int i = 0; i < 256; i++)
    {
        if (freqTable[i].Freq == 0) { continue; }
        freqTable[i].Freq = 1 << (31 - __builtin_clz(freqTable[i].Freq));
    }

    // Round up total frequency count to power of 2
    totalFreqCount = 1 << (32 - __builtin_clz(totalFreqCount));

    // Sort symbols
    uint8_t bucketCount[32] = {};
    uint8_t buckets[32][256] = {};
    for (int i = 0; i < 256; i++)
    {
        uint32_t freq = freqTable[i].Freq;
        if (freq == 0) { continue; }

        uint32_t bitCount = 32 - __builtin_clz(freq);
        buckets[bitCount][bucketCount[bitCount]++] = (uint8_t)i;
    }

    uint32_t symbolCount = 0;
    Symbol sortedSymbols[256] = {};
    for (int i = 0; i < 32; i++)
    {
        for (int j = 0; j < bucketCount[i]; j++)
        {
            sortedSymbols[symbolCount++] = freqTable[buckets[i][j]];
        }
    }

    // Output
    uint32_t freqSumm = 0;
    for (int i = 0; i < symbolCount; i++)
    {
        freqSumm += sortedSymbols[i].Freq;
        std::cout << sortedSymbols[i].Freq << " ";
    }
    std::cout << std::endl << "FreqSumm/TotalFreq : " << freqSumm << "/" << totalFreqCount << std::endl;

    // Sorting
    // uint32_t arr[512] = {};
    // for (int i = 0; i < 32; i++)
    // {
    //     uint32_t arrCount[2] = {};
    //     for (uint32_t j = 0; j < 256; j++)
    //     {
    //         uint32_t bit = (freqTable[j] >> i) & 1;
    //         arr[ (bit << 8) + arrCount[bit] ] = freqTable[j];
    //         arrCount[bit] += 1;
    //     }

    //     uint32_t idx = 0;
    //     for (uint32_t j = 0; j < arrCount[0]; j++, idx++) { freqTable[idx] = arr[j]; }
    //     for (uint32_t j = 0; j < arrCount[1]; j++, idx++) { freqTable[idx] = arr[256 + j]; }
    // }

    /*
        aaaabcd
        00000000000000 (2 bits per symbol, message takes 14 bits total)
        1.
        a = 1 - (4 / 7) = 1 - 0.57 = 0.43
        b = 1 - (1 / 7) = 1 - 0.14 = 0.86
        c = 1 - (1 / 7) = 1 - 0.14 = 0.86
        d = 1 - (1 / 7) = 1 - 0.14 = 0.86
        2. normalization
        1 / (0.43 + 0.86 + 0.86 + 0.86) = 1 / 3.01 = 0.33
        a = 0.43 * 0.33 = 0.14
        b = 0.86 * 0.33 = 0.28
        c = 0.86 * 0.33 = 0.28
        d = 0.86 * 0.33 = 0.28
    */
}

void EncodeFile(const char* inputFileName, const char* outputFileName)
{
    std::ifstream ifs(inputFileName, std::ios::in | std::ios::binary);
    size_t inputDataByteWidth = 0;
    ifs.seekg(0, std::ios::end);
    inputDataByteWidth = ifs.tellg();
    ifs.seekg(0, std::ios::beg);
    void* inputData = malloc(inputDataByteWidth);
    ifs.read((char*)inputData, inputDataByteWidth);
    ifs.close();

    void* outputData = malloc(inputDataByteWidth);
    size_t outputDataByteWidth = 0;

    auto begin = std::chrono::high_resolution_clock::now();
    EncodeData(inputData, outputData, inputDataByteWidth, &outputDataByteWidth);
    auto end = std::chrono::high_resolution_clock::now();
    std::cout << std::chrono::duration_cast<std::chrono::milliseconds>(end - begin).count() << " ms" << std::endl;

    std::ofstream ofs(outputFileName, std::ios::out | std::ios::binary);
    ofs.write((const char*)outputData, outputDataByteWidth);
    ofs.close();
}

int main()
{
    unsigned cnt = 0;
    uint8_t* memory = (uint8_t*)malloc(4 * 1024 * 1024);
    for (unsigned i = 0; i < 4 * 1024 * 1024; i++)
    {
        cnt += memory[i];
    }
    std::cout << cnt << std::endl;

    EncodeFile(
        "C:\\Users\\USER100\\Documents\\GitHub\\zapi\\data\\enwik8",
        "C:\\Users\\USER100\\Documents\\GitHub\\zapi\\data\\enwik8.za"
    );

    std::cout << ZAPI_VERSION_CODE << std::endl;
    
    return 0;
}