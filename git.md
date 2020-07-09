# Git cheatsheet

### Sort branches by last commit date:
```
git for-each-ref --sort=-committerdate refs/remotes/ --format='%(committerdate:short) %(authorname) %(refname:short)'
```