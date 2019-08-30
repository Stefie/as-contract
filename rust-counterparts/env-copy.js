const util = require('util');
const fs = require('fs');
// var source = fs.readFileSync('./target/ink_balances_bug.wasm');
var source = fs.readFileSync('./target/wasm32-unknown-unknown/release/delegator.wasm');

var memory = new WebAssembly.Memory({
    initial: 2,
    maximum: 16,
});

var scratchBuf = [];

function readString(ptr, len) {
    const view = new Uint8Array(memory.buffer);
  
  
    // `subarray` uses the same underlying ArrayBuffer as the view
    const subarr = view.subarray(ptr, ptr + len);
    const buf = new Uint8Array(subarr);
    const str = (new TextDecoder()).decode(buf); // (utf-8 by default)
  
    return str;
  }

const env = {
    memory: memory,
    "ext_derp": function() {
     },
    "ext_scratch_size": function() {
        return scratchBuf.length;
    },
    "ext_scratch_read": function(ptr, offset, len) {
        console.log("ext_scratch_read(ptr=", ptr, ", offset=", offset, ", len=", len, ")");
        var mem = new Uint8Array(memory.buffer);
        for (var i = 0; i < len; i++) {
            mem[ptr + i] = scratchBuf[i];
        }
    },
    "ext_balance": function() {
        console.log("ext_balance");
        scratchBuf = [0, 0, 32, 59, 157, 181, 5, 111, 0, 0, 0, 0, 0, 0, 0, 0];
    },
    "ext_scratch_write": function(ptr, len) {
        console.log("ext_scratch_write");
        var mem = new Uint8Array(memory.buffer);
        scratchBuf = [];

        for (var i = 0; i < len; i++) {
            scratchBuf.push(mem[ptr + i]);
        }
    },
    "ext_println": function(ptr, len) {
        console.log("ext_println: ", ptr, len);
        let str = readString(ptr, len);
        console.log("println: ", str);
    },
    "ext_create": function() { throw "unimplemented"; },
    "ext_call": function() { throw "unimplemented"; },
    "ext_get_storage": function() { throw "unimplemented"; },
    "ext_set_storage": function() { throw "unimplemented"; }
};

var typedArray = new Uint8Array(source);

WebAssembly.instantiate(typedArray, { env: env }).then(result => {
    console.log("instantiated", result);
    
    scratchBuf = [
        42, 0, 0, 0,
        1, 2, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 5, 0, 0, 0, 0, 6, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1
    ];
	result.instance.exports['deploy']();

	console.log(scratchBuf);
});