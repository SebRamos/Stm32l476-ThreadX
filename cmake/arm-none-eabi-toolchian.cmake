# Target Platform
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

# Temporary sto pagainst linkiing test executables during CMake Config
# Since we don't have startup code or linker script yet
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

# Use Clang as our compiler
set(CMAKE_C_COMPILER clang)
set(CMAKE_CXX_COMPILER clang++)
set(CMAKE_ASM_COMPILER clang)

# Cross-compilcation target
set(CMAKE_C_COMPILER_TARGET arm-none-eabi)
set(CMAKE_CXX_COMPILER_TARGET arm-none-eabi)
set(CMAKE_ASM_COMPILER_TARGET arm-none-eabi)

# Use the installed ARM GNU toolchain for its runtime libraries & headers
set(CMAKE_C_COMPILER_EXTERNAL_TOOLCHAIN /usr)
set(CMAKE_CXX_COMPILER_EXTERNAL_TOOLCHAIN /usr)

# STM32L464: ARM Cortex-M4, Thumb-2 Instruction Set, Single-Prevision FPU, Hard-Float ABI
set(ARM_CPU_FLAGS 
    -mcpu=cortex-m4
    -mthumb
    -mfpu=fpv4-sp-d16
    -mfloat-abi=hard
)

# Apply above CPU config to each language
string(JOIN " " ARM_CPU_FLAGS_STRING ${ARM_CPU_FLAGS})
set(CMAKE_C_FLAGS_INIT "${ARM_CPU_FLAGS_STRING}")
set(CMAKE_CXX_FLAGS_INIT "${ARM_CPU_FLAGS_STRING}")
set(CMAKE_ASM_FLAGS_INIT "${ARM_CPU_FLAGS_STRING}")
