--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.4

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
-- Name: announcements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.announcements (
    id integer NOT NULL,
    date_created timestamp with time zone,
    date_updated timestamp with time zone,
    title character varying(255) NOT NULL,
    content text
);


ALTER TABLE public.announcements OWNER TO postgres;

--
-- Name: announcements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.announcements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.announcements_id_seq OWNER TO postgres;

--
-- Name: announcements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.announcements_id_seq OWNED BY public.announcements.id;


--
-- Name: directus_activity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_activity (
    id integer NOT NULL,
    action character varying(45) NOT NULL,
    "user" uuid,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    ip character varying(50) NOT NULL,
    user_agent character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    comment text
);


ALTER TABLE public.directus_activity OWNER TO postgres;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_activity_id_seq OWNER TO postgres;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_activity_id_seq OWNED BY public.directus_activity.id;


--
-- Name: directus_collections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_collections (
    collection character varying(64) NOT NULL,
    icon character varying(30),
    note text,
    display_template character varying(255),
    hidden boolean DEFAULT false NOT NULL,
    singleton boolean DEFAULT false NOT NULL,
    translations json,
    archive_field character varying(64),
    archive_app_filter boolean DEFAULT true NOT NULL,
    archive_value character varying(255),
    unarchive_value character varying(255),
    sort_field character varying(64),
    accountability character varying(255) DEFAULT 'all'::character varying,
    color character varying(255),
    item_duplication_fields json
);


ALTER TABLE public.directus_collections OWNER TO postgres;

--
-- Name: directus_fields; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_fields (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    field character varying(64) NOT NULL,
    special character varying(64),
    interface character varying(64),
    options json,
    display character varying(64),
    display_options json,
    readonly boolean DEFAULT false NOT NULL,
    hidden boolean DEFAULT false NOT NULL,
    sort integer,
    width character varying(30) DEFAULT 'full'::character varying,
    "group" integer,
    translations json,
    note text,
    conditions json,
    required boolean DEFAULT false
);


ALTER TABLE public.directus_fields OWNER TO postgres;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_fields_id_seq OWNER TO postgres;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_fields_id_seq OWNED BY public.directus_fields.id;


--
-- Name: directus_files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_files (
    id uuid NOT NULL,
    storage character varying(255) NOT NULL,
    filename_disk character varying(255),
    filename_download character varying(255) NOT NULL,
    title character varying(255),
    type character varying(255),
    folder uuid,
    uploaded_by uuid,
    uploaded_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_by uuid,
    modified_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    charset character varying(50),
    filesize bigint,
    width integer,
    height integer,
    duration integer,
    embed character varying(200),
    description text,
    location text,
    tags text,
    metadata json
);


ALTER TABLE public.directus_files OWNER TO postgres;

--
-- Name: directus_folders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_folders (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    parent uuid
);


ALTER TABLE public.directus_folders OWNER TO postgres;

--
-- Name: directus_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_migrations (
    version character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.directus_migrations OWNER TO postgres;

--
-- Name: directus_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_permissions (
    id integer NOT NULL,
    role uuid,
    collection character varying(64) NOT NULL,
    action character varying(10) NOT NULL,
    permissions json,
    validation json,
    presets json,
    fields text,
    "limit" integer
);


ALTER TABLE public.directus_permissions OWNER TO postgres;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_permissions_id_seq OWNER TO postgres;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_permissions_id_seq OWNED BY public.directus_permissions.id;


--
-- Name: directus_presets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_presets (
    id integer NOT NULL,
    bookmark character varying(255),
    "user" uuid,
    role uuid,
    collection character varying(64),
    search character varying(100),
    filters json,
    layout character varying(100) DEFAULT 'tabular'::character varying,
    layout_query json,
    layout_options json,
    refresh_interval integer
);


ALTER TABLE public.directus_presets OWNER TO postgres;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_presets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_presets_id_seq OWNER TO postgres;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_presets_id_seq OWNED BY public.directus_presets.id;


--
-- Name: directus_relations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_relations (
    id integer NOT NULL,
    many_collection character varying(64) NOT NULL,
    many_field character varying(64) NOT NULL,
    one_collection character varying(64),
    one_field character varying(64),
    one_collection_field character varying(64),
    one_allowed_collections text,
    junction_field character varying(64),
    sort_field character varying(64),
    one_deselect_action character varying(255) DEFAULT 'nullify'::character varying NOT NULL
);


ALTER TABLE public.directus_relations OWNER TO postgres;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_relations_id_seq OWNER TO postgres;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_relations_id_seq OWNED BY public.directus_relations.id;


--
-- Name: directus_revisions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_revisions (
    id integer NOT NULL,
    activity integer NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    data json,
    delta json,
    parent integer
);


ALTER TABLE public.directus_revisions OWNER TO postgres;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_revisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_revisions_id_seq OWNER TO postgres;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_revisions_id_seq OWNED BY public.directus_revisions.id;


--
-- Name: directus_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_roles (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(30) DEFAULT 'supervised_user_circle'::character varying NOT NULL,
    description text,
    ip_access text,
    enforce_tfa boolean DEFAULT false NOT NULL,
    module_list json,
    collection_list json,
    admin_access boolean DEFAULT false NOT NULL,
    app_access boolean DEFAULT true NOT NULL
);


ALTER TABLE public.directus_roles OWNER TO postgres;

--
-- Name: directus_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_sessions (
    token character varying(64) NOT NULL,
    "user" uuid NOT NULL,
    expires timestamp with time zone NOT NULL,
    ip character varying(255),
    user_agent character varying(255)
);


ALTER TABLE public.directus_sessions OWNER TO postgres;

--
-- Name: directus_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_settings (
    id integer NOT NULL,
    project_name character varying(100) DEFAULT 'Directus'::character varying NOT NULL,
    project_url character varying(255),
    project_color character varying(10) DEFAULT '#00C897'::character varying,
    project_logo uuid,
    public_foreground uuid,
    public_background uuid,
    public_note text,
    auth_login_attempts integer DEFAULT 25,
    auth_password_policy character varying(100),
    storage_asset_transform character varying(7) DEFAULT 'all'::character varying,
    storage_asset_presets json,
    custom_css text,
    storage_default_folder uuid,
    basemaps json,
    mapbox_key character varying(255)
);


ALTER TABLE public.directus_settings OWNER TO postgres;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_settings_id_seq OWNER TO postgres;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_settings_id_seq OWNED BY public.directus_settings.id;


--
-- Name: directus_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_users (
    id uuid NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(128) NOT NULL,
    password character varying(255),
    location character varying(255),
    title character varying(50),
    description text,
    tags json,
    avatar uuid,
    language character varying(8) DEFAULT 'en-US'::character varying,
    theme character varying(20) DEFAULT 'auto'::character varying,
    tfa_secret character varying(255),
    status character varying(16) DEFAULT 'active'::character varying NOT NULL,
    role uuid,
    token character varying(255),
    last_access timestamp with time zone,
    last_page character varying(255)
);


ALTER TABLE public.directus_users OWNER TO postgres;

--
-- Name: directus_webhooks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_webhooks (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    method character varying(10) DEFAULT 'POST'::character varying NOT NULL,
    url text,
    status character varying(10) DEFAULT 'active'::character varying NOT NULL,
    data boolean DEFAULT true NOT NULL,
    actions character varying(100) NOT NULL,
    collections text
);


ALTER TABLE public.directus_webhooks OWNER TO postgres;

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_webhooks_id_seq OWNER TO postgres;

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_webhooks_id_seq OWNED BY public.directus_webhooks.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    date_created timestamp with time zone,
    date_updated timestamp with time zone,
    email character varying(255) NOT NULL,
    company character varying(255),
    name character varying(255),
    prices json DEFAULT '[]'::json NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
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
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: announcements id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.announcements ALTER COLUMN id SET DEFAULT nextval('public.announcements_id_seq'::regclass);


--
-- Name: directus_activity id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_activity ALTER COLUMN id SET DEFAULT nextval('public.directus_activity_id_seq'::regclass);


--
-- Name: directus_fields id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_fields ALTER COLUMN id SET DEFAULT nextval('public.directus_fields_id_seq'::regclass);


--
-- Name: directus_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_permissions ALTER COLUMN id SET DEFAULT nextval('public.directus_permissions_id_seq'::regclass);


--
-- Name: directus_presets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets ALTER COLUMN id SET DEFAULT nextval('public.directus_presets_id_seq'::regclass);


--
-- Name: directus_relations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_relations ALTER COLUMN id SET DEFAULT nextval('public.directus_relations_id_seq'::regclass);


--
-- Name: directus_revisions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions ALTER COLUMN id SET DEFAULT nextval('public.directus_revisions_id_seq'::regclass);


--
-- Name: directus_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings ALTER COLUMN id SET DEFAULT nextval('public.directus_settings_id_seq'::regclass);


--
-- Name: directus_webhooks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_webhooks ALTER COLUMN id SET DEFAULT nextval('public.directus_webhooks_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: announcements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.announcements (id, date_created, date_updated, title, content) FROM stdin;
1	2021-09-01 14:17:00.854+08	\N	Test Announcement	<p>This is a test <strong>announcement</strong></p>
\.


--
-- Data for Name: directus_activity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment) FROM stdin;
1	authenticate	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-01 13:59:20.586805+08	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36	directus_users	533a5ff7-9541-4766-b8df-548fe7f84b8e	\N
2	create	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-01 13:59:51.069779+08	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36	directus_collections	users	\N
3	create	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-01 13:59:51.069779+08	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36	directus_fields	1	\N
4	create	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-01 13:59:51.069779+08	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36	directus_fields	2	\N
5	create	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-01 13:59:51.069779+08	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36	directus_fields	3	\N
6	create	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-01 14:01:01.522893+08	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36	directus_fields	4	\N
7	create	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-01 14:01:23.066018+08	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36	directus_fields	5	\N
8	create	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-01 14:01:38.146853+08	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36	directus_fields	6	\N
9	create	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-01 14:02:15.919759+08	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36	directus_fields	7	\N
10	create	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-01 14:02:43.725693+08	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36	directus_collections	announcements	\N
11	create	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-01 14:02:43.725693+08	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36	directus_fields	8	\N
12	create	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-01 14:02:43.725693+08	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36	directus_fields	9	\N
13	create	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-01 14:02:43.725693+08	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36	directus_fields	10	\N
14	create	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-01 14:02:58.147853+08	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36	directus_fields	11	\N
15	create	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-01 14:03:42.872689+08	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36	directus_fields	12	\N
16	authenticate	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-01 14:07:40.551574+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	533a5ff7-9541-4766-b8df-548fe7f84b8e	\N
17	authenticate	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-01 14:07:40.669528+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	533a5ff7-9541-4766-b8df-548fe7f84b8e	\N
18	authenticate	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-01 14:08:37.769654+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	533a5ff7-9541-4766-b8df-548fe7f84b8e	\N
19	authenticate	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-01 14:15:24.358693+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	533a5ff7-9541-4766-b8df-548fe7f84b8e	\N
20	authenticate	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-01 14:15:28.092362+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	533a5ff7-9541-4766-b8df-548fe7f84b8e	\N
21	authenticate	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-01 14:15:28.226755+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	533a5ff7-9541-4766-b8df-548fe7f84b8e	\N
22	create	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-01 14:15:28.320377+08	127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	users	1	\N
23	authenticate	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-01 14:15:28.399736+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	533a5ff7-9541-4766-b8df-548fe7f84b8e	\N
24	authenticate	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-01 14:15:28.555188+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	533a5ff7-9541-4766-b8df-548fe7f84b8e	\N
25	authenticate	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-01 14:15:29.105702+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	533a5ff7-9541-4766-b8df-548fe7f84b8e	\N
26	authenticate	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-01 14:15:33.834361+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	533a5ff7-9541-4766-b8df-548fe7f84b8e	\N
27	create	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-01 14:17:00.851328+08	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36	announcements	1	\N
28	authenticate	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-01 14:17:09.663263+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	533a5ff7-9541-4766-b8df-548fe7f84b8e	\N
29	authenticate	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-01 14:17:10.254213+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	533a5ff7-9541-4766-b8df-548fe7f84b8e	\N
30	authenticate	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-01 14:17:15.163908+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	533a5ff7-9541-4766-b8df-548fe7f84b8e	\N
\.


--
-- Data for Name: directus_collections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_collections (collection, icon, note, display_template, hidden, singleton, translations, archive_field, archive_app_filter, archive_value, unarchive_value, sort_field, accountability, color, item_duplication_fields) FROM stdin;
users	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N
announcements	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N
\.


--
-- Data for Name: directus_fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, "group", translations, note, conditions, required) FROM stdin;
1	users	id	\N	input	\N	\N	\N	t	t	\N	full	\N	\N	\N	\N	f
2	users	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	\N	half	\N	\N	\N	\N	f
3	users	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	\N	half	\N	\N	\N	\N	f
4	users	email	\N	input	\N	raw	\N	f	f	\N	full	\N	\N	\N	\N	f
5	users	company	\N	input	\N	raw	\N	f	f	\N	full	\N	\N	\N	\N	f
6	users	name	\N	input	\N	raw	\N	f	f	\N	full	\N	\N	\N	\N	f
7	users	prices	json	tags	\N	labels	\N	f	f	\N	full	\N	\N	\N	\N	f
8	announcements	id	\N	input	\N	\N	\N	t	t	\N	full	\N	\N	\N	\N	f
9	announcements	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	\N	half	\N	\N	\N	\N	f
10	announcements	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	\N	half	\N	\N	\N	\N	f
11	announcements	title	\N	input	\N	raw	\N	f	f	\N	full	\N	\N	\N	\N	f
12	announcements	content	\N	input-rich-text-html	\N	formatted-value	\N	f	f	\N	full	\N	\N	\N	\N	f
\.


--
-- Data for Name: directus_files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_files (id, storage, filename_disk, filename_download, title, type, folder, uploaded_by, uploaded_on, modified_by, modified_on, charset, filesize, width, height, duration, embed, description, location, tags, metadata) FROM stdin;
\.


--
-- Data for Name: directus_folders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_folders (id, name, parent) FROM stdin;
\.


--
-- Data for Name: directus_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_migrations (version, name, "timestamp") FROM stdin;
20201028A	Remove Collection Foreign Keys	2021-09-01 13:56:57.4454+08
20201029A	Remove System Relations	2021-09-01 13:56:57.454011+08
20201029B	Remove System Collections	2021-09-01 13:56:57.461799+08
20201029C	Remove System Fields	2021-09-01 13:56:57.469464+08
20201105A	Add Cascade System Relations	2021-09-01 13:56:57.510826+08
20201105B	Change Webhook URL Type	2021-09-01 13:56:57.523216+08
20210225A	Add Relations Sort Field	2021-09-01 13:56:57.525333+08
20210304A	Remove Locked Fields	2021-09-01 13:56:57.532196+08
20210312A	Webhooks Collections Text	2021-09-01 13:56:57.534365+08
20210331A	Add Refresh Interval	2021-09-01 13:56:57.535807+08
20210415A	Make Filesize Nullable	2021-09-01 13:56:57.538514+08
20210416A	Add Collections Accountability	2021-09-01 13:56:57.54125+08
20210422A	Remove Files Interface	2021-09-01 13:56:57.542761+08
20210506A	Rename Interfaces	2021-09-01 13:56:57.559978+08
20210510A	Restructure Relations	2021-09-01 13:56:57.577432+08
20210518A	Add Foreign Key Constraints	2021-09-01 13:56:57.595936+08
20210519A	Add System Fk Triggers	2021-09-01 13:56:57.619566+08
20210521A	Add Collections Icon Color	2021-09-01 13:56:57.625926+08
20210608A	Add Deep Clone Config	2021-09-01 13:56:57.627575+08
20210626A	Change Filesize Bigint	2021-09-01 13:56:57.634982+08
20210716A	Add Conditions to Fields	2021-09-01 13:56:57.636983+08
20210721A	Add Default Folder	2021-09-01 13:56:57.643938+08
20210802A	Replace Groups	2021-09-01 13:56:57.647461+08
20210803A	Add Required to Fields	2021-09-01 13:56:57.649313+08
20210805A	Update Groups	2021-09-01 13:56:57.651141+08
20210805B	Change Image Metadata Structure	2021-09-01 13:56:57.652936+08
20210811A	Add Geometry Config	2021-09-01 13:56:57.654728+08
\.


--
-- Data for Name: directus_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields, "limit") FROM stdin;
\.


--
-- Data for Name: directus_presets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_presets (id, bookmark, "user", role, collection, search, filters, layout, layout_query, layout_options, refresh_interval) FROM stdin;
1	\N	533a5ff7-9541-4766-b8df-548fe7f84b8e	\N	announcements	\N	\N	tabular	{"tabular":{"page":1}}	\N	\N
\.


--
-- Data for Name: directus_relations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_relations (id, many_collection, many_field, one_collection, one_field, one_collection_field, one_allowed_collections, junction_field, sort_field, one_deselect_action) FROM stdin;
\.


--
-- Data for Name: directus_revisions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_revisions (id, activity, collection, item, data, delta, parent) FROM stdin;
1	2	directus_collections	users	{"singleton":false,"collection":"users"}	{"singleton":false,"collection":"users"}	\N
2	3	directus_fields	1	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"users"}	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"users"}	\N
3	4	directus_fields	2	{"special":"date-created","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"users"}	{"special":"date-created","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"users"}	\N
4	5	directus_fields	3	{"special":"date-updated","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"users"}	{"special":"date-updated","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"users"}	\N
5	6	directus_fields	4	{"hidden":false,"interface":"input","display":"raw","readonly":false,"collection":"users","field":"email"}	{"hidden":false,"interface":"input","display":"raw","readonly":false,"collection":"users","field":"email"}	\N
6	7	directus_fields	5	{"hidden":false,"interface":"input","display":"raw","readonly":false,"collection":"users","field":"company"}	{"hidden":false,"interface":"input","display":"raw","readonly":false,"collection":"users","field":"company"}	\N
7	8	directus_fields	6	{"hidden":false,"interface":"input","display":"raw","readonly":false,"collection":"users","field":"name"}	{"hidden":false,"interface":"input","display":"raw","readonly":false,"collection":"users","field":"name"}	\N
8	9	directus_fields	7	{"hidden":false,"interface":"tags","options":null,"display":"labels","display_options":null,"readonly":false,"special":"json","collection":"users","field":"prices"}	{"hidden":false,"interface":"tags","options":null,"display":"labels","display_options":null,"readonly":false,"special":"json","collection":"users","field":"prices"}	\N
9	10	directus_collections	announcements	{"singleton":false,"collection":"announcements"}	{"singleton":false,"collection":"announcements"}	\N
10	11	directus_fields	8	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"announcements"}	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"announcements"}	\N
11	12	directus_fields	9	{"special":"date-created","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"announcements"}	{"special":"date-created","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"announcements"}	\N
12	13	directus_fields	10	{"special":"date-updated","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"announcements"}	{"special":"date-updated","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"announcements"}	\N
13	14	directus_fields	11	{"hidden":false,"interface":"input","display":"raw","readonly":false,"collection":"announcements","field":"title"}	{"hidden":false,"interface":"input","display":"raw","readonly":false,"collection":"announcements","field":"title"}	\N
14	15	directus_fields	12	{"hidden":false,"interface":"input-rich-text-html","options":null,"display":"formatted-value","display_options":null,"readonly":false,"special":null,"collection":"announcements","field":"content"}	{"hidden":false,"interface":"input-rich-text-html","options":null,"display":"formatted-value","display_options":null,"readonly":false,"special":null,"collection":"announcements","field":"content"}	\N
15	22	users	1	{"email":"tohhongxiang@gmail.com","name":"Toh Hong Xiang"}	{"email":"tohhongxiang@gmail.com","name":"Toh Hong Xiang"}	\N
16	27	announcements	1	{"title":"Test Announcement","content":"<p>This is a test <strong>announcement</strong></p>"}	{"title":"Test Announcement","content":"<p>This is a test <strong>announcement</strong></p>"}	\N
\.


--
-- Data for Name: directus_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_roles (id, name, icon, description, ip_access, enforce_tfa, module_list, collection_list, admin_access, app_access) FROM stdin;
2cf50d96-d4dd-4e60-863d-2fe73fbf1732	Administrator	verified	Initial administrative role with unrestricted App/API access	\N	f	\N	\N	t	t
\.


--
-- Data for Name: directus_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_sessions (token, "user", expires, ip, user_agent) FROM stdin;
a-7czuSsDPopxv5pex-oLW6WBll2QeBivzSsW4qd-ukZdtmpfAIjxUFVvbBO4Qq1	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-08 14:07:40.548+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)
SfR-873MezQG_iT0KKuCJROqEZrcYzbr_ef7jBuYR4GEo1QXpn20adptg8ySGvn6	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-08 14:07:40.666+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)
u1vwfGZeLI7N3sPeV4O551qlgGP7TQFqr8wZRKKJeJVuHaWNNfPH5OfsFA6EwtkC	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-08 14:08:37.766+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)
O9UD1EUsKO99yULQi6Up0xHYPC8UsYnaLE6lFUZExUgNSWtwFTM3LlRCkQZ5Y13n	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-08 14:15:24.355+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)
-2yaHNPUgQzKMI8X94hmOBX3Ihgkkqa7ZU9cqM87hD2EWOAERWYqL0lvPiPFEM2R	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-08 14:15:28.087+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)
1hMxCDMoeVdxQHxglWW4IgOMkbr8XG9dyK1sxWSm16T3Id2pP1jL3hhD1ZVt4Q1Z	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-08 14:15:28.222+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)
5lqDdtB2DFEduHUn0JwcQQueI5J8MKEAERnLDBvr75__pbVi-zvTroCgYni8MBf0	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-08 14:15:28.397+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)
XrrnUOqz8yjsGbL4RZSinDKba-7HGyTLd7nNVnRakEFkvBGb_xJb_nAHrcuDpGU4	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-08 14:15:28.55+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)
RiWP1GAK30R67FfiDaExOnm9SK-eFdw5M14b2xC5wdKV1d-OJuOHjSVTKO8GwWrP	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-08 14:15:29.104+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)
2_05knqBC04BzKV0Gw1re-jjlwnGn8M9yoJmyScs-qKjuBEx4Ee6VDLteWhAHYpq	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-08 14:15:33.831+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)
lbmyl4BaroxvAki6qhGkB9g3SzQZjWQIVW9E4wDwk4yFZdi754BVzCEZwQN-K5aY	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-08 14:17:05.069+08	::1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36
Gy0eI__a0oDzHyh5MMMXkDziinZ8kYycISz5KeJQupJDtqkTtktENMcXvGuKA4sS	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-08 14:17:09.66+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)
LDCeQYQKwA1P2OsLonafpve6kRZDNd0zwOK0QrKN7U9CxYS9VOOubEBxgS_2pkMd	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-08 14:17:10.252+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)
gpMDCpo1kdCHW_OTyH6nN0RsOcRvqrrzYKFyQOqBwEWwp2n2kD6H_S52Mth0924T	533a5ff7-9541-4766-b8df-548fe7f84b8e	2021-09-08 14:17:15.162+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)
\.


--
-- Data for Name: directus_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_settings (id, project_name, project_url, project_color, project_logo, public_foreground, public_background, public_note, auth_login_attempts, auth_password_policy, storage_asset_transform, storage_asset_presets, custom_css, storage_default_folder, basemaps, mapbox_key) FROM stdin;
\.


--
-- Data for Name: directus_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_users (id, first_name, last_name, email, password, location, title, description, tags, avatar, language, theme, tfa_secret, status, role, token, last_access, last_page) FROM stdin;
533a5ff7-9541-4766-b8df-548fe7f84b8e	Admin	User	admin@example.com	$argon2i$v=19$m=4096,t=3,p=1$bDWSjW5yy4PnJf/eAaN8Sw$wnm7cDErORI8dQY/NhoyzGYc62DqVfHX2fh7wI3HuHo	\N	\N	\N	\N	\N	en-US	auto	\N	active	2cf50d96-d4dd-4e60-863d-2fe73fbf1732	\N	2021-09-01 14:17:15.165+08	/collections/announcements
\.


--
-- Data for Name: directus_webhooks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_webhooks (id, name, method, url, status, data, actions, collections) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, date_created, date_updated, email, company, name, prices) FROM stdin;
1	2021-09-01 14:15:28.322+08	\N	tohhongxiang@gmail.com	\N	Toh Hong Xiang	[]
\.


--
-- Name: announcements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.announcements_id_seq', 1, true);


--
-- Name: directus_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_activity_id_seq', 30, true);


--
-- Name: directus_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_fields_id_seq', 12, true);


--
-- Name: directus_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_permissions_id_seq', 1, false);


--
-- Name: directus_presets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_presets_id_seq', 1, true);


--
-- Name: directus_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_relations_id_seq', 1, false);


--
-- Name: directus_revisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_revisions_id_seq', 16, true);


--
-- Name: directus_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_settings_id_seq', 1, false);


--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_webhooks_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: announcements announcements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.announcements
    ADD CONSTRAINT announcements_pkey PRIMARY KEY (id);


--
-- Name: directus_activity directus_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_activity
    ADD CONSTRAINT directus_activity_pkey PRIMARY KEY (id);


--
-- Name: directus_collections directus_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_pkey PRIMARY KEY (collection);


--
-- Name: directus_fields directus_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_fields
    ADD CONSTRAINT directus_fields_pkey PRIMARY KEY (id);


--
-- Name: directus_files directus_files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_pkey PRIMARY KEY (id);


--
-- Name: directus_folders directus_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_pkey PRIMARY KEY (id);


--
-- Name: directus_migrations directus_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_migrations
    ADD CONSTRAINT directus_migrations_pkey PRIMARY KEY (version);


--
-- Name: directus_permissions directus_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_pkey PRIMARY KEY (id);


--
-- Name: directus_presets directus_presets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_pkey PRIMARY KEY (id);


--
-- Name: directus_relations directus_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_relations
    ADD CONSTRAINT directus_relations_pkey PRIMARY KEY (id);


--
-- Name: directus_revisions directus_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_pkey PRIMARY KEY (id);


--
-- Name: directus_roles directus_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_pkey PRIMARY KEY (id);


--
-- Name: directus_sessions directus_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_pkey PRIMARY KEY (token);


--
-- Name: directus_settings directus_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_email_unique UNIQUE (email);


--
-- Name: directus_users directus_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_pkey PRIMARY KEY (id);


--
-- Name: directus_webhooks directus_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: directus_fields directus_fields_group_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_fields
    ADD CONSTRAINT directus_fields_group_foreign FOREIGN KEY ("group") REFERENCES public.directus_fields(id);


--
-- Name: directus_files directus_files_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_folder_foreign FOREIGN KEY (folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_modified_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_modified_by_foreign FOREIGN KEY (modified_by) REFERENCES public.directus_users(id);


--
-- Name: directus_files directus_files_uploaded_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_uploaded_by_foreign FOREIGN KEY (uploaded_by) REFERENCES public.directus_users(id);


--
-- Name: directus_folders directus_folders_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_folders(id);


--
-- Name: directus_permissions directus_permissions_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_activity_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_activity_foreign FOREIGN KEY (activity) REFERENCES public.directus_activity(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_revisions(id);


--
-- Name: directus_sessions directus_sessions_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_settings directus_settings_project_logo_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_project_logo_foreign FOREIGN KEY (project_logo) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_background_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_background_foreign FOREIGN KEY (public_background) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_foreground_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_foreground_foreign FOREIGN KEY (public_foreground) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_storage_default_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_storage_default_folder_foreign FOREIGN KEY (storage_default_folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_users directus_users_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

