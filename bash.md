Want to process files by using `files=$(ls *)` ? Don't.

```
files=$(set +o noglob && echo *)
```

To add lines breaks and quotes for readability/paste-ability:
```
files=$(set +o noglob && printf "'%s'\\n" *)
```

Script boilerplate:
```
#!/usr/bin/env bash
set -o errexit # set -e
set -o pipefail
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
script_file=$(basename "$0")

# Whatever usage check you want to do regarding $1...$n
if [[ ! -d "$1" || ! -d "$2" || "$3" == "" ]]; then
  cat <<EOF
USAGE: $script_file blah blah blah
EOF
  exit 2
fi

set -o nounset # set -u
```

If you don't have the `realpath` command, which transforms a filename to canonical/normalized form:
```
filename=$(cd $(dirname "$filename") && pwd)/$(basename "$filename")
```

