## [WIP] list all branches which look like they can be removed from remote

branches='list
your
branch/names
here'

for branch in $branches
do
  set -e
  branch_report="$(grep -e "origin/$branch\\$" branch-report.txt)"

  if [[ -z "$(git ls-remote --heads origin "$branch")" ]]
  then
    echo "remote branch $branch doesn't exist: ## $branch_report"
    continue
  fi
  { git checkout $branch --quiet 2>&1; } >/dev/null
  { git reset --hard --quiet 2>&1; } >/dev/null

  set +e
  { git pull -r --quiet 2>&1; } >/dev/null
  if [[ $? != 0 ]]
  then
    echo "remote branch $branch cannot be merged: ## $branch_report"
  else
    echo "git push origin \":$branch\" ## branch exists, run that <= to delete it ## $branch_report"
  fi
  set -e

done
