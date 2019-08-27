// class Incrementer {
//   constructor(
//     public current: i32;
//   ) {}
// }

export const A : i32 = 2424

export function deploy(a : i32, b: i32): i32 {
  // instantiate().initialize_into(()).flush()
  return privateFunction(a, b)
}

export function call(a : i32): i32 {
  // 	let input = ContractEnv::input();
  // 	let action = Action::decode(&mut &input[..]).unwrap();
  // 	let mut incrementer = instantiate();
  // 	match action {
  // 		Action::Get => {
  // 			let returned_val = &incrementer.get();
  // 			// println!("CALL: identified get() and returned {:?}", returned_val);
  // 			ret(&returned_val)
  // 		}
  // 		Action::Inc(by) => {
  // 			// println!("CALL: identified inc({:?})", by);
  // 			incrementer.inc(by);
  // 			incrementer.flush();
  // 		}
  // 	}
  return a * a
}

const PRIVATE_CONST = 555

function privateFunction(a : i32, b: i32): i32 {
  return a + b + PRIVATE_CONST
}