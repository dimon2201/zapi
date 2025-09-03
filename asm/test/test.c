#include <stdio.h>
#include <stdlib.h>

int main()
{
	#define N 1000 * 1000 * 1000
    char* src = malloc(N);
    memset(&src[0], 1000, 0);
    char* dst = malloc(N);
    memset(&dst[0], 1000, 1);
    
    memcpy(dst, src, N);
	
	for (int i = 0; i < N; i++)
		printf("%c", dst[i]);

	return 0;
}