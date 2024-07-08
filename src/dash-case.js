#!/usr/local/bin/node
console.clear();
const dashAll = (...args) =>
	args.map((s) => s.toLowerCase().replace(/\s/g, '-')).join('-');

console.log(dashAll(...process.argv.slice(2)));
