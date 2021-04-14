--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12
-- Dumped by pg_dump version 10.12

-- Started on 2021-04-01 15:18:22

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5 (class 2615 OID 49199)
-- Name: REHABNOW; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "REHABNOW";


ALTER SCHEMA "REHABNOW" OWNER TO postgres;

--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2942 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 214 (class 1259 OID 49861)
-- Name: app_patient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_patient (
    patient_id character varying(20) NOT NULL,
    physiotherapist_id character varying NOT NULL
);


ALTER TABLE public.app_patient OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 49853)
-- Name: app_physiotherapist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_physiotherapist (
    physiotherapist_id character varying(20) NOT NULL
);


ALTER TABLE public.app_physiotherapist OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 49745)
-- Name: app_snippet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_snippet (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    title character varying(100) NOT NULL,
    code text NOT NULL,
    linenos boolean NOT NULL,
    language character varying(100) NOT NULL,
    style character varying(100) NOT NULL,
    highlighted text NOT NULL,
    owner_id character varying(20) NOT NULL
);


ALTER TABLE public.app_snippet OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 49743)
-- Name: app_snippet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_snippet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_snippet_id_seq OWNER TO postgres;

--
-- TOC entry 2943 (class 0 OID 0)
-- Dependencies: 202
-- Name: app_snippet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_snippet_id_seq OWNED BY public.app_snippet.id;


--
-- TOC entry 201 (class 1259 OID 49733)
-- Name: app_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_user (
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    id character varying(20) NOT NULL,
    email character varying(254) NOT NULL,
    address text NOT NULL,
    city character varying(50) NOT NULL,
    country character varying(50) NOT NULL,
    created_dt timestamp with time zone NOT NULL,
    dob date NOT NULL,
    first_name character varying(50) NOT NULL,
    gender character varying(10) NOT NULL,
    ic_passport character varying(20) NOT NULL,
    last_name character varying(100) NOT NULL,
    nationality character varying(50) NOT NULL,
    phone_num character varying(20) NOT NULL,
    postcode character varying(10) NOT NULL,
    state character varying(50) NOT NULL,
    status character varying(50) NOT NULL,
    photo character varying(50) NOT NULL,
    is_admin boolean
);


ALTER TABLE public.app_user OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 49929)
-- Name: app_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999999999999999
    CACHE 1;


ALTER TABLE public.app_user_id_seq OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 49798)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 49796)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- TOC entry 2944 (class 0 OID 0)
-- Dependencies: 208
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 211 (class 1259 OID 49808)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 49806)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 2945 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 207 (class 1259 OID 49790)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 49788)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- TOC entry 2946 (class 0 OID 0)
-- Dependencies: 206
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 205 (class 1259 OID 49765)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id character varying(20) NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 49763)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- TOC entry 2947 (class 0 OID 0)
-- Dependencies: 204
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 200 (class 1259 OID 49725)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 49723)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- TOC entry 2948 (class 0 OID 0)
-- Dependencies: 199
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 198 (class 1259 OID 49714)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 49712)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- TOC entry 2949 (class 0 OID 0)
-- Dependencies: 197
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 212 (class 1259 OID 49840)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- TOC entry 2733 (class 2604 OID 49748)
-- Name: app_snippet id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_snippet ALTER COLUMN id SET DEFAULT nextval('public.app_snippet_id_seq'::regclass);


--
-- TOC entry 2737 (class 2604 OID 49801)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 2738 (class 2604 OID 49811)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2736 (class 2604 OID 49793)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 2734 (class 2604 OID 49768)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 2732 (class 2604 OID 49728)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 2731 (class 2604 OID 49717)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 2933 (class 0 OID 49861)
-- Dependencies: 214
-- Data for Name: app_patient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_patient (patient_id, physiotherapist_id) FROM stdin;
orangeleopard415	blacklion325
ticklishostrich232	blacklion325
tinygoose481	blacklion325
organicswan953	blacklion325
whitemouse909	blacklion325
organicelephant468	bluefrog586
sadlion942	bluefrog586
silvermeercat422	bluefrog586
organicgoose741	bluefrog586
silverbear987	bluefrog586
tinyrabbit192	bluekoala549
whiteleopard834	bluekoala549
yellowrabbit780	bluekoala549
goldensnake205	blueswan928
purplefrog658	blueswan928
purpleleopard511	blueswan928
goldenfrog380	bluetiger674
tinymouse176	bluetiger674
crazygoose969	bluetiger674
lazypeacock712	brownbear657
lazyostrich883	brownbear657
heavyleopard345	brownbear657
whitezebra768	brownbear657
brownmeercat584	brownbear657
whitecat417	angrybutterfly553
yellowdog143	angrybutterfly553
crazysnake728	angrybutterfly553
tinyfrog115	angrybutterfly553
redladybug844	angrybutterfly553
smallgorilla483	angrysnake461
purplerabbit787	angrysnake461
goldenpanda951	angrysnake461
crazycat462	angrysnake461
goldenpeacock163	angrysnake461
orangewolf364	angrysnake867
lazylion549	angrysnake867
goldenfish239	angrysnake867
happyduck812	angrysnake867
goldengorilla472	angrysnake867
silvergoose488	angrysnake867
redkoala686	angrysnake867
orangeduck900	beautifulgorilla420
redbutterfly321	beautifulgorilla420
redgoose399	beautifulgorilla420
smallwolf131	beautifulgorilla420
redkoala858	beautifulgorilla420
greendog116	beautifulgorilla420
lazyfish785	beautifulgorilla420
happykoala372	beautifulladybug415
yellowtiger157	beautifulladybug415
smallbear422	beautifulladybug415
purplegoose731	beautifulladybug415
crazylion949	beautifulladybug415
purplebear949	beautifulladybug415
crazydog177	beautifulladybug415
greenkoala230	bigbutterfly969
whitelion201	bigfish600
redbutterfly800	blackgorilla254
goldenladybug341	blackgorilla254
whitebear107	blackgorilla254
silvercat361	blackgorilla254
goldenfrog252	blackgorilla254
greenkoala661	blackgorilla254
brownlion105	blackgorilla254
organicdog442	blackgorilla254
greenlion767	blackgorilla254
tinypanda427	blackgorilla254
tinybutterfly967	blackgorilla254
goldenpeacock476	blackgorilla254
orangebutterfly809	blackgorilla254
yellowzebra927	blackgorilla254
heavywolf609	blackgorilla254
brownsnake101	blackgorilla254
goldencat607	blackgorilla254
smallgoose334	blackgorilla254
sadmouse783	blackgorilla254
heavysnake141	blackgorilla254
whitepeacock173	bluekoala549
redbear467	bluekoala549
ticklishkoala945	bluekoala549
\.


--
-- TOC entry 2932 (class 0 OID 49853)
-- Dependencies: 213
-- Data for Name: app_physiotherapist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_physiotherapist (physiotherapist_id) FROM stdin;
angrybutterfly553
angryleopard130
angryrabbit476
angrysnake461
angrysnake867
beautifulgorilla420
beautifulladybug415
bigbutterfly969
bigfish600
bigfrog236
bigostrich965
bigpeacock243
blackgorilla254
blackladybug851
blacklion325
bluefrog586
bluekoala549
blueswan928
bluetiger674
brownbear657
\.


--
-- TOC entry 2922 (class 0 OID 49745)
-- Dependencies: 203
-- Data for Name: app_snippet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_snippet (id, created, title, code, linenos, language, style, highlighted, owner_id) FROM stdin;
\.


--
-- TOC entry 2920 (class 0 OID 49733)
-- Dependencies: 201
-- Data for Name: app_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_user (password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) FROM stdin;
pbkdf2_sha256$216000$0uG4EpR0KhRW$nP67AoXp+R2/A+qcm5CZtkGOfT1JuadKjPsZUvCdOV4=	2021-03-03 00:00:00+08	whitemouse909	whitemouse909@rehabnow.com	Baselaarsstraat	Krommenie	Netherlands	2007-10-27 04:29:09.419+08	1978-04-13	Lammie	female	59057664	Schopman	NL	(639)-120-2443	14535	Zeeland	active	https://randomuser.me/api/portraits/women/51.jpg	f
pbkdf2_sha256$216000$aWtRwXbE5Ey0$c/tI4Va/XlZ1nj+UdW6MP9zqC3u9KHVA/2hfeCk2GMU=	2021-03-03 00:00:00+08	tinyrabbit192	tinyrabbit192@rehabnow.com	Mill Road	Armagh	United Kingdom	2014-06-20 12:08:26.815+08	1974-11-08	Rosie	female	MK 74 45 87 V	Parker	GB	019467 45994	N8 4TP	West Sussex	active	https://randomuser.me/api/portraits/women/35.jpg	f
pbkdf2_sha256$216000$q0svybMSocvN$u6c5SDXJp9bwXDqvWCwVwIfcaOcmONPmxjl8mNtTKi4=	2021-03-03 00:00:00+08	angrysnake867	angrysnake867@rehabnow.com	Mariagervej	Ryslinge	Denmark	2014-03-04 19:43:29.462+08	1985-05-15	Sara	female	150585-2484	Petersen	DK	48410320	74219	Syddanmark	active	https://randomuser.me/api/portraits/women/63.jpg	f
pbkdf2_sha256$216000$VQ6J4lrryWB1$5R698SP1+vVYVQLfFVSeYMVg2kjw0wWB3LY3uLSjib4=	2021-03-03 00:00:00+08	organicelephant468	organicelephant468@rehabnow.com	North Street	Exeter	United Kingdom	2009-12-24 21:56:25.849+08	1990-12-21	Alexandra	female	AA 40 66 10 W	Garcia	GB	017687 72356	ZR56 8XS	Cheshire	active	https://randomuser.me/api/portraits/women/54.jpg	f
pbkdf2_sha256$216000$vI0pCemxFK8z$un91yscXvTVL32iZ+aE/pyjPnBWrfZlxXsxOJ9K7TqY=	2021-03-03 00:00:00+08	orangeleopard415	orangeleopard415@rehabnow.com	Rue des Écoles	Mulhouse	France	2009-06-14 14:27:17.902+08	1964-01-09	Tom	male	1NNaN34003353 93	Thomas	FR	03-30-82-44-74	79797	Cher	active	https://randomuser.me/api/portraits/men/38.jpg	f
pbkdf2_sha256$216000$r5O9VzgSA62E$1J2K0kVbHFGe9IbEyTgzDsFS9B76xtnRiR25QhzbG/k=	2021-03-03 00:00:00+08	ticklishostrich232	ticklishostrich232@rehabnow.com	Hickory Creek Dr	Dumas	United States	2003-07-25 13:40:50.311+08	1990-01-24	Maxine	female	466-44-1892	Carlson	US	(853)-147-1324	93500	California	active	https://randomuser.me/api/portraits/women/31.jpg	f
pbkdf2_sha256$216000$PLm7vUtAs178$XeizEpTeLBXlY+wDVpVFyslbXtg3+VToU7TZoZRxRwQ=	2021-03-03 00:00:00+08	sadlion942	sadlion942@rehabnow.com	Korkeavuorenkatu	Sotkamo	Finland	2014-04-24 23:53:17.458+08	1982-01-10	Sofia	female	NaNNA812undefined	Hamalainen	FI	05-819-865	86964	South Karelia	active	https://randomuser.me/api/portraits/women/58.jpg	f
pbkdf2_sha256$216000$MpAoRwe4YsQ6$W5Me5Vzpmkqqe/RgOZnr8RlnI4aEuLZPbjUdqV47Vf4=	2021-03-03 00:00:00+08	silvermeercat422	silvermeercat422@rehabnow.com	شهید شهرام امیری	مشهد	Iran	2007-06-27 03:31:55.945+08	1958-07-16	کوروش	male	null	کوتی	IR	006-35968784	35418	فارس	active	https://randomuser.me/api/portraits/men/54.jpg	f
pbkdf2_sha256$216000$8Kfze6OMjB8P$m/9jh3xYPetkImqSn+usio0RbbI6ELZz3std0wsNEic=	2021-03-03 00:00:00+08	organicgoose741	organicgoose741@rehabnow.com	Fairview St	Busselton	Australia	2003-03-09 02:50:59.69+08	1966-08-04	Troy	male	628877721	Moore	AU	01-7100-6721	2394	New South Wales	active	https://randomuser.me/api/portraits/men/86.jpg	f
pbkdf2_sha256$216000$AmWI4OXZhLrp$poCS9hPbSuf0hnb/WmN/Xn3Ydr1NiHUh+1r0KENnWDk=	2021-03-03 00:00:00+08	silverbear987	silverbear987@rehabnow.com	West Street	Westminster	United Kingdom	2017-01-13 06:07:09.675+08	1959-09-27	Rick	male	ML 27 33 57 B	Rodriguez	GB	015242 52877	KG74 0BQ	Northumberland	active	https://randomuser.me/api/portraits/men/64.jpg	f
pbkdf2_sha256$216000$rywHvXPnnvaw$ClxLybYf09v4cdpHUXOxofjeuoGUGDlLof+iqK1GTZ4=	2021-03-03 00:00:00+08	tinygoose481	tinygoose481@rehabnow.com	Istiklal Cd	Tokat	Turkey	2011-01-12 04:41:19.236+08	1980-05-10	Vedat	male	null	Orbay	TR	(708)-181-8999	64238	Ordu	active	https://randomuser.me/api/portraits/men/50.jpg	f
pbkdf2_sha256$216000$e6y458gqc2nd$LLp3ddZaQmtw33vjZRhUlQgTmTh6DUnBqMXwNHwVvfA=	2021-03-03 00:00:00+08	organicswan953	organicswan953@rehabnow.com	Filistin Cd	Manisa	Turkey	2005-04-30 06:34:55.451+08	1963-03-31	Ayşe	female	null	Çörekçi	TR	(164)-304-4214	40134	Sivas	active	https://randomuser.me/api/portraits/women/53.jpg	f
pbkdf2_sha256$216000$ZhyvLP1ZnI7e$2z4ntbfV82wzIzPWHf4/Qqd0m7PKqUrsK6wP2CX3pYM=	2021-03-03 00:00:00+08	bigpeacock243	bigpeacock243@rehabnow.com	Birkemosevej	Stoevring	Denmark	2014-02-21 02:16:43.209+08	1952-12-15	Magnus	male	151252-5640	Rasmussen	DK	42439135	99439	Sjælland	active	https://randomuser.me/api/portraits/men/11.jpg	f
pbkdf2_sha256$216000$thOqMr3zukVJ$aZcxwqHgLfjBvBG9yc99RB2TTtWJuX67KjEiivsn/xY=	2021-03-03 00:00:00+08	goldensnake205	goldensnake205@rehabnow.com	Bulevardi	Sund	Finland	2005-02-02 07:07:54.592+08	1969-05-02	Hilla	female	NaNNA850undefined	Linna	FI	05-860-007	16638	Kymenlaakso	active	https://randomuser.me/api/portraits/women/82.jpg	f
pbkdf2_sha256$216000$eonuQhPGq2Kn$4T3U0gMJr9Oznk9jBmHqqwcQaMBZsCaD5SuftO/ZEnI=	2021-03-03 00:00:00+08	blueswan928	blueswan928@rehabnow.com	Wiri Station Road	Invercargill	New Zealand	2014-08-25 21:42:00.255+08	1969-05-08	Jacob	male	null	Wang	NZ	(098)-481-7481	12762	Nelson	active	https://randomuser.me/api/portraits/men/6.jpg	f
pbkdf2_sha256$216000$SEIdXpLTYKF4$tebEBNmE19q/99Ohrl0C1INeWwxL3F8cvs62fjTfyqo=	2021-03-03 00:00:00+08	purplefrog658	purplefrog658@rehabnow.com	Necatibey Cd	Elazığ	Turkey	2009-01-10 20:38:31.206+08	1983-04-03	Nalan	female	null	Ekşioğlu	TR	(625)-687-7809	80046	Bilecik	active	https://randomuser.me/api/portraits/women/79.jpg	f
pbkdf2_sha256$216000$4MP0X73bjRJH$gn7ZSQrw2QhugaALXIg97+k4tN2kMDDxc6Tf6hUtXZM=	2021-03-03 00:00:00+08	purpleleopard511	purpleleopard511@rehabnow.com	Manchester Street	Napier	New Zealand	2004-09-16 11:24:55.018+08	1956-07-04	Emily	female	null	Harris	NZ	(338)-763-3382	15873	Northland	active	https://randomuser.me/api/portraits/women/15.jpg	f
pbkdf2_sha256$216000$fhlQRPHlOysl$qD79HEC3F6/QRG5MLz+Wlsm5u3sQ5CKAfdO0JU4yMJU=	2021-03-03 00:00:00+08	goldenfrog380	goldenfrog380@rehabnow.com	Trollvannsveien	Slidre	Norway	2006-06-13 18:51:46.202+08	1973-09-05	Aisha	female	05097349691	Røgeberg	NO	84247533	4088	Hordaland	active	https://randomuser.me/api/portraits/women/77.jpg	f
pbkdf2_sha256$216000$kQaIYppK1ffR$wiqAUqm6zm3uLCdAmI7I1bE0orqg6rQiqL+d962F8V4=	2021-03-03 00:00:00+08	tinymouse176	tinymouse176@rehabnow.com	Fatih Sultan Mehmet Cd	Yozgat	Turkey	2005-10-12 21:36:17.55+08	1947-06-30	Okan	male	null	Nebioğlu	TR	(111)-626-9911	83866	Mardin	active	https://randomuser.me/api/portraits/men/70.jpg	f
pbkdf2_sha256$216000$Cb4WTbK7IpcI$awYis/09saWA8U9A9CgkZUNg+aQoR9aOwciaXVcvAc0=	2021-03-03 00:00:00+08	yellowrabbit780	yellowrabbit780@rehabnow.com	Kirchweg	Reutlingen	Germany	2002-03-22 03:45:39.463+08	1997-02-28	Helge	male	null	Kuschel	DE	0890-5396085	28580	Niedersachsen	active	https://randomuser.me/api/portraits/men/65.jpg	f
pbkdf2_sha256$216000$rmqjqf4qU72s$Ao2Yo8XdI2nWni0dQlMfefV/SGJriPow+qpTHknWgbU=	2021-03-03 00:00:00+08	crazygoose969	crazygoose969@rehabnow.com	Dorfstraße	Wriezen	Germany	2013-06-09 18:14:55.155+08	1963-10-08	Lotte	female	null	Benner	DE	0309-9693425	57129	Sachsen-Anhalt	active	https://randomuser.me/api/portraits/women/17.jpg	f
pbkdf2_sha256$216000$OmFePXVqAhup$sm7T2wUImhLVN4YfBCAEJzehdQnLPDvMQoT1wkO9TAQ=	2021-03-03 00:00:00+08	lazypeacock712	lazypeacock712@rehabnow.com	Rue de LÉglise	Aubervilliers	France	2009-10-05 13:27:10.894+08	1949-06-18	Marion	female	2NNaN00543902 24	Adam	FR	04-40-00-57-90	54820	Aube	active	https://randomuser.me/api/portraits/women/25.jpg	f
pbkdf2_sha256$216000$QzWglSfakctc$/qKNe9LgXlhJHWcfNuDUExesDrv/3heIAi6EgoOTIy0=	2021-03-03 00:00:00+08	lazyostrich883	lazyostrich883@rehabnow.com	Place de LAbbé-Jean-Lebeuf	Caen	France	2011-09-01 18:23:29.752+08	1967-07-31	Eliot	male	1NNaN50434319 12	Durand	FR	02-13-76-92-35	87246	Calvados	active	https://randomuser.me/api/portraits/men/58.jpg	f
pbkdf2_sha256$216000$tG2PXIzKFnOP$z3l7pMEvP50yyjirElH0NqEm8CP7y15J5xN/7v0kpro=	2021-03-03 00:00:00+08	heavyleopard345	heavyleopard345@rehabnow.com	E North St	Tamworth	Australia	2012-05-12 13:47:44.356+08	1986-02-10	Don	male	794797355	Roberts	AU	06-2935-9037	5665	Queensland	active	https://randomuser.me/api/portraits/men/2.jpg	f
pbkdf2_sha256$216000$6QfqTUZrHmeI$NgZA9N0m+TXgDYg5Vi87Irjzz6q5p5Bgat0KMRINIh8=	2021-03-03 00:00:00+08	whitezebra768	whitezebra768@rehabnow.com	Maple Ave	Chipman	Canada	2003-10-21 07:03:25.445+08	1957-09-26	Marilou	female	null	Liu	CA	004-718-0712	P1W 7S5	New Brunswick	active	https://randomuser.me/api/portraits/women/60.jpg	f
pbkdf2_sha256$216000$LyKp85K8wxFN$F4o9lmwdmkM1whYtWBok0+dq4aOqrDtV3h3Yo1BHUuE=	2021-03-03 00:00:00+08	brownmeercat584	brownmeercat584@rehabnow.com	دماوند	پاکدشت	Iran	2006-05-18 21:23:55.459+08	1951-01-23	آوینا	female	null	موسوی	IR	072-01296796	76021	اردبیل	active	https://randomuser.me/api/portraits/women/44.jpg	f
pbkdf2_sha256$216000$KM421T4N2DAP$j5Pg7gQjyQBtDPicUhJjkYFjCDhGH43cxk+mlAyNcVY=	2021-03-03 00:00:00+08	whitecat417	whitecat417@rehabnow.com	Avenida de América	Orihuela	Spain	2017-07-08 23:33:19.804+08	1998-08-31	Gloria	female	52502108-F	Castro	ES	915-936-987	72417	Navarra	active	https://randomuser.me/api/portraits/women/57.jpg	f
pbkdf2_sha256$216000$a03x4ChxubLj$WNGFyanMNpiPXUbgdgnxS6uyU0T1uSc2z1MNxD9pDrU=	2021-03-03 00:00:00+08	yellowdog143	yellowdog143@rehabnow.com	Spring St	Boston	United States	2011-02-22 11:22:10.203+08	1981-10-22	Dawn	female	961-73-6757	Andrews	US	(921)-379-1676	11854	Arizona	active	https://randomuser.me/api/portraits/women/48.jpg	f
pbkdf2_sha256$216000$CZtoxzvyO7eU$UwWNmArxrP+Fzoi/VZ0nmTfcJEdUY914H0SFJ114uxo=	2021-03-03 00:00:00+08	crazysnake728	crazysnake728@rehabnow.com	Rue du Bât-DArgent	Provence	Switzerland	2012-06-24 21:35:01.603+08	1963-12-02	Veronica	female	756.0124.9021.33	Nguyen	CH	078 704 62 98	3205	Zug	active	https://randomuser.me/api/portraits/women/11.jpg	f
pbkdf2_sha256$216000$OzE4UFOhKqKC$PpMuYK/l8jUaHxzl+Z20fTdL1MvPMrpq0IxZrBsca3Q=	2021-03-03 00:00:00+08	tinyfrog115	tinyfrog115@rehabnow.com	Bağdat Cd	Kilis	Turkey	2018-02-14 15:35:07.517+08	1962-12-10	Eren	male	null	Nalbantoğlu	TR	(910)-226-2830	64662	Sakarya	active	https://randomuser.me/api/portraits/men/92.jpg	f
pbkdf2_sha256$216000$eyA6AYGWuGm0$9fklVo8WHHQqeIPqBC846aTDzeIy7lZyxJfrXm/z8EY=	2021-03-03 00:00:00+08	redladybug844	redladybug844@rehabnow.com	Bağdat Cd	Bilecik	Turkey	2005-02-23 15:44:50.022+08	1998-08-10	Ülkü	female	null	Erçetin	TR	(876)-825-2385	11433	Kırıkkale	active	https://randomuser.me/api/portraits/women/56.jpg	f
pbkdf2_sha256$216000$KFbzG19nDtaU$Y5GjZAKGSZxdmWqTSMzRGbUtMItSNd5uVdIVO9f8oSQ=	2021-03-03 00:00:00+08	bigbutterfly969	bigbutterfly969@rehabnow.com	Itsenäisyydenkatu	Ulvila	Finland	2007-05-22 12:43:13.71+08	1946-12-09	Aada	female	NaNNA708undefined	Nikula	FI	06-005-759	10473	Southern Savonia	active	https://randomuser.me/api/portraits/women/18.jpg	f
pbkdf2_sha256$216000$v2rVKH2XiHV2$Ig1rV9VNuotgnYamPs/OBYJlKTkNhJjYHHwByIpQXXg=	2021-03-03 00:00:00+08	smallgorilla483	smallgorilla483@rehabnow.com	Rotuaari	Miehikkälä	Finland	2012-02-09 11:30:04.215+08	1965-10-03	Leo	male	NaNNA593undefined	Jutila	FI	02-525-480	10844	Åland	active	https://randomuser.me/api/portraits/men/4.jpg	f
pbkdf2_sha256$216000$GlvRBlSC7zW3$itKJrzD1DBXjs02xpLZdWhmY8WuZulKlijzVeZVT754=	2021-03-03 00:00:00+08	purplerabbit787	purplerabbit787@rehabnow.com	Avenida de Castilla	Fuenlabrada	Spain	2011-04-22 03:58:24.694+08	1978-12-13	Antonia	female	31537484-X	Gutierrez	ES	983-246-551	56132	Aragón	active	https://randomuser.me/api/portraits/women/53.jpg	f
pbkdf2_sha256$216000$kFCahD9ixKoO$+7RYQeejc4IEWEqBu40JrgVilSXa9alIl3/Sq3iS5ys=	2021-03-03 00:00:00+08	whiteleopard834	whiteleopard834@rehabnow.com	Pyynikintie	Kontiolahti	Finland	2013-05-04 17:17:08.641+08	1997-02-17	Anton	male	NaNNA505undefined	Kyllo	FI	09-328-745	22586	Central Ostrobothnia	active	https://randomuser.me/api/portraits/men/96.jpg	f
password	2021-03-03 00:00:00+08	blackgorilla254	blackgorilla254@rehabnow.com	Satakennankatu	Muonio	Finland	2016-08-03 13:32:49.119+08	1974-07-28	Amanda	female	NaNNA590undefined	Kauppi	FI	09-270-168	33798	Northern Ostrobothnia	active	https://randomuser.me/api/portraits/women/53.jpg	f
password	2021-03-03 00:00:00+08	goldenpanda951	goldenpanda951@rehabnow.com	Albert Road	Dunboyne	Ireland	2011-04-14 22:31:20.148+08	1980-12-27	Leah	female	8339900T	Murray	IE	071-313-5937	58668	Galway	active	https://randomuser.me/api/portraits/women/78.jpg	f
password	2021-03-03 00:00:00+08	crazycat462	crazycat462@rehabnow.com	Place Paul-Duquaire	Dagmersellen	Switzerland	2009-08-21 07:05:28.187+08	1954-01-07	Anouk	female	756.0573.0101.45	Dumont	CH	078 515 73 60	2599	Valais	active	https://randomuser.me/api/portraits/women/90.jpg	f
password	2021-03-03 00:00:00+08	goldenpeacock163	goldenpeacock163@rehabnow.com	Locust Rd	Mackay	Australia	2019-07-22 03:24:48.473+08	1974-03-18	Eleanor	female	139108127	Williams	AU	03-7019-7334	5990	Australian Capital Territory	active	https://randomuser.me/api/portraits/women/66.jpg	f
password	2021-03-03 00:00:00+08	orangewolf364	orangewolf364@rehabnow.com	Damveien	Nypan	Norway	2014-06-09 07:13:07.798+08	1947-09-18	Nathalie	female	18094728416	Krasniqi	NO	86502789	2640	Buskerud	active	https://randomuser.me/api/portraits/women/34.jpg	f
password	2021-03-03 00:00:00+08	lazylion549	lazylion549@rehabnow.com	Stevens Creek Blvd	Warragul	Australia	2005-02-24 09:14:27.03+08	1976-06-04	Edna	female	089442515	Howell	AU	09-0960-9754	8999	Tasmania	active	https://randomuser.me/api/portraits/women/21.jpg	f
password	2021-03-03 00:00:00+08	goldenfish239	goldenfish239@rehabnow.com	The Grove	Kinsealy-Drinan	Ireland	2018-10-30 23:03:47.996+08	1994-08-25	Brent	male	6803555T	Sullivan	IE	021-983-6051	62228	South Dublin	active	https://randomuser.me/api/portraits/men/26.jpg	f
password	2021-03-03 00:00:00+08	bluekoala549	bluekoala549@rehabnow.com	Pilestredet Park	Drammen	Norway	2007-06-11 12:17:00.864+08	1969-03-22	Audun	male	22036936987	Sætre	NO	33746675	6220	Description	active	https://randomuser.me/api/portraits/men/21.jpg	f
password	2021-03-03 00:00:00+08	happyduck812	happyduck812@rehabnow.com	Vænget	Horsens	Denmark	2014-02-12 06:34:54.055+08	1955-05-04	Rosa	female	040555-0677	Pedersen	DK	77627981	26812	Nordjylland	active	https://randomuser.me/api/portraits/women/50.jpg	f
password	2021-03-03 00:00:00+08	goldengorilla472	goldengorilla472@rehabnow.com	High Street	Preston	United Kingdom	2013-05-13 20:44:53.429+08	1983-05-05	Jeffery	male	CM 39 66 90 T	Garcia	GB	013873 97516	KI4 7EA	Herefordshire	active	https://randomuser.me/api/portraits/men/63.jpg	f
password	2021-03-03 00:00:00+08	angryrabbit476	angryrabbit476@rehabnow.com	Fitzgerald Avenue	Napier	New Zealand	2014-07-09 16:15:16.057+08	1997-04-14	Aaliyah	female	null	Zhang	NZ	(638)-221-8246	56388	Northland	active	https://randomuser.me/api/portraits/women/73.jpg	f
password	2021-03-03 00:00:00+08	silvergoose488	silvergoose488@rehabnow.com	Calle de Atocha	Santiago de Compostela	Spain	2012-09-09 00:01:11.818+08	1946-05-11	Adrian	male	00488735-L	Herrera	ES	921-707-018	96254	Comunidad Valenciana	active	https://randomuser.me/api/portraits/men/62.jpg	f
password	2021-03-03 00:00:00+08	redkoala686	redkoala686@rehabnow.com	Schulstraße	Altdorf Bei Nürnberg	Germany	2012-11-18 09:51:45.073+08	1991-04-04	Lidwina	female	null	Scheffler	DE	0115-4994218	40368	Saarland	active	https://randomuser.me/api/portraits/women/64.jpg	f
password	2021-03-03 00:00:00+08	angryleopard130	angryleopard130@rehabnow.com	West Ave	Hampton	Canada	2009-12-10 14:49:50.766+08	1986-07-14	Dominic	male	null	Côté	CA	503-785-6959	C1S 4K7	Saskatchewan	active	https://randomuser.me/api/portraits/men/60.jpg	f
password	2021-03-03 00:00:00+08	beautifulgorilla420	beautifulgorilla420@rehabnow.com	Rue Dubois	Amiens	France	2011-12-09 05:41:16.185+08	1966-05-23	Adam	male	1NNaN81735450 11	Dumas	FR	02-86-87-46-17	91160	Haute-Corse	active	https://randomuser.me/api/portraits/men/21.jpg	f
password	2021-03-03 00:00:00+08	orangeduck900	orangeduck900@rehabnow.com	دکتر علی شریعتی	کرج	Iran	2015-11-10 23:48:12.733+08	1966-11-18	سارا	female	null	سلطانی نژاد	IR	086-02871432	93946	البرز	active	https://randomuser.me/api/portraits/women/9.jpg	f
password	2021-03-03 00:00:00+08	redbutterfly321	redbutterfly321@rehabnow.com	Rua São Luiz 	Brasília	Brazil	2010-05-27 17:54:20.556+08	1966-12-20	Ariadne	female	null	Fogaça	BR	(09) 0218-9879	57425	Amazonas	active	https://randomuser.me/api/portraits/women/47.jpg	f
password	2021-03-03 00:00:00+08	redgoose399	redgoose399@rehabnow.com	Degnevænget	Klitmøller	Denmark	2012-09-06 03:56:52.666+08	1998-05-20	Laura	female	200598-3726	Poulsen	DK	55604988	72230	Syddanmark	active	https://randomuser.me/api/portraits/women/9.jpg	f
password	2021-03-03 00:00:00+08	smallwolf131	smallwolf131@rehabnow.com	Rue Pierre-Delore	Tours	France	2016-12-02 04:03:51.709+08	1959-07-20	Constance	female	2NNaN54506830 63	Rolland	FR	03-03-19-41-36	25290	Bas-Rhin	active	https://randomuser.me/api/portraits/women/16.jpg	f
password	2021-03-03 00:00:00+08	redkoala858	redkoala858@rehabnow.com	Rue des Ecrivains	Homberg	Switzerland	2006-05-18 08:05:26.225+08	1962-04-29	Viktoria	female	756.9088.3445.71	Fabre	CH	078 939 69 82	4621	Schaffhausen	active	https://randomuser.me/api/portraits/women/15.jpg	f
password	2021-03-03 00:00:00+08	blackladybug851	blackladybug851@rehabnow.com	W 6th St	Boise	United States	2011-12-10 07:43:30.491+08	1970-11-25	Jon	male	352-15-7583	Peck	US	(282)-844-8005	48330	Hawaii	active	https://randomuser.me/api/portraits/men/32.jpg	f
password	2021-03-03 00:00:00+08	angrysnake461	angrysnake461@rehabnow.com	New North Road	Masterton	New Zealand	2016-08-05 16:36:27.035+08	1983-07-23	Chloe	female	null	Edwards	NZ	(415)-050-7611	63582	Nelson	active	https://randomuser.me/api/portraits/women/59.jpg	f
password	2021-03-03 00:00:00+08	greendog116	greendog116@rehabnow.com	Helgesvej	Vipperød	Denmark	2012-02-09 09:58:30.797+08	1978-02-09	Johan	male	090278-2343	Sørensen	DK	65285253	47772	Danmark	active	https://randomuser.me/api/portraits/men/61.jpg	f
password	2021-03-03 00:00:00+08	lazyfish785	lazyfish785@rehabnow.com	Honthorsterweg	Dinxperlo	Netherlands	2006-07-01 16:47:18.46+08	1996-02-18	Jurre	male	03184361	Samuels	NL	(923)-373-4030	98584	Friesland	active	https://randomuser.me/api/portraits/men/63.jpg	f
password	2021-03-03 00:00:00+08	happykoala372	happykoala372@rehabnow.com	Guyton Street	Gisborne	New Zealand	2013-09-02 17:52:38.677+08	1977-08-02	Caitlin	female	null	Thomas	NZ	(939)-234-0318	40839	Waikato	active	https://randomuser.me/api/portraits/women/14.jpg	f
password	2021-03-03 00:00:00+08	yellowtiger157	yellowtiger157@rehabnow.com	South Street	Wicklow	Ireland	2011-09-28 11:36:14.851+08	1959-11-02	Stephen	male	4876416T	Powell	IE	071-902-6883	31914	Longford	active	https://randomuser.me/api/portraits/men/75.jpg	f
password	2021-03-03 00:00:00+08	bigostrich965	bigostrich965@rehabnow.com	Römerstraße	Schierbrok	Germany	2003-03-19 23:02:23.291+08	1978-06-13	Milka	female	null	Hofer	DE	0675-8583168	95601	Hamburg	active	https://randomuser.me/api/portraits/women/57.jpg	f
password	2021-03-03 00:00:00+08	smallbear422	smallbear422@rehabnow.com	Oaks Cross	Preston	United Kingdom	2015-12-06 22:14:41.353+08	1946-03-30	Lily	female	HP 02 24 47 P	Elliott	GB	013873 10659	RB5J 0PT	South Yorkshire	active	https://randomuser.me/api/portraits/women/94.jpg	f
password	2021-03-03 00:00:00+08	purplegoose731	purplegoose731@rehabnow.com	Rua Dezesseis de Maio	Divinópolis	Brazil	2003-10-05 08:34:38.405+08	1961-11-02	Olivier	male	null	Duarte	BR	(76) 8586-6851	94810	Mato Grosso do Sul	active	https://randomuser.me/api/portraits/men/60.jpg	f
password	2021-03-03 00:00:00+08	crazylion949	crazylion949@rehabnow.com	Galway Road	Cork	Ireland	2017-06-30 15:39:10.739+08	1973-06-12	Curtis	male	8969940T	Evans	IE	011-852-1361	86727	Clare	active	https://randomuser.me/api/portraits/men/24.jpg	f
password	2021-03-03 00:00:00+08	purplebear949	purplebear949@rehabnow.com	Faunveien	Åkrehamn	Norway	2016-06-04 04:45:21.368+08	1958-02-01	Vebjørn	male	01025802361	Yildirim	NO	86293614	6456	Nordland	active	https://randomuser.me/api/portraits/men/58.jpg	f
password	2021-03-03 00:00:00+08	crazydog177	crazydog177@rehabnow.com	Rua Quinze de Novembro 	Londrina	Brazil	2004-04-06 16:54:55.231+08	1965-01-14	Aléxis	male	null	Dias	BR	(40) 5917-6947	77043	Pernambuco	active	https://randomuser.me/api/portraits/men/5.jpg	f
password	2021-03-03 00:00:00+08	greenkoala230	greenkoala230@rehabnow.com	Lindenweg	Limbach-Oberfrohna	Germany	2016-08-04 05:08:59.715+08	1990-03-09	Nathalie	female	null	Tetzlaff	DE	0511-4430439	89235	Baden-Württemberg	active	https://randomuser.me/api/portraits/women/79.jpg	f
password	2021-03-03 00:00:00+08	whitelion201	whitelion201@rehabnow.com	Main Road	Newry	United Kingdom	2015-11-21 12:44:49.42+08	1981-11-03	Miguel	male	TP 17 59 58 T	Hunter	GB	0113672 910 0698	U30 9TA	Tyne and Wear	active	https://randomuser.me/api/portraits/men/15.jpg	f
password	2021-03-03 00:00:00+08	angrybutterfly553	angrybutterfly553@rehabnow.com	Park Lane	Belfast	United Kingdom	2004-04-03 07:22:49.447+08	1990-02-18	Chloe	female	WP 95 07 23 L	Russell	GB	017687 77346	VL56 0FU	Highlands and Islands	active	https://randomuser.me/api/portraits/women/92.jpg	f
password	2021-03-03 00:00:00+08	redbutterfly800	redbutterfly800@rehabnow.com	Rue de la Barre	Metz	France	2007-09-17 11:33:25.46+08	1980-04-23	Maëlle	female	2NNaN76568432 87	Noel	FR	01-16-52-69-18	88739	Mayenne	active	https://randomuser.me/api/portraits/women/41.jpg	f
password	2021-03-03 00:00:00+08	brownbear657	brownbear657@rehabnow.com	Rua Dom Pedro Ii 	Juazeiro do Norte	Brazil	2006-12-08 11:42:56.306+08	1964-08-02	Sândi	female	null	Barbosa	BR	(30) 0568-5991	31463	Mato Grosso	active	https://randomuser.me/api/portraits/women/68.jpg	f
password	2021-03-03 00:00:00+08	bluefrog586	bluefrog586@rehabnow.com	Præstevænget	Samsø	Denmark	2019-06-17 12:55:56.42+08	1981-04-29	Andreas	male	290481-2553	Johansen	DK	99723034	45411	Nordjylland	active	https://randomuser.me/api/portraits/men/95.jpg	f
password	2021-03-03 00:00:00+08	bluetiger674	bluetiger674@rehabnow.com	Visiokatu	Vantaa	Finland	2003-08-13 21:14:35.471+08	1970-06-19	Milla	female	NaNNA836undefined	Hakala	FI	07-559-857	57769	Åland	active	https://randomuser.me/api/portraits/women/73.jpg	f
password	2021-03-03 00:00:00+08	goldenladybug341	goldenladybug341@rehabnow.com	The Grove	Kells	Ireland	2002-05-12 07:19:23.502+08	1945-12-11	Zoe	female	3377185T	Davies	IE	011-452-4491	42757	Cork	active	https://randomuser.me/api/portraits/women/40.jpg	f
password	2021-03-03 00:00:00+08	beautifulladybug415	beautifulladybug415@rehabnow.com	Kingsway	Stoke-on-Trent	United Kingdom	2008-10-29 21:04:01.76+08	1982-08-06	Vicky	female	LS 71 29 60 E	Parker	GB	0110811 658 7015	U0 2YL	Central	active	https://randomuser.me/api/portraits/women/80.jpg	f
password	2021-03-03 00:00:00+08	whitebear107	whitebear107@rehabnow.com	Presidentgata	Ringstad	Norway	2010-10-04 22:58:07.414+08	1945-11-20	Zakariya	male	20114510999	Vanvik	NO	64794238	6447	Description	active	https://randomuser.me/api/portraits/men/85.jpg	f
password	2021-03-03 00:00:00+08	silvercat361	silvercat361@rehabnow.com	Northaven Rd	Baltimore	United States	2011-02-13 23:40:34.08+08	1962-11-05	Violet	female	740-76-4242	Ray	US	(838)-004-9131	26813	North Dakota	active	https://randomuser.me/api/portraits/women/10.jpg	f
password	2021-03-03 00:00:00+08	bigfrog236	bigfrog236@rehabnow.com	North Street	Athlone	Ireland	2004-06-16 09:55:02.403+08	1982-05-23	Ian	male	9508071T	Smythe	IE	061-519-3990	89414	Sligo	active	https://randomuser.me/api/portraits/men/48.jpg	f
password	2021-03-03 00:00:00+08	goldenfrog252	goldenfrog252@rehabnow.com	New Road	Clonmel	Ireland	2012-11-16 01:14:54.174+08	1959-06-16	Clayton	male	1529379T	Williams	IE	071-398-3732	37619	Fingal	active	https://randomuser.me/api/portraits/men/71.jpg	f
password	2021-03-03 00:00:00+08	greenkoala661	greenkoala661@rehabnow.com	W Gray St	San Diego	United States	2018-01-23 13:58:01.482+08	1990-01-07	Louis	male	462-93-7317	Foster	US	(858)-508-4812	91434	Pennsylvania	active	https://randomuser.me/api/portraits/men/51.jpg	f
password	2021-03-03 00:00:00+08	brownlion105	brownlion105@rehabnow.com	Talak Göktepe Cd	Kırşehir	Turkey	2008-11-03 19:02:39.511+08	1945-08-25	Afet	female	null	Çetiner	TR	(457)-193-4147	86437	Tunceli	active	https://randomuser.me/api/portraits/women/96.jpg	f
password	2021-03-03 00:00:00+08	organicdog442	organicdog442@rehabnow.com	Rua Quinze de Novembro 	Ribeirão Pires	Brazil	2011-03-03 04:02:48.223+08	1949-08-08	Albenisa	female	null	Duarte	BR	(42) 9166-5518	97955	Paraná	active	https://randomuser.me/api/portraits/women/37.jpg	f
password	2021-03-03 00:00:00+08	greenlion767	greenlion767@rehabnow.com	Gullkroken	Mo	Norway	2004-08-20 19:02:21.492+08	1990-09-07	Jayden	male	07099043983	Roberg	NO	85460688	3071	Nordland	active	https://randomuser.me/api/portraits/men/81.jpg	f
password	2021-03-03 00:00:00+08	tinypanda427	tinypanda427@rehabnow.com	Talak Göktepe Cd	Siirt	Turkey	2007-09-15 23:21:56.451+08	1951-06-23	Efe	male	null	Çamdalı	TR	(297)-820-8641	62484	Kırşehir	active	https://randomuser.me/api/portraits/men/69.jpg	f
password	2021-03-03 00:00:00+08	tinybutterfly967	tinybutterfly967@rehabnow.com	Æblehaven	Jerslev Sj	Denmark	2018-09-15 15:40:33.667+08	1995-05-14	Alma	female	140595-4491	Jensen	DK	76884300	19522	Midtjylland	active	https://randomuser.me/api/portraits/women/37.jpg	f
password	2021-03-03 00:00:00+08	goldenpeacock476	goldenpeacock476@rehabnow.com	Calle de Téllez	Barcelona	Spain	2018-05-28 02:37:05.303+08	1962-12-27	Cesar	male	69464688-S	Torres	ES	925-837-614	52120	La Rioja	active	https://randomuser.me/api/portraits/men/57.jpg	f
password	2021-03-03 00:00:00+08	orangebutterfly809	orangebutterfly809@rehabnow.com	Tehtaankatu	Ruovesi	Finland	2010-09-24 06:02:48.767+08	1987-09-03	Kerttu	female	NaNNA312undefined	Hietala	FI	02-467-849	34477	Uusimaa	active	https://randomuser.me/api/portraits/women/4.jpg	f
password	2021-03-03 00:00:00+08	yellowzebra927	yellowzebra927@rehabnow.com	Avenue Joliot Curie	Arzier-Le Muids	Switzerland	2009-12-08 16:57:09.286+08	1967-11-09	Katarzyna	female	756.7254.7573.15	Brunet	CH	078 126 48 96	5977	Ticino	active	https://randomuser.me/api/portraits/women/16.jpg	f
password	2021-03-03 00:00:00+08	heavywolf609	heavywolf609@rehabnow.com	Rue du 8 Mai 1945	Aulnay-sous-Bois	France	2014-11-13 06:43:16.085+08	1970-01-20	Alyssa	female	2NNaN16211347 40	Deschamps	FR	01-41-89-38-53	63889	Haute-Marne	active	https://randomuser.me/api/portraits/women/74.jpg	f
password	2021-03-03 00:00:00+08	brownsnake101	brownsnake101@rehabnow.com	High Street	Drogheda	Ireland	2012-06-13 16:03:44.807+08	1960-06-21	Scarlett	female	0343903T	Snyder	IE	041-383-7183	31203	Longford	active	https://randomuser.me/api/portraits/women/78.jpg	f
password	2021-03-03 00:00:00+08	blacklion325	blacklion325@rehabnow.com	New Street	Bath	United Kingdom	2005-03-26 09:18:27.753+08	1994-09-30	Peter	male	NY 09 24 33 Q	Castillo	GB	015395 82287	UA6A 1TJ	South Yorkshire	active	https://randomuser.me/api/portraits/men/90.jpg	f
password	2021-03-03 00:00:00+08	goldencat607	goldencat607@rehabnow.com	Carl Grøndahls vei	Hesseng	Norway	2005-09-02 17:19:56.92+08	1970-10-13	Elisa	female	13107039001	Friberg	NO	34053228	2690	Sør-Trøndelag	active	https://randomuser.me/api/portraits/women/94.jpg	f
pbkdf2_sha256$216000$Q3iBfMAYDhVi$ZGmP0dm9LtXR3S1xmmKb4OXn2HmteDgqSKglV4OwCNA=	2021-03-03 00:00:00+08	smallgoose334	smallgoose334@rehabnow.com	Park Road	Laytown-Bettystown-Mornington	Ireland	2017-06-14 04:01:25.891+08	1993-01-26	Donna	female	8719650T	Bailey	IE	071-603-8140	43067	Westmeath	active	https://randomuser.me/api/portraits/women/30.jpg	f
pbkdf2_sha256$216000$ljzVkEAQLlTz$vv7i2CBYrtpvkQBvzjVZZd+zOqJSZz1jyhuoMhOo398=	2021-03-03 00:00:00+08	sadmouse783	sadmouse783@rehabnow.com	Øvreseterveien	Trolldalen	Norway	2012-08-09 22:38:42.102+08	1956-09-28	Emmeline	female	28095618008	Sikveland	NO	73193655	7481	Møre og Romsdal	active	https://randomuser.me/api/portraits/women/89.jpg	f
pbkdf2_sha256$216000$GhgGCaS6Ginq$bahsl6KRVknPbhsWMsVC7RREgAC0SECjfoHsUuuy7qk=	2021-03-03 00:00:00+08	heavysnake141	heavysnake141@rehabnow.com	Hatanpään Valtatie	Asikkala	Finland	2009-12-26 13:02:41.438+08	1992-03-06	Iina	female	NaNNA564undefined	Hanka	FI	05-472-269	32639	Southern Ostrobothnia	active	https://randomuser.me/api/portraits/women/63.jpg	f
pbkdf2_sha256$216000$W8fhPJEbzCnN$I8by+NhdsN574e9qbUUr+zuk71ssUDfu6fcHvBsAfG8=	2021-03-03 00:00:00+08	whitepeacock173	whitepeacock173@rehabnow.com	Reijolankatu	Ilmajoki	Finland	2012-05-15 18:03:25.648+08	1994-12-18	Siiri	female	NaNNA174undefined	Niskanen	FI	08-337-973	17050	Päijät-Häme	active	https://randomuser.me/api/portraits/women/61.jpg	f
pbkdf2_sha256$216000$WptwxKQEdLjo$a7mmKCQMz7UCikPkhTzneyV+puGMEchQS2V8AS7j9WM=	2021-03-03 00:00:00+08	bigfish600	bigfish600@rehabnow.com	Tryvannsveien	Helgelandsmoen	Norway	2004-01-04 13:52:52.423+08	1974-08-24	Frank	male	24087419394	Thon	NO	54847596	8047	Sogn og Fjordane	active	https://randomuser.me/api/portraits/men/74.jpg	f
pbkdf2_sha256$216000$Pm5qLxXJROwu$BBOMnIJu3ucq7OHeOhjgn3N9LOGG8o8XVXIv93/78zE=	2021-03-03 00:00:00+08	redbear467	redbear467@rehabnow.com	Rue du Stade	Orléans	France	2002-03-30 12:39:58.04+08	1974-10-11	Nora	female	2NNaN24892842 63	Laurent	FR	01-53-17-87-20	43465	Seine-et-Marne	active	https://randomuser.me/api/portraits/women/38.jpg	f
pbkdf2_sha256$216000$1WLgTqrJUfUv$lOvuEgvIJ0d8Xeu226+Q4s2S06r7HNEP4dAM/KC+fzY=	2021-03-03 00:00:00+08	ticklishkoala945	ticklishkoala945@rehabnow.com	Rue de LAbbé-Grégoire	Vex	Switzerland	2007-08-02 16:38:41.823+08	1959-02-24	Grégory	male	756.4322.5592.12	Morin	CH	076 123 99 35	7617	Bern	active	https://randomuser.me/api/portraits/men/28.jpg	f
\.


--
-- TOC entry 2928 (class 0 OID 49798)
-- Dependencies: 209
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 2930 (class 0 OID 49808)
-- Dependencies: 211
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 2926 (class 0 OID 49790)
-- Dependencies: 207
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add user	6	add_user
22	Can change user	6	change_user
23	Can delete user	6	delete_user
24	Can view user	6	view_user
25	Can add snippet	7	add_snippet
26	Can change snippet	7	change_snippet
27	Can delete snippet	7	delete_snippet
28	Can view snippet	7	view_snippet
29	Can add patient	8	add_patient
30	Can change patient	8	change_patient
31	Can delete patient	8	delete_patient
32	Can view patient	8	view_patient
33	Can add physiotherapist	9	add_physiotherapist
34	Can change physiotherapist	9	change_physiotherapist
35	Can delete physiotherapist	9	delete_physiotherapist
36	Can view physiotherapist	9	view_physiotherapist
\.


--
-- TOC entry 2924 (class 0 OID 49765)
-- Dependencies: 205
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- TOC entry 2919 (class 0 OID 49725)
-- Dependencies: 200
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	app	user
7	app	snippet
8	app	patient
9	app	physiotherapist
\.


--
-- TOC entry 2917 (class 0 OID 49714)
-- Dependencies: 198
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-03-31 13:09:47.575013+08
2	app	0001_initial	2021-03-31 13:09:47.902974+08
3	admin	0001_initial	2021-03-31 13:09:48.382482+08
4	admin	0002_logentry_remove_auto_add	2021-03-31 13:09:48.744711+08
5	admin	0003_logentry_add_action_flag_choices	2021-03-31 13:09:48.77967+08
6	contenttypes	0002_remove_content_type_name	2021-03-31 13:09:48.843658+08
7	auth	0001_initial	2021-03-31 13:09:49.056656+08
8	auth	0002_alter_permission_name_max_length	2021-03-31 13:09:49.327328+08
9	auth	0003_alter_user_email_max_length	2021-03-31 13:09:49.350328+08
10	auth	0004_alter_user_username_opts	2021-03-31 13:09:49.372501+08
11	auth	0005_alter_user_last_login_null	2021-03-31 13:09:49.394503+08
12	auth	0006_require_contenttypes_0002	2021-03-31 13:09:49.407504+08
13	auth	0007_alter_validators_add_error_messages	2021-03-31 13:09:49.435515+08
14	auth	0008_alter_user_username_max_length	2021-03-31 13:09:49.4525+08
15	auth	0009_alter_user_last_name_max_length	2021-03-31 13:09:49.4715+08
16	auth	0010_alter_group_name_max_length	2021-03-31 13:09:49.501502+08
17	auth	0011_update_proxy_permissions	2021-03-31 13:09:49.5255+08
18	auth	0012_alter_user_first_name_max_length	2021-03-31 13:09:49.541502+08
19	sessions	0001_initial	2021-03-31 13:09:49.684498+08
20	app	0002_patient_physiotherapist	2021-03-31 15:38:58.53524+08
21	app	0003_auto_20210331_1552	2021-03-31 15:53:59.146059+08
\.


--
-- TOC entry 2931 (class 0 OID 49840)
-- Dependencies: 212
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 0)
-- Dependencies: 202
-- Name: app_snippet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_snippet_id_seq', 1, false);


--
-- TOC entry 2951 (class 0 OID 0)
-- Dependencies: 215
-- Name: app_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_user_id_seq', 1, false);


--
-- TOC entry 2952 (class 0 OID 0)
-- Dependencies: 208
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 2953 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 2954 (class 0 OID 0)
-- Dependencies: 206
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 36, true);


--
-- TOC entry 2955 (class 0 OID 0)
-- Dependencies: 204
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- TOC entry 2956 (class 0 OID 0)
-- Dependencies: 199
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 9, true);


--
-- TOC entry 2957 (class 0 OID 0)
-- Dependencies: 197
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 21, true);


--
-- TOC entry 2785 (class 2606 OID 49894)
-- Name: app_patient app_patient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_patient
    ADD CONSTRAINT app_patient_pkey PRIMARY KEY (patient_id);


--
-- TOC entry 2782 (class 2606 OID 49907)
-- Name: app_physiotherapist app_physiotherapist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_physiotherapist
    ADD CONSTRAINT app_physiotherapist_pkey PRIMARY KEY (physiotherapist_id);


--
-- TOC entry 2754 (class 2606 OID 49753)
-- Name: app_snippet app_snippet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_snippet
    ADD CONSTRAINT app_snippet_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 49742)
-- Name: app_user app_user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_email_key UNIQUE (email);


--
-- TOC entry 2750 (class 2606 OID 49740)
-- Name: app_user app_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2767 (class 2606 OID 49838)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2772 (class 2606 OID 49824)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 2775 (class 2606 OID 49813)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 49803)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 49815)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 2764 (class 2606 OID 49795)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2757 (class 2606 OID 49774)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 49732)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 2744 (class 2606 OID 49730)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 49722)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2778 (class 2606 OID 49847)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 2783 (class 1259 OID 49917)
-- Name: app_patient_patient_id_21d4ee16_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_patient_patient_id_21d4ee16_like ON public.app_patient USING btree (patient_id varchar_pattern_ops);


--
-- TOC entry 2780 (class 1259 OID 49918)
-- Name: app_physiotherapist_physiotherapist_id_c6324131_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_physiotherapist_physiotherapist_id_c6324131_like ON public.app_physiotherapist USING btree (physiotherapist_id varchar_pattern_ops);


--
-- TOC entry 2751 (class 1259 OID 49761)
-- Name: app_snippet_owner_id_2bf99929; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_snippet_owner_id_2bf99929 ON public.app_snippet USING btree (owner_id);


--
-- TOC entry 2752 (class 1259 OID 49762)
-- Name: app_snippet_owner_id_2bf99929_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_snippet_owner_id_2bf99929_like ON public.app_snippet USING btree (owner_id varchar_pattern_ops);


--
-- TOC entry 2745 (class 1259 OID 49755)
-- Name: app_user_email_efde8896_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_user_email_efde8896_like ON public.app_user USING btree (email varchar_pattern_ops);


--
-- TOC entry 2748 (class 1259 OID 49754)
-- Name: app_user_id_894c4161_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_user_id_894c4161_like ON public.app_user USING btree (id varchar_pattern_ops);


--
-- TOC entry 2765 (class 1259 OID 49839)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 2770 (class 1259 OID 49835)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 2773 (class 1259 OID 49836)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2760 (class 1259 OID 49821)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 2755 (class 1259 OID 49785)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 2758 (class 1259 OID 49786)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 2759 (class 1259 OID 49787)
-- Name: django_admin_log_user_id_c564eba6_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6_like ON public.django_admin_log USING btree (user_id varchar_pattern_ops);


--
-- TOC entry 2776 (class 1259 OID 49849)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 2779 (class 1259 OID 49848)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 2793 (class 2606 OID 49895)
-- Name: app_patient app_patient_patient_id_21d4ee16_fk_app_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_patient
    ADD CONSTRAINT app_patient_patient_id_21d4ee16_fk_app_user_id FOREIGN KEY (patient_id) REFERENCES public.app_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2794 (class 2606 OID 49924)
-- Name: app_patient app_patient_physiotherapist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_patient
    ADD CONSTRAINT app_patient_physiotherapist_id_fkey FOREIGN KEY (physiotherapist_id) REFERENCES public.app_physiotherapist(physiotherapist_id);


--
-- TOC entry 2792 (class 2606 OID 49908)
-- Name: app_physiotherapist app_physiotherapist_physiotherapist_id_c6324131_fk_app_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_physiotherapist
    ADD CONSTRAINT app_physiotherapist_physiotherapist_id_c6324131_fk_app_user_id FOREIGN KEY (physiotherapist_id) REFERENCES public.app_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2786 (class 2606 OID 49756)
-- Name: app_snippet app_snippet_owner_id_2bf99929_fk_app_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_snippet
    ADD CONSTRAINT app_snippet_owner_id_2bf99929_fk_app_user_id FOREIGN KEY (owner_id) REFERENCES public.app_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2791 (class 2606 OID 49830)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2790 (class 2606 OID 49825)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2789 (class 2606 OID 49816)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2787 (class 2606 OID 49775)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2788 (class 2606 OID 49780)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_app_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_app_user_id FOREIGN KEY (user_id) REFERENCES public.app_user(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2021-04-01 15:18:22

--
-- PostgreSQL database dump complete
--

