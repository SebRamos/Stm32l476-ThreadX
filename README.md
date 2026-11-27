# Development Environment

This project targets the STM32L476RG (ARM Cortex-M4) and uses Clang/Clang++ as the cross-compiler, with CMake managing the build system.

## Project File Structure

The file structure is defined as follows:

| Directory | Purpose |
| --- | --- |
| `cmake/` | Toolchain and build configuration |
| `startup/` | Startup assembly and vector table |
| `linker/` | Linker scripts |
| `src/` | Application source code |
| `build/` | Generated build artifacts (should be Git-ignored) |

## Prerequisites

The following tools and libraries are required:

| Component |	Purpose | Package Name (Debian) |
| --- | --- | --- |
| Clang / Clang++ | C and C++ cross-compilation | `clang` |
| CMake	| Build system configuration | `cmake` |
| LLD	| LLVM linker | `lld` |
| ARM GNU Toolchain	ARM utilities | Including objcopy and size | `gcc-arm-none-eabi`<br>`binutils-arm-none-eabi` | 
| libstdc++	| C++ standard library support | `libstdc++-arm-none-eabi-newlib` |
| libgcc |Compiler runtime support | `libnewlib-arm-none-eabi` |
| GDB Multiarch | ARM debugging | `gdb-multiarch` |
| OpenOCD	Debugging/programming | Interface for ST-Link | `openocd` |

## Building the Project

The project uses a custom CMake toolchain file located at:
`cmake/arm-none-eabi-toolchain.cmake`

This file configures Clang for the ARM Cortex-M4 target.

### Example project configuation and build
1. Configure the project
From the repository root:

`cmake -S . -B build -DCMAKE_TOOLCHAIN_FILE=cmake/arm-none-eabi-toolchain.cmake`

2. Build the project

`cmake --build build`
