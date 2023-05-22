function fn() {

  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'prod';} //default when karate.env not set

  var config = {
    env: env,
    baseUrl: 'https://localhost:8080',
    authUrl: 'https://localhost:8080',
    userName: 'userName',
    password: 'password'
  };

    if (env == 'dev') {
        config.myVarName = "dev";
        config.baseUrl = 'https://api-pde-blue.dev.us-hearth-dev.azure.lnrsg.io/pdeapi/v1/check-provider';
        }
    else if (env == 'nonprod') {
        config.baseUrlOrgReport = 'http://10.176.68.218:8713/WsHealthcare/OrganizationReport?&ver_=2.7';
        config.baseUrlOrgSearch = 'http://10.176.68.218:8713/WsHealthcare/OrganizationSearch?&ver_=2.7';
        config.baseUrlProviderReport = 'http://10.176.68.218:8713/WsHealthcare/ProviderReport?&ver_=2.7';
        config.authurl = 'http://10.176.68.218:8713/WsHealthcare/'
        config.userName = 'vpingali_esp03@hcar';
        config.password = 'Lexis2022#';
        }
    else if (env == 'uat') {
        config.baseUrlOrgReport = 'http://172.16.70.41:8713/WsHealthcare/OrganizationReport?&ver_=2.7';
        config.baseUrlOrgSearch = 'http://172.16.70.41:8713/WsHealthcare/OrganizationSearch?&ver_=2.7';
        config.baseUrlProviderReport = 'http://172.16.70.41:8713/WsHealthcare/ProviderReport?&ver_=2.7';
        config.authurl = 'http://172.16.70.41:8713/WsHealthcare/'
        config.userName = 'vpingali_esp03';
        config.password = 'Lexis2022#';
      }
    else if (env == 'prod') {
        config.baseUrlOrgReport = 'http://172.16.70.150:8713/WsHealthcare/OrganizationReport?&ver_=2.7';
        config.baseUrlOrgSearch = 'http://172.16.70.150:8713/WsHealthcare/OrganizationSearch?&ver_=2.7';
        config.baseUrlProviderReport = 'http://172.16.70.150:8713/WsHealthcare/ProviderReport?&ver_=2.7';
        config.authurl = 'http://172.16.70.150:8713/WsHealthcare/'
        config.userName = 'vpingali_esp03';
        config.password = 'Lexis2022#';
      }
  var config_post = {
    headers_esp:({
    'Content-Type': 'application/x-www-form-urlencoded',
    'Accept': '*/*'
  }
  )
 }

  return config;

}
