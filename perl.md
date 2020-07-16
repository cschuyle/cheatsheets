Remove files matching a regex from a file
```
perl -i -sn -e 'print unless /this regex/' file
```