--
-- PostgreSQL database dump
--

-- Dumped from database version 13.7
-- Dumped by pg_dump version 13.7

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
-- Name: integration_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.integration_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.integration_id_seq OWNER TO postgres;

--
-- Name: integrations; Type: TABLE; Schema: public; Owner: postgres
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
    integration_name character varying(100)
);


ALTER TABLE public.integrations OWNER TO postgres;

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
-- Data for Name: capability; Type: TABLE DATA; Schema: public; Owner: telescope
--

COPY public.capability (id, domain_id, flag_id, description, created_at) FROM stdin;
2	1	1	Container Protection	2023-01-10 14:23:32.664584
1	1	2	Platform Hardening	2023-01-10 14:23:32.663008
3	1	2	Secure Images	2023-01-10 14:23:32.665301
7	2	1	Loss Prevention	2023-01-10 14:23:32.66816
4	2	1	Classification	2023-01-10 14:23:32.666047
6	2	2	Encryption	2023-01-10 14:23:32.667418
5	2	2	Vulnerability Scanning	2023-01-10 14:23:32.666761
9	3	1	Dynamic Code Analysis	2023-01-10 14:23:32.669415
8	3	1	Static Code Analysis	2023-01-10 14:23:32.6688
10	3	2	Vulnerability Assessment	2023-01-10 14:23:32.670156
13	4	1	Exposure Protection	2023-01-10 14:23:32.672604
14	4	2	Secure Protocols	2023-01-10 14:23:32.673532
12	4	2	Traffic Analysis	2023-01-10 14:23:32.671502
11	4	2	Authentication	2023-01-10 14:23:32.670834
16	5	1	Log Centralization	2023-01-10 14:23:32.675072
15	5	1	Access Monitoring	2023-01-10 14:23:32.674359
\.


--
-- Data for Name: domain; Type: TABLE DATA; Schema: public; Owner: telescope
--

COPY public.domain (id, description, created_at) FROM stdin;
1	Secure Infrastructure	2023-01-10 14:23:32.645893
2	Secure Data	2023-01-10 14:23:32.656684
3	Secure Code	2023-01-10 14:23:32.657379
4	Secure Integrations	2023-01-10 14:23:32.658077
5	Secure Monitoring & Logging	2023-01-10 14:23:32.658706
\.


--
-- Data for Name: flag; Type: TABLE DATA; Schema: public; Owner: telescope
--

COPY public.flag (id, description, created_at) FROM stdin;
1	red	2023-01-10 14:23:32.679703
2	green	2023-01-10 14:23:32.680638
\.


--
-- Data for Name: integrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.integrations (integration_id, capability_id, url, "user", password, token, success_criteria, last_update, integration_name) FROM stdin;
\.


--
-- Name: capability_id_seq; Type: SEQUENCE SET; Schema: public; Owner: telescope
--

SELECT pg_catalog.setval('public.capability_id_seq', 22, true);


--
-- Name: domain_id_seq; Type: SEQUENCE SET; Schema: public; Owner: telescope
--

SELECT pg_catalog.setval('public.domain_id_seq', 5, true);


--
-- Name: flag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: telescope
--

SELECT pg_catalog.setval('public.flag_id_seq', 2, true);


--
-- Name: integration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.integration_id_seq', 2, true);


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
-- Name: SEQUENCE integration_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.integration_id_seq TO telescope;


--
-- Name: TABLE integrations; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.integrations TO telescope;


--
-- PostgreSQL database dump complete
--

