#pragma once

#include <stdint.h>

typedef uint64_t 	u64;
typedef u64 		qword;

typedef struct Args
{
	qword srcData;
	qword dstData;
	qword srcDataByteSize;
	qword dstDataMaxByteSize;
	qword workMemory;
	qword codecInfo;
} Args;

u64 SomeFunction(
	const Args* args
);

u64 CompressorEncode(
	const Args* args
);

u64 LZCompress(
	const Args* args
);