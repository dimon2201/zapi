cmake_minimum_required(VERSION 3.2)

project(zapicodec)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -O3")

set(SOURCE_FILES source/main.cpp)

add_executable(zapicodec ${SOURCE_FILES})