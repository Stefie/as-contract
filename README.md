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


**Before:** 
Write value in ScratchBuffer -> `[0,134,23,0,0]`
Declare empty 32-bytes long Uint8Array -> `const COUNTER_KEY: Uint8Array = new Uint8Array(32);`

|  | Function | What? | Result | JS SB | Memory |
| - | - | - | - | - | - |
| **1** | **`getScratchBuffer()`** | Gets value from local SB and writes in WASM memory |  | 0,134,23,0,0 |  |
| 2 | ext_scratch_size{} | Get size of local ScratchBuffer | 5 | 0,134,23,0,0 |  |
| 3 | ext_scratch_read(0, 0, 5) | Read from ScratchBuffer and write in memory at dest_pointer | |0,134,23,0,0 | 0,134,23,0,0 at ptr 0|
| **4** | **`handle([0,134,23,0,0])`** |  |  | 0,134,23,0,0 | 0,134,23,0,0 at ptr 0|
| 5 | switch (input[0]) {} | Determine which functions to execute | 0 | 0,134,23,0,0 | 0,134,23,0,0 at ptr 0|
| 6 | get_storage(COUNTER_KEY) | Check if there's a value in Storage for `counter` | 1 | 0,134,23,0,0 | 0,134,23,0,0 at ptr 0 && value 0 for `counter`|
| 3 | ext_get_storage(1) | Read from memory at first byte of COUNTER_KEY () as u32 | | 0,134,23,0,0 | 0,134,23,0,0 at ptr 0|



