const codes = require('./http-codes.json');

const failIf = (condition, message) => {
	if (!condition) {
		return;
	}

	console.error(message);
	process.exit(1);
};

const lookUp = process.argv[2];
failIf(!lookUp, 'Please provide an HTTP code');

const getHttpStatus = (code) => {
	const key = Object.keys(codes).find((key) => codes[key].code == code);
	return codes[key];
};

const httpStatus = getHttpStatus(lookUp);

failIf(!httpStatus, 'Unknown HTTP code');

const { code, message, description } = httpStatus;

console.log(code, message);
console.log(description);
