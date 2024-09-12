#!/usr/local/bin/node

const removeMultipleDashes = (s) => s.replace(/-+/g, '-');

const replaceSpacesWith = (s, r = '-') => s.toLowerCase().replace(/\s/g, r);

const dashAll = (...all) => all.map(replaceSpacesWith).join('-');

// [ 'bin', 'this-file.js', ...everything-else ]
const args = process.argv.slice(2);

console.log(removeMultipleDashes(dashAll(...args)));
