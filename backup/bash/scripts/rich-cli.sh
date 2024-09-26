#!/bin/env bash

# Check if we have rich-cli
which rich >/dev/null || echo 0

# # echo -> rich
# echo()
# {
#     rich -p "$*"
# }

# cat -> rich
# cat()
# {
#     rich "$@"
# }

# # less -> rich
# less()
# {
#     # Use -t to check if running from stdin from a pipe
#     # `rich` does not run correctly if being piped in from stdin
#     [[ -t 0 ]] && rich --pager "$@" || command less "$@"
# }
