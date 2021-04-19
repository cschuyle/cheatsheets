#!/usr/bin/env bash
set -e

# TODO
# Accept a list of branches to exclude from report. For example, master.

function usage() {
  echo "Usage: git-branch-report.sh <output file>.csv
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

OUTPUT_FILE="$1"

tmpdir="$(mktemp -d)"

remote_branches="$tmpdir/remote-branches.txt"
merged_branches="$tmpdir/merged-branches.txt"

git fetch
git for-each-ref  refs/remotes/ --format='%(refname:short)'|sort > "$remote_branches"
git branch -a --merged origin/master |sort|grep "^  remotes/origin"|sed 's/  remotes\///g' > "$merged_branches"

# Output:
echo '"Merged into master or not?","Date","Authors","Branch","Action"' >> "$OUTPUT_FILE"
comm -12 "$remote_branches" "$merged_branches" | xargs -L1 -I@ sh -c "{ printf '\\\\\"@\\\\\",'; git show @ --format='\\\"%cs\\\",\\\"%an\\\"' -s ;}" | xargs -L1 -I@ echo '"MERGED",'@ >> "$OUTPUT_FILE"
comm -23 "$remote_branches" "$merged_branches" | xargs -L1 -I@ sh -c "{ printf '\\\\\"@\\\\\",'; git show @ --format='\\\"%cs\\\",\\\"%an\\\"' -s ;}" | xargs -L1 -I@ echo '"UNMERGED",'@ >> "$OUTPUT_FILE"
