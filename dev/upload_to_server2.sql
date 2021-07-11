--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12
-- Dumped by pg_dump version 10.12

-- Started on 2021-06-30 00:32:14

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
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3038 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 217 (class 1259 OID 57415)
-- Name: app_case; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_case (
    id integer NOT NULL,
    description text NOT NULL,
    status character varying(50) NOT NULL,
    created_by character varying(50) NOT NULL,
    created_dt timestamp with time zone NOT NULL,
    patient_id_id character varying(20) NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.app_case OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 57413)
-- Name: app_case_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_case_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_case_id_seq OWNER TO postgres;

--
-- TOC entry 3039 (class 0 OID 0)
-- Dependencies: 216
-- Name: app_case_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_case_id_seq OWNED BY public.app_case.id;


--
-- TOC entry 215 (class 1259 OID 49975)
-- Name: app_data_city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_data_city (
    city character varying(100) NOT NULL,
    state integer NOT NULL
);


ALTER TABLE public.app_data_city OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 49950)
-- Name: app_data_country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_data_country (
    country character varying(100) NOT NULL,
    iso2 character varying(5) NOT NULL,
    nationality character varying(100)
);


ALTER TABLE public.app_data_country OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 90268)
-- Name: app_data_state_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_data_state_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_data_state_id_seq OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 49958)
-- Name: app_data_state; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_data_state (
    iso2 character varying(5) NOT NULL,
    state character varying(100) NOT NULL,
    id integer DEFAULT nextval('public.app_data_state_id_seq'::regclass) NOT NULL
);


ALTER TABLE public.app_data_state OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 57453)
-- Name: app_exercise; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_exercise (
    id integer NOT NULL,
    created_dt timestamp with time zone NOT NULL,
    oscillation_num integer NOT NULL,
    time_taken double precision NOT NULL,
    done boolean NOT NULL,
    part_id_id integer NOT NULL
);


ALTER TABLE public.app_exercise OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 57451)
-- Name: app_exercise_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_exercise_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_exercise_id_seq OWNER TO postgres;

--
-- TOC entry 3040 (class 0 OID 0)
-- Dependencies: 224
-- Name: app_exercise_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_exercise_id_seq OWNED BY public.app_exercise.id;


--
-- TOC entry 219 (class 1259 OID 57426)
-- Name: app_part; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_part (
    id integer NOT NULL,
    description text NOT NULL,
    name character varying(20) NOT NULL,
    recovery_dt timestamp with time zone,
    status character varying(20) NOT NULL,
    created_dt timestamp with time zone NOT NULL,
    created_by character varying(20) NOT NULL,
    case_id_id integer NOT NULL
);


ALTER TABLE public.app_part OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 57424)
-- Name: app_part_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_part_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_part_id_seq OWNER TO postgres;

--
-- TOC entry 3041 (class 0 OID 0)
-- Dependencies: 218
-- Name: app_part_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_part_id_seq OWNED BY public.app_part.id;


--
-- TOC entry 211 (class 1259 OID 49861)
-- Name: app_patient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_patient (
    patient_id character varying(20) NOT NULL,
    physiotherapist_id character varying NOT NULL
);


ALTER TABLE public.app_patient OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 49853)
-- Name: app_physiotherapist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_physiotherapist (
    physiotherapist_id character varying(20) NOT NULL
);


ALTER TABLE public.app_physiotherapist OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 57445)
-- Name: app_predictedrecovery; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_predictedrecovery (
    id integer NOT NULL,
    created_by character varying(20) NOT NULL,
    created_dt timestamp with time zone NOT NULL,
    recovery_dt timestamp with time zone NOT NULL,
    part_id_id integer NOT NULL
);


ALTER TABLE public.app_predictedrecovery OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 57443)
-- Name: app_predictedrecovery_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_predictedrecovery_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_predictedrecovery_id_seq OWNER TO postgres;

--
-- TOC entry 3042 (class 0 OID 0)
-- Dependencies: 222
-- Name: app_predictedrecovery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_predictedrecovery_id_seq OWNED BY public.app_predictedrecovery.id;


--
-- TOC entry 221 (class 1259 OID 57437)
-- Name: app_target; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_target (
    id integer NOT NULL,
    created_by character varying(20) NOT NULL,
    created_dt timestamp with time zone NOT NULL,
    frequency integer NOT NULL,
    oscillation_num integer NOT NULL,
    time_taken double precision NOT NULL,
    part_id_id integer NOT NULL
);


ALTER TABLE public.app_target OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 57435)
-- Name: app_target_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_target_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_target_id_seq OWNER TO postgres;

--
-- TOC entry 3043 (class 0 OID 0)
-- Dependencies: 220
-- Name: app_target_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_target_id_seq OWNED BY public.app_target.id;


--
-- TOC entry 212 (class 1259 OID 49929)
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
-- TOC entry 200 (class 1259 OID 49733)
-- Name: app_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_user (
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    id character varying(20) DEFAULT nextval('public.app_user_id_seq'::regclass) NOT NULL,
    email character varying(254) NOT NULL,
    address text,
    city character varying(50),
    country character varying(50),
    created_dt timestamp with time zone,
    dob date,
    first_name character varying(50),
    gender character varying(10),
    ic_passport character varying(20),
    last_name character varying(100),
    nationality character varying(50),
    phone_num character varying(20),
    postcode character varying(10),
    status character varying(50),
    photo character varying(50),
    is_admin boolean,
    state integer
);


ALTER TABLE public.app_user OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 49798)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 49796)
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
-- TOC entry 3044 (class 0 OID 0)
-- Dependencies: 205
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 208 (class 1259 OID 49808)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 49806)
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
-- TOC entry 3045 (class 0 OID 0)
-- Dependencies: 207
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 204 (class 1259 OID 49790)
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
-- TOC entry 203 (class 1259 OID 49788)
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
-- TOC entry 3046 (class 0 OID 0)
-- Dependencies: 203
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 226 (class 1259 OID 57500)
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id character varying(20) NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 49765)
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
-- TOC entry 201 (class 1259 OID 49763)
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
-- TOC entry 3047 (class 0 OID 0)
-- Dependencies: 201
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 199 (class 1259 OID 49725)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 49723)
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
-- TOC entry 3048 (class 0 OID 0)
-- Dependencies: 198
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 197 (class 1259 OID 49714)
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
-- TOC entry 196 (class 1259 OID 49712)
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
-- TOC entry 3049 (class 0 OID 0)
-- Dependencies: 196
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 209 (class 1259 OID 49840)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- TOC entry 2782 (class 2604 OID 57418)
-- Name: app_case id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_case ALTER COLUMN id SET DEFAULT nextval('public.app_case_id_seq'::regclass);


--
-- TOC entry 2786 (class 2604 OID 57456)
-- Name: app_exercise id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_exercise ALTER COLUMN id SET DEFAULT nextval('public.app_exercise_id_seq'::regclass);


--
-- TOC entry 2783 (class 2604 OID 57429)
-- Name: app_part id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_part ALTER COLUMN id SET DEFAULT nextval('public.app_part_id_seq'::regclass);


--
-- TOC entry 2785 (class 2604 OID 57448)
-- Name: app_predictedrecovery id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_predictedrecovery ALTER COLUMN id SET DEFAULT nextval('public.app_predictedrecovery_id_seq'::regclass);


--
-- TOC entry 2784 (class 2604 OID 57440)
-- Name: app_target id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_target ALTER COLUMN id SET DEFAULT nextval('public.app_target_id_seq'::regclass);


--
-- TOC entry 2779 (class 2604 OID 49801)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 2780 (class 2604 OID 49811)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2778 (class 2604 OID 49793)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 2776 (class 2604 OID 49768)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 2774 (class 2604 OID 49728)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 2773 (class 2604 OID 49717)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 3020 (class 0 OID 57415)
-- Dependencies: 217
-- Data for Name: app_case; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_case (id, description, status, created_by, created_dt, patient_id_id, name) FROM stdin;
60	0	Under Treatment	R0001232	2021-06-09 12:57:22.062746+08	R0001233	1111
61	1	Under Treatment	R0001232	2021-06-09 13:08:01.855107+08	R0001233	1111a
9	case desc	Under Treatment	R0000212	2021-04-27 16:51:33.275878+08	R0000090	case name
13	case desc	Under Treatment	R0000212	2021-04-27 17:44:59.20858+08	R0000096	case name
15	case desc	Under Treatment	R0000212	2021-04-27 18:31:45.35385+08	R0000097	case name
16	case desc	Under Treatment	R0000212	2021-04-27 18:32:21.274712+08	R0000098	case name
18	case desc	Under Treatment	R0000212	2021-04-27 18:44:03.493048+08	R0000039	case name
20	case desc	Under Treatment	R0000212	2021-04-27 22:08:30.151814+08	R0000024	case name
21	case desc	Under Treatment	R0000212	2021-04-27 22:09:13.741846+08	R0000025	case name
22	case desc	Under Treatment	R0000212	2021-04-27 22:09:45.505612+08	R0000026	case name
23	case desc	Under Treatment	R0000212	2021-04-27 23:07:49.264253+08	R0000027	case name
24	case desc	Under Treatment	R0000212	2021-04-27 23:11:34.286736+08	R0000028	case name
25	case desc	Under Treatment	R0000212	2021-04-27 23:11:49.456843+08	R0000029	case name
26	case desc	Under Treatment	R0000212	2021-04-27 23:39:57.740133+08	R0000030	case name
27	case desc	Under Treatment	R0000212	2021-04-27 23:45:50.875086+08	R0000031	case name
28	case desc	Under Treatment	R0000212	2021-04-27 23:46:12.838935+08	R0000032	case name
29	case desc	Under Treatment	R0000212	2021-04-27 23:46:42.771248+08	R0000033	case name
30	case desc	Under Treatment	R0000212	2021-04-27 23:48:10.531306+08	R0000034	case name
31	case desc	Under Treatment	R0000212	2021-04-28 00:08:12.08159+08	R0000035	case name
32	case desc	Under Treatment	R0000212	2021-04-28 00:12:00.310428+08	R0000036	case name
33	case desc	Under Treatment	R0000212	2021-04-28 00:14:02.03621+08	R0000037	case name
34	case desc	Under Treatment	R0000212	2021-04-28 00:14:52.483815+08	R0000038	case name
35	case desc	Under Treatment	R0000212	2021-04-28 00:15:38.620963+08	R0000040	case name
36	case desc	Under Treatment	R0000212	2021-04-28 00:18:33.308704+08	R0000041	case name
14	case desc	Under Treatment	R0000212	2021-04-27 17:47:19.471306+08	R0000042	case name
38	121212	Under Treatment	R0000212	2021-04-29 12:46:09.469386+08	R0000043	1111
39	121212	Under Treatment	R0000212	2021-04-29 13:12:50.958448+08	R0000044	1111
40	121212	Under Treatment	R0000212	2021-04-29 13:12:54.854314+08	R0000045	1111
11	case desc	Under Treatment	R0000212	2021-04-27 16:55:31.35286+08	R0000046	case name
41	qq	Under Treatment	R0000212	2021-04-29 13:15:03.868569+08	R0000047	case name
48	1	Under Treatment	R0001230	2021-06-07 18:48:31.1173+08	R0001231	case name
42	1	Under Treatment	R0000212	2021-04-29 13:44:20.419543+08	R0000048	case name
37	a	Under Treatment	R0000212	2021-04-28 23:56:35.943406+08	R0000049	1111
44	Car accident.	Under Treatment	R0000212	2021-06-01 19:21:03.915447+08	R0000092	Mild Injury
45	Car Accident.	Under Treatment	R0000212	2021-06-01 20:07:29.910316+08	R0000093	Mild Injury
43	Falling down from stairs.	Under Treatment	R0000212	2021-05-30 21:56:22.21164+08	R0000091	Case Mild
\.


--
-- TOC entry 3018 (class 0 OID 49975)
-- Dependencies: 215
-- Data for Name: app_data_city; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_data_city (city, state) FROM stdin;
Bakri	1950
Batu Pahat	1950
Buloh Kasap	1950
Chaah	1950
Daerah Batu Pahat	1950
Daerah Johor Baharu	1950
Daerah Keluang	1950
Daerah Kota Tinggi	1950
Daerah Mersing	1950
Daerah Muar	1950
Daerah Pontian	1950
Daerah Segamat	1950
Johor Bahru	1950
Kampung Pasir Gudang Baru	1950
Kampung Simpang Renggam	1950
Kelapa Sawit	1950
Kluang	1950
Kota Tinggi	1950
Kulai	1950
Labis	1950
Mersing	1950
Muar	1950
Parit Raja	1950
Pekan Nenas	1950
Pontian Kechil	1950
Segamat	1950
Skudai	1950
Taman Senai	1950
Tangkak	1950
Ulu Tiram	1950
Yong Peng	1950
Alor Setar	1947
Ayer Hangat	1947
Bedong	1947
Gurun	1947
Jitra	1947
Kampung Kilim	1947
Kampung Kok	1947
Kuah	1947
Kuala Kedah	1947
Kuala Teriang	1947
Kulim	1947
Langkawi	1947
Padang Mat Sirat	1947
Sungai Petani	1947
Gua Musang	1946
Kampong Kadok	1946
Kampong Pangkal Kalong	1946
Kota Bharu	1946
Pasir Mas	1946
Peringat	1946
Tumpat	1946
Kuala Lumpur	1949
Labuan	1935
Alor Gajah	1941
Batu Berendam	1941
Bemban	1941
Bukit Rambai	1941
Kampong Masjid Tanah	1941
Kampung Ayer Keroh	1941
Kampung Ayer Molek	1941
Kampung Bukit Baharu	1941
Klebang Besar	1941
Kuala Sungai Baru	1941
Malacca	1941
Pulau Sebang	1941
Sungai Udang	1941
Bahau	1948
Kampung Baharu Nilai	1948
Kuala Pilah	1948
Port Dickson	1948
Seremban	1948
Tampin	1948
Bentong Town	1940
Jerantut	1940
Kampung Bukit Tinggi, Bentong	1940
Kampung Tekek	1940
Kuala Lipis	1940
Kuantan	1940
Mentekab	1940
Pekan	1940
Raub	1940
Tanah Rata	1940
Temerluh	1940
Batu Feringgi	1939
Bukit Mertajam	1939
Butterworth	1939
George Town	1939
Juru	1939
Kampung Batu Feringgi	1939
Kampung Sungai Ara	1939
Kepala Batas	1939
Nibong Tebal	1939
Perai	1939
Permatang Kuching	1939
Seberang Perai	1939
Tanjung Tokong	1939
Tasek Glugor	1939
Telaga Batu	1939
Bagan Serai	1943
Batu Gajah	1943
Bidur	1943
Ipoh	1943
Kampar	1943
Kampong Dungun	1943
Kuala Kangsar	1943
Lumut	1943
Pantai Remis	1943
Parit Buntar	1943
Simpang Empat	1943
Taiping	1943
Tapah Road	1943
Teluk Intan	1943
Kangar	1938
Kuala Perlis	1938
Pantai Cenang	1938
Putrajaya	1945
Bandar Labuan	1936
Beaufort	1936
Donggongon	1936
Keningau	1936
Kinarut	1936
Kota Belud	1936
Kota Kinabalu	1936
Kudat	1936
Lahad Datu	1936
Papar	1936
Putatan	1936
Ranau	1936
Sandakan	1936
Semporna	1936
Taman Rajawali	1936
Tawau	1936
Bintulu	1937
Data Kakus	1937
Kapit	1937
Kuching	1937
Lawas	1937
Lidung Jelo	1937
Limbang	1937
Long Ampan Aing or Abanang	1937
Marudi	1937
Miri	1937
Mukah	1937
Sarikei	1937
Sibu	1937
Simanggang	1937
Ampang	1944
Bagan Pulau Ketam	1944
Banting	1944
Batang Berjuntai	1944
Batu Arang	1944
Jenjarum	1944
Kampong Baharu Balakong	1944
Kampung Baru Subang	1944
Kampung Tanjung Karang	1944
Klang	1944
Kuala Selangor	1944
Kuang	1944
Ladang Seri Kundang	1944
Pelabuhan Klang	1944
Petaling Jaya	1944
Putra Heights	1944
Rawang	1944
Semenyih	1944
Serendah	1944
Shah Alam	1944
Subang Jaya	1944
Sungai Besar	1944
Sungai Pelek New Village	1944
Tanjung Sepat	1944
Cukai	1942
Jertih	1942
Kampung Kuala Besut	1942
Kertih	1942
Kuala Besut	1942
Kuala Terengganu	1942
Marang	1942
Paka	1942
Singapore	4651
Woodlands	4653
N/A	4649
N/A	4650
N/A	4652
\.


--
-- TOC entry 3016 (class 0 OID 49950)
-- Dependencies: 213
-- Data for Name: app_data_country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_data_country (country, iso2, nationality) FROM stdin;
Malaysia	MY	Malaysian
Singapore	SG	Singaporean
\.


--
-- TOC entry 3017 (class 0 OID 49958)
-- Dependencies: 214
-- Data for Name: app_data_state; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_data_state (iso2, state, id) FROM stdin;
MY	Johor	1950
MY	Kedah	1947
MY	Kelantan	1946
MY	Kuala Lumpur	1949
MY	Labuan	1935
MY	Melaka	1941
MY	Negeri Sembilan	1948
MY	Pahang	1940
MY	Penang	1939
MY	Perak	1943
MY	Perlis	1938
MY	Putrajaya	1945
MY	Sabah	1936
MY	Sarawak	1937
MY	Selangor	1944
MY	Terengganu	1942
SG	Central Singapore Community Development Council	4651
SG	North East Community Development Council	4649
SG	North West Community Development Council	4653
SG	South East Community Development Council	4650
SG	South West Community Development Council	4652
\.


--
-- TOC entry 3028 (class 0 OID 57453)
-- Dependencies: 225
-- Data for Name: app_exercise; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_exercise (id, created_dt, oscillation_num, time_taken, done, part_id_id) FROM stdin;
2	2021-05-30 13:37:33.540748+08	10	120.23	t	23
3	2021-05-30 13:37:56.020916+08	10	120.23	t	23
4	2021-05-30 13:57:34.382249+08	10	120.23	t	6
5	2021-05-30 14:12:18.39953+08	1	120.23	t	6
6	2021-05-30 14:12:30.99753+08	0	120.23	f	6
7	2021-05-30 14:50:50.839473+08	1	3.0099999999999998	t	6
8	2021-05-30 14:51:28.257522+08	1	2.1560000000000001	t	6
9	2021-05-30 14:51:51.796403+08	1	3.5600000000000001	t	6
10	2021-05-30 14:53:30.80388+08	1	3.9329999999999998	t	6
11	2021-05-30 15:11:06.59582+08	0	6.2889999999999997	f	6
12	2021-05-30 15:19:41.098689+08	1	17.529	t	6
13	2021-05-30 15:21:43.229741+08	1	11.374000000000001	t	6
14	2021-05-30 15:23:32.23371+08	0	20.132999999999999	f	6
15	2021-05-30 15:30:32.729026+08	1	6.1050000000000004	t	6
16	2021-05-30 15:31:11.286101+08	1	22.896000000000001	t	6
17	2021-05-30 15:31:22.968956+08	1	3.9039999999999999	t	6
18	2021-05-30 15:33:13.681933+08	1	5.5049999999999999	t	6
19	2021-05-30 15:33:44.042694+08	1	3.1269999999999998	t	6
20	2021-05-30 15:35:35.876824+08	1	10.759	t	6
21	2021-05-30 15:36:16.63121+08	1	3.8340000000000001	t	6
22	2021-05-30 15:36:44.817671+08	1	3.3239999999999998	t	6
23	2021-05-30 15:40:06.816999+08	1	63.026000000000003	t	6
24	2021-05-30 15:42:28.407803+08	0	115.327	f	6
25	2021-05-30 15:43:58.534717+08	0	84.271000000000001	f	6
26	2021-05-30 15:44:34.340048+08	1	26.776	t	6
27	2021-05-31 01:23:05.585247+08	0	120.23	f	7
28	2021-05-31 01:41:36.050382+08	0	120.23	f	7
29	2021-05-31 01:41:52.815568+08	0	120.23	f	6
30	2021-05-31 11:44:25.172899+08	0	120.23	f	6
31	2021-05-31 11:44:48.601526+08	10	120.23	t	7
43	2021-05-21 16:30:12.855754+08	5	120.23	f	69
44	2021-05-22 16:30:13.722056+08	5	120.23	f	69
45	2021-05-23 16:30:14.324755+08	5	120.23	f	69
46	2021-05-24 16:30:15.098243+08	6	120.23	f	69
47	2021-05-25 16:30:15.764813+08	6	120.23	f	69
48	2021-05-26 16:30:16.440326+08	6	120.23	f	69
49	2021-05-27 16:30:17.129697+08	7	120.23	f	69
50	2021-05-28 16:30:17.862151+08	8	120.23	f	69
51	2021-05-29 16:30:18.578153+08	8	120.23	f	69
32	2021-05-30 16:27:16.32506+08	8	120.23	f	69
33	2021-05-21 16:27:22.605128+08	5	120.23	f	70
34	2021-05-22 16:29:53.246683+08	6	120.23	f	70
35	2021-05-23 16:29:54.22442+08	6	120.23	f	70
36	2021-05-24 16:29:55.059534+08	6	120.23	f	70
37	2021-05-25 16:29:56.11403+08	6	120.23	f	70
38	2021-05-26 16:29:56.893343+08	6	120.23	f	70
39	2021-05-27 16:29:57.759641+08	7	120.23	f	70
40	2021-05-28 16:29:58.606816+08	7	120.23	f	70
41	2021-05-29 16:29:59.434383+08	7	120.23	f	70
42	2021-05-30 16:30:00.167415+08	7	120.23	f	70
52	2021-06-01 10:53:49.246292+08	5	120.23	f	69
53	2021-06-01 10:54:15.44909+08	5	120.23	f	69
54	2021-06-01 10:54:59.865741+08	5	120.23	f	69
55	2021-06-01 10:55:18.606622+08	5	120.23	f	69
56	2021-06-01 18:58:10.497725+08	5	120.23	f	70
63	2021-06-01 19:51:46.469115+08	5	52.793999999999997	f	69
64	2021-06-07 19:11:02.374187+08	5	120.23	f	70
74	2021-06-09 20:22:01.816094+08	5	120.23	f	70
\.


--
-- TOC entry 3022 (class 0 OID 57426)
-- Dependencies: 219
-- Data for Name: app_part; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_part (id, description, name, recovery_dt, status, created_dt, created_by, case_id_id) FROM stdin;
6	part 1 desc	Upper Right Limb	\N	Under Treatment	2021-04-27 16:51:33.297855+08	R0000212	9
7	part 2 desc	Upper Left Limb	\N	Under Treatment	2021-04-27 16:51:33.344101+08	R0000212	9
69	Mild injury.	Lower Right Limb	\N	Under Treatment	2021-05-30 21:56:24.289301+08	R0000212	43
70	Mild injury.	Lower Left Limb	\N	Under Treatment	2021-05-30 21:56:24.492491+08	R0000212	43
19	part 1 desc	Upper Right Limb	\N	Under Treatment	2021-04-27 17:44:59.34958+08	R0000212	13
20	part 2 desc	Upper Left Limb	\N	Under Treatment	2021-04-27 17:44:59.365583+08	R0000212	13
21	asasa	Upper Right Limb	\N	Recovered	2021-04-27 17:44:59.371585+08	R0000212	13
22	aaa	Lower Left Limb	\N	Under Treatment	2021-04-27 17:44:59.375581+08	R0000212	13
26	None	Upper Right Limb	\N	Recovered	2021-04-27 18:31:45.405053+08	R0000212	15
27	part 2 desc	Upper Left Limb	\N	Under Treatment	2021-04-27 18:31:45.414054+08	R0000212	15
28	None	Upper Right Limb	\N	Recovered	2021-04-27 18:32:21.279705+08	R0000212	16
29	part 2 desc	Upper Left Limb	\N	Under Treatment	2021-04-27 18:32:21.290707+08	R0000212	16
30	a	Upper Left Limb	\N	Under Treatment	2021-04-27 18:32:21.295706+08	R0000212	16
31	None	Upper Right Limb	\N	Under Treatment	2021-04-27 18:44:03.52005+08	R0000212	18
32	None	Upper Right Limb	\N	Under Treatment	2021-04-27 22:08:30.21482+08	R0000212	20
33	a	Upper Right Limb	\N	Under Treatment	2021-04-27 22:08:30.277818+08	R0000212	20
34	None	Upper Right Limb	\N	Under Treatment	2021-04-27 22:09:13.746847+08	R0000212	21
35	a	Upper Right Limb	\N	Under Treatment	2021-04-27 22:09:13.755843+08	R0000212	21
36	None	Upper Right Limb	\N	Under Treatment	2021-04-27 22:09:45.510611+08	R0000212	22
37	a	Upper Right Limb	\N	Under Treatment	2021-04-27 22:09:45.523609+08	R0000212	22
38	None	Upper Right Limb	\N	Under Treatment	2021-04-27 23:07:50.217541+08	R0000212	23
39	None	Upper Right Limb	\N	Under Treatment	2021-04-27 23:11:34.291758+08	R0000212	24
40	None	Upper Right Limb	\N	Under Treatment	2021-04-27 23:11:49.460844+08	R0000212	25
41	None	Upper Right Limb	\N	Under Treatment	2021-04-27 23:39:57.950752+08	R0000212	26
42	None	Upper Right Limb	\N	Under Treatment	2021-04-27 23:45:50.921104+08	R0000212	27
43	None	Upper Right Limb	\N	Under Treatment	2021-04-27 23:46:12.84554+08	R0000212	28
44	None	Upper Right Limb	\N	Under Treatment	2021-04-27 23:46:42.77525+08	R0000212	29
45	None	Upper Right Limb	\N	Under Treatment	2021-04-27 23:48:10.535298+08	R0000212	30
46	des	Upper Right Limb	\N	Under Treatment	2021-04-28 00:08:12.255059+08	R0000212	31
47	des	Upper Right Limb	\N	Under Treatment	2021-04-28 00:12:00.316503+08	R0000212	32
48	des	Upper Right Limb	\N	Under Treatment	2021-04-28 00:14:02.041205+08	R0000212	33
49	des	Upper Right Limb	\N	Under Treatment	2021-04-28 00:14:52.486822+08	R0000212	34
50	des	Upper Right Limb	\N	Under Treatment	2021-04-28 00:15:38.625966+08	R0000212	35
51	des	Upper Right Limb	\N	Under Treatment	2021-04-28 00:18:33.312704+08	R0000212	36
52	a	Upper Left Limb	\N	Under Treatment	2021-04-28 23:56:36.066406+08	R0000212	37
23	1	Upper Right Limb	\N	Under Treatment	2021-04-27 17:47:19.477306+08	R0000212	14
64	12	Upper Left Limb	\N	Under Treatment	2021-04-29 12:46:09.481386+08	R0000212	38
65	12	Upper Left Limb	\N	Under Treatment	2021-04-29 13:12:51.010446+08	R0000212	39
66	12	Upper Left Limb	\N	Under Treatment	2021-04-29 13:12:54.873315+08	R0000212	40
11	part 1 desc	Upper Right Limb	\N	Under Treatment	2021-04-27 16:55:31.360876+08	R0000212	11
12	part 2 desc	Upper Left Limb	\N	Under Treatment	2021-04-27 16:55:31.374472+08	R0000212	11
67	q	Upper Left Limb	\N	Under Treatment	2021-04-29 13:15:03.890707+08	R0000212	41
68	1	Upper Left Limb	\N	Recovered	2021-04-29 13:44:20.477152+08	R0000212	42
60	3	Lower Left Limb	\N	Under Treatment	2021-04-29 12:44:28.072261+08	R0000212	14
61	2	Lower Left Limb	\N	Under Treatment	2021-04-29 12:44:28.082595+08	R0000212	14
63	5	Upper Left Limb	\N	Recovered	2021-04-29 12:45:33.404074+08	R0000212	14
71	Mild injury.	Lower Right Limb	\N	Under Treatment	2021-06-01 19:21:04.089447+08	R0000212	44
72	Mild injury.	Upper Right Limb	\N	Under Treatment	2021-06-01 19:21:04.127967+08	R0000212	44
73	Mild Injured	Lower Right Limb	\N	Under Treatment	2021-06-01 20:07:29.945319+08	R0000212	45
74	Mild injured	Lower Left Limb	\N	Under Treatment	2021-06-01 20:07:30.012319+08	R0000212	45
78	1	Upper Right Limb	\N	Under Treatment	2021-06-07 18:48:31.122298+08	R0001230	48
97	0	Upper Right Limb	\N	Under Treatment	2021-06-09 12:57:22.179148+08	R0001232	60
98	a	Upper Left Limb	\N	Under Treatment	2021-06-09 13:08:01.863472+08	R0001232	61
\.


--
-- TOC entry 3014 (class 0 OID 49861)
-- Dependencies: 211
-- Data for Name: app_patient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_patient (patient_id, physiotherapist_id) FROM stdin;
R0000090	R0000016
R0000096	R0000018
R0000097	R0000018
R0000098	R0000018
R0000039	R0000019
R0000024	R0000005
R0000025	R0000005
R0000026	R0000005
R0000027	R0000005
R0000028	R0000005
R0000029	R0000005
R0000030	R0000005
R0000031	R0000005
R0000032	R0000005
R0000033	R0000005
R0000034	R0000006
R0000035	R0000006
R0000036	R0000006
R0000037	R0000006
R0000038	R0000006
R0000040	R0000007
R0000041	R0000007
R0000042	R0000007
R0000043	R0000007
R0000044	R0000007
R0000045	R0000008
R0000046	R0000008
R0000047	R0000008
R0000048	R0000008
R0000049	R0000008
R0000050	R0000009
R0000051	R0000009
R0000052	R0000009
R0000053	R0000009
R0000054	R0000009
R0000069	R0000019
R0000073	R0000019
R0000099	R0000019
R0000100	R0000019
R0000101	R0000019
R0000055	R0000010
R0000056	R0000010
R0000057	R0000010
R0000058	R0000010
R0000059	R0000010
R0000060	R0000011
R0000061	R0000011
R0000062	R0000012
R0000063	R0000012
R0000064	R0000013
R0000065	R0000013
R0000066	R0000014
R0000067	R0000014
R0000068	R0000015
R0000070	R0000015
R0000071	R0000015
R0000072	R0000015
R0000074	R0000015
R0000075	R0000015
R0000076	R0000015
R0000077	R0000015
R0000078	R0000015
R0000079	R0000015
R0000080	R0000015
R0000081	R0000015
R0000082	R0000015
R0000083	R0000015
R0000084	R0000015
R0000085	R0000015
R0000086	R0000015
R0000087	R0000015
R0000088	R0000015
R0000102	R0000019
R0000103	R0000019
R0000091	R0000212
R0000092	R0000212
R0000093	R0000212
R0000094	R0000212
R0000095	R0000212
R0000089	R0000015
R0001231	R0001230
R0001233	R0001232
R0001234	R0001232
R0001235	R0001232
R0001240	R0000212
R0001243	R0000212
\.


--
-- TOC entry 3013 (class 0 OID 49853)
-- Dependencies: 210
-- Data for Name: app_physiotherapist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_physiotherapist (physiotherapist_id) FROM stdin;
R0000003
R0000005
R0000006
R0000007
R0000008
R0000009
R0000010
R0000011
R0000012
R0000013
R0000014
R0000015
R0000016
R0000017
R0000018
R0000019
R0000020
R0000021
R0000022
R0000023
R0000212
R0001225
R0001227
R0001230
R0001232
R0001241
R0001242
\.


--
-- TOC entry 3026 (class 0 OID 57445)
-- Dependencies: 223
-- Data for Name: app_predictedrecovery; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_predictedrecovery (id, created_by, created_dt, recovery_dt, part_id_id) FROM stdin;
13	R0000091	2021-06-01 13:12:30.379922+08	2021-07-22 03:51:46.489115+08	69
14	R0000091	2021-06-01 18:58:10.546722+08	2021-09-18 04:22:02.288059+08	70
\.


--
-- TOC entry 3024 (class 0 OID 57437)
-- Dependencies: 221
-- Data for Name: app_target; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_target (id, created_by, created_dt, frequency, oscillation_num, time_taken, part_id_id) FROM stdin;
1	R0000212	2021-04-27 16:51:33.304864+08	3	1	1	6
2	R0000212	2021-04-27 16:51:33.346098+08	2	2	2	7
61	R0000212	2021-04-29 13:12:51.018447+08	2	12	12	65
62	R0000212	2021-04-29 13:12:54.878313+08	2	12	12	66
6	R0000212	2021-04-27 16:55:31.370297+08	1	1	1	11
7	R0000212	2021-04-27 16:55:31.376465+08	1	2	2	12
63	R0000212	2021-04-29 13:15:03.893715+08	1	1	1	67
64	R0000212	2021-04-29 13:44:20.48215+08	2	1	1	68
56	R0000212	2021-04-29 12:44:28.079239+08	1	3	3	60
57	R0000212	2021-04-29 12:44:28.084234+08	1	2	2	61
59	R0000212	2021-04-29 12:45:33.408078+08	1	1	1	63
14	R0000212	2021-04-27 17:44:59.354581+08	3	1	1	19
15	R0000212	2021-04-27 17:44:59.366581+08	2	2	2	20
16	R0000212	2021-04-27 17:44:59.37358+08	2	3	3	21
17	R0000212	2021-04-27 17:44:59.377579+08	2	11	1	22
21	R0000212	2021-04-27 18:31:45.410055+08	2	1	1	26
22	R0000212	2021-04-27 18:31:45.416054+08	2	2	2	27
23	R0000212	2021-04-27 18:32:21.285707+08	2	1	1	28
24	R0000212	2021-04-27 18:32:21.291706+08	2	2	2	29
25	R0000212	2021-04-27 18:32:21.297708+08	3	1	1	30
26	R0000212	2021-04-27 18:44:03.525081+08	3	1	11	31
27	R0000212	2021-04-27 22:08:30.219816+08	3	1	11	32
28	R0000212	2021-04-27 22:08:30.280815+08	2	1	1	33
29	R0000212	2021-04-27 22:09:13.752844+08	3	1	11	34
30	R0000212	2021-04-27 22:09:13.757844+08	2	1	1	35
31	R0000212	2021-04-27 22:09:45.516611+08	3	1	11	36
32	R0000212	2021-04-27 22:09:45.525612+08	2	1	1	37
33	R0000212	2021-04-27 23:07:50.219539+08	3	1	11	38
34	R0000212	2021-04-27 23:11:34.294252+08	3	1	11	39
35	R0000212	2021-04-27 23:11:49.464845+08	3	1	11	40
36	R0000212	2021-04-27 23:39:57.95433+08	3	1	11	41
37	R0000212	2021-04-27 23:45:50.932057+08	3	1	11	42
38	R0000212	2021-04-27 23:46:12.84854+08	3	1	11	43
39	R0000212	2021-04-27 23:46:42.778258+08	3	1	11	44
40	R0000212	2021-04-27 23:48:10.539298+08	3	1	11	45
41	R0000212	2021-04-28 00:08:12.260059+08	3	1	1	46
42	R0000212	2021-04-28 00:12:00.319809+08	3	1	1	47
43	R0000212	2021-04-28 00:14:02.045204+08	3	1	1	48
44	R0000212	2021-04-28 00:14:52.49082+08	3	1	1	49
45	R0000212	2021-04-28 00:15:38.627969+08	3	1	1	50
46	R0000212	2021-04-28 00:18:33.315702+08	3	1	1	51
47	R0000212	2021-04-28 23:56:36.071409+08	2	1	1	52
67	R0000212	2021-06-01 19:21:04.106966+08	1	30	500	71
68	R0000212	2021-06-01 19:21:04.129967+08	4	25	450	72
69	R0000212	2021-06-01 20:07:29.952318+08	1	25	500	73
70	R0000212	2021-06-01 20:07:30.015318+08	1	25	500	74
74	R0001230	2021-06-07 18:48:31.126297+08	1	1	1	78
65	R0000212	2021-05-30 21:56:24.358489+08	1	20	500	69
66	R0000212	2021-05-30 21:56:24.535804+08	1	15	500	70
18	R0000212	2021-04-27 17:47:19.481309+08	1	1	1	23
60	R0000212	2021-04-29 12:46:09.487387+08	2	12	12	64
93	R0001232	2021-06-09 12:57:22.188065+08	5	1	1	97
94	R0001232	2021-06-09 13:08:01.868112+08	2	1	1	98
\.


--
-- TOC entry 3003 (class 0 OID 49733)
-- Dependencies: 200
-- Data for Name: app_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_user (password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, ic_passport, last_name, nationality, phone_num, postcode, status, photo, is_admin, state) FROM stdin;
	\N	R0001243	kianseng21301@gmail.com	Taman Cempadak, Lorong Impian 9	Sibu	MY	2021-06-26 00:27:02.950221+08	1990-01-01	Danny	Male	870903-01-0090	Kent	MY	0125412345	68453	unverified	/profile-images/R0001243-1624638423204.jpg	f	1937
pbkdf2_sha256$216000$K7JFgxRCcQqT$Wfa+9XbUsa8tv4hIDeSON06ze/UIcO85fd5+jrS32+4=	2021-03-03 00:00:00+08	R0000052	R0000052@rehabnow.com	West Ave	Ipoh	MY	2009-12-10 14:49:50.766+08	1986-07-14	Dominic	Male	R0000052	Côté	MY	503-785-6959	C1S 4K7	active	/profile-images/R0000212-1618390242671.png	f	1943
pbkdf2_sha256$216000$EX2Hu8k0urFf$xpMGneok6zG8cAR7qS+VprXuohsjIruT0sOiloRsPSI=	2021-03-03 00:00:00+08	R0000022	R0000022@rehabnow.com	Fatih Sultan Mehmet Cd	Singapore	SG	2005-10-12 21:36:17.55+08	1947-06-30	Okan	Male	R0000022	Nebioğlu	SG	(111)-626-9911	83866	active	/profile-images/R0000212-1618390242671.png	f	4651
pbkdf2_sha256$216000$ApxcNiETWEjw$5Ei+qUvmP41HxzvsY7UVO/1u9swBN/G/NsDCpBj0T68=	2021-03-03 00:00:00+08	R0000014	R0000014@rehabnow.com	Filistin Cd	Bentong Town	MY	2005-04-30 06:34:55.451+08	1963-03-31	Ayşe	Female	R0000014	Çörekçi	MY	(164)-304-4214	40134	active	/profile-images/R0000212-1618390242671.png	f	1940
pbkdf2_sha256$216000$Nxg8iFTh23aZ$Kl8NPhg2AQD+kwGyxMPSLuuXLdMOyMIJml1+dPMIB3A=	2021-03-03 00:00:00+08	R0000055	R0000055@rehabnow.com	Rua São Luiz 	Pekan	MY	2010-05-27 17:54:20.556+08	1966-12-20	Ariadne	Female	R0000055	Fogaça	MY	(09) 0218-9879	57425	active	/profile-images/R0000212-1618390242671.png	f	1940
pbkdf2_sha256$216000$tYonx53IHsxS$eFIGZoz06QnD7sOjNb9ecjSN4No8ZyZSVJAgHVgSOhU=	2021-03-03 00:00:00+08	R0000095	R0000095@rehabnow.com	New Street	Kampong Baharu Balakong	MY	2005-03-26 09:18:27.753+08	1994-09-30	Peter	Male	R0000095	Castillo	MY	0124631320	UA6A 1TJ	active	/profile-images/R0000095-1618898392399.png	f	1944
pbkdf2_sha256$216000$wUFIxiHpnLLS$ZFVEycsb2zdKyO+hi6JSvwdtm2f3a4FaCFgFq9kr/hQ=	2021-03-03 00:00:00+08	R0000023	R0000023@rehabnow.com	Kirchweg	Singapore	SG	2002-03-22 03:45:39.463+08	1997-02-28	Helge	Male	R0000023	Kuschel	SG	0890-5396085	28580	active	/profile-images/R0000212-1618390242671.png	f	4651
pbkdf2_sha256$216000$Eam3tz0thiCY$Imwh+3LQzYjRRGx8pGWGdr+fzL91AwxAdbMsM3kkQoA=	2021-06-29 11:47:54.04828+08	R0000212	kianseng213@gmail.com	Taman Teluk Intan	Mentekab	MY	2021-04-06 12:39:41.465118+08	1987-02-10	Looi	Male	870903-01-0092	Kian Seng	MY	0123456123	36000	active	/profile-images/R0000212-1623647527520.jpg	f	1940
pbkdf2_sha256$216000$rNY4i3gcd0GH$tbYWsRa+0dpSVMDmYHBtuIxmbP0crGrc1kZgn5yqy7g=	2021-06-07 16:49:47.572756+08	R0001230	johndoe3@rehabnow.com	Taman Cempadak, Lorong Impian 10	Ipoh	MY	2021-06-07 16:48:58.292046+08	2021-06-07	Doe 1	Male	R0001230	John	MY	0125412345	51230	active	/profile-images/R0001230-1623062174017.JPG	f	1943
pbkdf2_sha256$216000$jfXnBHQUXBT5$HEIHCUE7XLYZDKh+hHKOT1FUYnOSXfZBj6OSR+32Gjg=	2021-03-03 00:00:00+08	R0000096	R0000096@rehabnow.com	Carl Grøndahls vei	Kampong Baharu Balakong	MY	2005-09-02 17:19:56.92+08	1970-10-13	Elisa	Female	R0000096	Friberg	MY	34053228	2690	active	/profile-images/R0000212-1618390242671.png	f	1944
pbkdf2_sha256$216000$HHNOjOeaPalb$icZAl5b7QKhmS0XqpScEP0zIAWuSfpa9mSGmpMRVkjA=	2021-03-03 00:00:00+08	R0000098	R0000098@rehabnow.com	Øvreseterveien	Kampong Baharu Balakong	MY	2012-08-09 22:38:42.102+08	1956-09-28	Emmeline	Female	R0000098	Sikveland	MY	73193655	7481	active	/profile-images/R0000212-1618390242671.png	f	1944
pbkdf2_sha256$216000$JrP9morCA9ai$mIXIhlPxBe6VRLX/m6pJi27mU+ZCbLX1m7iRSxw7Z4A=	2021-03-03 00:00:00+08	R0000075	R0000075@rehabnow.com	Rua Dom Pedro Ii 	Bakri	MY	2006-12-08 11:42:56.306+08	1964-08-02	Sândi	Female	R0000075	Barbosa	MY	(30) 0568-5991	31463	active	/profile-images/R0000212-1618390242671.png	f	1950
pbkdf2_sha256$216000$F5JphMZb6apm$6CqCal6MQfphEvqMILpzZ3kc2ffGbWGInhbGn/ioqAs=	2021-03-03 00:00:00+08	R0000089	R0000089@rehabnow.com	Æblehaven	Kampar	MY	2018-09-15 15:40:33.667+08	1995-05-14	Alma	Female	R0000089	Jensen	MY	76884300	19522	active	/profile-images/R0000212-1618390242671.png	f	1943
pbkdf2_sha256$216000$upErdLyAY4xJ$+Wf+UB3KhNjVxtImpeDspECN1/rguMSJlAxTIoCJvmI=	2021-03-03 00:00:00+08	R0000043	R0000043@rehabnow.com	Damveien	Kuantan	MY	2014-06-09 07:13:07.798+08	1947-09-18	Nathalie	Female	R0000043	Krasniqi	MY	86502789	2640	active	/profile-images/R0000212-1618390242671.png	f	1940
pbkdf2_sha256$216000$AA6Q4AlmQMMa$9NJYJyuP6pH67ym6NgKE0PONmamh1j9Cft+u94vy3gQ=	2021-03-03 00:00:00+08	R0000103	R0000103@rehabnow.com	Rue de LAbbé-Grégoire	Batang Berjuntai	MY	2007-08-02 16:38:41.823+08	1959-02-24	Grégory	Male	R0000103	Morin	MY	076 123 99 35	7617	active	/profile-images/R0000212-1618390242671.png	f	1944
pbkdf2_sha256$216000$1ssMJskQUZEk$IPlGezj46M/ZAsV9IdtrzgauCFsatbxVippgao3Xklo=	2021-03-03 00:00:00+08	R0000019	R0000019@rehabnow.com	Necatibey Cd	Bentong Town	MY	2009-01-10 20:38:31.206+08	1983-04-03	Nalan	Female	R0000019	Ekşioğlu	MY	(625)-687-7809	80046	active	/profile-images/R0000212-1618390242671.png	f	1940
pbkdf2_sha256$216000$XFYYEbXne9hu$3G18rvApvWG1mY27+CfmC6D0lxBkn1SIIkE4/uOrnag=	2021-03-03 00:00:00+08	R0000040	R0000040@rehabnow.com	Albert Road	Kuantan	MY	2011-04-14 22:31:20.148+08	1980-12-27	Leah	Female	R0000040	Murray	MY	071-313-5937	58668	active	/profile-images/R0000212-1618390242671.png	f	1940
pbkdf2_sha256$216000$D5qsoJWIm1lU$cAQymXigrLr+GPSMMqVO0UCZbB3q9HXSupwK7a1cqcc=	\N	R0001235	johndoe21@rehabnow.com	Taman Cempadak, Lorong Impian 11	Bandar Labuan	MY	2021-06-09 17:13:36.450425+08	1990-01-01	Doe 2	Male	R0001235	John	MY	0125412345	51230	active	/profile-images/R0001235-1623230016739.JPG	f	1936
pbkdf2_sha256$216000$oNuoMIw43oho$lUn2fsRivpuV/v6KoHQNHNsLD42qzJcdTTgf1KG4hIY=	2021-03-03 00:00:00+08	R0000038	R0000038@rehabnow.com	Pyynikintie	N/A	SG	2013-05-04 17:17:08.641+08	1997-02-17	Anton	Male	R0000038	Kyllo	SG	09-328-745	22586	active	/profile-images/R0000212-1618390242671.png	f	4649
pbkdf2_sha256$216000$cuWfS7Y4ogKj$pKKo3hFwGhkKHPDFbh5HgLGhXPwn+lLRNALFw/VcMlU=	2021-03-03 00:00:00+08	R0000045	R0000045@rehabnow.com	The Grove	N/A	SG	2018-10-30 23:03:47.996+08	1994-08-25	Brent	Male	R0000045	Sullivan	SG	021-983-6051	62228	active	/profile-images/R0000212-1618390242671.png	f	4649
pbkdf2_sha256$216000$jIHBA69NbpTu$Dd5cLTGuEtBN78jT6JLBLz9rOljKWnH6AguH3IPg+Uc=	2021-03-03 00:00:00+08	R0000046	R0000046@rehabnow.com	Pilestredet Park	N/A	SG	2007-06-11 12:17:00.864+08	1969-03-22	Audun	Male	R0000046	Sætre	SG	33746675	6220	active	/profile-images/R0000212-1618390242671.png	f	4649
pbkdf2_sha256$216000$LwCrCVxbmQeN$m2ZgGjUsLcElvowMMR5FKTfGROEsWRkxIEuTqW2ybsU=	2021-03-03 00:00:00+08	R0000047	R0000047@rehabnow.com	Vænget	N/A	SG	2014-02-12 06:34:54.055+08	1955-05-04	Rosa	Female	R0000047	Pedersen	SG	77627981	26812	active	/profile-images/R0000212-1618390242671.png	f	4649
pbkdf2_sha256$216000$HdAALBNLHuR8$NHavXs17xSI6S2qu24FcrbwjBijcOSZis2ls2AxmCv4=	2021-03-03 00:00:00+08	R0000010	R0000010@rehabnow.com	شهید شهرام امیری	Jerantut	MY	2007-06-27 03:31:55.945+08	1958-07-16	کوروش	Male	R0000010	کوتی	MY	006-35968784	35418	active	/profile-images/R0000212-1618390242671.png	f	1940
pbkdf2_sha256$216000$xarbTvQ7sIld$WZ1uhCn0nOk7oMPXRKptACs6033IdFSdlxuymaOHs+4=	2021-03-03 00:00:00+08	R0000048	R0000048@rehabnow.com	High Street	Kuala Lumpur	MY	2013-05-13 20:44:53.429+08	1983-05-05	Jeffery	Male	R0000048	Garcia	MY	013873 97516	KI4 7EA	active	/profile-images/R0000212-1618390242671.png	f	1949
pbkdf2_sha256$216000$i8cI0TyrDclu$Q8aRZyEJb2uXkCo9zUnzyjjvMNhdCmfB+jxvksPi950=	2021-03-03 00:00:00+08	R0000050	R0000050@rehabnow.com	Calle de Atocha	Kuala Lumpur	MY	2012-09-09 00:01:11.818+08	1946-05-11	Adrian	Male	R0000050	Herrera	MY	921-707-018	96254	active	/profile-images/R0000212-1618390242671.png	f	1949
pbkdf2_sha256$216000$xTfiPFspbPmj$cFV/7gfsU/sDjQbb1CMiYTnEut0HgdGRp+kTp8xv8EI=	2021-03-03 00:00:00+08	R0000027	R0000027@rehabnow.com	E North St	Singapore	SG	2012-05-12 13:47:44.356+08	1986-02-10	Don	Male	R0000027	Roberts	SG	06-2935-9037	5665	active	/profile-images/R0000212-1618390242671.png	f	4651
pbkdf2_sha256$216000$qlnUTtkgrMNj$H/zJXd/X2P1rsESh7pz1Kxx/T7S+sheuAc92wl2QRWc=	2021-03-03 00:00:00+08	R0000021	R0000021@rehabnow.com	Trollvannsveien	Jerantut	MY	2006-06-13 18:51:46.202+08	1973-09-05	Aisha	Female	R0000021	Røgeberg	MY	84247533	4088	active	/profile-images/R0000212-1618390242671.png	f	1940
pbkdf2_sha256$216000$9lXGwgG7oMe7$eVOZ/7y26KDoGV7L/C+moBdgKjfMKY0Bm2vej2n8d1g=	2021-03-03 00:00:00+08	R0000049	R0000049@rehabnow.com	Fitzgerald Avenue	Kuala Lumpur	MY	2014-07-09 16:15:16.057+08	1997-04-14	Aaliyah	Female	R0000049	Zhang	MY	(638)-221-8246	56388	active	/profile-images/R0000212-1618390242671.png	f	1949
pbkdf2_sha256$216000$sY1CymAYm9Pw$g5ihWapRR8HOnO18QKmLwvrl5vqB9bdvDE7sDnM2Xvg=	2021-03-03 00:00:00+08	R0000030	R0000030@rehabnow.com	Avenida de América	Singapore	SG	2017-07-08 23:33:19.804+08	1998-08-31	Gloria	Female	R0000030	Castro	SG	915-936-987	72417	active	/profile-images/R0000212-1618390242671.png	f	4651
pbkdf2_sha256$216000$49Ph8oLjbrhK$3BqWdUlQPezneUwvB+F445vzf62MiNITphMzCXJL5BI=	2021-03-03 00:00:00+08	R0000079	R0000079@rehabnow.com	Kingsway	Daerah Johor Baharu	MY	2008-10-29 21:04:01.76+08	1982-08-06	Vicky	Female	R0000079	Parker	MY	0110811 658 7015	U0 2YL	active	/profile-images/R0000212-1618390242671.png	f	1950
pbkdf2_sha256$216000$5Nl0ngBF00xk$9IExmH+AGFaMw/KLSW4+U+swrHdfkIZVkH0vL7nymAg=	2021-03-03 00:00:00+08	R0000031	R0000031@rehabnow.com	Spring St	Singapore	SG	2011-02-22 11:22:10.203+08	1981-10-22	Dawn	Female	R0000031	Andrews	SG	(921)-379-1676	11854	active	/profile-images/R0000212-1618390242671.png	f	4651
pbkdf2_sha256$216000$AVJbdIOvT4it$61EkAg6sbFWGJAq0X6OrMsh/cXuPYPJD4PP6J86qbTU=	\N	R0001240	kianseng213qq@gmail.com	Taman Cempadak, Lorong Impian 9	Taman Senai	MY	2021-06-14 13:12:48.497702+08	1990-01-01	Doe	Male	R0001240	John	MY	0125412345	68453	active	/profile-images/R0001240-1623647659796.jpg	f	1950
pbkdf2_sha256$216000$5nCpbkIZNX1i$Cfogi8OquQJUhcGDHFrKSlp83NaICRDPlq0/tfmq9BY=	2021-04-20 14:19:55.835936+08	R0001225	gyh0001gogogo@gmail.com			\N	2021-04-20 14:17:20.692781+08	\N			R0001225					active		f	\N
pbkdf2_sha256$216000$Pp9M9zZZKLMY$WXGcB/avcN7wUK09sPdiuTK9oVx/TuPNgsZxB9MMvqE=	2021-03-03 00:00:00+08	R0000035	R0000035@rehabnow.com	Itsenäisyydenkatu	N/A	SG	2007-05-22 12:43:13.71+08	1946-12-09	Aada	Female	R0000035	Nikula	SG	06-005-759	10473	active	/profile-images/R0000212-1618390242671.png	f	4649
pbkdf2_sha256$216000$MMrhVzEcVNID$KSWHimKG5M/smYq4J/Qhpirn2/NbYBU5iA3s/ClA5qQ=	2021-03-03 00:00:00+08	R0000028	R0000028@rehabnow.com	Maple Ave	Singapore	SG	2003-10-21 07:03:25.445+08	1957-09-26	Marilou	Female	R0000028	Liu	SG	004-718-0712	P1W 7S5	active	/profile-images/R0000212-1618390242671.png	f	4651
pbkdf2_sha256$216000$DNwpzWnOCcQT$VcqxOVgQY65EkuzX6Mo/9C4I1HiHAGZCepCQDd3dn0o=	2021-03-03 00:00:00+08	R0000007	R0000007@rehabnow.com	Rue des Écoles	Kuala Lumpur	MY	2009-06-14 14:27:17.902+08	1964-01-09	Tom	Male	R0000007	Thomas	MY	03-30-82-44-74	79797	active	/profile-images/R0000212-1618390242671.png	f	1949
pbkdf2_sha256$216000$K5JNpGwSYvu3$RCTCVSNelKIuBANJ20iBaqxfRwx3g5ZxPoznI1lBud0=	2021-03-03 00:00:00+08	R0000087	R0000087@rehabnow.com	Gullkroken	Lumut	MY	2004-08-20 19:02:21.492+08	1990-09-07	Jayden	Male	R0000087	Roberg	MY	85460688	3071	active	/profile-images/R0000212-1618390242671.png	f	1943
pbkdf2_sha256$216000$j7061jvE90GP$doX2dKXe1FXcz5NMF8T15jVdb/RfMQWhL2SMdmjjaEU=	2021-03-03 00:00:00+08	R0000025	R0000025@rehabnow.com	Rue de LÉglise	Singapore	SG	2009-10-05 13:27:10.894+08	1949-06-18	Marion	Female	R0000025	Adam	SG	04-40-00-57-90	54820	active	/profile-images/R0000212-1618390242671.png	f	4651
pbkdf2_sha256$216000$ZMkZW8qn2pWA$Ai1CYfhGMTpjpz19drH0F1TY2GtHKEs2mhJjbfnH4i8=	2021-03-03 00:00:00+08	R0000076	R0000076@rehabnow.com	Præstevænget	Daerah Johor Baharu	MY	2019-06-17 12:55:56.42+08	1981-04-29	Andreas	Male	R0000076	Johansen	MY	99723034	45411	active	/profile-images/R0000212-1618390242671.png	f	1950
pbkdf2_sha256$216000$cEOym5Rs0GaB$t++dadgd5r7vJrSbFiTPRNryv52ho5BxUSw8qHBeXbQ=	2021-03-03 00:00:00+08	R0000061	R0000061@rehabnow.com	Helgesvej	Kuala Lumpur	MY	2012-02-09 09:58:30.797+08	1978-02-09	Johan	Male	R0000061	Sørensen	MY	65285253	47772	active	/profile-images/R0000212-1618390242671.png	f	1949
pbkdf2_sha256$216000$4IfrTFsGCnq2$FUypEpb6qN0OTevCgJMIRgKf1GMIOTPYDLUKGdZbIH8=	2021-03-03 00:00:00+08	R0000032	R0000032@rehabnow.com	Rue du Bât-DArgent	Singapore	SG	2012-06-24 21:35:01.603+08	1963-12-02	Veronica	Female	R0000032	Nguyen	SG	078 704 62 98	3205	active	/profile-images/R0000212-1618390242671.png	f	4651
pbkdf2_sha256$216000$0qfAKmm8HoYz$dejohxVqpHZiKduX/ZPQpxhb8K6qxtz4k2TScGtwzg0=	2021-03-03 00:00:00+08	R0000071	R0000071@rehabnow.com	Lindenweg	Batu Pahat	MY	2016-08-04 05:08:59.715+08	1990-03-09	Nathalie	Female	R0000071	Tetzlaff	MY	0511-4430439	89235	active	/profile-images/R0000212-1618390242671.png	f	1950
pbkdf2_sha256$216000$31FaIGySPG6P$gG9BKKLUEI71F4zC5/NygZ1iT0lPC1B0ym5ERt5QKQk=	2021-03-03 00:00:00+08	R0000058	R0000058@rehabnow.com	Rue des Ecrivains	Kuala Lumpur	MY	2006-05-18 08:05:26.225+08	1962-04-29	Viktoria	Female	R0000058	Fabre	MY	078 939 69 82	4621	active	/profile-images/R0000212-1618390242671.png	f	1949
pbkdf2_sha256$216000$0FNdNk9S9oBU$d4+qy351qWRNEgk1WrWldy4ML+G/IWM18PswlXbCMKU=	2021-03-03 00:00:00+08	R0000066	R0000066@rehabnow.com	Oaks Cross	Bakri	MY	2015-12-06 22:14:41.353+08	1946-03-30	Lily	Female	R0000066	Elliott	MY	013873 10659	RB5J 0PT	active	/profile-images/R0000212-1618390242671.png	f	1950
pbkdf2_sha256$216000$PU8vWYLEH1HK$2E0SCeVPFnwsb5TEnCCZoBCO8mAE80JEu4S0Ir5yqZ0=	2021-03-03 00:00:00+08	R0000065	R0000065@rehabnow.com	Römerstraße	Bakri	MY	2003-03-19 23:02:23.291+08	1978-06-13	Milka	Female	R0000065	Hofer	MY	0675-8583168	95601	active	/profile-images/R0000212-1618390242671.png	f	1950
pbkdf2_sha256$216000$63ksRnujuTK8$Pv056CwBDt/F2a7UJTk5MzHBhx5h5segXwGn/dxiA3U=	2021-03-03 00:00:00+08	R0000080	R0000080@rehabnow.com	Presidentgata	Ipoh	MY	2010-10-04 22:58:07.414+08	1945-11-20	Zakariya	Male	R0000080	Vanvik	MY	64794238	6447	active	/profile-images/R0000212-1618390242671.png	f	1943
pbkdf2_sha256$216000$V53RCt6rspgd$Yx/in2ULiRTd16kH8PjDW1XsFbJSLqzqPPv5Qc5sVOU=	2021-03-03 00:00:00+08	R0000083	R0000083@rehabnow.com	New Road	Kampar	MY	2012-11-16 01:14:54.174+08	1959-06-16	Clayton	Male	R0000083	Williams	MY	071-398-3732	37619	active	/profile-images/R0000212-1618390242671.png	f	1943
pbkdf2_sha256$216000$zkuHpdGT9JvR$4JMMCgE5fCWWwWK2VsU9JhLdkLwRBu3jdCmOEb3KTOg=	2021-03-03 00:00:00+08	R0000082	R0000082@rehabnow.com	North Street	Kampar	MY	2004-06-16 09:55:02.403+08	1982-05-23	Ian	Male	R0000082	Smythe	MY	061-519-3990	89414	active	/profile-images/R0000212-1618390242671.png	f	1943
pbkdf2_sha256$216000$HM3xKGHnFG6x$hsNeTMJGYtcjTFIs8FneF0KT6ktJHGvJ0pvK4C6jTc4=	2021-03-03 00:00:00+08	R0000069	R0000069@rehabnow.com	Faunveien	Kuala Lumpur	MY	2016-06-04 04:45:21.368+08	1958-02-01	Vebjørn	Male	R0000069	Yildirim	MY	86293614	6456	active	/profile-images/R0000212-1618390242671.png	f	1949
pbkdf2_sha256$216000$2fORhaE3TgK1$NgFmj7IGKRhHjlFfYKTnRnXfFPmodIcPRhAY8EIYngg=	2021-03-03 00:00:00+08	R0000053	R0000053@rehabnow.com	Rue Dubois	Kuala Lumpur	MY	2011-12-09 05:41:16.185+08	1966-05-23	Adam	Male	R0000053	Dumas	MY	02-86-87-46-17	91160	active	/profile-images/R0000212-1618390242671.png	f	1949
pbkdf2_sha256$216000$zz9k5VPREYlF$NM3ZR2NxYNO5mw/t0Bob9zzmqv8D0GXvtFROR7KLXZY=	2021-03-03 00:00:00+08	R0000067	R0000067@rehabnow.com	Rua Dezesseis de Maio	Bakri	MY	2003-10-05 08:34:38.405+08	1961-11-02	Olivier	Male	R0000067	Duarte	MY	(76) 8586-6851	94810	active	/profile-images/R0000212-1618390242671.png	f	1950
pbkdf2_sha256$216000$3GBUxoGl7Jpq$ynsRKyhRIgVjRYUZtI4A0iebni9LTdDUi38WN2gP0BQ=	2021-03-03 00:00:00+08	R0000009	R0000009@rehabnow.com	Korkeavuorenkatu	Kuantan	MY	2014-04-24 23:53:17.458+08	1982-01-10	Sofia	Female	R0000009	Hamalainen	MY	05-819-865	86964	active	/profile-images/R0000212-1618390242671.png	f	1940
pbkdf2_sha256$216000$b18kr8AtHXe7$s9zMZZbjqKi6dP0hYsmpaUm3G3tuQGhaZ7Ervx3Smro=	2021-03-03 00:00:00+08	R0000008	R0000008@rehabnow.com	Hickory Creek Dr	Ipoh	MY	2003-07-25 13:40:50.311+08	1990-01-24	Maxine	Female	R0000008	Carlson	MY	(853)-147-1324	93500	active	/profile-images/R0000212-1618390242671.png	f	1943
pbkdf2_sha256$216000$ebbK5RJSuMWE$UYlZhbEkF9Ia91o4pbpXbhXRPhYzYBvWdEYEpI8WwA8=	2021-03-03 00:00:00+08	R0000020	R0000020@rehabnow.com	Manchester Street	Kuala Lumpur	MY	2004-09-16 11:24:55.018+08	1956-07-04	Emily	Female	R0000020	Harris	MY	(338)-763-3382	15873	active	/profile-images/R0000212-1618390242671.png	f	1949
pbkdf2_sha256$216000$y4u9K0nfMukS$0yDXkcec+Ouqhml3Nvev9cp1wHeCKb0jQA1fsiWI81o=	2021-03-03 00:00:00+08	R0000063	R0000063@rehabnow.com	Guyton Street	Kuala Lumpur	MY	2013-09-02 17:52:38.677+08	1977-08-02	Caitlin	Female	R0000063	Thomas	MY	(939)-234-0318	40839	active	/profile-images/R0000212-1618390242671.png	f	1949
pbkdf2_sha256$216000$d9TrKWo7vvjt$cdB2RIibQ4atE9q5mmy4dQbDmSFNK8jTgKdKzq5FeMY=	2021-03-03 00:00:00+08	R0000088	R0000088@rehabnow.com	Talak Göktepe Cd	Lumut	MY	2007-09-15 23:21:56.451+08	1951-06-23	Efe	Male	R0000088	Çamdalı	MY	(297)-820-8641	62484	active	/profile-images/R0000212-1618390242671.png	f	1943
pbkdf2_sha256$216000$djDzl6n3Zw5x$rU6EL+zjkWJ3DhOU3t2UtjO+uAh4quOGoVW1P6vm2DQ=	\N	R0001242	kianseng213qqq11@gmail.com	\N	\N	\N	2021-06-14 13:55:15.42294+08	\N	\N	\N	R0001242	\N	\N	\N	\N	active	\N	f	\N
pbkdf2_sha256$216000$LcyybBb5yV3e$Pn2cx1KuLewR2V8zq3INAS/Di1zhnzQgu+ExUiIXuqs=	2021-03-03 00:00:00+08	R0000024	R0000024@rehabnow.com	Dorfstraße	Singapore	SG	2013-06-09 18:14:55.155+08	1963-10-08	Lotte	Female	R0000024	Benner	SG	0309-9693425	57129	active	/profile-images/R0000212-1618390242671.png	f	4651
pbkdf2_sha256$216000$8rvV96a5U3zQ$OGVwDv5kUeH0INLAyBX/YkehXVyU/WqUU0N7+UkATmc=	2021-03-03 00:00:00+08	R0000051	R0000051@rehabnow.com	Taman Cempadak, Lorong Impian 10	Ayer Hangat	MY	2012-11-18 09:51:45.073+08	2021-04-05	ks	Male	R0000051	ks	MY	12345	51230	active	/profile-images/R0000051-1621412834777.png	f	1947
pbkdf2_sha256$216000$FSi38vfUdZtH$ONVo/6FaqwxklATd6vYq/83sjRvoaQn5sEbTJ+8Txqs=	2021-03-03 00:00:00+08	R0000057	R0000057@rehabnow.com	Rue Pierre-Delore	Kuantan	MY	2016-12-02 04:03:51.709+08	1959-07-20	Constance	Female	R0000057	Rolland	MY	03-03-19-41-36	25290	active	/profile-images/R0000212-1618390242671.png	f	1940
pbkdf2_sha256$216000$PQ1s9vh7Kq0U$8tuQ/arigz2oWFgQuzbH1tOY6jAqwpfyww6BUWR+uU4=	2021-03-03 00:00:00+08	R0000056	R0000056@rehabnow.com	Degnevænget	Kuantan	MY	2012-09-06 03:56:52.666+08	1998-05-20	Laura	Female	R0000056	Poulsen	MY	55604988	72230	active	/profile-images/R0000212-1618390242671.png	f	1940
pbkdf2_sha256$216000$8xED1zxdaZVk$RmWeuzv2vam3f5jg/SxR0IAsbh6HTFixL/gZruPvqm0=	2021-03-03 00:00:00+08	R0000037	R0000037@rehabnow.com	Avenida de Castilla	N/A	SG	2011-04-22 03:58:24.694+08	1978-12-13	Antonia	Female	R0000037	Gutierrez	SG	983-246-551	56132	active	/profile-images/R0000212-1618390242671.png	f	4649
pbkdf2_sha256$216000$XFUglyM5GP6o$1+NCXT/I2G8TZXQbXq30xeHZbnQzSBRfY4dmy5MK9aQ=	2021-03-03 00:00:00+08	R0000097	R0000097@rehabnow.com	Park Road	Kampong Baharu Balakong	MY	2017-06-14 04:01:25.891+08	1993-01-26	Donna	Female	R0000097	Bailey	MY	071-603-8140	43067	active	/profile-images/R0000212-1618390242671.png	f	1944
pbkdf2_sha256$216000$fCgiSLdobbps$uWfsZ1WopOasi92Exu+OGW589ajNHGRIC1c17xKY2jY=	2021-03-03 00:00:00+08	R0000102	R0000102@rehabnow.com	Rue du Stade	Batang Berjuntai	MY	2002-03-30 12:39:58.04+08	1974-10-11	Nora	Female	R0000102	Laurent	MY	01-53-17-87-20	43465	active	/profile-images/R0000212-1618390242671.png	f	1944
pbkdf2_sha256$216000$mrIVQ4hDVsen$Wq/DjZ2WFpAvf9PgqDagKuCXFAysIwhjKOGCy0RvMh4=	2021-03-03 00:00:00+08	R0000093	R0000093@rehabnow.com	Rue du 8 Mai 1945	Batang Berjuntai	MY	2014-11-13 06:43:16.085+08	1970-01-20	Alyssa	Female	R0000093	Deschamps	MY	0123564820	63889	active	/profile-images/R0000093-1618898269800.png	f	1944
pbkdf2_sha256$216000$PJL6rD7hEMOb$e51ThRVlzGUWlHvY1JuqCc6S6iH4A0v0NMh+KQQFsUk=	2021-03-03 00:00:00+08	R0000041	R0000041@rehabnow.com	Place Paul-Duquaire	N/A	SG	2009-08-21 07:05:28.187+08	1954-01-07	Anouk	Female	R0000041	Dumont	SG	078 515 73 60	2599	active	/profile-images/R0000212-1618390242671.png	f	4649
pbkdf2_sha256$216000$qL6wnv3KexB4$J4Tdnx6/jH0nD7bRa+P+0lRS/Oo0+PmhC/dATocw9m4=	2021-06-09 11:24:55.63804+08	R0001232	johndoe100@rehabnow.com	Taman Cempadak, Lorong Impian 9	Ipoh	MY	2021-06-09 11:24:30.692397+08	2021-06-01	Doe 2	Male	R0001232	John	MY	0125412345	68453	active	/profile-images/R0001232-1623214430803.jpg	f	1943
pbkdf2_sha256$216000$TcTazs0CIkWk$MdySw8+gGCIDiutcZXiUWZBb8dDncVGGHSwB2tnDisk=	2021-03-03 00:00:00+08	R0000042	R0000042@rehabnow.com	Locust Rd	N/A	SG	2019-07-22 03:24:48.473+08	1974-03-18	Eleanor	Female	R0000042	Williams	SG	03-7019-7334	5990	active	/profile-images/R0000212-1618390242671.png	f	4649
pbkdf2_sha256$216000$eIVZXzjoSje7$zevg5GEEO4jRBAuYxXJlzRE/BH+iUOo5WnOswfHMXqI=	2021-03-03 00:00:00+08	R0000044	R0000044@rehabnow.com	Stevens Creek Blvd	N/A	SG	2005-02-24 09:14:27.03+08	1976-06-04	Edna	Female	R0000044	Howell	SG	09-0960-9754	8999	active	/profile-images/R0000212-1618390242671.png	f	4649
pbkdf2_sha256$216000$r5BI2ApuSlYG$A6Kjt3WChcHvRaCVF49kDKQodIq24Rd9CINfWCfte5Q=	2021-03-03 00:00:00+08	R0000036	R0000036@rehabnow.com	Rotuaari	N/A	SG	2012-02-09 11:30:04.215+08	1965-10-03	Leo	Male	R0000036	Jutila	SG	02-525-480	10844	active	/profile-images/R0000212-1618390242671.png	f	4649
pbkdf2_sha256$216000$cEgs7AxfuWN4$euiKPh3/HwuFaaJvLqYT8JkjE/zY40t5Mv0447RwahY=	2021-03-03 00:00:00+08	R0000033	R0000033@rehabnow.com	Bağdat Cd	Singapore	SG	2018-02-14 15:35:07.517+08	1962-12-10	Eren	Male	R0000033	Nalbantoğlu	SG	(910)-226-2830	64662	active	/profile-images/R0000212-1618390242671.png	f	4651
pbkdf2_sha256$216000$fDauB8PqRFv8$3w/CwmTCV6N7+C9jaZ7kyAR+btNsHlXE8h6olfVyqoc=	2021-03-03 00:00:00+08	R0000026	R0000026@rehabnow.com	Place de LAbbé-Jean-Lebeuf	Singapore	SG	2011-09-01 18:23:29.752+08	1967-07-31	Eliot	Male	R0000026	Durand	SG	02-13-76-92-35	87246	active	/profile-images/R0000212-1618390242671.png	f	4651
pbkdf2_sha256$216000$XdAvFkTXs2WI$xVtoZLXl0vBAqIcG5RZ4f9v0v2QPjg+Y/pPUciql33o=	2021-03-03 00:00:00+08	R0000084	R0000084@rehabnow.com	W Gray St	Kampar	MY	2018-01-23 13:58:01.482+08	1990-01-07	Louis	Male	R0000084	Foster	MY	(858)-508-4812	91434	active	/profile-images/R0000212-1618390242671.png	f	1943
pbkdf2_sha256$216000$iPBEXlDZHQEH$AoupWPHgIxZh6tw27jiIVr+mWioSDHY/puuD+QQbl6c=	2021-03-03 00:00:00+08	R0000005	R0000005@rehabnow.com	Mariagervej	Ipoh	MY	2014-03-04 19:43:29.462+08	1985-05-15	Sara	Female	R0000005	Petersen	MY	48410320	74219	active	/profile-images/R0000212-1618390242671.png	f	1943
pbkdf2_sha256$216000$rgx2WUAUf1a8$fUe5XvYJMhnkVGwFXMnZTkddmu0d2Fg/u+HtFu62mOw=	2021-03-03 00:00:00+08	R0000085	R0000085@rehabnow.com	Talak Göktepe Cd	Kampar	MY	2008-11-03 19:02:39.511+08	1945-08-25	Afet	Female	R0000085	Çetiner	MY	(457)-193-4147	86437	active	/profile-images/R0000212-1618390242671.png	f	1943
pbkdf2_sha256$216000$EqIWGZoaoCTy$tViCmR1EnMv0QffBnXfQkPr4lbmCcDNVV28L46lTrkk=	2021-03-03 00:00:00+08	R0000086	R0000086@rehabnow.com	Rua Quinze de Novembro 	Lumut	MY	2011-03-03 04:02:48.223+08	1949-08-08	Albenisa	Female	R0000086	Duarte	MY	(42) 9166-5518	97955	active	/profile-images/R0000212-1618390242671.png	f	1943
pbkdf2_sha256$216000$lgPeZzncLaS3$w3eT5ViTU0tI78QZ8dFyXzdpP9LglB2o3pDcpw68K7c=	2021-03-03 00:00:00+08	R0000012	R0000012@rehabnow.com	West Street	Kuantan	MY	2017-01-13 06:07:09.675+08	1959-09-27	Rick	Male	R0000012	Rodriguez	MY	015242 52877	KG74 0BQ	active	/profile-images/R0000212-1618390242671.png	f	1940
pbkdf2_sha256$216000$rFaIqmyGSxVi$8KQZ1TEdRLc12mmue4ikrtk699ev8G5SMjJUCV2GQyo=	2021-03-03 00:00:00+08	R0000070	R0000070@rehabnow.com	Rua Quinze de Novembro 	Batu Pahat	MY	2004-04-06 16:54:55.231+08	1965-01-14	Aléxis	Male	R0000070	Dias	MY	(40) 5917-6947	77043	active	/profile-images/R0000212-1618390242671.png	f	1950
pbkdf2_sha256$216000$o8b8objMR7bq$3PRhMn7dq0nlYLGh8abKZ1YKwuHyu7PGiIebcgXDUww=	2021-03-03 00:00:00+08	R0000092	R0000092@rehabnow.com	Avenue Joliot Curie	Batang Berjuntai	MY	2009-12-08 16:57:09.286+08	1967-11-09	Katarzyna	Female	R0000092	Brunet	MY	0111234678	5977	active	/profile-images/R0000092-1618898258524.png	f	1944
	\N	R0001233	kianseng213000@gmail.com	Taman Cempadak, Lorong Impian 9	Bintulu	MY	2021-06-09 12:56:05.214087+08	1990-01-01	Doe 2	Male	R0001233	John	MY	0125412345	68453	unverified	/profile-images/R0001233-1623214565259.JPG	f	1937
	\N	R0001231	kianseng21300@gmail.com	Taman Cempadak, Lorong Impian 9	Sibu	MY	2021-06-07 18:38:05.025901+08	1990-01-01	Doe 2	Male	R0001231	John	MY	0125412345	68453	unverified	/profile-images/R0001231-1623062285116.jpg	f	1937
pbkdf2_sha256$216000$EYmfzf03xokM$BZFgP+xcJAKY1k71q+DPrGQsmU/mTtWCwIzG1R7Uccg=	2021-04-14 17:40:47.329692+08	R0000006	R0000006@rehabnow.com	North Street	Kuantan	MY	2009-12-24 21:56:25.849+08	1990-12-21	Alexandra	Female	R0000006	Garcia	MY	017687 72356	ZR56 8XS	active	/profile-images/R0000212-1618390242671.png	f	1940
pbkdf2_sha256$216000$wCmwbdcRss7S$rBLTAGXsQyJzCo2aAALvaAoEeNtS1Us2dPQrjtV8eS0=	2021-03-03 00:00:00+08	R0000029	R0000029@rehabnow.com	دماوند	Singapore	SG	2006-05-18 21:23:55.459+08	1951-01-23	آوینا	Female	R0000029	موسوی	SG	072-01296796	76021	active	/profile-images/R0000212-1618390242671.png	f	4651
pbkdf2_sha256$216000$BHmhi41HKqRT$TQ6iEnLSlr+7CTGP8PS7mF2cu7My2zTgkJHi6j1mIxk=	2021-03-03 00:00:00+08	R0000016	R0000016@rehabnow.com	Birkemosevej	Singapore	SG	2014-02-21 02:16:43.209+08	1952-12-15	Magnus	Male	R0000016	Rasmussen	SG	42439135	99439	active	/profile-images/R0000212-1618390242671.png	f	4651
pbkdf2_sha256$216000$uBKziYqvw0WZ$yUWjWQ1dWjv6LoIK5VpizXQEfVn9get8MMdMTTGF3x4=	2021-03-03 00:00:00+08	R0000034	R0000034@rehabnow.com	Bağdat Cd	Singapore	SG	2005-02-23 15:44:50.022+08	1998-08-10	Ülkü	Female	R0000034	Erçetin	SG	(876)-825-2385	11433	active	/profile-images/R0000212-1618390242671.png	f	4651
pbkdf2_sha256$216000$hQry4aRNH9jR$9PsEJ8E/ubaFNH60hX7mGpJiG+0z6fSJBXrwHckt+oc=	2021-03-03 00:00:00+08	R0000062	R0000062@rehabnow.com	Honthorsterweg	Kuala Lumpur	MY	2006-07-01 16:47:18.46+08	1996-02-18	Jurre	Male	R0000062	Samuels	MY	(923)-373-4030	98584	active	/profile-images/R0000212-1618390242671.png	f	1949
pbkdf2_sha256$216000$k9HB500SYxZ7$Npyw4WoRszYRYc8SPTeiUS17dRuyTB8mrkEbOVoIdTk=	2021-03-03 00:00:00+08	R0000003	R0000003@rehabnow.com	Mill Road	Bentong Town	MY	2014-06-20 12:08:26.815+08	1974-11-08	Rosie	Female	R0000003	Parker	MY	019467 45994	N8 4TP	active	/profile-images/R0000212-1618390242671.png	f	1940
pbkdf2_sha256$216000$4FjeBlLC0KAR$vz0hAU6Otng2zOQwdEVBm31/UDvD6MX3wWtnDOikXkw=	2021-03-03 00:00:00+08	R0000101	R0000101@rehabnow.com	Tryvannsveien	Kampong Baharu Balakong	MY	2004-01-04 13:52:52.423+08	1974-08-24	Frank	Male	R0000101	Thon	MY	54847596	8047	active	/profile-images/R0000212-1618390242671.png	f	1944
pbkdf2_sha256$216000$LvHCGyOSbyxH$VGDIchP0G9oqhjefcdFyV0rqxrLYohs96GwS67PN2nU=	2021-03-03 00:00:00+08	R0000013	R0000013@rehabnow.com	Istiklal Cd	Bentong Town	MY	2011-01-12 04:41:19.236+08	1980-05-10	Vedat	Male	R0000013	Orbay	MY	(708)-181-8999	64238	active	/profile-images/R0000212-1618390242671.png	f	1940
pbkdf2_sha256$216000$gYtGY0vMl8L5$9TGo/UciC7TNxe7FnPcUJ/x1k7IfqWY+BGkS/N5kOK0=	2021-03-03 00:00:00+08	R0000011	R0000011@rehabnow.com	Fairview St	Jerantut	MY	2003-03-09 02:50:59.69+08	1966-08-04	Troy	Male	R0000011	Moore	MY	01-7100-6721	2394	active	/profile-images/R0000212-1618390242671.png	f	1940
pbkdf2_sha256$216000$h8CQy4uCfJg7$62OVjtwZABjCxLT1FakDPSMbqi268O5ievb444Ldtbg=	2021-03-03 00:00:00+08	R0000015	R0000015@rehabnow.com	Baselaarsstraat	Bentong Town	MY	2007-10-27 04:29:09.419+08	1978-04-13	Lammie	Female	R0000015	Schopman	MY	(639)-120-2443	14535	active	/profile-images/R0000212-1618390242671.png	f	1940
pbkdf2_sha256$216000$Da9jPMLMBTEw$pHu7LyWZMWIbqo3BnJJ9sziHRGDLIEia6QeEfM5epO8=	2021-03-03 00:00:00+08	R0000074	R0000074@rehabnow.com	Rue de la Barre	Batu Pahat	MY	2007-09-17 11:33:25.46+08	1980-04-23	Maëlle	Female	R0000074	Noel	MY	01-16-52-69-18	88739	active	/profile-images/R0000212-1618390242671.png	f	1950
pbkdf2_sha256$216000$7YxU4EvhOUfB$R5GiogZGZMA5dmLvf+2N2ewB4rtae10ffNse/BglmkE=	2021-03-03 00:00:00+08	R0000059	R0000059@rehabnow.com	W 6th St	Kuala Lumpur	MY	2011-12-10 07:43:30.491+08	1970-11-25	Jon	Male	R0000059	Peck	MY	(282)-844-8005	48330	active	/profile-images/R0000212-1618390242671.png	f	1949
pbkdf2_sha256$216000$TxXNFYDMHH4C$5+N3jY8H096x++3ADbZUQgfGp9ROMl+r7cz6dwC/aN8=	2021-03-03 00:00:00+08	R0000064	R0000064@rehabnow.com	South Street	Batu Pahat	MY	2011-09-28 11:36:14.851+08	1959-11-02	Stephen	Male	R0000064	Powell	MY	071-902-6883	31914	active	/profile-images/R0000212-1618390242671.png	f	1950
pbkdf2_sha256$216000$Wl0s03YzoUvu$mlPcNqcNk8IEB/v5qK4GOiNHyS5okP3S5Np2gqXcezU=	2021-03-03 00:00:00+08	R0000077	R0000077@rehabnow.com	Visiokatu	Daerah Johor Baharu	MY	2003-08-13 21:14:35.471+08	1970-06-19	Milla	Female	R0000077	Hakala	MY	07-559-857	57769	active	/profile-images/R0000212-1618390242671.png	f	1950
pbkdf2_sha256$216000$NMGManaW6Bb4$KnDkJ2OuCicHWsJuWtmEGzcO7qvzmKhlGd4+8lvI8QY=	2021-03-03 00:00:00+08	R0000078	R0000078@rehabnow.com	The Grove	Daerah Johor Baharu	MY	2002-05-12 07:19:23.502+08	1945-12-11	Zoe	Female	R0000078	Davies	MY	011-452-4491	42757	active	/profile-images/R0000212-1618390242671.png	f	1950
pbkdf2_sha256$216000$aT9dfAme5APj$dnj/mzBBwjHgyPjjrmFgwLI3Xw9NGAKBNcICU5sDedg=	2021-03-03 00:00:00+08	R0000060	R0000060@rehabnow.com	New North Road	Kuala Lumpur	MY	2016-08-05 16:36:27.035+08	1983-07-23	Chloe	Female	R0000060	Edwards	MY	(415)-050-7611	63582	active	/profile-images/R0000212-1618390242671.png	f	1949
pbkdf2_sha256$216000$5LtlPhy7xgae$HWyv5c0Kb0fS49kJUzK5wl0hxF1PvG9TOi4Y4RZdWv8=	2021-03-03 00:00:00+08	R0000054	R0000054@rehabnow.com	دکتر علی شریعتی	Kuala Lumpur	MY	2015-11-10 23:48:12.733+08	1966-11-18	سارا	Female	R0000054	سلطانی نژاد	MY	086-02871432	93946	active	/profile-images/R0000212-1618390242671.png	f	1949
pbkdf2_sha256$216000$g5v7hON1CoRq$NNUCc2NQzY2tFYjT+vyVI5inFU9CFGi5x86+0hUdvZ8=	2021-03-03 00:00:00+08	R0000091	R0000091@rehabnow.com	Taman Cempadak, Lorong Impian 10	Ayer Hangat	MY	2010-09-24 06:02:48.767+08	1990-04-05	John	Male	R0000091	Kenny	MY	0123546789	51230	active	/profile-images/R0000091-1622547745020.jpg	f	1947
pbkdf2_sha256$216000$CU1Cy9LUkWLZ$WdA7GqRg/w1257HZzF7ppl6Q3pG/Lyuay66GAygFiDA=	2021-03-03 00:00:00+08	R0000094	R0000094@rehabnow.com	High Street	Ampang	MY	2012-06-13 16:03:44.807+08	1960-06-21	Scarlett	Female	R0000094	Snyder	MY	0123546756	31203	active	/profile-images/R0000094-1618898351208.gif	f	1944
	\N	R0001234	kianseng21322@gmail.com	Taman Cempadak, Lorong Impian 9	Bintulu	MY	2021-06-09 16:44:58.134618+08	1990-01-01	Doe 2	Male	R0001234	John	MY	0125412345	68453	active	/profile-images/R0001234-1623228299088.JPG	f	1937
pbkdf2_sha256$216000$iohmU4nGlkxL$7g+/GwUTFImqiWVFyV4ejjBM/Qv8asjZvd2KQjimNyI=	2021-03-03 00:00:00+08	R0000081	R0000081@rehabnow.com	Northaven Rd	Ipoh	MY	2011-02-13 23:40:34.08+08	1962-11-05	Violet	Female	R0000081	Ray	MY	(838)-004-9131	26813	active	/profile-images/R0000212-1618390242671.png	f	1943
pbkdf2_sha256$216000$yzKci9pIUm2A$i7WCGXtgfaqUlWREokJhNwMbl/180trztI/YbSprSVA=	2021-03-03 00:00:00+08	R0000099	R0000099@rehabnow.com	Hatanpään Valtatie	Kuala Lumpur	MY	2009-12-26 13:02:41.438+08	1992-03-06	Iina	Female	R0000099	Hanka	MY	05-472-269	32639	active	/profile-images/R0000212-1618390242671.png	f	1949
pbkdf2_sha256$216000$grjPgVldAeWJ$I0l5ZWZKX6ihXFm4YWk3kKt6CLfoucsNR0oecqwPF2A=	2021-03-03 00:00:00+08	R0000039	R0000039@rehabnow.com	Satakennankatu	Kuala Lumpur	MY	2016-08-03 13:32:49.119+08	1974-07-28	Amanda	Female	R0000039	Kauppi	MY	09-270-168	33798	active	/profile-images/R0000212-1618390242671.png	f	1949
pbkdf2_sha256$216000$PKUvwgLcRijk$Yae/W6AyoLsrDfqnrJJB+dL2kKOH4Fk5ntZaQXwiUpo=	2021-03-03 00:00:00+08	R0000100	R0000100@rehabnow.com	Reijolankatu	Singapore	SG	2012-05-15 18:03:25.648+08	1994-12-18	Siiri	Female	R0000100	Niskanen	SG	08-337-973	17050	active	/profile-images/R0000212-1618390242671.png	f	4651
pbkdf2_sha256$216000$xH1ptVHt1cmo$t6e+UuoEoRP/EcbHB4YX0sazuXxNcxyCeTfVUc+/etY=	2021-03-03 00:00:00+08	R0000017	R0000017@rehabnow.com	Bulevardi	Kuantan	MY	2005-02-02 07:07:54.592+08	1969-05-02	Hilla	Female	R0000017	Linna	MY	05-860-007	16638	active	/profile-images/R0000212-1618390242671.png	f	1940
pbkdf2_sha256$216000$d8LSNVcXI3Uy$nlpEaHQ4e57ReZUZqUfmEveJaLqX/uKOBcWYmoabuLE=	2021-03-03 00:00:00+08	R0000068	R0000068@rehabnow.com	Galway Road	Bakri	MY	2017-06-30 15:39:10.739+08	1973-06-12	Curtis	Male	R0000068	Evans	MY	011-852-1361	86727	active	/profile-images/R0000212-1618390242671.png	f	1950
pbkdf2_sha256$216000$DZZYOG6ljdjV$w3Jk/HrtW/mNA2b3X1ZodRwwOgAHsHfRFPz88fd1Np4=	2021-03-03 00:00:00+08	R0000072	R0000072@rehabnow.com	Main Road	Batu Pahat	MY	2015-11-21 12:44:49.42+08	1981-11-03	Miguel	Male	R0000072	Hunter	MY	0113672 910 0698	U30 9TA	active	/profile-images/R0000212-1618390242671.png	f	1950
pbkdf2_sha256$216000$Nwa8m6trxXiX$0cKqzY7gb36hEKDNX+VEx7nGxSOuThA/BObhw5FnUBc=	2021-06-14 14:22:49.442311+08	R0001241	kianseng213aaa@gmail.com	Taman Cempadak, Lorong Impian 9	Ipoh	MY	2021-06-14 13:49:22.21904+08	2021-06-14	Doe 2	Male	R0001241	John	MY	0125412345	68453	active	/profile-images/R0001241-1623651787504.jpg	f	1943
pbkdf2_sha256$216000$c7jonzRDoLtQ$Y+h4nT9cBhv28Ep4QHv/jEEXbXWU0X7+1MO02QecpvE=	2021-03-03 00:00:00+08	R0000090	R0000090@rehabnow.com	Calle de Téllez	Ampang	MY	2018-05-28 02:37:05.303+08	1962-12-27	Cesar	Male	R0000090	Torres	MY	925-837-614	52120	active	/profile-images/R0000212-1618390242671.png	f	1944
pbkdf2_sha256$216000$LNb2qRo32ORg$oEboO19zyP71io7o8ckXsJt6+JgZheAxt1GepKXB0CY=	2021-03-03 00:00:00+08	R0000073	R0000073@rehabnow.com	Park Lane	Kuala Lumpur	MY	2004-04-03 07:22:49.447+08	1990-02-18	Chloe	Female	R0000073	Russell	MY	017687 77346	VL56 0FU	active	/profile-images/R0000212-1618390242671.png	f	1949
pbkdf2_sha256$216000$zlITDpe6ZWKB$5yjc0yIhoy8WKcVokf/3LgQJGKfHF8OXdwIVKUV2pj8=	2021-03-03 00:00:00+08	R0000018	R0000018@rehabnow.com	Wiri Station Road	Kuantan	MY	2014-08-25 21:42:00.255+08	1969-05-08	Jacob	Male	R0000018	Wang	MY	(098)-481-7481	12762	active	/profile-images/R0000212-1618390242671.png	f	1940
pbkdf2_sha256$216000$VnMl8g4FTFz1$baky1Dc4ZTkK39kWwtfYR8rqaYUf1zhu9stfCYs8Biw=	2021-04-20 14:36:33.008746+08	R0001227	k.seng-1998@graduate.utm.my			\N	2021-04-20 14:32:50.357584+08	\N			R0001227					active		f	\N
\.


--
-- TOC entry 3009 (class 0 OID 49798)
-- Dependencies: 206
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 49808)
-- Dependencies: 208
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 49790)
-- Dependencies: 204
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
37	Can add country	10	add_country
38	Can change country	10	change_country
39	Can delete country	10	delete_country
40	Can view country	10	view_country
41	Can add state	11	add_state
42	Can change state	11	change_state
43	Can delete state	11	delete_state
44	Can view state	11	view_state
45	Can add city	12	add_city
46	Can change city	12	change_city
47	Can delete city	12	delete_city
48	Can view city	12	view_city
49	Can add case	13	add_case
50	Can change case	13	change_case
51	Can delete case	13	delete_case
52	Can view case	13	view_case
53	Can add part	14	add_part
54	Can change part	14	change_part
55	Can delete part	14	delete_part
56	Can view part	14	view_part
57	Can add target	15	add_target
58	Can change target	15	change_target
59	Can delete target	15	delete_target
60	Can view target	15	view_target
61	Can add predicted recovery	16	add_predictedrecovery
62	Can change predicted recovery	16	change_predictedrecovery
63	Can delete predicted recovery	16	delete_predictedrecovery
64	Can view predicted recovery	16	view_predictedrecovery
65	Can add exercise	17	add_exercise
66	Can change exercise	17	change_exercise
67	Can delete exercise	17	delete_exercise
68	Can view exercise	17	view_exercise
69	Can add Token	18	add_token
70	Can change Token	18	change_token
71	Can delete Token	18	delete_token
72	Can view Token	18	view_token
73	Can add token	19	add_tokenproxy
74	Can change token	19	change_tokenproxy
75	Can delete token	19	delete_tokenproxy
76	Can view token	19	view_tokenproxy
77	Access Web	20	web_permission
78	Access Mobile	20	mobile_permission
\.


--
-- TOC entry 3029 (class 0 OID 57500)
-- Dependencies: 226
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
1c34a7c392fe4a22e28e767f836f2f79927c587e	2021-04-19 23:17:21.190941+08	R0000051
b16432c1daa84cb36162f6c54da6f4c897cb1d85	2021-05-18 14:00:09.46015+08	R0000080
7f23739289ab002b3d9797f7ce64aa3411932db1	2021-05-18 14:07:07.694099+08	R0000081
e929a6944e0d5a9f65a3612b9659d8a49e3b8943	2021-05-19 23:23:34.945763+08	R0000212
ce5aee2281296501c8203a6ed934e1faf24f187f	2021-06-09 20:18:43.875278+08	R0001235
7d4c9d2f6a9253320841a0d0c754d08626f30cf2	2021-06-16 01:21:50.898469+08	R0000092
\.


--
-- TOC entry 3005 (class 0 OID 49765)
-- Dependencies: 202
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- TOC entry 3002 (class 0 OID 49725)
-- Dependencies: 199
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
10	app	country
11	app	state
12	app	city
13	app	case
14	app	part
15	app	target
16	app	predictedrecovery
17	app	exercise
18	authtoken	token
19	authtoken	tokenproxy
20	app	supportpermission
\.


--
-- TOC entry 3000 (class 0 OID 49714)
-- Dependencies: 197
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
22	app	0002_auto_20210409_1603	2021-04-16 11:58:37.277741+08
23	app	0003_auto_20210409_1612	2021-04-16 12:00:25.535908+08
24	app	0004_auto_20210416_1151	2021-04-16 12:00:25.54291+08
25	app	0005_auto_20210416_2123	2021-04-16 21:23:42.691095+08
26	app	0006_case_name	2021-04-17 00:52:31.688694+08
27	authtoken	0001_initial	2021-04-18 22:09:36.9903+08
28	authtoken	0002_auto_20160226_1747	2021-04-18 22:09:38.347301+08
29	authtoken	0003_tokenproxy	2021-04-18 22:09:38.355301+08
30	app	0007_auto_20210427_1647	2021-04-27 16:47:52.064693+08
31	app	0008_auto_20210520_0127	2021-05-20 01:27:30.991835+08
32	app	0009_auto_20210530_1331	2021-05-30 13:31:47.044065+08
33	app	0010_auto_20210530_1337	2021-05-30 13:37:23.84565+08
34	app	0011_auto_20210601_1142	2021-06-01 11:43:15.316175+08
35	app	0012_delete_snippet	2021-06-08 14:39:20.543125+08
36	app	0013_supportpermission	2021-06-08 14:45:37.396914+08
37	app	0014_auto_20210614_1213	2021-06-14 12:13:16.606321+08
\.


--
-- TOC entry 3012 (class 0 OID 49840)
-- Dependencies: 209
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
8cauhcdnwvz14hug3jh1voffhaesmbot	e30:1lq6Qt:LdB4V2Rw1sHXqFqPp0JEDpQW0JcpMs39Oodt5q-4zaE	2021-06-08 12:00:11.397754+08
ejne7h09v42gowtmd7mrfmbtrqjbo623	.eJxVzDsOwjAQBNC7uEZW_GGzpqRPwwWiXa9NAsiW8qkQdyeRUsC0b2beqqd1Gfp1TlM_irqoW7PFGqtOv8QUn6nsLg8q96pjLcs0st4r-tBZd1XS63p0_w4GmodtDeA4hfaMKCknyM4TGx-BGQXY-k1cg9EKMjoQl30QasmjNDaYbNTnC__jOWE:1lc1rN:gN4D2pCIxhHspq7esnyccdJ8fIulr5trtFXJAN5qs2E	2021-04-30 16:17:21.290942+08
0s0x1zu9t3xjg6r66izxa79xc4uiqhm0	.eJxVjDsOwjAQBe_iGln-x6akp-EClne9xgEUS3FSIe5OIqWA187Me7OY1qXGtdMcx8zO7Ca2KanY6RdBwidNO8-PNN0bxzYt8wh8V_hBO7-2TK_L4f4d1NTrVhcnTJBgB0nohPYAZijF6iSd90lajVYbQ0AWAmrhVSanZfAK0WQMxD5f4kE5Hg:1lYkAk:tiK9r8HTc4xsyJcek09gCruSocZZBP84YIJEDZRtg3U	2021-04-21 14:47:46.469521+08
b3c5tlmpjtucra3n2tlw313ddie8masg	.eJxVjDEOwjAMRe-SGUVxCE7DyM7CBSo7dmkBNVLTToi700od4K_vvf82LS1z3y5Vp3YQczY3t86DN4dfxJSfOm5cHjTei81lnKeB7abYnVZ7LaKvy-7-HfRU-7WOQYUQAmkGDBF97hps3AmaKKRAwJADsB4RXQRGZvKUEkjC1HUumc8X83A5RA:1lW1d8:6SVTBiV0_KfJo7ssJ5DL2VA7pkq_PLMRveIGhV7KLFU	2021-04-13 02:50:50.113706+08
ti93boj2zxwaq2p8tb2k2vlri98wn6uc	e30:1lq6Hl:YxsTEoeRsOAJY-9mwFsNdZfB2m527Y-JKr9GffUrUcM	2021-06-08 11:50:45.123841+08
hm7zzpjr9eo6kl4dfna9e423647cty9y	.eJxVjLsOAiEQRf-F2hCeA1ja2_gDZIBBVs2S7KMy_ru7yRZ623POfbOI69LiOtMUh8LO7Ca2KanY6RclzE8ad14eON47z31cpiHxXeEHnfm1F3pdDvfvoOHctlpnJwm1S0JVXUsF49GLQBSCckDeosgWLADYCklXE0SRsqqCFr2xgX2-8v05AQ:1lxPXD:yeocYH3j_m2slR7-kxINeBfOJv12cKPMm2plHPAaFKk	2021-06-28 15:48:55.046285+08
b6oxzcucjc1ptb3bwc0cw685flg222oc	.eJxVjL0OwiAURt-F2RC4QAuO7i6-ALmXH6kaSEo7Gd_dNumg33rO-d7M47oUv_Y0-ymyM7uJbSCBnX4RYXimuvP4wHpvPLS6zBPxXeEH7fzaYnpdDvfvoGAvW22z1lIBOcSgMZMIEhWFwWqIOWcT3TCCUqSscSaBUIhRW4fJEMFogH2-CPY5ng:1lXRzx:SJ3gCh5JauHHTJYMGVnIFZYB_8HXRDj9oPA50zpV4iA	2021-04-18 01:11:17.145631+08
u1djkwpw3lb1gwhkeain4bwssqv8uxc2	.eJxVzEEOwiAQheG7sDYEypAyLt276QXIDANSNW1S2pXx7tqkC11__3svFWlba9xaXuIo6qwGY4ztwKrTLzGlR552lztNt1mneVqXkfWe6EObvs6Sn5ej_Tuo1Op3Tc4QFIGMQYrtO7KCvnN9wgIekiQTGBIGJkuZ2LEIiieXCcEyoHp_ABXFOmU:1lsg03:bPfdmHT93na8WQHEZSOw1iteZPfusWx0NlgtQ9MYPFs	2021-06-15 14:23:07.812842+08
cj9oa7oih6yqx7dexyq6vdthz00eif9a	.eJxVjLsOAiEQRf-F2hCeA1ja2_gDZIBBVs2S7KMy_ru7yRZ623POfbOI69LiOtMUh8LO7Ca2KanY6RclzE8ad14eON47z31cpiHxXeEHnfm1F3pdDvfvoOHctlpnJwm1S0JVXUsF49GLQBSCckDeosgWLADYCklXE0SRsqqCFr2xgX2-8v05AQ:1lxNGh:cb8krqBAY-QdLINdUFqrqwZuNOGZ0Rgfk2wuPqY1KCo	2021-06-28 13:23:43.678719+08
cdgusna0214so6wrrmet9mc0gsjdkg0k	.eJxVjDEOwjAMRe-SGUVxCE7DyM7CBSo7dmkBNVLTToi700od4K_vvf82LS1z3y5Vp3YQczY3t86DN4dfxJSfOm5cHjTei81lnKeB7abYnVZ7LaKvy-7-HfRU-7WOQYUQAmkGDBF97hps3AmaKKRAwJADsB4RXQRGZvKUEkjC1HUumc8X83A5RA:1lUPIm:clxfEBiRbCpGmWTbsinXl3f0Jeh3OQoW3KTNKqW95nY	2021-04-08 15:43:08.832455+08
udk8lf2fieemrck9akuuflxcvqrrh8l8	.eJxVjDEOwjAMRe-SGUVxCE7DyM7CBSo7dmkBNVLTToi700od4K_vvf82LS1z3y5Vp3YQczY3t86DN4dfxJSfOm5cHjTei81lnKeB7abYnVZ7LaKvy-7-HfRU-7WOQYUQAmkGDBF97hps3AmaKKRAwJADsB4RXQRGZvKUEkjC1HUumc8X83A5RA:1lUPKP:A_ZgSeC0QfDRMl1lq6P8MgPVYnqhXWSmJPh18GvG8Xo	2021-04-08 15:44:49.886021+08
niew4mqd3ci1pdcf7tm6wuduv7whzlb8	.eJxVjDEOwjAMRe-SGUVxCE7DyM7CBSo7dmkBNVLTToi700od4K_vvf82LS1z3y5Vp3YQczY3t86DN4dfxJSfOm5cHjTei81lnKeB7abYnVZ7LaKvy-7-HfRU-7WOQYUQAmkGDBF97hps3AmaKKRAwJADsB4RXQRGZvKUEkjC1HUumc8X83A5RA:1lUPM1:R_6fCYd6hVU61DduynDuW6n_Hj_nHE2TvhK0jKKDG6k	2021-04-08 15:46:29.4797+08
khuw1q3ug9mua2is3jenexhd5lyzp42c	e30:1lq6ep:k5auLdREeGK4kqlNbCpc3JuL9c7k3jZxGwUPQ76nwwE	2021-06-08 12:14:35.838145+08
t4nsasr8zp06qkk4dheht42ey8epi1tn	e30:1lq6kJ:AKN1HH_Yun0G8PYSoVycytHYndsyV859OjdvUnG_GMA	2021-06-08 12:20:15.799262+08
qyeyjutyqi26avmbw0yvujtb0prrsa38	e30:1lq6kc:2xNKWy3K5QMrcdZRiJmoWnmHRNcSEGF3BDJumAdlqUI	2021-06-08 12:20:34.316138+08
pi3wnwsywguyju26810kua9sjur1npje	.eJxVjDsOwjAQBe_iGlneXfyjpKfhAtb6Aw6gWIqTCnF3EikFvHZm3lsEXuYall6mMGRxEle1DgHF4RdFTs8ybjw_eLw3mdo4T0OUmyJ32uWl5fI67-7fQeVe19p5Rl0ILFPKxwLsEbVL2bB34GLUiQAUKTJRxWwRGSgZC8w3rYyz4vMF4xk4nA:1lo3HD:l-YJa0ihibGFxbwL6kx8h6r3VE4LqgL37mvrwJF8J0k	2021-06-02 20:13:43.455406+08
uymx7hmdel1nvkynkgbhdmsm64ilhpcy	.eJxVjDEOwjAMRe-SGUVxCE7DyM7CBSo7dmkBNVLTToi700od4K_vvf82LS1z3y5Vp3YQczY3t86DN4dfxJSfOm5cHjTei81lnKeB7abYnVZ7LaKvy-7-HfRU-7WOQYUQAmkGDBF97hps3AmaKKRAwJADsB4RXQRGZvKUEkjC1HUumc8X83A5RA:1lUPR6:Mv5lu4YGAkWxXSwV9Co4EZ8SM3VJn69Gddsc4_svjpA	2021-04-08 15:51:44.645084+08
fnsaxg51hiwm7k5966s7iye443zchejw	.eJxVjDsOwjAQBe_iGlm7dmxsSvo0XCDa9dokgGIpnwpxdwhKAa-dmfdUHa1L361znrpB1Eld4DuvDr-IKd3zuHG50XitOtVxmQbWm6J3Ouu2Sn6cd_fvoKe5_9Q2EWC0hguyN-C8gxgNlGCPQKGJYiSixVBccOStUGMYmDFjSRGdqNcbxvI4dQ:1lWc0t:y5joghTOT3EA717AQOafjFj1B8Bn0Y18Fmzao49iOG0	2021-04-15 17:40:47.493692+08
colxzw3cjl6elsshx7uzn94tglfoaqhb	.eJxVjLsOAiEQRf-F2hCeA1ja2_gDZIBBVs2S7KMy_ru7yRZ623POfbOI69LiOtMUh8LO7Ca2KanY6RclzE8ad14eON47z31cpiHxXeEHnfm1F3pdDvfvoOHctlpnJwm1S0JVXUsF49GLQBSCckDeosgWLADYCklXE0SRsqqCFr2xgX2-8v05AQ:1lt5I3:zX1ehJG1pjMn_5dB6qUR_t969IqzSeYaReXXv6u14BI	2021-06-16 17:23:23.279987+08
bjg37bjvp0z4il3a1f8kfs69a506eyvv	.eJxVjjsOwjAQBe_iGln-LI5DSZ-GC0Tr9S4JoFiKkwpxdxIpBdQzb_Teqsd1Gfq18tyPWV3UzRhjnXfq9IsS0pOnnecHTveiqUzLPCa9K_qgVXcl8-t6uH-BAeuwrRMLWyFw6EXE2kgAwCxG2hBS8m10hA2QpAznBmOLQLbJQcAHiNurzxcv-joa:1lrCs8:8e9-GjWYvuDkkiWRzNNOiC5QTn6LkuV-98WuQt-YpcE	2021-06-11 13:04:52.839733+08
\.


--
-- TOC entry 3050 (class 0 OID 0)
-- Dependencies: 216
-- Name: app_case_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_case_id_seq', 66, true);


--
-- TOC entry 3051 (class 0 OID 0)
-- Dependencies: 227
-- Name: app_data_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_data_state_id_seq', 4955, true);


--
-- TOC entry 3052 (class 0 OID 0)
-- Dependencies: 224
-- Name: app_exercise_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_exercise_id_seq', 74, true);


--
-- TOC entry 3053 (class 0 OID 0)
-- Dependencies: 218
-- Name: app_part_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_part_id_seq', 117, true);


--
-- TOC entry 3054 (class 0 OID 0)
-- Dependencies: 222
-- Name: app_predictedrecovery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_predictedrecovery_id_seq', 17, true);


--
-- TOC entry 3055 (class 0 OID 0)
-- Dependencies: 220
-- Name: app_target_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_target_id_seq', 113, true);


--
-- TOC entry 3056 (class 0 OID 0)
-- Dependencies: 212
-- Name: app_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_user_id_seq', 1243, true);


--
-- TOC entry 3057 (class 0 OID 0)
-- Dependencies: 205
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 3058 (class 0 OID 0)
-- Dependencies: 207
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 3059 (class 0 OID 0)
-- Dependencies: 203
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 78, true);


--
-- TOC entry 3060 (class 0 OID 0)
-- Dependencies: 201
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- TOC entry 3061 (class 0 OID 0)
-- Dependencies: 198
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 20, true);


--
-- TOC entry 3062 (class 0 OID 0)
-- Dependencies: 196
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 37, true);


--
-- TOC entry 2841 (class 2606 OID 57423)
-- Name: app_case app_case_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_case
    ADD CONSTRAINT app_case_pkey PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 114891)
-- Name: app_data_city app_data_city_city_state_3c5b098a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_data_city
    ADD CONSTRAINT app_data_city_city_state_3c5b098a_uniq UNIQUE (city, state);


--
-- TOC entry 2837 (class 2606 OID 49990)
-- Name: app_data_city app_data_city_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_data_city
    ADD CONSTRAINT app_data_city_pkey PRIMARY KEY (state, city);


--
-- TOC entry 2831 (class 2606 OID 49964)
-- Name: app_data_country app_data_country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_data_country
    ADD CONSTRAINT app_data_country_pkey PRIMARY KEY (iso2);


--
-- TOC entry 2833 (class 2606 OID 90271)
-- Name: app_data_state app_data_state_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_data_state
    ADD CONSTRAINT app_data_state_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 57458)
-- Name: app_exercise app_exercise_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_exercise
    ADD CONSTRAINT app_exercise_pkey PRIMARY KEY (id);


--
-- TOC entry 2844 (class 2606 OID 57434)
-- Name: app_part app_part_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_part
    ADD CONSTRAINT app_part_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 49894)
-- Name: app_patient app_patient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_patient
    ADD CONSTRAINT app_patient_pkey PRIMARY KEY (patient_id);


--
-- TOC entry 2826 (class 2606 OID 49933)
-- Name: app_physiotherapist app_physiotherapist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_physiotherapist
    ADD CONSTRAINT app_physiotherapist_pkey PRIMARY KEY (physiotherapist_id);


--
-- TOC entry 2850 (class 2606 OID 57450)
-- Name: app_predictedrecovery app_predictedrecovery_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_predictedrecovery
    ADD CONSTRAINT app_predictedrecovery_pkey PRIMARY KEY (id);


--
-- TOC entry 2847 (class 2606 OID 57442)
-- Name: app_target app_target_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_target
    ADD CONSTRAINT app_target_pkey PRIMARY KEY (id);


--
-- TOC entry 2795 (class 2606 OID 49742)
-- Name: app_user app_user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_email_key UNIQUE (email);


--
-- TOC entry 2798 (class 2606 OID 49740)
-- Name: app_user app_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2811 (class 2606 OID 49838)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2816 (class 2606 OID 49824)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 2819 (class 2606 OID 49813)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 49803)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 49815)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 2808 (class 2606 OID 49795)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2856 (class 2606 OID 57504)
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- TOC entry 2859 (class 2606 OID 57506)
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- TOC entry 2801 (class 2606 OID 49774)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 49732)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 2792 (class 2606 OID 49730)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 49722)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2822 (class 2606 OID 49847)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 2838 (class 1259 OID 57464)
-- Name: app_case_patient_id_id_f8e23641; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_case_patient_id_id_f8e23641 ON public.app_case USING btree (patient_id_id);


--
-- TOC entry 2839 (class 1259 OID 57465)
-- Name: app_case_patient_id_id_f8e23641_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_case_patient_id_id_f8e23641_like ON public.app_case USING btree (patient_id_id varchar_pattern_ops);


--
-- TOC entry 2851 (class 1259 OID 57489)
-- Name: app_exercise_part_id_id_faa50b98; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_exercise_part_id_id_faa50b98 ON public.app_exercise USING btree (part_id_id);


--
-- TOC entry 2842 (class 1259 OID 57471)
-- Name: app_part_case_id_id_c20c63de; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_part_case_id_id_c20c63de ON public.app_part USING btree (case_id_id);


--
-- TOC entry 2827 (class 1259 OID 49917)
-- Name: app_patient_patient_id_21d4ee16_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_patient_patient_id_21d4ee16_like ON public.app_patient USING btree (patient_id varchar_pattern_ops);


--
-- TOC entry 2824 (class 1259 OID 49918)
-- Name: app_physiotherapist_physiotherapist_id_c6324131_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_physiotherapist_physiotherapist_id_c6324131_like ON public.app_physiotherapist USING btree (physiotherapist_id varchar_pattern_ops);


--
-- TOC entry 2848 (class 1259 OID 57483)
-- Name: app_predictedrecovery_part_id_id_1a048e14; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_predictedrecovery_part_id_id_1a048e14 ON public.app_predictedrecovery USING btree (part_id_id);


--
-- TOC entry 2845 (class 1259 OID 57477)
-- Name: app_target_part_id_id_91dcc878; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_target_part_id_id_91dcc878 ON public.app_target USING btree (part_id_id);


--
-- TOC entry 2793 (class 1259 OID 49755)
-- Name: app_user_email_efde8896_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_user_email_efde8896_like ON public.app_user USING btree (email varchar_pattern_ops);


--
-- TOC entry 2796 (class 1259 OID 49754)
-- Name: app_user_id_894c4161_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_user_id_894c4161_like ON public.app_user USING btree (id varchar_pattern_ops);


--
-- TOC entry 2809 (class 1259 OID 49839)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 2814 (class 1259 OID 49835)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 2817 (class 1259 OID 49836)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2804 (class 1259 OID 49821)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 2854 (class 1259 OID 57512)
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- TOC entry 2857 (class 1259 OID 57513)
-- Name: authtoken_token_user_id_35299eff_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authtoken_token_user_id_35299eff_like ON public.authtoken_token USING btree (user_id varchar_pattern_ops);


--
-- TOC entry 2799 (class 1259 OID 49785)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 2802 (class 1259 OID 49786)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 2803 (class 1259 OID 49787)
-- Name: django_admin_log_user_id_c564eba6_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6_like ON public.django_admin_log USING btree (user_id varchar_pattern_ops);


--
-- TOC entry 2820 (class 1259 OID 49849)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 2823 (class 1259 OID 49848)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 2872 (class 2606 OID 57459)
-- Name: app_case app_case_patient_id_id_f8e23641_fk_app_patient_patient_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_case
    ADD CONSTRAINT app_case_patient_id_id_f8e23641_fk_app_patient_patient_id FOREIGN KEY (patient_id_id) REFERENCES public.app_patient(patient_id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2871 (class 2606 OID 90272)
-- Name: app_data_city app_data_city_app_data_state_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_data_city
    ADD CONSTRAINT app_data_city_app_data_state_fk FOREIGN KEY (state) REFERENCES public.app_data_state(id) NOT VALID;


--
-- TOC entry 2870 (class 2606 OID 49965)
-- Name: app_data_state app_data_state_app_data_country_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_data_state
    ADD CONSTRAINT app_data_state_app_data_country_fk FOREIGN KEY (iso2) REFERENCES public.app_data_country(iso2) NOT VALID;


--
-- TOC entry 2876 (class 2606 OID 82076)
-- Name: app_exercise app_exercise_part_id_id_faa50b98_fk_app_part_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_exercise
    ADD CONSTRAINT app_exercise_part_id_id_faa50b98_fk_app_part_id FOREIGN KEY (part_id_id) REFERENCES public.app_part(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2873 (class 2606 OID 57466)
-- Name: app_part app_part_case_id_id_c20c63de_fk_app_case_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_part
    ADD CONSTRAINT app_part_case_id_id_c20c63de_fk_app_case_id FOREIGN KEY (case_id_id) REFERENCES public.app_case(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2868 (class 2606 OID 49939)
-- Name: app_patient app_patient_app_physiotherapist_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_patient
    ADD CONSTRAINT app_patient_app_physiotherapist_fkey FOREIGN KEY (physiotherapist_id) REFERENCES public.app_physiotherapist(physiotherapist_id) NOT VALID;


--
-- TOC entry 2869 (class 2606 OID 49944)
-- Name: app_patient app_patient_app_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_patient
    ADD CONSTRAINT app_patient_app_user_fkey FOREIGN KEY (patient_id) REFERENCES public.app_user(id) NOT VALID;


--
-- TOC entry 2867 (class 2606 OID 49934)
-- Name: app_physiotherapist app_physiotherapist_app_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_physiotherapist
    ADD CONSTRAINT app_physiotherapist_app_user_fkey FOREIGN KEY (physiotherapist_id) REFERENCES public.app_user(id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 2875 (class 2606 OID 57478)
-- Name: app_predictedrecovery app_predictedrecovery_part_id_id_1a048e14_fk_app_part_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_predictedrecovery
    ADD CONSTRAINT app_predictedrecovery_part_id_id_1a048e14_fk_app_part_id FOREIGN KEY (part_id_id) REFERENCES public.app_part(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2874 (class 2606 OID 57472)
-- Name: app_target app_target_part_id_id_91dcc878_fk_app_part_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_target
    ADD CONSTRAINT app_target_part_id_id_91dcc878_fk_app_part_id FOREIGN KEY (part_id_id) REFERENCES public.app_part(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2860 (class 2606 OID 57392)
-- Name: app_user app_user_app_data_country_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_app_data_country_fk FOREIGN KEY (country) REFERENCES public.app_data_country(iso2) NOT VALID;


--
-- TOC entry 2861 (class 2606 OID 90277)
-- Name: app_user app_user_app_data_state_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_app_data_state_fk FOREIGN KEY (state) REFERENCES public.app_data_state(id) NOT VALID;


--
-- TOC entry 2866 (class 2606 OID 49830)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2865 (class 2606 OID 49825)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2864 (class 2606 OID 49816)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2877 (class 2606 OID 57514)
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_app_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_app_user_id FOREIGN KEY (user_id) REFERENCES public.app_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2862 (class 2606 OID 49775)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2863 (class 2606 OID 49780)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_app_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_app_user_id FOREIGN KEY (user_id) REFERENCES public.app_user(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2021-06-30 00:32:15

--
-- PostgreSQL database dump complete
--

