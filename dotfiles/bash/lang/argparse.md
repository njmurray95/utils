# Bash Argument Parsing

Just do it manually, per the bash wiki:

http://mywiki.wooledge.org/BashFAQ/035

```
# Initialize all the option variables.
# This ensures we are not contaminated by variables from the environment.
file=
verbose=0

while :; do
    case $1 in
        -h|-\?|--help)
            show_help    # Display a usage synopsis.
            exit
            ;;
        -f|--file)       # Takes an option argument; ensure it has been specified.
            if [ "$2" ]; then
                file=$2
                shift
            else
                die 'ERROR: "--file" requires a non-empty option argument.'
            fi
            ;;
        --file=?*)
            file=${1#*=} # Delete everything up to "=" and assign the remainder.
            ;;
        --file=)         # Handle the case of an empty --file=
            die 'ERROR: "--file" requires a non-empty option argument.'
            ;;
        -v|--verbose)
            verbose=$((verbose + 1))  # Each -v adds 1 to verbosity.
            ;;
        --)              # End of all options.
            shift
            break
            ;;
        -?*)
            printf 'WARN: Unknown option (ignored): %s\n' "$1" >&2
            ;;
        *)               # Default case: No more options, so break out of the loop.
            break
    esac
    shift
done
```

```
# This works better for specifying an arbitrary list of values
# ./program.sh [ONE] [TWO] [THREE] [...]
DO_SOMETHING=""
DEFAULT_VALUE="default"
ARR=( )
# No need for `break` statements, will continue until shifted all the way to end of argslist
while [[ "$1" ]]; do
    case $1 in
        -h | --help)
            echo "$0: <usage>
            ;;
        -s | --some-value)
            if [[ "$2" ]]; then
                DEFAULT_VALUE="$2"
                shift
            else
                echo "Error: --some-value argument requires a value."
                exit 1
            fi
            ;;
        -?*)
            echo "Unknown optin: $1"
            exit 1
            ;;
        *)
            ARR+=("$1")
            ;;
    esac
    shift
done
```        
---

# Menu Selection

Bash has a `select` tool that is finnicky but basically fine:

```
DIRLIST=()
select item in `ls`; do
    # $REPLY maps to the number selected
    # The <var> passed into `select` maps to the value selected
    DIRLIST+=($item)

    echo "Continue selecting?"
    read -p "[y/n] " ans
    case $ans in
        [Yy]* )
            continue
            ;;
        [Nn]* )
            break
            ;;
        *)
            break
            ;;
    esac
done

echo "All the files we selected:"
printf "* %s\n" "${DIRLIST[@]}"
```
