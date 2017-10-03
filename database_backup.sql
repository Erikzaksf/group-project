--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO "Guest";

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO "Guest";

--
-- Name: sub_catagories; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE sub_catagories (
    id bigint NOT NULL,
    title character varying,
    description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE sub_catagories OWNER TO "Guest";

--
-- Name: sub_catagories_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE sub_catagories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sub_catagories_id_seq OWNER TO "Guest";

--
-- Name: sub_catagories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE sub_catagories_id_seq OWNED BY sub_catagories.id;


--
-- Name: subjects; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE subjects (
    id bigint NOT NULL,
    title character varying,
    description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE subjects OWNER TO "Guest";

--
-- Name: subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE subjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE subjects_id_seq OWNER TO "Guest";

--
-- Name: subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE subjects_id_seq OWNED BY subjects.id;


--
-- Name: subjects_users; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE subjects_users (
    id bigint NOT NULL,
    subject_id integer,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE subjects_users OWNER TO "Guest";

--
-- Name: subjects_users_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE subjects_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE subjects_users_id_seq OWNER TO "Guest";

--
-- Name: subjects_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE subjects_users_id_seq OWNED BY subjects_users.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE users (
    id bigint NOT NULL,
    email character varying,
    password character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    first_name character varying,
    last_name character varying
);


ALTER TABLE users OWNER TO "Guest";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO "Guest";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: sub_catagories id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY sub_catagories ALTER COLUMN id SET DEFAULT nextval('sub_catagories_id_seq'::regclass);


--
-- Name: subjects id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY subjects ALTER COLUMN id SET DEFAULT nextval('subjects_id_seq'::regclass);


--
-- Name: subjects_users id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY subjects_users ALTER COLUMN id SET DEFAULT nextval('subjects_users_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	default_env	2017-10-02 18:21:16.510017	2017-10-02 18:21:16.510017
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY schema_migrations (version) FROM stdin;
20171002180939
20171002182215
20171002182523
20171002183241
20171002230823
\.


--
-- Data for Name: sub_catagories; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY sub_catagories (id, title, description, created_at, updated_at) FROM stdin;
\.


--
-- Name: sub_catagories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('sub_catagories_id_seq', 1, false);


--
-- Data for Name: subjects; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY subjects (id, title, description, created_at, updated_at) FROM stdin;
\.


--
-- Name: subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('subjects_id_seq', 1, false);


--
-- Data for Name: subjects_users; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY subjects_users (id, subject_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: subjects_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('subjects_users_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY users (id, email, password, created_at, updated_at, first_name, last_name) FROM stdin;
1	john@test.com	google123	2017-10-02 23:12:08.91533	2017-10-02 23:12:08.91533	John	Doe
2	john@test.com	google123	2017-10-02 23:17:40.490662	2017-10-02 23:17:40.490662	John	Doe
3	john@test.com	gopher	2017-10-02 23:19:59.636273	2017-10-02 23:19:59.636273	John	Doe
4	john@test.com	gopher	2017-10-02 23:20:20.011932	2017-10-02 23:20:20.011932	John	Doe
5	john@test.com	gtg56	2017-10-02 23:23:05.860431	2017-10-02 23:23:05.860431	John	Doe
6	john@test.com	lol90	2017-10-02 23:29:40.537185	2017-10-02 23:29:40.537185	John	Doe
7	john@test.com	gtg56	2017-10-02 23:32:44.7838	2017-10-02 23:32:44.7838	John	Doe
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('users_id_seq', 7, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sub_catagories sub_catagories_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY sub_catagories
    ADD CONSTRAINT sub_catagories_pkey PRIMARY KEY (id);


--
-- Name: subjects subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (id);


--
-- Name: subjects_users subjects_users_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY subjects_users
    ADD CONSTRAINT subjects_users_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

