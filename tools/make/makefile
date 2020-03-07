########################################
#                  _
#  _ __ ___   __ _| | _____
# | '_ ` _ \ / _` | |/ / _ \
# | | | | | | (_| |   <  __/
# |_| |_| |_|\__,_|_|\_\___|
#

########################################
# Useful Variable Values

# Get path to current makefile
# Note: include directives append to $MAKEFILE_LIST
#       must run before any other files are included
makefile_path := $(abspath $(lastword ($MAKEFILE_LIST)

makefile_dir := $(dir $(makefile_path))


########################################
# Useful Target Rules

# Echo the runtime eval of a makefile variable
print-%: ; @echo $*=$($*)



# Check syntax of arbitrary c++ file
check-%:
	@echo "Checking syntax of $*..."
	@g++ $(CXXFLAGS) -fsyntax-only $*

