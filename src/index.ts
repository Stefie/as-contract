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
    const instance = results.instance;

    const a: number = 75;
    const b: number = 36;

    // Call the WASM add function 
    const added = document.createElement('div')
    added.textContent = `${a} + ${b} results in ${instance.exports.add(a,b)}`;
    document.querySelector('main')!.appendChild(added)
    console.log(`${a} + ${b} results in ${instance.exports.add(a,b)}`)

     // Call the WASM square function 
    const incremented = document.createElement('div')
    incremented.textContent = `${a} squared results in ${instance.exports.square(a)}`;
    document.querySelector('main')!.appendChild(incremented)
    console.log(`${a} squared results in ${instance.exports.square(a)}`)
  }).catch(console.error);

