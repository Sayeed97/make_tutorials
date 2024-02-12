# C++ Compiler Flags
CXX = g++
DEBUG = 0

ifeq ($(DEBUG), 1)
CXX += --version
endif

# CPP compiler will now inlcude an include directory which holds all the header files
# Using string concatination to add -I flag to the CXX label
CXX += -I $(INCLUDE_DIR)

# Directory Paths
SOURCE_DIR = src
INCLUDE_DIR = include
BUILD_DIR = build
BUILD_SOURCES = $(SOURCE_DIR)\main.o $(SOURCE_DIR)\print.o

# Targets

# Primary build
build: $(BUILD_SOURCES) # Build Sources are Pre-requisities
	$(CXX) $(BUILD_SOURCES) -o $(BUILD_DIR)\printFunction
	del $(SOURCE_DIR)\*.o

# Cleans the latest build
clean:
	del $(BUILD_DIR)\printFunction.exe

# Print make environments varaibles
print_env:
	echo BUILD SOURCES are: $(BUILD_SOURCES)

# Target to build main.cpp object file
$(BUILD_DIR)\main.o:
	$(SOURCE_DIR)\$(CXX) -c main.cpp

# Target to build print.cpp object file
$(BUILD_DIR)\print.o:
	$(SOURCE_DIR)\$(CXX) -c print.cpp