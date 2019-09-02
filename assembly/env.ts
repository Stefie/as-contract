// Declaration of imported functions from substrate srml-contracts
// 
// We're using these module function declarations in our lib.ts file
// If these functions are not used by our AssemblyScript module, they will not be included 
// in the compiled wat ans wasm files. 


export declare function ext_get_storage(key_ptr: i32): i32;

// dest_ptr - memory pointer
// offset - typically 0, specifies the offset where we will start copying,
// len - typically `ext_input_size`.
export declare function ext_input_copy(dest_ptr: i32, offset: i32, len: i32): void;
export declare function ext_input_size(): i32;
export declare function ext_return(data_ptr: i32, data_len: i32): void;
export declare function ext_scratch_size(): i32;
export declare function ext_scratch_copy(dest_ptr: i32, offset: i32, len: i32): void;
export declare function ext_set_storage(key_ptr: i32, value_non_null: i32, value_ptr: i32, value_len: i32): void;