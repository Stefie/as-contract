# AssemblyScript-Setup

An AssemblyScript starter project setup.

Based initially on the Quick-Start guide on https://docs.assemblyscript.org/quick-start. 

It uses:

- `yarn` as a package manager
- `webpack-dev-server` to provide a very basic UI during development


**Install dependencies:**
```
yarn install
```

**Build the WASM files and run the webpack development server on `http://localhost:8080`:**

```
yarn run start
```

Now open http://localhost:8080 and you should see a minimal UI that calls both WASM functions.


### Edit files
To edit the **AssemblyScript** code that is getting compiled to WebAssembly, edit the files in the `./assembly/` folder.

To edit the **Frontend UI** code that interacts with the WebAssembly modules, edit the files in the `./src/` folder.
