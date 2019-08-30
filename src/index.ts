import { ASUtil, ImportsObject, instantiateStreaming } from 'assemblyscript/lib/loader'

// @FIXME !!!  https://github.com/AssemblyScript/assemblyscript/blob/master/lib/loader/index.d.ts

type TypedArray
  = Int8Array
  | Uint8Array
  | Uint8ClampedArray
  | Int16Array
  | Uint16Array
  | Int32Array
  | Uint32Array
  | Float32Array
  | Float64Array;

interface Contract extends ASUtil {
  /** An 8-bit signed integer view on the memory. */
  readonly I8: Uint8Array;
  /** An 8-bit unsigned integer view on the memory. */
  readonly U8: Uint8Array;
  /** A 16-bit signed integer view on the memory. */
  readonly I16: Uint16Array;
  /** A 16-bit unsigned integer view on the memory. */
  readonly U16: Uint16Array;
  /** A 32-bit signed integer view on the memory. */
  readonly I32: Uint32Array;
  /** A 32-bit unsigned integer view on the memory. */
  readonly U32: Uint32Array;
  /** A 64-bit signed integer view on the memory. */
  readonly I64: any; // BigInt64Array
  /** A 64-bit unsigned integer vieww on the memory. */
  readonly U64: any; // BigUint64Array
  /** A 32-bit float view on the memory. */
  readonly F32: Float32Array;
  /** A 64-bit float view on the memory. */
  readonly F64: Float64Array;
  /** Explicit start function, if requested. */
  __start(): void;
  /** Allocates a new string in the module's memory and returns a reference (pointer) to it. */
  __allocString(str: string): number;
  /** Reads (copies) the value of a string from the module's memory. */
  __getString(ref: number): string;
  /** Allocates a new array in the module's memory and returns a reference (pointer) to it. */
  __allocArray(id: number, values: number[]): number;
  /** Reads (copies) the values of an array from the module's memory. */
  __getArray(ref: number): number[];
  /** Gets a view on the values of an array in the module's memory. */
  __getArrayView(ref: number): TypedArray;
  /** Retains a reference externally, making sure that it doesn't become collected prematurely. Returns the reference. */
  __retain(ref: number): number;
  /** Releases a previously retained reference to an object, allowing the runtime to collect it once its reference count reaches zero. */
  __release(ref: number): void;
  /** Allocates an instance of the class represented by the specified id. */
  __alloc(size: number, id: number): number;
  /** Tests whether an object is an instance of the class represented by the specified base id. */
  __instanceof(ref: number, baseId: number): boolean;  
  /** Forces a cycle collection. Only relevant if objects potentially forming reference cycles are used. */
  __collect(): void;
  call(): void;
  delpoy(): void;
}

interface ContractEnv extends ImportsObject {
  env?: {
    memory?: WebAssembly.Memory,
    table?: WebAssembly.Table,
    abort?: (msg: number, file: number, line: number, column: number) => void,
    trace?: (msg: number, numArgs?: number, ...args: any[]) => void,
    ext_get_storage(ptr: number): void, 
    ext_input_size(): number,
    ext_input_copy(ptr: number, offset: number, len: number): void,
  }
}

const memory = new WebAssembly.Memory({
  initial: 2,
  maximum: 16,
});

const env: ContractEnv = {
  env: {
    memory: memory,
    ext_get_storage: function (ptr: number) {
      console.log('ext_get_storage', ptr )
    }, 
    ext_input_size: function() {
      console.log('ext_input_size', scratchBuf.length )
      return scratchBuf.length;
    },
    ext_input_copy: function(ptr: number, offset: number, len: number) {
      console.log(`ext_scratch_read(ptr=${ptr}, offset=${offset}, len="${len})`);
      let mem = new Uint8Array(memory.buffer);
      for (var i = 0; i < len; i++) {
          mem[ptr + i] = scratchBuf[i];
      }
    }
  }
};

let scratchBuf: any = [];

async function main() {
  const module = await instantiateStreaming(fetch('./build/untouched.wasm'), env as ContractEnv) as ContractEnv;

  console.log(module)
  module.call()

  console.log(module.ext_input_size())

  const memory = module.memory;
  // Create a Uint8Array to give us access to Wasm Memory
  const wasmByteMemoryArray = new Uint8Array(memory.buffer);
  // Let's read index zero from JS, to make sure Wasm wrote to
  // wasm memory, and JS can read the "passed" value from Wasm
  console.log(wasmByteMemoryArray[44]); // Should Log "115".
};

main();