# AWS shenanigans

## Delete all versions of a bucket

From <https://stackoverflow.com/questions/29809105/how-do-i-delete-a-versioned-bucket-in-aws-s3-using-the-cli>
```bash
aws s3api delete-objects \
      --bucket <value> \
      --delete "$(aws s3api list-object-versions \
      --bucket <value> | \
      jq '{Objects: [.Versions[] | {Key:.Key, VersionId : .VersionId}], Quiet: false}')"
```

