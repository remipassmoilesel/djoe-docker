/**
 *
 *  STAT SERVER CONFIGURATION
 *
 *
 * {{%%HTTP-DOMAIN%%}} and {{%%XMPP-DOMAIN%%}} will be replaced by parameters found in djoe-docker-config.sh
 *
 *
 */
module.exports = (function() {

  var DEV_MODE = false;

  var configuration = {

    /**
     * Port to listen
     */
    PORT : 3000,

    /**
     * Database settings
     */
    PG_USER : "postgres",
    PG_SECRET : "postgres",
    PG_DATABASE : "Stats",
    PG_PORT : "5432",

    /**
     * Authorization header value
     */
    AUTHORIZATION : "DK5I4-0yl9N2KN64Pg5YcEAsdnCXeamr",

    /**
     * Cross origin policy settings
     */
    ACCES_CONTROL_ALLOW_ORIGN : "*",
    ACCESS_CONTROL_ALLOW_HEADERS : "Origin, X-Requested-With, Content-Type, Accept, Authorization",

    /**
     * CLIENT CONFIGURATION
     */

    /**
     * Root url. Without trailing slash. You can specify a port here.
     */
    DESTINATION_URL : "https://{{%%HTTP-DOMAIN%%}}/stats"
  };
  
  return configuration;

})();