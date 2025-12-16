# minizinc
```sh
minizinc -a -s example/symmetry.mzn
```

## minizinc-js: fail

### deno
- `https://esm.sh/minizinc@4.4.4`
- or `https://esm.sh/minizinc@4.4.4/dist/minizinc-node.js`
```
Uncaught (in promise) NotSupported: Classic workers are not supported.
```

### browser + `https://esm.sh/minizinc@4.4.4`
```
GET
https://esm.sh/minizinc@4.4.4/es2022/minizinc-worker.js?version=4.4.4
NS_ERROR_CORRUPTED_CONTENT
```
