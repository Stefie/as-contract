# WORK IN PROGRESS!

### A basic Parity Substrate `srml-contract` Smart Contract written in AssemblyScript

It's following a similar approach as this PoC Rust implementation:

- https://github.com/pepyakin/substrate-contracts-adder/blob/master/src/lib.rs
- https://github.com/Robbepop/non-pdsl-example/blob/master/src/lib.rs

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

Now open http://localhost:8080 and you should see a minimal UI.


### Edit files
To edit the **AssemblyScript** code that is getting compiled to WebAssembly, edit the files in the `./assembly/` folder.

To edit the **Frontend UI** code that interacts with the WebAssembly modules, edit the files in the `./src/` folder.
