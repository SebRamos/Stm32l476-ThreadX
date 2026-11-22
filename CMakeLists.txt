cmake_minimum_required(VERSION 3.20)

project(Stm32l4Threadx
    VERSION 1.0
    LANGUAGES C CXX ASM
)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

add_library(firmware OBJECT
    src/main.cpp
)

target_compile_options(firmware PRIVATE
    -ffreestanding
    -ffunction-sections
    -fdata-sections
    -Wall
    -Wextra
    -Wpedantic

    $<$<COMPILE_LANGUAGE:CXX>:-fno-exceptions>
    $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
)