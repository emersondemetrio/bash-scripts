const total = process.argv[2];
const percent = process.argv[3];

const mode = process.argv[4];

if (!total || !percent || isNaN(total) || isNaN(percent)) {
	console.log('Please provide a total and a percent');
	process.exit();
}

const modes = {
	p: (y, N) => `Q: how much is ${y}% of ${N}?`,
	t: (y, N) => `Q: x is ${y}% of ${N}, what is x?`,
};

console.log(`\n`);
console.log(modes[mode || 'p'](percent, total), '\n');

if (!mode || mode === 'p') {
	const result = (percent / total) * 100;
	console.log(`> ${percent} is ${result}% of ${total}`);
}

if (mode === 't') {
	const result = (percent / 100) * total;
	console.log(`> ${percent}% of ${total} is ${result}`);
	console.log(`> ${total} - ${result} = ${total - result}`);
}
console.log(`\n`);
