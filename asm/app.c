#include "breeze_api.h"

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>
#include <immintrin.h>

int main()
{
	const u64 K_SIZE = 100 * 1024 * 1024;
	
	Args args;
	args.srcData = (qword)_aligned_malloc(K_SIZE, 64);
	args.dstData = (qword)_aligned_malloc(K_SIZE, 64);
	args.srcDataByteSize = K_SIZE;
	args.dstDataMaxByteSize = K_SIZE;
	args.workMemory = (qword)_aligned_malloc(65536 * 4, 64);
	args.codecInfo = 0;
	const Args* pArgs = &args;
	
	for (int i = 0; i < K_SIZE; i++) { ((unsigned char*)args.srcData)[i] = 255; }
	
	clock_t s;
	clock_t e;
	s = clock();
	u64 result = 0;
	result += CompressorEncode( pArgs );
	//printf("Asm : %f\n", (double)result / 10.0);
	e = clock();
	printf("Assembly : %f\n", (e - s) / (double)CLOCKS_PER_SEC);
	//for (int i = 0; i < K_SIZE; i++) {
	//	printf("%d", ((unsigned char*)args.dstData)[i]);
	//}
	
	//for (int i = 0; i < K_SIZE; i++) { ((unsigned char*)args.srcData)[i] = 255; ((unsigned char*)args.dstData)[i] = 0; }
	
	for (int i = 0; i < K_SIZE; i += 1024 * 1024) {
		//printf("%u ", ((unsigned char*)args.dstData)[i]);
	}
	
	for (int i = 0; i < K_SIZE; i++) { ((unsigned char*)args.srcData)[i] = 255; ((unsigned char*)args.dstData)[i] = 0; }
	
	s = clock();
	memcpy( (void*)args.dstData, (void*)args.srcData, K_SIZE );
	e = clock();
	printf("Memcpy : %f\n", (e - s) / (double)CLOCKS_PER_SEC);
	
	return 0;
}