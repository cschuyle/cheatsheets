# Re-generate Mac launch database

### Use case:
You remove an app, but its association to a URL or file remains, so you can't open the file or URL

### Solution:

```
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user
```

Then, restart.

I think the deal is that you can’t populate the Launch Database yourself, or selectively remove items,
but if you nuke it then the system rebuilds it from whatever apps there are in various paths.
