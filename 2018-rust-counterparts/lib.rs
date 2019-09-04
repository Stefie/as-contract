/// Copied from https://github.com/pepyakin/substrate-contracts-adder
#![feature(alloc_error_handler)]
#![feature(core_intrinsics)]
#![feature(alloc)]

#![no_std]

#[macro_use]
extern crate parity_codec_derive;
extern crate parity_codec as codec;
extern crate wee_alloc;

#[macro_use]
extern crate alloc;

use core::intrinsics;
use codec::{Encode, Decode};

mod ext;

/// Use `wee_alloc` as the global allocator.
/// IN AS:
/// https://docs.assemblyscript.org/details/memory
/// import memory vs. export memory
/// https://docs.assemblyscript.org/details/runtime
#[global_allocator]
static ALLOC: wee_alloc::WeeAlloc = wee_alloc::WeeAlloc::INIT;

/// In AS, but not needed
/// https://webassembly.github.io/spec/core/appendix/index-instructions.html
#[panic_handler]
#[no_mangle]
pub fn panic(_info: &::core::panic::PanicInfo) -> ! {
	unsafe {
		intrinsics::abort()
	}
}

/// In AS:
/// none not nullable
#[alloc_error_handler]
pub extern fn oom(_: ::core::alloc::Layout) -> ! {
	unsafe {
		intrinsics::abort();
	}
}

/// Inc = 0 0xca 0xfe 0xba 0xbe
/// Get = 1
/// Inc(42) -> 0x00 0x2a 0x00 0x00 0x00, because it is little endian
#[derive(Encode, Decode)]
enum Action {
    Inc(u32),
    Get,
}

// [0x01, 0x01, ..., 0x01]
static COUNTER_KEY: ext::Key = ext::Key([1; 32]);

#[no_mangle]
pub extern "C" fn call() { /// return 0 in call
    let input = ext::input(); /// scratch buffer filled with initial data
    let action = Action::decode(&mut &input[..]).unwrap();

    match action {
        Action::Inc(by) => {
            let mut counter = ext::get_storage(&COUNTER_KEY).and_then(|v| u32::decode(&mut &v[..])).unwrap_or(0);
            counter += by;
            ext::set_storage(&COUNTER_KEY, Some(&u32::encode(&counter)));
        }
        Action::Get => {
            let raw_counter = ext::get_storage(&COUNTER_KEY).unwrap_or(vec![]);
            ext::return_(&raw_counter);
        }
    }
}

// We need to define `deploy` function, so the wasm-build will produce a constructor binary.
#[no_mangle]
pub extern "C" fn deploy() {
}
