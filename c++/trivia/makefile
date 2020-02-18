CXXFLAGS = -std=c++11

.PHONY = clean

# Files in directory
CPP = $(wildcard *.cpp)
EXECS = $(patsubst %.cpp,%, $(CPP))

# Default build rule
%: %.cpp %.h
	g++ $(CXXFLAGS) $< -o $*

# Delete all executables
clean:
	rm -f $(EXECS)
