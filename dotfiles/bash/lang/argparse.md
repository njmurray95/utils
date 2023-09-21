# Bash Argument Parsing

Just do it manually, per the bash wiki:

http://mywiki.wooledge.org/BashFAQ/035

```
   9 # Initialize all the option variables.
  10 # This ensures we are not contaminated by variables from the environment.
  11 file=
  12 verbose=0
  13 
  14 while :; do
  15     case $1 in
  16         -h|-\?|--help)
  17             show_help    # Display a usage synopsis.
  18             exit
  19             ;;
  20         -f|--file)       # Takes an option argument; ensure it has been specified.
  21             if [ "$2" ]; then
  22                 file=$2
  23                 shift
  24             else
  25                 die 'ERROR: "--file" requires a non-empty option argument.'
  26             fi
  27             ;;
  28         --file=?*)
  29             file=${1#*=} # Delete everything up to "=" and assign the remainder.
  30             ;;
  31         --file=)         # Handle the case of an empty --file=
  32             die 'ERROR: "--file" requires a non-empty option argument.'
  33             ;;
  34         -v|--verbose)
  35             verbose=$((verbose + 1))  # Each -v adds 1 to verbosity.
  36             ;;
  37         --)              # End of all options.
  38             shift
  39             break
  40             ;;
  41         -?*)
  42             printf 'WARN: Unknown option (ignored): %s\n' "$1" >&2
  43             ;;
  44         *)               # Default case: No more options, so break out of the loop.
  45             break
  46     esac
  47 
  48     shift
  49 done
```
