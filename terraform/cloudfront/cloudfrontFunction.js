function handler(event) {
	if (event == null || event.response == null) {
		return;
	}

	var response = event.response;
	var headers = response.headers;

	// Set HTTP security headers
	// Since JavaScript doesn't allow for hyphens in variable names, we use the dict["key"] notation
	headers['strict-transport-security'] = { value: 'max-age=63072000; includeSubdomains; preload' };

	return response;
}