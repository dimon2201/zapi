#include <iostream>
#include "../include/zapi.hpp"

ZAPI_IMPORT_TYPES

int main()
{
    zapi::State state;
    uint8* p = zapi::memory::Allocate<uint8>(1024_zus);

    std::cout << "Hello World!" << std::endl;
    
    return 0;
}