PROJECT_NAME		:= ZAPI
TARGET 				:= main.exe
CXXFLAGS 			:= -std=c++11 -O3 #-Werror -Wpedantic -Wall -pedantic
CXX					:= g++
CXX_SOURCE    		= $(CXX) $(CXXFLAGS) -c $(1) -o $(2) &&
CXX_OBJECT    		= $(CXX) $(CXXFLAGS) -o main.exe $(1) libs/zapi001.a
MAKE_LIB			= ar -rcs $(1) $(call OBJECT_FILES, $(2))
CLEAR_FOLDER		= @del $(subst /,\,$(call PARSE_DIR, $(1), $(LIB_EXTENSION)))
CLEAR_OBJECTS		= @del $(subst /,\,$(call OBJECT_FILES, $(1)))

LIB_EXTENSION		:= .a
SOURCE_EXTENSION	:= .cpp
SOURCES_DIR 		:= source/
BUILD_DIR       	:= build/
PARSE_DIR			= $(wildcard $(1)*$(2)) $(foreach d,$(dir $(wildcard $(1)*/.)),$(call PARSE_DIR,$(d),$(2)))
SOURCE_FILES  		= $(call PARSE_DIR,$(1),$(SOURCE_EXTENSION))
OBJECT_FILES    	= $(addprefix $(BUILD_DIR),$(notdir $(subst $(SOURCE_EXTENSION),.o,$(call SOURCE_FILES, $(1)))))
TO_OBJECT       	= $(addprefix $(BUILD_DIR),$(notdir $(subst $(SOURCE_EXTENSION),.o,$(1))))
COMPILE         	= $(foreach d, $(call SOURCE_FILES, $(1)),$(call CXX_SOURCE,$(d),$(call TO_OBJECT,$(d)))) @echo

all: pre-compile compile link clear

pre-compile :
	@echo $(PROJECT_NAME) gets compiled ...
	@del /f /s /q "build\"
	@rmdir build
	@mkdir build
	cd libs/ && echo This file is not a library. This file is used for Makefile to work correctly. Leave it in the libs folder. > _not_a_library && cd ../

compile :
# $(call COMPILE,$(SOURCES_DIR))
# Compile and link libraries
	$(call CLEAR_FOLDER, libs/)
	$(call COMPILE, source/)
	$(call MAKE_LIB, libs/zapi001.a, source/)
	$(call CLEAR_OBJECTS, source/)
# Compile main example
	$(call CXX_SOURCE, source/main.cpp, build/main.o) $(call CXX_OBJECT, build/main.o)

link: compile

clear: $(TARGET)
	@del $(subst /,\,$(OBJECT_FILES))