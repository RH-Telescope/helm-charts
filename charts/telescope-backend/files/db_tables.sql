--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.4

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
-- Name: capability_history(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.capability_history() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO
        capability_history(capability_id,flag)
        VALUES(new.id,new.flag_id);
           RETURN new;
END;
$$;


ALTER FUNCTION public.capability_history() OWNER TO postgres;

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
-- Name: capability_history; Type: TABLE; Schema: public; Owner: telescope
--

CREATE TABLE public.capability_history (
    id integer NOT NULL,
    capability_id integer,
    flag integer,
    updated timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.capability_history OWNER TO telescope;

--
-- Name: capability_history_id_seq; Type: SEQUENCE; Schema: public; Owner: telescope
--

CREATE SEQUENCE public.capability_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.capability_history_id_seq OWNER TO telescope;

--
-- Name: capability_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: telescope
--

ALTER SEQUENCE public.capability_history_id_seq OWNED BY public.capability_history.id;


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
    integration_method_id bigint,
    hash character(5)
);


ALTER TABLE public.integrations OWNER TO telescope;

--
-- Name: profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.profiles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profiles_id_seq OWNER TO postgres;

--
-- Name: profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profiles (
    id integer DEFAULT nextval('public.profiles_id_seq'::regclass) NOT NULL,
    name character varying(128),
    description character varying(128),
    domains integer[]
);


ALTER TABLE public.profiles OWNER TO postgres;

--
-- Name: capability id; Type: DEFAULT; Schema: public; Owner: telescope
--

ALTER TABLE ONLY public.capability ALTER COLUMN id SET DEFAULT nextval('public.capability_id_seq'::regclass);


--
-- Name: capability_history id; Type: DEFAULT; Schema: public; Owner: telescope
--

ALTER TABLE ONLY public.capability_history ALTER COLUMN id SET DEFAULT nextval('public.capability_history_id_seq'::regclass);


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

INSERT INTO public.capability VALUES (52, 18, 1, 'Automation and Orchestration', '2023-10-06 15:27:06.048685');
INSERT INTO public.capability VALUES (53, 18, 2, 'Governance', '2023-10-06 15:27:16.894685');
INSERT INTO public.capability VALUES (54, 18, 2, 'Visibility and Analytics', '2023-10-06 15:27:29.431084');
INSERT INTO public.capability VALUES (9, 1, 2, 'Container Protection', '2023-01-05 12:06:38.023359');
INSERT INTO public.capability VALUES (8, 1, 2, 'Platform Hardening', '2023-01-05 12:06:29.110498');
INSERT INTO public.capability VALUES (43, 14, 2, 'Accessible Applications', '2023-10-06 15:22:05.877366');
INSERT INTO public.capability VALUES (44, 14, 2, 'Application Access', '2023-10-06 15:22:20.977352');
INSERT INTO public.capability VALUES (45, 14, 2, 'Application Security Testing', '2023-10-06 15:22:42.86989');
INSERT INTO public.capability VALUES (1, 1, 2, 'Secure Images', '2023-01-05 12:05:28.265165');
INSERT INTO public.capability VALUES (2, 2, 2, 'Classification', '2023-01-05 12:05:28.270549');
INSERT INTO public.capability VALUES (3, 2, 2, 'Encryption at Rest', '2023-01-05 12:05:28.272751');
INSERT INTO public.capability VALUES (10, 2, 2, 'Vulnerability Scanning', '2023-01-05 12:06:50.545384');
INSERT INTO public.capability VALUES (60, 3, 2, 'DAST', '2023-10-12 12:46:45.190308');
INSERT INTO public.capability VALUES (59, 3, 1, 'SAST', '2023-10-12 12:46:39.490502');
INSERT INTO public.capability VALUES (61, 3, 1, 'Validated SBOM', '2023-10-12 12:46:59.907279');
INSERT INTO public.capability VALUES (46, 14, 2, 'Application Threat Protections', '2023-10-06 15:23:00.305145');
INSERT INTO public.capability VALUES (37, 14, 2, 'Device Threat Protection', '2023-10-06 15:19:49.58944');
INSERT INTO public.capability VALUES (38, 14, 2, 'Policy Enforcement', '2023-10-06 15:20:03.379245');
INSERT INTO public.capability VALUES (35, 14, 2, 'Resource Access', '2023-10-06 15:19:15.829315');
INSERT INTO public.capability VALUES (36, 14, 2, 'Supply Chain Risk Management', '2023-10-06 15:19:34.224251');
INSERT INTO public.capability VALUES (47, 15, 2, 'Data Access', '2023-10-06 15:23:33.053765');
INSERT INTO public.capability VALUES (48, 15, 2, 'Data Availability', '2023-10-06 15:23:44.105081');
INSERT INTO public.capability VALUES (49, 15, 2, 'Data Categorization', '2023-10-06 15:23:56.604482');
INSERT INTO public.capability VALUES (50, 15, 1, 'Data Encryption', '2023-10-06 15:24:08.347428');
INSERT INTO public.capability VALUES (51, 15, 2, 'Data Inventory Management', '2023-10-06 15:24:21.317944');
INSERT INTO public.capability VALUES (39, 16, 2, 'Network Resilience', '2023-10-06 15:20:43.423782');
INSERT INTO public.capability VALUES (40, 16, 1, 'Network Segmentation', '2023-10-06 15:20:56.914121');
INSERT INTO public.capability VALUES (41, 16, 2, 'Network Traffic Management', '2023-10-06 15:21:10.478316');
INSERT INTO public.capability VALUES (42, 16, 2, 'Traffic Encryption', '2023-10-06 15:21:24.9588');
INSERT INTO public.capability VALUES (31, 17, 1, 'Access Management', '2023-10-06 15:08:15.534594');
INSERT INTO public.capability VALUES (32, 17, 1, 'Authentication', '2023-10-06 15:17:59.242437');
INSERT INTO public.capability VALUES (33, 17, 1, 'Identity Stores', '2023-10-06 15:18:16.639232');
INSERT INTO public.capability VALUES (62, 4, 2, 'Encryption in Transit', '2023-10-12 12:52:03.309656');
INSERT INTO public.capability VALUES (63, 4, 2, 'Firewalls', '2023-10-12 12:52:18.607406');
INSERT INTO public.capability VALUES (64, 4, 2, 'Policy', '2023-10-12 12:52:33.478537');
INSERT INTO public.capability VALUES (65, 5, 2, 'Asset Management', '2023-10-12 12:53:39.222796');
INSERT INTO public.capability VALUES (67, 5, 2, 'IDS/IPS', '2023-10-12 12:54:56.844442');
INSERT INTO public.capability VALUES (68, 5, 2, 'SIEM', '2023-10-12 12:55:08.580479');
INSERT INTO public.capability VALUES (55, 13, 2, 'Device Threat Protection', '2023-10-06 15:32:38.35061');
INSERT INTO public.capability VALUES (56, 13, 2, 'Policy Enforcement', '2023-10-06 15:33:05.119296');
INSERT INTO public.capability VALUES (57, 13, 2, 'Resource Access', '2023-10-06 15:33:19.960765');
INSERT INTO public.capability VALUES (34, 13, 2, 'Risk Assessments', '2023-10-06 15:18:30.44223');


--
-- Data for Name: capability_history; Type: TABLE DATA; Schema: public; Owner: telescope
--

INSERT INTO public.capability_history VALUES (1, 10, 1, '2023-08-01 15:40:30.404115');
INSERT INTO public.capability_history VALUES (2, 10, 1, '2023-08-01 15:40:54.71354');
INSERT INTO public.capability_history VALUES (3, 10, 2, '2023-08-01 15:41:00.5748');
INSERT INTO public.capability_history VALUES (4, 10, 1, '2023-08-01 15:41:06.459694');
INSERT INTO public.capability_history VALUES (7, 10, 2, '2023-07-29 15:40:30.404115');
INSERT INTO public.capability_history VALUES (8, 10, 2, '2023-07-28 15:40:30.404115');
INSERT INTO public.capability_history VALUES (9, 10, 1, '2023-07-27 15:40:30.404115');
INSERT INTO public.capability_history VALUES (10, 10, 1, '2023-07-22 15:40:30.404115');
INSERT INTO public.capability_history VALUES (11, 10, 2, '2023-07-19 15:40:30.404115');
INSERT INTO public.capability_history VALUES (12, 10, 1, '2023-07-16 15:40:30.404115');
INSERT INTO public.capability_history VALUES (13, 10, 2, '2023-07-10 15:40:30.404115');
INSERT INTO public.capability_history VALUES (14, 11, 1, '2023-08-14 09:28:55.55057');
INSERT INTO public.capability_history VALUES (15, 13, 2, '2023-08-14 09:28:55.560938');
INSERT INTO public.capability_history VALUES (16, 2, 2, '2023-08-14 09:28:55.562282');
INSERT INTO public.capability_history VALUES (17, 3, 2, '2023-08-14 09:28:55.563431');
INSERT INTO public.capability_history VALUES (18, 4, 1, '2023-08-14 09:28:55.564639');
INSERT INTO public.capability_history VALUES (19, 10, 1, '2023-08-14 09:28:55.566093');
INSERT INTO public.capability_history VALUES (20, 9, 1, '2023-08-14 09:28:55.567374');
INSERT INTO public.capability_history VALUES (21, 8, 2, '2023-08-14 09:28:55.568548');
INSERT INTO public.capability_history VALUES (22, 1, 2, '2023-08-14 09:28:55.569786');
INSERT INTO public.capability_history VALUES (23, 5, 2, '2023-08-14 09:28:55.570966');
INSERT INTO public.capability_history VALUES (24, 14, 1, '2023-08-14 09:28:55.572176');
INSERT INTO public.capability_history VALUES (25, 7, 2, '2023-08-14 09:28:55.573338');
INSERT INTO public.capability_history VALUES (26, 6, 2, '2023-08-14 09:28:55.574661');
INSERT INTO public.capability_history VALUES (27, 17, 2, '2023-08-14 09:28:55.576276');
INSERT INTO public.capability_history VALUES (28, 18, 2, '2023-08-14 09:28:55.577555');
INSERT INTO public.capability_history VALUES (29, 30, 2, '2023-08-14 09:28:55.578861');
INSERT INTO public.capability_history VALUES (30, 11, 2, '2023-08-14 09:39:45.513221');
INSERT INTO public.capability_history VALUES (31, 11, 2, '2023-08-14 09:40:23.533028');
INSERT INTO public.capability_history VALUES (32, 11, 1, '2023-08-14 10:18:09.665266');
INSERT INTO public.capability_history VALUES (33, 13, 2, '2023-08-14 10:18:09.676535');
INSERT INTO public.capability_history VALUES (34, 2, 2, '2023-08-14 10:18:09.678076');
INSERT INTO public.capability_history VALUES (35, 3, 2, '2023-08-14 10:18:09.679521');
INSERT INTO public.capability_history VALUES (36, 4, 2, '2023-08-14 10:18:09.681108');
INSERT INTO public.capability_history VALUES (37, 10, 1, '2023-08-14 10:18:09.682482');
INSERT INTO public.capability_history VALUES (38, 9, 2, '2023-08-14 10:18:09.683809');
INSERT INTO public.capability_history VALUES (39, 8, 2, '2023-08-14 10:18:09.685163');
INSERT INTO public.capability_history VALUES (40, 1, 2, '2023-08-14 10:18:09.68657');
INSERT INTO public.capability_history VALUES (41, 5, 2, '2023-08-14 10:18:09.687871');
INSERT INTO public.capability_history VALUES (42, 14, 1, '2023-08-14 10:18:09.6894');
INSERT INTO public.capability_history VALUES (43, 7, 2, '2023-08-14 10:18:09.690759');
INSERT INTO public.capability_history VALUES (44, 6, 2, '2023-08-14 10:18:09.692034');
INSERT INTO public.capability_history VALUES (45, 17, 2, '2023-08-14 10:18:09.693239');
INSERT INTO public.capability_history VALUES (46, 18, 2, '2023-08-14 10:18:09.694471');
INSERT INTO public.capability_history VALUES (47, 30, 2, '2023-08-14 10:18:09.69576');
INSERT INTO public.capability_history VALUES (48, 11, 2, '2023-10-03 17:39:19.90606');
INSERT INTO public.capability_history VALUES (49, 13, 2, '2023-10-03 17:39:19.9174');
INSERT INTO public.capability_history VALUES (50, 2, 2, '2023-10-03 17:39:19.918755');
INSERT INTO public.capability_history VALUES (51, 3, 2, '2023-10-03 17:39:19.920006');
INSERT INTO public.capability_history VALUES (52, 4, 2, '2023-10-03 17:39:19.921355');
INSERT INTO public.capability_history VALUES (53, 10, 1, '2023-10-03 17:39:19.922522');
INSERT INTO public.capability_history VALUES (54, 9, 2, '2023-10-03 17:39:19.923711');
INSERT INTO public.capability_history VALUES (55, 8, 2, '2023-10-03 17:39:19.925375');
INSERT INTO public.capability_history VALUES (56, 1, 2, '2023-10-03 17:39:19.92662');
INSERT INTO public.capability_history VALUES (57, 5, 2, '2023-10-03 17:39:19.927933');
INSERT INTO public.capability_history VALUES (58, 14, 1, '2023-10-03 17:39:19.929217');
INSERT INTO public.capability_history VALUES (59, 7, 2, '2023-10-03 17:39:19.930558');
INSERT INTO public.capability_history VALUES (60, 6, 2, '2023-10-03 17:39:19.931944');
INSERT INTO public.capability_history VALUES (61, 17, 2, '2023-10-03 17:39:19.933225');
INSERT INTO public.capability_history VALUES (62, 18, 2, '2023-10-03 17:39:19.934514');
INSERT INTO public.capability_history VALUES (63, 30, 2, '2023-10-03 17:39:19.935716');
INSERT INTO public.capability_history VALUES (64, 31, 2, '2023-10-06 15:30:29.008883');
INSERT INTO public.capability_history VALUES (65, 32, 2, '2023-10-06 15:30:49.617628');
INSERT INTO public.capability_history VALUES (66, 33, 2, '2023-10-06 15:31:02.328934');
INSERT INTO public.capability_history VALUES (67, 43, 2, '2023-10-06 15:36:50.524496');
INSERT INTO public.capability_history VALUES (68, 44, 2, '2023-10-06 15:36:50.535261');
INSERT INTO public.capability_history VALUES (69, 45, 1, '2023-10-06 15:36:50.536797');
INSERT INTO public.capability_history VALUES (70, 46, 2, '2023-10-06 15:36:50.538303');
INSERT INTO public.capability_history VALUES (71, 37, 2, '2023-10-06 15:36:50.539823');
INSERT INTO public.capability_history VALUES (72, 38, 2, '2023-10-06 15:36:50.541287');
INSERT INTO public.capability_history VALUES (73, 35, 2, '2023-10-06 15:36:50.542679');
INSERT INTO public.capability_history VALUES (74, 36, 2, '2023-10-06 15:36:50.544096');
INSERT INTO public.capability_history VALUES (75, 11, 2, '2023-10-06 15:36:50.545304');
INSERT INTO public.capability_history VALUES (76, 13, 2, '2023-10-06 15:36:50.546715');
INSERT INTO public.capability_history VALUES (77, 52, 2, '2023-10-06 15:36:50.548027');
INSERT INTO public.capability_history VALUES (78, 53, 2, '2023-10-06 15:36:50.549504');
INSERT INTO public.capability_history VALUES (79, 54, 2, '2023-10-06 15:36:50.550902');
INSERT INTO public.capability_history VALUES (80, 47, 2, '2023-10-06 15:36:50.552238');
INSERT INTO public.capability_history VALUES (81, 48, 2, '2023-10-06 15:36:50.553532');
INSERT INTO public.capability_history VALUES (82, 49, 2, '2023-10-06 15:36:50.55476');
INSERT INTO public.capability_history VALUES (83, 50, 2, '2023-10-06 15:36:50.55595');
INSERT INTO public.capability_history VALUES (84, 51, 2, '2023-10-06 15:36:50.557193');
INSERT INTO public.capability_history VALUES (85, 2, 2, '2023-10-06 15:36:50.558407');
INSERT INTO public.capability_history VALUES (86, 3, 2, '2023-10-06 15:36:50.559647');
INSERT INTO public.capability_history VALUES (87, 4, 2, '2023-10-06 15:36:50.560878');
INSERT INTO public.capability_history VALUES (88, 10, 1, '2023-10-06 15:36:50.562124');
INSERT INTO public.capability_history VALUES (89, 55, 1, '2023-10-06 15:36:50.563315');
INSERT INTO public.capability_history VALUES (90, 56, 2, '2023-10-06 15:36:50.56452');
INSERT INTO public.capability_history VALUES (91, 57, 2, '2023-10-06 15:36:50.565784');
INSERT INTO public.capability_history VALUES (92, 34, 2, '2023-10-06 15:36:50.566937');
INSERT INTO public.capability_history VALUES (93, 31, 2, '2023-10-06 15:36:50.568343');
INSERT INTO public.capability_history VALUES (94, 32, 2, '2023-10-06 15:36:50.569753');
INSERT INTO public.capability_history VALUES (95, 33, 2, '2023-10-06 15:36:50.570848');
INSERT INTO public.capability_history VALUES (96, 9, 2, '2023-10-06 15:36:50.572116');
INSERT INTO public.capability_history VALUES (97, 8, 2, '2023-10-06 15:36:50.573207');
INSERT INTO public.capability_history VALUES (98, 1, 2, '2023-10-06 15:36:50.574537');
INSERT INTO public.capability_history VALUES (99, 5, 2, '2023-10-06 15:36:50.575783');
INSERT INTO public.capability_history VALUES (100, 14, 1, '2023-10-06 15:36:50.577111');
INSERT INTO public.capability_history VALUES (101, 7, 2, '2023-10-06 15:36:50.578296');
INSERT INTO public.capability_history VALUES (102, 6, 2, '2023-10-06 15:36:50.579573');
INSERT INTO public.capability_history VALUES (103, 17, 2, '2023-10-06 15:36:50.580793');
INSERT INTO public.capability_history VALUES (104, 18, 2, '2023-10-06 15:36:50.582173');
INSERT INTO public.capability_history VALUES (105, 30, 2, '2023-10-06 15:36:50.583778');
INSERT INTO public.capability_history VALUES (106, 39, 2, '2023-10-06 15:36:50.585316');
INSERT INTO public.capability_history VALUES (107, 40, 2, '2023-10-06 15:36:50.586725');
INSERT INTO public.capability_history VALUES (108, 41, 2, '2023-10-06 15:36:50.588105');
INSERT INTO public.capability_history VALUES (109, 42, 2, '2023-10-06 15:36:50.58941');
INSERT INTO public.capability_history VALUES (110, 43, 2, '2023-10-06 18:20:56.010476');
INSERT INTO public.capability_history VALUES (111, 44, 2, '2023-10-06 18:20:56.020189');
INSERT INTO public.capability_history VALUES (112, 45, 1, '2023-10-06 18:20:56.021761');
INSERT INTO public.capability_history VALUES (113, 46, 2, '2023-10-06 18:20:56.023052');
INSERT INTO public.capability_history VALUES (114, 37, 2, '2023-10-06 18:20:56.024681');
INSERT INTO public.capability_history VALUES (115, 38, 2, '2023-10-06 18:20:56.026087');
INSERT INTO public.capability_history VALUES (116, 35, 2, '2023-10-06 18:20:56.027315');
INSERT INTO public.capability_history VALUES (117, 36, 2, '2023-10-06 18:20:56.02857');
INSERT INTO public.capability_history VALUES (118, 11, 2, '2023-10-06 18:20:56.02986');
INSERT INTO public.capability_history VALUES (119, 13, 2, '2023-10-06 18:20:56.031003');
INSERT INTO public.capability_history VALUES (120, 52, 2, '2023-10-06 18:20:56.032158');
INSERT INTO public.capability_history VALUES (121, 53, 2, '2023-10-06 18:20:56.033246');
INSERT INTO public.capability_history VALUES (122, 54, 2, '2023-10-06 18:20:56.034372');
INSERT INTO public.capability_history VALUES (123, 47, 2, '2023-10-06 18:20:56.035531');
INSERT INTO public.capability_history VALUES (124, 48, 2, '2023-10-06 18:20:56.03661');
INSERT INTO public.capability_history VALUES (125, 49, 2, '2023-10-06 18:20:56.037687');
INSERT INTO public.capability_history VALUES (126, 50, 2, '2023-10-06 18:20:56.03881');
INSERT INTO public.capability_history VALUES (127, 51, 2, '2023-10-06 18:20:56.040092');
INSERT INTO public.capability_history VALUES (128, 2, 2, '2023-10-06 18:20:56.041226');
INSERT INTO public.capability_history VALUES (129, 3, 2, '2023-10-06 18:20:56.042486');
INSERT INTO public.capability_history VALUES (130, 4, 2, '2023-10-06 18:20:56.043658');
INSERT INTO public.capability_history VALUES (131, 10, 1, '2023-10-06 18:20:56.044771');
INSERT INTO public.capability_history VALUES (132, 55, 1, '2023-10-06 18:20:56.045955');
INSERT INTO public.capability_history VALUES (133, 56, 2, '2023-10-06 18:20:56.047085');
INSERT INTO public.capability_history VALUES (134, 57, 2, '2023-10-06 18:20:56.048187');
INSERT INTO public.capability_history VALUES (135, 34, 2, '2023-10-06 18:20:56.049276');
INSERT INTO public.capability_history VALUES (136, 31, 2, '2023-10-06 18:20:56.050528');
INSERT INTO public.capability_history VALUES (137, 32, 2, '2023-10-06 18:20:56.051595');
INSERT INTO public.capability_history VALUES (138, 33, 2, '2023-10-06 18:20:56.052716');
INSERT INTO public.capability_history VALUES (139, 9, 2, '2023-10-06 18:20:56.053802');
INSERT INTO public.capability_history VALUES (140, 8, 2, '2023-10-06 18:20:56.055031');
INSERT INTO public.capability_history VALUES (141, 1, 2, '2023-10-06 18:20:56.059493');
INSERT INTO public.capability_history VALUES (142, 5, 2, '2023-10-06 18:20:56.061311');
INSERT INTO public.capability_history VALUES (143, 14, 1, '2023-10-06 18:20:56.062546');
INSERT INTO public.capability_history VALUES (144, 7, 2, '2023-10-06 18:20:56.067019');
INSERT INTO public.capability_history VALUES (145, 6, 2, '2023-10-06 18:20:56.069036');
INSERT INTO public.capability_history VALUES (146, 17, 2, '2023-10-06 18:20:56.073438');
INSERT INTO public.capability_history VALUES (147, 18, 2, '2023-10-06 18:20:56.074536');
INSERT INTO public.capability_history VALUES (148, 30, 2, '2023-10-06 18:20:56.075619');
INSERT INTO public.capability_history VALUES (149, 39, 2, '2023-10-06 18:20:56.076729');
INSERT INTO public.capability_history VALUES (150, 40, 1, '2023-10-06 18:20:56.078026');
INSERT INTO public.capability_history VALUES (151, 41, 2, '2023-10-06 18:20:56.079176');
INSERT INTO public.capability_history VALUES (152, 42, 2, '2023-10-06 18:20:56.080357');
INSERT INTO public.capability_history VALUES (153, 43, 2, '2023-10-06 18:23:13.04056');
INSERT INTO public.capability_history VALUES (154, 44, 2, '2023-10-06 18:23:13.050415');
INSERT INTO public.capability_history VALUES (155, 45, 1, '2023-10-06 18:23:13.061534');
INSERT INTO public.capability_history VALUES (156, 46, 2, '2023-10-06 18:23:13.063028');
INSERT INTO public.capability_history VALUES (157, 37, 2, '2023-10-06 18:23:13.064249');
INSERT INTO public.capability_history VALUES (158, 38, 2, '2023-10-06 18:23:13.065607');
INSERT INTO public.capability_history VALUES (159, 35, 2, '2023-10-06 18:23:13.067001');
INSERT INTO public.capability_history VALUES (160, 36, 2, '2023-10-06 18:23:13.069206');
INSERT INTO public.capability_history VALUES (161, 11, 1, '2023-10-06 18:23:13.070309');
INSERT INTO public.capability_history VALUES (162, 13, 2, '2023-10-06 18:23:13.071594');
INSERT INTO public.capability_history VALUES (163, 52, 2, '2023-10-06 18:23:13.072924');
INSERT INTO public.capability_history VALUES (164, 53, 2, '2023-10-06 18:23:13.074307');
INSERT INTO public.capability_history VALUES (165, 54, 2, '2023-10-06 18:23:13.075582');
INSERT INTO public.capability_history VALUES (166, 47, 2, '2023-10-06 18:23:13.076778');
INSERT INTO public.capability_history VALUES (167, 48, 2, '2023-10-06 18:23:13.077998');
INSERT INTO public.capability_history VALUES (168, 49, 2, '2023-10-06 18:23:13.079224');
INSERT INTO public.capability_history VALUES (169, 50, 2, '2023-10-06 18:23:13.080464');
INSERT INTO public.capability_history VALUES (170, 51, 2, '2023-10-06 18:23:13.081614');
INSERT INTO public.capability_history VALUES (171, 2, 2, '2023-10-06 18:23:13.082725');
INSERT INTO public.capability_history VALUES (172, 3, 2, '2023-10-06 18:23:13.083855');
INSERT INTO public.capability_history VALUES (173, 4, 2, '2023-10-06 18:23:13.085733');
INSERT INTO public.capability_history VALUES (174, 10, 1, '2023-10-06 18:23:13.087013');
INSERT INTO public.capability_history VALUES (175, 55, 1, '2023-10-06 18:23:13.088169');
INSERT INTO public.capability_history VALUES (176, 56, 2, '2023-10-06 18:23:13.089305');
INSERT INTO public.capability_history VALUES (177, 57, 2, '2023-10-06 18:23:13.09058');
INSERT INTO public.capability_history VALUES (178, 34, 2, '2023-10-06 18:23:13.091846');
INSERT INTO public.capability_history VALUES (179, 31, 2, '2023-10-06 18:23:13.093014');
INSERT INTO public.capability_history VALUES (180, 32, 2, '2023-10-06 18:23:13.094137');
INSERT INTO public.capability_history VALUES (181, 33, 2, '2023-10-06 18:23:13.095467');
INSERT INTO public.capability_history VALUES (182, 9, 2, '2023-10-06 18:23:13.096605');
INSERT INTO public.capability_history VALUES (183, 8, 2, '2023-10-06 18:23:13.097784');
INSERT INTO public.capability_history VALUES (184, 1, 2, '2023-10-06 18:23:13.098982');
INSERT INTO public.capability_history VALUES (185, 5, 2, '2023-10-06 18:23:13.100118');
INSERT INTO public.capability_history VALUES (186, 14, 1, '2023-10-06 18:23:13.10122');
INSERT INTO public.capability_history VALUES (187, 7, 2, '2023-10-06 18:23:13.10244');
INSERT INTO public.capability_history VALUES (188, 6, 2, '2023-10-06 18:23:13.103753');
INSERT INTO public.capability_history VALUES (189, 17, 2, '2023-10-06 18:23:13.104827');
INSERT INTO public.capability_history VALUES (190, 18, 2, '2023-10-06 18:23:13.106006');
INSERT INTO public.capability_history VALUES (191, 30, 2, '2023-10-06 18:23:13.107275');
INSERT INTO public.capability_history VALUES (192, 39, 2, '2023-10-06 18:23:13.108618');
INSERT INTO public.capability_history VALUES (193, 40, 1, '2023-10-06 18:23:13.109752');
INSERT INTO public.capability_history VALUES (194, 41, 2, '2023-10-06 18:23:13.110902');
INSERT INTO public.capability_history VALUES (195, 42, 2, '2023-10-06 18:23:13.112035');
INSERT INTO public.capability_history VALUES (196, 43, 2, '2023-10-06 18:23:19.980774');
INSERT INTO public.capability_history VALUES (197, 44, 2, '2023-10-06 18:23:19.991198');
INSERT INTO public.capability_history VALUES (198, 45, 1, '2023-10-06 18:23:19.992386');
INSERT INTO public.capability_history VALUES (199, 46, 2, '2023-10-06 18:23:19.993637');
INSERT INTO public.capability_history VALUES (200, 37, 2, '2023-10-06 18:23:19.994803');
INSERT INTO public.capability_history VALUES (201, 38, 2, '2023-10-06 18:23:19.996025');
INSERT INTO public.capability_history VALUES (202, 35, 2, '2023-10-06 18:23:19.997375');
INSERT INTO public.capability_history VALUES (203, 36, 2, '2023-10-06 18:23:19.998712');
INSERT INTO public.capability_history VALUES (204, 11, 1, '2023-10-06 18:23:20.000175');
INSERT INTO public.capability_history VALUES (205, 13, 2, '2023-10-06 18:23:20.001396');
INSERT INTO public.capability_history VALUES (206, 52, 2, '2023-10-06 18:23:20.00259');
INSERT INTO public.capability_history VALUES (207, 53, 2, '2023-10-06 18:23:20.003613');
INSERT INTO public.capability_history VALUES (208, 54, 2, '2023-10-06 18:23:20.004765');
INSERT INTO public.capability_history VALUES (209, 47, 2, '2023-10-06 18:23:20.005798');
INSERT INTO public.capability_history VALUES (210, 48, 2, '2023-10-06 18:23:20.006898');
INSERT INTO public.capability_history VALUES (211, 49, 2, '2023-10-06 18:23:20.008133');
INSERT INTO public.capability_history VALUES (212, 50, 1, '2023-10-06 18:23:20.009249');
INSERT INTO public.capability_history VALUES (213, 51, 2, '2023-10-06 18:23:20.010335');
INSERT INTO public.capability_history VALUES (214, 2, 2, '2023-10-06 18:23:20.011559');
INSERT INTO public.capability_history VALUES (215, 3, 2, '2023-10-06 18:23:20.01253');
INSERT INTO public.capability_history VALUES (216, 4, 2, '2023-10-06 18:23:20.013681');
INSERT INTO public.capability_history VALUES (217, 10, 1, '2023-10-06 18:23:20.014783');
INSERT INTO public.capability_history VALUES (218, 55, 1, '2023-10-06 18:23:20.016157');
INSERT INTO public.capability_history VALUES (219, 56, 2, '2023-10-06 18:23:20.020645');
INSERT INTO public.capability_history VALUES (220, 57, 2, '2023-10-06 18:23:20.021832');
INSERT INTO public.capability_history VALUES (221, 34, 2, '2023-10-06 18:23:20.023035');
INSERT INTO public.capability_history VALUES (222, 31, 2, '2023-10-06 18:23:20.024182');
INSERT INTO public.capability_history VALUES (223, 32, 2, '2023-10-06 18:23:20.025319');
INSERT INTO public.capability_history VALUES (224, 33, 2, '2023-10-06 18:23:20.026568');
INSERT INTO public.capability_history VALUES (225, 9, 2, '2023-10-06 18:23:20.027804');
INSERT INTO public.capability_history VALUES (226, 8, 2, '2023-10-06 18:23:20.028997');
INSERT INTO public.capability_history VALUES (227, 1, 2, '2023-10-06 18:23:20.030122');
INSERT INTO public.capability_history VALUES (228, 5, 2, '2023-10-06 18:23:20.031241');
INSERT INTO public.capability_history VALUES (229, 14, 1, '2023-10-06 18:23:20.032476');
INSERT INTO public.capability_history VALUES (230, 7, 2, '2023-10-06 18:23:20.033651');
INSERT INTO public.capability_history VALUES (231, 6, 2, '2023-10-06 18:23:20.034759');
INSERT INTO public.capability_history VALUES (232, 17, 2, '2023-10-06 18:23:20.035848');
INSERT INTO public.capability_history VALUES (233, 18, 2, '2023-10-06 18:23:20.03705');
INSERT INTO public.capability_history VALUES (234, 30, 2, '2023-10-06 18:23:20.038213');
INSERT INTO public.capability_history VALUES (235, 39, 2, '2023-10-06 18:23:20.039442');
INSERT INTO public.capability_history VALUES (236, 40, 1, '2023-10-06 18:23:20.040644');
INSERT INTO public.capability_history VALUES (237, 41, 2, '2023-10-06 18:23:20.041803');
INSERT INTO public.capability_history VALUES (238, 42, 2, '2023-10-06 18:23:20.043067');
INSERT INTO public.capability_history VALUES (239, 43, 2, '2023-10-06 18:23:32.203696');
INSERT INTO public.capability_history VALUES (240, 44, 2, '2023-10-06 18:23:32.213832');
INSERT INTO public.capability_history VALUES (241, 45, 1, '2023-10-06 18:23:32.215178');
INSERT INTO public.capability_history VALUES (242, 46, 2, '2023-10-06 18:23:32.216533');
INSERT INTO public.capability_history VALUES (243, 37, 2, '2023-10-06 18:23:32.217723');
INSERT INTO public.capability_history VALUES (244, 38, 2, '2023-10-06 18:23:32.219053');
INSERT INTO public.capability_history VALUES (245, 35, 2, '2023-10-06 18:23:32.220235');
INSERT INTO public.capability_history VALUES (246, 36, 2, '2023-10-06 18:23:32.221345');
INSERT INTO public.capability_history VALUES (247, 11, 2, '2023-10-06 18:23:32.222582');
INSERT INTO public.capability_history VALUES (248, 13, 2, '2023-10-06 18:23:32.22377');
INSERT INTO public.capability_history VALUES (249, 52, 2, '2023-10-06 18:23:32.224902');
INSERT INTO public.capability_history VALUES (250, 53, 2, '2023-10-06 18:23:32.226061');
INSERT INTO public.capability_history VALUES (251, 54, 2, '2023-10-06 18:23:32.227326');
INSERT INTO public.capability_history VALUES (252, 47, 2, '2023-10-06 18:23:32.228747');
INSERT INTO public.capability_history VALUES (253, 48, 2, '2023-10-06 18:23:32.230098');
INSERT INTO public.capability_history VALUES (254, 49, 2, '2023-10-06 18:23:32.231442');
INSERT INTO public.capability_history VALUES (255, 50, 1, '2023-10-06 18:23:32.232662');
INSERT INTO public.capability_history VALUES (256, 51, 2, '2023-10-06 18:23:32.233849');
INSERT INTO public.capability_history VALUES (257, 2, 2, '2023-10-06 18:23:32.234944');
INSERT INTO public.capability_history VALUES (258, 3, 2, '2023-10-06 18:23:32.236104');
INSERT INTO public.capability_history VALUES (259, 4, 2, '2023-10-06 18:23:32.237268');
INSERT INTO public.capability_history VALUES (260, 10, 1, '2023-10-06 18:23:32.238377');
INSERT INTO public.capability_history VALUES (261, 55, 1, '2023-10-06 18:23:32.239537');
INSERT INTO public.capability_history VALUES (262, 56, 2, '2023-10-06 18:23:32.240526');
INSERT INTO public.capability_history VALUES (263, 57, 2, '2023-10-06 18:23:32.241631');
INSERT INTO public.capability_history VALUES (264, 34, 2, '2023-10-06 18:23:32.242793');
INSERT INTO public.capability_history VALUES (265, 31, 2, '2023-10-06 18:23:32.243989');
INSERT INTO public.capability_history VALUES (266, 32, 2, '2023-10-06 18:23:32.24524');
INSERT INTO public.capability_history VALUES (267, 33, 2, '2023-10-06 18:23:32.246429');
INSERT INTO public.capability_history VALUES (268, 9, 2, '2023-10-06 18:23:32.247698');
INSERT INTO public.capability_history VALUES (269, 8, 2, '2023-10-06 18:23:32.248754');
INSERT INTO public.capability_history VALUES (270, 1, 2, '2023-10-06 18:23:32.250141');
INSERT INTO public.capability_history VALUES (271, 5, 2, '2023-10-06 18:23:32.251466');
INSERT INTO public.capability_history VALUES (272, 14, 1, '2023-10-06 18:23:32.252645');
INSERT INTO public.capability_history VALUES (273, 7, 2, '2023-10-06 18:23:32.253824');
INSERT INTO public.capability_history VALUES (274, 6, 2, '2023-10-06 18:23:32.255026');
INSERT INTO public.capability_history VALUES (275, 17, 2, '2023-10-06 18:23:32.256151');
INSERT INTO public.capability_history VALUES (276, 18, 2, '2023-10-06 18:23:32.257235');
INSERT INTO public.capability_history VALUES (277, 30, 2, '2023-10-06 18:23:32.258389');
INSERT INTO public.capability_history VALUES (278, 39, 2, '2023-10-06 18:23:32.26274');
INSERT INTO public.capability_history VALUES (279, 40, 1, '2023-10-06 18:23:32.263972');
INSERT INTO public.capability_history VALUES (280, 41, 2, '2023-10-06 18:23:32.268494');
INSERT INTO public.capability_history VALUES (281, 42, 2, '2023-10-06 18:23:32.270603');
INSERT INTO public.capability_history VALUES (282, 43, 2, '2023-10-10 13:57:50.813141');
INSERT INTO public.capability_history VALUES (283, 44, 2, '2023-10-10 13:57:50.822444');
INSERT INTO public.capability_history VALUES (284, 45, 1, '2023-10-10 13:57:50.823879');
INSERT INTO public.capability_history VALUES (285, 46, 2, '2023-10-10 13:57:50.825241');
INSERT INTO public.capability_history VALUES (286, 37, 2, '2023-10-10 13:57:50.826593');
INSERT INTO public.capability_history VALUES (287, 38, 2, '2023-10-10 13:57:50.827922');
INSERT INTO public.capability_history VALUES (288, 35, 2, '2023-10-10 13:57:50.829225');
INSERT INTO public.capability_history VALUES (289, 36, 2, '2023-10-10 13:57:50.83043');
INSERT INTO public.capability_history VALUES (290, 11, 2, '2023-10-10 13:57:50.831559');
INSERT INTO public.capability_history VALUES (291, 13, 2, '2023-10-10 13:57:50.832699');
INSERT INTO public.capability_history VALUES (292, 52, 2, '2023-10-10 13:57:50.833935');
INSERT INTO public.capability_history VALUES (293, 53, 2, '2023-10-10 13:57:50.83536');
INSERT INTO public.capability_history VALUES (294, 54, 2, '2023-10-10 13:57:50.836703');
INSERT INTO public.capability_history VALUES (295, 47, 2, '2023-10-10 13:57:50.838045');
INSERT INTO public.capability_history VALUES (296, 48, 2, '2023-10-10 13:57:50.839347');
INSERT INTO public.capability_history VALUES (297, 49, 2, '2023-10-10 13:57:50.840584');
INSERT INTO public.capability_history VALUES (298, 50, 1, '2023-10-10 13:57:50.84184');
INSERT INTO public.capability_history VALUES (299, 51, 2, '2023-10-10 13:57:50.843018');
INSERT INTO public.capability_history VALUES (300, 2, 2, '2023-10-10 13:57:50.844257');
INSERT INTO public.capability_history VALUES (301, 3, 2, '2023-10-10 13:57:50.845462');
INSERT INTO public.capability_history VALUES (302, 4, 2, '2023-10-10 13:57:50.846729');
INSERT INTO public.capability_history VALUES (303, 10, 2, '2023-10-10 13:57:50.848017');
INSERT INTO public.capability_history VALUES (304, 55, 1, '2023-10-10 13:57:50.849313');
INSERT INTO public.capability_history VALUES (305, 56, 2, '2023-10-10 13:57:50.850484');
INSERT INTO public.capability_history VALUES (306, 57, 2, '2023-10-10 13:57:50.851808');
INSERT INTO public.capability_history VALUES (307, 34, 2, '2023-10-10 13:57:50.853151');
INSERT INTO public.capability_history VALUES (308, 31, 2, '2023-10-10 13:57:50.854522');
INSERT INTO public.capability_history VALUES (309, 32, 2, '2023-10-10 13:57:50.855809');
INSERT INTO public.capability_history VALUES (310, 33, 2, '2023-10-10 13:57:50.857036');
INSERT INTO public.capability_history VALUES (311, 9, 2, '2023-10-10 13:57:50.85835');
INSERT INTO public.capability_history VALUES (312, 8, 2, '2023-10-10 13:57:50.863232');
INSERT INTO public.capability_history VALUES (313, 1, 2, '2023-10-10 13:57:50.864488');
INSERT INTO public.capability_history VALUES (314, 5, 2, '2023-10-10 13:57:50.865671');
INSERT INTO public.capability_history VALUES (315, 14, 1, '2023-10-10 13:57:50.866911');
INSERT INTO public.capability_history VALUES (316, 7, 2, '2023-10-10 13:57:50.868326');
INSERT INTO public.capability_history VALUES (317, 6, 2, '2023-10-10 13:57:50.869739');
INSERT INTO public.capability_history VALUES (318, 17, 2, '2023-10-10 13:57:50.87114');
INSERT INTO public.capability_history VALUES (319, 18, 2, '2023-10-10 13:57:50.872415');
INSERT INTO public.capability_history VALUES (320, 30, 2, '2023-10-10 13:57:50.873567');
INSERT INTO public.capability_history VALUES (321, 39, 2, '2023-10-10 13:57:50.874797');
INSERT INTO public.capability_history VALUES (322, 40, 1, '2023-10-10 13:57:50.876116');
INSERT INTO public.capability_history VALUES (323, 41, 2, '2023-10-10 13:57:50.877315');
INSERT INTO public.capability_history VALUES (324, 42, 2, '2023-10-10 13:57:50.87847');
INSERT INTO public.capability_history VALUES (325, 43, 2, '2023-10-10 13:58:00.822619');
INSERT INTO public.capability_history VALUES (326, 44, 2, '2023-10-10 13:58:00.832804');
INSERT INTO public.capability_history VALUES (327, 45, 1, '2023-10-10 13:58:00.834304');
INSERT INTO public.capability_history VALUES (328, 46, 2, '2023-10-10 13:58:00.835615');
INSERT INTO public.capability_history VALUES (329, 37, 2, '2023-10-10 13:58:00.836882');
INSERT INTO public.capability_history VALUES (330, 38, 2, '2023-10-10 13:58:00.838246');
INSERT INTO public.capability_history VALUES (331, 35, 2, '2023-10-10 13:58:00.839449');
INSERT INTO public.capability_history VALUES (332, 36, 2, '2023-10-10 13:58:00.840784');
INSERT INTO public.capability_history VALUES (333, 11, 2, '2023-10-10 13:58:00.842069');
INSERT INTO public.capability_history VALUES (334, 13, 2, '2023-10-10 13:58:00.843298');
INSERT INTO public.capability_history VALUES (335, 52, 2, '2023-10-10 13:58:00.844528');
INSERT INTO public.capability_history VALUES (336, 53, 2, '2023-10-10 13:58:00.845617');
INSERT INTO public.capability_history VALUES (337, 54, 2, '2023-10-10 13:58:00.8469');
INSERT INTO public.capability_history VALUES (338, 47, 2, '2023-10-10 13:58:00.848059');
INSERT INTO public.capability_history VALUES (339, 48, 2, '2023-10-10 13:58:00.849327');
INSERT INTO public.capability_history VALUES (340, 49, 2, '2023-10-10 13:58:00.85054');
INSERT INTO public.capability_history VALUES (341, 50, 1, '2023-10-10 13:58:00.851786');
INSERT INTO public.capability_history VALUES (342, 51, 2, '2023-10-10 13:58:00.852918');
INSERT INTO public.capability_history VALUES (343, 2, 2, '2023-10-10 13:58:00.854212');
INSERT INTO public.capability_history VALUES (344, 3, 2, '2023-10-10 13:58:00.85562');
INSERT INTO public.capability_history VALUES (345, 4, 2, '2023-10-10 13:58:00.856952');
INSERT INTO public.capability_history VALUES (346, 10, 2, '2023-10-10 13:58:00.85817');
INSERT INTO public.capability_history VALUES (347, 55, 2, '2023-10-10 13:58:00.859452');
INSERT INTO public.capability_history VALUES (348, 56, 2, '2023-10-10 13:58:00.860616');
INSERT INTO public.capability_history VALUES (349, 57, 2, '2023-10-10 13:58:00.86187');
INSERT INTO public.capability_history VALUES (350, 34, 2, '2023-10-10 13:58:00.863036');
INSERT INTO public.capability_history VALUES (351, 31, 2, '2023-10-10 13:58:00.864256');
INSERT INTO public.capability_history VALUES (352, 32, 2, '2023-10-10 13:58:00.865448');
INSERT INTO public.capability_history VALUES (353, 33, 2, '2023-10-10 13:58:00.866623');
INSERT INTO public.capability_history VALUES (354, 9, 2, '2023-10-10 13:58:00.867909');
INSERT INTO public.capability_history VALUES (355, 8, 2, '2023-10-10 13:58:00.869397');
INSERT INTO public.capability_history VALUES (356, 1, 2, '2023-10-10 13:58:00.870779');
INSERT INTO public.capability_history VALUES (357, 5, 2, '2023-10-10 13:58:00.872042');
INSERT INTO public.capability_history VALUES (358, 14, 1, '2023-10-10 13:58:00.87352');
INSERT INTO public.capability_history VALUES (359, 7, 2, '2023-10-10 13:58:00.874736');
INSERT INTO public.capability_history VALUES (360, 6, 2, '2023-10-10 13:58:00.875971');
INSERT INTO public.capability_history VALUES (361, 17, 2, '2023-10-10 13:58:00.877168');
INSERT INTO public.capability_history VALUES (362, 18, 2, '2023-10-10 13:58:00.8784');
INSERT INTO public.capability_history VALUES (363, 30, 2, '2023-10-10 13:58:00.879618');
INSERT INTO public.capability_history VALUES (364, 39, 2, '2023-10-10 13:58:00.880866');
INSERT INTO public.capability_history VALUES (365, 40, 1, '2023-10-10 13:58:00.882064');
INSERT INTO public.capability_history VALUES (366, 41, 2, '2023-10-10 13:58:00.883257');
INSERT INTO public.capability_history VALUES (367, 42, 2, '2023-10-10 13:58:00.884608');
INSERT INTO public.capability_history VALUES (368, 43, 1, '2023-10-10 14:32:34.660615');
INSERT INTO public.capability_history VALUES (369, 44, 2, '2023-10-10 14:32:34.660615');
INSERT INTO public.capability_history VALUES (370, 45, 1, '2023-10-10 14:32:34.660615');
INSERT INTO public.capability_history VALUES (371, 46, 2, '2023-10-10 14:32:34.660615');
INSERT INTO public.capability_history VALUES (372, 37, 2, '2023-10-10 14:32:34.660615');
INSERT INTO public.capability_history VALUES (373, 38, 2, '2023-10-10 14:32:34.660615');
INSERT INTO public.capability_history VALUES (374, 35, 2, '2023-10-10 14:32:34.660615');
INSERT INTO public.capability_history VALUES (375, 36, 2, '2023-10-10 14:32:34.660615');
INSERT INTO public.capability_history VALUES (376, 11, 2, '2023-10-10 14:32:34.660615');
INSERT INTO public.capability_history VALUES (377, 13, 2, '2023-10-10 14:32:34.660615');
INSERT INTO public.capability_history VALUES (378, 52, 2, '2023-10-10 14:32:34.660615');
INSERT INTO public.capability_history VALUES (379, 53, 2, '2023-10-10 14:32:34.660615');
INSERT INTO public.capability_history VALUES (380, 54, 2, '2023-10-10 14:32:34.660615');
INSERT INTO public.capability_history VALUES (381, 47, 2, '2023-10-10 14:32:34.660615');
INSERT INTO public.capability_history VALUES (382, 48, 2, '2023-10-10 14:32:34.660615');
INSERT INTO public.capability_history VALUES (383, 49, 2, '2023-10-10 14:32:34.660615');
INSERT INTO public.capability_history VALUES (384, 50, 1, '2023-10-10 14:32:34.660615');
INSERT INTO public.capability_history VALUES (385, 51, 2, '2023-10-10 14:32:34.660615');
INSERT INTO public.capability_history VALUES (386, 2, 2, '2023-10-10 14:32:34.660615');
INSERT INTO public.capability_history VALUES (387, 3, 2, '2023-10-10 14:32:34.660615');
INSERT INTO public.capability_history VALUES (388, 4, 2, '2023-10-10 14:32:34.660615');
INSERT INTO public.capability_history VALUES (389, 10, 2, '2023-10-10 14:32:34.660615');
INSERT INTO public.capability_history VALUES (390, 55, 2, '2023-10-10 14:32:34.660615');
INSERT INTO public.capability_history VALUES (391, 56, 2, '2023-10-10 14:32:34.660615');
INSERT INTO public.capability_history VALUES (392, 57, 2, '2023-10-10 14:32:34.660615');
INSERT INTO public.capability_history VALUES (393, 34, 2, '2023-10-10 14:32:34.660615');
INSERT INTO public.capability_history VALUES (394, 31, 2, '2023-10-10 14:32:34.660615');
INSERT INTO public.capability_history VALUES (395, 32, 2, '2023-10-10 14:32:34.660615');
INSERT INTO public.capability_history VALUES (396, 33, 2, '2023-10-10 14:32:34.660615');
INSERT INTO public.capability_history VALUES (397, 9, 2, '2023-10-10 14:32:34.660615');
INSERT INTO public.capability_history VALUES (398, 8, 2, '2023-10-10 14:32:34.660615');
INSERT INTO public.capability_history VALUES (399, 1, 2, '2023-10-10 14:32:34.660615');
INSERT INTO public.capability_history VALUES (400, 5, 2, '2023-10-10 14:32:34.660615');
INSERT INTO public.capability_history VALUES (401, 14, 1, '2023-10-10 14:32:34.660615');
INSERT INTO public.capability_history VALUES (402, 7, 2, '2023-10-10 14:32:34.660615');
INSERT INTO public.capability_history VALUES (403, 6, 2, '2023-10-10 14:32:34.660615');
INSERT INTO public.capability_history VALUES (404, 17, 2, '2023-10-10 14:32:34.660615');
INSERT INTO public.capability_history VALUES (405, 18, 2, '2023-10-10 14:32:34.660615');
INSERT INTO public.capability_history VALUES (406, 30, 2, '2023-10-10 14:32:34.660615');
INSERT INTO public.capability_history VALUES (407, 39, 2, '2023-10-10 14:32:34.660615');
INSERT INTO public.capability_history VALUES (408, 40, 1, '2023-10-10 14:32:34.660615');
INSERT INTO public.capability_history VALUES (409, 41, 2, '2023-10-10 14:32:34.660615');
INSERT INTO public.capability_history VALUES (410, 42, 2, '2023-10-10 14:32:34.660615');
INSERT INTO public.capability_history VALUES (411, 43, 2, '2023-10-10 14:32:48.247288');
INSERT INTO public.capability_history VALUES (412, 44, 2, '2023-10-10 14:32:48.247288');
INSERT INTO public.capability_history VALUES (413, 45, 1, '2023-10-10 14:32:48.247288');
INSERT INTO public.capability_history VALUES (414, 46, 2, '2023-10-10 14:32:48.247288');
INSERT INTO public.capability_history VALUES (415, 37, 2, '2023-10-10 14:32:48.247288');
INSERT INTO public.capability_history VALUES (416, 38, 2, '2023-10-10 14:32:48.247288');
INSERT INTO public.capability_history VALUES (417, 35, 2, '2023-10-10 14:32:48.247288');
INSERT INTO public.capability_history VALUES (418, 36, 2, '2023-10-10 14:32:48.247288');
INSERT INTO public.capability_history VALUES (419, 11, 2, '2023-10-10 14:32:48.247288');
INSERT INTO public.capability_history VALUES (420, 13, 2, '2023-10-10 14:32:48.247288');
INSERT INTO public.capability_history VALUES (421, 52, 2, '2023-10-10 14:32:48.247288');
INSERT INTO public.capability_history VALUES (422, 53, 2, '2023-10-10 14:32:48.247288');
INSERT INTO public.capability_history VALUES (423, 54, 2, '2023-10-10 14:32:48.247288');
INSERT INTO public.capability_history VALUES (424, 47, 2, '2023-10-10 14:32:48.247288');
INSERT INTO public.capability_history VALUES (425, 48, 2, '2023-10-10 14:32:48.247288');
INSERT INTO public.capability_history VALUES (426, 49, 2, '2023-10-10 14:32:48.247288');
INSERT INTO public.capability_history VALUES (427, 50, 1, '2023-10-10 14:32:48.247288');
INSERT INTO public.capability_history VALUES (428, 51, 2, '2023-10-10 14:32:48.247288');
INSERT INTO public.capability_history VALUES (429, 2, 2, '2023-10-10 14:32:48.247288');
INSERT INTO public.capability_history VALUES (430, 3, 2, '2023-10-10 14:32:48.247288');
INSERT INTO public.capability_history VALUES (431, 4, 2, '2023-10-10 14:32:48.247288');
INSERT INTO public.capability_history VALUES (432, 10, 2, '2023-10-10 14:32:48.247288');
INSERT INTO public.capability_history VALUES (433, 55, 2, '2023-10-10 14:32:48.247288');
INSERT INTO public.capability_history VALUES (434, 56, 2, '2023-10-10 14:32:48.247288');
INSERT INTO public.capability_history VALUES (435, 57, 2, '2023-10-10 14:32:48.247288');
INSERT INTO public.capability_history VALUES (436, 34, 2, '2023-10-10 14:32:48.247288');
INSERT INTO public.capability_history VALUES (437, 31, 2, '2023-10-10 14:32:48.247288');
INSERT INTO public.capability_history VALUES (438, 32, 2, '2023-10-10 14:32:48.247288');
INSERT INTO public.capability_history VALUES (439, 33, 2, '2023-10-10 14:32:48.247288');
INSERT INTO public.capability_history VALUES (440, 9, 2, '2023-10-10 14:32:48.247288');
INSERT INTO public.capability_history VALUES (441, 8, 2, '2023-10-10 14:32:48.247288');
INSERT INTO public.capability_history VALUES (442, 1, 2, '2023-10-10 14:32:48.247288');
INSERT INTO public.capability_history VALUES (443, 5, 2, '2023-10-10 14:32:48.247288');
INSERT INTO public.capability_history VALUES (444, 14, 1, '2023-10-10 14:32:48.247288');
INSERT INTO public.capability_history VALUES (445, 7, 2, '2023-10-10 14:32:48.247288');
INSERT INTO public.capability_history VALUES (446, 6, 2, '2023-10-10 14:32:48.247288');
INSERT INTO public.capability_history VALUES (447, 17, 2, '2023-10-10 14:32:48.247288');
INSERT INTO public.capability_history VALUES (448, 18, 2, '2023-10-10 14:32:48.247288');
INSERT INTO public.capability_history VALUES (449, 30, 2, '2023-10-10 14:32:48.247288');
INSERT INTO public.capability_history VALUES (450, 39, 2, '2023-10-10 14:32:48.247288');
INSERT INTO public.capability_history VALUES (451, 40, 1, '2023-10-10 14:32:48.247288');
INSERT INTO public.capability_history VALUES (452, 41, 2, '2023-10-10 14:32:48.247288');
INSERT INTO public.capability_history VALUES (453, 42, 2, '2023-10-10 14:32:48.247288');
INSERT INTO public.capability_history VALUES (454, 3, 2, '2023-10-12 12:47:48.171419');
INSERT INTO public.capability_history VALUES (455, 60, 1, '2023-10-12 12:55:20.064861');
INSERT INTO public.capability_history VALUES (456, 59, 1, '2023-10-12 12:55:20.064861');
INSERT INTO public.capability_history VALUES (457, 61, 1, '2023-10-12 12:55:20.064861');
INSERT INTO public.capability_history VALUES (458, 43, 2, '2023-10-12 12:55:20.064861');
INSERT INTO public.capability_history VALUES (459, 44, 2, '2023-10-12 12:55:20.064861');
INSERT INTO public.capability_history VALUES (460, 45, 1, '2023-10-12 12:55:20.064861');
INSERT INTO public.capability_history VALUES (461, 46, 2, '2023-10-12 12:55:20.064861');
INSERT INTO public.capability_history VALUES (462, 37, 2, '2023-10-12 12:55:20.064861');
INSERT INTO public.capability_history VALUES (463, 38, 2, '2023-10-12 12:55:20.064861');
INSERT INTO public.capability_history VALUES (464, 35, 2, '2023-10-12 12:55:20.064861');
INSERT INTO public.capability_history VALUES (465, 36, 2, '2023-10-12 12:55:20.064861');
INSERT INTO public.capability_history VALUES (466, 52, 2, '2023-10-12 12:55:20.064861');
INSERT INTO public.capability_history VALUES (467, 53, 2, '2023-10-12 12:55:20.064861');
INSERT INTO public.capability_history VALUES (468, 54, 2, '2023-10-12 12:55:20.064861');
INSERT INTO public.capability_history VALUES (469, 47, 2, '2023-10-12 12:55:20.064861');
INSERT INTO public.capability_history VALUES (470, 48, 2, '2023-10-12 12:55:20.064861');
INSERT INTO public.capability_history VALUES (471, 49, 2, '2023-10-12 12:55:20.064861');
INSERT INTO public.capability_history VALUES (472, 50, 1, '2023-10-12 12:55:20.064861');
INSERT INTO public.capability_history VALUES (473, 51, 2, '2023-10-12 12:55:20.064861');
INSERT INTO public.capability_history VALUES (474, 2, 2, '2023-10-12 12:55:20.064861');
INSERT INTO public.capability_history VALUES (475, 3, 2, '2023-10-12 12:55:20.064861');
INSERT INTO public.capability_history VALUES (476, 10, 2, '2023-10-12 12:55:20.064861');
INSERT INTO public.capability_history VALUES (477, 55, 2, '2023-10-12 12:55:20.064861');
INSERT INTO public.capability_history VALUES (478, 56, 2, '2023-10-12 12:55:20.064861');
INSERT INTO public.capability_history VALUES (479, 57, 2, '2023-10-12 12:55:20.064861');
INSERT INTO public.capability_history VALUES (480, 34, 2, '2023-10-12 12:55:20.064861');
INSERT INTO public.capability_history VALUES (481, 31, 1, '2023-10-12 12:55:20.064861');
INSERT INTO public.capability_history VALUES (482, 32, 1, '2023-10-12 12:55:20.064861');
INSERT INTO public.capability_history VALUES (483, 33, 1, '2023-10-12 12:55:20.064861');
INSERT INTO public.capability_history VALUES (484, 9, 2, '2023-10-12 12:55:20.064861');
INSERT INTO public.capability_history VALUES (485, 8, 2, '2023-10-12 12:55:20.064861');
INSERT INTO public.capability_history VALUES (486, 1, 2, '2023-10-12 12:55:20.064861');
INSERT INTO public.capability_history VALUES (487, 62, 1, '2023-10-12 12:55:20.064861');
INSERT INTO public.capability_history VALUES (488, 63, 1, '2023-10-12 12:55:20.064861');
INSERT INTO public.capability_history VALUES (489, 64, 1, '2023-10-12 12:55:20.064861');
INSERT INTO public.capability_history VALUES (490, 39, 2, '2023-10-12 12:55:20.064861');
INSERT INTO public.capability_history VALUES (491, 40, 1, '2023-10-12 12:55:20.064861');
INSERT INTO public.capability_history VALUES (492, 41, 2, '2023-10-12 12:55:20.064861');
INSERT INTO public.capability_history VALUES (493, 42, 2, '2023-10-12 12:55:20.064861');
INSERT INTO public.capability_history VALUES (494, 65, 1, '2023-10-12 12:55:20.064861');
INSERT INTO public.capability_history VALUES (495, 67, 1, '2023-10-12 12:55:20.064861');
INSERT INTO public.capability_history VALUES (496, 68, 1, '2023-10-12 12:55:20.064861');
INSERT INTO public.capability_history VALUES (497, 60, 1, '2023-10-12 12:56:37.642947');
INSERT INTO public.capability_history VALUES (498, 59, 1, '2023-10-12 12:56:37.642947');
INSERT INTO public.capability_history VALUES (499, 61, 1, '2023-10-12 12:56:37.642947');
INSERT INTO public.capability_history VALUES (500, 43, 2, '2023-10-12 12:56:37.642947');
INSERT INTO public.capability_history VALUES (501, 44, 2, '2023-10-12 12:56:37.642947');
INSERT INTO public.capability_history VALUES (502, 45, 1, '2023-10-12 12:56:37.642947');
INSERT INTO public.capability_history VALUES (503, 46, 2, '2023-10-12 12:56:37.642947');
INSERT INTO public.capability_history VALUES (504, 37, 2, '2023-10-12 12:56:37.642947');
INSERT INTO public.capability_history VALUES (505, 38, 2, '2023-10-12 12:56:37.642947');
INSERT INTO public.capability_history VALUES (506, 35, 2, '2023-10-12 12:56:37.642947');
INSERT INTO public.capability_history VALUES (507, 36, 2, '2023-10-12 12:56:37.642947');
INSERT INTO public.capability_history VALUES (508, 52, 2, '2023-10-12 12:56:37.642947');
INSERT INTO public.capability_history VALUES (509, 53, 2, '2023-10-12 12:56:37.642947');
INSERT INTO public.capability_history VALUES (510, 54, 2, '2023-10-12 12:56:37.642947');
INSERT INTO public.capability_history VALUES (511, 47, 2, '2023-10-12 12:56:37.642947');
INSERT INTO public.capability_history VALUES (512, 48, 2, '2023-10-12 12:56:37.642947');
INSERT INTO public.capability_history VALUES (513, 49, 2, '2023-10-12 12:56:37.642947');
INSERT INTO public.capability_history VALUES (514, 50, 1, '2023-10-12 12:56:37.642947');
INSERT INTO public.capability_history VALUES (515, 51, 2, '2023-10-12 12:56:37.642947');
INSERT INTO public.capability_history VALUES (516, 2, 2, '2023-10-12 12:56:37.642947');
INSERT INTO public.capability_history VALUES (517, 3, 2, '2023-10-12 12:56:37.642947');
INSERT INTO public.capability_history VALUES (518, 10, 2, '2023-10-12 12:56:37.642947');
INSERT INTO public.capability_history VALUES (519, 55, 2, '2023-10-12 12:56:37.642947');
INSERT INTO public.capability_history VALUES (520, 56, 2, '2023-10-12 12:56:37.642947');
INSERT INTO public.capability_history VALUES (521, 57, 2, '2023-10-12 12:56:37.642947');
INSERT INTO public.capability_history VALUES (522, 34, 2, '2023-10-12 12:56:37.642947');
INSERT INTO public.capability_history VALUES (523, 31, 1, '2023-10-12 12:56:37.642947');
INSERT INTO public.capability_history VALUES (524, 32, 1, '2023-10-12 12:56:37.642947');
INSERT INTO public.capability_history VALUES (525, 33, 1, '2023-10-12 12:56:37.642947');
INSERT INTO public.capability_history VALUES (526, 9, 2, '2023-10-12 12:56:37.642947');
INSERT INTO public.capability_history VALUES (527, 8, 2, '2023-10-12 12:56:37.642947');
INSERT INTO public.capability_history VALUES (528, 1, 2, '2023-10-12 12:56:37.642947');
INSERT INTO public.capability_history VALUES (529, 62, 1, '2023-10-12 12:56:37.642947');
INSERT INTO public.capability_history VALUES (530, 63, 1, '2023-10-12 12:56:37.642947');
INSERT INTO public.capability_history VALUES (531, 64, 1, '2023-10-12 12:56:37.642947');
INSERT INTO public.capability_history VALUES (532, 39, 2, '2023-10-12 12:56:37.642947');
INSERT INTO public.capability_history VALUES (533, 40, 1, '2023-10-12 12:56:37.642947');
INSERT INTO public.capability_history VALUES (534, 41, 2, '2023-10-12 12:56:37.642947');
INSERT INTO public.capability_history VALUES (535, 42, 2, '2023-10-12 12:56:37.642947');
INSERT INTO public.capability_history VALUES (536, 65, 2, '2023-10-12 12:56:37.642947');
INSERT INTO public.capability_history VALUES (537, 67, 1, '2023-10-12 12:56:37.642947');
INSERT INTO public.capability_history VALUES (538, 68, 1, '2023-10-12 12:56:37.642947');
INSERT INTO public.capability_history VALUES (539, 60, 1, '2023-10-12 12:56:48.581563');
INSERT INTO public.capability_history VALUES (540, 59, 1, '2023-10-12 12:56:48.581563');
INSERT INTO public.capability_history VALUES (541, 61, 1, '2023-10-12 12:56:48.581563');
INSERT INTO public.capability_history VALUES (542, 43, 2, '2023-10-12 12:56:48.581563');
INSERT INTO public.capability_history VALUES (543, 44, 2, '2023-10-12 12:56:48.581563');
INSERT INTO public.capability_history VALUES (544, 45, 1, '2023-10-12 12:56:48.581563');
INSERT INTO public.capability_history VALUES (545, 46, 2, '2023-10-12 12:56:48.581563');
INSERT INTO public.capability_history VALUES (546, 37, 2, '2023-10-12 12:56:48.581563');
INSERT INTO public.capability_history VALUES (547, 38, 2, '2023-10-12 12:56:48.581563');
INSERT INTO public.capability_history VALUES (548, 35, 2, '2023-10-12 12:56:48.581563');
INSERT INTO public.capability_history VALUES (549, 36, 2, '2023-10-12 12:56:48.581563');
INSERT INTO public.capability_history VALUES (550, 52, 2, '2023-10-12 12:56:48.581563');
INSERT INTO public.capability_history VALUES (551, 53, 2, '2023-10-12 12:56:48.581563');
INSERT INTO public.capability_history VALUES (552, 54, 2, '2023-10-12 12:56:48.581563');
INSERT INTO public.capability_history VALUES (553, 47, 2, '2023-10-12 12:56:48.581563');
INSERT INTO public.capability_history VALUES (554, 48, 2, '2023-10-12 12:56:48.581563');
INSERT INTO public.capability_history VALUES (555, 49, 2, '2023-10-12 12:56:48.581563');
INSERT INTO public.capability_history VALUES (556, 50, 1, '2023-10-12 12:56:48.581563');
INSERT INTO public.capability_history VALUES (557, 51, 2, '2023-10-12 12:56:48.581563');
INSERT INTO public.capability_history VALUES (558, 2, 2, '2023-10-12 12:56:48.581563');
INSERT INTO public.capability_history VALUES (559, 3, 2, '2023-10-12 12:56:48.581563');
INSERT INTO public.capability_history VALUES (560, 10, 2, '2023-10-12 12:56:48.581563');
INSERT INTO public.capability_history VALUES (561, 55, 2, '2023-10-12 12:56:48.581563');
INSERT INTO public.capability_history VALUES (562, 56, 2, '2023-10-12 12:56:48.581563');
INSERT INTO public.capability_history VALUES (563, 57, 2, '2023-10-12 12:56:48.581563');
INSERT INTO public.capability_history VALUES (564, 34, 2, '2023-10-12 12:56:48.581563');
INSERT INTO public.capability_history VALUES (565, 31, 1, '2023-10-12 12:56:48.581563');
INSERT INTO public.capability_history VALUES (566, 32, 1, '2023-10-12 12:56:48.581563');
INSERT INTO public.capability_history VALUES (567, 33, 1, '2023-10-12 12:56:48.581563');
INSERT INTO public.capability_history VALUES (568, 9, 2, '2023-10-12 12:56:48.581563');
INSERT INTO public.capability_history VALUES (569, 8, 2, '2023-10-12 12:56:48.581563');
INSERT INTO public.capability_history VALUES (570, 1, 2, '2023-10-12 12:56:48.581563');
INSERT INTO public.capability_history VALUES (571, 62, 1, '2023-10-12 12:56:48.581563');
INSERT INTO public.capability_history VALUES (572, 63, 1, '2023-10-12 12:56:48.581563');
INSERT INTO public.capability_history VALUES (573, 64, 1, '2023-10-12 12:56:48.581563');
INSERT INTO public.capability_history VALUES (574, 39, 2, '2023-10-12 12:56:48.581563');
INSERT INTO public.capability_history VALUES (575, 40, 1, '2023-10-12 12:56:48.581563');
INSERT INTO public.capability_history VALUES (576, 41, 2, '2023-10-12 12:56:48.581563');
INSERT INTO public.capability_history VALUES (577, 42, 2, '2023-10-12 12:56:48.581563');
INSERT INTO public.capability_history VALUES (578, 65, 2, '2023-10-12 12:56:48.581563');
INSERT INTO public.capability_history VALUES (579, 67, 2, '2023-10-12 12:56:48.581563');
INSERT INTO public.capability_history VALUES (580, 68, 2, '2023-10-12 12:56:48.581563');
INSERT INTO public.capability_history VALUES (581, 9, 2, '2023-10-14 12:53:22.169737');
INSERT INTO public.capability_history VALUES (582, 8, 2, '2023-10-14 12:53:22.169737');
INSERT INTO public.capability_history VALUES (583, 1, 2, '2023-10-14 12:53:22.169737');
INSERT INTO public.capability_history VALUES (584, 2, 2, '2023-10-14 12:53:22.169737');
INSERT INTO public.capability_history VALUES (585, 3, 2, '2023-10-14 12:53:22.169737');
INSERT INTO public.capability_history VALUES (586, 10, 2, '2023-10-14 12:53:22.169737');
INSERT INTO public.capability_history VALUES (587, 60, 1, '2023-10-14 12:53:22.169737');
INSERT INTO public.capability_history VALUES (588, 59, 1, '2023-10-14 12:53:22.169737');
INSERT INTO public.capability_history VALUES (589, 61, 1, '2023-10-14 12:53:22.169737');
INSERT INTO public.capability_history VALUES (590, 62, 1, '2023-10-14 12:53:22.169737');
INSERT INTO public.capability_history VALUES (591, 63, 1, '2023-10-14 12:53:22.169737');
INSERT INTO public.capability_history VALUES (592, 64, 1, '2023-10-14 12:53:22.169737');
INSERT INTO public.capability_history VALUES (593, 65, 2, '2023-10-14 12:53:22.169737');
INSERT INTO public.capability_history VALUES (594, 67, 1, '2023-10-14 12:53:22.169737');
INSERT INTO public.capability_history VALUES (595, 68, 2, '2023-10-14 12:53:22.169737');
INSERT INTO public.capability_history VALUES (596, 55, 2, '2023-10-14 12:53:38.826925');
INSERT INTO public.capability_history VALUES (597, 56, 2, '2023-10-14 12:53:38.826925');
INSERT INTO public.capability_history VALUES (598, 57, 2, '2023-10-14 12:53:38.826925');
INSERT INTO public.capability_history VALUES (599, 34, 2, '2023-10-14 12:53:38.826925');
INSERT INTO public.capability_history VALUES (600, 43, 2, '2023-10-14 12:53:38.826925');
INSERT INTO public.capability_history VALUES (601, 44, 2, '2023-10-14 12:53:38.826925');
INSERT INTO public.capability_history VALUES (602, 45, 2, '2023-10-14 12:53:38.826925');
INSERT INTO public.capability_history VALUES (603, 46, 2, '2023-10-14 12:53:38.826925');
INSERT INTO public.capability_history VALUES (604, 37, 2, '2023-10-14 12:53:38.826925');
INSERT INTO public.capability_history VALUES (605, 38, 2, '2023-10-14 12:53:38.826925');
INSERT INTO public.capability_history VALUES (606, 35, 2, '2023-10-14 12:53:38.826925');
INSERT INTO public.capability_history VALUES (607, 36, 2, '2023-10-14 12:53:38.826925');
INSERT INTO public.capability_history VALUES (608, 47, 2, '2023-10-14 12:53:38.826925');
INSERT INTO public.capability_history VALUES (609, 48, 2, '2023-10-14 12:53:38.826925');
INSERT INTO public.capability_history VALUES (610, 49, 2, '2023-10-14 12:53:38.826925');
INSERT INTO public.capability_history VALUES (611, 50, 1, '2023-10-14 12:53:38.826925');
INSERT INTO public.capability_history VALUES (612, 51, 2, '2023-10-14 12:53:38.826925');
INSERT INTO public.capability_history VALUES (613, 39, 2, '2023-10-14 12:53:38.826925');
INSERT INTO public.capability_history VALUES (614, 40, 1, '2023-10-14 12:53:38.826925');
INSERT INTO public.capability_history VALUES (615, 41, 2, '2023-10-14 12:53:38.826925');
INSERT INTO public.capability_history VALUES (616, 42, 2, '2023-10-14 12:53:38.826925');
INSERT INTO public.capability_history VALUES (617, 31, 1, '2023-10-14 12:53:38.826925');
INSERT INTO public.capability_history VALUES (618, 32, 1, '2023-10-14 12:53:38.826925');
INSERT INTO public.capability_history VALUES (619, 33, 1, '2023-10-14 12:53:38.826925');
INSERT INTO public.capability_history VALUES (620, 52, 2, '2023-10-14 12:53:38.826925');
INSERT INTO public.capability_history VALUES (621, 53, 2, '2023-10-14 12:53:38.826925');
INSERT INTO public.capability_history VALUES (622, 54, 2, '2023-10-14 12:53:38.826925');
INSERT INTO public.capability_history VALUES (623, 9, 2, '2023-10-14 13:10:46.647242');
INSERT INTO public.capability_history VALUES (624, 8, 2, '2023-10-14 13:10:46.647242');
INSERT INTO public.capability_history VALUES (625, 1, 2, '2023-10-14 13:10:46.647242');
INSERT INTO public.capability_history VALUES (626, 2, 2, '2023-10-14 13:10:46.647242');
INSERT INTO public.capability_history VALUES (627, 3, 2, '2023-10-14 13:10:46.647242');
INSERT INTO public.capability_history VALUES (628, 10, 2, '2023-10-14 13:10:46.647242');
INSERT INTO public.capability_history VALUES (629, 60, 1, '2023-10-14 13:10:46.647242');
INSERT INTO public.capability_history VALUES (630, 59, 1, '2023-10-14 13:10:46.647242');
INSERT INTO public.capability_history VALUES (631, 61, 1, '2023-10-14 13:10:46.647242');
INSERT INTO public.capability_history VALUES (632, 62, 2, '2023-10-14 13:10:46.647242');
INSERT INTO public.capability_history VALUES (633, 63, 2, '2023-10-14 13:10:46.647242');
INSERT INTO public.capability_history VALUES (634, 64, 2, '2023-10-14 13:10:46.647242');
INSERT INTO public.capability_history VALUES (635, 65, 2, '2023-10-14 13:10:46.647242');
INSERT INTO public.capability_history VALUES (636, 67, 1, '2023-10-14 13:10:46.647242');
INSERT INTO public.capability_history VALUES (637, 68, 2, '2023-10-14 13:10:46.647242');
INSERT INTO public.capability_history VALUES (638, 60, 1, '2023-10-14 15:36:04.737933');
INSERT INTO public.capability_history VALUES (639, 59, 1, '2023-10-14 15:36:04.737933');
INSERT INTO public.capability_history VALUES (640, 61, 1, '2023-10-14 15:36:04.737933');
INSERT INTO public.capability_history VALUES (641, 65, 2, '2023-10-14 15:36:04.737933');
INSERT INTO public.capability_history VALUES (642, 67, 2, '2023-10-14 15:36:04.737933');
INSERT INTO public.capability_history VALUES (643, 68, 2, '2023-10-14 15:36:04.737933');
INSERT INTO public.capability_history VALUES (644, 52, 1, '2023-10-16 08:49:00.399324');
INSERT INTO public.capability_history VALUES (645, 53, 2, '2023-10-16 08:49:00.399324');
INSERT INTO public.capability_history VALUES (646, 54, 2, '2023-10-16 08:49:00.399324');
INSERT INTO public.capability_history VALUES (647, 9, 2, '2023-10-16 08:49:00.399324');
INSERT INTO public.capability_history VALUES (648, 8, 2, '2023-10-16 08:49:00.399324');
INSERT INTO public.capability_history VALUES (649, 1, 2, '2023-10-16 08:49:00.399324');
INSERT INTO public.capability_history VALUES (650, 65, 2, '2023-10-16 08:49:00.399324');
INSERT INTO public.capability_history VALUES (651, 67, 2, '2023-10-16 08:49:00.399324');
INSERT INTO public.capability_history VALUES (652, 68, 2, '2023-10-16 08:49:00.399324');
INSERT INTO public.capability_history VALUES (653, 9, 2, '2023-10-20 13:27:41.084104');
INSERT INTO public.capability_history VALUES (654, 8, 2, '2023-10-20 13:27:41.084104');
INSERT INTO public.capability_history VALUES (655, 1, 2, '2023-10-20 13:27:41.084104');
INSERT INTO public.capability_history VALUES (656, 2, 1, '2023-10-20 13:27:41.084104');
INSERT INTO public.capability_history VALUES (657, 3, 2, '2023-10-20 13:27:41.084104');
INSERT INTO public.capability_history VALUES (658, 10, 2, '2023-10-20 13:27:41.084104');
INSERT INTO public.capability_history VALUES (659, 60, 1, '2023-10-20 13:27:41.084104');
INSERT INTO public.capability_history VALUES (660, 59, 1, '2023-10-20 13:27:41.084104');
INSERT INTO public.capability_history VALUES (661, 61, 1, '2023-10-20 13:27:41.084104');
INSERT INTO public.capability_history VALUES (662, 62, 2, '2023-10-20 13:27:41.084104');
INSERT INTO public.capability_history VALUES (663, 63, 2, '2023-10-20 13:27:41.084104');
INSERT INTO public.capability_history VALUES (664, 64, 2, '2023-10-20 13:27:41.084104');
INSERT INTO public.capability_history VALUES (665, 65, 2, '2023-10-20 13:27:41.084104');
INSERT INTO public.capability_history VALUES (666, 67, 2, '2023-10-20 13:27:41.084104');
INSERT INTO public.capability_history VALUES (667, 68, 2, '2023-10-20 13:27:41.084104');
INSERT INTO public.capability_history VALUES (668, 9, 2, '2023-10-20 13:33:52.790618');
INSERT INTO public.capability_history VALUES (669, 8, 2, '2023-10-20 13:33:52.790618');
INSERT INTO public.capability_history VALUES (670, 1, 2, '2023-10-20 13:33:52.790618');
INSERT INTO public.capability_history VALUES (671, 2, 2, '2023-10-20 13:33:52.790618');
INSERT INTO public.capability_history VALUES (672, 3, 2, '2023-10-20 13:33:52.790618');
INSERT INTO public.capability_history VALUES (673, 10, 2, '2023-10-20 13:33:52.790618');
INSERT INTO public.capability_history VALUES (674, 60, 1, '2023-10-20 13:33:52.790618');
INSERT INTO public.capability_history VALUES (675, 59, 1, '2023-10-20 13:33:52.790618');
INSERT INTO public.capability_history VALUES (676, 61, 1, '2023-10-20 13:33:52.790618');
INSERT INTO public.capability_history VALUES (677, 62, 2, '2023-10-20 13:33:52.790618');
INSERT INTO public.capability_history VALUES (678, 63, 2, '2023-10-20 13:33:52.790618');
INSERT INTO public.capability_history VALUES (679, 64, 2, '2023-10-20 13:33:52.790618');
INSERT INTO public.capability_history VALUES (680, 65, 2, '2023-10-20 13:33:52.790618');
INSERT INTO public.capability_history VALUES (681, 67, 2, '2023-10-20 13:33:52.790618');
INSERT INTO public.capability_history VALUES (682, 68, 2, '2023-10-20 13:33:52.790618');
INSERT INTO public.capability_history VALUES (683, 9, 2, '2023-10-27 09:17:34.758617');
INSERT INTO public.capability_history VALUES (684, 8, 2, '2023-10-27 09:17:34.758617');
INSERT INTO public.capability_history VALUES (685, 1, 2, '2023-10-27 09:17:34.758617');
INSERT INTO public.capability_history VALUES (686, 2, 2, '2023-10-27 09:17:34.758617');
INSERT INTO public.capability_history VALUES (687, 3, 2, '2023-10-27 09:17:34.758617');
INSERT INTO public.capability_history VALUES (688, 10, 2, '2023-10-27 09:17:34.758617');
INSERT INTO public.capability_history VALUES (689, 60, 2, '2023-10-27 09:17:34.758617');
INSERT INTO public.capability_history VALUES (690, 59, 1, '2023-10-27 09:17:34.758617');
INSERT INTO public.capability_history VALUES (691, 61, 1, '2023-10-27 09:17:34.758617');
INSERT INTO public.capability_history VALUES (692, 62, 2, '2023-10-27 09:17:34.758617');
INSERT INTO public.capability_history VALUES (693, 63, 2, '2023-10-27 09:17:34.758617');
INSERT INTO public.capability_history VALUES (694, 64, 2, '2023-10-27 09:17:34.758617');
INSERT INTO public.capability_history VALUES (695, 65, 2, '2023-10-27 09:17:34.758617');
INSERT INTO public.capability_history VALUES (696, 67, 2, '2023-10-27 09:17:34.758617');
INSERT INTO public.capability_history VALUES (697, 68, 2, '2023-10-27 09:17:34.758617');
INSERT INTO public.capability_history VALUES (698, 9, 1, '2024-04-05 07:33:14.842502');
INSERT INTO public.capability_history VALUES (699, 8, 2, '2024-04-05 07:33:14.842502');
INSERT INTO public.capability_history VALUES (700, 1, 2, '2024-04-05 07:33:14.842502');
INSERT INTO public.capability_history VALUES (701, 2, 2, '2024-04-05 07:33:14.842502');
INSERT INTO public.capability_history VALUES (702, 3, 2, '2024-04-05 07:33:14.842502');
INSERT INTO public.capability_history VALUES (703, 10, 2, '2024-04-05 07:33:14.842502');
INSERT INTO public.capability_history VALUES (704, 60, 2, '2024-04-05 07:33:14.842502');
INSERT INTO public.capability_history VALUES (705, 59, 1, '2024-04-05 07:33:14.842502');
INSERT INTO public.capability_history VALUES (706, 61, 1, '2024-04-05 07:33:14.842502');
INSERT INTO public.capability_history VALUES (707, 62, 2, '2024-04-05 07:33:14.842502');
INSERT INTO public.capability_history VALUES (708, 63, 2, '2024-04-05 07:33:14.842502');
INSERT INTO public.capability_history VALUES (709, 64, 2, '2024-04-05 07:33:14.842502');
INSERT INTO public.capability_history VALUES (710, 65, 2, '2024-04-05 07:33:14.842502');
INSERT INTO public.capability_history VALUES (711, 67, 2, '2024-04-05 07:33:14.842502');
INSERT INTO public.capability_history VALUES (712, 68, 2, '2024-04-05 07:33:14.842502');
INSERT INTO public.capability_history VALUES (713, 9, 2, '2024-04-05 07:33:21.748678');
INSERT INTO public.capability_history VALUES (714, 8, 2, '2024-04-05 07:33:21.748678');
INSERT INTO public.capability_history VALUES (715, 1, 2, '2024-04-05 07:33:21.748678');
INSERT INTO public.capability_history VALUES (716, 2, 2, '2024-04-05 07:33:21.748678');
INSERT INTO public.capability_history VALUES (717, 3, 2, '2024-04-05 07:33:21.748678');
INSERT INTO public.capability_history VALUES (718, 10, 2, '2024-04-05 07:33:21.748678');
INSERT INTO public.capability_history VALUES (719, 60, 2, '2024-04-05 07:33:21.748678');
INSERT INTO public.capability_history VALUES (720, 59, 1, '2024-04-05 07:33:21.748678');
INSERT INTO public.capability_history VALUES (721, 61, 1, '2024-04-05 07:33:21.748678');
INSERT INTO public.capability_history VALUES (722, 62, 2, '2024-04-05 07:33:21.748678');
INSERT INTO public.capability_history VALUES (723, 63, 2, '2024-04-05 07:33:21.748678');
INSERT INTO public.capability_history VALUES (724, 64, 2, '2024-04-05 07:33:21.748678');
INSERT INTO public.capability_history VALUES (725, 65, 2, '2024-04-05 07:33:21.748678');
INSERT INTO public.capability_history VALUES (726, 67, 2, '2024-04-05 07:33:21.748678');
INSERT INTO public.capability_history VALUES (727, 68, 2, '2024-04-05 07:33:21.748678');

>>>>>>> main

--
-- Data for Name: domain; Type: TABLE DATA; Schema: public; Owner: telescope
--

INSERT INTO public.domain VALUES (13, 'Devices', '2023-10-06 14:55:04.836871');
INSERT INTO public.domain VALUES (14, 'Apps & Workloads', '2023-10-06 14:55:22.032712');
INSERT INTO public.domain VALUES (17, 'Identity', '2023-10-06 14:56:00.614473');
INSERT INTO public.domain VALUES (18, 'Cross-Cutting ZTA', '2023-10-06 14:56:13.832703');
INSERT INTO public.domain VALUES (1, 'Infrastructure', '2023-01-05 12:04:58.133484');
INSERT INTO public.domain VALUES (2, 'Data', '2023-01-05 12:04:58.145907');
INSERT INTO public.domain VALUES (3, 'Application', '2023-01-05 12:04:58.147519');
INSERT INTO public.domain VALUES (5, 'Visibility', '2023-01-05 12:04:58.151347');
INSERT INTO public.domain VALUES (4, 'Networks', '2023-01-05 12:04:58.149359');
INSERT INTO public.domain VALUES (16, 'Networks ZTA', '2023-10-06 14:55:48.372071');
INSERT INTO public.domain VALUES (15, 'Data ZTA', '2023-10-06 14:55:35.744453');


--
-- Data for Name: flag; Type: TABLE DATA; Schema: public; Owner: telescope
--

INSERT INTO public.flag VALUES (1, 'red', '2023-01-05 12:06:10.998784');
INSERT INTO public.flag VALUES (2, 'green', '2023-01-05 12:06:17.838214');


--
-- Data for Name: integration_methods; Type: TABLE DATA; Schema: public; Owner: telescope
--

INSERT INTO public.integration_methods VALUES ('telescopeComplianceRhacs', 1);
INSERT INTO public.integration_methods VALUES ('telescopeSecureProtocols', 6);
INSERT INTO public.integration_methods VALUES ('telescopeTestApi', 11);


--
-- Data for Name: integrations; Type: TABLE DATA; Schema: public; Owner: telescope
--

INSERT INTO public.integrations VALUES (6, 8, 'https://central-stackrox.apps.test-env.aws.project-telescope.com/v1/compliance/runresults?standardId=ocp4-cis&clusterId=569a487a-1cdd-4431-8ab3-0528e10b2124', '', '', 'eyJhbGciOiJSUzI1NiIsImtpZCI6Imp3dGswIiwidHlwIjoiSldUIn0.eyJhdWQiOlsiaHR0cHM6Ly9zdGFja3JveC5pby9qd3Qtc291cmNlcyNhcGktdG9rZW5zIl0sImV4cCI6MTcxNTI0NDcyNiwiaWF0IjoxNjgzNzA4NzI2LCJpc3MiOiJodHRwczovL3N0YWNrcm94LmlvL2p3dCIsImp0aSI6ImRlZGQ1OTU0LTI4NTAtNGJlNi04ZmQyLWFmNmZmNWM0OTAzOSIsIm5hbWUiOiJzdGFja3JveC1jaHJpc2oiLCJyb2xlcyI6WyJBZG1pbiJdfQ.WM-7WVofWSvQmHUj6dnw8Ao5AkRbKGCMSFIcil-gJEUt1Zvmx0Ug4q1X_-6zD-Qk-RQ9nZUmbLCWc2YJOYECICaFkwSRrZecT19HOMpK6sed-lK6zvksxtaijP0HXbn_e7GGHzj-n8XzZG15WFtwbkNbwucNH6brl8MXmioQslphNYWvb_MHl-Ix3evV_1IVBfF4q4C_A5u6kXqb-SoCw65AHOBHAU23XCwvsi5PIyB7qYTggLW1ee4j2WxF3_YVSsH-ivA6qRXR_zZu1_tCXYQFZ8Vrrw0FMBYuPYNLlrZ1MDPSUn5misUl-I8PeHMxDeVON3yUAqOEGNjYTXiPkgWh8hlgUo1vdVK-tKokSa5n1b8i6JmjOSgRpA5TGVfRJxLul3TJH9JZn0hBAjMeXsAM6O_fDkWwda-Hg9Mvtk_M9bCp4y8dIZx4A4A4x-sfq2VuGezGM-mX1hlkYIY043BViGc3C2Pw-GO_Yzt-wOeLj37ALivGEN7vG5ozQKa265_jdzPLmGBY5_fsYfJgOKMdZ3KCl7sw0CQ86Gwq2CYb4PfitYPKXqeSwgB_a4mpph5TVvJAk_K81nAzuVkiLrj2FqJrnuwmLkec1MAaGKj4NNwMAs08a6Rl01KPn7KVCCgaGaJWevKNyVn1yo_Zy0VQ3eZFjZRacvUWBS0OPdg', '90', '2023-05-11 08:43:44.649431+01', 'RHACS Compliance Score (Telescope)', 1, 'PX8VK');
INSERT INTO public.integrations VALUES (22, 49, 'https://localhost/alal', 'admin', 'admin', '', 'Yes', NULL, 'CJ Test', NULL, 'EQTVW');


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.profiles VALUES (2, 'ZTA', 'ZTA domains', '{13,14,15,16,17,18}');
INSERT INTO public.profiles VALUES (1, 'Core', 'Default domains', '{1,2,3,4,5}');


--
-- Name: capability_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: telescope
--

SELECT pg_catalog.setval('public.capability_history_id_seq', 727, true);


--
-- Name: capability_id_seq; Type: SEQUENCE SET; Schema: public; Owner: telescope
--

SELECT pg_catalog.setval('public.capability_id_seq', 68, true);


--
-- Name: domain_id_seq; Type: SEQUENCE SET; Schema: public; Owner: telescope
--

SELECT pg_catalog.setval('public.domain_id_seq', 19, true);


--
-- Name: flag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: telescope
--

SELECT pg_catalog.setval('public.flag_id_seq', 2, true);


--
-- Name: integration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: telescope
--

SELECT pg_catalog.setval('public.integration_id_seq', 22, true);


--
-- Name: integration_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: telescope
--

SELECT pg_catalog.setval('public.integration_methods_id_seq', 11, true);


--
-- Name: profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profiles_id_seq', 21, true);


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
-- Name: capability capability_trigger_copy; Type: TRIGGER; Schema: public; Owner: telescope
--

CREATE TRIGGER capability_trigger_copy AFTER UPDATE ON public.capability FOR EACH ROW EXECUTE FUNCTION public.capability_history();


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT ALL ON SCHEMA public TO telescope;


--
-- PostgreSQL database dump complete
--

