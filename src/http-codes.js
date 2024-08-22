const failIf = (condition, message) => {
	if (!condition) {
		return;
	}

	console.error(message);
	process.exit(1);
};

const lookUp = process.argv[2];
failIf(!lookUp, 'Please provide an HTTP code');

const HttpStatus = new Map([
	[200, [200, 'OK', 'The request has succeeded.']],
	[201, [201, 'CREATED', 'The request has been fulfilled and resulted in a new resource being created.']],
	[204, [204, 'NO_CONTENT', 'The server successfully processed the request and is not returning any content.']],
	[400, [400, 'BAD_REQUEST', 'The server could not understand the request due to invalid syntax.']],
	[401, [401, 'UNAUTHORIZED', 'The client must authenticate itself to get the requested response.']],
	[403, [403, 'FORBIDDEN', 'The client does not have access rights to the content.']],
	[404, [404, 'NOT_FOUND', 'The server can not find the requested resource.']],
	[409, [409, 'CONFLICT', 'The request could not be completed due to a conflict with the current state of the resource.']],
	[500, [500, 'INTERNAL_SERVER_ERROR', 'The server has encountered a situation it does not know how to handle.']],
]);

const httpStatus = HttpStatus.get(Number(lookUp));

failIf(!httpStatus, 'Unknown HTTP code');

const [code, keyName, description] = httpStatus;

console.log(code, keyName);
console.log(description);
