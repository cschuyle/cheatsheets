# Text processing example

Example - find all the Italian Little Prince that I don't already have.

```
cd data
```

## Intersection and set difference (symmetrical difference) using `grep`:

```
grep -Fx -f lpids-i-have lpids-italian > intersection
grep -Fxv -f lpids-i-have lpids-italian > difference
```

(Now create the difference.array file - I did it manually)

## Select objects with ID in list of wanted IDs, using `jq`

Start with an understandable example:

```
cat little-prince-italian.json | \
jq '.items[] | \
select([.littlePrinceItem.lpid] | \
inside(["PP-1227","PP-1331"]))' 
```

But this output isn't an actual JSON array, so pipe it to `jq -s .`
Also, the array is quite long so just cat it fromt he file we created above.

```
cat little-prince-italian.json | jq '.items[] | select([.littlePrinceItem.lpid] | inside(['"$(cat difference.array)"']))' | jq -s .
```