--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: capability; Type: TABLE; Schema: public; Owner: telescope
--

CREATE TABLE public.capability (
    id integer NOT NULL,
    domain_id integer,
    flag_id integer,
    description character varying(128),
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.capability OWNER TO telescope;

--
-- Name: capability_id_seq; Type: SEQUENCE; Schema: public; Owner: telescope
--

CREATE SEQUENCE public.capability_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.capability_id_seq OWNER TO telescope;

--
-- Name: capability_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: telescope
--

ALTER SEQUENCE public.capability_id_seq OWNED BY public.capability.id;


--
-- Name: domain; Type: TABLE; Schema: public; Owner: telescope
--

CREATE TABLE public.domain (
    id integer NOT NULL,
    description character varying(128),
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.domain OWNER TO telescope;

--
-- Name: domain_id_seq; Type: SEQUENCE; Schema: public; Owner: telescope
--

CREATE SEQUENCE public.domain_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.domain_id_seq OWNER TO telescope;

--
-- Name: domain_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: telescope
--

ALTER SEQUENCE public.domain_id_seq OWNED BY public.domain.id;


--
-- Name: flag; Type: TABLE; Schema: public; Owner: telescope
--

CREATE TABLE public.flag (
    id integer NOT NULL,
    description character varying(128),
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.flag OWNER TO telescope;

--
-- Name: flag_id_seq; Type: SEQUENCE; Schema: public; Owner: telescope
--

CREATE SEQUENCE public.flag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.flag_id_seq OWNER TO telescope;

--
-- Name: flag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: telescope
--

ALTER SEQUENCE public.flag_id_seq OWNED BY public.flag.id;


--
-- Name: integration_id_seq; Type: SEQUENCE; Schema: public; Owner: telescope
--

CREATE SEQUENCE public.integration_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.integration_id_seq OWNER TO telescope;

--
-- Name: integration_methods; Type: TABLE; Schema: public; Owner: telescope
--

CREATE TABLE public.integration_methods (
    integration_method_name character varying,
    id bigint NOT NULL
);


ALTER TABLE public.integration_methods OWNER TO telescope;

--
-- Name: integration_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: telescope
--

CREATE SEQUENCE public.integration_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 1000
    CACHE 1;


ALTER TABLE public.integration_methods_id_seq OWNER TO telescope;

--
-- Name: integration_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: telescope
--

ALTER SEQUENCE public.integration_methods_id_seq OWNED BY public.integration_methods.id;


--
-- Name: integrations; Type: TABLE; Schema: public; Owner: telescope
--

CREATE TABLE public.integrations (
    integration_id bigint DEFAULT nextval('public.integration_id_seq'::regclass) NOT NULL,
    capability_id integer,
    url character varying(300),
    "user" character varying(100),
    password character varying(100),
    token character varying(5000),
    success_criteria character varying(100),
    last_update timestamp with time zone,
    integration_name character varying(100),
    integration_method_id bigint
);


ALTER TABLE public.integrations OWNER TO telescope;

--
-- Name: capability id; Type: DEFAULT; Schema: public; Owner: telescope
--

ALTER TABLE ONLY public.capability ALTER COLUMN id SET DEFAULT nextval('public.capability_id_seq'::regclass);


--
-- Name: domain id; Type: DEFAULT; Schema: public; Owner: telescope
--

ALTER TABLE ONLY public.domain ALTER COLUMN id SET DEFAULT nextval('public.domain_id_seq'::regclass);


--
-- Name: flag id; Type: DEFAULT; Schema: public; Owner: telescope
--

ALTER TABLE ONLY public.flag ALTER COLUMN id SET DEFAULT nextval('public.flag_id_seq'::regclass);


--
-- Name: integration_methods id; Type: DEFAULT; Schema: public; Owner: telescope
--

ALTER TABLE ONLY public.integration_methods ALTER COLUMN id SET DEFAULT nextval('public.integration_methods_id_seq'::regclass);


--
-- Data for Name: capability; Type: TABLE DATA; Schema: public; Owner: telescope
--

COPY public.capability (id, domain_id, flag_id, description, created_at) FROM stdin;
2	2	2	Classification	2023-01-05 12:05:28.270549
8	1	2	Platform Hardening	2023-01-05 12:06:29.110498
1	1	2	Secure Images	2023-01-05 12:05:28.265165
9	1	2	Container Protection	2023-01-05 12:06:38.023359
3	2	2	Encryption	2023-01-05 12:05:28.272751
4	2	2	Loss Prevention	2023-01-05 12:05:28.274548
10	2	2	Vulnerability Scanning	2023-01-05 12:06:50.545384
11	3	1	Static Code Analysis	2023-01-05 12:06:50.558534
12	3	1	Dynamic Code Analysis	2023-01-05 12:06:50.559867
13	3	2	Vulnerability Assessment	2023-01-05 12:06:50.560706
7	4	1	Secure Protocols	2023-01-05 12:05:28.280203
14	4	1	Exposure Protection	2023-01-05 12:06:50.562267
5	4	2	Authentication	2023-01-05 12:05:28.276929
6	4	2	Traffic Analysis	2023-01-05 12:05:28.278372
15	5	2	Access Monitoring	2023-01-05 12:06:50.563393
16	5	2	Log Centralization	2023-01-05 12:06:50.56422
\.


--
-- Data for Name: domain; Type: TABLE DATA; Schema: public; Owner: telescope
--

COPY public.domain (id, description, created_at) FROM stdin;
1	Secure Infrastructure	2023-01-05 12:04:58.133484
2	Secure Data	2023-01-05 12:04:58.145907
3	Secure Code	2023-01-05 12:04:58.147519
4	Secure Integrations	2023-01-05 12:04:58.149359
5	Secure Monitoring & Logging	2023-01-05 12:04:58.151347
\.


--
-- Data for Name: flag; Type: TABLE DATA; Schema: public; Owner: telescope
--

COPY public.flag (id, description, created_at) FROM stdin;
1	red	2023-01-05 12:06:10.998784
2	green	2023-01-05 12:06:17.838214
\.


--
-- Data for Name: integration_methods; Type: TABLE DATA; Schema: public; Owner: telescope
--

COPY public.integration_methods (integration_method_name, id) FROM stdin;
telescopeComplianceRhacs	1
\.


--
-- Name: capability_id_seq; Type: SEQUENCE SET; Schema: public; Owner: telescope
--

SELECT pg_catalog.setval('public.capability_id_seq', 16, true);


--
-- Name: domain_id_seq; Type: SEQUENCE SET; Schema: public; Owner: telescope
--

SELECT pg_catalog.setval('public.domain_id_seq', 5, true);


--
-- Name: flag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: telescope
--

SELECT pg_catalog.setval('public.flag_id_seq', 2, true);


--
-- Name: integration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: telescope
--

SELECT pg_catalog.setval('public.integration_id_seq', 10, true);


--
-- Name: integration_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: telescope
--

SELECT pg_catalog.setval('public.integration_methods_id_seq', 3, true);


--
-- Name: capability capability_pkey; Type: CONSTRAINT; Schema: public; Owner: telescope
--

ALTER TABLE ONLY public.capability
    ADD CONSTRAINT capability_pkey PRIMARY KEY (id);


--
-- Name: domain domain_pkey; Type: CONSTRAINT; Schema: public; Owner: telescope
--

ALTER TABLE ONLY public.domain
    ADD CONSTRAINT domain_pkey PRIMARY KEY (id);


--
-- Name: flag flag_pkey; Type: CONSTRAINT; Schema: public; Owner: telescope
--

ALTER TABLE ONLY public.flag
    ADD CONSTRAINT flag_pkey PRIMARY KEY (id);


--
-- Name: integrations integrations_pkey; Type: CONSTRAINT; Schema: public; Owner: telescope
--

ALTER TABLE ONLY public.integrations
    ADD CONSTRAINT integrations_pkey PRIMARY KEY (integration_id);


--
-- Name: TABLE integration_methods; Type: ACL; Schema: public; Owner: telescope
--

GRANT ALL ON TABLE public.integration_methods TO telescope;


--
-- PostgreSQL database dump complete
--

