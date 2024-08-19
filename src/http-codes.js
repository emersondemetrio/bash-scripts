const code = process.argv[2];

if (!code) {
	console.error('Please provide an HTTP code');
	process.exit(1);
}

const HttpCodes = {
	OK: 200,
	CREATED: 201,
	NO_CONTENT: 204,
	BAD_REQUEST: 400,
	UNAUTHORIZED: 401,
	FORBIDDEN: 403,
	NOT_FOUND: 404,
	CONFLICT: 409,
	INTERNAL_SERVER_ERROR: 500,
};

const keyName = Object.keys(HttpCodes).find(
	(key) => HttpCodes[key] === Number(code)
);

if (!keyName) {
	console.error('Unknown HTTP code');
	process.exit(1);
}

const HttpCodeDescriptions = {
	[HttpCodes.OK]: 'The request has succeeded.',
	[HttpCodes.CREATED]:
		'The request has been fulfilled and resulted in a new resource being created.',
	[HttpCodes.NO_CONTENT]:
		'The server successfully processed the request and is not returning any content.',
	[HttpCodes.BAD_REQUEST]:
		'The server could not understand the request due to invalid syntax.',
	[HttpCodes.UNAUTHORIZED]:
		'The client must authenticate itself to get the requested response.',
	[HttpCodes.FORBIDDEN]:
		'The client does not have access rights to the content.',
	[HttpCodes.NOT_FOUND]: 'The server can not find the requested resource.',
	[HttpCodes.CONFLICT]:
		'The request could not be completed due to a conflict with the current state of the resource.',
	[HttpCodes.INTERNAL_SERVER_ERROR]:
		'The server has encountered a situation it does not know how to handle.',
};

console.log(code, keyName);
console.log(HttpCodeDescriptions[code]);
