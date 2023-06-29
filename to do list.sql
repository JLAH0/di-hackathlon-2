--
-- PostgreSQL database cluster dump
--

-- Started on 2023-06-29 21:46:47 +04

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:M08fLVCo5nUnzLio2gxS/w==$ArNd47w3kjNJWAD7wQCDuiDJAC0/y52p11JwR5WJjPg=:uW3G9F8psnkKMvWcEwH6ReZfWY6+1tBfA5l84Fit5yc=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.2

-- Started on 2023-06-29 21:46:47 +04

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

-- Completed on 2023-06-29 21:46:48 +04

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.2

-- Started on 2023-06-29 21:46:48 +04

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
-- TOC entry 2 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 3592 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 16404)
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50)
);


ALTER TABLE public.student OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16403)
-- Name: student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.student_id_seq OWNER TO postgres;

--
-- TOC entry 3593 (class 0 OID 0)
-- Dependencies: 215
-- Name: student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_id_seq OWNED BY public.student.id;


--
-- TOC entry 3440 (class 2604 OID 16407)
-- Name: student id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student ALTER COLUMN id SET DEFAULT nextval('public.student_id_seq'::regclass);


--
-- TOC entry 3586 (class 0 OID 16404)
-- Dependencies: 216
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student (id, first_name, last_name) FROM stdin;
1	Ashley	Sookaye
2	Yvan	Sidien
3	Ashley	Sookaye
4	Yvan	Sidien
5	Ashley	Sookaye
6	Yvan	Sidien
7	Jean Luc	Lahache
8	Jean Luc	Lahache
9	Jean Luc	Lahache
11	Jean Luc	Lahache
12	Jean Luc	Lahache
10	Vincent	Lahache
\.


--
-- TOC entry 3594 (class 0 OID 0)
-- Dependencies: 215
-- Name: student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_id_seq', 12, true);


--
-- TOC entry 3442 (class 2606 OID 16409)
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (id);


-- Completed on 2023-06-29 21:46:48 +04

--
-- PostgreSQL database dump complete
--

--
-- Database "to-do-list" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.2

-- Started on 2023-06-29 21:46:48 +04

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
-- TOC entry 3601 (class 1262 OID 16662)
-- Name: to-do-list; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "to-do-list" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';


ALTER DATABASE "to-do-list" OWNER TO postgres;

\connect -reuse-previous=on "dbname='to-do-list'"

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
-- TOC entry 217 (class 1259 OID 16671)
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.projects OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16670)
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO postgres;

--
-- TOC entry 3602 (class 0 OID 0)
-- Dependencies: 216
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- TOC entry 215 (class 1259 OID 16664)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16663)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3603 (class 0 OID 0)
-- Dependencies: 214
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3445 (class 2604 OID 16674)
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- TOC entry 3444 (class 2604 OID 16667)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3595 (class 0 OID 16671)
-- Dependencies: 217
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects (id, name) FROM stdin;
\.


--
-- TOC entry 3593 (class 0 OID 16664)
-- Dependencies: 215
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, email, password) FROM stdin;
1	JLAH	jlah@oxo.mu	12345678
2	juanlucas	juan@oxo.mu	09876543
3	Thom	thomas@mail.com	12345678
4	yvan	ysdi@oxo.mu	1234567
5	JLAH	jlah@oxo.mu	123456
6	JLOU	jlou@mail.com	123456
7	Gills	Gil@mail.com	123456
8	Sonia	son@mail.com	123456
9	Johndeo	jde@mail.com	123456
\.


--
-- TOC entry 3604 (class 0 OID 0)
-- Dependencies: 216
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projects_id_seq', 1, false);


--
-- TOC entry 3605 (class 0 OID 0)
-- Dependencies: 214
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 9, true);


--
-- TOC entry 3449 (class 2606 OID 16676)
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- TOC entry 3447 (class 2606 OID 16669)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


-- Completed on 2023-06-29 21:46:48 +04

--
-- PostgreSQL database dump complete
--

-- Completed on 2023-06-29 21:46:48 +04

--
-- PostgreSQL database cluster dump complete
--

