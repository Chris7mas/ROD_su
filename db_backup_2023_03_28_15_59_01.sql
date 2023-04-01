--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases
--

DROP DATABASE onlinejudge;




--
-- Drop roles
--

DROP ROLE onlinejudge;


--
-- Roles
--

CREATE ROLE onlinejudge;
ALTER ROLE onlinejudge WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md54827417b344ff91a2f608bbad9b4e488';






--
-- Database creation
--

CREATE DATABASE onlinejudge WITH TEMPLATE = template0 OWNER = onlinejudge;
REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


\connect onlinejudge

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.23
-- Dumped by pg_dump version 10.23

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
-- Name: acm_contest_rank; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.acm_contest_rank (
    id integer NOT NULL,
    submission_number integer NOT NULL,
    accepted_number integer NOT NULL,
    total_time integer NOT NULL,
    submission_info jsonb NOT NULL,
    contest_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.acm_contest_rank OWNER TO onlinejudge;

--
-- Name: acm_contest_rank_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.acm_contest_rank_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acm_contest_rank_id_seq OWNER TO onlinejudge;

--
-- Name: acm_contest_rank_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.acm_contest_rank_id_seq OWNED BY public.acm_contest_rank.id;


--
-- Name: announcement; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.announcement (
    id integer NOT NULL,
    title text NOT NULL,
    content text NOT NULL,
    create_time timestamp with time zone NOT NULL,
    last_update_time timestamp with time zone NOT NULL,
    visible boolean NOT NULL,
    created_by_id integer NOT NULL
);


ALTER TABLE public.announcement OWNER TO onlinejudge;

--
-- Name: announcement_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.announcement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.announcement_id_seq OWNER TO onlinejudge;

--
-- Name: announcement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.announcement_id_seq OWNED BY public.announcement.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO onlinejudge;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO onlinejudge;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO onlinejudge;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO onlinejudge;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO onlinejudge;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO onlinejudge;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: contest; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.contest (
    id integer NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    real_time_rank boolean NOT NULL,
    password text,
    rule_type text NOT NULL,
    start_time timestamp with time zone NOT NULL,
    end_time timestamp with time zone NOT NULL,
    create_time timestamp with time zone NOT NULL,
    last_update_time timestamp with time zone NOT NULL,
    visible boolean NOT NULL,
    created_by_id integer NOT NULL,
    allowed_ip_ranges jsonb NOT NULL
);


ALTER TABLE public.contest OWNER TO onlinejudge;

--
-- Name: contest_announcement; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.contest_announcement (
    id integer NOT NULL,
    title text NOT NULL,
    content text NOT NULL,
    create_time timestamp with time zone NOT NULL,
    contest_id integer NOT NULL,
    created_by_id integer NOT NULL,
    visible boolean NOT NULL
);


ALTER TABLE public.contest_announcement OWNER TO onlinejudge;

--
-- Name: contest_announcement_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.contest_announcement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contest_announcement_id_seq OWNER TO onlinejudge;

--
-- Name: contest_announcement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.contest_announcement_id_seq OWNED BY public.contest_announcement.id;


--
-- Name: contest_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.contest_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contest_id_seq OWNER TO onlinejudge;

--
-- Name: contest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.contest_id_seq OWNED BY public.contest.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO onlinejudge;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO onlinejudge;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_dramatiq_task; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.django_dramatiq_task (
    id uuid NOT NULL,
    status character varying(8) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    message_data bytea NOT NULL
);


ALTER TABLE public.django_dramatiq_task OWNER TO onlinejudge;

--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO onlinejudge;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO onlinejudge;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO onlinejudge;

--
-- Name: judge_server; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.judge_server (
    id integer NOT NULL,
    hostname text NOT NULL,
    ip text,
    judger_version text NOT NULL,
    cpu_core integer NOT NULL,
    memory_usage double precision NOT NULL,
    cpu_usage double precision NOT NULL,
    last_heartbeat timestamp with time zone NOT NULL,
    create_time timestamp with time zone NOT NULL,
    task_number integer NOT NULL,
    service_url text,
    is_disabled boolean NOT NULL
);


ALTER TABLE public.judge_server OWNER TO onlinejudge;

--
-- Name: judge_server_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.judge_server_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.judge_server_id_seq OWNER TO onlinejudge;

--
-- Name: judge_server_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.judge_server_id_seq OWNED BY public.judge_server.id;


--
-- Name: oi_contest_rank; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.oi_contest_rank (
    id integer NOT NULL,
    submission_number integer NOT NULL,
    total_score integer NOT NULL,
    submission_info jsonb NOT NULL,
    contest_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.oi_contest_rank OWNER TO onlinejudge;

--
-- Name: oi_contest_rank_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.oi_contest_rank_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oi_contest_rank_id_seq OWNER TO onlinejudge;

--
-- Name: oi_contest_rank_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.oi_contest_rank_id_seq OWNED BY public.oi_contest_rank.id;


--
-- Name: options_sysoptions; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.options_sysoptions (
    id integer NOT NULL,
    key text NOT NULL,
    value jsonb NOT NULL
);


ALTER TABLE public.options_sysoptions OWNER TO onlinejudge;

--
-- Name: options_sysoptions_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.options_sysoptions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.options_sysoptions_id_seq OWNER TO onlinejudge;

--
-- Name: options_sysoptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.options_sysoptions_id_seq OWNED BY public.options_sysoptions.id;


--
-- Name: problem; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.problem (
    id integer NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    input_description text NOT NULL,
    output_description text NOT NULL,
    samples jsonb NOT NULL,
    test_case_id text NOT NULL,
    test_case_score jsonb NOT NULL,
    hint text,
    languages jsonb NOT NULL,
    template jsonb NOT NULL,
    create_time timestamp with time zone NOT NULL,
    last_update_time timestamp with time zone,
    time_limit integer NOT NULL,
    memory_limit integer NOT NULL,
    spj boolean NOT NULL,
    spj_language text,
    spj_code text,
    spj_version text,
    rule_type text NOT NULL,
    visible boolean NOT NULL,
    difficulty text NOT NULL,
    source text,
    submission_number bigint NOT NULL,
    accepted_number bigint NOT NULL,
    created_by_id integer NOT NULL,
    _id text NOT NULL,
    statistic_info jsonb NOT NULL,
    total_score integer NOT NULL,
    contest_id integer,
    is_public boolean NOT NULL,
    spj_compile_ok boolean NOT NULL,
    io_mode jsonb NOT NULL,
    share_submission boolean NOT NULL
);


ALTER TABLE public.problem OWNER TO onlinejudge;

--
-- Name: problem_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.problem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.problem_id_seq OWNER TO onlinejudge;

--
-- Name: problem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.problem_id_seq OWNED BY public.problem.id;


--
-- Name: problem_tag; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.problem_tag (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.problem_tag OWNER TO onlinejudge;

--
-- Name: problem_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.problem_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.problem_tag_id_seq OWNER TO onlinejudge;

--
-- Name: problem_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.problem_tag_id_seq OWNED BY public.problem_tag.id;


--
-- Name: problem_tags; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.problem_tags (
    id integer NOT NULL,
    problem_id integer NOT NULL,
    problemtag_id integer NOT NULL
);


ALTER TABLE public.problem_tags OWNER TO onlinejudge;

--
-- Name: problem_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.problem_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.problem_tags_id_seq OWNER TO onlinejudge;

--
-- Name: problem_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.problem_tags_id_seq OWNED BY public.problem_tags.id;


--
-- Name: submission; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.submission (
    id text NOT NULL,
    contest_id integer,
    problem_id integer NOT NULL,
    create_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    code text NOT NULL,
    result integer NOT NULL,
    info jsonb NOT NULL,
    language text NOT NULL,
    shared boolean NOT NULL,
    statistic_info jsonb NOT NULL,
    username text NOT NULL,
    ip text
);


ALTER TABLE public.submission OWNER TO onlinejudge;

--
-- Name: user; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    username text NOT NULL,
    email text,
    create_time timestamp with time zone,
    admin_type text NOT NULL,
    reset_password_token text,
    reset_password_token_expire_time timestamp with time zone,
    auth_token text,
    two_factor_auth boolean NOT NULL,
    tfa_token text,
    open_api boolean NOT NULL,
    open_api_appkey text,
    is_disabled boolean NOT NULL,
    problem_permission text NOT NULL,
    session_keys jsonb NOT NULL
);


ALTER TABLE public."user" OWNER TO onlinejudge;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO onlinejudge;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: user_profile; Type: TABLE; Schema: public; Owner: onlinejudge
--

CREATE TABLE public.user_profile (
    id integer NOT NULL,
    acm_problems_status jsonb NOT NULL,
    avatar text NOT NULL,
    blog character varying(200),
    mood text,
    accepted_number integer NOT NULL,
    submission_number integer NOT NULL,
    github text,
    school text,
    major text,
    user_id integer NOT NULL,
    total_score bigint NOT NULL,
    oi_problems_status jsonb NOT NULL,
    real_name text,
    language text
);


ALTER TABLE public.user_profile OWNER TO onlinejudge;

--
-- Name: user_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: onlinejudge
--

CREATE SEQUENCE public.user_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_profile_id_seq OWNER TO onlinejudge;

--
-- Name: user_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: onlinejudge
--

ALTER SEQUENCE public.user_profile_id_seq OWNED BY public.user_profile.id;


--
-- Name: acm_contest_rank id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.acm_contest_rank ALTER COLUMN id SET DEFAULT nextval('public.acm_contest_rank_id_seq'::regclass);


--
-- Name: announcement id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.announcement ALTER COLUMN id SET DEFAULT nextval('public.announcement_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: contest id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.contest ALTER COLUMN id SET DEFAULT nextval('public.contest_id_seq'::regclass);


--
-- Name: contest_announcement id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.contest_announcement ALTER COLUMN id SET DEFAULT nextval('public.contest_announcement_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: judge_server id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.judge_server ALTER COLUMN id SET DEFAULT nextval('public.judge_server_id_seq'::regclass);


--
-- Name: oi_contest_rank id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.oi_contest_rank ALTER COLUMN id SET DEFAULT nextval('public.oi_contest_rank_id_seq'::regclass);


--
-- Name: options_sysoptions id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.options_sysoptions ALTER COLUMN id SET DEFAULT nextval('public.options_sysoptions_id_seq'::regclass);


--
-- Name: problem id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.problem ALTER COLUMN id SET DEFAULT nextval('public.problem_id_seq'::regclass);


--
-- Name: problem_tag id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.problem_tag ALTER COLUMN id SET DEFAULT nextval('public.problem_tag_id_seq'::regclass);


--
-- Name: problem_tags id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.problem_tags ALTER COLUMN id SET DEFAULT nextval('public.problem_tags_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Name: user_profile id; Type: DEFAULT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.user_profile ALTER COLUMN id SET DEFAULT nextval('public.user_profile_id_seq'::regclass);


--
-- Data for Name: acm_contest_rank; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.acm_contest_rank (id, submission_number, accepted_number, total_time, submission_info, contest_id, user_id) FROM stdin;
1	4	2	43692	{"19": {"is_ac": false, "ac_time": 0, "is_first_ac": false, "error_number": 2}, "20": {"is_ac": true, "ac_time": 21876.211687, "checked": true, "is_first_ac": true, "error_number": 0}, "22": {"is_ac": true, "ac_time": 21816.965044, "checked": true, "is_first_ac": true, "error_number": 0}}	1	2
2	1	1	22142	{"20": {"is_ac": true, "ac_time": 22142.28118, "checked": true, "is_first_ac": false, "error_number": 0}}	1	3
\.


--
-- Data for Name: announcement; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.announcement (id, title, content, create_time, last_update_time, visible, created_by_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can view permission	1	view_permission
5	Can add group	2	add_group
6	Can change group	2	change_group
7	Can delete group	2	delete_group
8	Can view group	2	view_group
9	Can add session	3	add_session
10	Can change session	3	change_session
11	Can delete session	3	delete_session
12	Can view session	3	view_session
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add task	5	add_task
18	Can change task	5	change_task
19	Can delete task	5	delete_task
20	Can view task	5	view_task
21	Can add user	6	add_user
22	Can change user	6	change_user
23	Can delete user	6	delete_user
24	Can view user	6	view_user
25	Can add user profile	7	add_userprofile
26	Can change user profile	7	change_userprofile
27	Can delete user profile	7	delete_userprofile
28	Can view user profile	7	view_userprofile
29	Can add announcement	8	add_announcement
30	Can change announcement	8	change_announcement
31	Can delete announcement	8	delete_announcement
32	Can view announcement	8	view_announcement
33	Can add judge server	9	add_judgeserver
34	Can change judge server	9	change_judgeserver
35	Can delete judge server	9	delete_judgeserver
36	Can view judge server	9	view_judgeserver
37	Can add problem	10	add_problem
38	Can change problem	10	change_problem
39	Can delete problem	10	delete_problem
40	Can view problem	10	view_problem
41	Can add problem tag	11	add_problemtag
42	Can change problem tag	11	change_problemtag
43	Can delete problem tag	11	delete_problemtag
44	Can view problem tag	11	view_problemtag
45	Can add acm contest rank	12	add_acmcontestrank
46	Can change acm contest rank	12	change_acmcontestrank
47	Can delete acm contest rank	12	delete_acmcontestrank
48	Can view acm contest rank	12	view_acmcontestrank
49	Can add contest	13	add_contest
50	Can change contest	13	change_contest
51	Can delete contest	13	delete_contest
52	Can view contest	13	view_contest
53	Can add contest announcement	14	add_contestannouncement
54	Can change contest announcement	14	change_contestannouncement
55	Can delete contest announcement	14	delete_contestannouncement
56	Can view contest announcement	14	view_contestannouncement
57	Can add oi contest rank	15	add_oicontestrank
58	Can change oi contest rank	15	change_oicontestrank
59	Can delete oi contest rank	15	delete_oicontestrank
60	Can view oi contest rank	15	view_oicontestrank
61	Can add submission	16	add_submission
62	Can change submission	16	change_submission
63	Can delete submission	16	delete_submission
64	Can view submission	16	view_submission
65	Can add sys options	17	add_sysoptions
66	Can change sys options	17	change_sysoptions
67	Can delete sys options	17	delete_sysoptions
68	Can view sys options	17	view_sysoptions
\.


--
-- Data for Name: contest; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.contest (id, title, description, real_time_rank, password, rule_type, start_time, end_time, create_time, last_update_time, visible, created_by_id, allowed_ip_ranges) FROM stdin;
2	asd	<p>asd</p>	t	asd	ACM	2023-03-27 07:42:46+00	2023-03-27 16:00:00+00	2023-03-27 07:42:51.721713+00	2023-03-27 07:42:58.313971+00	t	2	[]
1	模拟测试	<p>模拟测试1</p>	t	123456	ACM	2023-03-27 05:48:14+00	2023-03-27 16:00:00+00	2023-03-27 05:48:22.732362+00	2023-03-27 11:55:13.830399+00	t	1	[]
\.


--
-- Data for Name: contest_announcement; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.contest_announcement (id, title, content, create_time, contest_id, created_by_id, visible) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	auth	permission
2	auth	group
3	sessions	session
4	contenttypes	contenttype
5	django_dramatiq	task
6	account	user
7	account	userprofile
8	announcement	announcement
9	conf	judgeserver
10	problem	problem
11	problem	problemtag
12	contest	acmcontestrank
13	contest	contest
14	contest	contestannouncement
15	contest	oicontestrank
16	submission	submission
17	options	sysoptions
\.


--
-- Data for Name: django_dramatiq_task; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.django_dramatiq_task (id, status, created_at, updated_at, message_data) FROM stdin;
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	account	0001_initial	2023-03-14 14:30:15.467755+00
2	account	0002_auto_20170209_1028	2023-03-14 14:30:15.845331+00
3	account	0003_userprofile_total_score	2023-03-14 14:30:16.138607+00
4	account	0005_auto_20170830_1154	2023-03-14 14:30:16.408254+00
5	account	0006_user_session_keys	2023-03-14 14:30:16.782325+00
6	account	0008_auto_20171011_1214	2023-03-14 14:30:19.108848+00
7	account	0009_auto_20171125_1514	2023-03-14 14:30:19.180566+00
8	account	0010_auto_20180501_0436	2023-03-14 14:30:19.312088+00
9	account	0011_auto_20180501_0456	2023-03-14 14:30:19.384979+00
10	account	0012_userprofile_language	2023-03-14 14:30:19.462657+00
11	announcement	0001_initial	2023-03-14 14:30:19.686426+00
12	announcement	0002_auto_20171011_1214	2023-03-14 14:30:19.772725+00
13	announcement	0003_auto_20180501_0436	2023-03-14 14:30:19.850254+00
14	contenttypes	0001_initial	2023-03-14 14:30:20.02733+00
15	contenttypes	0002_remove_content_type_name	2023-03-14 14:30:20.104099+00
16	auth	0001_initial	2023-03-14 14:30:20.836452+00
17	auth	0002_alter_permission_name_max_length	2023-03-14 14:30:20.951614+00
18	auth	0003_alter_user_email_max_length	2023-03-14 14:30:21.219622+00
19	auth	0004_alter_user_username_opts	2023-03-14 14:30:21.487106+00
20	auth	0005_alter_user_last_login_null	2023-03-14 14:30:21.939501+00
21	auth	0006_require_contenttypes_0002	2023-03-14 14:30:22.018386+00
22	auth	0007_alter_validators_add_error_messages	2023-03-14 14:30:22.050964+00
23	auth	0008_alter_user_username_max_length	2023-03-14 14:30:22.088292+00
24	auth	0009_alter_user_last_name_max_length	2023-03-14 14:30:22.127239+00
25	conf	0001_initial	2023-03-14 14:30:22.508291+00
26	conf	0002_auto_20171011_1214	2023-03-14 14:30:22.642858+00
27	conf	0003_judgeserver_is_disabled	2023-03-14 14:30:22.784637+00
28	conf	0004_auto_20180501_0436	2023-03-14 14:30:22.914986+00
29	problem	0001_initial	2023-03-14 14:30:23.467297+00
30	contest	0001_initial	2023-03-14 14:30:24.795389+00
31	contest	0002_auto_20170209_0845	2023-03-14 14:30:25.273628+00
32	contest	0003_auto_20170217_0820	2023-03-14 14:30:25.44567+00
33	contest	0004_auto_20170717_1324	2023-03-14 14:30:25.507872+00
34	contest	0005_auto_20170823_0918	2023-03-14 14:30:25.610393+00
35	contest	0006_auto_20171011_1214	2023-03-14 14:30:26.119242+00
36	contest	0007_contestannouncement_visible	2023-03-14 14:30:26.426633+00
37	contest	0008_contest_allowed_ip_ranges	2023-03-14 14:30:26.700831+00
38	contest	0009_auto_20180501_0436	2023-03-14 14:30:26.805516+00
39	contest	0010_auto_20190326_0201	2023-03-14 14:30:26.992477+00
40	django_dramatiq	0001_initial	2023-03-14 14:30:27.158706+00
41	options	0001_initial	2023-03-14 14:30:27.453212+00
42	options	0002_auto_20180501_0436	2023-03-14 14:30:27.534623+00
43	options	0003_migrate_languages_options	2023-03-14 14:30:27.573677+00
44	submission	0001_initial	2023-03-14 14:30:27.951087+00
45	submission	0002_auto_20170509_1203	2023-03-14 14:30:28.028747+00
46	submission	0005_submission_username	2023-03-14 14:30:29.430527+00
47	submission	0006_auto_20170830_1154	2023-03-14 14:30:29.544322+00
48	submission	0007_auto_20170923_1318	2023-03-14 14:30:30.448178+00
49	submission	0008_submission_ip	2023-03-14 14:30:30.534214+00
50	submission	0009_delete_user_output	2023-03-14 14:30:30.600667+00
51	problem	0002_problem__id	2023-03-14 14:30:30.950006+00
52	problem	0003_auto_20170217_0820	2023-03-14 14:30:31.690856+00
53	problem	0004_auto_20170501_0637	2023-03-14 14:30:33.176299+00
54	problem	0005_auto_20170815_1258	2023-03-14 14:30:33.961823+00
55	problem	0006_auto_20170823_0918	2023-03-14 14:30:34.140845+00
56	problem	0008_auto_20170923_1318	2023-03-14 14:30:35.46105+00
57	problem	0009_auto_20171011_1214	2023-03-14 14:30:38.5321+00
58	problem	0010_problem_spj_compile_ok	2023-03-14 14:30:39.009038+00
59	problem	0011_fix_problem_ac_count	2023-03-14 14:30:39.079324+00
60	problem	0012_auto_20180501_0436	2023-03-14 14:30:39.386156+00
61	problem	0013_problem_io_mode	2023-03-14 14:30:39.872106+00
62	problem	0014_problem_share_submission	2023-03-14 14:30:40.321374+00
63	sessions	0001_initial	2023-03-14 14:30:40.616742+00
64	submission	0011_fix_submission_number	2023-03-14 14:30:40.6723+00
65	submission	0012_auto_20180501_0436	2023-03-14 14:30:40.79163+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: judge_server; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.judge_server (id, hostname, ip, judger_version, cpu_core, memory_usage, cpu_usage, last_heartbeat, create_time, task_number, service_url, is_disabled) FROM stdin;
1	dd58053bfee7	172.20.0.2	2.1.1	12	16.3999999999999986	0	2023-03-28 07:59:02.278879+00	2023-03-14 14:30:48.199034+00	0	http://judge-server:8080	f
\.


--
-- Data for Name: oi_contest_rank; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.oi_contest_rank (id, submission_number, total_score, submission_info, contest_id, user_id) FROM stdin;
\.


--
-- Data for Name: options_sysoptions; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.options_sysoptions (id, key, value) FROM stdin;
7	smtp_config	{}
9	throttling	{"ip": {"capacity": 100, "fill_rate": 0.1, "default_capacity": 50}, "user": {"capacity": 20, "fill_rate": 0.03, "default_capacity": 10}}
10	languages	[{"spj": {"config": {"command": "{exe_path} {in_file_path} {user_out_file_path}", "exe_name": "spj-{spj_version}", "seccomp_rule": "c_cpp"}, "compile": {"exe_name": "spj-{spj_version}", "src_name": "spj-{spj_version}.c", "max_memory": 1073741824, "max_cpu_time": 3000, "max_real_time": 10000, "compile_command": "/usr/bin/gcc -DONLINE_JUDGE -O2 -w -fmax-errors=3 -std=c11 {src_path} -lm -o {exe_path}"}}, "name": "C", "config": {"run": {"env": ["LANG=en_US.UTF-8", "LANGUAGE=en_US:en", "LC_ALL=en_US.UTF-8"], "command": "{exe_path}", "seccomp_rule": {"File IO": "c_cpp_file_io", "Standard IO": "c_cpp"}}, "compile": {"exe_name": "main", "src_name": "main.c", "max_memory": 268435456, "max_cpu_time": 3000, "max_real_time": 10000, "compile_command": "/usr/bin/gcc -DONLINE_JUDGE -O2 -w -fmax-errors=3 -std=c11 {src_path} -lm -o {exe_path}"}, "template": "//PREPEND BEGIN\\n#include <stdio.h>\\n//PREPEND END\\n\\n//TEMPLATE BEGIN\\nint add(int a, int b) {\\n  // Please fill this blank\\n  return ___________;\\n}\\n//TEMPLATE END\\n\\n//APPEND BEGIN\\nint main() {\\n  printf(\\"%d\\", add(1, 2));\\n  return 0;\\n}\\n//APPEND END"}, "description": "GCC 9.4", "content_type": "text/x-csrc"}, {"spj": {"config": {"command": "{exe_path} {in_file_path} {user_out_file_path}", "exe_name": "spj-{spj_version}", "seccomp_rule": "c_cpp"}, "compile": {"exe_name": "spj-{spj_version}", "src_name": "spj-{spj_version}.cpp", "max_memory": 1073741824, "max_cpu_time": 10000, "max_real_time": 20000, "compile_command": "/usr/bin/g++ -DONLINE_JUDGE -O2 -w -fmax-errors=3 -std=c++14 {src_path} -lm -o {exe_path}"}}, "name": "C++", "config": {"run": {"env": ["LANG=en_US.UTF-8", "LANGUAGE=en_US:en", "LC_ALL=en_US.UTF-8"], "command": "{exe_path}", "seccomp_rule": {"File IO": "c_cpp_file_io", "Standard IO": "c_cpp"}}, "compile": {"exe_name": "main", "src_name": "main.cpp", "max_memory": 1073741824, "max_cpu_time": 10000, "max_real_time": 20000, "compile_command": "/usr/bin/g++ -DONLINE_JUDGE -O2 -w -fmax-errors=3 -std=c++14 {src_path} -lm -o {exe_path}"}, "template": "//PREPEND BEGIN\\n#include <iostream>\\n//PREPEND END\\n\\n//TEMPLATE BEGIN\\nint add(int a, int b) {\\n  // Please fill this blank\\n  return ___________;\\n}\\n//TEMPLATE END\\n\\n//APPEND BEGIN\\nint main() {\\n  std::cout << add(1, 2);\\n  return 0;\\n}\\n//APPEND END"}, "description": "G++ 9.4", "content_type": "text/x-c++src"}, {"name": "Java", "config": {"run": {"env": ["LANG=en_US.UTF-8", "LANGUAGE=en_US:en", "LC_ALL=en_US.UTF-8"], "command": "/usr/bin/java -cp {exe_dir} -XX:MaxRAM={max_memory}k -Djava.security.manager -Dfile.encoding=UTF-8 -Djava.security.policy==/etc/java_policy -Djava.awt.headless=true Main", "seccomp_rule": null, "memory_limit_check_only": 1}, "compile": {"exe_name": "Main", "src_name": "Main.java", "max_memory": -1, "max_cpu_time": 5000, "max_real_time": 10000, "compile_command": "/usr/bin/javac {src_path} -d {exe_dir} -encoding UTF8"}, "template": "//PREPEND BEGIN\\n//PREPEND END\\n\\n//TEMPLATE BEGIN\\n//TEMPLATE END\\n\\n//APPEND BEGIN\\n//APPEND END"}, "description": "OpenJDK 11", "content_type": "text/x-java"}, {"name": "Python2", "config": {"run": {"env": ["LANG=en_US.UTF-8", "LANGUAGE=en_US:en", "LC_ALL=en_US.UTF-8"], "command": "/usr/bin/python {exe_path}", "seccomp_rule": "general"}, "compile": {"exe_name": "solution.pyc", "src_name": "solution.py", "max_memory": 134217728, "max_cpu_time": 3000, "max_real_time": 10000, "compile_command": "/usr/bin/python -m py_compile {src_path}"}, "template": "//PREPEND BEGIN\\n//PREPEND END\\n\\n//TEMPLATE BEGIN\\n//TEMPLATE END\\n\\n//APPEND BEGIN\\n//APPEND END"}, "description": "Python 2.7", "content_type": "text/x-python"}, {"name": "Python3", "config": {"run": {"env": ["LANG=en_US.UTF-8", "LANGUAGE=en_US:en", "LC_ALL=en_US.UTF-8", "PYTHONIOENCODING=utf-8"], "command": "/usr/bin/python3 {exe_path}", "seccomp_rule": "general"}, "compile": {"exe_name": "__pycache__/solution.cpython-36.pyc", "src_name": "solution.py", "max_memory": 134217728, "max_cpu_time": 3000, "max_real_time": 10000, "compile_command": "/usr/bin/python3 -m py_compile {src_path}"}, "template": "//PREPEND BEGIN\\n//PREPEND END\\n\\n//TEMPLATE BEGIN\\n//TEMPLATE END\\n\\n//APPEND BEGIN\\n//APPEND END"}, "description": "Python 3.6", "content_type": "text/x-python"}, {"name": "Golang", "config": {"run": {"env": ["GODEBUG=madvdontneed=1", "GOMAXPROCS=1", "LANG=en_US.UTF-8", "LANGUAGE=en_US:en", "LC_ALL=en_US.UTF-8"], "command": "{exe_path}", "seccomp_rule": "golang", "memory_limit_check_only": 1}, "compile": {"env": ["GOCACHE=/tmp", "GOPATH=/tmp", "GOMAXPROCS=1", "LANG=en_US.UTF-8", "LANGUAGE=en_US:en", "LC_ALL=en_US.UTF-8"], "exe_name": "main", "src_name": "main.go", "max_memory": 1073741824, "max_cpu_time": 3000, "max_real_time": 5000, "compile_command": "/usr/bin/go build -o {exe_path} {src_path}"}, "template": "//PREPEND BEGIN\\n//PREPEND END\\n\\n//TEMPLATE BEGIN\\n//TEMPLATE END\\n\\n//APPEND BEGIN\\n//APPEND END"}, "description": "Golang 1.17", "content_type": "text/x-go"}, {"name": "JavaScript", "config": {"run": {"env": ["LANG=en_US.UTF-8", "LANGUAGE=en_US:en", "LC_ALL=en_US.UTF-8"], "command": "/usr/bin/node {exe_path}", "seccomp_rule": "node", "memory_limit_check_only": 1}, "compile": {"env": ["LANG=en_US.UTF-8", "LANGUAGE=en_US:en", "LC_ALL=en_US.UTF-8"], "exe_name": "main.js", "src_name": "main.js", "max_memory": 1073741824, "max_cpu_time": 3000, "max_real_time": 5000, "compile_command": "/usr/bin/node --check {src_path}"}, "template": "//PREPEND BEGIN\\n//PREPEND END\\n\\n//TEMPLATE BEGIN\\n//TEMPLATE END\\n\\n//APPEND BEGIN\\n//APPEND END"}, "description": "Node 14", "content_type": "text/javascript"}]
1	website_base_url	"http://127.0.0.1"
2	website_name	"Demo"
3	website_name_shortcut	"oj"
4	website_footer	"pyw"
5	allow_register	true
6	submission_list_show_all	true
8	judge_server_token	"CHANGE_THIS"
\.


--
-- Data for Name: problem; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.problem (id, title, description, input_description, output_description, samples, test_case_id, test_case_score, hint, languages, template, create_time, last_update_time, time_limit, memory_limit, spj, spj_language, spj_code, spj_version, rule_type, visible, difficulty, source, submission_number, accepted_number, created_by_id, _id, statistic_info, total_score, contest_id, is_public, spj_compile_ok, io_mode, share_submission) FROM stdin;
6	Dinner	<p>p { margin-bottom: 0.21cm; }<p style="text-indent: 0.74cm; margin-bottom: 0cm;"><font>Little A is one member of ACM team. He had just won the gold in World Final. To celebrate, he decided to invite all to have one meal. As bowl, knife and other tableware is not enough in the kitchen, Little A goes to take backup tableware in warehouse. \tThere are many boxes in warehouse, one box contains only one thing, and each box is marked by the name of things inside it. For example, if &quot;basketball&quot; is written on the box, which means the box contains only basketball. With these marks, Little A wants to find out the tableware easily. So, the problem for you is to help him, find out all the tableware from all boxes in the warehouse.</font></p></p>	<p>p { margin-bottom: 0.21cm; }<p style="text-indent: 0.74cm; margin-bottom: 0cm;"><font>There are many test cases. Each case contains one line, and one integer N at the first, N indicates that there are N boxes in the warehouse. Then N strings follow, each string is one name written on the box.</font></p></p>	<p>p { margin-bottom: 0.21cm; }<p style="text-indent: 0.74cm; margin-bottom: 0cm;"><font>For each test of the input, output all the name of tableware.</font></p></p>	[{"input": "3 basketball fork chopsticks\\n2 bowl letter", "output": "fork chopsticks\\nbowl"}]	35a4e62bba4706111e600960af2b95fe	[{"score": 0, "input_name": "1.in", "output_name": "1.out"}]	<p>p { margin-bottom: 0.21cm; }<p style="text-indent: 0.74cm; margin-bottom: 0cm;"><font>The tableware only contains: bowl, knife, fork and chopsticks.</font></p></p>	["C", "C++", "Java", "Python2", "Python3", "Golang", "JavaScript"]	{}	2023-03-24 12:54:05.723637+00	\N	1000	32	f	\N	\N		ACM	f	Mid	辽宁省赛2010	0	0	1	fps-201c	{}	0	\N	f	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
8	Time	<p>p { margin-bottom: 0.21cm; }</p><p><font>Digital clock use 4 digits to express time, each digit is described by 3*3 characters (including”|”,”_”and” “).now given the current time, please tell us how can it be expressed by the digital clock.</font></p>	<p>p { margin-bottom: 0.21cm; }</p><p><font>There are several test cases.</font></p><p><font>Each case contains 4 integers in a line, separated by space.</font></p><p><font>Proceed to the end of file.</font></p>	<p>p { margin-bottom: 0.21cm; }</p><p><font>For each test case, output the time expressed by the digital clock such as Sample Output.</font></p>	[{"input": "1 2 5 6\\n2 3 4 2", "output": "    _  _  _ \\n  | _||_ |_ \\n  ||_  _||_|\\n _  _     _ \\n _| _||_| _|\\n|_  _|  ||_ \\n"}]	169cfc102987c1f210ae9ebb52fd4e6f	[{"score": 0, "input_name": "1.in", "output_name": "1.out"}]	<pre><code>The digits showed by the digital clock are as follows:\n   _  _     _  _  _  _  _  _ \n | _| _||_||_ |_   ||_||_|| |\n ||_  _|  | _||_|  ||_| _||_|\n</code></pre>	["C", "C++", "Golang", "Java", "JavaScript", "Python2", "Python3"]	{}	2023-03-24 12:54:05.994327+00	\N	1000	128	f	\N	\N		ACM	t	Mid	辽宁省赛2010	0	0	1	fps-93dc	{}	0	\N	f	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
1	Hello,World	<p>输出 Hello,World</p>	<p>无</p>	<p>Hello,World!</p>	[{"input": "无", "output": "Hello,World!"}]	f7fa362a608b5fd2d1384b145be145dd	[{"score": 100, "input_name": "1.in", "output_name": "1.out"}]		["C", "C++", "Golang", "Java", "JavaScript", "Python2", "Python3"]	{}	2023-03-15 09:36:58.5046+00	\N	1000	256	f	\N	\N	\N	ACM	t	Low		10	5	1	23031501	{"0": 5, "-1": 2, "-2": 3}	0	\N	f	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
10	Intermediary	<p>p { margin-bottom: 0.21cm; }</p><p><font>It is widely known that any two strangers can get to know each other through at most six other people. Now let’s prove this.</font></p><p><font>In the country Intermediary Conducts Personal Communications (ICPC), there are up to n (2&lt;=n&lt;=100) ordinary people conveniently numbered from 0 to n-1. They don’t know each other, or, in other words, they are strangers. The only way they can communicate with each other is through the government, which, in fact, is an intermediary agency. The government consists of up to m (1&lt;=m&lt;=9) employees conveniently numbered from 0 to m-1. Suppose employee z can introduce person x to person y at a cost of d dollars. If this is the first time in a day that employee z introduce one person to another, he will only require d dollars. For the second time, he will require d dollars plus extra e dollars as his tip. For the third time and more, he will require d dollars plus extra f dollars. He is not dared to require any more than that since the strange country is somewhat democratic. And if person x is able to communicate with person t and person t is able to communicate with person y, then person t is always willing to transfer messages from person x to person y, at no charge. Of course, the intermediary fees are all paid by person x. Notice that employee z being able to introduce person x to person y doesn’t mean he can introduce person y to person x.</font></p><p><font>Now person 0 has to send a message to person n-1 in one day. If all employees have just started to work, what is the minimum cost for person 0?</font></p>	<p>p { margin-bottom: 0.21cm; }</p><p><font>For each test case, the first line contains three integers, n, m and q, where q is the number of intermediary relationships and q is at most 10,000. The second line has m integers, each indicating the value e of every employee, in the range [0, 100]. The third line has m integers too, each indicating the value f of every employee, in the range [e, 200]. The next q lines each contains four integers, x, y, z and d, indicating that employee z can introduce person x to person y requiring d dollars, where 1&lt;=d&lt;=200. There is a blank line after each test case.</font></p><p><font>Proceed to the end of file.</font></p>	<p>p { margin-bottom: 0.21cm; }</p><p><font>For each test case, print one integer on a single line, giving the minimum cost. If it is impossible, print -1.</font></p>	[{"input": "3 2 2\\n1 1\\n2 2\\n0 1 0 1\\n1 2 1 2\\n\\n5 1 4\\n1\\n2\\n0 1 0 1\\n1 2 0 1\\n2 3 0 1\\n3 4 0 1", "output": "3\\n9"}]	359e01d03c2956a28fb7cc3d8dfce12d	[{"score": 0, "input_name": "1.in", "output_name": "1.out"}]		["C", "C++", "Golang", "Java", "JavaScript", "Python2", "Python3"]	{}	2023-03-24 12:54:06.079152+00	\N	1000	128	f	\N	\N		ACM	t	Mid	辽宁省赛2010	0	0	1	fps-9c60	{}	0	\N	f	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
14	NEW RDSP MODE I	<p>p { margin-bottom: 0.21cm; }</p><p><font>Little A has became fascinated with the game Dota recently, but he is not a good player. In all the modes, the rdsp Mode is popular on online, in this mode, little A always loses games if he gets strange heroes, because, the heroes are distributed randomly.</font></p><p><font>Little A wants to win the game, so he cracks the code of the rdsp mode with his talent on programming. The following description is about the rdsp mode:</font></p><p><font>There are N heroes in the game, and they all have a unique number between 1 and N. At the beginning of game, all heroes will be sorted by the number in ascending order. So, all heroes form a sequence One.</font></p><p><font>These heroes will be operated by the following stages M times:</font></p><p><font>1.Get out the heroes in odd position of sequence One to form a new sequence Two;</font></p><p><font>2.Let the remaining heroes in even position to form a new sequence Three;</font></p><p><font>3.Add the sequence Two to the back of sequence Three to form a new sequence One.</font></p><p><font>After M times&#039; operation, the X heroes in the front of new sequence One will be chosen to be Little A&#039;s heroes. The problem for you is to tell little A the numbers of his heroes.</font></p>	<p>p { margin-bottom: 0.21cm; }</p><p><font>There are several test cases.</font></p><p><font>Each case contains three integers N (1&lt;=N&lt;1,000,000), M (1&lt;=M&lt;100,000,000), X(1&lt;=X&lt;=20).</font></p><p><font>Proceed to the end of file.</font></p>	<p>p { margin-bottom: 0.21cm; }</p><p><font>For each test case, output X integers indicate the number of heroes. There is a space between two numbers. The output of one test case occupied exactly one line.</font></p>	[{"input": "5 1 2\\n5 2 2", "output": "2 4\\n4 3"}]	4e30c2ac2cc171796e654e12eca9c96f	[{"score": 0, "input_name": "1.in", "output_name": "1.out"}]	<p>h2 { margin-top: 0.05cm; margin-bottom: 0.05cm; color: rgb(0, 0, 0); line-height: 0.78cm; page-break-inside: avoid; }h2.western { font-family: &quot;Times New Roman&quot;,serif; font-size: 14pt; }h2.cjk { font-family: &quot;宋体&quot;,&quot;SimSun&quot;; font-size: 14pt; font-style: normal; }h2.ctl { font-family: &quot;Calibri&quot;,sans-serif; font-size: 16pt; }p { margin-bottom: 0.21cm; }</p><p><font>In case two: N=5,M=2,X=2,the initial sequence One is 1,2,3,4,5.After the first operation, the sequence One is 2,4,1,3,5. After the second operation, the sequence One is 4,3,2,1,5.So,output 4 3.</font></p><h2></h2>	["C", "C++", "Golang", "Java", "JavaScript", "Python2", "Python3"]	{}	2023-03-24 12:54:06.200461+00	\N	1000	128	f	\N	\N		ACM	t	Mid	辽宁省赛2010	0	0	1	fps-aecb	{}	0	\N	f	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
9	SPY	<p>p { margin-bottom: 0.21cm; }</p><p><font><font><font><font>The National Intelligence Council of X Nation receives a piece of credible information that Nation Y will send spies to steal Nation X’s</font></font></font>confidential paper. So the commander of<font><font><font>The National Intelligence Council take measures</font></font></font><font>immediately, he will</font>investigate people who will come into NationX. At the same time, there are two List in the Commander’s hand, one is full of spies that Nation Y will send to Nation X, and the other one is full of spies that Nation X has sent to Nation Y before. There may be some overlaps of the two list. Because the spy may act two roles at the same time, which means that he may be the one that is sent from Nation X to Nation Y, we just call this type a “dual-spy”. So Nation Y may send “dual_spy” back to Nation X, and it is obvious now that it is good for Nation X, because “dual_spy” may bring back NationY’s confidential paper without worrying to be detention by NationY’s frontier<font>So the commander decides to seize those that are sent by NationY, and let the ordinary people and the “dual_spy” in at the same time .So can you decide a list that should be caught by the Commander?</font></font></p><p><font><font>A:the list contains that will come to the NationX’s frontier.</font></font></p><p><font><font>B:the list contains spies that will be sent by Nation Y.</font></font></p><p><font><font>C:the list contains spies that were sent to NationY before.</font></font></p>	<p>p { margin-bottom: 0.21cm; }</p><p><font>There are several test cases.</font></p><p><font>Each test case contains four parts, the first part contains 3 positive integers A, B, C, and A is the number which will come into the frontier. B is the number that will be sent by Nation Y, and C is the number that NationX has sent to NationY before.</font></p><p><font>The second part contains A strings, the name list of that will come into the frontier.</font></p><p><font>The second part contains B strings, the name list of that are sent by NationY.</font></p><p><font>The second part contains C strings, the name list of the “dual_spy”.</font></p><p><font>There will be a blank line after each test case.</font></p><p><font>There won’t be any repetitive names in a single list, if repetitive names appear in two lists, they mean the same people.</font></p>	<p>p { margin-bottom: 0.21cm; }</p><p><font>Output the list that the commander should caught (in the appearance order of the lists B).if no one should be caught, then , you should output “No enemy spy”.</font></p>	[{"input": "8 4 3\\nZhao Qian Sun Li Zhou Wu Zheng Wang\\nZhao Qian Sun Li\\nZhao Zhou Zheng\\n2 2 2\\nZhao Qian\\nZhao Qian\\nZhao Qian\\nQian Sun Li", "output": "Qian Sun Li\\nNo enemy spy"}]	62786dd2e6024ba40b007657164a0685	[{"score": 0, "input_name": "1.in", "output_name": "1.out"}]		["C", "C++", "Golang", "Java", "JavaScript", "Python2", "Python3"]	{}	2023-03-24 12:54:06.017252+00	\N	1000	128	f	\N	\N		ACM	t	Mid	辽宁省赛2010	0	0	1	fps-8963	{}	0	\N	f	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
17	栈	<p>栈是计算机中经典的数据结构，简单的说，栈就是限制在一端进行插入删除操作的线性表。</p><p>栈有两种最重要的操作，即pop（从栈顶弹出一个元素）和push（将一个元素进栈）。</p><p>栈的重要性不言自明，任何一门数据结构的课程都会介绍栈。宁宁同学在复习栈的基本概念时，想到了一个书上没有讲过的问题，而他自己无法给出答案，所以需要你的帮忙。</p><p><img width="569" height="287" src="/public/upload/ujg9nkg52h3s.png" alt="" /></p><p></p><p></p><p>宁宁考虑的是这样一个问题：一个操作数序列，从1，2，一直到n（图示为1到3的情况），栈A的深度大于n。</p><p></p><p>现在可以进行两种操作，</p><p>1.将一个数，从操作数序列的头端移到栈的头端（对应数据结构栈的push操作）</p><p>2.将一个数，从栈的头端移到输出序列的尾端（对应数据结构栈的pop操作）</p><p>使用这两种操作，由一个操作数序列就可以得到一系列的输出序列，下图所示为由1 2 3生成序列2 3 1的过程。（原始状态如上图所示)</p><p><img width="697" height="226" src="/public/upload/9d10wvwv4jq9.png" alt="" /></p><p></p><p>你的程序将对给定的n，计算并输出由操作数序列1，2，…，n经过操作可能得到的输出序列的总数。</p>	<p>输入文件只含一个整数n（1≤n≤18）</p>	<p>输出文件只有一行，即可能输出序列的总数目</p>	[{"input": "3\\n", "output": "5\\n"}]	b0c283f3f79bc6258c9db328a97f0bae	[{"score": 0, "input_name": "1.in", "output_name": "1.out"}, {"score": 0, "input_name": "2.in", "output_name": "2.out"}, {"score": 0, "input_name": "3.in", "output_name": "3.out"}, {"score": 0, "input_name": "4.in", "output_name": "4.out"}, {"score": 0, "input_name": "5.in", "output_name": "5.out"}]		["C", "C++", "Golang", "Java", "JavaScript", "Python2", "Python3"]	{}	2023-03-24 12:54:28.798792+00	\N	1000	128	f	\N	\N		ACM	t	Mid	NOIP2003	0	0	1	fps-a218	{}	0	\N	f	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
18	麦森数	<p>形如2P-1的素数称为麦森数，这时P一定也是个素数。但反过来不一定，即如果P是个素数，2P-1不一定也是素数。到1998年底，人们已找到了37个麦森数。最大的一个是P=3021377，它有909526位。麦森数有许多重要应用，它与完全数密切相关。</p><p>任务：从文件中输入P（1000&lt;P&lt;3100000），计算2P-1的位数和最后500位数字（用十进制高精度数表示）</p>	<p>文件中只包含一个整数P（1000&lt;P&lt;3100000）</p>	<p>第一行：十进制高精度数2P-1的位数。</p><p>第2-11行：十进制高精度数2P-1的最后500位数字。（每行输出50位，共输出10行，不足500位时高位补0）</p><p>不必验证2P-1与P是否为素数。</p>	[{"input": "1279", "output": "386\\n00000000000000000000000000000000000000000000000000\\n00000000000000000000000000000000000000000000000000\\n00000000000000104079321946643990819252403273640855\\n38615262247266704805319112350403608059673360298012\\n23944173232418484242161395428100779138356624832346\\n49081399066056773207629241295093892203457731833496\\n61583550472959420547689811211693677147548478866962\\n50138443826029173234888531116082853841658502825560\\n46662248318909188018470682222031405210266984354887\\n32958028878050869736186900714720710555703168729087\\n"}]	5abaec08d257506b1ccab781a659f282	[{"score": 0, "input_name": "1.in", "output_name": "1.out"}, {"score": 0, "input_name": "2.in", "output_name": "2.out"}, {"score": 0, "input_name": "3.in", "output_name": "3.out"}, {"score": 0, "input_name": "4.in", "output_name": "4.out"}, {"score": 0, "input_name": "5.in", "output_name": "5.out"}, {"score": 0, "input_name": "6.in", "output_name": "6.out"}, {"score": 0, "input_name": "7.in", "output_name": "7.out"}, {"score": 0, "input_name": "8.in", "output_name": "8.out"}, {"score": 0, "input_name": "9.in", "output_name": "9.out"}, {"score": 0, "input_name": "10.in", "output_name": "10.out"}]		["C", "C++", "Golang", "Java", "JavaScript", "Python2", "Python3"]	{}	2023-03-24 12:54:28.907684+00	\N	1000	128	f	\N	\N		ACM	t	Mid	NOIP2003	0	0	1	fps-dc64	{}	0	\N	f	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
16	数字游戏	<p>丁丁最近沉迷于一个数字游戏之中。这个游戏看似简单，但丁丁在研究了许多天之后却发觉原来在简单的规则下想要赢得这个游戏并不那么容易。游戏是这样的，在你面前有一圈整数（一共n个），你要按顺序将其分为m个部分，各部分内的数字相加，相加所得的m个结果对10取模后再相乘，最终得到一个数k。游戏的要求是使你所得的k最大或者最小。</p><p>例如，对于下面这圈数字（n=4，m=2）：</p><p><img width="232" height="200" src="/public/upload/ktoa4m009zt8.png" alt="" /></p><p></p><p>当要求最小值时，((2-1) mod 10)×((4+3) mod 10)=1×7=7，要求最大值时，为((2+4+3) mod 10)×(-1 mod 10)=9×9=81。特别值得注意的是，无论是负数还是正数，对10取模的结果均为非负值。</p><p>丁丁请你编写程序帮他赢得这个游戏</p>	<p>输入文件第一行有两个整数，n（1≤n≤50）和m（1≤m≤9）。以下n行每行有个整数，其绝对值不大于104，按顺序给出圈中的数字，首尾相接。</p>	<p>输出文件有两行，各包含一个非负整数。第一行是你程序得到的最小值，第二行是最大值。</p>	[{"input": "4 2\\n4\\n3\\n-1\\n2\\n", "output": "7\\n81\\n"}]	29478b4036d699c34f5c6e64b9cd5cd4	[{"score": 0, "input_name": "1.in", "output_name": "1.out"}, {"score": 0, "input_name": "2.in", "output_name": "2.out"}, {"score": 0, "input_name": "3.in", "output_name": "3.out"}, {"score": 0, "input_name": "4.in", "output_name": "4.out"}, {"score": 0, "input_name": "5.in", "output_name": "5.out"}]		["C", "C++", "Golang", "Java", "JavaScript", "Python2", "Python3"]	{}	2023-03-24 12:54:28.741616+00	\N	1000	128	f	\N	\N		ACM	t	Mid	NOIP2003	0	0	1	fps-4fe0	{}	0	\N	f	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
11	English Game	<p>p { margin-bottom: 0.21cm; }</p><p><font>This English game is a simple English words connection game.</font></p><p><font>The rules are as follows: there are N English words in a dictionary, and every word has its own weight v. There is a weight if the corresponding word is used. Now there is a target string X. You have to pick some words in the dictionary, and then connect them to form X. At the same time, the sum weight of the words you picked must be the biggest.</font></p>	<p>p { margin-bottom: 0.21cm; }</p><p><font>There are several test cases. For each test, N (1&lt;=n&lt;=1000) and X (the length of x is not bigger than 10000) are given at first. Then N rows follow. Each row contains a word wi (the length is not bigger than 30) and the weight of it. Every word is composed of lowercases. No two words in the dictionary are the same.</font></p>	<p>h2 { margin-top: 0.05cm; margin-bottom: 0.05cm; color: rgb(0, 0, 0); line-height: 0.78cm; page-break-inside: avoid; }h2.western { font-family: &quot;Times New Roman&quot;,serif; font-size: 14pt; }h2.cjk { font-family: &quot;宋体&quot;,&quot;SimSun&quot;; font-size: 14pt; font-style: normal; }h2.ctl { font-family: &quot;Calibri&quot;,sans-serif; font-size: 16pt; }p { margin-bottom: 0.21cm; }</p><p><font>For each test case, output the biggest sum weight, if you could not form the string X, output -1.</font></p><h2></h2>	[{"input": "1 aaaa\\na 2\\n3 aaa\\na 2\\naa 5\\naaa 6\\n4 abc\\na 1\\nbc 2\\nab 4\\nc 1\\n3 abcd\\nab 10\\nbc 20\\ncd 30\\n3 abcd\\ncd 100\\nabc 1000\\nbcd 10000", "output": "8\\n7\\n5\\n40\\n-1"}]	8aaa1b50cba3669d604d70cfffc4ec96	[{"score": 0, "input_name": "1.in", "output_name": "1.out"}]		["C", "C++", "Golang", "Java", "JavaScript", "Python2", "Python3"]	{}	2023-03-24 12:54:06.115708+00	\N	1000	128	f	\N	\N		ACM	t	Mid	辽宁省赛2010	0	0	1	fps-2902	{}	0	\N	f	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
13	Happiness Hotel	<p>p { margin-bottom: 0.21cm; }</p><p><font><font>The life of Little A is good, and, he managed to get enough money to run a hotel. The best for him is that he need not go to work outside, just wait for the money to go into his pocket. Little A wants everything to be perfect, he has a wonderful plan that he will keep one most beautiful reception whose size is 1()(which means the reception is 1 square meter). There are other k rooms that have the same area, and the area is x^2(), x is an integer; Little A wants his hotel to be a square. Little A is a good thinker, but not a good maker. As his poor performance on math, he cannot calculate the least area needed to build such a hotel of his will. Now, this task belongs to you, solve this problem to make Little A’s dream of Happy Hotel come true. Please be careful, the whole area should only contain k rooms, and the reception, there should not be any vacant place.</font></font></p>	<p>p { margin-bottom: 0.21cm; }</p><p><font>There are several test cases.</font></p><p><font>Each case contains only one integer k(1&lt;=k&lt;=1000) ,the number of rooms the hotel should have in one line.</font></p><p><font>Proceed to the end of file.</font></p>	<p>p { margin-bottom: 0.21cm; }</p><p><font><font>Output one integer d, means the hotel’s area is d^2(If there is no answer, output “no solution”)</font>.The output of one test case occupied exactly one line.</font></p>	[{"input": "1\\n2\\n3", "output": "no solution\\n3\\n2"}]	c4b07c381e0662ab54b34352d073cfae	[{"score": 0, "input_name": "1.in", "output_name": "1.out"}]		["C", "C++", "Golang", "Java", "JavaScript", "Python2", "Python3"]	{}	2023-03-24 12:54:06.170051+00	\N	1000	128	f	\N	\N		ACM	t	Mid	辽宁省赛2010	0	0	1	fps-9d63	{}	0	\N	f	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
12	Friends number	<p>p { margin-bottom: 0.21cm; }</p><p><font>Paula and Tai are couple. There are many stories between them. The day Paula left by airplane, Tai send one message to telephone 2200284, then, everything is changing… (The story in “the snow queen”).</font></p><p><font>After a long time, Tai tells Paula, the number 220 and 284 is a couple of friends number, as they are special, all divisors of 220’s sum is 284, and all divisors of 284’s sum is 220. Can you find out there are how many couples of friends number less than 10,000. Then, how about 100,000, 200,000 and so on.</font></p><p><font>The task for you is to find out there are how many couples of friends number in given closed interval [a,b]</font>。</p>	<p>p { margin-bottom: 0.21cm; }</p><p><font>There are several cases.</font></p><p><font>Each test case contains two positive integers a, b(1&lt;= a &lt;= b &lt;=5,000,000).</font></p><p><font>Proceed to the end of file.</font></p>	<p>p { margin-bottom: 0.21cm; }</p><p><font>For each test case, output the number of couples in the given range. The output of one test case occupied exactly one line.</font></p>	[{"input": "1 100\\n1 1000", "output": "0\\n1"}]	b7d224ff70e240bc6a92f2a31bb7d9af	[{"score": 0, "input_name": "1.in", "output_name": "1.out"}]	<p>p { margin-bottom: 0.21cm; }</p><p><font>6 is a number whose sum of all divisors is 6. 6 is not a friend number, these number is called Perfect Number.</font></p>	["C", "C++", "Golang", "Java", "JavaScript", "Python2", "Python3"]	{}	2023-03-24 12:54:06.139092+00	\N	1000	128	f	\N	\N		ACM	t	Mid	辽宁省赛2010	0	0	1	fps-6eb0	{}	0	\N	f	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
7	You are my brother	<p>h2 { margin-top: 0.05cm; margin-bottom: 0.05cm; color: rgb(0, 0, 0); line-height: 0.78cm; page-break-inside: avoid; }h2.western { font-family: &quot;Times New Roman&quot;,serif; font-size: 14pt; }h2.cjk { font-family: &quot;宋体&quot;,&quot;SimSun&quot;; font-size: 14pt; font-style: normal; }h2.ctl { font-family: &quot;Calibri&quot;,sans-serif; font-size: 16pt; }p { margin-bottom: 0.21cm; }</p><p><font>Little A gets to know a new friend, Little B, recently. One day, they realize that they are family 500 years ago. Now, Little A wants to know whether Little B is his elder, younger or brother.</font></p><h2></h2>	<p>p { margin-bottom: 0.21cm; }</p><p><font>There are multiple test cases.</font></p><p><font>For each test case, the first line has a single integer, n (n&lt;=1000). The next n lines have two integers a and b (1&lt;=a,b&lt;=2000) each, indicating b is the father of a. One person has exactly one father, of course. Little A is numbered 1 and Little B is numbered 2.</font></p><p><font>Proceed to the end of file.</font></p>	<p>h2 { margin-top: 0.05cm; margin-bottom: 0.05cm; color: rgb(0, 0, 0); line-height: 0.78cm; page-break-inside: avoid; }h2.western { font-family: &quot;Times New Roman&quot;,serif; font-size: 14pt; }h2.cjk { font-family: &quot;宋体&quot;,&quot;SimSun&quot;; font-size: 14pt; font-style: normal; }h2.ctl { font-family: &quot;Calibri&quot;,sans-serif; font-size: 16pt; }p { margin-bottom: 0.21cm; }</p><p><font>For each test case, if Little B is Little A’s younger, print “You are my younger”. Otherwise, if Little B is Little A’s elder, print “You are my elder”. Otherwise, print “You are my brother”. The output for each test case occupied exactly one line.</font></p><h2></h2>	[{"input": "5\\n1 3\\n2 4\\n3 5\\n4 6\\n5 6\\n6\\n1 3\\n2 4\\n3 5\\n4 6\\n5 7\\n6 7", "output": "You are my elder\\nYou are my brother"}]	5133b5e387995b04ffebdb98d15c9cec	[{"score": 0, "input_name": "1.in", "output_name": "1.out"}]		["C", "C++", "Golang", "Java", "JavaScript", "Python2", "Python3"]	{}	2023-03-24 12:54:05.974573+00	\N	1000	128	f	\N	\N		ACM	t	Mid	辽宁省赛2010	0	0	1	fps-3094	{}	0	\N	f	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
19	麦森数	<p>形如2P-1的素数称为麦森数，这时P一定也是个素数。但反过来不一定，即如果P是个素数，2P-1不一定也是素数。到1998年底，人们已找到了37个麦森数。最大的一个是P=3021377，它有909526位。麦森数有许多重要应用，它与完全数密切相关。</p><p>任务：从文件中输入P（1000&lt;P&lt;3100000），计算2P-1的位数和最后500位数字（用十进制高精度数表示）</p>	<p>文件中只包含一个整数P（1000&lt;P&lt;3100000）</p>	<p>第一行：十进制高精度数2P-1的位数。</p><p>第2-11行：十进制高精度数2P-1的最后500位数字。（每行输出50位，共输出10行，不足500位时高位补0）</p><p>不必验证2P-1与P是否为素数。</p>	[{"input": "1279", "output": "386\\n00000000000000000000000000000000000000000000000000\\n00000000000000000000000000000000000000000000000000\\n00000000000000104079321946643990819252403273640855\\n38615262247266704805319112350403608059673360298012\\n23944173232418484242161395428100779138356624832346\\n49081399066056773207629241295093892203457731833496\\n61583550472959420547689811211693677147548478866962\\n50138443826029173234888531116082853841658502825560\\n46662248318909188018470682222031405210266984354887\\n32958028878050869736186900714720710555703168729087\\n"}]	5abaec08d257506b1ccab781a659f282	[{"score": 0, "input_name": "1.in", "output_name": "1.out"}, {"score": 0, "input_name": "2.in", "output_name": "2.out"}, {"score": 0, "input_name": "3.in", "output_name": "3.out"}, {"score": 0, "input_name": "4.in", "output_name": "4.out"}, {"score": 0, "input_name": "5.in", "output_name": "5.out"}, {"score": 0, "input_name": "6.in", "output_name": "6.out"}, {"score": 0, "input_name": "7.in", "output_name": "7.out"}, {"score": 0, "input_name": "8.in", "output_name": "8.out"}, {"score": 0, "input_name": "9.in", "output_name": "9.out"}, {"score": 0, "input_name": "10.in", "output_name": "10.out"}]		["C", "C++", "Golang", "Java", "JavaScript", "Python2", "Python3"]	{}	2023-03-27 05:54:42.09526+00	\N	1000	128	f	\N	\N		ACM	t	Mid	NOIP2003	2	0	1	1	{"4": 1, "-1": 1}	0	1	t	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
15	乒乓球	<p>国际乒联现在主席沙拉拉自从上任以来就立志于推行一系列改革，以推动乒乓球运动在全球的普及。其中11分制改革引起了很大的争议，有一部分球员因为无法适应新规则只能选择退役。华华就是其中一位，他退役之后走上了乒乓球研究工作，意图弄明白11分制和21分制对选手的不同影响。在开展他的研究之前，他首先需要对他多年比赛的统计数据进行一些分析，所以需要你的帮忙。</p><p></p><p></p><p>华华通过以下方式进行分析，首先将比赛每个球的胜负列成一张表，然后分别计算在11分制和21分制下，双方的比赛结果（截至记录末尾）。</p><p>比如现在有这么一份记录，（其中W表示华华获得一分，L表示华华对手获得一分）：</p><p>WWWWWWWWWWWWWWWWWWWWWWLW</p><p>在11分制下，此时比赛的结果是华华第一局11比0获胜，第二局11比0获胜，正在进行第三局，当前比分1比1。而在21分制下，此时比赛结果是华华第一局21比0获胜，正在进行第二局，比分2比1。如果一局比赛刚开始，则此时比分为0比0。</p><p>你的程序就是要对于一系列比赛信息的输入（WL形式），输出正确的结果。</p>	<p>每个输入文件包含若干行字符串（每行至多20个字母），字符串有大写的W、L和E组成。其中E表示比赛信息结束，程序应该忽略E之后的所有内容。</p>	<p>输出由两部分组成，每部分有若干行，每一行对应一局比赛的比分（按比赛信息输入顺序）。其中第一部分是11分制下的结果，第二部分是21分制下的结果，两部分之间由一个空行分隔。</p>	[{"input": "WWWWWWWWWWWWWWWWWWWW\\nWWLWE\\n", "output": "11:0\\n11:0\\n1:1\\n\\n21:0\\n2:1\\n"}]	7d49acf0f649f2e4d307245a548c186c	[{"score": 0, "input_name": "1.in", "output_name": "1.out"}, {"score": 0, "input_name": "2.in", "output_name": "2.out"}, {"score": 0, "input_name": "3.in", "output_name": "3.out"}, {"score": 0, "input_name": "4.in", "output_name": "4.out"}, {"score": 0, "input_name": "5.in", "output_name": "5.out"}, {"score": 0, "input_name": "6.in", "output_name": "6.out"}, {"score": 0, "input_name": "7.in", "output_name": "7.out"}, {"score": 0, "input_name": "8.in", "output_name": "8.out"}, {"score": 0, "input_name": "9.in", "output_name": "9.out"}, {"score": 0, "input_name": "10.in", "output_name": "10.out"}]		["C", "C++", "Golang", "Java", "JavaScript", "Python2", "Python3"]	{}	2023-03-24 12:54:28.686806+00	\N	1000	128	f	\N	\N		ACM	t	Mid	NOIP2003	3	1	1	fps-f318	{"0": 1, "-1": 1, "-2": 1}	0	\N	f	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
20	栈	<p>栈是计算机中经典的数据结构，简单的说，栈就是限制在一端进行插入删除操作的线性表。</p><p>栈有两种最重要的操作，即pop（从栈顶弹出一个元素）和push（将一个元素进栈）。</p><p>栈的重要性不言自明，任何一门数据结构的课程都会介绍栈。宁宁同学在复习栈的基本概念时，想到了一个书上没有讲过的问题，而他自己无法给出答案，所以需要你的帮忙。</p><p><img width="569" height="287" src="/public/upload/ujg9nkg52h3s.png" alt="" /></p><p></p><p></p><p>宁宁考虑的是这样一个问题：一个操作数序列，从1，2，一直到n（图示为1到3的情况），栈A的深度大于n。</p><p></p><p>现在可以进行两种操作，</p><p>1.将一个数，从操作数序列的头端移到栈的头端（对应数据结构栈的push操作）</p><p>2.将一个数，从栈的头端移到输出序列的尾端（对应数据结构栈的pop操作）</p><p>使用这两种操作，由一个操作数序列就可以得到一系列的输出序列，下图所示为由1 2 3生成序列2 3 1的过程。（原始状态如上图所示)</p><p><img width="697" height="226" src="/public/upload/9d10wvwv4jq9.png" alt="" /></p><p></p><p>你的程序将对给定的n，计算并输出由操作数序列1，2，…，n经过操作可能得到的输出序列的总数。</p>	<p>输入文件只含一个整数n（1≤n≤18）</p>	<p>输出文件只有一行，即可能输出序列的总数目</p>	[{"input": "3\\n", "output": "5\\n"}]	b0c283f3f79bc6258c9db328a97f0bae	[{"score": 0, "input_name": "1.in", "output_name": "1.out"}, {"score": 0, "input_name": "2.in", "output_name": "2.out"}, {"score": 0, "input_name": "3.in", "output_name": "3.out"}, {"score": 0, "input_name": "4.in", "output_name": "4.out"}, {"score": 0, "input_name": "5.in", "output_name": "5.out"}]		["C", "C++", "Golang", "Java", "JavaScript", "Python2", "Python3"]	{}	2023-03-27 05:54:44.059813+00	\N	1000	128	f	\N	\N		ACM	t	Mid	NOIP2003	2	2	1	2	{"0": 2}	0	1	t	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
21	数字游戏	<p>丁丁最近沉迷于一个数字游戏之中。这个游戏看似简单，但丁丁在研究了许多天之后却发觉原来在简单的规则下想要赢得这个游戏并不那么容易。游戏是这样的，在你面前有一圈整数（一共n个），你要按顺序将其分为m个部分，各部分内的数字相加，相加所得的m个结果对10取模后再相乘，最终得到一个数k。游戏的要求是使你所得的k最大或者最小。</p><p>例如，对于下面这圈数字（n=4，m=2）：</p><p><img width="232" height="200" src="/public/upload/ktoa4m009zt8.png" alt="" /></p><p></p><p>当要求最小值时，((2-1) mod 10)×((4+3) mod 10)=1×7=7，要求最大值时，为((2+4+3) mod 10)×(-1 mod 10)=9×9=81。特别值得注意的是，无论是负数还是正数，对10取模的结果均为非负值。</p><p>丁丁请你编写程序帮他赢得这个游戏</p>	<p>输入文件第一行有两个整数，n（1≤n≤50）和m（1≤m≤9）。以下n行每行有个整数，其绝对值不大于104，按顺序给出圈中的数字，首尾相接。</p>	<p>输出文件有两行，各包含一个非负整数。第一行是你程序得到的最小值，第二行是最大值。</p>	[{"input": "4 2\\n4\\n3\\n-1\\n2\\n", "output": "7\\n81\\n"}]	29478b4036d699c34f5c6e64b9cd5cd4	[{"score": 0, "input_name": "1.in", "output_name": "1.out"}, {"score": 0, "input_name": "2.in", "output_name": "2.out"}, {"score": 0, "input_name": "3.in", "output_name": "3.out"}, {"score": 0, "input_name": "4.in", "output_name": "4.out"}, {"score": 0, "input_name": "5.in", "output_name": "5.out"}]		["C", "C++", "Golang", "Java", "JavaScript", "Python2", "Python3"]	{}	2023-03-27 05:54:46.226699+00	\N	1000	128	f	\N	\N		ACM	t	Mid	NOIP2003	0	0	1	3	{}	0	1	t	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
23	NEW RDSP MODE I	<p>p { margin-bottom: 0.21cm; }</p><p><font>Little A has became fascinated with the game Dota recently, but he is not a good player. In all the modes, the rdsp Mode is popular on online, in this mode, little A always loses games if he gets strange heroes, because, the heroes are distributed randomly.</font></p><p><font>Little A wants to win the game, so he cracks the code of the rdsp mode with his talent on programming. The following description is about the rdsp mode:</font></p><p><font>There are N heroes in the game, and they all have a unique number between 1 and N. At the beginning of game, all heroes will be sorted by the number in ascending order. So, all heroes form a sequence One.</font></p><p><font>These heroes will be operated by the following stages M times:</font></p><p><font>1.Get out the heroes in odd position of sequence One to form a new sequence Two;</font></p><p><font>2.Let the remaining heroes in even position to form a new sequence Three;</font></p><p><font>3.Add the sequence Two to the back of sequence Three to form a new sequence One.</font></p><p><font>After M times&#039; operation, the X heroes in the front of new sequence One will be chosen to be Little A&#039;s heroes. The problem for you is to tell little A the numbers of his heroes.</font></p>	<p>p { margin-bottom: 0.21cm; }</p><p><font>There are several test cases.</font></p><p><font>Each case contains three integers N (1&lt;=N&lt;1,000,000), M (1&lt;=M&lt;100,000,000), X(1&lt;=X&lt;=20).</font></p><p><font>Proceed to the end of file.</font></p>	<p>p { margin-bottom: 0.21cm; }</p><p><font>For each test case, output X integers indicate the number of heroes. There is a space between two numbers. The output of one test case occupied exactly one line.</font></p>	[{"input": "5 1 2\\n5 2 2", "output": "2 4\\n4 3"}]	4e30c2ac2cc171796e654e12eca9c96f	[{"score": 0, "input_name": "1.in", "output_name": "1.out"}]	<p>h2 { margin-top: 0.05cm; margin-bottom: 0.05cm; color: rgb(0, 0, 0); line-height: 0.78cm; page-break-inside: avoid; }h2.western { font-family: &quot;Times New Roman&quot;,serif; font-size: 14pt; }h2.cjk { font-family: &quot;宋体&quot;,&quot;SimSun&quot;; font-size: 14pt; font-style: normal; }h2.ctl { font-family: &quot;Calibri&quot;,sans-serif; font-size: 16pt; }p { margin-bottom: 0.21cm; }</p><p><font>In case two: N=5,M=2,X=2,the initial sequence One is 1,2,3,4,5.After the first operation, the sequence One is 2,4,1,3,5. After the second operation, the sequence One is 4,3,2,1,5.So,output 4 3.</font></p><h2></h2>	["C", "C++", "Golang", "Java", "JavaScript", "Python2", "Python3"]	{}	2023-03-27 05:54:50.367574+00	\N	1000	128	f	\N	\N		ACM	t	Mid	辽宁省赛2010	0	0	1	5	{}	0	1	t	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
22	乒乓球	<p>国际乒联现在主席沙拉拉自从上任以来就立志于推行一系列改革，以推动乒乓球运动在全球的普及。其中11分制改革引起了很大的争议，有一部分球员因为无法适应新规则只能选择退役。华华就是其中一位，他退役之后走上了乒乓球研究工作，意图弄明白11分制和21分制对选手的不同影响。在开展他的研究之前，他首先需要对他多年比赛的统计数据进行一些分析，所以需要你的帮忙。</p><p></p><p></p><p>华华通过以下方式进行分析，首先将比赛每个球的胜负列成一张表，然后分别计算在11分制和21分制下，双方的比赛结果（截至记录末尾）。</p><p>比如现在有这么一份记录，（其中W表示华华获得一分，L表示华华对手获得一分）：</p><p>WWWWWWWWWWWWWWWWWWWWWWLW</p><p>在11分制下，此时比赛的结果是华华第一局11比0获胜，第二局11比0获胜，正在进行第三局，当前比分1比1。而在21分制下，此时比赛结果是华华第一局21比0获胜，正在进行第二局，比分2比1。如果一局比赛刚开始，则此时比分为0比0。</p><p>你的程序就是要对于一系列比赛信息的输入（WL形式），输出正确的结果。</p>	<p>每个输入文件包含若干行字符串（每行至多20个字母），字符串有大写的W、L和E组成。其中E表示比赛信息结束，程序应该忽略E之后的所有内容。</p>	<p>输出由两部分组成，每部分有若干行，每一行对应一局比赛的比分（按比赛信息输入顺序）。其中第一部分是11分制下的结果，第二部分是21分制下的结果，两部分之间由一个空行分隔。</p>	[{"input": "WWWWWWWWWWWWWWWWWWWW\\nWWLWE\\n", "output": "11:0\\n11:0\\n1:1\\n\\n21:0\\n2:1\\n"}]	7d49acf0f649f2e4d307245a548c186c	[{"score": 0, "input_name": "1.in", "output_name": "1.out"}, {"score": 0, "input_name": "2.in", "output_name": "2.out"}, {"score": 0, "input_name": "3.in", "output_name": "3.out"}, {"score": 0, "input_name": "4.in", "output_name": "4.out"}, {"score": 0, "input_name": "5.in", "output_name": "5.out"}, {"score": 0, "input_name": "6.in", "output_name": "6.out"}, {"score": 0, "input_name": "7.in", "output_name": "7.out"}, {"score": 0, "input_name": "8.in", "output_name": "8.out"}, {"score": 0, "input_name": "9.in", "output_name": "9.out"}, {"score": 0, "input_name": "10.in", "output_name": "10.out"}]		["C", "C++", "Golang", "Java", "JavaScript", "Python2", "Python3"]	{}	2023-03-27 05:54:48.42343+00	\N	1000	128	f	\N	\N		ACM	t	Mid	NOIP2003	1	1	1	4	{"0": 1}	0	1	t	f	{"input": "input.txt", "output": "output.txt", "io_mode": "Standard IO"}	f
\.


--
-- Data for Name: problem_tag; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.problem_tag (id, name) FROM stdin;
1	入门
2	NOIP2003
3	辽宁省赛2010
\.


--
-- Data for Name: problem_tags; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.problem_tags (id, problem_id, problemtag_id) FROM stdin;
1	1	1
6	18	2
8	17	2
11	16	2
14	15	2
17	14	3
20	13	3
22	12	3
25	11	3
28	10	3
30	9	3
32	8	3
34	7	3
35	19	2
36	20	2
37	21	2
38	22	2
39	23	3
\.


--
-- Data for Name: submission; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.submission (id, contest_id, problem_id, create_time, user_id, code, result, info, language, shared, statistic_info, username, ip) FROM stdin;
3b89ced35aed9aed873967f970fb88ad	\N	1	2023-03-15 09:38:37.417489+00	1	print("Hello,World!")	0	{"err": null, "data": [{"error": 0, "memory": 8921088, "output": null, "result": 0, "signal": 0, "cpu_time": 7, "exit_code": 0, "real_time": 48, "test_case": "1", "output_md5": "98f97a791ef1457579a5b7e88a495063"}]}	Python3	f	{"time_cost": 7, "memory_cost": 8921088}	root	172.20.0.1
94118d75e6d4d14979ff98028cbb417b	\N	1	2023-03-15 10:00:56.909563+00	1	print("Hello,World!")	0	{"err": null, "data": [{"error": 0, "memory": 8962048, "output": null, "result": 0, "signal": 0, "cpu_time": 9, "exit_code": 0, "real_time": 37, "test_case": "1", "output_md5": "98f97a791ef1457579a5b7e88a495063"}]}	Python3	f	{"time_cost": 9, "memory_cost": 8962048}	root	172.20.0.1
5987ec23daedb9e686853dfcd6525002	\N	1	2023-03-15 13:12:34.619823+00	1	print("Hello,World!")	0	{"err": null, "data": [{"error": 0, "memory": 8896512, "output": null, "result": 0, "signal": 0, "cpu_time": 20, "exit_code": 0, "real_time": 46, "test_case": "1", "output_md5": "98f97a791ef1457579a5b7e88a495063"}]}	Python3	f	{"time_cost": 20, "memory_cost": 8896512}	root	172.20.0.1
b60ebd73efed7916f16c138b818ef9cf	\N	1	2023-03-15 13:12:48.422662+00	1	print("Hello,World")	-1	{"err": null, "data": [{"error": 0, "memory": 8962048, "output": null, "result": -1, "signal": 0, "cpu_time": 19, "exit_code": 0, "real_time": 43, "test_case": "1", "output_md5": "8edd29822e413ae1620edc483810229e"}]}	Python3	f	{"time_cost": 19, "memory_cost": 8962048}	root	172.20.0.1
d67aa407f2f5b3af82f9d15ab9539a0e	\N	1	2023-03-24 07:03:29.720801+00	1	print	-1	{"err": null, "data": [{"error": 0, "memory": 8884224, "output": null, "result": -1, "signal": 0, "cpu_time": 17, "exit_code": 0, "real_time": 61, "test_case": "1", "output_md5": "d41d8cd98f00b204e9800998ecf8427e"}]}	Python3	f	{"time_cost": 17, "memory_cost": 8884224}	root	172.20.0.1
d98909f40ddcdea722ce03885760a9da	\N	1	2023-03-24 07:12:52.783337+00	1	print("Hello,World!")	0	{"err": null, "data": [{"error": 0, "memory": 8953856, "output": null, "result": 0, "signal": 0, "cpu_time": 19, "exit_code": 0, "real_time": 38, "test_case": "1", "output_md5": "98f97a791ef1457579a5b7e88a495063"}]}	Python3	f	{"time_cost": 19, "memory_cost": 8953856}	root	172.20.0.1
1ce1a4350cb6dfbceb2f4fd029ea1c23	\N	1	2023-03-24 07:32:02.636645+00	1	print("Hello,World!"	-2	{}	Python3	f	{"score": 0, "err_info": "File \\"/judger/run/7e49fadc1c2f40dcb7a1af8c18412c88/solution.py\\", line 1\\n    print(\\"Hello,World!\\"\\n                       ^\\nSyntaxError: unexpected EOF while parsing"}	root	172.20.0.1
184aa5cc476e1881cdd3a679ecb3f0cb	\N	1	2023-03-24 07:32:30.002561+00	1	print("Hello,World!"	-2	{}	Python3	f	{"score": 0, "err_info": "File \\"/judger/run/749979b3a2aa4f7eaab5f5590c50ce9e/solution.py\\", line 1\\n    print(\\"Hello,World!\\"\\n                       ^\\nSyntaxError: unexpected EOF while parsing"}	root	172.20.0.1
df41e906649e41d89f35d0cbf7a352bb	\N	15	2023-03-24 13:01:44.439159+00	1	import java.util.Scanner;\n\npublic class Main{\n    public static void main(String[] args) {\n        Scanner scanner = new Scanner(System.in);\n        //hScore1-11分制小华得分、oScore1-11分制对手得分、hScore2-11分制小华得分、oScore2-21分制度对手得分\n        int hScore1=0,oScore1=0,hScore2=0,oScore2=0;\n        String input=scanner.next();\n        //n-为以后提取input单个字符的索引\n        // ans-分别为11分制度和21分制度的得分比数组（例：ans1[0][0]-11分制度第一局小华最终得分、ans1[0][0]-11分制度第一局对手最终得分）\n        int n=1,ans1[][]=new int[5000][2],ans2[][]=new int[5000][2],a1=0,a2=0;\n\n        //输入\n        while (true){\n            if (input.indexOf('E')!=-1) break;\n            input=input+scanner.next();\n\n        }\n        //单个提取\n        char temp=input.charAt(0);\n        if (temp=='E'){\n            ans1[0][0]=0;ans1[0][1]=0;ans2[0][0]=0;ans2[0][1]=0;\n            a1=1;\n            a2=1;\n        }\n        while (temp!='E'){\n            if (temp=='W'){\n                hScore1+=1;\n                hScore2+=1;\n            }\n            if (temp=='L'){\n                oScore1+=1;\n                oScore2+=1;\n            }\n            if ((hScore1>=11||oScore1>=11)&& Math.abs(hScore1-oScore1)>=2){\n                ans1[a1][0]=hScore1;\n                ans1[a1++][1]=oScore1;\n                hScore1=0;\n                oScore1=0;\n            }\n\n            if ((hScore2>=21||oScore2>=21)&&Math.abs(hScore2-oScore2)>=2){\n                ans2[a2][0]=hScore2;\n                ans2[a2++][1]=oScore2;\n                hScore2=0;\n                oScore2=0;\n            }\n            if (n>input.length()-1||input.charAt(n)=='E') {\n                    ans1[a1][0]=hScore1;\n                    ans1[a1++][1]=oScore1;\n                    ans2[a2][0]=hScore2;\n                    ans2[a2++][1]=oScore2;\n\n                break;\n            }\n            temp=input.charAt(n++);\n\n        }\n\n        for (int i = 0; i < a1; i++) {\n            System.out.println(ans1[i][0]+":"+ans1[i][1]);\n        }\n        System.out.println();\n        for (int j = 0; j < a2; j++) {\n            System.out.println(ans2[j][0]+":"+ans2[j][1]);\n        }\n    }\n}	0	{"err": null, "data": [{"error": 0, "memory": 45940736, "output": null, "result": 0, "signal": 0, "cpu_time": 268, "exit_code": 0, "real_time": 246, "test_case": "0", "output_md5": "44a97f9b03d8c4276b63b6d9f2e6f9c6"}, {"error": 0, "memory": 45195264, "output": null, "result": 0, "signal": 0, "cpu_time": 315, "exit_code": 0, "real_time": 383, "test_case": "1", "output_md5": "b99b049456724f08ccd31f4776b1ce4c"}, {"error": 0, "memory": 47587328, "output": null, "result": 0, "signal": 0, "cpu_time": 329, "exit_code": 0, "real_time": 400, "test_case": "2", "output_md5": "2f3823c34cc9465f8dc2322813b6ea4a"}, {"error": 0, "memory": 50745344, "output": null, "result": 0, "signal": 0, "cpu_time": 671, "exit_code": 0, "real_time": 1282, "test_case": "3", "output_md5": "cca2aec13ca66637f9bc00a9ef594465"}, {"error": 0, "memory": 72540160, "output": null, "result": 0, "signal": 0, "cpu_time": 986, "exit_code": 0, "real_time": 2368, "test_case": "4", "output_md5": "ceed6fdaacf09fa1a66ce112d413f7aa"}, {"error": 0, "memory": 47423488, "output": null, "result": 0, "signal": 0, "cpu_time": 510, "exit_code": 0, "real_time": 697, "test_case": "5", "output_md5": "64b3fd2e4457489759342a772b0426cf"}, {"error": 0, "memory": 47747072, "output": null, "result": 0, "signal": 0, "cpu_time": 461, "exit_code": 0, "real_time": 569, "test_case": "6", "output_md5": "046cb23fc51e8485cd4f14935ec52698"}, {"error": 0, "memory": 48566272, "output": null, "result": 0, "signal": 0, "cpu_time": 429, "exit_code": 0, "real_time": 481, "test_case": "7", "output_md5": "97a26947e50f64d23aaf1c1194156e60"}, {"error": 0, "memory": 45969408, "output": null, "result": 0, "signal": 0, "cpu_time": 389, "exit_code": 0, "real_time": 450, "test_case": "8", "output_md5": "c93e01dba6583e316417c4b1ca12d734"}, {"error": 0, "memory": 47263744, "output": null, "result": 0, "signal": 0, "cpu_time": 237, "exit_code": 0, "real_time": 275, "test_case": "9", "output_md5": "064b8ab807233abf096b1a800bcfe20e"}]}	Java	t	{"time_cost": 986, "memory_cost": 72540160}	root	172.20.0.1
91b034e03cb9ba222474c01108b9cea0	\N	15	2023-03-27 07:31:41.250749+00	2	撒旦发顺丰	-2	{}	C	t	{"score": 0, "err_info": "/judger/run/c2141b913abf4f2b99113060c71d801e/main.c:1:1: error: stray '\\\\346' in program\\n    1 | 撒旦发顺丰\\n      | ^\\n/judger/run/c2141b913abf4f2b99113060c71d801e/main.c:1:2: error: stray '\\\\222' in program\\n    1 | 撒旦发顺丰\\n      |  ^\\n/judger/run/c2141b913abf4f2b99113060c71d801e/main.c:1:3: error: stray '\\\\222' in program\\n    1 | 撒旦发顺丰\\n      |   ^\\ncompilation terminated due to -fmax-errors=3."}	test100pyw	172.20.0.1
a3f8dfc64ff67cbdcc0132089dc28126	\N	1	2023-03-27 07:44:39.071037+00	2	print("Hello,World!")	0	{"err": null, "data": [{"error": 0, "memory": 7151616, "output": null, "result": 0, "signal": 0, "cpu_time": 16, "exit_code": 0, "real_time": 38, "test_case": "1", "output_md5": "98f97a791ef1457579a5b7e88a495063"}]}	Python2	f	{"time_cost": 16, "memory_cost": 7151616}	test100pyw	172.20.0.1
1930956f483c557ff425817029ccf648	\N	15	2023-03-27 07:45:59.041939+00	2	import java.util.Scanner;\n\npublic class Main{\n    public static void main(String[] args) {\n        Scanner scanner = new Scanner(System.in);\n        //hScore1-11分制小华得分、oScore1-11分制对手得分、hScore2-11分制小华得分、oScore2-21分制度对手得分\n        int hScore1=0,oScore1=0,hScore2=0,oScore2=0;\n        String input=scanner.next();\n        //n-为以后提取input单个字符的索引\n        // ans-分别为11分制度和21分制度的得分比数组（例：ans1[0][0]-11分制度第一局小华最终得分、ans1[0][0]-11分制度第一局对手最终得分）\n        int n=1,ans1[][]=new int[5000][2],ans2[][]=new int[5000][2],a1=0,a2=0;\n\n        //输入\n        while (true){\n            if (input.indexOf('E')!=-1) break;\n            input=input+scanner.next();\n\n        }\n        //单个提取\n        char temp=input.charAt(0);\n        if (temp=='E'){\n            ans1[0][0]=0;ans1[0][1]=0;ans2[0][0]=0;ans2[0][1]=0;\n            a1=1;\n            a2=1;\n        }\n        while (temp!='E'){\n            if (temp=='W'){\n                hScore1+=1;\n                hScore2+=1;\n            }\n            if (temp=='L'){\n                oScore1+=1;\n                oScore2+=2;\n            }\n            if ((hScore1>=11||oScore1>=11)&& Math.abs(hScore1-oScore1)>=2){\n                ans1[a1][0]=hScore1;\n                ans1[a1++][1]=oScore1;\n                hScore1=0;\n                oScore1=0;\n            }\n\n            if ((hScore2>=21||oScore2>=21)&&Math.abs(hScore2-oScore2)>=2){\n                ans2[a2][0]=hScore2;\n                ans2[a2++][1]=oScore2;\n                hScore2=0;\n                oScore2=0;\n            }\n            if (n>input.length()-1||input.charAt(n)=='E') {\n                    ans1[a1][0]=hScore1;\n                    ans1[a1++][1]=oScore1;\n                    ans2[a2][0]=hScore2;\n                    ans2[a2++][1]=oScore2;\n\n                break;\n            }\n            temp=input.charAt(n++);\n\n        }\n\n        for (int i = 0; i < a1; i++) {\n            System.out.println(ans1[i][0]+":"+ans1[i][1]);\n        }\n        System.out.println();\n        for (int j = 0; j < a2; j++) {\n            System.out.println(ans2[j][0]+":"+ans2[j][1]);\n        }\n    }\n}	-1	{"err": null, "data": [{"error": 0, "memory": 45133824, "output": null, "result": 0, "signal": 0, "cpu_time": 264, "exit_code": 0, "real_time": 311, "test_case": "0", "output_md5": "44a97f9b03d8c4276b63b6d9f2e6f9c6"}, {"error": 0, "memory": 48750592, "output": null, "result": -1, "signal": 0, "cpu_time": 361, "exit_code": 0, "real_time": 368, "test_case": "1", "output_md5": "d3b211fc40bf0929066338a9efd06ec5"}, {"error": 0, "memory": 49573888, "output": null, "result": -1, "signal": 0, "cpu_time": 350, "exit_code": 0, "real_time": 361, "test_case": "2", "output_md5": "95f48ad018c3fa2c8fcc2fec1b7a5ae5"}, {"error": 0, "memory": 52342784, "output": null, "result": -1, "signal": 0, "cpu_time": 640, "exit_code": 0, "real_time": 1528, "test_case": "3", "output_md5": "f35f7a58fa8fc7579a916d264db906f5"}, {"error": 0, "memory": 74178560, "output": null, "result": 0, "signal": 0, "cpu_time": 890, "exit_code": 0, "real_time": 2352, "test_case": "4", "output_md5": "ceed6fdaacf09fa1a66ce112d413f7aa"}, {"error": 0, "memory": 51539968, "output": null, "result": -1, "signal": 0, "cpu_time": 509, "exit_code": 0, "real_time": 783, "test_case": "5", "output_md5": "f7eba0405dbb8572e154106ce85275f6"}, {"error": 0, "memory": 47906816, "output": null, "result": -1, "signal": 0, "cpu_time": 447, "exit_code": 0, "real_time": 597, "test_case": "6", "output_md5": "ea2602eda99530349f407871ea1e7781"}, {"error": 0, "memory": 47489024, "output": null, "result": -1, "signal": 0, "cpu_time": 403, "exit_code": 0, "real_time": 503, "test_case": "7", "output_md5": "18ef513aead5a43d447b9f15d457dea6"}, {"error": 0, "memory": 47390720, "output": null, "result": -1, "signal": 0, "cpu_time": 399, "exit_code": 0, "real_time": 452, "test_case": "8", "output_md5": "8d8ca07c6a8ec9201a0ad16d4df8f7fb"}, {"error": 0, "memory": 49500160, "output": null, "result": 0, "signal": 0, "cpu_time": 251, "exit_code": 0, "real_time": 287, "test_case": "9", "output_md5": "064b8ab807233abf096b1a800bcfe20e"}]}	Java	f	{"time_cost": 890, "memory_cost": 74178560}	test100pyw	172.20.0.1
e377491fdb90e54a9399c9a2d6c13e99	\N	1	2023-03-27 07:46:43.465074+00	2	print("Hello,World!"	-2	{}	Python2	f	{"score": 0, "err_info": "File \\"/judger/run/a5b6c3083a1942b29c21d16f597b23e4/solution.py\\", line 1\\n    print(\\"Hello,World!\\"\\n                       ^\\nSyntaxError: unexpected EOF while parsing"}	test100pyw	172.20.0.1
1814d3ce33ff660ca3614d17e942fd86	1	19	2023-03-27 11:48:13.964805+00	2	#include<iostream>\n#include<math.h>//log(),floor()应该都在这个头文件\nusing namespace std;\nint out[505];\nint g[100005]/*500位乘以500位，多开一点也不会超空间*/;\nint k(int n){/*n指2的次方数*/\n\tif(n == 0){\n\t\treturn 1;\n\t}//递归出口\n\tk(n/2);//调用下一级(=2^(n/2)^2)\n\tfor(int i = 1;i<=1000;i++){\n\t\tg[i] = 0;\n\t}//清0，没什么好说的 \n\tfor(int i = 1;i<=500/*因为只要500位*/;i++){\n\t\tfor(int j = 1;j<=500/*同理*/;j++){\n\t\t\tg[i+j-1/*类似乘法的第几位*/] += out[i]*out[j];\n\t\t}\n\t}//这一段就是模拟乘法，超出500位的数字我们就可以直接不要了 \n\tif(n%2==1){\n\t\tfor(int i = 1;i<=500;i++){\n\t\t\tg[i]*=2;\n\t\t}\n\t}//取余2不尽的就先乘以2，次方数减一 \n\tfor(int i = 1;i<=500;i++){\n\t\tout[i] = g[i]%10;//只能取个位\n\t\tg[i+1] += g[i]/10;//进位 \n\t}\n}\nint main(){\n\tint n;\n\tcin>>n;\n\tcout<<(long long/*应该改成int也行*/)floor(log(2)/log(10)*n+1)<<endl;\n\tout[1] = 1;\n\tk(n);\n\tfor(int i = 500;i>=2;i--){\n\t\tcout<<out[i];\n\t\tif(i%50==1){//控制50位1个回车\n\t\t\tcout<<endl;\n\t\t}\n\t}\n\tcout<<out[1]-1;\n\t//这个单独输出，因为这一位要减1，也不用怕退位，因为个位只有可能是2,4,8,6\n}	4	{"err": null, "data": [{"error": 0, "memory": 3538944, "output": null, "result": 4, "signal": 11, "cpu_time": 3, "exit_code": 0, "real_time": 32, "test_case": "0", "output_md5": null}, {"error": 0, "memory": 3514368, "output": null, "result": 4, "signal": 11, "cpu_time": 3, "exit_code": 0, "real_time": 32, "test_case": "1", "output_md5": null}, {"error": 0, "memory": 3526656, "output": null, "result": 4, "signal": 11, "cpu_time": 3, "exit_code": 0, "real_time": 32, "test_case": "2", "output_md5": null}, {"error": 0, "memory": 3534848, "output": null, "result": 4, "signal": 11, "cpu_time": 3, "exit_code": 0, "real_time": 33, "test_case": "3", "output_md5": null}, {"error": 0, "memory": 3600384, "output": null, "result": 4, "signal": 11, "cpu_time": 0, "exit_code": 0, "real_time": 31, "test_case": "4", "output_md5": null}, {"error": 0, "memory": 3510272, "output": null, "result": 4, "signal": 11, "cpu_time": 3, "exit_code": 0, "real_time": 32, "test_case": "5", "output_md5": null}, {"error": 0, "memory": 3481600, "output": null, "result": 4, "signal": 11, "cpu_time": 3, "exit_code": 0, "real_time": 33, "test_case": "6", "output_md5": null}, {"error": 0, "memory": 3293184, "output": null, "result": 4, "signal": 11, "cpu_time": 3, "exit_code": 0, "real_time": 32, "test_case": "7", "output_md5": null}, {"error": 0, "memory": 3563520, "output": null, "result": 4, "signal": 11, "cpu_time": 0, "exit_code": 0, "real_time": 31, "test_case": "8", "output_md5": null}, {"error": 0, "memory": 3473408, "output": null, "result": 4, "signal": 11, "cpu_time": 0, "exit_code": 0, "real_time": 30, "test_case": "9", "output_md5": null}]}	C++	f	{"time_cost": 3, "memory_cost": 3600384}	test100pyw	172.20.0.1
80717a44ddde624b9158dc86b0294a27	1	19	2023-03-27 11:49:04.659597+00	2	#include <stdlib.h>\n#include <stdio.h>\n#include <algorithm>\n#include <iostream>\n#include <string.h>\n#include <math.h>\n#define max 100000 \nusing namespace std;\nint a[110];\nint main()\n{\n\tint p,r,i,j,temp; \n\tcin>>p;\n\tcout<<(int)(p*(log10(2))+1)<<endl;\n\tint pos=1,num;\n    memset(a,0,sizeof(a));\n    a[0]=1;\n\tint left=p%10;\n\tp/=10;\n\tfor(i=1;i<=p;i++)//遍历p次  2的10次方 \n\t{\n\t\tr=0;\n\t\tfor(j=0;j<pos;j++)\n\t\t{\n\t\t\ttemp=a[j]*1024+r;\n\t\t\ta[j]=temp%max;\n\t\t\tr=temp/max;\n\t\t}\n\t\twhile(r)\n\t\t{\n\t\t\tif(j==100)//只需要遍历500位的，这里一个索引位置是5位，所以是100 \n\t\t\tbreak;\n\t\t\ta[j++]=r%max;\n\t\t\tr/=max;\n\t\t}\n\t\tpos=j;\n\t}\n\tfor(i=1;i<=left;i++)//p不是10的整数倍数，将剩余的依次遍历 \n\t{\n\t\tr=0;\n\t\tfor(j=0;j<pos;j++)\n\t\t{\n\t\t\ttemp=a[j]*2+r;\n\t\t\ta[j]=temp%max;\n\t\t\tr=temp/max;\n\t\t}\n\t\twhile(r)\n\t\t{\n\t\t\tif(j==100)\n\t\t\tbreak;\n\t\t\ta[j++]=r%max;\n\t\t\tr/=max;\n\t\t}\n\t\tpos=j;\n\t}\n\ta[0]-=1;//最后的-1操作 \n\tfor(i=99;i>=0;i--)\n\t{\n\t\tprintf("%05d",a[i]);\n\t\tif((100-i)%10==0)\n\t\t\tprintf("\\n");\n\t}\n\treturn 0;\n}	-1	{"err": null, "data": [{"error": 0, "memory": 3678208, "output": null, "result": -1, "signal": 0, "cpu_time": 60, "exit_code": 0, "real_time": 99, "test_case": "0", "output_md5": "1661742e004d13c3ff7c5c2d93de7147"}, {"error": 0, "memory": 3735552, "output": null, "result": -1, "signal": 0, "cpu_time": 31, "exit_code": 0, "real_time": 74, "test_case": "1", "output_md5": "4a43bd3cfa5da7cae2999ef547ef2099"}, {"error": 0, "memory": 3735552, "output": null, "result": -1, "signal": 0, "cpu_time": 4, "exit_code": 0, "real_time": 45, "test_case": "2", "output_md5": "d1c07ad69129214c21cb53ac7aceb334"}, {"error": 0, "memory": 3694592, "output": null, "result": -1, "signal": 0, "cpu_time": 4, "exit_code": 0, "real_time": 43, "test_case": "3", "output_md5": "40415c38a0f2b5514ed2cc2be36e5ea7"}, {"error": 0, "memory": 3665920, "output": null, "result": -1, "signal": 0, "cpu_time": 4, "exit_code": 0, "real_time": 43, "test_case": "4", "output_md5": "848b5c4ed80b9d89dcc4fe5f4468823d"}, {"error": 0, "memory": 3829760, "output": null, "result": -1, "signal": 0, "cpu_time": 4, "exit_code": 0, "real_time": 45, "test_case": "5", "output_md5": "fb2c0d0b7c02ce4b85ee35230412fdc9"}, {"error": 0, "memory": 3690496, "output": null, "result": -1, "signal": 0, "cpu_time": 4, "exit_code": 0, "real_time": 41, "test_case": "6", "output_md5": "7d803294b46670a636a366d3d9482371"}, {"error": 0, "memory": 3911680, "output": null, "result": -1, "signal": 0, "cpu_time": 5, "exit_code": 0, "real_time": 47, "test_case": "7", "output_md5": "1eb31e14267b5fe40e4c84fb68ff1e7d"}, {"error": 0, "memory": 3837952, "output": null, "result": -1, "signal": 0, "cpu_time": 58, "exit_code": 0, "real_time": 101, "test_case": "8", "output_md5": "b294888232d3e6ee37e5486b431dd73a"}, {"error": 0, "memory": 3706880, "output": null, "result": -1, "signal": 0, "cpu_time": 18, "exit_code": 0, "real_time": 60, "test_case": "9", "output_md5": "e90c136322c5f670f2012d8603ec1e81"}]}	C++	f	{"time_cost": 60, "memory_cost": 3911680}	test100pyw	172.20.0.1
62376d3f33953678a29f5a8e3111e50d	1	22	2023-03-27 11:51:50.965044+00	2	#include<stdio.h>\nint main()\n{\n int a = 0, b = 0, k;\n char p[72550] = { '\\0' }, term;\n \n for (k=0; 1; k++)\n {\n  scanf("%c", &term); \n  if (term == 'E')  break; \n  p[k] = term;\n } //此for循环先将比赛结果存入p[]数组中,循环完成后p[k]代表最后有效比赛结果位置\n \n for(int i=0;i<=k;i++) //11分制下结果率先输出\n {\n   if (p[i] == 'L') b++;\n  else  if (p[i] == 'W') a++;\n   if (a >= 11&&a-b>=2||b>=11&&b-a>=2) //如果有人率先到达11分并且分差大于等于2，结束比赛。\n   {\n    printf("%d:%d\\n", a, b);\n    a = 0, b = 0;\n\n   }\n }\n \n printf("%d:%d\\n", a, b);\n printf("\\n");\n a = 0, b = 0;\n \n for (int i = 0; i <= k; i++)   //21分制下结果，同上面循环\n {\n  if (p[i] == 'L') b++;\n  else  if (p[i] == 'W') a++;\n  if (a >= 21 && a - b >= 2 || b >= 21 && b - a >= 2)\n  {\n   printf("%d:%d\\n", a, b);\n   a = 0, b = 0;\n  }\n }\n \n printf("%d:%d", a, b);\n}	0	{"err": null, "data": [{"error": 0, "memory": 1716224, "output": null, "result": 0, "signal": 0, "cpu_time": 2, "exit_code": 0, "real_time": 30, "test_case": "0", "output_md5": "44a97f9b03d8c4276b63b6d9f2e6f9c6"}, {"error": 0, "memory": 1675264, "output": null, "result": 0, "signal": 0, "cpu_time": 2, "exit_code": 0, "real_time": 30, "test_case": "1", "output_md5": "b99b049456724f08ccd31f4776b1ce4c"}, {"error": 0, "memory": 1716224, "output": null, "result": 0, "signal": 0, "cpu_time": 2, "exit_code": 0, "real_time": 30, "test_case": "2", "output_md5": "2f3823c34cc9465f8dc2322813b6ea4a"}, {"error": 0, "memory": 1728512, "output": null, "result": 0, "signal": 0, "cpu_time": 4, "exit_code": 0, "real_time": 83, "test_case": "3", "output_md5": "cca2aec13ca66637f9bc00a9ef594465"}, {"error": 0, "memory": 1675264, "output": null, "result": 0, "signal": 0, "cpu_time": 6, "exit_code": 0, "real_time": 111, "test_case": "4", "output_md5": "ceed6fdaacf09fa1a66ce112d413f7aa"}, {"error": 0, "memory": 1679360, "output": null, "result": 0, "signal": 0, "cpu_time": 2, "exit_code": 0, "real_time": 87, "test_case": "5", "output_md5": "64b3fd2e4457489759342a772b0426cf"}, {"error": 0, "memory": 1691648, "output": null, "result": 0, "signal": 0, "cpu_time": 3, "exit_code": 0, "real_time": 123, "test_case": "6", "output_md5": "046cb23fc51e8485cd4f14935ec52698"}, {"error": 0, "memory": 1724416, "output": null, "result": 0, "signal": 0, "cpu_time": 2, "exit_code": 0, "real_time": 64, "test_case": "7", "output_md5": "97a26947e50f64d23aaf1c1194156e60"}, {"error": 0, "memory": 1769472, "output": null, "result": 0, "signal": 0, "cpu_time": 3, "exit_code": 0, "real_time": 57, "test_case": "8", "output_md5": "c93e01dba6583e316417c4b1ca12d734"}, {"error": 0, "memory": 1646592, "output": null, "result": 0, "signal": 0, "cpu_time": 2, "exit_code": 0, "real_time": 30, "test_case": "9", "output_md5": "064b8ab807233abf096b1a800bcfe20e"}]}	C++	f	{"time_cost": 6, "memory_cost": 1769472}	test100pyw	172.20.0.1
9a2e9d1a4c86a492e2ae55eef42ae2f9	1	20	2023-03-27 11:52:50.211687+00	2	#include <bits/stdc++.h>\nusing namespace std;\n \nlong long n, a[20];\n \nint main ()\n{\n\tcin >> n;\n\ta[0] = 1, a[1] = 1;\n\tfor (int i = 2; i <= n; ++i)\n\t\tfor (int j = 0; j <= i - 1; ++j)\n\t\t\ta[i] += a[j] * a[i-1-j];\n\tcout << a[n];\n}	0	{"err": null, "data": [{"error": 0, "memory": 3796992, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 19, "test_case": "0", "output_md5": "e24370798a69da069bf429abbc7896ac"}, {"error": 0, "memory": 3657728, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 20, "test_case": "1", "output_md5": "71fde3ebbfdb1141e371aeaaf5f33f30"}, {"error": 0, "memory": 3563520, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 19, "test_case": "2", "output_md5": "3713bdda7149579475f3734e8bd0e14a"}, {"error": 0, "memory": 3682304, "output": null, "result": 0, "signal": 0, "cpu_time": 3, "exit_code": 0, "real_time": 19, "test_case": "3", "output_md5": "e4da3b7fbbce2345d7772b0674a318d5"}, {"error": 0, "memory": 3665920, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 18, "test_case": "4", "output_md5": "c4ca4238a0b923820dcc509a6f75849b"}]}	C++	f	{"time_cost": 3, "memory_cost": 3796992}	test100pyw	172.20.0.1
5018c71c54d007950e1d488faff087d7	1	20	2023-03-27 11:57:16.28118+00	3	#include <bits/stdc++.h>\nusing namespace std;\n \nlong long n, a[20];\n \nint main ()\n{\n\tcin >> n;\n\ta[0] = 1, a[1] = 1;\n\tfor (int i = 2; i <= n; ++i)\n\t\tfor (int j = 0; j <= i - 1; ++j)\n\t\t\ta[i] += a[j] * a[i-1-j];\n\tcout << a[n];\n}	0	{"err": null, "data": [{"error": 0, "memory": 3674112, "output": null, "result": 0, "signal": 0, "cpu_time": 3, "exit_code": 0, "real_time": 22, "test_case": "0", "output_md5": "e24370798a69da069bf429abbc7896ac"}, {"error": 0, "memory": 3706880, "output": null, "result": 0, "signal": 0, "cpu_time": 3, "exit_code": 0, "real_time": 24, "test_case": "1", "output_md5": "71fde3ebbfdb1141e371aeaaf5f33f30"}, {"error": 0, "memory": 3739648, "output": null, "result": 0, "signal": 0, "cpu_time": 2, "exit_code": 0, "real_time": 24, "test_case": "2", "output_md5": "3713bdda7149579475f3734e8bd0e14a"}, {"error": 0, "memory": 3682304, "output": null, "result": 0, "signal": 0, "cpu_time": 3, "exit_code": 0, "real_time": 23, "test_case": "3", "output_md5": "e4da3b7fbbce2345d7772b0674a318d5"}, {"error": 0, "memory": 3629056, "output": null, "result": 0, "signal": 0, "cpu_time": 3, "exit_code": 0, "real_time": 23, "test_case": "4", "output_md5": "c4ca4238a0b923820dcc509a6f75849b"}]}	C++	f	{"time_cost": 3, "memory_cost": 3739648}	test101pyw	172.20.0.1
76ad01d5b440201bff625d3d4546ce2b	1	20	2023-03-27 11:58:08.261509+00	2	#include <bits/stdc++.h>\nusing namespace std;\n \nlong long n, a[20];\n \nint main ()\n{\n\tcin >> n;\n\ta[0] = 1, a[1] = 1;\n\tfor (int i = 2; i <= n; ++i)\n\t\tfor (int j = 0; j <= i - 1; ++j)\n\t\t\ta[i] += a[j] * a[i-1-j];\n\tcout << a[n];\n}	0	{"err": null, "data": [{"error": 0, "memory": 3850240, "output": null, "result": 0, "signal": 0, "cpu_time": 4, "exit_code": 0, "real_time": 29, "test_case": "0", "output_md5": "e24370798a69da069bf429abbc7896ac"}, {"error": 0, "memory": 3698688, "output": null, "result": 0, "signal": 0, "cpu_time": 3, "exit_code": 0, "real_time": 29, "test_case": "1", "output_md5": "71fde3ebbfdb1141e371aeaaf5f33f30"}, {"error": 0, "memory": 3678208, "output": null, "result": 0, "signal": 0, "cpu_time": 3, "exit_code": 0, "real_time": 29, "test_case": "2", "output_md5": "3713bdda7149579475f3734e8bd0e14a"}, {"error": 0, "memory": 3678208, "output": null, "result": 0, "signal": 0, "cpu_time": 4, "exit_code": 0, "real_time": 28, "test_case": "3", "output_md5": "e4da3b7fbbce2345d7772b0674a318d5"}, {"error": 0, "memory": 3530752, "output": null, "result": 0, "signal": 0, "cpu_time": 4, "exit_code": 0, "real_time": 27, "test_case": "4", "output_md5": "c4ca4238a0b923820dcc509a6f75849b"}]}	C++	f	{"time_cost": 4, "memory_cost": 3850240}	test100pyw	172.20.0.1
6d7ed775a747601a5cff1fcdf459b6f9	1	20	2023-03-27 12:00:20.568784+00	1	#include <bits/stdc++.h>\nusing namespace std;\n \nlong long n, a[20];\n \nint main ()\n{\n\tcin >> n;\n\ta[0] = 1, a[1] = 1;\n\tfor (int i = 2; i <= n; ++i)\n\t\tfor (int j = 0; j <= i - 1; ++j)\n\t\t\ta[i] += a[j] * a[i-1-j];\n\tcout << a[n];\n}	0	{"err": null, "data": [{"error": 0, "memory": 3817472, "output": null, "result": 0, "signal": 0, "cpu_time": 3, "exit_code": 0, "real_time": 23, "test_case": "0", "output_md5": "e24370798a69da069bf429abbc7896ac"}, {"error": 0, "memory": 3768320, "output": null, "result": 0, "signal": 0, "cpu_time": 3, "exit_code": 0, "real_time": 24, "test_case": "1", "output_md5": "71fde3ebbfdb1141e371aeaaf5f33f30"}, {"error": 0, "memory": 3629056, "output": null, "result": 0, "signal": 0, "cpu_time": 3, "exit_code": 0, "real_time": 23, "test_case": "2", "output_md5": "3713bdda7149579475f3734e8bd0e14a"}, {"error": 0, "memory": 3706880, "output": null, "result": 0, "signal": 0, "cpu_time": 3, "exit_code": 0, "real_time": 23, "test_case": "3", "output_md5": "e4da3b7fbbce2345d7772b0674a318d5"}, {"error": 0, "memory": 3624960, "output": null, "result": 0, "signal": 0, "cpu_time": 1, "exit_code": 0, "real_time": 24, "test_case": "4", "output_md5": "c4ca4238a0b923820dcc509a6f75849b"}]}	C++	f	{"time_cost": 3, "memory_cost": 3817472}	root	172.20.0.1
c8d1ed0c7a0738e70766a798f10d50c1	1	20	2023-03-27 12:11:42.311822+00	2	#include <bits/stdc++.h>\nusing namespace std;\n \nlong long n, a[20];\n \nint main ()\n{\n\tcin >> n;\n\ta[0] = 1, a[1] = 1;\n\tfor (int i = 2; i <= n; ++i)\n\t\tfor (int j = 0; j <= i - 1; ++j)\n\t\t\ta[i] += a[j] * a[i-1-j];\n\tcout << a[n];\n}	-2	{}	C	f	{"score": 0, "err_info": "/judger/run/9098f78e24b74fe7b4ec5c09d3321696/main.c:1:10: fatal error: bits/stdc++.h: No such file or directory\\n    1 | #include <bits/stdc++.h>\\n      |          ^~~~~~~~~~~~~~~\\ncompilation terminated."}	test100pyw	172.20.0.1
c7c64a231d1718c11e1eead3d18f7279	1	20	2023-03-27 12:11:55.906381+00	2	#include <bits/stdc++.h>\nusing namespace std;\n \nlong long n, a[20];\n \nint main ()\n{\n\tcin >> n;\n\ta[0] = 1, a[1] = 1;\n\tfor (int i = 2; i <= n; ++i)\n\t\tfor (int j = 0; j <= i - 1; ++j)\n\t\t\ta[i] += a[j] * a[i-1-j];\n\tcout << a[n];\n}	0	{"err": null, "data": [{"error": 0, "memory": 3768320, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 22, "test_case": "0", "output_md5": "e24370798a69da069bf429abbc7896ac"}, {"error": 0, "memory": 3690496, "output": null, "result": 0, "signal": 0, "cpu_time": 3, "exit_code": 0, "real_time": 24, "test_case": "1", "output_md5": "71fde3ebbfdb1141e371aeaaf5f33f30"}, {"error": 0, "memory": 3633152, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 23, "test_case": "2", "output_md5": "3713bdda7149579475f3734e8bd0e14a"}, {"error": 0, "memory": 3686400, "output": null, "result": 0, "signal": 0, "cpu_time": 3, "exit_code": 0, "real_time": 22, "test_case": "3", "output_md5": "e4da3b7fbbce2345d7772b0674a318d5"}, {"error": 0, "memory": 3710976, "output": null, "result": 0, "signal": 0, "cpu_time": 2, "exit_code": 0, "real_time": 23, "test_case": "4", "output_md5": "c4ca4238a0b923820dcc509a6f75849b"}]}	C++	f	{"time_cost": 3, "memory_cost": 3768320}	test100pyw	172.20.0.1
abbe0aeacbb96a85e944615f2776105b	1	22	2023-03-27 12:12:39.286933+00	2	#include<stdio.h>\nint main()\n{\n int a = 0, b = 0, k;\n char p[72550] = { '\\0' }, term;\n \n for (k=0; 1; k++)\n {\n  scanf("%c", &term); \n  if (term == 'E')  break; \n  p[k] = term;\n } //此for循环先将比赛结果存入p[]数组中,循环完成后p[k]代表最后有效比赛结果位置\n \n for(int i=0;i<=k;i++) //11分制下结果率先输出\n {\n   if (p[i] == 'L') b++;\n  else  if (p[i] == 'W') a++;\n   if (a >= 11&&a-b>=2||b>=11&&b-a>=2) //如果有人率先到达11分并且分差大于等于2，结束比赛。\n   {\n    printf("%d:%d\\n", a, b);\n    a = 0, b = 0;\n\n   }\n }\n \n printf("%d:%d\\n", a, b);\n printf("\\n");\n a = 0, b = 0;\n \n for (int i = 0; i <= k; i++)   //21分制下结果，同上面循环\n {\n  if (p[i] == 'L') b++;\n  else  if (p[i] == 'W') a++;\n  if (a >= 21 && a - b >= 2 || b >= 21 && b - a >= 2)\n  {\n   printf("%d:%d\\n", a, b);\n   a = 0, b = 0;\n  }\n }\n \n printf("%d:%d", a, b);\n}	0	{"err": null, "data": [{"error": 0, "memory": 1732608, "output": null, "result": 0, "signal": 0, "cpu_time": 4, "exit_code": 0, "real_time": 42, "test_case": "0", "output_md5": "44a97f9b03d8c4276b63b6d9f2e6f9c6"}, {"error": 0, "memory": 1699840, "output": null, "result": 0, "signal": 0, "cpu_time": 3, "exit_code": 0, "real_time": 40, "test_case": "1", "output_md5": "b99b049456724f08ccd31f4776b1ce4c"}, {"error": 0, "memory": 1712128, "output": null, "result": 0, "signal": 0, "cpu_time": 3, "exit_code": 0, "real_time": 39, "test_case": "2", "output_md5": "2f3823c34cc9465f8dc2322813b6ea4a"}, {"error": 0, "memory": 1609728, "output": null, "result": 0, "signal": 0, "cpu_time": 5, "exit_code": 0, "real_time": 48, "test_case": "3", "output_md5": "cca2aec13ca66637f9bc00a9ef594465"}, {"error": 0, "memory": 1761280, "output": null, "result": 0, "signal": 0, "cpu_time": 9, "exit_code": 0, "real_time": 56, "test_case": "4", "output_md5": "ceed6fdaacf09fa1a66ce112d413f7aa"}, {"error": 0, "memory": 1765376, "output": null, "result": 0, "signal": 0, "cpu_time": 0, "exit_code": 0, "real_time": 43, "test_case": "5", "output_md5": "64b3fd2e4457489759342a772b0426cf"}, {"error": 0, "memory": 1581056, "output": null, "result": 0, "signal": 0, "cpu_time": 4, "exit_code": 0, "real_time": 42, "test_case": "6", "output_md5": "046cb23fc51e8485cd4f14935ec52698"}, {"error": 0, "memory": 1687552, "output": null, "result": 0, "signal": 0, "cpu_time": 3, "exit_code": 0, "real_time": 40, "test_case": "7", "output_md5": "97a26947e50f64d23aaf1c1194156e60"}, {"error": 0, "memory": 1724416, "output": null, "result": 0, "signal": 0, "cpu_time": 3, "exit_code": 0, "real_time": 42, "test_case": "8", "output_md5": "c93e01dba6583e316417c4b1ca12d734"}, {"error": 0, "memory": 1744896, "output": null, "result": 0, "signal": 0, "cpu_time": 3, "exit_code": 0, "real_time": 39, "test_case": "9", "output_md5": "064b8ab807233abf096b1a800bcfe20e"}]}	C++	f	{"time_cost": 9, "memory_cost": 1765376}	test100pyw	172.20.0.1
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public."user" (id, password, last_login, username, email, create_time, admin_type, reset_password_token, reset_password_token_expire_time, auth_token, two_factor_auth, tfa_token, open_api, open_api_appkey, is_disabled, problem_permission, session_keys) FROM stdin;
2	pbkdf2_sha256$120000$XdZjUx4DDk1h$thHNsl8S4GSl61aqyZI+ZrcN1GhsR2vdIyIo9UlhOEs=	2023-03-27 12:10:54.466703+00	test100pyw	chris7mas@163.com	2023-03-24 13:03:47.491498+00	Regular User	\N	\N	\N	f	\N	f	\N	f	None	["t33l6xvjmldb2qsg51sl6fx7y6mh251l", "ggr0lf8ow0d1mw2t6hw4s2fb4dlki836", "16vez8q833e5magnjoh3obz1a9h2c16u"]
1	pbkdf2_sha256$120000$JfEUC6LPwmB9$TFPIYEQ//38I93jqi9k5R8BQeY+ZbXybDt7CVG7rjN0=	2023-03-27 12:13:44.370952+00	root	\N	2023-03-14 14:30:42.418498+00	Super Admin	\N	\N	\N	f	1296ac4ce04f816537cc19a8a8146c79	f	\N	f	All	["yvablsj389motzmm6j8odm92me1uhch5"]
4	pbkdf2_sha256$120000$Wccg5PpCAQpV$el1Y4scFonXeqLfzIz1vQgqlWVODtRGTFamks7Jz29A=	\N	test102pyw	\N	2023-03-24 13:03:47.491612+00	Regular User	\N	\N	\N	f	\N	f	\N	f	None	[]
5	pbkdf2_sha256$120000$U1TT8J5yPTlq$ftEOHx71+AYIGIY5vTiaDDR/In3xSe/2z7YF9egCk8M=	\N	test103pyw	\N	2023-03-24 13:03:47.491659+00	Regular User	\N	\N	\N	f	\N	f	\N	f	None	[]
6	pbkdf2_sha256$120000$a8ecsy2ZwTLC$X31WRwLJe/1B1eKa1htQ1vXeDlKAXH7AM5j2cCixQPY=	\N	test104pyw	\N	2023-03-24 13:03:47.491705+00	Regular User	\N	\N	\N	f	\N	f	\N	f	None	[]
7	pbkdf2_sha256$120000$xvO5V1elu67A$QYB4Kwn3A+RO8VERj9OPFQOJ2Ett3UsSk2LPxIGkhCM=	\N	test105pyw	\N	2023-03-24 13:03:47.491751+00	Regular User	\N	\N	\N	f	\N	f	\N	f	None	[]
8	pbkdf2_sha256$120000$KkaURM7FpAEU$0RdsDLQEBsRE0MDMcgNcTFfylnRPiid9gQqH/7TWfPo=	\N	test106pyw	\N	2023-03-24 13:03:47.491797+00	Regular User	\N	\N	\N	f	\N	f	\N	f	None	[]
9	pbkdf2_sha256$120000$KX5U82d7AY1V$y/tCl79VJY1ajQszdyzL+r3HWbNmXzOzgvds3nksT8w=	\N	test107pyw	\N	2023-03-24 13:03:47.491843+00	Regular User	\N	\N	\N	f	\N	f	\N	f	None	[]
10	pbkdf2_sha256$120000$NPUpUsAMECtS$QlKoWXxd8Urk3n/GrC4R8q0vXSUR4mzbVDKLDCoyTE4=	\N	test108pyw	\N	2023-03-24 13:03:47.491889+00	Regular User	\N	\N	\N	f	\N	f	\N	f	None	[]
11	pbkdf2_sha256$120000$dxbOYhQP9HVy$fcRM0ktrLKGikKjOZzyU1b/P6xDHsd/IfJF8+vyross=	\N	test109pyw	\N	2023-03-24 13:03:47.491935+00	Regular User	\N	\N	\N	f	\N	f	\N	f	None	[]
12	pbkdf2_sha256$120000$Mjvj4BubROZJ$TBYOx5eFoGsmvsh53qdVwLQHdO35MTOuR7Te4qGPybM=	\N	test110pyw	\N	2023-03-24 13:03:47.491981+00	Regular User	\N	\N	\N	f	\N	f	\N	f	None	[]
3	pbkdf2_sha256$120000$IFSxXjZVapC8$omnaovqsj8UnOWcFnfCn6LVrWoDgTc0sWTtKso5+zgw=	2023-03-27 11:56:34.161626+00	test101pyw	\N	2023-03-24 13:03:47.491563+00	Regular User	\N	\N	\N	f	\N	f	\N	f	None	["j1dkk45d3atpjqvyjtph3ct5q4c3d4fp", "ppn2o0g319phlx01tgk4eu8vd17mrqly"]
\.


--
-- Data for Name: user_profile; Type: TABLE DATA; Schema: public; Owner: onlinejudge
--

COPY public.user_profile (id, acm_problems_status, avatar, blog, mood, accepted_number, submission_number, github, school, major, user_id, total_score, oi_problems_status, real_name, language) FROM stdin;
1	{"problems": {"1": {"_id": "23031501", "status": 0}, "15": {"_id": "fps-f318", "status": 0}}}	/public/avatar/default.png	\N	\N	2	9	\N	\N	\N	1	0	{}	\N	\N
4	{}	/public/avatar/default.png	\N	\N	0	0	\N	\N	\N	4	0	{}	\N	\N
5	{}	/public/avatar/default.png	\N	\N	0	0	\N	\N	\N	5	0	{}	\N	\N
6	{}	/public/avatar/default.png	\N	\N	0	0	\N	\N	\N	6	0	{}	\N	\N
7	{}	/public/avatar/default.png	\N	\N	0	0	\N	\N	\N	7	0	{}	\N	\N
8	{}	/public/avatar/default.png	\N	\N	0	0	\N	\N	\N	8	0	{}	\N	\N
9	{}	/public/avatar/default.png	\N	\N	0	0	\N	\N	\N	9	0	{}	\N	\N
10	{}	/public/avatar/default.png	\N	\N	0	0	\N	\N	\N	10	0	{}	\N	\N
11	{}	/public/avatar/default.png	\N	\N	0	0	\N	\N	\N	11	0	{}	\N	\N
12	{}	/public/avatar/default.png	\N	\N	0	0	\N	\N	\N	12	0	{}	\N	\N
3	{"contest_problems": {"20": {"_id": "2", "status": 0}}}	/public/avatar/default.png	\N	\N	0	0	\N	\N	\N	3	0	{}	\N	\N
2	{"problems": {"1": {"_id": "23031501", "status": 0}, "15": {"_id": "fps-f318", "status": -1}}, "contest_problems": {"19": {"_id": "1", "status": -1}, "20": {"_id": "2", "status": 0}, "22": {"_id": "4", "status": 0}}}	/public/avatar/default.png	\N	\N	1	4	\N	\N	\N	2	0	{}	潘	\N
\.


--
-- Name: acm_contest_rank_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.acm_contest_rank_id_seq', 2, true);


--
-- Name: announcement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.announcement_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 68, true);


--
-- Name: contest_announcement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.contest_announcement_id_seq', 1, false);


--
-- Name: contest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.contest_id_seq', 2, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 17, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 65, true);


--
-- Name: judge_server_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.judge_server_id_seq', 1, true);


--
-- Name: oi_contest_rank_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.oi_contest_rank_id_seq', 1, false);


--
-- Name: options_sysoptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.options_sysoptions_id_seq', 10, true);


--
-- Name: problem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.problem_id_seq', 23, true);


--
-- Name: problem_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.problem_tag_id_seq', 3, true);


--
-- Name: problem_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.problem_tags_id_seq', 39, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.user_id_seq', 12, true);


--
-- Name: user_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: onlinejudge
--

SELECT pg_catalog.setval('public.user_profile_id_seq', 12, true);


--
-- Name: acm_contest_rank acm_contest_rank_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.acm_contest_rank
    ADD CONSTRAINT acm_contest_rank_pkey PRIMARY KEY (id);


--
-- Name: acm_contest_rank acm_contest_rank_user_id_contest_id_26151d10_uniq; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.acm_contest_rank
    ADD CONSTRAINT acm_contest_rank_user_id_contest_id_26151d10_uniq UNIQUE (user_id, contest_id);


--
-- Name: announcement announcement_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.announcement
    ADD CONSTRAINT announcement_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: contest_announcement contest_announcement_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.contest_announcement
    ADD CONSTRAINT contest_announcement_pkey PRIMARY KEY (id);


--
-- Name: contest contest_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.contest
    ADD CONSTRAINT contest_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_dramatiq_task django_dramatiq_task_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.django_dramatiq_task
    ADD CONSTRAINT django_dramatiq_task_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: judge_server judge_server_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.judge_server
    ADD CONSTRAINT judge_server_pkey PRIMARY KEY (id);


--
-- Name: oi_contest_rank oi_contest_rank_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.oi_contest_rank
    ADD CONSTRAINT oi_contest_rank_pkey PRIMARY KEY (id);


--
-- Name: oi_contest_rank oi_contest_rank_user_id_contest_id_fe51a302_uniq; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.oi_contest_rank
    ADD CONSTRAINT oi_contest_rank_user_id_contest_id_fe51a302_uniq UNIQUE (user_id, contest_id);


--
-- Name: options_sysoptions options_sysoptions_key_key; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.options_sysoptions
    ADD CONSTRAINT options_sysoptions_key_key UNIQUE (key);


--
-- Name: options_sysoptions options_sysoptions_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.options_sysoptions
    ADD CONSTRAINT options_sysoptions_pkey PRIMARY KEY (id);


--
-- Name: problem problem__id_contest_id_346645fe_uniq; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.problem
    ADD CONSTRAINT problem__id_contest_id_346645fe_uniq UNIQUE (_id, contest_id);


--
-- Name: problem problem_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.problem
    ADD CONSTRAINT problem_pkey PRIMARY KEY (id);


--
-- Name: problem_tag problem_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.problem_tag
    ADD CONSTRAINT problem_tag_pkey PRIMARY KEY (id);


--
-- Name: problem_tags problem_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.problem_tags
    ADD CONSTRAINT problem_tags_pkey PRIMARY KEY (id);


--
-- Name: problem_tags problem_tags_problem_id_problemtag_id_318459d1_uniq; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.problem_tags
    ADD CONSTRAINT problem_tags_problem_id_problemtag_id_318459d1_uniq UNIQUE (problem_id, problemtag_id);


--
-- Name: submission submission_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.submission
    ADD CONSTRAINT submission_pkey PRIMARY KEY (id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: user_profile user_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.user_profile
    ADD CONSTRAINT user_profile_pkey PRIMARY KEY (id);


--
-- Name: user_profile user_profile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.user_profile
    ADD CONSTRAINT user_profile_user_id_key UNIQUE (user_id);


--
-- Name: user user_username_key; Type: CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key UNIQUE (username);


--
-- Name: acm_contest_rank_contest_id_21030ccd; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX acm_contest_rank_contest_id_21030ccd ON public.acm_contest_rank USING btree (contest_id);


--
-- Name: acm_contest_rank_user_id_40391ab2; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX acm_contest_rank_user_id_40391ab2 ON public.acm_contest_rank USING btree (user_id);


--
-- Name: announcement_created_by_id_359ccf50; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX announcement_created_by_id_359ccf50 ON public.announcement USING btree (created_by_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: contest_announcement_contest_id_a8cb419f; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX contest_announcement_contest_id_a8cb419f ON public.contest_announcement USING btree (contest_id);


--
-- Name: contest_announcement_created_by_id_469a14ce; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX contest_announcement_created_by_id_469a14ce ON public.contest_announcement USING btree (created_by_id);


--
-- Name: contest_created_by_id_a763ca7e; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX contest_created_by_id_a763ca7e ON public.contest USING btree (created_by_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: oi_contest_rank_contest_id_171fcdaf; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX oi_contest_rank_contest_id_171fcdaf ON public.oi_contest_rank USING btree (contest_id);


--
-- Name: oi_contest_rank_user_id_0ba36852; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX oi_contest_rank_user_id_0ba36852 ON public.oi_contest_rank USING btree (user_id);


--
-- Name: problem__id_919b1d80; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX problem__id_919b1d80 ON public.problem USING btree (_id);


--
-- Name: problem_contest_id_328e013a; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX problem_contest_id_328e013a ON public.problem USING btree (contest_id);


--
-- Name: problem_created_by_id_cb362143; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX problem_created_by_id_cb362143 ON public.problem USING btree (created_by_id);


--
-- Name: problem_tags_problem_id_866ecb8d; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX problem_tags_problem_id_866ecb8d ON public.problem_tags USING btree (problem_id);


--
-- Name: problem_tags_problemtag_id_72d20571; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX problem_tags_problemtag_id_72d20571 ON public.problem_tags USING btree (problemtag_id);


--
-- Name: submission_contest_id_775716d5; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX submission_contest_id_775716d5 ON public.submission USING btree (contest_id);


--
-- Name: submission_problem_id_76847b55; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX submission_problem_id_76847b55 ON public.submission USING btree (problem_id);


--
-- Name: submission_result_37e2f67a; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX submission_result_37e2f67a ON public.submission USING btree (result);


--
-- Name: submission_user_id_3779a8c1; Type: INDEX; Schema: public; Owner: onlinejudge
--

CREATE INDEX submission_user_id_3779a8c1 ON public.submission USING btree (user_id);


--
-- Name: acm_contest_rank acm_contest_rank_contest_id_21030ccd_fk_contest_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.acm_contest_rank
    ADD CONSTRAINT acm_contest_rank_contest_id_21030ccd_fk_contest_id FOREIGN KEY (contest_id) REFERENCES public.contest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: acm_contest_rank acm_contest_rank_user_id_40391ab2_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.acm_contest_rank
    ADD CONSTRAINT acm_contest_rank_user_id_40391ab2_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: announcement announcement_created_by_id_359ccf50_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.announcement
    ADD CONSTRAINT announcement_created_by_id_359ccf50_fk_user_id FOREIGN KEY (created_by_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contest_announcement contest_announcement_contest_id_a8cb419f_fk_contest_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.contest_announcement
    ADD CONSTRAINT contest_announcement_contest_id_a8cb419f_fk_contest_id FOREIGN KEY (contest_id) REFERENCES public.contest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contest_announcement contest_announcement_created_by_id_469a14ce_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.contest_announcement
    ADD CONSTRAINT contest_announcement_created_by_id_469a14ce_fk_user_id FOREIGN KEY (created_by_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contest contest_created_by_id_a763ca7e_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.contest
    ADD CONSTRAINT contest_created_by_id_a763ca7e_fk_user_id FOREIGN KEY (created_by_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oi_contest_rank oi_contest_rank_contest_id_171fcdaf_fk_contest_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.oi_contest_rank
    ADD CONSTRAINT oi_contest_rank_contest_id_171fcdaf_fk_contest_id FOREIGN KEY (contest_id) REFERENCES public.contest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oi_contest_rank oi_contest_rank_user_id_0ba36852_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.oi_contest_rank
    ADD CONSTRAINT oi_contest_rank_user_id_0ba36852_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: problem problem_contest_id_328e013a_fk_contest_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.problem
    ADD CONSTRAINT problem_contest_id_328e013a_fk_contest_id FOREIGN KEY (contest_id) REFERENCES public.contest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: problem problem_created_by_id_cb362143_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.problem
    ADD CONSTRAINT problem_created_by_id_cb362143_fk_user_id FOREIGN KEY (created_by_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: problem_tags problem_tags_problem_id_866ecb8d_fk_problem_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.problem_tags
    ADD CONSTRAINT problem_tags_problem_id_866ecb8d_fk_problem_id FOREIGN KEY (problem_id) REFERENCES public.problem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: problem_tags problem_tags_problemtag_id_72d20571_fk_problem_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.problem_tags
    ADD CONSTRAINT problem_tags_problemtag_id_72d20571_fk_problem_tag_id FOREIGN KEY (problemtag_id) REFERENCES public.problem_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: submission submission_contest_id_775716d5_fk_contest_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.submission
    ADD CONSTRAINT submission_contest_id_775716d5_fk_contest_id FOREIGN KEY (contest_id) REFERENCES public.contest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: submission submission_problem_id_76847b55_fk_problem_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.submission
    ADD CONSTRAINT submission_problem_id_76847b55_fk_problem_id FOREIGN KEY (problem_id) REFERENCES public.problem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_profile user_profile_user_id_8fdce8e2_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: onlinejudge
--

ALTER TABLE ONLY public.user_profile
    ADD CONSTRAINT user_profile_user_id_8fdce8e2_fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

\connect postgres

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.23
-- Dumped by pg_dump version 10.23

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: onlinejudge
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

\connect template1

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.23
-- Dumped by pg_dump version 10.23

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
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: onlinejudge
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

