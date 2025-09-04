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
	auto encState = zapi::codec::CreateState(
		zapi::codec::Type::XLZ | zapi::codec::Type::ENCODE,
		(zapi::u8*)inFile.Data().mem,
		inFile.Data().byteSize,
		inFile.Data().byteSize,
		zapi::TRUE
	);
    auto encResult = zapi::codec::Codec(encState);
	zapi::io::Print(zapi::codec::ResultToString(encResult), zapi::TRUE);
    zapi::io::File outFile("C:/DDD/zapi/data/enwik8_out", encState.mem->dstData.mem, encState.mem->dstByteSize);
	
	auto decState = zapi::codec::CreateState(
		zapi::codec::Type::XLZ | zapi::codec::Type::DECODE,
		(zapi::u8*)encState.mem->dstData.mem,
		encState.mem->dstByteSize,
		encState.mem->srcByteSize,
		zapi::TRUE
	);
	auto decResult = zapi::codec::Codec(decState);
	zapi::io::Print(zapi::codec::ResultToString(decResult), zapi::TRUE);
	zapi::io::File outDecFile("C:/DDD/zapi/data/enwik8_out_dec", decState.mem->dstData.mem, decState.mem->dstByteSize);
	
	/*auto start_1 = zapi::time::Now();
	auto result = density_compress((const uint8_t*)inFile.Data().mem, inFile.ByteSize(), (uint8_t*)encState.mem->dstData.mem, inFile.ByteSize(), DENSITY_ALGORITHM_CHAMELEON);
	auto end_1 = zapi::time::Now();
	std::cout << "Density : " << zapi::time::Milliseconds(start_1, end_1) << " ms" << std::endl;
	std::cout << "Ratio: " << (float)result.bytesRead / (float)result.bytesWritten << std::endl;*/
	
    return 0;
}

/*
auto start_1 = zapi::time::Now();
//density_compress((const uint8_t*)inFile.Data(), inFile.ByteSize(), (uint8_t*)outData, inFile.ByteSize(), DENSITY_ALGORITHM_CHAMELEON);
auto end_1 = zapi::time::Now();
//std::cout << "Density : " << zapi::time::Milliseconds(start_1, end_1) << " ms" << std::endl;
*/