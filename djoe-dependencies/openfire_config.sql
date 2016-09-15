
--
--
-- This file is a database snapshot used to reconfigure Openfire,
-- specially REST API plugin
--
--
--
--
--
--
--

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ofbookmark; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE ofbookmark (
    bookmarkid integer NOT NULL,
    bookmarktype character varying(50) NOT NULL,
    bookmarkname character varying(255) NOT NULL,
    bookmarkvalue character varying(1024) NOT NULL,
    isglobal integer NOT NULL
);


ALTER TABLE public.ofbookmark OWNER TO postgres;

--
-- Name: ofbookmarkperm; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE ofbookmarkperm (
    bookmarkid integer NOT NULL,
    bookmarktype smallint NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.ofbookmarkperm OWNER TO postgres;

--
-- Name: ofbookmarkprop; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE ofbookmarkprop (
    bookmarkid integer NOT NULL,
    name character varying(100) NOT NULL,
    propvalue text NOT NULL
);


ALTER TABLE public.ofbookmarkprop OWNER TO postgres;

--
-- Name: ofextcomponentconf; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE ofextcomponentconf (
    subdomain character varying(255) NOT NULL,
    wildcard integer NOT NULL,
    secret character varying(255),
    permission character varying(10) NOT NULL
);


ALTER TABLE public.ofextcomponentconf OWNER TO postgres;

--
-- Name: ofgroup; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE ofgroup (
    groupname character varying(50) NOT NULL,
    description character varying(255)
);


ALTER TABLE public.ofgroup OWNER TO postgres;

--
-- Name: ofgroupprop; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE ofgroupprop (
    groupname character varying(50) NOT NULL,
    name character varying(100) NOT NULL,
    propvalue text NOT NULL
);


ALTER TABLE public.ofgroupprop OWNER TO postgres;

--
-- Name: ofgroupuser; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE ofgroupuser (
    groupname character varying(50) NOT NULL,
    username character varying(100) NOT NULL,
    administrator integer NOT NULL
);


ALTER TABLE public.ofgroupuser OWNER TO postgres;

--
-- Name: ofid; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE ofid (
    idtype integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.ofid OWNER TO postgres;

--
-- Name: ofmucaffiliation; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE ofmucaffiliation (
    roomid integer NOT NULL,
    jid character varying(1024) NOT NULL,
    affiliation integer NOT NULL
);


ALTER TABLE public.ofmucaffiliation OWNER TO postgres;

--
-- Name: ofmucconversationlog; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE ofmucconversationlog (
    roomid integer NOT NULL,
    sender character varying(1024) NOT NULL,
    nickname character varying(255),
    logtime character(15) NOT NULL,
    subject character varying(255),
    body text
);


ALTER TABLE public.ofmucconversationlog OWNER TO postgres;

--
-- Name: ofmucmember; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE ofmucmember (
    roomid integer NOT NULL,
    jid character varying(1024) NOT NULL,
    nickname character varying(255),
    firstname character varying(100),
    lastname character varying(100),
    url character varying(100),
    email character varying(100),
    faqentry character varying(100)
);


ALTER TABLE public.ofmucmember OWNER TO postgres;

--
-- Name: ofmucroom; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE ofmucroom (
    serviceid integer NOT NULL,
    roomid integer NOT NULL,
    creationdate character(15) NOT NULL,
    modificationdate character(15) NOT NULL,
    name character varying(50) NOT NULL,
    naturalname character varying(255) NOT NULL,
    description character varying(255),
    lockeddate character(15) NOT NULL,
    emptydate character(15),
    canchangesubject integer NOT NULL,
    maxusers integer NOT NULL,
    publicroom integer NOT NULL,
    moderated integer NOT NULL,
    membersonly integer NOT NULL,
    caninvite integer NOT NULL,
    roompassword character varying(50),
    candiscoverjid integer NOT NULL,
    logenabled integer NOT NULL,
    subject character varying(100),
    rolestobroadcast integer NOT NULL,
    usereservednick integer NOT NULL,
    canchangenick integer NOT NULL,
    canregister integer NOT NULL
);


ALTER TABLE public.ofmucroom OWNER TO postgres;

--
-- Name: ofmucroomprop; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE ofmucroomprop (
    roomid integer NOT NULL,
    name character varying(100) NOT NULL,
    propvalue text NOT NULL
);


ALTER TABLE public.ofmucroomprop OWNER TO postgres;

--
-- Name: ofmucservice; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE ofmucservice (
    serviceid integer NOT NULL,
    subdomain character varying(255) NOT NULL,
    description character varying(255),
    ishidden integer NOT NULL
);


ALTER TABLE public.ofmucservice OWNER TO postgres;

--
-- Name: ofmucserviceprop; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE ofmucserviceprop (
    serviceid integer NOT NULL,
    name character varying(100) NOT NULL,
    propvalue text NOT NULL
);


ALTER TABLE public.ofmucserviceprop OWNER TO postgres;

--
-- Name: ofoffline; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE ofoffline (
    username character varying(64) NOT NULL,
    messageid integer NOT NULL,
    creationdate character(15) NOT NULL,
    messagesize integer NOT NULL,
    stanza text NOT NULL
);


ALTER TABLE public.ofoffline OWNER TO postgres;

--
-- Name: ofpresence; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE ofpresence (
    username character varying(64) NOT NULL,
    offlinepresence text,
    offlinedate character varying(15) NOT NULL
);


ALTER TABLE public.ofpresence OWNER TO postgres;

--
-- Name: ofprivacylist; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE ofprivacylist (
    username character varying(64) NOT NULL,
    name character varying(100) NOT NULL,
    isdefault integer NOT NULL,
    list text NOT NULL
);


ALTER TABLE public.ofprivacylist OWNER TO postgres;

--
-- Name: ofprivate; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE ofprivate (
    username character varying(64) NOT NULL,
    name character varying(100) NOT NULL,
    namespace character varying(200) NOT NULL,
    privatedata text NOT NULL
);


ALTER TABLE public.ofprivate OWNER TO postgres;

--
-- Name: ofproperty; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE ofproperty (
    name character varying(100) NOT NULL,
    propvalue character varying(4000) NOT NULL
);


ALTER TABLE public.ofproperty OWNER TO postgres;

--
-- Name: ofpubsubaffiliation; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE ofpubsubaffiliation (
    serviceid character varying(100) NOT NULL,
    nodeid character varying(100) NOT NULL,
    jid character varying(1024) NOT NULL,
    affiliation character varying(10) NOT NULL
);


ALTER TABLE public.ofpubsubaffiliation OWNER TO postgres;

--
-- Name: ofpubsubdefaultconf; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE ofpubsubdefaultconf (
    serviceid character varying(100) NOT NULL,
    leaf integer NOT NULL,
    deliverpayloads integer NOT NULL,
    maxpayloadsize integer NOT NULL,
    persistitems integer NOT NULL,
    maxitems integer NOT NULL,
    notifyconfigchanges integer NOT NULL,
    notifydelete integer NOT NULL,
    notifyretract integer NOT NULL,
    presencebased integer NOT NULL,
    senditemsubscribe integer NOT NULL,
    publishermodel character varying(15) NOT NULL,
    subscriptionenabled integer NOT NULL,
    accessmodel character varying(10) NOT NULL,
    language character varying(255),
    replypolicy character varying(15),
    associationpolicy character varying(15) NOT NULL,
    maxleafnodes integer NOT NULL
);


ALTER TABLE public.ofpubsubdefaultconf OWNER TO postgres;

--
-- Name: ofpubsubitem; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE ofpubsubitem (
    serviceid character varying(100) NOT NULL,
    nodeid character varying(100) NOT NULL,
    id character varying(100) NOT NULL,
    jid character varying(1024) NOT NULL,
    creationdate character(15) NOT NULL,
    payload text
);


ALTER TABLE public.ofpubsubitem OWNER TO postgres;

--
-- Name: ofpubsubnode; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE ofpubsubnode (
    serviceid character varying(100) NOT NULL,
    nodeid character varying(100) NOT NULL,
    leaf integer NOT NULL,
    creationdate character(15) NOT NULL,
    modificationdate character(15) NOT NULL,
    parent character varying(100),
    deliverpayloads integer NOT NULL,
    maxpayloadsize integer,
    persistitems integer,
    maxitems integer,
    notifyconfigchanges integer NOT NULL,
    notifydelete integer NOT NULL,
    notifyretract integer NOT NULL,
    presencebased integer NOT NULL,
    senditemsubscribe integer NOT NULL,
    publishermodel character varying(15) NOT NULL,
    subscriptionenabled integer NOT NULL,
    configsubscription integer NOT NULL,
    accessmodel character varying(10) NOT NULL,
    payloadtype character varying(100),
    bodyxslt character varying(100),
    dataformxslt character varying(100),
    creator character varying(1024) NOT NULL,
    description character varying(255),
    language character varying(255),
    name character varying(50),
    replypolicy character varying(15),
    associationpolicy character varying(15),
    maxleafnodes integer
);


ALTER TABLE public.ofpubsubnode OWNER TO postgres;

--
-- Name: ofpubsubnodegroups; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE ofpubsubnodegroups (
    serviceid character varying(100) NOT NULL,
    nodeid character varying(100) NOT NULL,
    rostergroup character varying(100) NOT NULL
);


ALTER TABLE public.ofpubsubnodegroups OWNER TO postgres;

--
-- Name: ofpubsubnodejids; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE ofpubsubnodejids (
    serviceid character varying(100) NOT NULL,
    nodeid character varying(100) NOT NULL,
    jid character varying(1024) NOT NULL,
    associationtype character varying(20) NOT NULL
);


ALTER TABLE public.ofpubsubnodejids OWNER TO postgres;

--
-- Name: ofpubsubsubscription; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE ofpubsubsubscription (
    serviceid character varying(100) NOT NULL,
    nodeid character varying(100) NOT NULL,
    id character varying(100) NOT NULL,
    jid character varying(1024) NOT NULL,
    owner character varying(1024) NOT NULL,
    state character varying(15) NOT NULL,
    deliver integer NOT NULL,
    digest integer NOT NULL,
    digest_frequency integer NOT NULL,
    expire character(15),
    includebody integer NOT NULL,
    showvalues character varying(30) NOT NULL,
    subscriptiontype character varying(10) NOT NULL,
    subscriptiondepth integer NOT NULL,
    keyword character varying(200)
);


ALTER TABLE public.ofpubsubsubscription OWNER TO postgres;

--
-- Name: ofremoteserverconf; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE ofremoteserverconf (
    xmppdomain character varying(255) NOT NULL,
    remoteport integer,
    permission character varying(10) NOT NULL
);


ALTER TABLE public.ofremoteserverconf OWNER TO postgres;

--
-- Name: ofroster; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE ofroster (
    rosterid integer NOT NULL,
    username character varying(64) NOT NULL,
    jid character varying(1024) NOT NULL,
    sub integer NOT NULL,
    ask integer NOT NULL,
    recv integer NOT NULL,
    nick character varying(255)
);


ALTER TABLE public.ofroster OWNER TO postgres;

--
-- Name: ofrostergroups; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE ofrostergroups (
    rosterid integer NOT NULL,
    rank integer NOT NULL,
    groupname character varying(255) NOT NULL
);


ALTER TABLE public.ofrostergroups OWNER TO postgres;

--
-- Name: ofsaslauthorized; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE ofsaslauthorized (
    username character varying(64) NOT NULL,
    principal character varying(4000) NOT NULL
);


ALTER TABLE public.ofsaslauthorized OWNER TO postgres;

--
-- Name: ofsecurityauditlog; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE ofsecurityauditlog (
    msgid integer NOT NULL,
    username character varying(64) NOT NULL,
    entrystamp bigint NOT NULL,
    summary character varying(255) NOT NULL,
    node character varying(255) NOT NULL,
    details text
);


ALTER TABLE public.ofsecurityauditlog OWNER TO postgres;

--
-- Name: ofuser; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE ofuser (
    username character varying(64) NOT NULL,
    storedkey character varying(32),
    serverkey character varying(32),
    salt character varying(32),
    iterations integer,
    plainpassword character varying(32),
    encryptedpassword character varying(255),
    name character varying(100),
    email character varying(100),
    creationdate character(15) NOT NULL,
    modificationdate character(15) NOT NULL
);


ALTER TABLE public.ofuser OWNER TO postgres;

--
-- Name: ofuserflag; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE ofuserflag (
    username character varying(64) NOT NULL,
    name character varying(100) NOT NULL,
    starttime character(15),
    endtime character(15)
);


ALTER TABLE public.ofuserflag OWNER TO postgres;

--
-- Name: ofuserprop; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE ofuserprop (
    username character varying(64) NOT NULL,
    name character varying(100) NOT NULL,
    propvalue text NOT NULL
);


ALTER TABLE public.ofuserprop OWNER TO postgres;

--
-- Name: ofvcard; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE ofvcard (
    username character varying(64) NOT NULL,
    vcard text NOT NULL
);


ALTER TABLE public.ofvcard OWNER TO postgres;

--
-- Name: ofversion; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE ofversion (
    name character varying(50) NOT NULL,
    version integer NOT NULL
);


ALTER TABLE public.ofversion OWNER TO postgres;

--
-- Data for Name: ofbookmark; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ofbookmark (bookmarkid, bookmarktype, bookmarkname, bookmarkvalue, isglobal) FROM stdin;
\.


--
-- Data for Name: ofbookmarkperm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ofbookmarkperm (bookmarkid, bookmarktype, name) FROM stdin;
\.


--
-- Data for Name: ofbookmarkprop; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ofbookmarkprop (bookmarkid, name, propvalue) FROM stdin;
\.


--
-- Data for Name: ofextcomponentconf; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ofextcomponentconf (subdomain, wildcard, secret, permission) FROM stdin;
\.


--
-- Data for Name: ofgroup; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ofgroup (groupname, description) FROM stdin;
\.


--
-- Data for Name: ofgroupprop; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ofgroupprop (groupname, name, propvalue) FROM stdin;
\.


--
-- Data for Name: ofgroupuser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ofgroupuser (groupname, username, administrator) FROM stdin;
\.


--
-- Data for Name: ofid; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ofid (idtype, id) FROM stdin;
\.


--
-- Data for Name: ofmucaffiliation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ofmucaffiliation (roomid, jid, affiliation) FROM stdin;
\.


--
-- Data for Name: ofmucconversationlog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ofmucconversationlog (roomid, sender, nickname, logtime, subject, body) FROM stdin;
\.


--
-- Data for Name: ofmucmember; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ofmucmember (roomid, jid, nickname, firstname, lastname, url, email, faqentry) FROM stdin;
\.


--
-- Data for Name: ofmucroom; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ofmucroom (serviceid, roomid, creationdate, modificationdate, name, naturalname, description, lockeddate, emptydate, canchangesubject, maxusers, publicroom, moderated, membersonly, caninvite, roompassword, candiscoverjid, logenabled, subject, rolestobroadcast, usereservednick, canchangenick, canregister) FROM stdin;
\.


--
-- Data for Name: ofmucroomprop; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ofmucroomprop (roomid, name, propvalue) FROM stdin;
\.


--
-- Data for Name: ofmucservice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ofmucservice (serviceid, subdomain, description, ishidden) FROM stdin;
1	conference	\N	0
\.


--
-- Data for Name: ofmucserviceprop; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ofmucserviceprop (serviceid, name, propvalue) FROM stdin;
\.


--
-- Data for Name: ofoffline; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ofoffline (username, messageid, creationdate, messagesize, stanza) FROM stdin;
\.


--
-- Data for Name: ofpresence; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ofpresence (username, offlinepresence, offlinedate) FROM stdin;
\.


--
-- Data for Name: ofprivacylist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ofprivacylist (username, name, isdefault, list) FROM stdin;
\.


--
-- Data for Name: ofprivate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ofprivate (username, name, namespace, privatedata) FROM stdin;
\.


--
-- Data for Name: ofproperty; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ofproperty (name, propvalue) FROM stdin;
passwordKey	2szOuB94Rri7LRc
provider.admin.className	org.jivesoftware.openfire.admin.DefaultAdminProvider
xmpp.domain	heydjoe.xmpp
provider.auth.className	org.jivesoftware.openfire.auth.DefaultAuthProvider
provider.lockout.className	org.jivesoftware.openfire.lockout.DefaultLockOutProvider
provider.group.className	org.jivesoftware.openfire.group.DefaultGroupProvider
provider.vcard.className	org.jivesoftware.openfire.vcard.DefaultVCardProvider
provider.securityAudit.className	org.jivesoftware.openfire.security.DefaultSecurityAuditProvider
provider.user.className	org.jivesoftware.openfire.user.DefaultUserProvider
adminConsole.port	9090
adminConsole.securePort	9091
locale	en
stream.management.active	true
stream.management.requestFrequency	5
connectionProvider.className	org.jivesoftware.database.DefaultConnectionProvider
database.defaultProvider.driver	org.postgresql.Driver
database.defaultProvider.serverURL	jdbc:postgresql://localhost:5432/openfire
database.defaultProvider.username	a05cfafbefea3e6d92a2362b2c418b7b688f9bdc797ddd5487a11f38c498ac50
database.defaultProvider.password	0c3254052ad2285fdf14edd9451bb14ba62fba6a56e258acf2e6e5dc8a5a0697
database.defaultProvider.testSQL	select 1
database.defaultProvider.testBeforeUse	false
database.defaultProvider.testAfterUse	false
database.defaultProvider.minConnections	5
database.defaultProvider.maxConnections	25
database.defaultProvider.connectionTimeout	1.0
setup	true
sasl.scram-sha-1.iteration-count	4096
xmpp.session.conflict-limit	0
xmpp.socket.ssl.keystore	/opt/openfire/resources/security/keystore
xmpp.socket.ssl.keypass	O3ZgYmC9
xmpp.socket.ssl.truststore	/opt/openfire/resources/security/truststore
xmpp.socket.ssl.trustpass	changeit
xmpp.socket.ssl.client.keystore	/opt/openfire/resources/security/keystore
xmpp.socket.ssl.client.keypass	O3ZgYmC9
xmpp.socket.ssl.client.truststore	/opt/openfire/resources/security/truststore
xmpp.socket.ssl.client.trustpass	changeit
xmpp.bosh.ssl.client.keystore	/opt/openfire/resources/security/keystore
xmpp.bosh.ssl.client.keypass	O3ZgYmC9
xmpp.bosh.ssl.client.truststore	/opt/openfire/resources/security/truststore
xmpp.bosh.ssl.client.trustpass	changeit
xmpp.component.keystore	/opt/openfire/resources/security/keystore
xmpp.component.keypass	O3ZgYmC9
xmpp.component.truststore	/opt/openfire/resources/security/truststore
xmpp.component.trustpass	changeit
xmpp.multiplex.keystore	/opt/openfire/resources/security/keystore
xmpp.multiplex.keypass	O3ZgYmC9
xmpp.multiplex.truststore	/opt/openfire/resources/security/truststore
xmpp.multiplex.trustpass	changeit
plugin.restapi.secret	ztR2yJWNRu9ffPIw
httpbind.CORS.enabled	true
httpbind.CORS.domains	*
xmpp.socket.plain.active	false
xmpp.client.idle.ping	true
xmpp.client.idle	120000
xmpp.server.socket.active	false
xmpp.component.socket.active	false
xmpp.component.ssl.active	false
xmpp.multiplex.socket.active	false
httpbind.forwarded.enabled	true
register.inband	false
register.password	false
plugin.restapi.enabled	true
plugin.restapi.httpAuth	secret
plugin.restapi.customAuthFilter	null
update.lastCheck	1473166952019
xmpp.httpbind.scriptSyntax.enabled	true
httpbind.enabled	true
mediaproxy.idleTimeout	60000
mediaproxy.lifetime	9000
mediaproxy.enabled	true
mediaproxy.portMin	10000
mediaproxy.portMax	20000
mediaproxy.echoPort	10020
xmpp.socket.ssl.active	true
xmpp.auth.anonymous	true
\.


--
-- Data for Name: ofpubsubaffiliation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ofpubsubaffiliation (serviceid, nodeid, jid, affiliation) FROM stdin;
\.


--
-- Data for Name: ofpubsubdefaultconf; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ofpubsubdefaultconf (serviceid, leaf, deliverpayloads, maxpayloadsize, persistitems, maxitems, notifyconfigchanges, notifydelete, notifyretract, presencebased, senditemsubscribe, publishermodel, subscriptionenabled, accessmodel, language, replypolicy, associationpolicy, maxleafnodes) FROM stdin;
\.


--
-- Data for Name: ofpubsubitem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ofpubsubitem (serviceid, nodeid, id, jid, creationdate, payload) FROM stdin;
\.


--
-- Data for Name: ofpubsubnode; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ofpubsubnode (serviceid, nodeid, leaf, creationdate, modificationdate, parent, deliverpayloads, maxpayloadsize, persistitems, maxitems, notifyconfigchanges, notifydelete, notifyretract, presencebased, senditemsubscribe, publishermodel, subscriptionenabled, configsubscription, accessmodel, payloadtype, bodyxslt, dataformxslt, creator, description, language, name, replypolicy, associationpolicy, maxleafnodes) FROM stdin;
\.


--
-- Data for Name: ofpubsubnodegroups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ofpubsubnodegroups (serviceid, nodeid, rostergroup) FROM stdin;
\.


--
-- Data for Name: ofpubsubnodejids; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ofpubsubnodejids (serviceid, nodeid, jid, associationtype) FROM stdin;
\.


--
-- Data for Name: ofpubsubsubscription; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ofpubsubsubscription (serviceid, nodeid, id, jid, owner, state, deliver, digest, digest_frequency, expire, includebody, showvalues, subscriptiontype, subscriptiondepth, keyword) FROM stdin;
\.


--
-- Data for Name: ofremoteserverconf; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ofremoteserverconf (xmppdomain, remoteport, permission) FROM stdin;
\.


--
-- Data for Name: ofroster; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ofroster (rosterid, username, jid, sub, ask, recv, nick) FROM stdin;
\.


--
-- Data for Name: ofrostergroups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ofrostergroups (rosterid, rank, groupname) FROM stdin;
\.


--
-- Data for Name: ofsaslauthorized; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ofsaslauthorized (username, principal) FROM stdin;
\.


--
-- Data for Name: ofsecurityauditlog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ofsecurityauditlog (msgid, username, entrystamp, summary, node, details) FROM stdin;
\.


--
-- Data for Name: ofuser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ofuser (username, storedkey, serverkey, salt, iterations, plainpassword, encryptedpassword, name, email, creationdate, modificationdate) FROM stdin;
\.


--
-- Data for Name: ofuserflag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ofuserflag (username, name, starttime, endtime) FROM stdin;
\.


--
-- Data for Name: ofuserprop; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ofuserprop (username, name, propvalue) FROM stdin;
\.


--
-- Data for Name: ofvcard; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ofvcard (username, vcard) FROM stdin;
\.


--
-- Data for Name: ofversion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ofversion (name, version) FROM stdin;
openfire	22
clientcontrol	0
\.


--
-- Name: ofbookmark_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY ofbookmark
    ADD CONSTRAINT ofbookmark_pk PRIMARY KEY (bookmarkid);


--
-- Name: ofbookmarkperm_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY ofbookmarkperm
    ADD CONSTRAINT ofbookmarkperm_pk PRIMARY KEY (bookmarkid, name, bookmarktype);


--
-- Name: ofbookmarkprop_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY ofbookmarkprop
    ADD CONSTRAINT ofbookmarkprop_pk PRIMARY KEY (bookmarkid, name);


--
-- Name: ofextcomponentconf_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY ofextcomponentconf
    ADD CONSTRAINT ofextcomponentconf_pk PRIMARY KEY (subdomain);


--
-- Name: ofgroup_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY ofgroup
    ADD CONSTRAINT ofgroup_pk PRIMARY KEY (groupname);


--
-- Name: ofgroupprop_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY ofgroupprop
    ADD CONSTRAINT ofgroupprop_pk PRIMARY KEY (groupname, name);


--
-- Name: ofgroupuser_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY ofgroupuser
    ADD CONSTRAINT ofgroupuser_pk PRIMARY KEY (groupname, username, administrator);


--
-- Name: ofid_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY ofid
    ADD CONSTRAINT ofid_pk PRIMARY KEY (idtype);


--
-- Name: ofmucaffiliation_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY ofmucaffiliation
    ADD CONSTRAINT ofmucaffiliation_pk PRIMARY KEY (roomid, jid);


--
-- Name: ofmucmember_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY ofmucmember
    ADD CONSTRAINT ofmucmember_pk PRIMARY KEY (roomid, jid);


--
-- Name: ofmucroom_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY ofmucroom
    ADD CONSTRAINT ofmucroom_pk PRIMARY KEY (serviceid, name);


--
-- Name: ofmucroomprop_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY ofmucroomprop
    ADD CONSTRAINT ofmucroomprop_pk PRIMARY KEY (roomid, name);


--
-- Name: ofmucservice_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY ofmucservice
    ADD CONSTRAINT ofmucservice_pk PRIMARY KEY (subdomain);


--
-- Name: ofmucserviceprop_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY ofmucserviceprop
    ADD CONSTRAINT ofmucserviceprop_pk PRIMARY KEY (serviceid, name);


--
-- Name: ofoffline_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY ofoffline
    ADD CONSTRAINT ofoffline_pk PRIMARY KEY (username, messageid);


--
-- Name: ofpresence_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY ofpresence
    ADD CONSTRAINT ofpresence_pk PRIMARY KEY (username);


--
-- Name: ofprivacylist_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY ofprivacylist
    ADD CONSTRAINT ofprivacylist_pk PRIMARY KEY (username, name);


--
-- Name: ofprivate_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY ofprivate
    ADD CONSTRAINT ofprivate_pk PRIMARY KEY (username, name, namespace);


--
-- Name: ofproperty_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY ofproperty
    ADD CONSTRAINT ofproperty_pk PRIMARY KEY (name);


--
-- Name: ofpubsubaffiliation_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY ofpubsubaffiliation
    ADD CONSTRAINT ofpubsubaffiliation_pk PRIMARY KEY (serviceid, nodeid, jid);


--
-- Name: ofpubsubdefaultconf_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY ofpubsubdefaultconf
    ADD CONSTRAINT ofpubsubdefaultconf_pk PRIMARY KEY (serviceid, leaf);


--
-- Name: ofpubsubitem_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY ofpubsubitem
    ADD CONSTRAINT ofpubsubitem_pk PRIMARY KEY (serviceid, nodeid, id);


--
-- Name: ofpubsubnode_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY ofpubsubnode
    ADD CONSTRAINT ofpubsubnode_pk PRIMARY KEY (serviceid, nodeid);


--
-- Name: ofpubsubnodejids_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY ofpubsubnodejids
    ADD CONSTRAINT ofpubsubnodejids_pk PRIMARY KEY (serviceid, nodeid, jid);


--
-- Name: ofpubsubsubscription_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY ofpubsubsubscription
    ADD CONSTRAINT ofpubsubsubscription_pk PRIMARY KEY (serviceid, nodeid, id);


--
-- Name: ofremoteserverconf_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY ofremoteserverconf
    ADD CONSTRAINT ofremoteserverconf_pk PRIMARY KEY (xmppdomain);


--
-- Name: ofroster_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY ofroster
    ADD CONSTRAINT ofroster_pk PRIMARY KEY (rosterid);


--
-- Name: ofrostergroups_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY ofrostergroups
    ADD CONSTRAINT ofrostergroups_pk PRIMARY KEY (rosterid, rank);


--
-- Name: ofsaslauthorized_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY ofsaslauthorized
    ADD CONSTRAINT ofsaslauthorized_pk PRIMARY KEY (username, principal);


--
-- Name: ofsecurityauditlog_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY ofsecurityauditlog
    ADD CONSTRAINT ofsecurityauditlog_pk PRIMARY KEY (msgid);


--
-- Name: ofuser_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY ofuser
    ADD CONSTRAINT ofuser_pk PRIMARY KEY (username);


--
-- Name: ofuserflag_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY ofuserflag
    ADD CONSTRAINT ofuserflag_pk PRIMARY KEY (username, name);


--
-- Name: ofuserprop_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY ofuserprop
    ADD CONSTRAINT ofuserprop_pk PRIMARY KEY (username, name);


--
-- Name: ofvcard_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY ofvcard
    ADD CONSTRAINT ofvcard_pk PRIMARY KEY (username);


--
-- Name: ofversion_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY ofversion
    ADD CONSTRAINT ofversion_pk PRIMARY KEY (name);


--
-- Name: ofmucconversationlog_time_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace:
--

CREATE INDEX ofmucconversationlog_time_idx ON ofmucconversationlog USING btree (logtime);


--
-- Name: ofmucroom_roomid_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace:
--

CREATE INDEX ofmucroom_roomid_idx ON ofmucroom USING btree (roomid);


--
-- Name: ofmucroom_serviceid_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace:
--

CREATE INDEX ofmucroom_serviceid_idx ON ofmucroom USING btree (serviceid);


--
-- Name: ofmucservice_serviceid_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace:
--

CREATE INDEX ofmucservice_serviceid_idx ON ofmucservice USING btree (serviceid);


--
-- Name: ofprivacylist_default_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace:
--

CREATE INDEX ofprivacylist_default_idx ON ofprivacylist USING btree (username, isdefault);


--
-- Name: ofpubsubnodegroups_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace:
--

CREATE INDEX ofpubsubnodegroups_idx ON ofpubsubnodegroups USING btree (serviceid, nodeid);


--
-- Name: ofroster_jid_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace:
--

CREATE INDEX ofroster_jid_idx ON ofroster USING btree (jid);


--
-- Name: ofroster_username_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace:
--

CREATE INDEX ofroster_username_idx ON ofroster USING btree (username);


--
-- Name: ofrostergroups_rosterid_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace:
--

CREATE INDEX ofrostergroups_rosterid_idx ON ofrostergroups USING btree (rosterid);


--
-- Name: ofsecurityauditlog_tstamp_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace:
--

CREATE INDEX ofsecurityauditlog_tstamp_idx ON ofsecurityauditlog USING btree (entrystamp);


--
-- Name: ofsecurityauditlog_uname_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace:
--

CREATE INDEX ofsecurityauditlog_uname_idx ON ofsecurityauditlog USING btree (username);


--
-- Name: ofuser_cdate_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace:
--

CREATE INDEX ofuser_cdate_idx ON ofuser USING btree (creationdate);


--
-- Name: ofuserflag_etime_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace:
--

CREATE INDEX ofuserflag_etime_idx ON ofuserflag USING btree (endtime);


--
-- Name: ofuserflag_stime_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace:
--

CREATE INDEX ofuserflag_stime_idx ON ofuserflag USING btree (starttime);


--
-- Name: ofrostergroups_rosterid_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ofrostergroups
    ADD CONSTRAINT ofrostergroups_rosterid_fk FOREIGN KEY (rosterid) REFERENCES ofroster(rosterid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

