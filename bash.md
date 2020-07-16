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
set -o nounset # set -u
set -o pipefail
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
script_file=$(basename "$0")
```

If you don't have the `realpath` command, which transforms a filename to canonical/normalized form:
```
filename=$(cd $(dirname "$filename") && pwd)/$(basename "$filename")
```

