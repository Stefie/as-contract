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

    // Call the WASM square function 
    const incremented = document.createElement('div')
    incremented.textContent = `${a} squared results in ${exports.call(a)}`;
    document.querySelector('main')!.appendChild(incremented)
    console.log(`${a} squared results in ${exports.call(a)}`)
  }).catch(console.error);

