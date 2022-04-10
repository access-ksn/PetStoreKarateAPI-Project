function fn() {    
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
	myVarName: 'someValue',
	baseurl: 'https://petstore.swagger.io',
	baseUrl: 'https://jsonplaceholder.typicode.com',
	baseURL: 'https://gorest.co.in',
	tokenID: 'd5d9aee68a1c84c77c34794da5811bec8c399baa433132eb719ccd3a145a62f3'
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }
  return config;
}

