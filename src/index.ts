fetch('./build/optimized.wasm')
  .then(response => {
    if (response.ok){
      return response.arrayBuffer();
    } 
    throw new Error(`Unable to fetch Web Assembly file.`);
  })
  .then(bytes => {
    return WebAssembly.instantiate(bytes, {
      env: {
        abort: function() {}
      }
    })
  })
  .then(results => {
    const exports = results.instance.exports;

    const a: number = exports.A.valueOf();
    const b: number = 1313;

    // Call the WASM add function 
    const added = document.createElement('div')
    added.textContent = `${a} + ${b} + 555 results in ${exports.deploy(a,b)}`;
    document.querySelector('main')!.appendChild(added)
    console.log(`${a} + ${b} plus 555 results in ${exports.deploy(a,b)}`)

     // Call the WASM square function 
    const incremented = document.createElement('div')
    incremented.textContent = `${a} squared results in ${exports.call(a)}`;
    document.querySelector('main')!.appendChild(incremented)
    console.log(`${a} squared results in ${exports.call(a)}`)
  }).catch(console.error);

