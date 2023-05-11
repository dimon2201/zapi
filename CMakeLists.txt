cmake_minimum_required(VERSION 3.2)

project(zapiapp)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -O3")

set(SOURCE_FILES examples/example.cpp)

add_executable(zapiapp ${SOURCE_FILES})