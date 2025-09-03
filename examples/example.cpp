#include <iostream>
#include "zapi.hpp"
#include "../src/density/density_api.h"

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
	auto state = zapi::codec::CreateState(
		zapi::codec::Type::ZAP_FAST,
		(zapi::u8*)inFile.Data().mem,
		inFile.Data().byteSize,
		inFile.Data().byteSize
	);
    zapi::codec::Encode(state);
	
	auto start_1 = zapi::time::Now();
	//density_compress((const uint8_t*)inFile.Data(), inFile.ByteSize(), (uint8_t*)outData, inFile.ByteSize(), DENSITY_ALGORITHM_CHAMELEON);
	auto end_1 = zapi::time::Now();
	//std::cout << "Density : " << zapi::time::Milliseconds(start_1, end_1) << " ms" << std::endl;
	
    zapi::io::File outFile("C:/DDD/zapi/data/enwik8_out", state.mem->dstData.mem, state.mem->dstByteSize);
	
	zapi::codec::DestroyState(state);
	
	zapi::io::Print("Success!", zapi::TRUE);
	
    return 0;
}