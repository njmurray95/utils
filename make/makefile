########################################
#                  _
#  _ __ ___   __ _| | _____
# | '_ ` _ \ / _` | |/ / _ \
# | | | | | | (_| |   <  __/
# |_| |_| |_|\__,_|_|\_\___|
#

# Echo the runtime eval of a makefile variable
print-%: ; @echo $*=$($*)

# Check syntax of arbitrary c++ file
check-%:
	@echo "Checking syntax of $*..."
	@g++ $(CXXFLAGS) -fsyntax-only $*

