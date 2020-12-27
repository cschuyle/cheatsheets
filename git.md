# Git cheatsheet

#### Do-This-First Config

Everywhere (really just puts it in your home dir's `.git/config`:
```
git config --global user.name "Carlton Schuyler"
git config --global user.email carl@dragnon.com
git config --global branch.autoSetupRebase always
git config --global pull.rebase true
```

#### For a single git repo:
```
git config --local user.name "Carlton Schuyler"
git config --local user.email carl@dragnon.com
git config --local branch.autoSetupRebase always
git config --local pull.rebase true
```

#### For a directory and its subdirs:

Borrowed from <https://stackoverflow.com/questions/21307793/set-git-config-values-for-all-child-folders>

Add this to the end of `~/.gitconfig`:
```
[includeIf "gitdir:~/Some-Directory/"]
        path = ~/Some-Directory/gitconfig-includes
```

Then in `~/Some-Directory/gitconfig-includes`:
```
[user]
        name = Carlton Schuyler
        email = cschuyler@dragnon.com
```

### Sort branches by last commit date:
```
git for-each-ref --sort=-committerdate refs/remotes/ --format='%(committerdate:short) %(authorname) %(refname:short)'
```

### Rewrite author info for all commits

Ignore anyone who tells you to use `git filter-branch`. Even git committers don't recommend that anymore.

Clone <https://github.com/newren/git-filter-repo>.
Actually just copy the executable Python file `git-filter-repo` into your path. It needs python 3.

Contents of a file `my-mailmap`:
```
Carlton Schuyler <carl@correct-domain.com> <cschuyler@wrong-domain.com>
```

Then from your repo, do the rename:
```
git filter-repo --mailmap path-to/my-mailmap
```

You'll have to force-push to your master branch.

I haven't tried to do this to several branches.
