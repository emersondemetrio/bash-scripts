const codes = require('./http-codes.json');

const failIf = (condition, message) => {
	if (!condition) {
		return;
	}

	console.error(message);
	process.exit(1);
};

const lookUp = process.argv[2];
const asJson = !!process.argv[3];

failIf(!lookUp, 'Please specify an HTTP status code');

const getHttpStatus = (code) => {
	const key = Object.keys(codes).find((key) => codes[key].code == code);
	return codes[key];
};

const httpStatus = getHttpStatus(lookUp);

failIf(!httpStatus, `Unknown HTTP code ${lookUp}`);

const { code, message, description } = httpStatus;

if (asJson) {
	console.log(JSON.stringify(httpStatus, null, 2));
	process.exit();
}

console.log(code, message);
console.log(description);
