--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
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


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: projects; Type: TABLE; Schema: public; Owner: jaredreando
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    title character varying
);


ALTER TABLE public.projects OWNER TO jaredreando;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: jaredreando
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO jaredreando;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jaredreando
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: volunteers; Type: TABLE; Schema: public; Owner: jaredreando
--

CREATE TABLE public.volunteers (
    id integer NOT NULL,
    name character varying,
    projects_id integer
);


ALTER TABLE public.volunteers OWNER TO jaredreando;

--
-- Name: volunteers_id_seq; Type: SEQUENCE; Schema: public; Owner: jaredreando
--

CREATE SEQUENCE public.volunteers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.volunteers_id_seq OWNER TO jaredreando;

--
-- Name: volunteers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jaredreando
--

ALTER SEQUENCE public.volunteers_id_seq OWNED BY public.volunteers.id;


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: jaredreando
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: volunteers id; Type: DEFAULT; Schema: public; Owner: jaredreando
--

ALTER TABLE ONLY public.volunteers ALTER COLUMN id SET DEFAULT nextval('public.volunteers_id_seq'::regclass);


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: jaredreando
--

COPY public.projects (id, title) FROM stdin;
207	Teach the blind to sing
208	Read to the hard of smelling
210	Help old squirrels out of dog mouths
211	Talk suicidal pigeons off bridge ledges
212	Rake the lawn
213	Sell siblings on Craigslist
214	Organize flash mob to flash other flash mobs
215	Find all mismatched shoe pairs at a local Ross
216	Protest rally against caring for causes
217	A thing where everyone brings their favorite fish
\.


--
-- Data for Name: volunteers; Type: TABLE DATA; Schema: public; Owner: jaredreando
--

COPY public.volunteers (id, name, projects_id) FROM stdin;
141	Hampton	211
142	Mandy	215
143	Hufflebottom Jans	217
144	Uncle Ron	213
145	A bird	212
139	Scrope Purvis	207
140	Tess Flaverton	208
146	Toby	210
147	Tickle Rick	214
148	Jekyll Jolly Man Who Does These Sorts of Things	216
149	Wanda	217
\.


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jaredreando
--

SELECT pg_catalog.setval('public.projects_id_seq', 217, true);


--
-- Name: volunteers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jaredreando
--

SELECT pg_catalog.setval('public.volunteers_id_seq', 149, true);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: jaredreando
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: volunteers volunteers_pkey; Type: CONSTRAINT; Schema: public; Owner: jaredreando
--

ALTER TABLE ONLY public.volunteers
    ADD CONSTRAINT volunteers_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

