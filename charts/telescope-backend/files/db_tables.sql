--
-- PostgreSQL database dump
--


CREATE TABLE public.capability (
    id integer NOT NULL,
    domain_id integer,
    flag_id integer,
    description character varying(128),
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.capability OWNER TO postgres;

--
-- Name: capability_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.capability_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.capability_id_seq OWNER TO postgres;

--
-- Name: capability_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.capability_id_seq OWNED BY public.capability.id;


--
-- Name: domain; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.domain (
    id integer NOT NULL,
    description character varying(128),
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.domain OWNER TO postgres;

--
-- Name: domain_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.domain_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.domain_id_seq OWNER TO postgres;

--
-- Name: domain_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.domain_id_seq OWNED BY public.domain.id;


--
-- Name: flag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flag (
    id integer NOT NULL,
    description character varying(128),
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.flag OWNER TO postgres;

--
-- Name: flag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.flag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.flag_id_seq OWNER TO postgres;

--
-- Name: flag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
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
-- Name: capability id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.capability ALTER COLUMN id SET DEFAULT nextval('public.capability_id_seq'::regclass);


--
-- Name: domain id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.domain ALTER COLUMN id SET DEFAULT nextval('public.domain_id_seq'::regclass);


--
-- Name: flag id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flag ALTER COLUMN id SET DEFAULT nextval('public.flag_id_seq'::regclass);


--
-- Name: capability capability_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.capability
    ADD CONSTRAINT capability_pkey PRIMARY KEY (id);


--
-- Name: domain domain_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.domain
    ADD CONSTRAINT domain_pkey PRIMARY KEY (id);


--
-- Name: flag flag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flag
    ADD CONSTRAINT flag_pkey PRIMARY KEY (id);


--
-- Name: integrations integrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.integrations
    ADD CONSTRAINT integrations_pkey PRIMARY KEY (integration_id);


--
-- Add in Data
--

INSERT INTO domain(description) SELECT 'Secure Infrastructure' WHERE NOT EXISTS (SELECT 1 FROM domain where description = 'Secure Infrastructure');
INSERT INTO domain(description) SELECT 'Secure Data' WHERE NOT EXISTS (SELECT 1 FROM domain where description = 'Secure Data');
INSERT INTO domain(description) SELECT 'Secure Code' WHERE NOT EXISTS (SELECT 1 FROM domain where description = 'Secure Code');
INSERT INTO domain(description) SELECT 'Secure Integrations' WHERE NOT EXISTS (SELECT 1 FROM domain where description = 'Secure Integrations');
INSERT INTO domain(description) SELECT 'Secure Monitoring & Logging' WHERE NOT EXISTS (SELECT 1 FROM domain where description = 'Secure Monitoring & Logging');

INSERT INTO capability(domain_id, description, flag_id) SELECT 1, 'Platform Hardening', 1 WHERE NOT EXISTS (SELECT 1 FROM capability where domain_id = 1 AND description = 'Secure Infrastructure' AND flag_id = 1);
INSERT INTO capability(domain_id, description, flag_id) SELECT 1, 'Container Protection',1 WHERE NOT EXISTS (SELECT 1 FROM capability where domain_id = 1 AND description = 'Container Protection' AND flag_id = 1);
INSERT INTO capability(domain_id, description, flag_id) SELECT 1, 'Secure Images', 2 WHERE NOT EXISTS (SELECT 1 FROM capability where domain_id = 1 AND description = 'Secure Images' AND flag_id = 2);
INSERT INTO capability(domain_id, description, flag_id) SELECT 2, 'Classification', 1 WHERE NOT EXISTS (SELECT 1 FROM capability where domain_id = 2 AND description = 'Classification' AND flag_id = 1);
INSERT INTO capability(domain_id, description, flag_id) SELECT 2, 'Vulnerability Scanning', 2 WHERE NOT EXISTS (SELECT 1 FROM capability where domain_id = 2 AND description = 'Vulnerability Scanning' AND flag_id = 2);
INSERT INTO capability(domain_id, description, flag_id) SELECT 2, 'Encryption', 2 WHERE NOT EXISTS (SELECT 1 FROM capability where domain_id = 2 AND description = 'Encryption' AND flag_id = 2);
INSERT INTO capability(domain_id, description, flag_id) SELECT 2, 'Loss Prevention', 1 WHERE NOT EXISTS (SELECT 1 FROM capability where domain_id = 2 AND description = 'Loss Prevention' AND flag_id = 1);
INSERT INTO capability(domain_id, description, flag_id) SELECT 3, 'Static Code Analysis', 1 WHERE NOT EXISTS (SELECT 1 FROM capability where domain_id = 2 AND description = 'Static Code Analysis' AND flag_id = 1);
INSERT INTO capability(domain_id, description, flag_id) SELECT 3, 'Dynamic Code Analysis', 1 WHERE NOT EXISTS (SELECT 1 FROM capability where domain_id = 2 AND description = 'Dynamic Code Analysis' AND flag_id = 1);
INSERT INTO capability(domain_id, description, flag_id) SELECT 3, 'Vulnerability Assessment', 1 WHERE NOT EXISTS (SELECT 1 FROM capability where domain_id = 3 AND description = 'Vulnerability Assessment' AND flag_id = 1);
INSERT INTO capability(domain_id, description, flag_id) SELECT 4, 'Authentication', 2 WHERE NOT EXISTS (SELECT 1 FROM capability where domain_id = 4 AND description = 'Authentication' AND flag_id = 2);
INSERT INTO capability(domain_id, description, flag_id) SELECT 4, 'Traffic Analysis', 2 WHERE NOT EXISTS (SELECT 1 FROM capability where domain_id = 4 AND description = 'Traffic Analysis' AND flag_id = 2);
INSERT INTO capability(domain_id, description, flag_id) SELECT 4, 'Exposure Protection', 1 WHERE NOT EXISTS (SELECT 1 FROM capability where domain_id = 4 AND description = 'Exposure Protection' AND flag_id = 1);
INSERT INTO capability(domain_id, description, flag_id) SELECT 4, 'Secure Protocols', 1 WHERE NOT EXISTS (SELECT 1 FROM capability where domain_id = 4 AND description = 'Secure Protocols' AND flag_id = 1);
INSERT INTO capability(domain_id, description, flag_id) SELECT 5, 'Access Monitoring', 1 WHERE NOT EXISTS (SELECT 1 FROM capability where domain_id = 5 AND description = 'Access Monitoring' AND flag_id = 1);
INSERT INTO capability(domain_id, description, flag_id) SELECT 5, 'Log Centralization', 1 WHERE NOT EXISTS (SELECT 1 FROM capability where domain_id = 5 AND description = 'Log Centralization' AND flag_id = 1);

INSERT INTO flag(description) SELECT 'red' WHERE NOT EXISTS (SELECT 1 FROM flag where description = 'red');
INSERT INTO flag(description) SELECT 'green' WHERE NOT EXISTS (SELECT 1 FROM flag where description = 'green');




