/**
 * Initiation of XMPP client
 *
 * {{%%HTTP-DOMAIN%%}} and {{%%XMPP-DOMAIN%%}} will be replaced by parameters found in djoe-docker-config.sh
 *
 *
 */

$(function() {

  "use strict";

  jsxc.debug("Initializing instant messaging");

  // etherpad resource
  var etherpadRes = "https://{{%%HTTP-DOMAIN%%}}/etherpad/";

  // clientName
  var xmppResource = "heyDjoe";

  // jsxc debug mode
  // be careful, before init local storage use may throw exceptions
  if (jsxc.isLocalStorageAvailable() === true) {
    jsxc.storage.setItem('debug', false);
  }

  /**
   *   Initialization options for JSXC
   */

  var options = {

    // in french
    defaultLang : 'fr',

    autoLang : false,

    // REST support
    rest : {
      apiName : "openfire",
      apiBaseUrl : "https://{{%%HTTP-DOMAIN%%}}/openfire-rest",
      apiKey : "ztR2yJWNRu9ffPIw"
    },

    // enable Etherpad support
    etherpad : {
      enabled : true,

      ressource : etherpadRes
    },

    // MUST specify muc server to avoid errors
    muc : {
      server : "conference.{{%%XMPP-DOMAIN%%}}"
    },

    favicon : {
      enable : false
    },

    // xmpp options
    xmpp : {
      url : "https://{{%%HTTP-DOMAIN%%}}/http-bind/",
      domain : "{{%%XMPP-DOMAIN%%}}",
      resource : xmppResource,
      overwrite : true,
      searchDomain : "search.{{%%XMPP-DOMAIN%%}}",
    },

    // disable otr because of display disturbing
    otr : {
      enable : false
    },

    // if lot of 404 errors precise jsxc root
    root : 'jsxc/build',

    // stat module. save and monitor events
    stats : {
      enabled : true,
      destinationUrl : "https://{{%%HTTP-DOMAIN%%}}/stats",
      autosend : true,
      authorization : "DK5I4-0yl9N2KN64Pg5YcEAsdnCXeamr"
    },

    // RTCPeerConfiguration used for audio/video calls.
    RTCPeerConfig : {
      url : 'turnCredentials.json'
    }

  };

  // initialisation
  jsxc.init(options);

});

