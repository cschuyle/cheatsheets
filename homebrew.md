# Homebrew

## Don't fucking auto update every time

```
HOMEBREW_NO_AUTO_UPDATE=1 brew install WHATEVER
```

## Downgrade if @version doesn't work

from <https://gist.github.com/talal/1b8d0c11338dc9ab79b2386309828894>

```
brew unlink WHATEVER
cd "$(brew --repo homebrew/core)"
git checkout SHA
HOMEBREW_NO_AUTO_UPDATE=1 brew install WHATEVER
git checkout master
```

