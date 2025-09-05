#include "breeze_api.h"

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>
#include <immintrin.h>

void readFile(const char* path, Args* args)
{
	FILE* fp = fopen(path, "rb");
    if (!fp)
	{
        printf("Error opening file\n");
        return;
    }

    fseek(fp, 0, SEEK_END);
    args->srcDataByteSize = ftell(fp);
    rewind(fp);

    unsigned char* buffer = (unsigned char*)malloc(args->srcDataByteSize);
    if (!buffer)
	{
        printf("Memory allocation failed\n");
        fclose(fp);
        return;
    }

    size_t bytesRead = fread(buffer, 1, args->srcDataByteSize, fp);
    if (bytesRead != args->srcDataByteSize)
	{
        printf("Error reading file\n");
        free(buffer);
        fclose(fp);
        return;
    }

    fclose(fp);
	
	args->srcData = (qword)buffer;
}

void writeFile(const char* path, const void* data, int size)
{
	FILE* fp = fopen(path, "wb");
    if (!fp)
	{
        printf("Error opening file for writing\n");
        return;
    }

    size_t written = fwrite(data, 1, size, fp);
    if (written != size)
	{
        printf("Error writing to file\n");
        fclose(fp);
        return;
    }

    fclose(fp);
}

int main()
{
	const u64 K_SIZE = 100 * 1024 * 1024;
	
	Args args;
	const Args* pArgs = &args;
	args.dstData = (qword)_aligned_malloc(K_SIZE, 64);
	args.dstDataMaxByteSize = K_SIZE;
	args.workMemory = (qword)_aligned_malloc(65536 * 8 + 8 + 16, 64);
	args.codecInfo = 0;
	
	readFile("C:/DDD/zapi/data/enwik8", (Args*)pArgs);
	
	clock_t s;
	clock_t e;
	s = clock();
	u64 result = 0;
	result += LZCompressBranchless( pArgs );
	e = clock();
	printf("Time : %f\n", (e - s) / (double)CLOCKS_PER_SEC);
	
	writeFile("C:/DDD/zapi/data/enwik8_out", (const void*)args.dstData, args.dstDataByteSize);
	
	return 0;
}