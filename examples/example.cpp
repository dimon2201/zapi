#include <iostream>
#include "zapi.hpp"

/*void EncodeFile(const char* inputFileName, const char* outputFileName)
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
}*/

int main()
{
    zapi::io::File inFile("C:/DDD/zapi/data/enwik8");
    void* outData = zapi::storage::Allocate(inFile.ByteSize(), zapi::TRUE);
    zapi::size outByteSize = 0;
    zapi::codec::ZapEncoder encoder(
        inFile.Data(),
        outData,
        inFile.ByteSize(),
        outByteSize,
        inFile.ByteSize(),
        zapi::codec::ZapEncoder::Codec::FAST
    );
    zapi::io::File outFile("C:/DDD/zapi/data/enwik8_out", outData, outByteSize);
    
    system("pause");

    return 0;
}