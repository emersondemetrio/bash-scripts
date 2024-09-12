const roundIn = (num, withDecimals = 2) => num.toFixed(withDecimals);

const explain = (time, timeUnits) => {
	return timeUnits
		.map(([key, value, exp]) => `> ${time} ${key}:  \t${value} \t(${exp})`)
		.join('\n');
};

const milliSecondsConversion = (time) => {
	const secondsInMS = time * 1000;
	const minutesInMS = time * 60 * 1000;
	const hoursInMS = time * 60 * 60 * 1000;
	const daysInMS = time * 24 * 60 * 60 * 1000;
	const weeksInMS = time * 7 * 24 * 60 * 60 * 1000;
	const monthsInMS = time * 30 * 24 * 60 * 60 * 1000;
	const millisecondsToSeconds = roundIn(time / 1000, 3);

	const timeUnits = [
		['Seconds in MS', secondsInMS, `${time} * 1000`],
		['Minutes in MS', minutesInMS, `${time} * 60 * 1000`],
		['Hours in MS', hoursInMS, `${time} * 60 * 60 * 1000`],
		['Days in MS', daysInMS, `${time} * 24 * 60 * 60 * 1000`],
		['Weeks in MS', weeksInMS, `${time} * 7 * 24 * 60 * 60 * 1000`],
		['Months in MS', monthsInMS, `${time} * 30 * 24 * 60 * 60 * 1000`],
		['MS to S', millisecondsToSeconds, `${time} / 1000`],
	];

	return explain(time, timeUnits);
};

const secondsConversion = (time) => {
	const minutesInS = time * 60;
	const hoursInS = time * 60 * 60;
	const daysInS = time * 24 * 60 * 60;
	const weeksInS = time * 7 * 24 * 60 * 60;
	const monthsInS = time * 30 * 24 * 60 * 60;

	const secondsToMinutes = roundIn(time / 60);
	const secondsToHours = roundIn(time / 60 / 60);
	const secondsToDays = roundIn(time / 60 / 60 / 24, 3);

	const timeUnits = [
		['Minutes in S', minutesInS, `${time} * 60`],
		['Hours in S', hoursInS, `${time} * 60 * 60`],
		['Days in S', daysInS, `${time} * 24 * 60 * 60`],
		['Weeks in S', weeksInS, `${time} * 7 * 24 * 60 * 60`],
		['Months in S', monthsInS, `${time} * 30 * 24 * 60 * 60`],

		['Seconds in M', secondsToMinutes, `${time} / 60`],
		['Seconds in H', secondsToHours, `${time} / 60 / 60`],
		['Seconds in D', secondsToDays, `${time} / 60 / 60 / 24`],
	];

	return explain(time, timeUnits);
};

const minutesConversion = (time) => {
	const minutesToSeconds = roundIn(time * 60);
	const minutesToHours = roundIn(time / 60);
	const minutesToDays = roundIn(time / 60 / 24);

	const timeUnits = [
		['Minutes in S', minutesToSeconds, `${time} * 60`],
		['Minutes in H', minutesToHours, `${time} / 60`],
		['Minutes in D', minutesToDays, `${time} / 60 / 24`],
	];

	return explain(time, timeUnits);
};

const hoursConversion = (time) => {
	const hoursToDays = roundIn(time / 24);
	const hoursToSeconds = roundIn(time * 60 * 60);
	const hoursToMinutes = roundIn(time * 60);

	const timeUnits = [
		['Hours in D', hoursToDays, `${time} / 24`],
		['Hours in M', hoursToMinutes, `${time} * 60`],
		['Hours in S', hoursToSeconds, `${time} * 60 * 60`],
	];

	return explain(time, timeUnits);
};

const daysConversion = (time) => {
	const daysToWeeks = roundIn(time / 7);
	const daysToMonths = roundIn(time / 30);

	const timeUnits = [
		['Days in W', daysToWeeks, `${time} / 7`],
		['Days in Mo', daysToMonths, `${time} / 30`],
	];

	return explain(time, timeUnits);
};

const weeksConversion = (time) => {
	const weeksToDays = roundIn(time * 7);
	const weeksToMonths = roundIn(time / 4);

	const timeUnits = [
		['Weeks in D', weeksToDays, `${time} * 7`],
		['Weeks in Mo', weeksToMonths, `${time} / 4`],
	];

	return explain(time, timeUnits);
};

const available = ['h', 's', 'm', 'ms', 's', 'd', 'w', 'all'];

const unitFnMap = {
	ms: milliSecondsConversion,

	s: secondsConversion,
	m: minutesConversion,
	h: hoursConversion,

	d: daysConversion,
	w: weeksConversion,
	all: (time) => {
		const ms = milliSecondsConversion(time);
		const s = secondsConversion(time);
		const m = minutesConversion(time);
		const h = hoursConversion(time);
		const d = daysConversion(time);
		const w = weeksConversion(time);

		return `${ms}\n\n${s}\n\n${m}\n\n${h}\n\n${d}\n\n${w}`;
	},
};

const summary = (time, unit) => {
	console.log(`Time: ${time} \tUnit: ${unit}\n`);

	if (!available.includes(unit)) {
		console.error('Invalid unit provided.');
		console.info(`Available units: ${available.join(', ')}`);
		return;
	}

	console.log(unitFnMap[unit](time));
};

let input = 0;
let unit = '';

// Deno stuff
if (typeof Deno !== 'undefined') {
	input = Deno.args[0];
	unit = Deno.args[1];
} else {
	input = process.argv[2];
	unit = process.argv[3];
}

input = parseInt(input);

if (typeof input === 'number' && !isNaN(input)) {
	summary(input, unit ?? 'ms');
} else {
	console.error('Please provide a valid numeric input.');
	console.info(`Example Usage: time-conversion 60 ms`);
	console.info(`Available units: [${available.join(', ')}]\n`);
}

// deno compile time-conversion.js
