#!/usr/bin/env bash
set -e

# NOTE: If you have not pruned your local repo (e.g. using git fetch --prune), then
# a reference to any remote branch that existed whenever you did a fetch or pull is
# stored in your local repo. So, use ls-remote to get actual remote branches.

# TODO
# Accept a list of branches to exclude from report. For example, master.

exe="$(basename "$0")"
output_file="$1"

function usage() {
  echo "Usage: $exe <output file>.csv
   $1
"
}

if [[ -z "$1" ]] ; then
  usage
  exit 1
fi

if [[ -f "$1" || -d "$1" ]] ; then
  usage "$1 exists. The output file must not yet exist."
  exit 1
fi

if [[ "$1" != *.csv ]] ; then
  usage "$1 must have the .csv extension."
  exit 1
fi

origin=origin

tmpdir="$(mktemp -d)"

remote_branches="$tmpdir/actual-remote-branches.txt"
merged_branches="$tmpdir/merged-branches.txt"

git fetch

# See NOTE
git ls-remote --heads "$origin" | sed -E 's/\w+\s+refs\/heads\///' | xargs -L1 -I@ echo "$origin/"@ >> "$remote_branches"

git branch -r --merged "$origin/master" |sort|grep "^  remotes/$origin"|sed 's/  remotes\///g' > "$merged_branches"

# Output:
echo '"Merged into master or not?","Branch","Date","Authors","Action"' >> "$output_file"
comm -12 "$remote_branches" "$merged_branches" | xargs -L1 -I@ sh -c "{ printf '\\\\\"@\\\\\",'; git show @ --format='\\\"%cs\\\",\\\"%an\\\"' -s ;}" | xargs -L1 -I@ echo '"MERGED",'@ >> "$output_file"
comm -23 "$remote_branches" "$merged_branches" | xargs -L1 -I@ sh -c "{ printf '\\\\\"@\\\\\",'; git show @ --format='\\\"%cs\\\",\\\"%an\\\"' -s ;}" | xargs -L1 -I@ echo '"UNMERGED",'@ >> "$output_file"
