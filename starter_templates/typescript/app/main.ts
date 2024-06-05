console.log("$ ")
let input = (await console[Symbol.asyncIterator]().next()).value;
console.log(input)

export {};