const round2 = (num) => Math.round(num * 100) / 100;

const hoursToDays = (hours) => round2(hours / 24);
const hoursToSeconds = (hours) => round2(hours * 60 * 60);
const hoursToMinutes = (hours) => round2(hours * 60);

const secondsToMinutes = (seconds) => round2(seconds / 60);
const secondsToHours = (seconds) => round2(seconds / 60 / 60);
const secondsToDays = (seconds) => round2(seconds / 60 / 60 / 24);

const millisecondsToSeconds = (ms) => round2(ms / 1000);

const minutesToSeconds = (minutes) => round2(minutes * 60);
const minutesToHours = (minutes) => round2(minutes / 60);

const toSecondsConversion = (time) => {
	// Handle non-numeric input
	if (isNaN(time)) {
		return -1;
	}

	// Calculate the time in seconds for each unit
	const minutesInS = time * 60;
	const hoursInS = time * 60 * 60;
	const daysInS = time * 24 * 60 * 60;
	const weeksInS = time * 7 * 24 * 60 * 60;
	const monthsInS = time * 30 * 24 * 60 * 60;

	// Array of time units and their corresponding values and expressions
	const timeUnits = [
		['Minutes in S', minutesInS, `${time} * 60`],
		['Hours in S', hoursInS, `${time} * 60 * 60`],
		['Days in S', daysInS, `${time} * 24 * 60 * 60`],
		['Weeks in S', weeksInS, `${time} * 7 * 24 * 60 * 60`],
		['Months in S', monthsInS, `${time} * 30 * 24 * 60 * 60`],
	];

	// Format the output as a string with each time unit
	return timeUnits
		.map(
			([key, value, exp]) => `> ${time} ${key}:  \t${value} s \t(${exp})`
		)
		.join('\n');
};

const toMillisecondsConversion = (time) => {
	// Handle non-numeric input
	if (isNaN(time)) {
		return -1;
	}

	// Calculate the time in milliseconds for each unit
	const secondsInMS = time * 1000;
	const minutesInMS = time * 60 * 1000;
	const hoursInMS = time * 60 * 60 * 1000;
	const daysInMS = time * 24 * 60 * 60 * 1000;
	const weeksInMS = time * 7 * 24 * 60 * 60 * 1000;
	const monthsInMS = time * 30 * 24 * 60 * 60 * 1000;

	// Array of time units and their corresponding values and expressions
	const timeUnits = [
		['Seconds in MS', secondsInMS, `${time} * 1000`],
		['Minutes in MS', minutesInMS, `${time} * 60 * 1000`],
		['Hours in MS', hoursInMS, `${time} * 60 * 60 * 1000`],
		['Days in MS', daysInMS, `${time} * 24 * 60 * 60 * 1000`],
		['Weeks in MS', weeksInMS, `${time} * 7 * 24 * 60 * 60 * 1000`],
		['Months in MS', monthsInMS, `${time} * 30 * 24 * 60 * 60 * 1000`],
	];

	// Format the output as a string with each time unit
	return timeUnits
		.map(
			([key, value, exp]) => `> ${time} ${key}:  \t${value} ms \t(${exp})`
		)
		.join('\n');
};

const daysToWeeks = (days) => round2(days / 7);
const daysToMonths = (days) => round2(days / 30);

const weeksToDays = (weeks) => round2(weeks * 7);
const weeksToMonths = (weeks) => round2(weeks / 4);

const summary = (time) => {
	console.log(`
Input: ${time}

> Second conversion
> ${input} Seconds to Minutes : ${secondsToMinutes(time)} m
> ${input} Seconds to Hours   : ${secondsToHours(time)} h
> ${input} Seconds to Days    : ${secondsToDays(time)} d
_____________________________________________________
> MS Conversion

> ${input} MS      to Seconds : ${millisecondsToSeconds(time)} s

> TO Seconds Conversion
${toSecondsConversion(time)}

_____________________________________________________

> TO Milliseconds Conversion
${toMillisecondsConversion(time)}
_____________________________________________________
> Minutes conversion

> ${input} Minutes to Seconds : ${minutesToSeconds(time)} s
> ${input} Minutes to Hours   : ${minutesToHours(time)} h
_____________________________________________________
> Hours conversion

> ${input} Hours   to Seconds : ${hoursToSeconds(time)} s
> ${input} Hours   to Minutes : ${hoursToMinutes(time)} m
_____________________________________________________
> Days conversion

> ${input} Hours   to Days    : ${hoursToDays(time)} d
> ${input} Days    to Weeks   : ${daysToWeeks(time)} w
> ${input} Days    to Months  : ${daysToMonths(time)} m
_____________________________________________________
> Weeks conversion

> ${input} Weeks   to Days    : ${weeksToDays(time)} d
> ${input} Weeks   to Months  : ${weeksToMonths(time)} m
`);
};

let input = 0;

if (typeof Deno !== 'undefined') {
	input = Deno.args[0];
} else {
	input = process.argv[2];
}

input = parseInt(input);

if (typeof input === 'number' && !isNaN(input)) {
	summary(input);
} else {
	console.error('Please provide a valid numeric input.');
	console.info(`Example Usage: time-conversion 60`);
}

// deno compile time-conversion.js
