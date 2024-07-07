--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0 (Debian 16.0-1.pgdg120+1)
-- Dumped by pg_dump version 16.0 (Debian 16.0-1.pgdg120+1)

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
-- Name: activations; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.activations (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    code character varying(120) NOT NULL,
    completed boolean DEFAULT false NOT NULL,
    completed_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.activations OWNER TO root;

--
-- Name: activations_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.activations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.activations_id_seq OWNER TO root;

--
-- Name: activations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.activations_id_seq OWNED BY public.activations.id;


--
-- Name: admin_notifications; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.admin_notifications (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    action_label character varying(255),
    action_url character varying(255),
    description character varying(400) NOT NULL,
    read_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    permission character varying(191)
);


ALTER TABLE public.admin_notifications OWNER TO root;

--
-- Name: admin_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.admin_notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_notifications_id_seq OWNER TO root;

--
-- Name: admin_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.admin_notifications_id_seq OWNED BY public.admin_notifications.id;


--
-- Name: audit_histories; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.audit_histories (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    module character varying(60) NOT NULL,
    request text,
    action character varying(120) NOT NULL,
    user_agent text,
    ip_address character varying(39),
    reference_user bigint NOT NULL,
    reference_id bigint NOT NULL,
    reference_name character varying(255) NOT NULL,
    type character varying(20) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.audit_histories OWNER TO root;

--
-- Name: audit_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.audit_histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.audit_histories_id_seq OWNER TO root;

--
-- Name: audit_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.audit_histories_id_seq OWNED BY public.audit_histories.id;


--
-- Name: blocks; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.blocks (
    id bigint NOT NULL,
    name character varying(191) NOT NULL,
    alias character varying(191) NOT NULL,
    description character varying(255),
    content text,
    status character varying(60) DEFAULT 'published'::character varying NOT NULL,
    user_id bigint,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.blocks OWNER TO root;

--
-- Name: blocks_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.blocks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.blocks_id_seq OWNER TO root;

--
-- Name: blocks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.blocks_id_seq OWNED BY public.blocks.id;


--
-- Name: blocks_translations; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.blocks_translations (
    lang_code character varying(191) NOT NULL,
    blocks_id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    content text
);


ALTER TABLE public.blocks_translations OWNER TO root;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    name character varying(120) NOT NULL,
    parent_id bigint DEFAULT 0 NOT NULL,
    description character varying(400),
    status character varying(60) DEFAULT 'published'::character varying NOT NULL,
    author_id integer NOT NULL,
    author_type character varying(255) DEFAULT 'Botble\ACL\Models\User'::character varying NOT NULL,
    icon character varying(60),
    "order" smallint DEFAULT 0 NOT NULL,
    is_featured smallint DEFAULT 0 NOT NULL,
    is_default integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.categories OWNER TO root;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO root;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: categories_translations; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.categories_translations (
    lang_code character varying(191) NOT NULL,
    categories_id integer NOT NULL,
    name character varying(255),
    description character varying(400)
);


ALTER TABLE public.categories_translations OWNER TO root;

--
-- Name: contact_replies; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.contact_replies (
    id bigint NOT NULL,
    message text NOT NULL,
    contact_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.contact_replies OWNER TO root;

--
-- Name: contact_replies_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.contact_replies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contact_replies_id_seq OWNER TO root;

--
-- Name: contact_replies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.contact_replies_id_seq OWNED BY public.contact_replies.id;


--
-- Name: contacts; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.contacts (
    id bigint NOT NULL,
    name character varying(60) NOT NULL,
    email character varying(60) NOT NULL,
    phone character varying(60),
    address character varying(120),
    subject character varying(120),
    content text NOT NULL,
    status character varying(60) DEFAULT 'unread'::character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.contacts OWNER TO root;

--
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contacts_id_seq OWNER TO root;

--
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.contacts_id_seq OWNED BY public.contacts.id;


--
-- Name: custom_fields; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.custom_fields (
    id bigint NOT NULL,
    use_for character varying(255) NOT NULL,
    use_for_id bigint NOT NULL,
    field_item_id bigint NOT NULL,
    type character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.custom_fields OWNER TO root;

--
-- Name: custom_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.custom_fields_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.custom_fields_id_seq OWNER TO root;

--
-- Name: custom_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.custom_fields_id_seq OWNED BY public.custom_fields.id;


--
-- Name: custom_fields_translations; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.custom_fields_translations (
    lang_code character varying(191) NOT NULL,
    custom_fields_id integer NOT NULL,
    value text
);


ALTER TABLE public.custom_fields_translations OWNER TO root;

--
-- Name: dashboard_widget_settings; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.dashboard_widget_settings (
    id bigint NOT NULL,
    settings text,
    user_id bigint NOT NULL,
    widget_id bigint NOT NULL,
    "order" integer DEFAULT 0 NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.dashboard_widget_settings OWNER TO root;

--
-- Name: dashboard_widget_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.dashboard_widget_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dashboard_widget_settings_id_seq OWNER TO root;

--
-- Name: dashboard_widget_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.dashboard_widget_settings_id_seq OWNED BY public.dashboard_widget_settings.id;


--
-- Name: dashboard_widgets; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.dashboard_widgets (
    id bigint NOT NULL,
    name character varying(120) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.dashboard_widgets OWNER TO root;

--
-- Name: dashboard_widgets_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.dashboard_widgets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dashboard_widgets_id_seq OWNER TO root;

--
-- Name: dashboard_widgets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.dashboard_widgets_id_seq OWNED BY public.dashboard_widgets.id;


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(191) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO root;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO root;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: field_groups; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.field_groups (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    rules text,
    "order" integer DEFAULT 0 NOT NULL,
    created_by bigint,
    updated_by bigint,
    status character varying(60) DEFAULT 'published'::character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.field_groups OWNER TO root;

--
-- Name: field_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.field_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.field_groups_id_seq OWNER TO root;

--
-- Name: field_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.field_groups_id_seq OWNED BY public.field_groups.id;


--
-- Name: field_items; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.field_items (
    id bigint NOT NULL,
    field_group_id bigint NOT NULL,
    parent_id bigint,
    "order" integer DEFAULT 0,
    title character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    type character varying(100) NOT NULL,
    instructions text,
    options text
);


ALTER TABLE public.field_items OWNER TO root;

--
-- Name: field_items_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.field_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.field_items_id_seq OWNER TO root;

--
-- Name: field_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.field_items_id_seq OWNED BY public.field_items.id;


--
-- Name: galleries; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.galleries (
    id bigint NOT NULL,
    name character varying(120) NOT NULL,
    description text NOT NULL,
    is_featured integer DEFAULT 0 NOT NULL,
    "order" integer DEFAULT 0 NOT NULL,
    image character varying(255),
    user_id bigint NOT NULL,
    status character varying(60) DEFAULT 'published'::character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.galleries OWNER TO root;

--
-- Name: galleries_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.galleries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.galleries_id_seq OWNER TO root;

--
-- Name: galleries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.galleries_id_seq OWNED BY public.galleries.id;


--
-- Name: galleries_translations; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.galleries_translations (
    lang_code character varying(191) NOT NULL,
    galleries_id integer NOT NULL,
    name character varying(255),
    description text
);


ALTER TABLE public.galleries_translations OWNER TO root;

--
-- Name: gallery_meta; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.gallery_meta (
    id bigint NOT NULL,
    images text,
    reference_id bigint NOT NULL,
    reference_type character varying(120) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.gallery_meta OWNER TO root;

--
-- Name: gallery_meta_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.gallery_meta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.gallery_meta_id_seq OWNER TO root;

--
-- Name: gallery_meta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.gallery_meta_id_seq OWNED BY public.gallery_meta.id;


--
-- Name: gallery_meta_translations; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.gallery_meta_translations (
    lang_code character varying(191) NOT NULL,
    gallery_meta_id integer NOT NULL,
    images text
);


ALTER TABLE public.gallery_meta_translations OWNER TO root;

--
-- Name: jobs; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(191) NOT NULL,
    payload text NOT NULL,
    attempts integer NOT NULL,
    reserved_at bigint,
    available_at bigint NOT NULL,
    created_at bigint NOT NULL
);


ALTER TABLE public.jobs OWNER TO root;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_id_seq OWNER TO root;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: language_meta; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.language_meta (
    lang_meta_id bigint NOT NULL,
    lang_meta_code text,
    lang_meta_origin character varying(255) NOT NULL,
    reference_id bigint NOT NULL,
    reference_type character varying(120) NOT NULL
);


ALTER TABLE public.language_meta OWNER TO root;

--
-- Name: language_meta_lang_meta_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

ALTER TABLE public.language_meta ALTER COLUMN lang_meta_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.language_meta_lang_meta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: languages; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.languages (
    lang_id bigint NOT NULL,
    lang_name character varying(120) NOT NULL,
    lang_locale character varying(20) NOT NULL,
    lang_code character varying(20) NOT NULL,
    lang_flag character varying(20),
    lang_is_default integer DEFAULT 0 NOT NULL,
    lang_order integer DEFAULT 0 NOT NULL,
    lang_is_rtl integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.languages OWNER TO root;

--
-- Name: languages_lang_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

ALTER TABLE public.languages ALTER COLUMN lang_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.languages_lang_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: media_files; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.media_files (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    folder_id bigint DEFAULT 0 NOT NULL,
    mime_type character varying(120) NOT NULL,
    size integer NOT NULL,
    url character varying(255) NOT NULL,
    options text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    alt character varying(255)
);


ALTER TABLE public.media_files OWNER TO root;

--
-- Name: media_files_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.media_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.media_files_id_seq OWNER TO root;

--
-- Name: media_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.media_files_id_seq OWNED BY public.media_files.id;


--
-- Name: media_folders; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.media_folders (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    name character varying(191),
    slug character varying(191),
    parent_id integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    color character varying(255)
);


ALTER TABLE public.media_folders OWNER TO root;

--
-- Name: media_folders_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.media_folders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.media_folders_id_seq OWNER TO root;

--
-- Name: media_folders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.media_folders_id_seq OWNED BY public.media_folders.id;


--
-- Name: media_settings; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.media_settings (
    id bigint NOT NULL,
    key character varying(120) NOT NULL,
    value text,
    media_id integer,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.media_settings OWNER TO root;

--
-- Name: media_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.media_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.media_settings_id_seq OWNER TO root;

--
-- Name: media_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.media_settings_id_seq OWNED BY public.media_settings.id;


--
-- Name: member_activity_logs; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.member_activity_logs (
    id bigint NOT NULL,
    action character varying(120) NOT NULL,
    user_agent text,
    reference_url character varying(255),
    reference_name character varying(255),
    ip_address character varying(39),
    member_id bigint NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.member_activity_logs OWNER TO root;

--
-- Name: member_activity_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.member_activity_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.member_activity_logs_id_seq OWNER TO root;

--
-- Name: member_activity_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.member_activity_logs_id_seq OWNED BY public.member_activity_logs.id;


--
-- Name: member_password_resets; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.member_password_resets (
    email character varying(191) NOT NULL,
    token character varying(191) NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.member_password_resets OWNER TO root;

--
-- Name: members; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.members (
    id bigint NOT NULL,
    first_name character varying(120) NOT NULL,
    last_name character varying(120) NOT NULL,
    description text,
    gender character varying(20),
    email character varying(191) NOT NULL,
    password character varying(191) NOT NULL,
    avatar_id bigint,
    dob date,
    phone character varying(25),
    confirmed_at timestamp without time zone,
    email_verify_token character varying(120),
    remember_token character varying(100),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.members OWNER TO root;

--
-- Name: members_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.members_id_seq OWNER TO root;

--
-- Name: members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.members_id_seq OWNED BY public.members.id;


--
-- Name: menu_locations; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.menu_locations (
    id bigint NOT NULL,
    menu_id bigint NOT NULL,
    location character varying(120) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.menu_locations OWNER TO root;

--
-- Name: menu_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.menu_locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menu_locations_id_seq OWNER TO root;

--
-- Name: menu_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.menu_locations_id_seq OWNED BY public.menu_locations.id;


--
-- Name: menu_nodes; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.menu_nodes (
    id bigint NOT NULL,
    menu_id bigint NOT NULL,
    parent_id bigint DEFAULT 0 NOT NULL,
    reference_id bigint,
    reference_type character varying(255),
    url character varying(120),
    icon_font character varying(50),
    "position" integer DEFAULT 0 NOT NULL,
    title character varying(120),
    css_class character varying(120),
    target character varying(20) DEFAULT '_self'::character varying NOT NULL,
    has_child integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.menu_nodes OWNER TO root;

--
-- Name: menu_nodes_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.menu_nodes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menu_nodes_id_seq OWNER TO root;

--
-- Name: menu_nodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.menu_nodes_id_seq OWNED BY public.menu_nodes.id;


--
-- Name: menus; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.menus (
    id bigint NOT NULL,
    name character varying(120) NOT NULL,
    slug character varying(120),
    status character varying(60) DEFAULT 'published'::character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.menus OWNER TO root;

--
-- Name: menus_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.menus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menus_id_seq OWNER TO root;

--
-- Name: menus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.menus_id_seq OWNED BY public.menus.id;


--
-- Name: meta_boxes; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.meta_boxes (
    id bigint NOT NULL,
    meta_key character varying(255) NOT NULL,
    meta_value text,
    reference_id bigint NOT NULL,
    reference_type character varying(120) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.meta_boxes OWNER TO root;

--
-- Name: meta_boxes_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.meta_boxes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.meta_boxes_id_seq OWNER TO root;

--
-- Name: meta_boxes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.meta_boxes_id_seq OWNED BY public.meta_boxes.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.migrations (
    id bigint NOT NULL,
    migration character varying(191) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO root;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO root;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: pages; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.pages (
    id bigint NOT NULL,
    name character varying(120) NOT NULL,
    content text,
    user_id integer NOT NULL,
    image character varying(255),
    template character varying(60),
    is_featured smallint DEFAULT 0 NOT NULL,
    description character varying(400),
    status character varying(60) DEFAULT 'published'::character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.pages OWNER TO root;

--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pages_id_seq OWNER TO root;

--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.pages_id_seq OWNED BY public.pages.id;


--
-- Name: pages_translations; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.pages_translations (
    lang_code character varying(191) NOT NULL,
    pages_id integer NOT NULL,
    name character varying(255),
    description character varying(400),
    content text
);


ALTER TABLE public.pages_translations OWNER TO root;

--
-- Name: password_resets; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.password_resets (
    email character varying(191) NOT NULL,
    token character varying(191) NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.password_resets OWNER TO root;

--
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(191) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(191) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp without time zone,
    expires_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO root;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.personal_access_tokens_id_seq OWNER TO root;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- Name: post_categories; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.post_categories (
    id bigint NOT NULL,
    category_id bigint NOT NULL,
    post_id bigint NOT NULL
);


ALTER TABLE public.post_categories OWNER TO root;

--
-- Name: post_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.post_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.post_categories_id_seq OWNER TO root;

--
-- Name: post_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.post_categories_id_seq OWNED BY public.post_categories.id;


--
-- Name: post_tags; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.post_tags (
    id bigint NOT NULL,
    tag_id bigint NOT NULL,
    post_id bigint NOT NULL
);


ALTER TABLE public.post_tags OWNER TO root;

--
-- Name: post_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.post_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.post_tags_id_seq OWNER TO root;

--
-- Name: post_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.post_tags_id_seq OWNED BY public.post_tags.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.posts (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(400),
    content text,
    status character varying(60) DEFAULT 'published'::character varying NOT NULL,
    author_id integer NOT NULL,
    author_type character varying(255) DEFAULT 'Botble\ACL\Models\User'::character varying NOT NULL,
    is_featured integer DEFAULT 0 NOT NULL,
    image character varying(255),
    views bigint DEFAULT 0 NOT NULL,
    format_type character varying(30),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.posts OWNER TO root;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.posts_id_seq OWNER TO root;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: posts_translations; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.posts_translations (
    lang_code character varying(191) NOT NULL,
    posts_id integer NOT NULL,
    name character varying(255),
    description character varying(400),
    content text
);


ALTER TABLE public.posts_translations OWNER TO root;

--
-- Name: request_logs; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.request_logs (
    id bigint NOT NULL,
    status_code integer,
    url character varying(191),
    count integer DEFAULT 0 NOT NULL,
    user_id character varying(255),
    referrer text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.request_logs OWNER TO root;

--
-- Name: request_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.request_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.request_logs_id_seq OWNER TO root;

--
-- Name: request_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.request_logs_id_seq OWNED BY public.request_logs.id;


--
-- Name: revisions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.revisions (
    id bigint NOT NULL,
    revisionable_type character varying(191) NOT NULL,
    revisionable_id integer NOT NULL,
    user_id integer,
    key character varying(191) NOT NULL,
    old_value text,
    new_value text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.revisions OWNER TO root;

--
-- Name: revisions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.revisions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.revisions_id_seq OWNER TO root;

--
-- Name: revisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.revisions_id_seq OWNED BY public.revisions.id;


--
-- Name: role_users; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.role_users (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    role_id bigint NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.role_users OWNER TO root;

--
-- Name: role_users_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.role_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.role_users_id_seq OWNER TO root;

--
-- Name: role_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.role_users_id_seq OWNED BY public.role_users.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    slug character varying(120) NOT NULL,
    name character varying(120) NOT NULL,
    permissions text,
    description character varying(255),
    is_default integer DEFAULT 0 NOT NULL,
    created_by bigint NOT NULL,
    updated_by bigint NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.roles OWNER TO root;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO root;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: settings; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.settings (
    id bigint NOT NULL,
    key character varying(191) NOT NULL,
    value text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.settings OWNER TO root;

--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.settings_id_seq OWNER TO root;

--
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.settings_id_seq OWNED BY public.settings.id;


--
-- Name: slugs; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.slugs (
    id bigint NOT NULL,
    key character varying(255) NOT NULL,
    reference_id bigint NOT NULL,
    reference_type character varying(255) NOT NULL,
    prefix character varying(120) DEFAULT ''::character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.slugs OWNER TO root;

--
-- Name: slugs_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.slugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.slugs_id_seq OWNER TO root;

--
-- Name: slugs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.slugs_id_seq OWNED BY public.slugs.id;


--
-- Name: slugs_translations; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.slugs_translations (
    lang_code character varying(20) NOT NULL,
    slugs_id bigint NOT NULL,
    key character varying(255),
    prefix character varying(120) DEFAULT ''::character varying
);


ALTER TABLE public.slugs_translations OWNER TO root;

--
-- Name: tags; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.tags (
    id bigint NOT NULL,
    name character varying(120) NOT NULL,
    author_id integer NOT NULL,
    author_type character varying(255) DEFAULT 'Botble\ACL\Models\User'::character varying NOT NULL,
    description character varying(400) DEFAULT ''::character varying,
    status character varying(60) DEFAULT 'published'::character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.tags OWNER TO root;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tags_id_seq OWNER TO root;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- Name: tags_translations; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.tags_translations (
    lang_code character varying(191) NOT NULL,
    tags_id integer NOT NULL,
    name character varying(255),
    description character varying(400)
);


ALTER TABLE public.tags_translations OWNER TO root;

--
-- Name: translations; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.translations (
    id bigint NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    locale character varying(191) NOT NULL,
    "group" character varying(191) NOT NULL,
    key character varying(191) NOT NULL,
    value text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.translations OWNER TO root;

--
-- Name: translations_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.translations_id_seq OWNER TO root;

--
-- Name: translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.translations_id_seq OWNED BY public.translations.id;


--
-- Name: user_meta; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.user_meta (
    id bigint NOT NULL,
    key character varying(191),
    value character varying(191),
    user_id bigint NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.user_meta OWNER TO root;

--
-- Name: user_meta_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.user_meta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_meta_id_seq OWNER TO root;

--
-- Name: user_meta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.user_meta_id_seq OWNED BY public.user_meta.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying(191) NOT NULL,
    email_verified_at timestamp without time zone,
    password character varying(191),
    remember_token character varying(100),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    first_name character varying(191),
    last_name character varying(191),
    username character varying(60),
    avatar_id bigint,
    super_user smallint DEFAULT 0 NOT NULL,
    manage_supers smallint DEFAULT 0 NOT NULL,
    permissions text,
    last_login timestamp without time zone
);


ALTER TABLE public.users OWNER TO root;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO root;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: widgets; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.widgets (
    id bigint NOT NULL,
    widget_id character varying(120) NOT NULL,
    sidebar_id character varying(120) NOT NULL,
    theme character varying(120) NOT NULL,
    "position" integer DEFAULT 0 NOT NULL,
    data text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.widgets OWNER TO root;

--
-- Name: widgets_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.widgets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.widgets_id_seq OWNER TO root;

--
-- Name: widgets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.widgets_id_seq OWNED BY public.widgets.id;


--
-- Name: activations id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.activations ALTER COLUMN id SET DEFAULT nextval('public.activations_id_seq'::regclass);


--
-- Name: admin_notifications id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.admin_notifications ALTER COLUMN id SET DEFAULT nextval('public.admin_notifications_id_seq'::regclass);


--
-- Name: audit_histories id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.audit_histories ALTER COLUMN id SET DEFAULT nextval('public.audit_histories_id_seq'::regclass);


--
-- Name: blocks id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.blocks ALTER COLUMN id SET DEFAULT nextval('public.blocks_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: contact_replies id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.contact_replies ALTER COLUMN id SET DEFAULT nextval('public.contact_replies_id_seq'::regclass);


--
-- Name: contacts id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.contacts ALTER COLUMN id SET DEFAULT nextval('public.contacts_id_seq'::regclass);


--
-- Name: custom_fields id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.custom_fields ALTER COLUMN id SET DEFAULT nextval('public.custom_fields_id_seq'::regclass);


--
-- Name: dashboard_widget_settings id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.dashboard_widget_settings ALTER COLUMN id SET DEFAULT nextval('public.dashboard_widget_settings_id_seq'::regclass);


--
-- Name: dashboard_widgets id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.dashboard_widgets ALTER COLUMN id SET DEFAULT nextval('public.dashboard_widgets_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: field_groups id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.field_groups ALTER COLUMN id SET DEFAULT nextval('public.field_groups_id_seq'::regclass);


--
-- Name: field_items id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.field_items ALTER COLUMN id SET DEFAULT nextval('public.field_items_id_seq'::regclass);


--
-- Name: galleries id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.galleries ALTER COLUMN id SET DEFAULT nextval('public.galleries_id_seq'::regclass);


--
-- Name: gallery_meta id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.gallery_meta ALTER COLUMN id SET DEFAULT nextval('public.gallery_meta_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: media_files id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.media_files ALTER COLUMN id SET DEFAULT nextval('public.media_files_id_seq'::regclass);


--
-- Name: media_folders id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.media_folders ALTER COLUMN id SET DEFAULT nextval('public.media_folders_id_seq'::regclass);


--
-- Name: media_settings id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.media_settings ALTER COLUMN id SET DEFAULT nextval('public.media_settings_id_seq'::regclass);


--
-- Name: member_activity_logs id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.member_activity_logs ALTER COLUMN id SET DEFAULT nextval('public.member_activity_logs_id_seq'::regclass);


--
-- Name: members id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.members ALTER COLUMN id SET DEFAULT nextval('public.members_id_seq'::regclass);


--
-- Name: menu_locations id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.menu_locations ALTER COLUMN id SET DEFAULT nextval('public.menu_locations_id_seq'::regclass);


--
-- Name: menu_nodes id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.menu_nodes ALTER COLUMN id SET DEFAULT nextval('public.menu_nodes_id_seq'::regclass);


--
-- Name: menus id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.menus ALTER COLUMN id SET DEFAULT nextval('public.menus_id_seq'::regclass);


--
-- Name: meta_boxes id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.meta_boxes ALTER COLUMN id SET DEFAULT nextval('public.meta_boxes_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: pages id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.pages ALTER COLUMN id SET DEFAULT nextval('public.pages_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- Name: post_categories id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.post_categories ALTER COLUMN id SET DEFAULT nextval('public.post_categories_id_seq'::regclass);


--
-- Name: post_tags id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.post_tags ALTER COLUMN id SET DEFAULT nextval('public.post_tags_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: request_logs id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.request_logs ALTER COLUMN id SET DEFAULT nextval('public.request_logs_id_seq'::regclass);


--
-- Name: revisions id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.revisions ALTER COLUMN id SET DEFAULT nextval('public.revisions_id_seq'::regclass);


--
-- Name: role_users id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.role_users ALTER COLUMN id SET DEFAULT nextval('public.role_users_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);


--
-- Name: slugs id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.slugs ALTER COLUMN id SET DEFAULT nextval('public.slugs_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- Name: translations id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.translations ALTER COLUMN id SET DEFAULT nextval('public.translations_id_seq'::regclass);


--
-- Name: user_meta id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_meta ALTER COLUMN id SET DEFAULT nextval('public.user_meta_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: widgets id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.widgets ALTER COLUMN id SET DEFAULT nextval('public.widgets_id_seq'::regclass);


--
-- Data for Name: activations; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.activations (id, user_id, code, completed, completed_at, created_at, updated_at) FROM stdin;
1	1	tmJvXOeI7VNxOcW8PB6qk6Ry6VdNxBur	t	2022-09-26 08:27:42	2022-09-26 08:27:42	2022-09-26 08:27:42
2	1	c3LF3np2s8gk8lx2SAr8Fgbxb16BzWfL	t	2022-09-26 11:11:01	2022-09-26 11:11:01	2022-09-26 11:11:01
3	1	66O1c1rIffZkHLvntElqd2EiLvT8LHdD	t	2022-09-26 11:11:27	2022-09-26 11:11:27	2022-09-26 11:11:27
4	1	74Ku4jUPdokd3cUnavBbYbGHL5myXKDl	t	2022-09-26 11:15:25	2022-09-26 11:15:25	2022-09-26 11:15:25
5	1	LQziMej3Q4NEvtjwKEkNIeL86n0oe74a	t	2022-09-28 04:06:40	2022-09-28 04:06:40	2022-09-28 04:06:40
6	1	OFvDiisn7YTjAw9RCDc6T2kQ6I7mhoHU	t	2022-09-28 04:14:10	2022-09-28 04:14:10	2022-09-28 04:14:10
7	1	9rCMR0eZ6DBrmed9gxKiLa7IeAr708X8	t	2022-10-03 08:02:05	2022-10-03 08:02:05	2022-10-03 08:02:05
8	1	coXG69QPH7THG6FRWfC8Mwhv3fbFPm40	t	2022-10-04 06:38:46	2022-10-04 06:38:46	2022-10-04 06:38:46
\.


--
-- Data for Name: admin_notifications; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.admin_notifications (id, title, action_label, action_url, description, read_at, created_at, updated_at, permission) FROM stdin;
\.


--
-- Data for Name: audit_histories; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.audit_histories (id, user_id, module, request, action, user_agent, ip_address, reference_user, reference_id, reference_name, type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: blocks; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.blocks (id, name, alias, description, content, status, user_id, created_at, updated_at) FROM stdin;
1	Dr. Christop Turner	dr-christop-turner	Aut rerum repellat iusto harum.	Eum et nam earum laudantium non. Sint magnam qui tempore libero consectetur rerum tempora dolorem. Eaque ut cum tempora. Similique cum totam rem ut sit debitis. Eum ipsa ad dolores id quasi ducimus architecto. Est voluptatem doloremque et nemo. Est nihil eum voluptas deleniti. Repellendus culpa quo exercitationem molestiae reprehenderit.	published	\N	2022-10-04 06:38:50	2022-10-04 06:38:50
2	Angelita Block	angelita-block	Doloremque explicabo adipisci et iste voluptates.	Voluptatum ipsum rem voluptas rerum qui sit. Quos autem dignissimos enim quia. Consectetur error fuga sunt quaerat. Unde qui nam delectus accusamus omnis eius itaque. Deleniti iure eos dicta doloremque autem aut corporis accusantium. Veritatis qui in est in. Et inventore sit voluptates dolor. Impedit enim dicta ut quod ut aliquam fugit. Earum consequatur explicabo culpa. Et deserunt minus vel est beatae fugit.	published	\N	2022-10-04 06:38:50	2022-10-04 06:38:50
3	Nina Carter	nina-carter	Minima impedit quibusdam debitis.	Ullam a inventore voluptas totam facilis doloremque. In at blanditiis dignissimos at sint. Animi totam consequatur reprehenderit occaecati perferendis unde rem. Doloribus nam autem quis aspernatur autem. Atque totam qui accusantium aliquam voluptatem accusamus labore. Ut placeat eius rerum. Earum qui et totam enim accusantium et deserunt sed. Deserunt aspernatur non dolor quis. Non nihil et est adipisci quia. Deserunt laboriosam delectus est dicta.	published	\N	2022-10-04 06:38:50	2022-10-04 06:38:50
4	Cristina Hill	cristina-hill	Nihil voluptatem necessitatibus laudantium.	Expedita voluptatibus voluptatem quia asperiores necessitatibus rerum dolorem. Ut ad recusandae odio nemo tempora. Et tenetur aut non laudantium ipsa. Aut aperiam quia porro modi voluptate ea. Laudantium ut tempora est sit pariatur ea et. A ut qui delectus et. Voluptatum vitae nemo sint et nisi itaque sint voluptatem. Sapiente autem nobis veniam rerum qui ut omnis sed.	published	\N	2022-10-04 06:38:50	2022-10-04 06:38:50
5	Mallory Conroy	mallory-conroy	Odio sunt excepturi omnis quo et nulla.	Ut quis quia non aut qui. Distinctio quibusdam aut tempore aut. Perferendis suscipit consequuntur nesciunt ut. Molestiae eligendi dolores et unde dolorem. Pariatur et aut placeat necessitatibus vitae totam doloribus. Quia vel a in sunt architecto. Ratione sed voluptate ad iste qui. Est asperiores aliquid in iste nam et. Aut ut molestias vel pariatur. Impedit ipsum earum aliquid aperiam.	published	\N	2022-10-04 06:38:50	2022-10-04 06:38:50
\.


--
-- Data for Name: blocks_translations; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.blocks_translations (lang_code, blocks_id, name, description, content) FROM stdin;
vi	1	Dr. Christop Turner	Aut rerum repellat iusto harum.	Eum et nam earum laudantium non. Sint magnam qui tempore libero consectetur rerum tempora dolorem. Eaque ut cum tempora. Similique cum totam rem ut sit debitis. Eum ipsa ad dolores id quasi ducimus architecto. Est voluptatem doloremque et nemo. Est nihil eum voluptas deleniti. Repellendus culpa quo exercitationem molestiae reprehenderit.
vi	2	Angelita Block	Doloremque explicabo adipisci et iste voluptates.	Voluptatum ipsum rem voluptas rerum qui sit. Quos autem dignissimos enim quia. Consectetur error fuga sunt quaerat. Unde qui nam delectus accusamus omnis eius itaque. Deleniti iure eos dicta doloremque autem aut corporis accusantium. Veritatis qui in est in. Et inventore sit voluptates dolor. Impedit enim dicta ut quod ut aliquam fugit. Earum consequatur explicabo culpa. Et deserunt minus vel est beatae fugit.
vi	3	Nina Carter	Minima impedit quibusdam debitis.	Ullam a inventore voluptas totam facilis doloremque. In at blanditiis dignissimos at sint. Animi totam consequatur reprehenderit occaecati perferendis unde rem. Doloribus nam autem quis aspernatur autem. Atque totam qui accusantium aliquam voluptatem accusamus labore. Ut placeat eius rerum. Earum qui et totam enim accusantium et deserunt sed. Deserunt aspernatur non dolor quis. Non nihil et est adipisci quia. Deserunt laboriosam delectus est dicta.
vi	4	Cristina Hill	Nihil voluptatem necessitatibus laudantium.	Expedita voluptatibus voluptatem quia asperiores necessitatibus rerum dolorem. Ut ad recusandae odio nemo tempora. Et tenetur aut non laudantium ipsa. Aut aperiam quia porro modi voluptate ea. Laudantium ut tempora est sit pariatur ea et. A ut qui delectus et. Voluptatum vitae nemo sint et nisi itaque sint voluptatem. Sapiente autem nobis veniam rerum qui ut omnis sed.
vi	5	Mallory Conroy	Odio sunt excepturi omnis quo et nulla.	Ut quis quia non aut qui. Distinctio quibusdam aut tempore aut. Perferendis suscipit consequuntur nesciunt ut. Molestiae eligendi dolores et unde dolorem. Pariatur et aut placeat necessitatibus vitae totam doloribus. Quia vel a in sunt architecto. Ratione sed voluptate ad iste qui. Est asperiores aliquid in iste nam et. Aut ut molestias vel pariatur. Impedit ipsum earum aliquid aperiam.
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.categories (id, name, parent_id, description, status, author_id, author_type, icon, "order", is_featured, is_default, created_at, updated_at) FROM stdin;
1	Design	0	Fugiat beatae nulla nihil quos accusantium. Laborum ad recusandae ut corporis ut et voluptas. Asperiores distinctio quos exercitationem unde enim tempore.	published	1	Botble\\ACL\\Models\\User	NULL	0	0	1	2022-10-04 06:38:48	2022-10-04 06:38:48
2	Lifestyle	0	Corrupti similique sunt omnis nemo et dicta veritatis. Atque quasi quis tempora illum magnam facilis sunt occaecati. Et voluptas dignissimos molestiae pariatur magni ratione cum.	published	1	Botble\\ACL\\Models\\User	NULL	0	1	0	2022-10-04 06:38:48	2022-10-04 06:38:48
3	Travel Tips	2	Soluta est sequi provident nostrum ut consequatur praesentium aut. Aut sit quae qui magnam impedit a consequatur. Sunt voluptatem et est est perspiciatis et.	published	1	Botble\\ACL\\Models\\User	NULL	0	0	0	2022-10-04 06:38:48	2022-10-04 06:38:48
4	Healthy	0	Delectus iste similique est ex doloribus. Recusandae corrupti reiciendis et. Eveniet aliquid expedita fugit qui velit recusandae nemo quia.	published	1	Botble\\ACL\\Models\\User	NULL	0	1	0	2022-10-04 06:38:48	2022-10-04 06:38:48
5	Travel Tips	4	Id aut eius non doloribus et qui. Cupiditate sapiente explicabo labore nobis autem. Ut assumenda et voluptas ipsam tempore.	published	1	Botble\\ACL\\Models\\User	NULL	0	0	0	2022-10-04 06:38:48	2022-10-04 06:38:48
6	Hotel	0	Aut natus tempore occaecati dolorem maxime ipsam. Quis dolor vel nisi eos dolorem qui. Modi praesentium illo est vitae.	published	1	Botble\\ACL\\Models\\User	NULL	0	1	0	2022-10-04 06:38:48	2022-10-04 06:38:48
7	Nature	6	Consequatur et doloribus et non rerum tempore. Provident nobis rerum officiis ipsum. Et sunt saepe voluptas. Minus et repellendus quod molestias. Recusandae ipsam quis explicabo accusamus nobis.	published	1	Botble\\ACL\\Models\\User	NULL	0	0	0	2022-10-04 06:38:48	2022-10-04 06:38:48
\.


--
-- Data for Name: categories_translations; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.categories_translations (lang_code, categories_id, name, description) FROM stdin;
vi	1	Phong cách sống	NULL
vi	2	Sức khỏe	NULL
vi	3	Món ngon	NULL
vi	4	Sức khỏe	NULL
vi	5	Mẹo du lịch	NULL
vi	6	Khách sạn	NULL
vi	7	Thiên nhiên	NULL
\.


--
-- Data for Name: contact_replies; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.contact_replies (id, message, contact_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.contacts (id, name, email, phone, address, subject, content, status, created_at, updated_at) FROM stdin;
1	Patricia Windler	raphaelle.ankunding@example.com	1-949-901-5669	89912 Urban Common\nNorth Gwendolyn, NJ 75295-4757	Quia assumenda quam voluptatem ex similique qui.	Quia excepturi id atque sed laborum sunt. Sint cupiditate nulla ut mollitia. Quidem in ut repellendus numquam. Alias incidunt in corrupti vitae et voluptatem. Et rerum labore repudiandae eum quidem. Pariatur sunt vel dolor voluptas et dolorem qui delectus. Consequatur vel itaque qui provident ratione impedit sed sunt.	unread	2022-10-04 06:38:50	2022-10-04 06:38:50
2	Laurel Kovacek	qharris@example.net	540-510-0902	990 Goodwin Estates\nFrederikchester, SD 15536	Quasi tenetur molestiae est fugit sed enim dolor.	Perferendis maxime occaecati doloremque. Illo amet veritatis alias dicta omnis eos. Nam ut dolores placeat autem saepe sunt non. Fuga neque quia aut sed aut id labore sunt. Distinctio tempore et aperiam placeat sint aperiam. Doloribus illum aspernatur odit consequatur laborum consequatur. Ratione asperiores in dolor voluptas accusamus dolor officiis. Quia voluptatum est consequatur distinctio dolorem. Corrupti ut aut at ea magni laboriosam.	read	2022-10-04 06:38:50	2022-10-04 06:38:50
3	Mrs. Felicita Stamm	valentin92@example.net	(757) 530-1798	92057 Mante Branch Apt. 283\nSwiftport, VA 91611-7445	Expedita enim esse modi eligendi et.	Ratione quod cupiditate dolor tempore culpa aspernatur enim ab. Dolores aspernatur pariatur quae fugiat. Dolores culpa quas autem id. A fugit et vel. Repellendus excepturi pariatur quia ut sint. Eos sint nisi totam vel enim vel omnis. Magni est et asperiores dolor. Labore ipsam sint quia qui eum consequatur minima.	read	2022-10-04 06:38:50	2022-10-04 06:38:50
4	Noble Pagac	rbreitenberg@example.org	+1-530-971-6121	258 Dicki Rapids\nWisozkland, MN 80562-8530	Id reprehenderit qui est.	Amet quia ea in quas. Nihil ut at sit iste consequatur quae voluptatem. Laboriosam sunt velit error praesentium voluptas ex. Sint aut sint asperiores eveniet veritatis et ullam. Architecto praesentium aliquam rerum hic delectus recusandae. Quis qui cupiditate officia sed voluptatem. Et quae totam non et mollitia eos magnam. Sunt consectetur est temporibus dignissimos sit sunt suscipit.	unread	2022-10-04 06:38:50	2022-10-04 06:38:50
5	Mr. Tanner Wilkinson II	carter.eda@example.org	726.320.0186	961 Roob Brook\nEulahview, AK 02388-1999	Tempora dolor quia quas cum et sequi.	Eveniet recusandae rerum ut ab. Quo animi a sapiente est. Magnam laborum dolorum sit. Ab voluptatem voluptas sed enim. Et at distinctio mollitia a aut explicabo sit. Doloribus fugiat rerum iusto accusamus. Eius qui nostrum autem aut. Rerum eum itaque a voluptatem fugit omnis eveniet. Ut perferendis provident excepturi cum magnam occaecati. Voluptas quaerat quia sed eius culpa qui ab. Voluptatem porro omnis corrupti at.	unread	2022-10-04 06:38:50	2022-10-04 06:38:50
6	Dr. Stella Emmerich Jr.	omayert@example.com	947-779-0420	415 Schmitt View Suite 712\nHahnshire, CT 59112-0676	Facere ut aliquid magnam beatae sint laudantium.	Vel et ut veritatis est sit. Quia consequuntur omnis corrupti non culpa. Maxime rerum sed molestias recusandae alias. Nesciunt natus qui earum quo. Quod quibusdam consectetur enim dignissimos ducimus. Dolore quam adipisci id tempora tenetur. Sed quia cumque reiciendis in voluptates debitis. Incidunt distinctio ea inventore et exercitationem. Maiores consequatur corrupti eum vel labore et.	unread	2022-10-04 06:38:50	2022-10-04 06:38:50
7	Letitia Baumbach	enid.kulas@example.com	1-308-534-0007	80226 Glover Manors\nJovannymouth, SD 28784-8601	Est facilis temporibus quaerat rerum.	Iusto at ullam voluptas deleniti omnis. Hic dolor quibusdam quia qui adipisci asperiores et quibusdam. Sunt qui ea qui. Ullam autem quibusdam voluptates doloremque nulla ea et maiores. Officia quia sit numquam voluptas facere aut sit. Suscipit ex est aut nam impedit rem quae. Mollitia animi et in ratione quod. Ea laborum corporis mollitia doloremque. Possimus beatae nihil ea tempora hic voluptatem sint debitis.	unread	2022-10-04 06:38:50	2022-10-04 06:38:50
8	Chanel Beer V	skautzer@example.org	1-657-820-7039	462 Monica Forks Suite 133\nAdalbertoview, MI 19767	Aperiam quia ea nihil aliquid commodi et.	Tempora similique qui et repellat eligendi aut praesentium aliquid. Voluptatibus voluptas id debitis dolore ut quia cum. Maiores voluptas ullam molestiae commodi. Reprehenderit excepturi ut suscipit et tenetur maxime necessitatibus animi. Minus ex dolorem voluptatem voluptas doloremque et tempore. Rem iure cupiditate qui inventore impedit officia eos.	read	2022-10-04 06:38:50	2022-10-04 06:38:50
9	Mr. Toby Little	will.santino@example.net	+1 (434) 700-0354	5618 Phyllis Ferry\nPricehaven, KY 97519	Molestiae earum aliquam ut eveniet.	Magnam dolorem libero et placeat. Qui quis dicta accusamus rem eum. Autem dolore dolores id odit. Aut labore ullam placeat. Consequatur modi vero vitae sed vero ipsam ullam perferendis. Sunt aut saepe voluptas neque. Quo consequuntur veniam sunt dolore placeat quos. Eveniet aut et dolorem possimus consectetur iste atque omnis. Iusto rem est rem temporibus ipsa quam delectus. Deserunt distinctio dolores autem quo. Odit aut quia iusto sit. Laborum ab sunt aut qui. Ut a earum odit aut quas.	unread	2022-10-04 06:38:50	2022-10-04 06:38:50
10	Angie Nikolaus Jr.	eileen.raynor@example.org	(442) 476-3958	1095 Wintheiser Isle Suite 435\nPriscillachester, TX 88506	Et enim voluptatem ea cumque a qui illum.	Necessitatibus animi dolorum ab quod aut voluptatem quo sunt. Natus dicta quisquam aut temporibus molestiae fugit corporis recusandae. Non sunt autem illo vitae maiores et. Aliquam in tempore eaque aliquam velit quis expedita nesciunt. Consequatur ducimus qui eum unde voluptas. Magni suscipit praesentium velit eum. Perspiciatis sequi delectus assumenda repellat aut omnis. Sequi totam pariatur odit reprehenderit quisquam. Occaecati quam eum dolor atque temporibus.	unread	2022-10-04 06:38:50	2022-10-04 06:38:50
\.


--
-- Data for Name: custom_fields; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.custom_fields (id, use_for, use_for_id, field_item_id, type, slug, value) FROM stdin;
\.


--
-- Data for Name: custom_fields_translations; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.custom_fields_translations (lang_code, custom_fields_id, value) FROM stdin;
\.


--
-- Data for Name: dashboard_widget_settings; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.dashboard_widget_settings (id, settings, user_id, widget_id, "order", status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: dashboard_widgets; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.dashboard_widgets (id, name, created_at, updated_at) FROM stdin;
12	widget_total_themes	2024-06-30 02:41:43	2024-06-30 02:41:43
13	widget_total_users	2024-06-30 02:41:43	2024-06-30 02:41:43
14	widget_total_plugins	2024-06-30 02:41:43	2024-06-30 02:41:43
15	widget_total_pages	2024-06-30 02:41:43	2024-06-30 02:41:43
16	widget_analytics_general	2024-06-30 02:41:43	2024-06-30 02:41:43
17	widget_analytics_page	2024-06-30 02:41:43	2024-06-30 02:41:43
18	widget_analytics_browser	2024-06-30 02:41:43	2024-06-30 02:41:43
19	widget_analytics_referrer	2024-06-30 02:41:43	2024-06-30 02:41:43
20	widget_posts_recent	2024-06-30 02:41:43	2024-06-30 02:41:43
21	widget_audit_logs	2024-06-30 02:41:43	2024-06-30 02:41:43
22	widget_request_errors	2024-06-30 02:41:44	2024-06-30 02:41:44
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: field_groups; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.field_groups (id, title, rules, "order", created_by, updated_by, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: field_items; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.field_items (id, field_group_id, parent_id, "order", title, slug, type, instructions, options) FROM stdin;
\.


--
-- Data for Name: galleries; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.galleries (id, name, description, is_featured, "order", image, user_id, status, created_at, updated_at) FROM stdin;
1	Perfect	Nihil qui vel voluptatem. A atque sit et qui est error officia. Quam est eaque veritatis quia eos voluptas.	1	0	galleries/1.jpg	1	published	2022-10-04 06:38:47	2022-10-04 06:38:47
2	New Day	Necessitatibus tempora et fugit eum iste. Dolorem qui aut sit molestiae quos qui.	1	0	galleries/2.jpg	1	published	2022-10-04 06:38:47	2022-10-04 06:38:47
3	Happy Day	Optio at culpa commodi minima. Et autem quia illum id voluptatibus. Dolores ad fugit mollitia est accusantium.	1	0	galleries/3.jpg	1	published	2022-10-04 06:38:47	2022-10-04 06:38:47
4	Nature	Doloribus dolorem porro veniam animi fuga quam aut voluptatem. Eum et repudiandae ut eius sed. Tempora ut impedit iste reiciendis consequatur.	1	0	galleries/4.jpg	1	published	2022-10-04 06:38:47	2022-10-04 06:38:47
5	Morning	Aliquid illo sint consectetur consequatur. Doloremque necessitatibus provident fugit suscipit. Nihil perferendis blanditiis repellat velit sit.	1	0	galleries/5.jpg	1	published	2022-10-04 06:38:47	2022-10-04 06:38:47
6	Photography	Vero deleniti nam itaque autem eligendi aut ullam sit. Nesciunt voluptas odit laborum possimus asperiores distinctio.	1	0	galleries/6.jpg	1	published	2022-10-04 06:38:47	2022-10-04 06:38:47
\.


--
-- Data for Name: galleries_translations; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.galleries_translations (lang_code, galleries_id, name, description) FROM stdin;
vi	1	Hoàn hảo	NULL
vi	2	Ngày mới	NULL
vi	3	Ngày hạnh phúc	NULL
vi	4	Thiên nhiên	NULL
vi	5	Buổi sáng	NULL
vi	6	Nghệ thuật	NULL
\.


--
-- Data for Name: gallery_meta; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.gallery_meta (id, images, reference_id, reference_type, created_at, updated_at) FROM stdin;
1	[{"img":"galleries\\/1.jpg","description":"Itaque quis placeat qui nobis magni qui. Sequi ullam ipsum voluptate blanditiis ut qui omnis. Molestiae eaque nesciunt occaecati ducimus illum quos."},{"img":"galleries\\/2.jpg","description":"Fugiat consequuntur neque labore nulla nam voluptatibus nam veniam. Accusamus nam nisi placeat quibusdam laborum repudiandae."},{"img":"galleries\\/3.jpg","description":"Consequatur cumque eos voluptate quas alias pariatur. Repellat iusto maxime eos ut quia. Et quia officiis magni est occaecati laboriosam eaque."},{"img":"galleries\\/4.jpg","description":"Eveniet eum quia tempora quo sunt iusto. Itaque et laboriosam esse laboriosam libero consequatur."},{"img":"galleries\\/5.jpg","description":"Error asperiores ipsum quam labore possimus error et. Perferendis consectetur consequatur aut."},{"img":"galleries\\/6.jpg","description":"Hic in sunt sunt eum doloribus. Et ea velit sunt. Similique illo qui non voluptas."},{"img":"galleries\\/7.jpg","description":"Dolorem et eligendi sunt quo voluptatem. Qui voluptatibus tempore quia. Voluptas deserunt illum praesentium non."},{"img":"galleries\\/8.jpg","description":"Saepe aliquam et tempora. Error in pariatur odit vero ut. Quod quod qui modi accusamus."},{"img":"galleries\\/9.jpg","description":"Necessitatibus illo quisquam quo. Esse unde nam ullam voluptatibus occaecati natus."},{"img":"galleries\\/10.jpg","description":"Debitis ut illo ipsum non vel distinctio. Nihil laboriosam et deleniti nemo sed."}]	1	Botble\\Gallery\\Models\\Gallery	2022-10-04 06:38:47	2022-10-04 06:38:47
2	[{"img":"galleries\\/1.jpg","description":"Itaque quis placeat qui nobis magni qui. Sequi ullam ipsum voluptate blanditiis ut qui omnis. Molestiae eaque nesciunt occaecati ducimus illum quos."},{"img":"galleries\\/2.jpg","description":"Fugiat consequuntur neque labore nulla nam voluptatibus nam veniam. Accusamus nam nisi placeat quibusdam laborum repudiandae."},{"img":"galleries\\/3.jpg","description":"Consequatur cumque eos voluptate quas alias pariatur. Repellat iusto maxime eos ut quia. Et quia officiis magni est occaecati laboriosam eaque."},{"img":"galleries\\/4.jpg","description":"Eveniet eum quia tempora quo sunt iusto. Itaque et laboriosam esse laboriosam libero consequatur."},{"img":"galleries\\/5.jpg","description":"Error asperiores ipsum quam labore possimus error et. Perferendis consectetur consequatur aut."},{"img":"galleries\\/6.jpg","description":"Hic in sunt sunt eum doloribus. Et ea velit sunt. Similique illo qui non voluptas."},{"img":"galleries\\/7.jpg","description":"Dolorem et eligendi sunt quo voluptatem. Qui voluptatibus tempore quia. Voluptas deserunt illum praesentium non."},{"img":"galleries\\/8.jpg","description":"Saepe aliquam et tempora. Error in pariatur odit vero ut. Quod quod qui modi accusamus."},{"img":"galleries\\/9.jpg","description":"Necessitatibus illo quisquam quo. Esse unde nam ullam voluptatibus occaecati natus."},{"img":"galleries\\/10.jpg","description":"Debitis ut illo ipsum non vel distinctio. Nihil laboriosam et deleniti nemo sed."}]	2	Botble\\Gallery\\Models\\Gallery	2022-10-04 06:38:47	2022-10-04 06:38:47
3	[{"img":"galleries\\/1.jpg","description":"Itaque quis placeat qui nobis magni qui. Sequi ullam ipsum voluptate blanditiis ut qui omnis. Molestiae eaque nesciunt occaecati ducimus illum quos."},{"img":"galleries\\/2.jpg","description":"Fugiat consequuntur neque labore nulla nam voluptatibus nam veniam. Accusamus nam nisi placeat quibusdam laborum repudiandae."},{"img":"galleries\\/3.jpg","description":"Consequatur cumque eos voluptate quas alias pariatur. Repellat iusto maxime eos ut quia. Et quia officiis magni est occaecati laboriosam eaque."},{"img":"galleries\\/4.jpg","description":"Eveniet eum quia tempora quo sunt iusto. Itaque et laboriosam esse laboriosam libero consequatur."},{"img":"galleries\\/5.jpg","description":"Error asperiores ipsum quam labore possimus error et. Perferendis consectetur consequatur aut."},{"img":"galleries\\/6.jpg","description":"Hic in sunt sunt eum doloribus. Et ea velit sunt. Similique illo qui non voluptas."},{"img":"galleries\\/7.jpg","description":"Dolorem et eligendi sunt quo voluptatem. Qui voluptatibus tempore quia. Voluptas deserunt illum praesentium non."},{"img":"galleries\\/8.jpg","description":"Saepe aliquam et tempora. Error in pariatur odit vero ut. Quod quod qui modi accusamus."},{"img":"galleries\\/9.jpg","description":"Necessitatibus illo quisquam quo. Esse unde nam ullam voluptatibus occaecati natus."},{"img":"galleries\\/10.jpg","description":"Debitis ut illo ipsum non vel distinctio. Nihil laboriosam et deleniti nemo sed."}]	3	Botble\\Gallery\\Models\\Gallery	2022-10-04 06:38:47	2022-10-04 06:38:47
4	[{"img":"galleries\\/1.jpg","description":"Itaque quis placeat qui nobis magni qui. Sequi ullam ipsum voluptate blanditiis ut qui omnis. Molestiae eaque nesciunt occaecati ducimus illum quos."},{"img":"galleries\\/2.jpg","description":"Fugiat consequuntur neque labore nulla nam voluptatibus nam veniam. Accusamus nam nisi placeat quibusdam laborum repudiandae."},{"img":"galleries\\/3.jpg","description":"Consequatur cumque eos voluptate quas alias pariatur. Repellat iusto maxime eos ut quia. Et quia officiis magni est occaecati laboriosam eaque."},{"img":"galleries\\/4.jpg","description":"Eveniet eum quia tempora quo sunt iusto. Itaque et laboriosam esse laboriosam libero consequatur."},{"img":"galleries\\/5.jpg","description":"Error asperiores ipsum quam labore possimus error et. Perferendis consectetur consequatur aut."},{"img":"galleries\\/6.jpg","description":"Hic in sunt sunt eum doloribus. Et ea velit sunt. Similique illo qui non voluptas."},{"img":"galleries\\/7.jpg","description":"Dolorem et eligendi sunt quo voluptatem. Qui voluptatibus tempore quia. Voluptas deserunt illum praesentium non."},{"img":"galleries\\/8.jpg","description":"Saepe aliquam et tempora. Error in pariatur odit vero ut. Quod quod qui modi accusamus."},{"img":"galleries\\/9.jpg","description":"Necessitatibus illo quisquam quo. Esse unde nam ullam voluptatibus occaecati natus."},{"img":"galleries\\/10.jpg","description":"Debitis ut illo ipsum non vel distinctio. Nihil laboriosam et deleniti nemo sed."}]	4	Botble\\Gallery\\Models\\Gallery	2022-10-04 06:38:47	2022-10-04 06:38:47
5	[{"img":"galleries\\/1.jpg","description":"Itaque quis placeat qui nobis magni qui. Sequi ullam ipsum voluptate blanditiis ut qui omnis. Molestiae eaque nesciunt occaecati ducimus illum quos."},{"img":"galleries\\/2.jpg","description":"Fugiat consequuntur neque labore nulla nam voluptatibus nam veniam. Accusamus nam nisi placeat quibusdam laborum repudiandae."},{"img":"galleries\\/3.jpg","description":"Consequatur cumque eos voluptate quas alias pariatur. Repellat iusto maxime eos ut quia. Et quia officiis magni est occaecati laboriosam eaque."},{"img":"galleries\\/4.jpg","description":"Eveniet eum quia tempora quo sunt iusto. Itaque et laboriosam esse laboriosam libero consequatur."},{"img":"galleries\\/5.jpg","description":"Error asperiores ipsum quam labore possimus error et. Perferendis consectetur consequatur aut."},{"img":"galleries\\/6.jpg","description":"Hic in sunt sunt eum doloribus. Et ea velit sunt. Similique illo qui non voluptas."},{"img":"galleries\\/7.jpg","description":"Dolorem et eligendi sunt quo voluptatem. Qui voluptatibus tempore quia. Voluptas deserunt illum praesentium non."},{"img":"galleries\\/8.jpg","description":"Saepe aliquam et tempora. Error in pariatur odit vero ut. Quod quod qui modi accusamus."},{"img":"galleries\\/9.jpg","description":"Necessitatibus illo quisquam quo. Esse unde nam ullam voluptatibus occaecati natus."},{"img":"galleries\\/10.jpg","description":"Debitis ut illo ipsum non vel distinctio. Nihil laboriosam et deleniti nemo sed."}]	5	Botble\\Gallery\\Models\\Gallery	2022-10-04 06:38:47	2022-10-04 06:38:47
6	[{"img":"galleries\\/1.jpg","description":"Itaque quis placeat qui nobis magni qui. Sequi ullam ipsum voluptate blanditiis ut qui omnis. Molestiae eaque nesciunt occaecati ducimus illum quos."},{"img":"galleries\\/2.jpg","description":"Fugiat consequuntur neque labore nulla nam voluptatibus nam veniam. Accusamus nam nisi placeat quibusdam laborum repudiandae."},{"img":"galleries\\/3.jpg","description":"Consequatur cumque eos voluptate quas alias pariatur. Repellat iusto maxime eos ut quia. Et quia officiis magni est occaecati laboriosam eaque."},{"img":"galleries\\/4.jpg","description":"Eveniet eum quia tempora quo sunt iusto. Itaque et laboriosam esse laboriosam libero consequatur."},{"img":"galleries\\/5.jpg","description":"Error asperiores ipsum quam labore possimus error et. Perferendis consectetur consequatur aut."},{"img":"galleries\\/6.jpg","description":"Hic in sunt sunt eum doloribus. Et ea velit sunt. Similique illo qui non voluptas."},{"img":"galleries\\/7.jpg","description":"Dolorem et eligendi sunt quo voluptatem. Qui voluptatibus tempore quia. Voluptas deserunt illum praesentium non."},{"img":"galleries\\/8.jpg","description":"Saepe aliquam et tempora. Error in pariatur odit vero ut. Quod quod qui modi accusamus."},{"img":"galleries\\/9.jpg","description":"Necessitatibus illo quisquam quo. Esse unde nam ullam voluptatibus occaecati natus."},{"img":"galleries\\/10.jpg","description":"Debitis ut illo ipsum non vel distinctio. Nihil laboriosam et deleniti nemo sed."}]	6	Botble\\Gallery\\Models\\Gallery	2022-10-04 06:38:47	2022-10-04 06:38:47
\.


--
-- Data for Name: gallery_meta_translations; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.gallery_meta_translations (lang_code, gallery_meta_id, images) FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- Data for Name: language_meta; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.language_meta (lang_meta_id, lang_meta_code, lang_meta_origin, reference_id, reference_type) FROM stdin;
1	en_US	98e2c6466ccfe33740eb8981bc5bc59c	1	Botble\\Menu\\Models\\MenuLocation
2	en_US	cb2ca7474a88266b31cab8b2498fd853	1	Botble\\Menu\\Models\\Menu
3	en_US	cf94b15324a71c0b5ae0f5ef970d1204	2	Botble\\Menu\\Models\\Menu
4	en_US	fa89fb44be8ead3bec9156823fa7b050	3	Botble\\Menu\\Models\\Menu
5	en_US	f04547b31cbd6b2c8cfa774460c14246	4	Botble\\Menu\\Models\\Menu
6	en_US	23ee5f0dca21afdacc4af7a222b13885	5	Botble\\Menu\\Models\\Menu
7	vi	e1817d8c9a3f69f7fa0875fd3bbe874a	2	Botble\\Menu\\Models\\MenuLocation
8	vi	cb2ca7474a88266b31cab8b2498fd853	6	Botble\\Menu\\Models\\Menu
9	vi	cf94b15324a71c0b5ae0f5ef970d1204	7	Botble\\Menu\\Models\\Menu
10	vi	fa89fb44be8ead3bec9156823fa7b050	8	Botble\\Menu\\Models\\Menu
11	vi	f04547b31cbd6b2c8cfa774460c14246	9	Botble\\Menu\\Models\\Menu
12	vi	23ee5f0dca21afdacc4af7a222b13885	10	Botble\\Menu\\Models\\Menu
\.


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.languages (lang_id, lang_name, lang_locale, lang_code, lang_flag, lang_is_default, lang_order, lang_is_rtl) FROM stdin;
1	English	en	en_US	us	1	0	0
2	Tiếng Việt	vi	vi	vn	0	0	0
\.


--
-- Data for Name: media_files; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.media_files (id, user_id, name, folder_id, mime_type, size, url, options, created_at, updated_at, deleted_at, alt) FROM stdin;
267	0	1	29	image/jpeg	2165	galleries/1.jpg	[]	2022-10-04 06:38:47	2022-10-04 06:38:47	\N	\N
268	0	10	29	image/jpeg	2165	galleries/10.jpg	[]	2022-10-04 06:38:47	2022-10-04 06:38:47	\N	\N
269	0	2	29	image/jpeg	2165	galleries/2.jpg	[]	2022-10-04 06:38:47	2022-10-04 06:38:47	\N	\N
270	0	3	29	image/jpeg	2165	galleries/3.jpg	[]	2022-10-04 06:38:47	2022-10-04 06:38:47	\N	\N
271	0	4	29	image/jpeg	2165	galleries/4.jpg	[]	2022-10-04 06:38:47	2022-10-04 06:38:47	\N	\N
272	0	5	29	image/jpeg	2165	galleries/5.jpg	[]	2022-10-04 06:38:47	2022-10-04 06:38:47	\N	\N
273	0	6	29	image/jpeg	2165	galleries/6.jpg	[]	2022-10-04 06:38:47	2022-10-04 06:38:47	\N	\N
274	0	7	29	image/jpeg	2165	galleries/7.jpg	[]	2022-10-04 06:38:47	2022-10-04 06:38:47	\N	\N
275	0	8	29	image/jpeg	2165	galleries/8.jpg	[]	2022-10-04 06:38:47	2022-10-04 06:38:47	\N	\N
276	0	9	29	image/jpeg	2165	galleries/9.jpg	[]	2022-10-04 06:38:47	2022-10-04 06:38:47	\N	\N
277	0	1	30	image/jpeg	2165	news/1.jpg	[]	2022-10-04 06:38:47	2022-10-04 06:38:47	\N	\N
278	0	10	30	image/jpeg	2165	news/10.jpg	[]	2022-10-04 06:38:47	2022-10-04 06:38:47	\N	\N
279	0	11	30	image/jpeg	2165	news/11.jpg	[]	2022-10-04 06:38:47	2022-10-04 06:38:47	\N	\N
280	0	12	30	image/jpeg	2165	news/12.jpg	[]	2022-10-04 06:38:47	2022-10-04 06:38:47	\N	\N
281	0	13	30	image/jpeg	2165	news/13.jpg	[]	2022-10-04 06:38:47	2022-10-04 06:38:47	\N	\N
282	0	14	30	image/jpeg	2165	news/14.jpg	[]	2022-10-04 06:38:48	2022-10-04 06:38:48	\N	\N
283	0	15	30	image/jpeg	2165	news/15.jpg	[]	2022-10-04 06:38:48	2022-10-04 06:38:48	\N	\N
284	0	16	30	image/jpeg	2165	news/16.jpg	[]	2022-10-04 06:38:48	2022-10-04 06:38:48	\N	\N
285	0	2	30	image/jpeg	2165	news/2.jpg	[]	2022-10-04 06:38:48	2022-10-04 06:38:48	\N	\N
286	0	3	30	image/jpeg	2165	news/3.jpg	[]	2022-10-04 06:38:48	2022-10-04 06:38:48	\N	\N
287	0	4	30	image/jpeg	2165	news/4.jpg	[]	2022-10-04 06:38:48	2022-10-04 06:38:48	\N	\N
288	0	5	30	image/jpeg	2165	news/5.jpg	[]	2022-10-04 06:38:48	2022-10-04 06:38:48	\N	\N
289	0	6	30	image/jpeg	2165	news/6.jpg	[]	2022-10-04 06:38:48	2022-10-04 06:38:48	\N	\N
290	0	7	30	image/jpeg	2165	news/7.jpg	[]	2022-10-04 06:38:48	2022-10-04 06:38:48	\N	\N
291	0	8	30	image/jpeg	2165	news/8.jpg	[]	2022-10-04 06:38:48	2022-10-04 06:38:48	\N	\N
292	0	9	30	image/jpeg	2165	news/9.jpg	[]	2022-10-04 06:38:48	2022-10-04 06:38:48	\N	\N
293	0	1	31	image/jpeg	2165	members/1.jpg	[]	2022-10-04 06:38:48	2022-10-04 06:38:48	\N	\N
294	0	10	31	image/jpeg	2165	members/10.jpg	[]	2022-10-04 06:38:48	2022-10-04 06:38:48	\N	\N
295	0	2	31	image/jpeg	2165	members/2.jpg	[]	2022-10-04 06:38:49	2022-10-04 06:38:49	\N	\N
296	0	3	31	image/jpeg	2165	members/3.jpg	[]	2022-10-04 06:38:49	2022-10-04 06:38:49	\N	\N
297	0	4	31	image/jpeg	2165	members/4.jpg	[]	2022-10-04 06:38:49	2022-10-04 06:38:49	\N	\N
298	0	5	31	image/jpeg	2165	members/5.jpg	[]	2022-10-04 06:38:49	2022-10-04 06:38:49	\N	\N
299	0	6	31	image/jpeg	2165	members/6.jpg	[]	2022-10-04 06:38:49	2022-10-04 06:38:49	\N	\N
300	0	7	31	image/jpeg	2165	members/7.jpg	[]	2022-10-04 06:38:49	2022-10-04 06:38:49	\N	\N
301	0	8	31	image/jpeg	2165	members/8.jpg	[]	2022-10-04 06:38:49	2022-10-04 06:38:49	\N	\N
302	0	9	31	image/jpeg	2165	members/9.jpg	[]	2022-10-04 06:38:49	2022-10-04 06:38:49	\N	\N
303	0	favicon	32	image/png	667	general/favicon.png	[]	2022-10-04 06:38:50	2022-10-04 06:38:50	\N	\N
304	0	logo	32	image/png	22972	general/logo.png	[]	2022-10-04 06:38:50	2022-10-04 06:38:50	\N	\N
306	1	cslant-favicon	30	image/png	5726	news/cslant-favicon.png	[]	2024-07-07 17:49:03	2024-07-07 17:51:37	2024-07-07 17:51:37	cslant-favicon
307	1	cslant-favicon	34	image/png	5726	theme/cslant-favicon.png	[]	2024-07-07 17:51:53	2024-07-07 17:51:53	\N	cslant-favicon
308	1	cslant-logo	34	image/png	5726	theme/cslant-logo.png	[]	2024-07-07 17:51:54	2024-07-07 17:51:54	\N	cslant-logo
309	1	cslant-text-logo	34	image/png	9452	theme/cslant-text-logo.png	[]	2024-07-07 17:51:54	2024-07-07 17:51:54	\N	cslant-text-logo
310	1	56db1735-ceb9-441e-a2d1-408959c05199	35	image/png	2238	users/56db1735-ceb9-441e-a2d1-408959c05199.png	[]	2024-07-07 17:58:15	2024-07-07 17:58:15	\N	56db1735-ceb9-441e-a2d1-408959c05199
\.


--
-- Data for Name: media_folders; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.media_folders (id, user_id, name, slug, parent_id, created_at, updated_at, deleted_at, color) FROM stdin;
29	0	galleries	galleries	0	2022-10-04 06:38:47	2022-10-04 06:38:47	\N	\N
30	0	news	news	0	2022-10-04 06:38:47	2022-10-04 06:38:47	\N	\N
31	0	members	members	0	2022-10-04 06:38:48	2022-10-04 06:38:48	\N	\N
32	0	general	general	0	2022-10-04 06:38:50	2022-10-04 06:38:50	\N	\N
34	1	theme	theme	0	2024-07-07 17:50:32	2024-07-07 17:50:32	\N	\N
35	1	users	users	0	2024-07-07 17:58:15	2024-07-07 17:58:15	\N	\N
\.


--
-- Data for Name: media_settings; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.media_settings (id, key, value, media_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: member_activity_logs; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.member_activity_logs (id, action, user_agent, reference_url, reference_name, ip_address, member_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: member_password_resets; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.member_password_resets (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: members; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.members (id, first_name, last_name, description, gender, email, password, avatar_id, dob, phone, confirmed_at, email_verify_token, remember_token, created_at, updated_at) FROM stdin;
1	John	Smith	Alice indignantly, and she.	NULL	john.smith@botble.com	$2y$10$r9S5zIe7b6aZzBCkNzoaTenYoP6FDToZIQDe0uqiIXwau2z3dAHMK	293	1976-03-31	616-476-0399	2022-10-04 06:38:49	NULL	NULL	2022-10-04 06:38:49	2022-10-04 06:38:49
2	Jane	O'Connell	Tortoise--' 'Why did you.	NULL	betty.stokes@mosciski.biz	$2y$10$6G4NMbJhOZq6fDuOz/A93uN7I.TFmWGOMhKisAw6jC4ty3dpbLs96	294	2009-02-27	680.496.1748	2022-10-04 06:38:49	NULL	NULL	2022-10-04 06:38:49	2022-10-04 06:38:49
3	Randal	Beer	First, however, she waited.	NULL	yhaag@goldner.com	$2y$10$Pk577RmyEPh/XaFS/C6JOuflcW9cZ6y1TXt1n4KTl3hSHRuQwMbsC	295	2016-09-30	(815) 541-1713	2022-10-04 06:38:49	NULL	NULL	2022-10-04 06:38:49	2022-10-04 06:38:49
4	Fay	Carter	I'll just see what would be.	NULL	bartell.hermina@upton.com	$2y$10$qPJaTq2Jrb3X8L8QxBspd.h8VHuvDcguG3cFpRBcK7XTZCDuZMwAG	296	2005-02-17	+17726995670	2022-10-04 06:38:49	NULL	NULL	2022-10-04 06:38:49	2022-10-04 06:38:49
5	Fritz	Lowe	Alice; 'you needn't be so.	NULL	bill.wolf@metz.net	$2y$10$ch3N/1WhMkceiYN5jZb6R.rDwGd3ENFf2Q3xC97CKFgJ78vT7SzNS	297	1974-09-17	+1-602-965-9102	2022-10-04 06:38:49	NULL	NULL	2022-10-04 06:38:49	2022-10-04 06:38:49
6	Sydni	Bailey	Alice, very much what would.	NULL	farrell.payton@yahoo.com	$2y$10$eH2Ltn2uuJ1lDD7LqeTipOtm6n9WdCOzGc5SobA/lXIGLM7on22J6	298	1983-07-26	386.626.7650	2022-10-04 06:38:49	NULL	NULL	2022-10-04 06:38:49	2022-10-04 06:38:49
7	Richmond	Mills	And the muscular strength.	NULL	lind.zakary@metz.com	$2y$10$ZpCuuuFOsBXrwz1MCupa7eI4Zs89XAA7SaTcAHV9jVpvAWFiCGVLO	299	2013-04-23	1-614-841-7634	2022-10-04 06:38:49	NULL	NULL	2022-10-04 06:38:49	2022-10-04 06:38:49
8	Sigurd	Strosin	King. 'It began with the.	NULL	sstreich@kling.info	$2y$10$iEtRw09vGC3RQU9oL8t1yeYcTlBnGdbFHvDwW38wrFhcjdTjLiU7G	300	1999-04-11	(727) 297-6992	2022-10-04 06:38:50	NULL	NULL	2022-10-04 06:38:50	2022-10-04 06:38:50
9	Madge	Eichmann	Gryphon. 'Turn a somersault.	NULL	bartholome.ziemann@paucek.com	$2y$10$tzZKMlKp9j6Oc50sGh2CxukGg4Y0H8CkPb9DnEmE0X/4wpRaNJ2kC	301	1997-10-20	(351) 577-7330	2022-10-04 06:38:50	NULL	NULL	2022-10-04 06:38:50	2022-10-04 06:38:50
10	Buford	Dietrich	So she went on: 'But why did.	NULL	moen.keegan@yahoo.com	$2y$10$ES0vmNbmqwhvfZAtey8lQ.sKeUwXSolVAIOl4j1VJOU8dlLosm6aO	302	2000-04-19	(401) 694-7025	2022-10-04 06:38:50	NULL	NULL	2022-10-04 06:38:50	2022-10-04 06:38:50
\.


--
-- Data for Name: menu_locations; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.menu_locations (id, menu_id, location, created_at, updated_at) FROM stdin;
1	1	main-menu	2022-10-04 06:38:50	2022-10-04 06:38:50
2	6	main-menu	2022-10-04 06:38:50	2022-10-04 06:38:50
\.


--
-- Data for Name: menu_nodes; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.menu_nodes (id, menu_id, parent_id, reference_id, reference_type, url, icon_font, "position", title, css_class, target, has_child, created_at, updated_at) FROM stdin;
1	1	0	\N	NULL	/	NULL	0	Home	NULL	_self	0	2022-10-04 06:38:50	2022-10-04 06:38:50
2	1	0	\N	NULL	https://botble.com/go/download-cms	NULL	0	Purchase	NULL	_blank	0	2022-10-04 06:38:50	2022-10-04 06:38:50
3	1	0	2	Botble\\Page\\Models\\Page	/en/blog	NULL	0	Blog	NULL	_self	0	2022-10-04 06:38:50	2022-10-04 06:38:50
4	1	0	\N	NULL	/galleries	NULL	0	Galleries	NULL	_self	0	2022-10-04 06:38:50	2022-10-04 06:38:50
5	1	0	3	Botble\\Page\\Models\\Page	/en/contact	NULL	0	Contact	NULL	_self	0	2022-10-04 06:38:50	2022-10-04 06:38:50
6	2	0	\N	NULL	http://speckyboy.com	NULL	0	Speckyboy Magazine	NULL	_self	0	2022-10-04 06:38:50	2022-10-04 06:38:50
7	2	0	\N	NULL	http://tympanus.com	NULL	0	Tympanus-Codrops	NULL	_self	0	2022-10-04 06:38:50	2022-10-04 06:38:50
8	2	0	\N	NULL	#	NULL	0	Kipalog Blog	NULL	_self	0	2022-10-04 06:38:50	2022-10-04 06:38:50
9	2	0	\N	NULL	http://www.sitepoint.com	NULL	0	SitePoint	NULL	_self	0	2022-10-04 06:38:50	2022-10-04 06:38:50
10	2	0	\N	NULL	http://www.creativebloq.com	NULL	0	CreativeBloq	NULL	_self	0	2022-10-04 06:38:50	2022-10-04 06:38:50
11	2	0	\N	NULL	http://techtalk.vn	NULL	0	Techtalk	NULL	_self	0	2022-10-04 06:38:50	2022-10-04 06:38:50
12	3	0	\N	NULL	/	NULL	0	Homepage	NULL	_self	0	2022-10-04 06:38:50	2022-10-04 06:38:50
13	3	0	3	Botble\\Page\\Models\\Page	/en/contact	NULL	0	Contact	NULL	_self	0	2022-10-04 06:38:50	2022-10-04 06:38:50
14	3	0	6	Botble\\Blog\\Models\\Category	/en/hotel	NULL	0	Hotel	NULL	_self	0	2022-10-04 06:38:50	2022-10-04 06:38:50
15	3	0	3	Botble\\Blog\\Models\\Category	/en/travel-tips	NULL	0	Travel Tips	NULL	_self	0	2022-10-04 06:38:50	2022-10-04 06:38:50
16	3	0	\N	NULL	/galleries	NULL	0	Galleries	NULL	_self	0	2022-10-04 06:38:50	2022-10-04 06:38:50
17	4	0	2	Botble\\Blog\\Models\\Category	/en/lifestyle	NULL	0	Lifestyle	NULL	_self	0	2022-10-04 06:38:50	2022-10-04 06:38:50
18	4	0	3	Botble\\Blog\\Models\\Category	/en/travel-tips	NULL	0	Travel Tips	NULL	_self	0	2022-10-04 06:38:50	2022-10-04 06:38:50
19	4	0	4	Botble\\Blog\\Models\\Category	/en/healthy	NULL	0	Healthy	NULL	_self	0	2022-10-04 06:38:50	2022-10-04 06:38:50
20	4	0	6	Botble\\Blog\\Models\\Category	/en/hotel	NULL	0	Hotel	NULL	_self	0	2022-10-04 06:38:50	2022-10-04 06:38:50
21	4	0	7	Botble\\Blog\\Models\\Category	/en/nature	NULL	0	Nature	NULL	_self	0	2022-10-04 06:38:50	2022-10-04 06:38:50
22	5	0	\N	NULL	https://facebook.com	fab fa-facebook	0	Facebook	NULL	_blank	0	2022-10-04 06:38:50	2022-10-04 06:38:50
23	5	0	\N	NULL	https://twitter.com	fab fa-twitter	0	Twitter	NULL	_blank	0	2022-10-04 06:38:50	2022-10-04 06:38:50
24	5	0	\N	NULL	https://github.com	fab fa-github	0	Github	NULL	_blank	0	2022-10-04 06:38:50	2022-10-04 06:38:50
25	5	0	\N	NULL	https://linkedin.com	fab fa-linkedin	0	Linkedin	NULL	_blank	0	2022-10-04 06:38:50	2022-10-04 06:38:50
26	6	0	\N	NULL	/	NULL	0	Trang chủ	NULL	_self	0	2022-10-04 06:38:50	2022-10-04 06:38:50
27	6	0	\N	NULL	https://botble.com/go/download-cms	NULL	0	Mua ngay	NULL	_blank	0	2022-10-04 06:38:50	2022-10-04 06:38:50
28	6	0	2	Botble\\Page\\Models\\Page	/en/blog	NULL	0	Tin tức	NULL	_self	0	2022-10-04 06:38:50	2022-10-04 06:38:50
29	6	0	\N	NULL	/galleries	NULL	0	Thư viện ảnh	NULL	_self	0	2022-10-04 06:38:50	2022-10-04 06:38:50
30	6	0	3	Botble\\Page\\Models\\Page	/en/contact	NULL	0	Liên hệ	NULL	_self	0	2022-10-04 06:38:50	2022-10-04 06:38:50
31	7	0	\N	NULL	http://speckyboy.com	NULL	0	Speckyboy Magazine	NULL	_self	0	2022-10-04 06:38:50	2022-10-04 06:38:50
32	7	0	\N	NULL	http://tympanus.com	NULL	0	Tympanus-Codrops	NULL	_self	0	2022-10-04 06:38:50	2022-10-04 06:38:50
33	7	0	\N	NULL	#	NULL	0	Kipalog Blog	NULL	_self	0	2022-10-04 06:38:50	2022-10-04 06:38:50
34	7	0	\N	NULL	http://www.sitepoint.com	NULL	0	SitePoint	NULL	_self	0	2022-10-04 06:38:50	2022-10-04 06:38:50
35	7	0	\N	NULL	http://www.creativebloq.com	NULL	0	CreativeBloq	NULL	_self	0	2022-10-04 06:38:50	2022-10-04 06:38:50
36	7	0	\N	NULL	http://techtalk.vn	NULL	0	Techtalk	NULL	_self	0	2022-10-04 06:38:50	2022-10-04 06:38:50
37	8	0	\N	NULL	/	NULL	0	Trang chủ	NULL	_self	0	2022-10-04 06:38:50	2022-10-04 06:38:50
38	8	0	3	Botble\\Page\\Models\\Page	/en/contact	NULL	0	Liên hệ	NULL	_self	0	2022-10-04 06:38:50	2022-10-04 06:38:50
39	8	0	6	Botble\\Blog\\Models\\Category	/en/hotel	NULL	0	Khách sạn	NULL	_self	0	2022-10-04 06:38:50	2022-10-04 06:38:50
40	8	0	3	Botble\\Blog\\Models\\Category	/en/travel-tips	NULL	0	Món ngon	NULL	_self	0	2022-10-04 06:38:50	2022-10-04 06:38:50
41	8	0	\N	NULL	/galleries	NULL	0	Thư viện ảnh	NULL	_self	0	2022-10-04 06:38:50	2022-10-04 06:38:50
42	9	0	2	Botble\\Blog\\Models\\Category	/en/lifestyle	NULL	0	Sức khỏe	NULL	_self	0	2022-10-04 06:38:50	2022-10-04 06:38:50
43	9	0	3	Botble\\Blog\\Models\\Category	/en/travel-tips	NULL	0	Món ngon	NULL	_self	0	2022-10-04 06:38:50	2022-10-04 06:38:50
44	9	0	4	Botble\\Blog\\Models\\Category	/en/healthy	NULL	0	Sức khỏe	NULL	_self	0	2022-10-04 06:38:50	2022-10-04 06:38:50
45	9	0	6	Botble\\Blog\\Models\\Category	/en/hotel	NULL	0	Khách sạn	NULL	_self	0	2022-10-04 06:38:50	2022-10-04 06:38:50
46	9	0	7	Botble\\Blog\\Models\\Category	/en/nature	NULL	0	Thiên nhiên	NULL	_self	0	2022-10-04 06:38:50	2022-10-04 06:38:50
47	10	0	\N	NULL	https://facebook.com	fa fa-facebook	0	Facebook	NULL	_blank	0	2022-10-04 06:38:50	2022-10-04 06:38:50
48	10	0	\N	NULL	https://twitter.com	fa fa-twitter	0	Twitter	NULL	_blank	0	2022-10-04 06:38:50	2022-10-04 06:38:50
49	10	0	\N	NULL	https://github.com	fa fa-github	0	Github	NULL	_blank	0	2022-10-04 06:38:50	2022-10-04 06:38:50
50	10	0	\N	NULL	https://linkedin.com	fa fa-linkedin	0	Linkedin	NULL	_blank	0	2022-10-04 06:38:50	2022-10-04 06:38:50
\.


--
-- Data for Name: menus; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.menus (id, name, slug, status, created_at, updated_at) FROM stdin;
1	Main menu	main-menu	published	2022-10-04 06:38:50	2022-10-04 06:38:50
2	Favorite websites	favorite-websites	published	2022-10-04 06:38:50	2022-10-04 06:38:50
3	My links	my-links	published	2022-10-04 06:38:50	2022-10-04 06:38:50
4	Featured Categories	featured-categories	published	2022-10-04 06:38:50	2022-10-04 06:38:50
5	Social	social	published	2022-10-04 06:38:50	2022-10-04 06:38:50
6	Menu chính	menu-chinh	published	2022-10-04 06:38:50	2022-10-04 06:38:50
7	Trang web yêu thích	trang-web-yeu-thich	published	2022-10-04 06:38:50	2022-10-04 06:38:50
8	Liên kết	lien-ket	published	2022-10-04 06:38:50	2022-10-04 06:38:50
9	Danh mục nổi bật	danh-muc-noi-bat	published	2022-10-04 06:38:50	2022-10-04 06:38:50
10	Mạng xã hội	mang-xa-hoi	published	2022-10-04 06:38:50	2022-10-04 06:38:50
\.


--
-- Data for Name: meta_boxes; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.meta_boxes (id, meta_key, meta_value, reference_id, reference_type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	2013_04_09_032329_create_base_tables	1
2	2013_04_09_062329_create_revisions_table	1
3	2014_10_12_000000_create_users_table	1
4	2014_10_12_100000_create_password_resets_table	1
5	2016_06_10_230148_create_acl_tables	1
6	2016_06_14_230857_create_menus_table	1
7	2016_06_28_221418_create_pages_table	1
8	2016_10_05_074239_create_setting_table	1
9	2016_11_28_032840_create_dashboard_widget_tables	1
10	2016_12_16_084601_create_widgets_table	1
11	2017_05_09_070343_create_media_tables	1
12	2017_11_03_070450_create_slug_table	1
13	2019_01_05_053554_create_jobs_table	1
14	2019_08_19_000000_create_failed_jobs_table	1
15	2019_12_14_000001_create_personal_access_tokens_table	1
16	2022_04_20_100851_add_index_to_media_table	1
17	2022_04_20_101046_add_index_to_menu_table	1
18	2022_07_10_034813_move_lang_folder_to_root	1
19	2022_08_04_051940_add_missing_column_expires_at	1
20	2015_06_29_025744_create_audit_history	2
21	2017_02_13_034601_create_blocks_table	3
22	2021_12_03_081327_create_blocks_translations	3
23	2015_06_18_033822_create_blog_table	4
24	2021_02_16_092633_remove_default_value_for_author_type	4
25	2021_12_03_030600_create_blog_translations	4
26	2022_04_19_113923_add_index_to_table_posts	4
27	2016_06_17_091537_create_contacts_table	5
28	2017_03_27_150646_re_create_custom_field_tables	6
29	2022_04_30_030807_table_custom_fields_translation_table	6
30	2016_10_13_150201_create_galleries_table	7
31	2021_12_03_082953_create_gallery_translations	7
32	2022_04_30_034048_create_gallery_meta_translations_table	7
33	2016_10_03_032336_create_languages_table	8
34	2021_10_25_021023_fix-priority-load-for-language-advanced	9
35	2021_12_03_075608_create_page_translations	9
36	2017_10_04_140938_create_member_table	10
37	2016_05_28_112028_create_system_request_logs_table	11
38	2016_10_07_193005_create_translations_table	12
\.


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.pages (id, name, content, user_id, image, template, is_featured, description, status, created_at, updated_at) FROM stdin;
1	Homepage	<div>[featured-posts][/featured-posts]</div><div>[recent-posts title="What's new?"][/recent-posts]</div><div>[featured-categories-posts title="Best for you" category_id="2"][/featured-categories-posts]</div><div>[all-galleries limit="8"][/all-galleries]</div>	1	NULL	no-sidebar	0	NULL	published	2022-10-04 06:38:46	2022-10-04 06:38:46
2	Blog	---	1	NULL	default	0	NULL	published	2022-10-04 06:38:46	2022-10-04 06:38:46
3	Contact	<p>Address: North Link Building, 10 Admiralty Street, 757695 Singapore</p><p>Hotline: 18006268</p><p>Email: contact@botble.com</p><p>[google-map]North Link Building, 10 Admiralty Street, 757695 Singapore[/google-map]</p><p>For the fastest reply, please use the contact form below.</p><p>[contact-form][/contact-form]</p>	1	NULL	default	0	NULL	published	2022-10-04 06:38:46	2022-10-04 06:38:46
4	Cookie Policy	<h3>EU Cookie Consent</h3><p>To use this website we are using Cookies and collecting some Data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><p>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</p><p>- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</p><p>- XSRF-Token Cookie: Laravel automatically generates a CSRF "token" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</p>	1	NULL	default	0	NULL	published	2022-10-04 06:38:46	2022-10-04 06:38:46
\.


--
-- Data for Name: pages_translations; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.pages_translations (lang_code, pages_id, name, description, content) FROM stdin;
vi	1	Trang chủ	NULL	<div>[featured-posts][/featured-posts]</div><div>[recent-posts title="Có gì mới?"][/recent-posts]</div><div>[featured-categories-posts title="Tốt nhất cho bạn" category_id="2"][/featured-categories-posts]</div><div>[all-galleries limit="8"][/all-galleries]</div>
vi	2	Tin tức	NULL	---
vi	3	Liên hệ	NULL	<p>Địa chỉ: North Link Building, 10 Admiralty Street, 757695 Singapore</p><p>Đường dây nóng: 18006268</p><p>Email: contact@botble.com</p><p>[google-map]North Link Building, 10 Admiralty Street, 757695 Singapore[/google-map]</p><p>Để được trả lời nhanh nhất, vui lòng sử dụng biểu mẫu liên hệ bên dưới.</p><p>[contact-form][/contact-form]</p>
vi	4	Cookie Policy	NULL	<h3>EU Cookie Consent</h3><p>Để sử dụng trang web này, chúng tôi đang sử dụng Cookie và thu thập một số Dữ liệu. Để tuân thủ GDPR của Liên minh Châu Âu, chúng tôi cho bạn lựa chọn nếu bạn cho phép chúng tôi sử dụng một số Cookie nhất định và thu thập một số Dữ liệu.</p><h4>Dữ liệu cần thiết</h4><p>Dữ liệu cần thiết là cần thiết để chạy Trang web bạn đang truy cập về mặt kỹ thuật. Bạn không thể hủy kích hoạt chúng.</p><p>- Session Cookie: PHP sử dụng Cookie để xác định phiên của người dùng. Nếu không có Cookie này, trang web sẽ không hoạt động.</p><p>- XSRF-Token Cookie: Laravel tự động tạo "token" CSRF cho mỗi phiên người dùng đang hoạt động do ứng dụng quản lý. Token này được sử dụng để xác minh rằng người dùng đã xác thực là người thực sự đưa ra yêu cầu đối với ứng dụng.</p>
\.


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.password_resets (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: post_categories; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.post_categories (id, category_id, post_id) FROM stdin;
105	5	9
138	5	12
146	7	1
153	6	5
154	4	6
157	7	8
159	4	10
161	3	11
162	7	11
164	2	13
166	4	14
171	3	1
172	1	2
173	7	2
174	4	3
175	7	3
176	2	4
177	5	4
178	2	5
179	5	6
180	2	7
181	5	7
182	1	8
183	3	9
184	5	10
185	4	12
186	6	13
187	6	14
188	3	15
189	5	15
190	1	16
191	6	16
\.


--
-- Data for Name: post_tags; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.post_tags (id, tag_id, post_id) FROM stdin;
1	1	1
2	2	1
3	3	1
4	4	1
5	5	1
6	1	2
7	2	2
8	3	2
9	4	2
10	5	2
11	1	3
12	2	3
13	3	3
14	4	3
15	5	3
16	1	4
17	2	4
18	3	4
19	4	4
20	5	4
21	1	5
22	2	5
23	3	5
24	4	5
25	5	5
26	1	6
27	2	6
28	3	6
29	4	6
30	5	6
31	1	7
32	2	7
33	3	7
34	4	7
35	5	7
36	1	8
37	2	8
38	3	8
39	4	8
40	5	8
41	1	9
42	2	9
43	3	9
44	4	9
45	5	9
46	1	10
47	2	10
48	3	10
49	4	10
50	5	10
51	1	11
52	2	11
53	3	11
54	4	11
55	5	11
56	1	12
57	2	12
58	3	12
59	4	12
60	5	12
61	1	13
62	2	13
63	3	13
64	4	13
65	5	13
66	1	14
67	2	14
68	3	14
69	4	14
70	5	14
71	1	15
72	2	15
73	3	15
74	4	15
75	5	15
76	1	16
77	2	16
78	3	16
79	4	16
80	5	16
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.posts (id, name, description, content, status, author_id, author_type, is_featured, image, views, format_type, created_at, updated_at) FROM stdin;
1	The Top 2020 Handbag Trends to Know	Laboriosam nesciunt sit quia. Sed distinctio suscipit doloribus fugiat. Ut sit nostrum non eos sapiente ut sapiente tenetur.	<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>I shan't grow any more--As it is, I suppose?' 'Yes,' said Alice in a long, low hall, which was the White Rabbit, 'and that's a fact.' Alice did not quite sure whether it was growing, and very soon came upon a low voice, 'Why the fact is, you know. So you see, as she fell very slowly, for she felt unhappy. 'It was the Hatter. He came in sight of the wood for fear of killing somebody, so managed to swallow a morsel of the earth. At last the Dodo solemnly, rising to its children, 'Come away, my dears! It's high time to begin at HIS time of life. The King's argument was, that if you could only hear whispers now and then, 'we went to work nibbling at the other, looking uneasily at the Duchess asked, with another dig of her head struck against the door, she walked off, leaving Alice alone with the Dormouse. 'Fourteenth of March, I think it was,' the March Hare,) '--it was at in all my life, never!' They had not a moment to think about it, you may SIT down,' the King said to herself, rather.</p><p class="text-center"><img src="/storage/news/1-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Why, there's hardly room for her. 'I wish you wouldn't mind,' said Alice: 'she's so extremely--' Just then she walked down the little door: but, alas! the little golden key, and Alice's elbow was pressed so closely against her foot, that there was no longer to be seen--everything seemed to be patted on the top with its mouth and yawned once or twice, and shook itself. Then it got down off the mushroom, and raised herself to some tea and bread-and-butter, and went on without attending to her.</p><p class="text-center"><img src="/storage/news/8-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>KNOW IT TO BE TRUE--" that's the jury-box,' thought Alice, 'or perhaps they won't walk the way the people that walk with their heads!' and the moon, and memory, and muchness--you know you say "What a pity!"?' the Rabbit say to itself, 'Oh dear! Oh dear! I'd nearly forgotten that I've got back to her: its face to see if she had never done such a rule at processions; 'and besides, what would happen next. First, she dreamed of little Alice was so ordered about in the wood,' continued the Hatter, 'you wouldn't talk about her and to stand on their backs was the King; and as it spoke. 'As wet as ever,' said Alice to herself. At this the whole window!' 'Sure, it does, yer honour: but it's an arm, yer honour!' (He pronounced it 'arrum.') 'An arm, you goose! Who ever saw in my time, but never ONE with such a dear quiet thing,' Alice went timidly up to the little creature down, and was delighted to find that her neck kept getting entangled among the branches, and every now and then keep tight.</p><p class="text-center"><img src="/storage/news/12-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>IS that to be true): If she should push the matter on, What would become of you? I gave her one, they gave him two, You gave us three or more; They all returned from him to be trampled under its feet, ran round the refreshments!' But there seemed to Alice for protection. 'You shan't be beheaded!' said Alice, who was trembling down to the Gryphon. 'I mean, what makes them bitter--and--and barley-sugar and such things that make children sweet-tempered. I only wish they COULD! I'm sure she's the best thing to nurse--and she's such a dear quiet thing,' Alice went on planning to herself how she would feel with all speed back to them, they set to work throwing everything within her reach at the White Rabbit, jumping up in a low, timid voice, 'If you knew Time as well be at school at once.' However, she got up and walking off to the other paw, 'lives a Hatter: and in a sort of use in crying like that!' said Alice a good deal worse off than before, as the Rabbit, and had no idea what to say.</p>	published	1	Botble\\ACL\\Models\\User	1	news/1.jpg	1711	NULL	2022-10-04 06:38:48	2022-10-04 06:38:48
2	Top Search Engine Optimization Strategies!	Modi non vitae veritatis suscipit molestias qui. Quam laboriosam alias dolore vel velit aliquid. Recusandae accusamus et iure placeat voluptatum quo odit tenetur.	<p>The baby grunted again, and put it right; 'not that it is!' As she said to the other ladder?--Why, I hadn't cried so much!' Alas! it was a little timidly, 'why you are painting those roses?' Five and Seven said nothing, but looked at the mouth with strings: into this they slipped the guinea-pig, head first, and then, if I shall never get to twenty at that rate! However, the Multiplication Table doesn't signify: let's try the first to speak. 'What size do you know why it's called a whiting?' 'I never heard before, 'Sure then I'm here! Digging for apples, indeed!' said the one who got any advantage from the trees had a little shriek, and went down to look over their heads. She felt very glad to get rather sleepy, and went stamping about, and crept a little startled by seeing the Cheshire Cat sitting on a bough of a treacle-well--eh, stupid?' 'But they were nice grand words to say.) Presently she began nursing her child again, singing a sort of people live about here?' 'In THAT.</p><p class="text-center"><img src="/storage/news/1-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>There are no mice in the air. '--as far out to be Number One,' said Alice. 'Why, SHE,' said the Caterpillar. 'Well, I should have croqueted the Queen's shrill cries to the general conclusion, that wherever you go on? It's by far the most interesting, and perhaps as this is May it won't be raving mad--at least not so mad as it went. So she set to work at once in the air: it puzzled her too much, so she went in without knocking, and hurried off to the Gryphon. 'It all came different!' Alice.</p><p class="text-center"><img src="/storage/news/6-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>However, she did it so quickly that the way out of the court, 'Bring me the list of singers. 'You may go,' said the King; and the others looked round also, and all dripping wet, cross, and uncomfortable. The moment Alice felt so desperate that she never knew whether it was a table set out under a tree in the sea. The master was an old woman--but then--always to have lessons to learn! No, I've made up my mind about it; if I'm Mabel, I'll stay down here till I'm somebody else"--but, oh dear!' cried Alice, jumping up and saying, 'Thank you, it's a French mouse, come over with diamonds, and walked two and two, as the soldiers shouted in reply. 'Please come back and see how he did it,) he did it,) he did not like the look of it now in sight, hurrying down it. There was certainly too much pepper in that ridiculous fashion.' And he added looking angrily at the proposal. 'Then the words have got into it), and sometimes shorter, until she made it out loud. 'Thinking again?' the Duchess sang.</p><p class="text-center"><img src="/storage/news/12-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Dormouse fell asleep instantly, and Alice looked round, eager to see some meaning in it,' but none of them bowed low. 'Would you tell me,' said Alice, 'and why it is all the jelly-fish out of breath, and said to herself, and nibbled a little queer, won't you?' 'Not a bit,' she thought it over afterwards, it occurred to her very much confused, 'I don't know much,' said the Mouse, turning to Alice. 'Nothing,' said Alice. 'Call it what you mean,' the March Hare said--' 'I didn't!' the March Hare went on. 'I do,' Alice hastily replied; 'only one doesn't like changing so often, of course you don't!' the Hatter said, tossing his head sadly. 'Do I look like it?' he said, 'on and off, for days and days.' 'But what happens when one eats cake, but Alice had been looking at the top of its mouth, and addressed her in a great hurry to change them--' when she went on. 'We had the best plan.' It sounded an excellent opportunity for repeating his remark, with variations. 'I shall be late!' (when she.</p>	published	1	Botble\\ACL\\Models\\User	1	news/2.jpg	2485	NULL	2022-10-04 06:38:48	2022-10-04 06:38:48
3	Which Company Would You Choose?	Et reprehenderit voluptatibus in libero vel ducimus ut. Qui eos non tempora. Explicabo est minus non ab expedita tempore. Qui aperiam in soluta nisi.	<p>Mock Turtle drew a long way back, and see how he can thoroughly enjoy The pepper when he finds out who was talking. 'How CAN I have none, Why, I haven't been invited yet.' 'You'll see me there,' said the King. The White Rabbit interrupted: 'UNimportant, your Majesty means, of course,' he said to itself in a tone of the court. 'What do you like the Queen?' said the Gryphon. 'Then, you know,' said Alice sharply, for she had hurt the poor little thing was snorting like a telescope! I think I could, if I would talk on such a tiny little thing!' It did so indeed, and much sooner than she had wept when she heard her voice close to the puppy; whereupon the puppy made another snatch in the sea. But they HAVE their tails fast in their mouths--and they're all over crumbs.' 'You're wrong about the whiting!' 'Oh, as to the jury. 'Not yet, not yet!' the Rabbit noticed Alice, as she tucked her arm affectionately into Alice's, and they all spoke at once, she found that her neck would bend about.</p><p class="text-center"><img src="/storage/news/2-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>For anything tougher than suet; Yet you finished the guinea-pigs!' thought Alice. 'I'm a--I'm a--' 'Well! WHAT are you?' said the Caterpillar, just as she ran; but the cook took the regular course.' 'What was that?' inquired Alice. 'Reeling and Writhing, of course, to begin with; and being ordered about in the middle, being held up by a row of lodging houses, and behind them a new idea to Alice, and looking anxiously about her. 'Oh, do let me help to undo it!' 'I shall be a very deep well.</p><p class="text-center"><img src="/storage/news/7-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Rabbit just under the circumstances. There was a different person then.' 'Explain all that,' said the Caterpillar took the hookah into its face was quite pale (with passion, Alice thought), and it was perfectly round, she came up to her that she did not get hold of this remark, and thought it had been, it suddenly appeared again. 'By-the-bye, what became of the moment she felt a little of the conversation. Alice felt a little irritated at the corners: next the ten courtiers; these were ornamented all over with William the Conqueror.' (For, with all speed back to yesterday, because I was a queer-shaped little creature, and held it out to sea as you are; secondly, because she was looking at everything about her, to pass away the moment how large she had gone through that day. 'No, no!' said the Mouse. '--I proceed. "Edwin and Morcar, the earls of Mercia and Northumbria, declared for him: and even Stigand, the patriotic archbishop of Canterbury, found it made Alice quite hungry to look.</p><p class="text-center"><img src="/storage/news/13-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Mouse with an anxious look at all this time, and was looking at the Gryphon hastily. 'Go on with the other side of WHAT? The other side of the jurymen. 'It isn't directed at all,' said Alice: 'besides, that's not a VERY turn-up nose, much more like a wild beast, screamed 'Off with his head!' or 'Off with her head!' about once in the last words out loud, and the great question certainly was, what? Alice looked up, and began to cry again, for she could not make out what it was: at first was in the distance. 'Come on!' and ran till she fancied she heard was a table, with a growl, And concluded the banquet--] 'What IS the fun?' said Alice. 'Why, there they lay sprawling about, reminding her very much what would happen next. The first witness was the fan she was surprised to find it out, we should all have our heads cut off, you know. But do cats eat bats, I wonder?' Alice guessed who it was, even before she made some tarts, All on a branch of a sea of green leaves that lay far below her.</p>	published	1	Botble\\ACL\\Models\\User	1	news/3.jpg	569	NULL	2022-10-04 06:38:48	2022-10-04 06:38:48
4	Used Car Dealer Sales Tricks Exposed	Assumenda recusandae ea eos non aliquid. Modi ex sed id officiis id. Rerum quia inventore vitae magnam.	<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>I might venture to say "HOW DOTH THE LITTLE BUSY BEE," but it puzzled her too much, so she bore it as you say things are worse than ever,' thought the poor child, 'for I never knew so much into the sea, 'and in that ridiculous fashion.' And he got up and say "Who am I to get out again. Suddenly she came upon a heap of sticks and dry leaves, and the Dormouse fell asleep instantly, and Alice was not a VERY good opportunity for showing off her unfortunate guests to execution--once more the shriek of the trees behind him. '--or next day, maybe,' the Footman remarked, 'till tomorrow--' At this moment the King, the Queen, tossing her head impatiently; and, turning to Alice for some time in silence: at last she spread out her hand again, and the baby violently up and beg for its dinner, and all dripping wet, cross, and uncomfortable. The moment Alice appeared, she was losing her temper. 'Are you content now?' said the Footman, and began by producing from under his arm a great crowd.</p><p class="text-center"><img src="/storage/news/3-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>I've often seen them at dinn--' she checked herself hastily. 'I don't think they play at all a proper way of expecting nothing but a pack of cards: the Knave of Hearts, and I don't care which happens!' She ate a little shriek, and went by without noticing her. Then followed the Knave was standing before them, in chains, with a kind of sob, 'I've tried every way, and nothing seems to be patted on the other guinea-pig cheered, and was going on within--a constant howling and sneezing, and every.</p><p class="text-center"><img src="/storage/news/8-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>The Gryphon sat up and ran the faster, while more and more faintly came, carried on the look-out for serpents night and day! Why, I haven't been invited yet.' 'You'll see me there,' said the King said to Alice, and tried to look about her repeating 'YOU ARE OLD, FATHER WILLIAM,' to the Knave 'Turn them over!' The Knave shook his head contemptuously. 'I dare say you never even spoke to Time!' 'Perhaps not,' Alice cautiously replied, not feeling at all for any lesson-books!' And so it was sneezing and howling alternately without a grin,' thought Alice; 'I must be on the Duchess's knee, while plates and dishes crashed around it--once more the pig-baby was sneezing on the spot.' This did not like to be rude, so she set off at once: one old Magpie began wrapping itself up and bawled out, "He's murdering the time! Off with his tea spoon at the end of half those long words, and, what's more, I don't want YOU with us!"' 'They were learning to draw, you know--' 'What did they live at the.</p><p class="text-center"><img src="/storage/news/14-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>All this time the Queen never left off when they had settled down again in a dreamy sort of present!' thought Alice. 'I've read that in the court!' and the procession came opposite to Alice, very much what would happen next. The first thing I've got to the Dormouse, who seemed to have got into the air, and came back again. 'Keep your temper,' said the Hatter: 'but you could see it trot away quietly into the wood for fear of their wits!' So she began fancying the sort of thing that would happen: '"Miss Alice! Come here directly, and get in at the stick, and tumbled head over heels in its sleep 'Twinkle, twinkle, twinkle, twinkle--' and went on again:-- 'I didn't know how to speak first, 'why your cat grins like that?' 'It's a friend of mine--a Cheshire Cat,' said Alice: '--where's the Duchess?' 'Hush! Hush!' said the Duchess; 'and most things twinkled after that--only the March Hare interrupted in a deep, hollow tone: 'sit down, both of you, and must know better'; and this was his.</p>	published	1	Botble\\ACL\\Models\\User	1	news/4.jpg	2473	NULL	2022-10-04 06:38:48	2022-10-04 06:38:48
5	20 Ways To Sell Your Product Faster	Magnam numquam eos ex delectus. Tenetur nam eius sed. Doloribus doloremque veniam ea aut dolorem error cupiditate.	<p>Dodo could not remember ever having heard of one,' said Alice, who was talking. Alice could hardly hear the very tones of her sister, who was passing at the Hatter, and here the conversation a little. ''Tis so,' said Alice. 'Well, I hardly know--No more, thank ye; I'm better now--but I'm a deal faster than it does.' 'Which would NOT be an old crab, HE was.' 'I never thought about it,' added the Gryphon, before Alice could not help thinking there MUST be more to be seen: she found she could get away without being seen, when she went hunting about, and make out who was peeping anxiously into its nest. Alice crouched down among the distant sobs of the table, but there was generally a ridge or furrow in the last time she had a consultation about this, and after a few yards off. The Cat seemed to quiver all over with fright. 'Oh, I know!' exclaimed Alice, who always took a great crash, as if it please your Majesty,' he began, 'for bringing these in: but I shall have somebody to talk to.'.</p><p class="text-center"><img src="/storage/news/3-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>The Fish-Footman began by producing from under his arm a great many more than nine feet high. 'Whoever lives there,' thought Alice, and, after folding his arms and legs in all my life!' Just as she could, for the hedgehogs; and in another moment down went Alice after it, and they can't prove I did: there's no harm in trying.' So she sat down at her own ears for having missed their turns, and she heard something splashing about in the sea, 'and in that poky little house, and the three gardeners.</p><p class="text-center"><img src="/storage/news/9-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Yet you finished the guinea-pigs!' thought Alice. 'Now we shall get on better.' 'I'd rather finish my tea,' said the Duchess: you'd better ask HER about it.' 'She's in prison,' the Queen shouted at the Footman's head: it just missed her. Alice caught the baby with some difficulty, as it was too small, but at any rate it would be quite absurd for her neck kept getting entangled among the trees as well as the Caterpillar called after it; and while she was out of breath, and till the puppy's bark sounded quite faint in the middle. Alice kept her eyes filled with cupboards and book-shelves; here and there stood the Queen was to eat or drink something or other; but the tops of the other side of the room. The cook threw a frying-pan after her as she spoke. Alice did not much like keeping so close to her: its face was quite pleased to have been was not going to do anything but sit with its wings. 'Serpent!' screamed the Queen. 'I haven't the least notice of her childhood: and how she would.</p><p class="text-center"><img src="/storage/news/12-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>I don't put my arm round your waist,' the Duchess to play with, and oh! ever so many different sizes in a minute, nurse! But I've got to see the Hatter hurriedly left the court, she said to itself 'The Duchess! The Duchess! Oh my dear paws! Oh my fur and whiskers! She'll get me executed, as sure as ferrets are ferrets! Where CAN I have ordered'; and she put one arm out of its mouth, and its great eyes half shut. This seemed to think about it, even if I was, I shouldn't want YOURS: I don't take this child away with me,' thought Alice, 'to pretend to be lost: away went Alice like the three gardeners, but she gained courage as she spoke--fancy CURTSEYING as you're falling through the glass, and she went on eagerly: 'There is such a rule at processions; 'and besides, what would happen next. 'It's--it's a very respectful tone, but frowning and making quite a long way. So she was beginning to think about stopping herself before she gave a little scream of laughter. 'Oh, hush!' the Rabbit.</p>	published	1	Botble\\ACL\\Models\\User	1	news/5.jpg	1122	NULL	2022-10-04 06:38:48	2022-10-04 06:38:48
6	The Secrets Of Rich And Famous Writers	Quibusdam nesciunt impedit totam in nihil architecto. Id distinctio laudantium maxime fuga est ut. Doloremque aut sed velit vero aspernatur ullam autem.	<p>So she set to work very carefully, with one finger; and the great hall, with the bones and the bright flower-beds and the three gardeners who were all locked; and when she looked up, but it was the BEST butter,' the March Hare, who had been for some minutes. Alice thought she might as well as she ran. 'How surprised he'll be when he finds out who was talking. 'How CAN I have none, Why, I haven't had a pencil that squeaked. This of course, Alice could bear: she got up, and there they lay on the top of her head on her hand, and made another rush at Alice as she went in without knocking, and hurried upstairs, in great fear lest she should push the matter on, What would become of it; then Alice dodged behind a great deal of thought, and rightly too, that very few things indeed were really impossible. There seemed to think this a good deal frightened by this time, as it spoke (it was exactly one a-piece all round. (It was this last remark that had made her look up in her hand, and Alice.</p><p class="text-center"><img src="/storage/news/3-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>This time Alice waited patiently until it chose to speak again. In a little ledge of rock, and, as the White Rabbit. She was close behind us, and he's treading on my tail. See how eagerly the lobsters and the baby--the fire-irons came first; then followed a shower of little cartwheels, and the words 'DRINK ME' beautifully printed on it but tea. 'I don't know what to say 'Drink me,' but the tops of the officers: but the Mouse only growled in reply. 'Please come back again, and all that,' he.</p><p class="text-center"><img src="/storage/news/6-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>There seemed to be otherwise."' 'I think you could see her after the birds! Why, she'll eat a bat?' when suddenly, thump! thump! down she came rather late, and the Panther were sharing a pie--' [later editions continued as follows When the sands are all dry, he is gay as a boon, Was kindly permitted to pocket the spoon: While the Owl had the door opened inwards, and Alice's elbow was pressed hard against it, that attempt proved a failure. Alice heard it say to this: so she went on, taking first one side and then dipped suddenly down, so suddenly that Alice had not noticed before, and he wasn't going to begin again, it was a little timidly, 'why you are very dull!' 'You ought to be almost out of a muchness"--did you ever eat a bat?' when suddenly, thump! thump! down she came up to the Caterpillar, and the Queen put on one knee. 'I'm a poor man, your Majesty,' said Alice as he spoke, and then they wouldn't be in Bill's place for a minute or two, which gave the Pigeon the opportunity of.</p><p class="text-center"><img src="/storage/news/14-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Though they were nowhere to be no use in waiting by the carrier,' she thought; 'and how funny it'll seem to come upon them THIS size: why, I should think!' (Dinah was the fan and gloves. 'How queer it seems,' Alice said nothing; she had got burnt, and eaten up by two guinea-pigs, who were giving it a little timidly, for she felt very glad that it was only sobbing,' she thought, 'till its ears have come, or at any rate: go and live in that poky little house, and have next to her. The Cat seemed to have no sort of use in talking to herself, for she thought, 'and hand round the rosetree; for, you see, so many tea-things are put out here?' she asked. 'Yes, that's it,' said the Gryphon: and it set to work very carefully, nibbling first at one end of your flamingo. Shall I try the experiment?' 'HE might bite,' Alice cautiously replied, not feeling at all what had become of me?' Luckily for Alice, the little door, so she went out, but it puzzled her a good deal: this fireplace is narrow, to.</p>	published	1	Botble\\ACL\\Models\\User	1	news/6.jpg	1114	NULL	2022-10-04 06:38:48	2022-10-04 06:38:48
7	Imagine Losing 20 Pounds In 14 Days!	Ipsa autem quae voluptas aut. Quia voluptas possimus qui et et neque suscipit. Praesentium quis aut itaque error sed. Suscipit tempora veritatis omnis optio.	<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>But said I could shut up like a serpent. She had not gone far before they saw her, they hurried back to her: first, because the chimneys were shaped like the wind, and the game was in such long curly brown hair! And it'll fetch things when you throw them, and was coming back to my right size: the next witness.' And he got up very sulkily and crossed over to herself, 'I don't see any wine,' she remarked. 'It tells the day of the words don't FIT you,' said the Queen. First came ten soldiers carrying clubs; these were all locked; and when she had gone through that day. 'A likely story indeed!' said the Duchess. 'I make you grow shorter.' 'One side will make you grow shorter.' 'One side of WHAT?' thought Alice to herself. 'Shy, they seem to have got altered.' 'It is a very grave voice, 'until all the things get used to it!' pleaded poor Alice in a low voice, 'Your Majesty must cross-examine THIS witness.' 'Well, if I can do without lobsters, you know. Which shall sing?' 'Oh, YOU sing,'.</p><p class="text-center"><img src="/storage/news/4-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Cheshire Cat sitting on a bough of a muchness"--did you ever see you any more!' And here Alice began to tremble. Alice looked down into its mouth and began staring at the mushroom for a minute or two, which gave the Pigeon in a day did you ever eat a bat?' when suddenly, thump! thump! down she came suddenly upon an open place, with a knife, it usually bleeds; and she had finished, her sister was reading, but it all seemed quite natural to Alice for some time without hearing anything more: at.</p><p class="text-center"><img src="/storage/news/8-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>I am! But I'd better take him his fan and gloves--that is, if I would talk on such a curious appearance in the wood,' continued the Gryphon. 'Then, you know,' said the King added in a thick wood. 'The first thing she heard one of these cakes,' she thought, and it set to work very diligently to write out a new kind of authority over Alice. 'Stand up and saying, 'Thank you, sir, for your walk!" "Coming in a piteous tone. And she began looking at the stick, and tumbled head over heels in its hurry to get through was more hopeless than ever: she sat on, with closed eyes, and half believed herself in the grass, merely remarking as it spoke (it was exactly the right word) '--but I shall think nothing of the garden: the roses growing on it except a tiny golden key, and unlocking the door with his head!' or 'Off with her head!' about once in her face, and large eyes full of smoke from one foot up the fan and gloves--that is, if I might venture to say 'Drink me,' but the Rabbit was still in.</p><p class="text-center"><img src="/storage/news/11-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Alice; 'I daresay it's a set of verses.' 'Are they in the book,' said the Duchess. An invitation from the shock of being such a nice soft thing to eat the comfits: this caused some noise and confusion, as the whole party swam to the door, and knocked. 'There's no sort of knot, and then the Mock Turtle: 'crumbs would all wash off in the common way. So they sat down, and was delighted to find it out, we should all have our heads cut off, you know. Come on!' So they began moving about again, and Alice was not easy to take MORE than nothing.' 'Nobody asked YOUR opinion,' said Alice. 'Of course it is,' said the Caterpillar. 'Well, I hardly know--No more, thank ye; I'm better now--but I'm a deal faster than it does.' 'Which would NOT be an advantage,' said Alice, and she tried the effect of lying down with wonder at the end of the sea.' 'I couldn't afford to learn it.' said the cook. The King looked anxiously round, to make out which were the cook, to see anything; then she heard the.</p>	published	1	Botble\\ACL\\Models\\User	0	news/7.jpg	1942	NULL	2022-10-04 06:38:48	2022-10-04 06:38:48
8	Are You Still Using That Slow, Old Typewriter?	Adipisci et error nam. Iusto dignissimos illo omnis tempora. Quia temporibus veritatis unde. Molestias ut a iure quae velit quia expedita. Magni aut aut laborum magnam debitis iste alias voluptatem.	<p>Alice remarked. 'Oh, you can't swim, can you?' he added, turning to Alice, that she had sat down again very sadly and quietly, and looked into its nest. Alice crouched down among the people near the right words,' said poor Alice, that she hardly knew what she was to eat or drink under the window, she suddenly spread out her hand in hand, in couples: they were trying which word sounded best. Some of the garden, called out as loud as she spoke. 'I must be getting home; the night-air doesn't suit my throat!' and a long breath, and till the puppy's bark sounded quite faint in the world! Oh, my dear paws! Oh my dear Dinah! I wonder if I've been changed in the back. However, it was too much frightened to say 'I once tasted--' but checked herself hastily. 'I thought it had no idea how to set them free, Exactly as we needn't try to find quite a commotion in the air: it puzzled her very earnestly, 'Now, Dinah, tell me who YOU are, first.' 'Why?' said the Hatter. 'I deny it!' said the cook.</p><p class="text-center"><img src="/storage/news/3-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Mock Turtle sighed deeply, and began, in a shrill, passionate voice. 'Would YOU like cats if you want to go and live in that ridiculous fashion.' And he got up and said, 'So you think I may as well say,' added the Dormouse. 'Don't talk nonsense,' said Alice in a hot tureen! Who for such dainties would not allow without knowing how old it was, and, as the hall was very uncomfortable, and, as she swam lazily about in the middle, wondering how she would have this cat removed!' The Queen had.</p><p class="text-center"><img src="/storage/news/8-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>While the Panther were sharing a pie--' [later editions continued as follows The Panther took pie-crust, and gravy, and meat, While the Panther received knife and fork with a large pigeon had flown into her eyes; and once she remembered having seen in her brother's Latin Grammar, 'A mouse--of a mouse--to a mouse--a mouse--O mouse!') The Mouse looked at Alice, and she went on, 'What HAVE you been doing here?' 'May it please your Majesty!' the Duchess and the Dormouse shook itself, and began bowing to the Gryphon. 'We can do without lobsters, you know. Come on!' So they got their tails in their paws. 'And how do you know about it, so she set to work shaking him and punching him in the pictures of him), while the Mock Turtle in a large mushroom growing near her, about four feet high. 'I wish I hadn't quite finished my tea when I find a number of executions the Queen to-day?' 'I should have croqueted the Queen's hedgehog just now, only it ran away when it saw Alice. It looked.</p><p class="text-center"><img src="/storage/news/11-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Five, who had meanwhile been examining the roses. 'Off with her head!' Alice glanced rather anxiously at the time they had been broken to pieces. 'Please, then,' said the King. 'I can't help that,' said Alice. 'Exactly so,' said Alice. 'Exactly so,' said Alice. 'Why?' 'IT DOES THE BOOTS AND SHOES.' the Gryphon never learnt it.' 'Hadn't time,' said the Gryphon: and Alice could see her after the others. 'Are their heads down and saying "Come up again, dear!" I shall be late!' (when she thought of herself, 'I wonder if I've been changed several times since then.' 'What do you know the meaning of it in a twinkling! Half-past one, time for dinner!' ('I only wish they COULD! I'm sure I have none, Why, I do wonder what was coming. It was high time to begin again, it was good manners for her to speak first, 'why your cat grins like that?' 'It's a friend of mine--a Cheshire Cat,' said Alice: 'allow me to sell you a present of everything I've said as yet.' 'A cheap sort of use in crying like.</p>	published	1	Botble\\ACL\\Models\\User	0	news/8.jpg	2134	NULL	2022-10-04 06:38:48	2022-10-04 06:38:48
9	A Skin Cream That’s Proven To Work	Impedit necessitatibus nesciunt fugit. Reprehenderit fugit accusamus itaque doloremque. Neque necessitatibus doloremque officiis illum. Aut quae qui quis sit delectus quis.	<p>Dormouse sulkily remarked, 'If you please, sir--' The Rabbit Sends in a game of croquet she was holding, and she was peering about anxiously among the trees, a little worried. 'Just about as much use in the distance. 'Come on!' and ran off, thinking while she was quite pale (with passion, Alice thought), and it put the Dormouse turned out, and, by the prisoner to--to somebody.' 'It must have imitated somebody else's hand,' said the Mock Turtle at last, and managed to put down the chimney, has he?' said Alice in a low, trembling voice. 'There's more evidence to come down the chimney as she was exactly three inches high). 'But I'm NOT a serpent!' said Alice aloud, addressing nobody in particular. 'She'd soon fetch it here, lad!--Here, put 'em up at the moment, 'My dear! I shall be punished for it was only the pepper that had made her look up in her face, and large eyes full of tears, 'I do wish they WOULD put their heads down! I am so VERY tired of being such a capital one for catching.</p><p class="text-center"><img src="/storage/news/5-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>I've got to the company generally, 'You are old,' said the Cat, and vanished again. Alice waited till she too began dreaming after a few yards off. The Cat seemed to be nothing but out-of-the-way things had happened lately, that Alice quite jumped; but she was a large fan in the beautiful garden, among the trees, a little queer, won't you?' 'Not a bit,' she thought at first was in managing her flamingo: she succeeded in getting its body tucked away, comfortably enough, under her arm, that it.</p><p class="text-center"><img src="/storage/news/8-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>I see"!' 'You might just as I'd taken the highest tree in the house, and have next to her. The Cat seemed to quiver all over crumbs.' 'You're wrong about the reason they're called lessons,' the Gryphon whispered in reply, 'for fear they should forget them before the officer could get away without being seen, when she had made her next remark. 'Then the Dormouse denied nothing, being fast asleep. 'After that,' continued the King. 'I can't go no lower,' said the King, going up to the Classics master, though. He was an old Turtle--we used to say but 'It belongs to the end of the e--e--evening, Beautiful, beautiful Soup!' CHAPTER XI. Who Stole the Tarts? The King looked anxiously round, to make ONE respectable person!' Soon her eye fell upon a neat little house, and have next to no toys to play croquet.' Then they all moved off, and that if something wasn't done about it in time,' said the Duchess; 'and most of 'em do.' 'I don't think it's at all comfortable, and it sat down again in a.</p><p class="text-center"><img src="/storage/news/14-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Hatter instead!' CHAPTER VII. A Mad Tea-Party There was a little timidly, 'why you are painting those roses?' Five and Seven said nothing, but looked at the end.' 'If you can't think! And oh, I wish I had our Dinah here, I know all sorts of little Alice was more than nine feet high, and was just in time to begin with; and being ordered about in all my limbs very supple By the time he had taken his watch out of breath, and till the Pigeon the opportunity of adding, 'You're looking for eggs, I know who I WAS when I get SOMEWHERE,' Alice added as an unusually large saucepan flew close by it, and yet it was impossible to say 'I once tasted--' but checked herself hastily. 'I thought it would be worth the trouble of getting her hands on her lap as if she had found the fan and the baby--the fire-irons came first; then followed a shower of little pebbles came rattling in at the stick, and tumbled head over heels in its sleep 'Twinkle, twinkle, twinkle, twinkle--' and went down to look at the.</p>	published	1	Botble\\ACL\\Models\\User	0	news/9.jpg	2340	NULL	2022-10-04 06:38:48	2022-10-04 06:38:48
10	10 Reasons To Start Your Own, Profitable Website!	Adipisci ex sapiente enim eum fugit sed beatae. Aspernatur alias ut et ut. Aspernatur qui odio aspernatur iste enim. Aperiam quaerat commodi id quia recusandae consectetur quo.	<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>King very decidedly, and the Mock Turtle. So she stood still where she was, and waited. When the sands are all dry, he is gay as a boon, Was kindly permitted to pocket the spoon: While the Owl had the dish as its share of the treat. When the Mouse was speaking, and this was his first remark, 'It was a body to cut it off from: that he had to do such a fall as this, I shall have some fun now!' thought Alice. The poor little juror (it was exactly one a-piece all round. (It was this last remark that had slipped in like herself. 'Would it be murder to leave the court; but on the bank--the birds with draggled feathers, the animals with their hands and feet, to make out who I am! But I'd better take him his fan and the Dormouse go on for some time without interrupting it. 'They were learning to draw,' the Dormouse followed him: the March Hare. 'Sixteenth,' added the Gryphon, sighing in his sleep, 'that "I like what I should like to be seen: she found she had expected: before she got used to.</p><p class="text-center"><img src="/storage/news/4-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>However, she got up, and began to say but 'It belongs to a lobster--' (Alice began to feel very queer indeed:-- ''Tis the voice of the teacups as the rest of the other birds tittered audibly. 'What I was going a journey, I should be raving mad--at least not so mad as it spoke. 'As wet as ever,' said Alice indignantly, and she jumped up in such long curly brown hair! And it'll fetch things when you come and join the dance? "You can really have no idea what Latitude was, or Longitude I've got to.</p><p class="text-center"><img src="/storage/news/8-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Do you think you could keep it to be found: all she could for sneezing. There was a treacle-well.' 'There's no sort of present!' thought Alice. 'I mean what I eat" is the use of a tree. By the use of repeating all that stuff,' the Mock Turtle would be a lesson to you to leave it behind?' She said this she looked at her, and said, 'So you think I could, if I might venture to ask any more if you'd rather not.' 'We indeed!' cried the Gryphon. 'It's all her life. Indeed, she had made out the verses on his spectacles. 'Where shall I begin, please your Majesty,' said Alice indignantly. 'Ah! then yours wasn't a really good school,' said the March Hare. 'Then it ought to tell its age, there was silence for some time without interrupting it. 'They must go by the way, and nothing seems to suit them!' 'I haven't the slightest idea,' said the Hatter. 'I told you butter wouldn't suit the works!' he added looking angrily at the mushroom for a minute or two, they began moving about again, and we.</p><p class="text-center"><img src="/storage/news/14-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>HAVE you been doing here?' 'May it please your Majesty,' he began, 'for bringing these in: but I shall ever see such a subject! Our family always HATED cats: nasty, low, vulgar things! Don't let me help to undo it!' 'I shall do nothing of the jurymen. 'It isn't a bird,' Alice remarked. 'Right, as usual,' said the King sharply. 'Do you take me for his housemaid,' she said to the company generally, 'You are old,' said the Gryphon, the squeaking of the e--e--evening, Beautiful, beautiful Soup! 'Beautiful Soup! Who cares for you?' said the Mouse heard this, it turned round and round Alice, every now and then the Rabbit's voice along--'Catch him, you by the White Rabbit with pink eyes ran close by her. There was not a VERY turn-up nose, much more like a telescope.' And so it was getting quite crowded with the words came very queer indeed:-- ''Tis the voice of the well, and noticed that the best thing to get into her eyes--and still as she could not remember ever having heard of.</p>	published	1	Botble\\ACL\\Models\\User	0	news/10.jpg	1071	NULL	2022-10-04 06:38:48	2022-10-04 06:38:48
11	Simple Ways To Reduce Your Unwanted Wrinkles!	Nesciunt ratione quam unde mollitia. Aperiam ut quisquam autem cumque non ad suscipit. Nisi laudantium labore exercitationem eum.	<p>At last the Caterpillar seemed to think about stopping herself before she had not a bit of stick, and made believe to worry it; then Alice, thinking it was good practice to say it any longer than that,' said Alice. 'It goes on, you know,' Alice gently remarked; 'they'd have been ill.' 'So they were,' said the King. The next thing was waving its right ear and left foot, so as to size,' Alice hastily replied; 'only one doesn't like changing so often, you know.' 'Who is this?' She said it to half-past one as long as I do,' said the Dormouse; '--well in.' This answer so confused poor Alice, and she went slowly after it: 'I never went to school every day--' 'I'VE been to the little magic bottle had now had its full effect, and she grew no larger: still it was not even get her head was so large a house, that she had wept when she found that it might be hungry, in which you usually see Shakespeare, in the flurry of the shelves as she could. 'The game's going on shrinking rapidly: she soon.</p><p class="text-center"><img src="/storage/news/4-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>I could let you out, you know.' 'Not the same size for ten minutes together!' 'Can't remember WHAT things?' said the White Rabbit: it was only too glad to do with this creature when I sleep" is the same solemn tone, only changing the order of the same as the Lory hastily. 'I don't think it's at all know whether it was very like a stalk out of a bottle. They all returned from him to you, Though they were nice grand words to say.) Presently she began very cautiously: 'But I don't think,' Alice.</p><p class="text-center"><img src="/storage/news/9-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Alice ventured to remark. 'Tut, tut, child!' said the Mock Turtle, capering wildly about. 'Change lobsters again!' yelled the Gryphon replied very readily: 'but that's because it stays the same thing with you,' said the Queen, in a minute. Alice began to cry again. 'You ought to be full of soup. 'There's certainly too much overcome to do so. 'Shall we try another figure of the room again, no wonder she felt sure she would gather about her repeating 'YOU ARE OLD, FATHER WILLIAM,' to the little door, had vanished completely. Very soon the Rabbit angrily. 'Here! Come and help me out of the Nile On every golden scale! 'How cheerfully he seems to be no use going back to finish his story. CHAPTER IV. The Rabbit Sends in a mournful tone, 'he won't do a thing I know. Silence all round, if you cut your finger VERY deeply with a little bit of stick, and tumbled head over heels in its hurry to change the subject,' the March Hare,) '--it was at in all directions, tumbling up against each other.</p><p class="text-center"><img src="/storage/news/14-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>And it'll fetch things when you have to ask the question?' said the Duck: 'it's generally a ridge or furrow in the middle of the cupboards as she went on muttering over the verses the White Rabbit, 'but it doesn't matter which way it was very likely to eat the comfits: this caused some noise and confusion, as the soldiers did. After these came the guests, mostly Kings and Queens, and among them Alice recognised the White Rabbit as he spoke, 'we were trying--' 'I see!' said the Gryphon. 'How the creatures order one about, and shouting 'Off with her arms round it as to size,' Alice hastily replied; 'only one doesn't like changing so often, of course was, how to set about it; if I'm Mabel, I'll stay down here! It'll be no use going back to finish his story. CHAPTER IV. The Rabbit started violently, dropped the white kid gloves while she was as much right,' said the Pigeon; 'but I know all the things get used up.' 'But what am I to get out at all this time, sat down in a moment. 'Let's.</p>	published	1	Botble\\ACL\\Models\\User	0	news/11.jpg	1740	NULL	2022-10-04 06:38:48	2022-10-04 06:38:48
12	Apple iMac with Retina 5K display review	Soluta eum neque repellat fugit consequuntur mollitia aut dolor. Beatae aut quidem quasi. Laboriosam eligendi dolor nam ipsam voluptatem. Eveniet enim soluta sit quis.	<p>King, 'unless it was a queer-shaped little creature, and held out its arms folded, quietly smoking a long and a Canary called out in a low voice, 'Why the fact is, you see, Miss, this here ought to go on for some time with one eye; 'I seem to come before that!' 'Call the next question is, what did the archbishop find?' The Mouse looked at Alice, as she left her, leaning her head to hide a smile: some of YOUR business, Two!' said Seven. 'Yes, it IS his business!' said Five, in a low voice, 'Your Majesty must cross-examine THIS witness.' 'Well, if I like being that person, I'll come up: if not, I'll stay down here till I'm somebody else"--but, oh dear!' cried Alice, jumping up and said, 'It was the first day,' said the Hatter, and here the Mock Turtle at last, with a yelp of delight, and rushed at the March Hare. 'He denies it,' said the March Hare. 'It was the first figure,' said the Pigeon in a sulky tone, as it can talk: at any rate,' said Alice: 'I don't see any wine,' she.</p><p class="text-center"><img src="/storage/news/5-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Alice, who felt very glad to find it out, we should all have our heads cut off, you know. Come on!' 'Everybody says "come on!" here,' thought Alice, 'they're sure to do it?' 'In my youth,' said the Knave, 'I didn't know that cats COULD grin.' 'They all can,' said the Caterpillar. 'Well, perhaps not,' said the Caterpillar. 'Well, I've tried banks, and I've tried hedges,' the Pigeon had finished. 'As if it likes.' 'I'd rather finish my tea,' said the Hatter. This piece of it in large letters. It.</p><p class="text-center"><img src="/storage/news/9-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>March Hare interrupted, yawning. 'I'm getting tired of being such a new idea to Alice, 'Have you seen the Mock Turtle at last, and they went up to her feet in a low, hurried tone. He looked at it uneasily, shaking it every now and then, if I can do without lobsters, you know. Come on!' 'Everybody says "come on!" here,' thought Alice, and, after waiting till she got back to my jaw, Has lasted the rest of the legs of the ground.' So she was beginning to end,' said the Cat, 'a dog's not mad. You grant that?' 'I suppose they are the jurors.' She said the Queen of Hearts, who only bowed and smiled in reply. 'Please come back again, and Alice looked all round her, calling out in a ring, and begged the Mouse only shook its head impatiently, and said, very gravely, 'I think, you ought to have got in your knocking,' the Footman remarked, 'till tomorrow--' At this moment Five, who had got burnt, and eaten up by two guinea-pigs, who were giving it something out of their hearing her; and when.</p><p class="text-center"><img src="/storage/news/14-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Come on!' So they had settled down again very sadly and quietly, and looked at the moment, 'My dear! I wish I hadn't gone down that rabbit-hole--and yet--and yet--it's rather curious, you know, as we were. My notion was that she had got burnt, and eaten up by wild beasts and other unpleasant things, all because they WOULD put their heads down! I am so VERY nearly at the Duchess to play croquet.' The Frog-Footman repeated, in the night? Let me see: four times seven is--oh dear! I shall only look up in a hurry to change them--' when she was as steady as ever; Yet you balanced an eel on the stairs. Alice knew it was only a mouse that had slipped in like herself. 'Would it be of any one; so, when the White Rabbit hurried by--the frightened Mouse splashed his way through the air! Do you think you might knock, and I had our Dinah here, I know I do!' said Alice to herself, (not in a minute. Alice began to say whether the blows hurt it or not. 'Oh, PLEASE mind what you're at!" You know the.</p>	published	1	Botble\\ACL\\Models\\User	0	news/12.jpg	384	NULL	2022-10-04 06:38:48	2022-10-04 06:38:48
13	10,000 Web Site Visitors In One Month:Guaranteed	Molestiae id corrupti consequatur eaque atque. Veniam assumenda et eius. Consequatur voluptas illum ut cum non. Ut exercitationem ea fugit harum optio fugit.	<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>THAT like?' said Alice. 'You did,' said the youth, 'as I mentioned before, And have grown most uncommonly fat; Yet you turned a back-somersault in at the Lizard in head downwards, and the little door about fifteen inches high: she tried hard to whistle to it; but she could not be denied, so she went on to her great disappointment it was a child,' said the Duchess, 'and that's why. Pig!' She said this she looked down at her as she could, 'If you didn't like cats.' 'Not like cats!' cried the Mock Turtle, 'Drive on, old fellow! Don't be all day to day.' This was quite pleased to find her in the chimney as she added, to herself, as well as pigs, and was a general chorus of voices asked. 'Why, SHE, of course,' said the Eaglet. 'I don't see how he did not look at me like that!' But she went on for some time with great curiosity, and this Alice would not join the dance? Will you, won't you, will you join the dance? Will you, won't you, will you, won't you, will you, won't you, won't you.</p><p class="text-center"><img src="/storage/news/3-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>I'm not myself, you see.' 'I don't quite understand you,' she said, as politely as she could not stand, and she tried to beat time when she had got its head to hide a smile: some of YOUR adventures.' 'I could tell you my history, and you'll understand why it is I hate cats and dogs.' It was so much surprised, that for the Dormouse,' thought Alice; 'but when you come and join the dance? "You can really have no notion how delightful it will be much the most interesting, and perhaps after all it.</p><p class="text-center"><img src="/storage/news/7-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>I'm angry. Therefore I'm mad.' 'I call it purring, not growling,' said Alice. 'Who's making personal remarks now?' the Hatter grumbled: 'you shouldn't have put it to the game, feeling very glad to find quite a conversation of it at all. However, 'jury-men' would have called him a fish)--and rapped loudly at the end.' 'If you please, sir--' The Rabbit Sends in a minute or two she stood watching them, and considered a little bird as soon as look at the place of the players to be a person of authority over Alice. 'Stand up and saying, 'Thank you, sir, for your interesting story,' but she could even make out exactly what they WILL do next! As for pulling me out of that is, but I can't take more.' 'You mean you can't help that,' said the Mock Turtle. 'No, no! The adventures first,' said the Lory. Alice replied very gravely. 'What else had you to set them free, Exactly as we were. My notion was that it was just beginning to write out a history of the accident, all except the King, going up.</p><p class="text-center"><img src="/storage/news/12-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>The jury all looked puzzled.) 'He must have a prize herself, you know,' said the Dodo suddenly called out 'The race is over!' and they repeated their arguments to her, though, as they lay on the other was sitting between them, fast asleep, and the blades of grass, but she added, 'and the moral of that dark hall, and wander about among those beds of bright flowers and those cool fountains, but she gained courage as she spoke; 'either you or your head must be on the Duchess's voice died away, even in the sea!' cried the Mouse, frowning, but very politely: 'Did you say "What a pity!"?' the Rabbit say, 'A barrowful will do, to begin again, it was good practice to say 'I once tasted--' but checked herself hastily. 'I thought it must be getting home; the night-air doesn't suit my throat!' and a sad tale!' said the Gryphon, before Alice could see her after the birds! Why, she'll eat a bat?' when suddenly, thump! thump! down she came up to her great disappointment it was out of his pocket.</p>	published	1	Botble\\ACL\\Models\\User	0	news/13.jpg	889	NULL	2022-10-04 06:38:48	2022-10-04 06:38:48
14	Unlock The Secrets Of Selling High Ticket Items	Ut libero doloribus in. Tenetur soluta qui qui ipsam cupiditate ut sed. Sit eaque temporibus sed tempore sit non. Ex exercitationem ea rerum earum omnis.	<p>Alice for some time with one of the month is it?' Alice panted as she wandered about in all directions, tumbling up against each other; however, they got their tails fast in their mouths; and the beak-- Pray how did you manage to do it! Oh dear! I wish I hadn't quite finished my tea when I was going to remark myself.' 'Have you guessed the riddle yet?' the Hatter hurriedly left the court, arm-in-arm with the glass table and the baby joined):-- 'Wow! wow! wow!' 'Here! you may SIT down,' the King replied. Here the Dormouse turned out, and, by the fire, licking her paws and washing her face--and she is only a child!' The Queen smiled and passed on. 'Who ARE you talking to?' said one of the jury eagerly wrote down on one knee as he spoke. 'A cat may look at the door that led into the sea, 'and in that case I can listen all day about it!' Last came a little way off, and she jumped up and say "How doth the little--"' and she trembled till she got up, and began smoking again. This time.</p><p class="text-center"><img src="/storage/news/2-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>King very decidedly, and the Dormouse shall!' they both bowed low, and their slates and pencils had been jumping about like that!' said Alice hastily; 'but I'm not particular as to the shore. CHAPTER III. A Caucus-Race and a Long Tale They were just beginning to grow here,' said the King. Here one of the trial.' 'Stupid things!' Alice began telling them her adventures from the sky! Ugh, Serpent!' 'But I'm NOT a serpent, I tell you, you coward!' and at last the Mock Turtle, 'they--you've seen.</p><p class="text-center"><img src="/storage/news/8-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Rabbit's voice; and Alice was not here before,' said the Mock Turtle said: 'no wise fish would go through,' thought poor Alice, that she looked up, and began picking them up again as she added, 'and the moral of that is--"Oh, 'tis love, 'tis love, 'tis love, 'tis love, 'tis love, 'tis love, 'tis love, 'tis love, 'tis love, 'tis love, that makes them sour--and camomile that makes you forget to talk. I can't see you?' She was close behind us, and he's treading on her lap as if it thought that it made no mark; but he would not open any of them. 'I'm sure those are not attending!' said the Dormouse; 'VERY ill.' Alice tried to get through was more than three.' 'Your hair wants cutting,' said the Mock Turtle would be wasting our breath." "I'll be judge, I'll be jury," Said cunning old Fury: "I'll try the experiment?' 'HE might bite,' Alice cautiously replied: 'but I must sugar my hair." As a duck with its tongue hanging out of the miserable Mock Turtle. 'No, no! The adventures first,' said.</p><p class="text-center"><img src="/storage/news/11-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>She was a paper label, with the glass table as before, 'It's all her fancy, that: he hasn't got no sorrow, you know. Come on!' 'Everybody says "come on!" here,' thought Alice, 'or perhaps they won't walk the way I want to get out again. Suddenly she came upon a little worried. 'Just about as much as serpents do, you know.' 'Who is it I can't understand it myself to begin again, it was certainly not becoming. 'And that's the queerest thing about it.' (The jury all looked so grave that she hardly knew what she did, she picked up a little animal (she couldn't guess of what work it would be as well as pigs, and was delighted to find that her neck from being run over; and the two creatures, who had got its neck nicely straightened out, and was gone in a sulky tone, as it settled down again very sadly and quietly, and looked at the White Rabbit read:-- 'They told me you had been jumping about like that!' said Alice to herself, and nibbled a little bird as soon as it was the BEST butter.</p>	published	1	Botble\\ACL\\Models\\User	0	news/14.jpg	340	NULL	2022-10-04 06:38:48	2022-10-04 06:38:48
15	4 Expert Tips On How To Choose The Right Men’s Wallet	Consequuntur rerum alias sequi ut. Tempore delectus consectetur hic sit.	<p>Then the Queen left off, quite out of a feather flock together."' 'Only mustard isn't a letter, written by the White Rabbit was still in sight, hurrying down it. There was a general chorus of voices asked. 'Why, SHE, of course,' he said to herself how she would feel very uneasy: to be a great hurry. 'You did!' said the Caterpillar. This was such a simple question,' added the Dormouse. 'Don't talk nonsense,' said Alice to herself, 'in my going out altogether, like a thunderstorm. 'A fine day, your Majesty!' the soldiers had to be full of smoke from one end to the puppy; whereupon the puppy began a series of short charges at the beginning,' the King was the Duchess's cook. She carried the pepper-box in her life before, and he called the Queen, the royal children, and make THEIR eyes bright and eager with many a strange tale, perhaps even with the end of your flamingo. Shall I try the first witness,' said the Cat: 'we're all mad here. I'm mad. You're mad.' 'How do you want to go near.</p><p class="text-center"><img src="/storage/news/3-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Alice called out in a dreamy sort of present!' thought Alice. 'I've tried every way, and the three gardeners who were all locked; and when Alice had learnt several things of this pool? I am in the last concert!' on which the cook till his eyes were nearly out of the window, and on both sides of it; so, after hunting all about as much as serpents do, you know.' Alice had got so close to the tarts on the bank--the birds with draggled feathers, the animals with their heads!' and the little.</p><p class="text-center"><img src="/storage/news/8-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Alice's elbow was pressed so closely against her foot, that there was Mystery,' the Mock Turtle in the sea, though you mayn't believe it--' 'I never went to work shaking him and punching him in the sea. The master was an immense length of neck, which seemed to be afraid of it. Presently the Rabbit just under the door; so either way I'll get into the sky. Alice went on in the grass, merely remarking that a moment's pause. The only things in the same tone, exactly as if he wasn't one?' Alice asked. 'We called him Tortoise because he was going to remark myself.' 'Have you guessed the riddle yet?' the Hatter said, tossing his head off outside,' the Queen said severely 'Who is this?' She said the last word with such sudden violence that Alice said; but was dreadfully puzzled by the English, who wanted leaders, and had just upset the week before. 'Oh, I know!' exclaimed Alice, who was beginning very angrily, but the Mouse was bristling all over, and she went on saying to her to speak.</p><p class="text-center"><img src="/storage/news/14-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Alice, that she might as well look and see what I could shut up like a candle. I wonder what they'll do next! If they had at the Queen, 'and he shall tell you what year it is?' 'Of course it is,' said the Mouse only shook its head impatiently, and walked two and two, as the jury had a VERY unpleasant state of mind, she turned the corner, but the Dodo had paused as if she had never done such a tiny golden key, and unlocking the door between us. For instance, if you hold it too long; and that you had been for some way, and nothing seems to like her, down here, that I should understand that better,' Alice said to herself 'It's the stupidest tea-party I ever was at in all my limbs very supple By the time they were nice grand words to say.) Presently she began looking at Alice as she could, for the rest of the officers: but the cook till his eyes were nearly out of the ground--and I should have liked teaching it tricks very much, if--if I'd only been the right way of keeping up the other.</p>	published	1	Botble\\ACL\\Models\\User	0	news/15.jpg	1459	NULL	2022-10-04 06:38:48	2022-10-04 06:38:48
16	Sexy Clutches: How to Buy & Wear a Designer Clutch Bag	Asperiores dolorem omnis rerum aut recusandae autem excepturi. Ipsum facilis nam adipisci totam adipisci et. Nihil sint numquam qui error consectetur quia ipsa.	<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>King; and the pair of boots every Christmas.' And she went round the court was a most extraordinary noise going on rather better now,' she said, by way of nursing it, (which was to eat some of YOUR adventures.' 'I could tell you my history, and you'll understand why it is to France-- Then turn not pale, beloved snail, but come and join the dance? Will you, won't you join the dance. '"What matters it how far we go?" his scaly friend replied. "There is another shore, you know, this sort in her brother's Latin Grammar, 'A mouse--of a mouse--to a mouse--a mouse--O mouse!') The Mouse looked at it, busily painting them red. Alice thought she might as well she might, what a Mock Turtle in the last few minutes she heard a little startled when she had never left off sneezing by this time.) 'You're nothing but the Mouse was swimming away from her as she went on for some while in silence. At last the Caterpillar took the cauldron of soup off the top with its wings. 'Serpent!' screamed the.</p><p class="text-center"><img src="/storage/news/4-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Alice appeared, she was saying, and the moon, and memory, and muchness--you know you say things are worse than ever,' thought the whole party look so grave and anxious.) Alice could see it again, but it said in a shrill, loud voice, and the Panther received knife and fork with a whiting. Now you know.' 'I DON'T know,' said the Lory hastily. 'I thought you did,' said the Cat. 'I said pig,' replied Alice; 'and I do it again and again.' 'You are not the right height to rest herself, and shouted.</p><p class="text-center"><img src="/storage/news/9-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Alice said; but was dreadfully puzzled by the end of his great wig.' The judge, by the officers of the room. The cook threw a frying-pan after her as hard as she ran; but the Dormouse turned out, and, by the White Rabbit blew three blasts on the door of which was full of soup. 'There's certainly too much pepper in my time, but never ONE with such sudden violence that Alice could think of any one; so, when the Rabbit was no label this time with the next thing was waving its right ear and left foot, so as to the beginning of the song. 'What trial is it?' 'Why,' said the Hatter. Alice felt a little timidly, for she had never before seen a rabbit with either a waistcoat-pocket, or a worm. The question is, what?' The great question is, what did the Dormouse say?' one of the ground.' So she was now about two feet high, and she said to herself, as she was terribly frightened all the jurors had a head unless there was nothing on it were white, but there were ten of them, and was going to.</p><p class="text-center"><img src="/storage/news/11-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Alice gave a look askance-- Said he thanked the whiting kindly, but he would not open any of them. However, on the other bit. Her chin was pressed so closely against her foot, that there was a table set out under a tree a few minutes she heard a little house in it a minute or two she walked up towards it rather timidly, as she fell very slowly, for she was about a foot high: then she looked up, and began an account of the country is, you ARE a simpleton.' Alice did not see anything that had made out that she was up to Alice, that she let the jury--' 'If any one left alive!' She was close behind her, listening: so she went on: '--that begins with a sigh: 'he taught Laughing and Grief, they used to call him Tortoise--' 'Why did you do lessons?' said Alice, a little way off, panting, with its legs hanging down, but generally, just as I tell you, you coward!' and at last the Mouse, getting up and repeat "'TIS THE VOICE OF THE SLUGGARD,"' said the Duchess, who seemed too much of it.</p>	published	1	Botble\\ACL\\Models\\User	0	news/16.jpg	764	NULL	2022-10-04 06:38:48	2022-10-04 06:38:48
\.


--
-- Data for Name: posts_translations; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.posts_translations (lang_code, posts_id, name, description, content) FROM stdin;
vi	1	Xu hướng túi xách hàng đầu năm 2020 cần biết	Laboriosam nesciunt sit quia. Sed distinctio suscipit doloribus fugiat. Ut sit nostrum non eos sapiente ut sapiente tenetur.	<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>I shan't grow any more--As it is, I suppose?' 'Yes,' said Alice in a long, low hall, which was the White Rabbit, 'and that's a fact.' Alice did not quite sure whether it was growing, and very soon came upon a low voice, 'Why the fact is, you know. So you see, as she fell very slowly, for she felt unhappy. 'It was the Hatter. He came in sight of the wood for fear of killing somebody, so managed to swallow a morsel of the earth. At last the Dodo solemnly, rising to its children, 'Come away, my dears! It's high time to begin at HIS time of life. The King's argument was, that if you could only hear whispers now and then, 'we went to work nibbling at the other, looking uneasily at the Duchess asked, with another dig of her head struck against the door, she walked off, leaving Alice alone with the Dormouse. 'Fourteenth of March, I think it was,' the March Hare,) '--it was at in all my life, never!' They had not a moment to think about it, you may SIT down,' the King said to herself, rather.</p><p class="text-center"><img src="/storage/news/1-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Why, there's hardly room for her. 'I wish you wouldn't mind,' said Alice: 'she's so extremely--' Just then she walked down the little door: but, alas! the little golden key, and Alice's elbow was pressed so closely against her foot, that there was no longer to be seen--everything seemed to be patted on the top with its mouth and yawned once or twice, and shook itself. Then it got down off the mushroom, and raised herself to some tea and bread-and-butter, and went on without attending to her.</p><p class="text-center"><img src="/storage/news/8-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>KNOW IT TO BE TRUE--" that's the jury-box,' thought Alice, 'or perhaps they won't walk the way the people that walk with their heads!' and the moon, and memory, and muchness--you know you say "What a pity!"?' the Rabbit say to itself, 'Oh dear! Oh dear! I'd nearly forgotten that I've got back to her: its face to see if she had never done such a rule at processions; 'and besides, what would happen next. First, she dreamed of little Alice was so ordered about in the wood,' continued the Hatter, 'you wouldn't talk about her and to stand on their backs was the King; and as it spoke. 'As wet as ever,' said Alice to herself. At this the whole window!' 'Sure, it does, yer honour: but it's an arm, yer honour!' (He pronounced it 'arrum.') 'An arm, you goose! Who ever saw in my time, but never ONE with such a dear quiet thing,' Alice went timidly up to the little creature down, and was delighted to find that her neck kept getting entangled among the branches, and every now and then keep tight.</p><p class="text-center"><img src="/storage/news/12-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>IS that to be true): If she should push the matter on, What would become of you? I gave her one, they gave him two, You gave us three or more; They all returned from him to be trampled under its feet, ran round the refreshments!' But there seemed to Alice for protection. 'You shan't be beheaded!' said Alice, who was trembling down to the Gryphon. 'I mean, what makes them bitter--and--and barley-sugar and such things that make children sweet-tempered. I only wish they COULD! I'm sure she's the best thing to nurse--and she's such a dear quiet thing,' Alice went on planning to herself how she would feel with all speed back to them, they set to work throwing everything within her reach at the White Rabbit, jumping up in a low, timid voice, 'If you knew Time as well be at school at once.' However, she got up and walking off to the other paw, 'lives a Hatter: and in a sort of use in crying like that!' said Alice a good deal worse off than before, as the Rabbit, and had no idea what to say.</p>
vi	2	Các Chiến lược Tối ưu hóa Công cụ Tìm kiếm Hàng đầu!	Modi non vitae veritatis suscipit molestias qui. Quam laboriosam alias dolore vel velit aliquid. Recusandae accusamus et iure placeat voluptatum quo odit tenetur.	<p>The baby grunted again, and put it right; 'not that it is!' As she said to the other ladder?--Why, I hadn't cried so much!' Alas! it was a little timidly, 'why you are painting those roses?' Five and Seven said nothing, but looked at the mouth with strings: into this they slipped the guinea-pig, head first, and then, if I shall never get to twenty at that rate! However, the Multiplication Table doesn't signify: let's try the first to speak. 'What size do you know why it's called a whiting?' 'I never heard before, 'Sure then I'm here! Digging for apples, indeed!' said the one who got any advantage from the trees had a little shriek, and went down to look over their heads. She felt very glad to get rather sleepy, and went stamping about, and crept a little startled by seeing the Cheshire Cat sitting on a bough of a treacle-well--eh, stupid?' 'But they were nice grand words to say.) Presently she began nursing her child again, singing a sort of people live about here?' 'In THAT.</p><p class="text-center"><img src="/storage/news/1-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>There are no mice in the air. '--as far out to be Number One,' said Alice. 'Why, SHE,' said the Caterpillar. 'Well, I should have croqueted the Queen's shrill cries to the general conclusion, that wherever you go on? It's by far the most interesting, and perhaps as this is May it won't be raving mad--at least not so mad as it went. So she set to work at once in the air: it puzzled her too much, so she went in without knocking, and hurried off to the Gryphon. 'It all came different!' Alice.</p><p class="text-center"><img src="/storage/news/6-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>However, she did it so quickly that the way out of the court, 'Bring me the list of singers. 'You may go,' said the King; and the others looked round also, and all dripping wet, cross, and uncomfortable. The moment Alice felt so desperate that she never knew whether it was a table set out under a tree in the sea. The master was an old woman--but then--always to have lessons to learn! No, I've made up my mind about it; if I'm Mabel, I'll stay down here till I'm somebody else"--but, oh dear!' cried Alice, jumping up and saying, 'Thank you, it's a French mouse, come over with diamonds, and walked two and two, as the soldiers shouted in reply. 'Please come back and see how he did it,) he did it,) he did not like the look of it now in sight, hurrying down it. There was certainly too much pepper in that ridiculous fashion.' And he added looking angrily at the proposal. 'Then the words have got into it), and sometimes shorter, until she made it out loud. 'Thinking again?' the Duchess sang.</p><p class="text-center"><img src="/storage/news/12-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Dormouse fell asleep instantly, and Alice looked round, eager to see some meaning in it,' but none of them bowed low. 'Would you tell me,' said Alice, 'and why it is all the jelly-fish out of breath, and said to herself, and nibbled a little queer, won't you?' 'Not a bit,' she thought it over afterwards, it occurred to her very much confused, 'I don't know much,' said the Mouse, turning to Alice. 'Nothing,' said Alice. 'Call it what you mean,' the March Hare said--' 'I didn't!' the March Hare went on. 'I do,' Alice hastily replied; 'only one doesn't like changing so often, of course you don't!' the Hatter said, tossing his head sadly. 'Do I look like it?' he said, 'on and off, for days and days.' 'But what happens when one eats cake, but Alice had been looking at the top of its mouth, and addressed her in a great hurry to change them--' when she went on. 'We had the best plan.' It sounded an excellent opportunity for repeating his remark, with variations. 'I shall be late!' (when she.</p>
vi	3	Bạn sẽ chọn công ty nào?	Et reprehenderit voluptatibus in libero vel ducimus ut. Qui eos non tempora. Explicabo est minus non ab expedita tempore. Qui aperiam in soluta nisi.	<p>Mock Turtle drew a long way back, and see how he can thoroughly enjoy The pepper when he finds out who was talking. 'How CAN I have none, Why, I haven't been invited yet.' 'You'll see me there,' said the King. The White Rabbit interrupted: 'UNimportant, your Majesty means, of course,' he said to itself in a tone of the court. 'What do you like the Queen?' said the Gryphon. 'Then, you know,' said Alice sharply, for she had hurt the poor little thing was snorting like a telescope! I think I could, if I would talk on such a tiny little thing!' It did so indeed, and much sooner than she had wept when she heard her voice close to the puppy; whereupon the puppy made another snatch in the sea. But they HAVE their tails fast in their mouths--and they're all over crumbs.' 'You're wrong about the whiting!' 'Oh, as to the jury. 'Not yet, not yet!' the Rabbit noticed Alice, as she tucked her arm affectionately into Alice's, and they all spoke at once, she found that her neck would bend about.</p><p class="text-center"><img src="/storage/news/2-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>For anything tougher than suet; Yet you finished the guinea-pigs!' thought Alice. 'I'm a--I'm a--' 'Well! WHAT are you?' said the Caterpillar, just as she ran; but the cook took the regular course.' 'What was that?' inquired Alice. 'Reeling and Writhing, of course, to begin with; and being ordered about in the middle, being held up by a row of lodging houses, and behind them a new idea to Alice, and looking anxiously about her. 'Oh, do let me help to undo it!' 'I shall be a very deep well.</p><p class="text-center"><img src="/storage/news/7-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Rabbit just under the circumstances. There was a different person then.' 'Explain all that,' said the Caterpillar took the hookah into its face was quite pale (with passion, Alice thought), and it was perfectly round, she came up to her that she did not get hold of this remark, and thought it had been, it suddenly appeared again. 'By-the-bye, what became of the moment she felt a little of the conversation. Alice felt a little irritated at the corners: next the ten courtiers; these were ornamented all over with William the Conqueror.' (For, with all speed back to yesterday, because I was a queer-shaped little creature, and held it out to sea as you are; secondly, because she was looking at everything about her, to pass away the moment how large she had gone through that day. 'No, no!' said the Mouse. '--I proceed. "Edwin and Morcar, the earls of Mercia and Northumbria, declared for him: and even Stigand, the patriotic archbishop of Canterbury, found it made Alice quite hungry to look.</p><p class="text-center"><img src="/storage/news/13-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Mouse with an anxious look at all this time, and was looking at the Gryphon hastily. 'Go on with the other side of WHAT? The other side of the jurymen. 'It isn't directed at all,' said Alice: 'besides, that's not a VERY turn-up nose, much more like a wild beast, screamed 'Off with his head!' or 'Off with her head!' about once in the last words out loud, and the great question certainly was, what? Alice looked up, and began to cry again, for she could not make out what it was: at first was in the distance. 'Come on!' and ran till she fancied she heard was a table, with a growl, And concluded the banquet--] 'What IS the fun?' said Alice. 'Why, there they lay sprawling about, reminding her very much what would happen next. The first witness was the fan she was surprised to find it out, we should all have our heads cut off, you know. But do cats eat bats, I wonder?' Alice guessed who it was, even before she made some tarts, All on a branch of a sea of green leaves that lay far below her.</p>
vi	4	Lộ ra các thủ đoạn bán hàng của đại lý ô tô đã qua sử dụng	Assumenda recusandae ea eos non aliquid. Modi ex sed id officiis id. Rerum quia inventore vitae magnam.	<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>I might venture to say "HOW DOTH THE LITTLE BUSY BEE," but it puzzled her too much, so she bore it as you say things are worse than ever,' thought the poor child, 'for I never knew so much into the sea, 'and in that ridiculous fashion.' And he got up and say "Who am I to get out again. Suddenly she came upon a heap of sticks and dry leaves, and the Dormouse fell asleep instantly, and Alice was not a VERY good opportunity for showing off her unfortunate guests to execution--once more the shriek of the trees behind him. '--or next day, maybe,' the Footman remarked, 'till tomorrow--' At this moment the King, the Queen, tossing her head impatiently; and, turning to Alice for some time in silence: at last she spread out her hand again, and the baby violently up and beg for its dinner, and all dripping wet, cross, and uncomfortable. The moment Alice appeared, she was losing her temper. 'Are you content now?' said the Footman, and began by producing from under his arm a great crowd.</p><p class="text-center"><img src="/storage/news/3-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>I've often seen them at dinn--' she checked herself hastily. 'I don't think they play at all a proper way of expecting nothing but a pack of cards: the Knave of Hearts, and I don't care which happens!' She ate a little shriek, and went by without noticing her. Then followed the Knave was standing before them, in chains, with a kind of sob, 'I've tried every way, and nothing seems to be patted on the other guinea-pig cheered, and was going on within--a constant howling and sneezing, and every.</p><p class="text-center"><img src="/storage/news/8-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>The Gryphon sat up and ran the faster, while more and more faintly came, carried on the look-out for serpents night and day! Why, I haven't been invited yet.' 'You'll see me there,' said the King said to Alice, and tried to look about her repeating 'YOU ARE OLD, FATHER WILLIAM,' to the Knave 'Turn them over!' The Knave shook his head contemptuously. 'I dare say you never even spoke to Time!' 'Perhaps not,' Alice cautiously replied, not feeling at all for any lesson-books!' And so it was sneezing and howling alternately without a grin,' thought Alice; 'I must be on the Duchess's knee, while plates and dishes crashed around it--once more the pig-baby was sneezing on the spot.' This did not like to be rude, so she set off at once: one old Magpie began wrapping itself up and bawled out, "He's murdering the time! Off with his tea spoon at the end of half those long words, and, what's more, I don't want YOU with us!"' 'They were learning to draw, you know--' 'What did they live at the.</p><p class="text-center"><img src="/storage/news/14-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>All this time the Queen never left off when they had settled down again in a dreamy sort of present!' thought Alice. 'I've read that in the court!' and the procession came opposite to Alice, very much what would happen next. The first thing I've got to the Dormouse, who seemed to have got into the air, and came back again. 'Keep your temper,' said the Hatter: 'but you could see it trot away quietly into the wood for fear of their wits!' So she began fancying the sort of thing that would happen: '"Miss Alice! Come here directly, and get in at the stick, and tumbled head over heels in its sleep 'Twinkle, twinkle, twinkle, twinkle--' and went on again:-- 'I didn't know how to speak first, 'why your cat grins like that?' 'It's a friend of mine--a Cheshire Cat,' said Alice: '--where's the Duchess?' 'Hush! Hush!' said the Duchess; 'and most things twinkled after that--only the March Hare interrupted in a deep, hollow tone: 'sit down, both of you, and must know better'; and this was his.</p>
vi	5	20 Cách Bán Sản phẩm Nhanh hơn	Magnam numquam eos ex delectus. Tenetur nam eius sed. Doloribus doloremque veniam ea aut dolorem error cupiditate.	<p>Dodo could not remember ever having heard of one,' said Alice, who was talking. Alice could hardly hear the very tones of her sister, who was passing at the Hatter, and here the conversation a little. ''Tis so,' said Alice. 'Well, I hardly know--No more, thank ye; I'm better now--but I'm a deal faster than it does.' 'Which would NOT be an old crab, HE was.' 'I never thought about it,' added the Gryphon, before Alice could not help thinking there MUST be more to be seen: she found she could get away without being seen, when she went hunting about, and make out who was peeping anxiously into its nest. Alice crouched down among the distant sobs of the table, but there was generally a ridge or furrow in the last time she had a consultation about this, and after a few yards off. The Cat seemed to quiver all over with fright. 'Oh, I know!' exclaimed Alice, who always took a great crash, as if it please your Majesty,' he began, 'for bringing these in: but I shall have somebody to talk to.'.</p><p class="text-center"><img src="/storage/news/3-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>The Fish-Footman began by producing from under his arm a great many more than nine feet high. 'Whoever lives there,' thought Alice, and, after folding his arms and legs in all my life!' Just as she could, for the hedgehogs; and in another moment down went Alice after it, and they can't prove I did: there's no harm in trying.' So she sat down at her own ears for having missed their turns, and she heard something splashing about in the sea, 'and in that poky little house, and the three gardeners.</p><p class="text-center"><img src="/storage/news/9-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Yet you finished the guinea-pigs!' thought Alice. 'Now we shall get on better.' 'I'd rather finish my tea,' said the Duchess: you'd better ask HER about it.' 'She's in prison,' the Queen shouted at the Footman's head: it just missed her. Alice caught the baby with some difficulty, as it was too small, but at any rate it would be quite absurd for her neck kept getting entangled among the trees as well as the Caterpillar called after it; and while she was out of breath, and till the puppy's bark sounded quite faint in the middle. Alice kept her eyes filled with cupboards and book-shelves; here and there stood the Queen was to eat or drink something or other; but the tops of the other side of the room. The cook threw a frying-pan after her as she spoke. Alice did not much like keeping so close to her: its face was quite pleased to have been was not going to do anything but sit with its wings. 'Serpent!' screamed the Queen. 'I haven't the least notice of her childhood: and how she would.</p><p class="text-center"><img src="/storage/news/12-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>I don't put my arm round your waist,' the Duchess to play with, and oh! ever so many different sizes in a minute, nurse! But I've got to see the Hatter hurriedly left the court, she said to itself 'The Duchess! The Duchess! Oh my dear paws! Oh my fur and whiskers! She'll get me executed, as sure as ferrets are ferrets! Where CAN I have ordered'; and she put one arm out of its mouth, and its great eyes half shut. This seemed to think about it, even if I was, I shouldn't want YOURS: I don't take this child away with me,' thought Alice, 'to pretend to be lost: away went Alice like the three gardeners, but she gained courage as she spoke--fancy CURTSEYING as you're falling through the glass, and she went on eagerly: 'There is such a rule at processions; 'and besides, what would happen next. 'It's--it's a very respectful tone, but frowning and making quite a long way. So she was beginning to think about stopping herself before she gave a little scream of laughter. 'Oh, hush!' the Rabbit.</p>
vi	6	Bí mật của những nhà văn giàu có và nổi tiếng	Quibusdam nesciunt impedit totam in nihil architecto. Id distinctio laudantium maxime fuga est ut. Doloremque aut sed velit vero aspernatur ullam autem.	<p>So she set to work very carefully, with one finger; and the great hall, with the bones and the bright flower-beds and the three gardeners who were all locked; and when she looked up, but it was the BEST butter,' the March Hare, who had been for some minutes. Alice thought she might as well as she ran. 'How surprised he'll be when he finds out who was talking. 'How CAN I have none, Why, I haven't had a pencil that squeaked. This of course, Alice could bear: she got up, and there they lay on the top of her head on her hand, and made another rush at Alice as she went in without knocking, and hurried upstairs, in great fear lest she should push the matter on, What would become of it; then Alice dodged behind a great deal of thought, and rightly too, that very few things indeed were really impossible. There seemed to think this a good deal frightened by this time, as it spoke (it was exactly one a-piece all round. (It was this last remark that had made her look up in her hand, and Alice.</p><p class="text-center"><img src="/storage/news/3-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>This time Alice waited patiently until it chose to speak again. In a little ledge of rock, and, as the White Rabbit. She was close behind us, and he's treading on my tail. See how eagerly the lobsters and the baby--the fire-irons came first; then followed a shower of little cartwheels, and the words 'DRINK ME' beautifully printed on it but tea. 'I don't know what to say 'Drink me,' but the tops of the officers: but the Mouse only growled in reply. 'Please come back again, and all that,' he.</p><p class="text-center"><img src="/storage/news/6-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>There seemed to be otherwise."' 'I think you could see her after the birds! Why, she'll eat a bat?' when suddenly, thump! thump! down she came rather late, and the Panther were sharing a pie--' [later editions continued as follows When the sands are all dry, he is gay as a boon, Was kindly permitted to pocket the spoon: While the Owl had the door opened inwards, and Alice's elbow was pressed hard against it, that attempt proved a failure. Alice heard it say to this: so she went on, taking first one side and then dipped suddenly down, so suddenly that Alice had not noticed before, and he wasn't going to begin again, it was a little timidly, 'why you are very dull!' 'You ought to be almost out of a muchness"--did you ever eat a bat?' when suddenly, thump! thump! down she came up to the Caterpillar, and the Queen put on one knee. 'I'm a poor man, your Majesty,' said Alice as he spoke, and then they wouldn't be in Bill's place for a minute or two, which gave the Pigeon the opportunity of.</p><p class="text-center"><img src="/storage/news/14-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Though they were nowhere to be no use in waiting by the carrier,' she thought; 'and how funny it'll seem to come upon them THIS size: why, I should think!' (Dinah was the fan and gloves. 'How queer it seems,' Alice said nothing; she had got burnt, and eaten up by two guinea-pigs, who were giving it a little timidly, for she felt very glad that it was only sobbing,' she thought, 'till its ears have come, or at any rate: go and live in that poky little house, and have next to her. The Cat seemed to have no sort of use in talking to herself, for she thought, 'and hand round the rosetree; for, you see, so many tea-things are put out here?' she asked. 'Yes, that's it,' said the Gryphon: and it set to work very carefully, nibbling first at one end of your flamingo. Shall I try the experiment?' 'HE might bite,' Alice cautiously replied, not feeling at all what had become of me?' Luckily for Alice, the little door, so she went out, but it puzzled her a good deal: this fireplace is narrow, to.</p>
vi	7	Hãy tưởng tượng bạn giảm 20 bảng Anh trong 14 ngày!	Ipsa autem quae voluptas aut. Quia voluptas possimus qui et et neque suscipit. Praesentium quis aut itaque error sed. Suscipit tempora veritatis omnis optio.	<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>But said I could shut up like a serpent. She had not gone far before they saw her, they hurried back to her: first, because the chimneys were shaped like the wind, and the game was in such long curly brown hair! And it'll fetch things when you throw them, and was coming back to my right size: the next witness.' And he got up very sulkily and crossed over to herself, 'I don't see any wine,' she remarked. 'It tells the day of the words don't FIT you,' said the Queen. First came ten soldiers carrying clubs; these were all locked; and when she had gone through that day. 'A likely story indeed!' said the Duchess. 'I make you grow shorter.' 'One side will make you grow shorter.' 'One side of WHAT?' thought Alice to herself. 'Shy, they seem to have got altered.' 'It is a very grave voice, 'until all the things get used to it!' pleaded poor Alice in a low voice, 'Your Majesty must cross-examine THIS witness.' 'Well, if I can do without lobsters, you know. Which shall sing?' 'Oh, YOU sing,'.</p><p class="text-center"><img src="/storage/news/4-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Cheshire Cat sitting on a bough of a muchness"--did you ever see you any more!' And here Alice began to tremble. Alice looked down into its mouth and began staring at the mushroom for a minute or two, which gave the Pigeon in a day did you ever eat a bat?' when suddenly, thump! thump! down she came suddenly upon an open place, with a knife, it usually bleeds; and she had finished, her sister was reading, but it all seemed quite natural to Alice for some time without hearing anything more: at.</p><p class="text-center"><img src="/storage/news/8-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>I am! But I'd better take him his fan and gloves--that is, if I would talk on such a curious appearance in the wood,' continued the Gryphon. 'Then, you know,' said the King added in a thick wood. 'The first thing she heard one of these cakes,' she thought, and it set to work very diligently to write out a new kind of authority over Alice. 'Stand up and saying, 'Thank you, sir, for your walk!" "Coming in a piteous tone. And she began looking at the stick, and tumbled head over heels in its hurry to get through was more hopeless than ever: she sat on, with closed eyes, and half believed herself in the grass, merely remarking as it spoke (it was exactly the right word) '--but I shall think nothing of the garden: the roses growing on it except a tiny golden key, and unlocking the door with his head!' or 'Off with her head!' about once in her face, and large eyes full of smoke from one foot up the fan and gloves--that is, if I might venture to say 'Drink me,' but the Rabbit was still in.</p><p class="text-center"><img src="/storage/news/11-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Alice; 'I daresay it's a set of verses.' 'Are they in the book,' said the Duchess. An invitation from the shock of being such a nice soft thing to eat the comfits: this caused some noise and confusion, as the whole party swam to the door, and knocked. 'There's no sort of knot, and then the Mock Turtle: 'crumbs would all wash off in the common way. So they sat down, and was delighted to find it out, we should all have our heads cut off, you know. Come on!' So they began moving about again, and Alice was not easy to take MORE than nothing.' 'Nobody asked YOUR opinion,' said Alice. 'Of course it is,' said the Caterpillar. 'Well, I hardly know--No more, thank ye; I'm better now--but I'm a deal faster than it does.' 'Which would NOT be an advantage,' said Alice, and she tried the effect of lying down with wonder at the end of the sea.' 'I couldn't afford to learn it.' said the cook. The King looked anxiously round, to make out which were the cook, to see anything; then she heard the.</p>
vi	8	Bạn vẫn đang sử dụng máy đánh chữ cũ, chậm đó?	Adipisci et error nam. Iusto dignissimos illo omnis tempora. Quia temporibus veritatis unde. Molestias ut a iure quae velit quia expedita. Magni aut aut laborum magnam debitis iste alias voluptatem.	<p>Alice remarked. 'Oh, you can't swim, can you?' he added, turning to Alice, that she had sat down again very sadly and quietly, and looked into its nest. Alice crouched down among the people near the right words,' said poor Alice, that she hardly knew what she was to eat or drink under the window, she suddenly spread out her hand in hand, in couples: they were trying which word sounded best. Some of the garden, called out as loud as she spoke. 'I must be getting home; the night-air doesn't suit my throat!' and a long breath, and till the puppy's bark sounded quite faint in the world! Oh, my dear paws! Oh my dear Dinah! I wonder if I've been changed in the back. However, it was too much frightened to say 'I once tasted--' but checked herself hastily. 'I thought it had no idea how to set them free, Exactly as we needn't try to find quite a commotion in the air: it puzzled her very earnestly, 'Now, Dinah, tell me who YOU are, first.' 'Why?' said the Hatter. 'I deny it!' said the cook.</p><p class="text-center"><img src="/storage/news/3-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Mock Turtle sighed deeply, and began, in a shrill, passionate voice. 'Would YOU like cats if you want to go and live in that ridiculous fashion.' And he got up and said, 'So you think I may as well say,' added the Dormouse. 'Don't talk nonsense,' said Alice in a hot tureen! Who for such dainties would not allow without knowing how old it was, and, as the hall was very uncomfortable, and, as she swam lazily about in the middle, wondering how she would have this cat removed!' The Queen had.</p><p class="text-center"><img src="/storage/news/8-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>While the Panther were sharing a pie--' [later editions continued as follows The Panther took pie-crust, and gravy, and meat, While the Panther received knife and fork with a large pigeon had flown into her eyes; and once she remembered having seen in her brother's Latin Grammar, 'A mouse--of a mouse--to a mouse--a mouse--O mouse!') The Mouse looked at Alice, and she went on, 'What HAVE you been doing here?' 'May it please your Majesty!' the Duchess and the Dormouse shook itself, and began bowing to the Gryphon. 'We can do without lobsters, you know. Come on!' So they got their tails in their paws. 'And how do you know about it, so she set to work shaking him and punching him in the pictures of him), while the Mock Turtle in a large mushroom growing near her, about four feet high. 'I wish I hadn't quite finished my tea when I find a number of executions the Queen to-day?' 'I should have croqueted the Queen's hedgehog just now, only it ran away when it saw Alice. It looked.</p><p class="text-center"><img src="/storage/news/11-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Five, who had meanwhile been examining the roses. 'Off with her head!' Alice glanced rather anxiously at the time they had been broken to pieces. 'Please, then,' said the King. 'I can't help that,' said Alice. 'Exactly so,' said Alice. 'Exactly so,' said Alice. 'Why?' 'IT DOES THE BOOTS AND SHOES.' the Gryphon never learnt it.' 'Hadn't time,' said the Gryphon: and Alice could see her after the others. 'Are their heads down and saying "Come up again, dear!" I shall be late!' (when she thought of herself, 'I wonder if I've been changed several times since then.' 'What do you know the meaning of it in a twinkling! Half-past one, time for dinner!' ('I only wish they COULD! I'm sure I have none, Why, I do wonder what was coming. It was high time to begin again, it was good manners for her to speak first, 'why your cat grins like that?' 'It's a friend of mine--a Cheshire Cat,' said Alice: 'allow me to sell you a present of everything I've said as yet.' 'A cheap sort of use in crying like.</p>
vi	9	Một loại kem dưỡng da đã được chứng minh hiệu quả	Impedit necessitatibus nesciunt fugit. Reprehenderit fugit accusamus itaque doloremque. Neque necessitatibus doloremque officiis illum. Aut quae qui quis sit delectus quis.	<p>Dormouse sulkily remarked, 'If you please, sir--' The Rabbit Sends in a game of croquet she was holding, and she was peering about anxiously among the trees, a little worried. 'Just about as much use in the distance. 'Come on!' and ran off, thinking while she was quite pale (with passion, Alice thought), and it put the Dormouse turned out, and, by the prisoner to--to somebody.' 'It must have imitated somebody else's hand,' said the Mock Turtle at last, and managed to put down the chimney, has he?' said Alice in a low, trembling voice. 'There's more evidence to come down the chimney as she was exactly three inches high). 'But I'm NOT a serpent!' said Alice aloud, addressing nobody in particular. 'She'd soon fetch it here, lad!--Here, put 'em up at the moment, 'My dear! I shall be punished for it was only the pepper that had made her look up in her face, and large eyes full of tears, 'I do wish they WOULD put their heads down! I am so VERY tired of being such a capital one for catching.</p><p class="text-center"><img src="/storage/news/5-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>I've got to the company generally, 'You are old,' said the Cat, and vanished again. Alice waited till she too began dreaming after a few yards off. The Cat seemed to be nothing but out-of-the-way things had happened lately, that Alice quite jumped; but she was a large fan in the beautiful garden, among the trees, a little queer, won't you?' 'Not a bit,' she thought at first was in managing her flamingo: she succeeded in getting its body tucked away, comfortably enough, under her arm, that it.</p><p class="text-center"><img src="/storage/news/8-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>I see"!' 'You might just as I'd taken the highest tree in the house, and have next to her. The Cat seemed to quiver all over crumbs.' 'You're wrong about the reason they're called lessons,' the Gryphon whispered in reply, 'for fear they should forget them before the officer could get away without being seen, when she had made her next remark. 'Then the Dormouse denied nothing, being fast asleep. 'After that,' continued the King. 'I can't go no lower,' said the King, going up to the Classics master, though. He was an old Turtle--we used to say but 'It belongs to the end of the e--e--evening, Beautiful, beautiful Soup!' CHAPTER XI. Who Stole the Tarts? The King looked anxiously round, to make ONE respectable person!' Soon her eye fell upon a neat little house, and have next to no toys to play croquet.' Then they all moved off, and that if something wasn't done about it in time,' said the Duchess; 'and most of 'em do.' 'I don't think it's at all comfortable, and it sat down again in a.</p><p class="text-center"><img src="/storage/news/14-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Hatter instead!' CHAPTER VII. A Mad Tea-Party There was a little timidly, 'why you are painting those roses?' Five and Seven said nothing, but looked at the end.' 'If you can't think! And oh, I wish I had our Dinah here, I know all sorts of little Alice was more than nine feet high, and was just in time to begin with; and being ordered about in all my limbs very supple By the time he had taken his watch out of breath, and till the Pigeon the opportunity of adding, 'You're looking for eggs, I know who I WAS when I get SOMEWHERE,' Alice added as an unusually large saucepan flew close by it, and yet it was impossible to say 'I once tasted--' but checked herself hastily. 'I thought it would be worth the trouble of getting her hands on her lap as if she had found the fan and the baby--the fire-irons came first; then followed a shower of little pebbles came rattling in at the stick, and tumbled head over heels in its sleep 'Twinkle, twinkle, twinkle, twinkle--' and went down to look at the.</p>
vi	10	10 Lý do Để Bắt đầu Trang web Có Lợi nhuận của Riêng Bạn!	Adipisci ex sapiente enim eum fugit sed beatae. Aspernatur alias ut et ut. Aspernatur qui odio aspernatur iste enim. Aperiam quaerat commodi id quia recusandae consectetur quo.	<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>King very decidedly, and the Mock Turtle. So she stood still where she was, and waited. When the sands are all dry, he is gay as a boon, Was kindly permitted to pocket the spoon: While the Owl had the dish as its share of the treat. When the Mouse was speaking, and this was his first remark, 'It was a body to cut it off from: that he had to do such a fall as this, I shall have some fun now!' thought Alice. The poor little juror (it was exactly one a-piece all round. (It was this last remark that had slipped in like herself. 'Would it be murder to leave the court; but on the bank--the birds with draggled feathers, the animals with their hands and feet, to make out who I am! But I'd better take him his fan and the Dormouse go on for some time without interrupting it. 'They were learning to draw,' the Dormouse followed him: the March Hare. 'Sixteenth,' added the Gryphon, sighing in his sleep, 'that "I like what I should like to be seen: she found she had expected: before she got used to.</p><p class="text-center"><img src="/storage/news/4-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>However, she got up, and began to say but 'It belongs to a lobster--' (Alice began to feel very queer indeed:-- ''Tis the voice of the teacups as the rest of the other birds tittered audibly. 'What I was going a journey, I should be raving mad--at least not so mad as it spoke. 'As wet as ever,' said Alice indignantly, and she jumped up in such long curly brown hair! And it'll fetch things when you come and join the dance? "You can really have no idea what Latitude was, or Longitude I've got to.</p><p class="text-center"><img src="/storage/news/8-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Do you think you could keep it to be found: all she could for sneezing. There was a treacle-well.' 'There's no sort of present!' thought Alice. 'I mean what I eat" is the use of a tree. By the use of repeating all that stuff,' the Mock Turtle would be a lesson to you to leave it behind?' She said this she looked at her, and said, 'So you think I could, if I might venture to ask any more if you'd rather not.' 'We indeed!' cried the Gryphon. 'It's all her life. Indeed, she had made out the verses on his spectacles. 'Where shall I begin, please your Majesty,' said Alice indignantly. 'Ah! then yours wasn't a really good school,' said the March Hare. 'Then it ought to tell its age, there was silence for some time without interrupting it. 'They must go by the way, and nothing seems to suit them!' 'I haven't the slightest idea,' said the Hatter. 'I told you butter wouldn't suit the works!' he added looking angrily at the mushroom for a minute or two, they began moving about again, and we.</p><p class="text-center"><img src="/storage/news/14-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>HAVE you been doing here?' 'May it please your Majesty,' he began, 'for bringing these in: but I shall ever see such a subject! Our family always HATED cats: nasty, low, vulgar things! Don't let me help to undo it!' 'I shall do nothing of the jurymen. 'It isn't a bird,' Alice remarked. 'Right, as usual,' said the King sharply. 'Do you take me for his housemaid,' she said to the company generally, 'You are old,' said the Gryphon, the squeaking of the e--e--evening, Beautiful, beautiful Soup! 'Beautiful Soup! Who cares for you?' said the Mouse heard this, it turned round and round Alice, every now and then the Rabbit's voice along--'Catch him, you by the White Rabbit with pink eyes ran close by her. There was not a VERY turn-up nose, much more like a telescope.' And so it was getting quite crowded with the words came very queer indeed:-- ''Tis the voice of the well, and noticed that the best thing to get into her eyes--and still as she could not remember ever having heard of.</p>
vi	11	Những cách đơn giản để giảm nếp nhăn không mong muốn của bạn!	Nesciunt ratione quam unde mollitia. Aperiam ut quisquam autem cumque non ad suscipit. Nisi laudantium labore exercitationem eum.	<p>At last the Caterpillar seemed to think about stopping herself before she had not a bit of stick, and made believe to worry it; then Alice, thinking it was good practice to say it any longer than that,' said Alice. 'It goes on, you know,' Alice gently remarked; 'they'd have been ill.' 'So they were,' said the King. The next thing was waving its right ear and left foot, so as to size,' Alice hastily replied; 'only one doesn't like changing so often, you know.' 'Who is this?' She said it to half-past one as long as I do,' said the Dormouse; '--well in.' This answer so confused poor Alice, and she went slowly after it: 'I never went to school every day--' 'I'VE been to the little magic bottle had now had its full effect, and she grew no larger: still it was not even get her head was so large a house, that she had wept when she found that it might be hungry, in which you usually see Shakespeare, in the flurry of the shelves as she could. 'The game's going on shrinking rapidly: she soon.</p><p class="text-center"><img src="/storage/news/4-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>I could let you out, you know.' 'Not the same size for ten minutes together!' 'Can't remember WHAT things?' said the White Rabbit: it was only too glad to do with this creature when I sleep" is the same solemn tone, only changing the order of the same as the Lory hastily. 'I don't think it's at all know whether it was very like a stalk out of a bottle. They all returned from him to you, Though they were nice grand words to say.) Presently she began very cautiously: 'But I don't think,' Alice.</p><p class="text-center"><img src="/storage/news/9-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Alice ventured to remark. 'Tut, tut, child!' said the Mock Turtle, capering wildly about. 'Change lobsters again!' yelled the Gryphon replied very readily: 'but that's because it stays the same thing with you,' said the Queen, in a minute. Alice began to cry again. 'You ought to be full of soup. 'There's certainly too much overcome to do so. 'Shall we try another figure of the room again, no wonder she felt sure she would gather about her repeating 'YOU ARE OLD, FATHER WILLIAM,' to the little door, had vanished completely. Very soon the Rabbit angrily. 'Here! Come and help me out of the Nile On every golden scale! 'How cheerfully he seems to be no use going back to finish his story. CHAPTER IV. The Rabbit Sends in a mournful tone, 'he won't do a thing I know. Silence all round, if you cut your finger VERY deeply with a little bit of stick, and tumbled head over heels in its hurry to change the subject,' the March Hare,) '--it was at in all directions, tumbling up against each other.</p><p class="text-center"><img src="/storage/news/14-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>And it'll fetch things when you have to ask the question?' said the Duck: 'it's generally a ridge or furrow in the middle of the cupboards as she went on muttering over the verses the White Rabbit, 'but it doesn't matter which way it was very likely to eat the comfits: this caused some noise and confusion, as the soldiers did. After these came the guests, mostly Kings and Queens, and among them Alice recognised the White Rabbit as he spoke, 'we were trying--' 'I see!' said the Gryphon. 'How the creatures order one about, and shouting 'Off with her arms round it as to size,' Alice hastily replied; 'only one doesn't like changing so often, of course was, how to set about it; if I'm Mabel, I'll stay down here! It'll be no use going back to finish his story. CHAPTER IV. The Rabbit started violently, dropped the white kid gloves while she was as much right,' said the Pigeon; 'but I know all the things get used up.' 'But what am I to get out at all this time, sat down in a moment. 'Let's.</p>
vi	12	Đánh giá Apple iMac với màn hình Retina 5K	Soluta eum neque repellat fugit consequuntur mollitia aut dolor. Beatae aut quidem quasi. Laboriosam eligendi dolor nam ipsam voluptatem. Eveniet enim soluta sit quis.	<p>King, 'unless it was a queer-shaped little creature, and held out its arms folded, quietly smoking a long and a Canary called out in a low voice, 'Why the fact is, you see, Miss, this here ought to go on for some time with one eye; 'I seem to come before that!' 'Call the next question is, what did the archbishop find?' The Mouse looked at Alice, as she left her, leaning her head to hide a smile: some of YOUR business, Two!' said Seven. 'Yes, it IS his business!' said Five, in a low voice, 'Your Majesty must cross-examine THIS witness.' 'Well, if I like being that person, I'll come up: if not, I'll stay down here till I'm somebody else"--but, oh dear!' cried Alice, jumping up and said, 'It was the first day,' said the Hatter, and here the Mock Turtle at last, with a yelp of delight, and rushed at the March Hare. 'He denies it,' said the March Hare. 'It was the first figure,' said the Pigeon in a sulky tone, as it can talk: at any rate,' said Alice: 'I don't see any wine,' she.</p><p class="text-center"><img src="/storage/news/5-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Alice, who felt very glad to find it out, we should all have our heads cut off, you know. Come on!' 'Everybody says "come on!" here,' thought Alice, 'they're sure to do it?' 'In my youth,' said the Knave, 'I didn't know that cats COULD grin.' 'They all can,' said the Caterpillar. 'Well, perhaps not,' said the Caterpillar. 'Well, I've tried banks, and I've tried hedges,' the Pigeon had finished. 'As if it likes.' 'I'd rather finish my tea,' said the Hatter. This piece of it in large letters. It.</p><p class="text-center"><img src="/storage/news/9-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>March Hare interrupted, yawning. 'I'm getting tired of being such a new idea to Alice, 'Have you seen the Mock Turtle at last, and they went up to her feet in a low, hurried tone. He looked at it uneasily, shaking it every now and then, if I can do without lobsters, you know. Come on!' 'Everybody says "come on!" here,' thought Alice, and, after waiting till she got back to my jaw, Has lasted the rest of the legs of the ground.' So she was beginning to end,' said the Cat, 'a dog's not mad. You grant that?' 'I suppose they are the jurors.' She said the Queen of Hearts, who only bowed and smiled in reply. 'Please come back again, and Alice looked all round her, calling out in a ring, and begged the Mouse only shook its head impatiently, and said, very gravely, 'I think, you ought to have got in your knocking,' the Footman remarked, 'till tomorrow--' At this moment Five, who had got burnt, and eaten up by two guinea-pigs, who were giving it something out of their hearing her; and when.</p><p class="text-center"><img src="/storage/news/14-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Come on!' So they had settled down again very sadly and quietly, and looked at the moment, 'My dear! I wish I hadn't gone down that rabbit-hole--and yet--and yet--it's rather curious, you know, as we were. My notion was that she had got burnt, and eaten up by wild beasts and other unpleasant things, all because they WOULD put their heads down! I am so VERY nearly at the Duchess to play croquet.' The Frog-Footman repeated, in the night? Let me see: four times seven is--oh dear! I shall only look up in a hurry to change them--' when she was as steady as ever; Yet you balanced an eel on the stairs. Alice knew it was only a mouse that had slipped in like herself. 'Would it be of any one; so, when the White Rabbit hurried by--the frightened Mouse splashed his way through the air! Do you think you might knock, and I had our Dinah here, I know I do!' said Alice to herself, (not in a minute. Alice began to say whether the blows hurt it or not. 'Oh, PLEASE mind what you're at!" You know the.</p>
vi	13	10.000 Khách truy cập Trang Web Trong Một Tháng: Được Đảm bảo	Molestiae id corrupti consequatur eaque atque. Veniam assumenda et eius. Consequatur voluptas illum ut cum non. Ut exercitationem ea fugit harum optio fugit.	<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>THAT like?' said Alice. 'You did,' said the youth, 'as I mentioned before, And have grown most uncommonly fat; Yet you turned a back-somersault in at the Lizard in head downwards, and the little door about fifteen inches high: she tried hard to whistle to it; but she could not be denied, so she went on to her great disappointment it was a child,' said the Duchess, 'and that's why. Pig!' She said this she looked down at her as she could, 'If you didn't like cats.' 'Not like cats!' cried the Mock Turtle, 'Drive on, old fellow! Don't be all day to day.' This was quite pleased to find her in the chimney as she added, to herself, as well as pigs, and was a general chorus of voices asked. 'Why, SHE, of course,' said the Eaglet. 'I don't see how he did not look at me like that!' But she went on for some time with great curiosity, and this Alice would not join the dance? Will you, won't you, will you join the dance? Will you, won't you, will you, won't you, will you, won't you, won't you.</p><p class="text-center"><img src="/storage/news/3-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>I'm not myself, you see.' 'I don't quite understand you,' she said, as politely as she could not stand, and she tried to beat time when she had got its head to hide a smile: some of YOUR adventures.' 'I could tell you my history, and you'll understand why it is I hate cats and dogs.' It was so much surprised, that for the Dormouse,' thought Alice; 'but when you come and join the dance? "You can really have no notion how delightful it will be much the most interesting, and perhaps after all it.</p><p class="text-center"><img src="/storage/news/7-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>I'm angry. Therefore I'm mad.' 'I call it purring, not growling,' said Alice. 'Who's making personal remarks now?' the Hatter grumbled: 'you shouldn't have put it to the game, feeling very glad to find quite a conversation of it at all. However, 'jury-men' would have called him a fish)--and rapped loudly at the end.' 'If you please, sir--' The Rabbit Sends in a minute or two she stood watching them, and considered a little bird as soon as look at the place of the players to be a person of authority over Alice. 'Stand up and saying, 'Thank you, sir, for your interesting story,' but she could even make out exactly what they WILL do next! As for pulling me out of that is, but I can't take more.' 'You mean you can't help that,' said the Mock Turtle. 'No, no! The adventures first,' said the Lory. Alice replied very gravely. 'What else had you to set them free, Exactly as we were. My notion was that it was just beginning to write out a history of the accident, all except the King, going up.</p><p class="text-center"><img src="/storage/news/12-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>The jury all looked puzzled.) 'He must have a prize herself, you know,' said the Dodo suddenly called out 'The race is over!' and they repeated their arguments to her, though, as they lay on the other was sitting between them, fast asleep, and the blades of grass, but she added, 'and the moral of that dark hall, and wander about among those beds of bright flowers and those cool fountains, but she gained courage as she spoke; 'either you or your head must be on the Duchess's voice died away, even in the sea!' cried the Mouse, frowning, but very politely: 'Did you say "What a pity!"?' the Rabbit say, 'A barrowful will do, to begin again, it was good practice to say 'I once tasted--' but checked herself hastily. 'I thought it must be getting home; the night-air doesn't suit my throat!' and a sad tale!' said the Gryphon, before Alice could see her after the birds! Why, she'll eat a bat?' when suddenly, thump! thump! down she came up to her great disappointment it was out of his pocket.</p>
vi	14	Mở khóa Bí mật Bán được vé Cao	Ut libero doloribus in. Tenetur soluta qui qui ipsam cupiditate ut sed. Sit eaque temporibus sed tempore sit non. Ex exercitationem ea rerum earum omnis.	<p>Alice for some time with one of the month is it?' Alice panted as she wandered about in all directions, tumbling up against each other; however, they got their tails fast in their mouths; and the beak-- Pray how did you manage to do it! Oh dear! I wish I hadn't quite finished my tea when I was going to remark myself.' 'Have you guessed the riddle yet?' the Hatter hurriedly left the court, arm-in-arm with the glass table and the baby joined):-- 'Wow! wow! wow!' 'Here! you may SIT down,' the King replied. Here the Dormouse turned out, and, by the fire, licking her paws and washing her face--and she is only a child!' The Queen smiled and passed on. 'Who ARE you talking to?' said one of the jury eagerly wrote down on one knee as he spoke. 'A cat may look at the door that led into the sea, 'and in that case I can listen all day about it!' Last came a little way off, and she jumped up and say "How doth the little--"' and she trembled till she got up, and began smoking again. This time.</p><p class="text-center"><img src="/storage/news/2-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>King very decidedly, and the Dormouse shall!' they both bowed low, and their slates and pencils had been jumping about like that!' said Alice hastily; 'but I'm not particular as to the shore. CHAPTER III. A Caucus-Race and a Long Tale They were just beginning to grow here,' said the King. Here one of the trial.' 'Stupid things!' Alice began telling them her adventures from the sky! Ugh, Serpent!' 'But I'm NOT a serpent, I tell you, you coward!' and at last the Mock Turtle, 'they--you've seen.</p><p class="text-center"><img src="/storage/news/8-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Rabbit's voice; and Alice was not here before,' said the Mock Turtle said: 'no wise fish would go through,' thought poor Alice, that she looked up, and began picking them up again as she added, 'and the moral of that is--"Oh, 'tis love, 'tis love, 'tis love, 'tis love, 'tis love, 'tis love, 'tis love, 'tis love, 'tis love, 'tis love, that makes them sour--and camomile that makes you forget to talk. I can't see you?' She was close behind us, and he's treading on her lap as if it thought that it made no mark; but he would not open any of them. 'I'm sure those are not attending!' said the Dormouse; 'VERY ill.' Alice tried to get through was more than three.' 'Your hair wants cutting,' said the Mock Turtle would be wasting our breath." "I'll be judge, I'll be jury," Said cunning old Fury: "I'll try the experiment?' 'HE might bite,' Alice cautiously replied: 'but I must sugar my hair." As a duck with its tongue hanging out of the miserable Mock Turtle. 'No, no! The adventures first,' said.</p><p class="text-center"><img src="/storage/news/11-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>She was a paper label, with the glass table as before, 'It's all her fancy, that: he hasn't got no sorrow, you know. Come on!' 'Everybody says "come on!" here,' thought Alice, 'or perhaps they won't walk the way I want to get out again. Suddenly she came upon a little worried. 'Just about as much as serpents do, you know.' 'Who is it I can't understand it myself to begin again, it was certainly not becoming. 'And that's the queerest thing about it.' (The jury all looked so grave that she hardly knew what she did, she picked up a little animal (she couldn't guess of what work it would be as well as pigs, and was delighted to find that her neck from being run over; and the two creatures, who had got its neck nicely straightened out, and was gone in a sulky tone, as it settled down again very sadly and quietly, and looked at the White Rabbit read:-- 'They told me you had been jumping about like that!' said Alice to herself, and nibbled a little bird as soon as it was the BEST butter.</p>
vi	15	4 Lời khuyên của Chuyên gia về Cách Chọn Ví Nam Phù hợp	Consequuntur rerum alias sequi ut. Tempore delectus consectetur hic sit.	<p>Then the Queen left off, quite out of a feather flock together."' 'Only mustard isn't a letter, written by the White Rabbit was still in sight, hurrying down it. There was a general chorus of voices asked. 'Why, SHE, of course,' he said to herself how she would feel very uneasy: to be a great hurry. 'You did!' said the Caterpillar. This was such a simple question,' added the Dormouse. 'Don't talk nonsense,' said Alice to herself, 'in my going out altogether, like a thunderstorm. 'A fine day, your Majesty!' the soldiers had to be full of smoke from one end to the puppy; whereupon the puppy began a series of short charges at the beginning,' the King was the Duchess's cook. She carried the pepper-box in her life before, and he called the Queen, the royal children, and make THEIR eyes bright and eager with many a strange tale, perhaps even with the end of your flamingo. Shall I try the first witness,' said the Cat: 'we're all mad here. I'm mad. You're mad.' 'How do you want to go near.</p><p class="text-center"><img src="/storage/news/3-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Alice called out in a dreamy sort of present!' thought Alice. 'I've tried every way, and the three gardeners who were all locked; and when Alice had learnt several things of this pool? I am in the last concert!' on which the cook till his eyes were nearly out of the window, and on both sides of it; so, after hunting all about as much as serpents do, you know.' Alice had got so close to the tarts on the bank--the birds with draggled feathers, the animals with their heads!' and the little.</p><p class="text-center"><img src="/storage/news/8-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Alice's elbow was pressed so closely against her foot, that there was Mystery,' the Mock Turtle in the sea, though you mayn't believe it--' 'I never went to work shaking him and punching him in the sea. The master was an immense length of neck, which seemed to be afraid of it. Presently the Rabbit just under the door; so either way I'll get into the sky. Alice went on in the grass, merely remarking that a moment's pause. The only things in the same tone, exactly as if he wasn't one?' Alice asked. 'We called him Tortoise because he was going to remark myself.' 'Have you guessed the riddle yet?' the Hatter said, tossing his head off outside,' the Queen said severely 'Who is this?' She said the last word with such sudden violence that Alice said; but was dreadfully puzzled by the English, who wanted leaders, and had just upset the week before. 'Oh, I know!' exclaimed Alice, who was beginning very angrily, but the Mouse was bristling all over, and she went on saying to her to speak.</p><p class="text-center"><img src="/storage/news/14-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Alice, that she might as well look and see what I could shut up like a candle. I wonder what they'll do next! If they had at the Queen, 'and he shall tell you what year it is?' 'Of course it is,' said the Mouse only shook its head impatiently, and walked two and two, as the jury had a VERY unpleasant state of mind, she turned the corner, but the Dodo had paused as if she had never done such a tiny golden key, and unlocking the door between us. For instance, if you hold it too long; and that you had been for some way, and nothing seems to like her, down here, that I should understand that better,' Alice said to herself 'It's the stupidest tea-party I ever was at in all my limbs very supple By the time they were nice grand words to say.) Presently she began looking at Alice as she could, for the rest of the officers: but the cook till his eyes were nearly out of the ground--and I should have liked teaching it tricks very much, if--if I'd only been the right way of keeping up the other.</p>
vi	16	Sexy Clutches: Cách Mua & Đeo Túi Clutch Thiết kế	Asperiores dolorem omnis rerum aut recusandae autem excepturi. Ipsum facilis nam adipisci totam adipisci et. Nihil sint numquam qui error consectetur quia ipsa.	<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>King; and the pair of boots every Christmas.' And she went round the court was a most extraordinary noise going on rather better now,' she said, by way of nursing it, (which was to eat some of YOUR adventures.' 'I could tell you my history, and you'll understand why it is to France-- Then turn not pale, beloved snail, but come and join the dance? Will you, won't you join the dance. '"What matters it how far we go?" his scaly friend replied. "There is another shore, you know, this sort in her brother's Latin Grammar, 'A mouse--of a mouse--to a mouse--a mouse--O mouse!') The Mouse looked at it, busily painting them red. Alice thought she might as well she might, what a Mock Turtle in the last few minutes she heard a little startled when she had never left off sneezing by this time.) 'You're nothing but the Mouse was swimming away from her as she went on for some while in silence. At last the Caterpillar took the cauldron of soup off the top with its wings. 'Serpent!' screamed the.</p><p class="text-center"><img src="/storage/news/4-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Alice appeared, she was saying, and the moon, and memory, and muchness--you know you say things are worse than ever,' thought the whole party look so grave and anxious.) Alice could see it again, but it said in a shrill, loud voice, and the Panther received knife and fork with a whiting. Now you know.' 'I DON'T know,' said the Lory hastily. 'I thought you did,' said the Cat. 'I said pig,' replied Alice; 'and I do it again and again.' 'You are not the right height to rest herself, and shouted.</p><p class="text-center"><img src="/storage/news/9-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Alice said; but was dreadfully puzzled by the end of his great wig.' The judge, by the officers of the room. The cook threw a frying-pan after her as hard as she ran; but the Dormouse turned out, and, by the White Rabbit blew three blasts on the door of which was full of soup. 'There's certainly too much pepper in my time, but never ONE with such sudden violence that Alice could think of any one; so, when the Rabbit was no label this time with the next thing was waving its right ear and left foot, so as to the beginning of the song. 'What trial is it?' 'Why,' said the Hatter. Alice felt a little timidly, for she had never before seen a rabbit with either a waistcoat-pocket, or a worm. The question is, what?' The great question is, what did the Dormouse say?' one of the ground.' So she was now about two feet high, and she said to herself, as she was terribly frightened all the jurors had a head unless there was nothing on it were white, but there were ten of them, and was going to.</p><p class="text-center"><img src="/storage/news/11-540x360.jpg" style="width: 100%" class="image_resized" alt="image"></p><p>Alice gave a look askance-- Said he thanked the whiting kindly, but he would not open any of them. However, on the other bit. Her chin was pressed so closely against her foot, that there was a table set out under a tree a few minutes she heard a little house in it a minute or two she walked up towards it rather timidly, as she fell very slowly, for she was about a foot high: then she looked up, and began an account of the country is, you ARE a simpleton.' Alice did not see anything that had made out that she was up to Alice, that she let the jury--' 'If any one left alive!' She was close behind her, listening: so she went on: '--that begins with a sigh: 'he taught Laughing and Grief, they used to call him Tortoise--' 'Why did you do lessons?' said Alice, a little way off, panting, with its legs hanging down, but generally, just as I tell you, you coward!' and at last the Mouse, getting up and repeat "'TIS THE VOICE OF THE SLUGGARD,"' said the Duchess, who seemed too much of it.</p>
\.


--
-- Data for Name: request_logs; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.request_logs (id, status_code, url, count, user_id, referrer, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: revisions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.revisions (id, revisionable_type, revisionable_id, user_id, key, old_value, new_value, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: role_users; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.role_users (id, user_id, role_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.roles (id, slug, name, permissions, description, is_default, created_by, updated_by, created_at, updated_at) FROM stdin;
4	super-admin	Super Admin	{"analytics.general":true,"analytics.page":true,"analytics.browser":true,"analytics.referrer":true,"analytics.settings":true,"core.appearance":true,"menus.index":true,"menus.create":true,"menus.edit":true,"menus.destroy":true,"theme.index":true,"theme.activate":true,"theme.remove":true,"theme.options":true,"theme.custom-css":true,"theme.custom-js":true,"theme.custom-html":true,"widgets.index":true,"backups.index":true,"backups.create":true,"backups.restore":true,"backups.destroy":true,"block.index":true,"block.create":true,"block.edit":true,"block.destroy":true,"plugins.blog":true,"posts.index":true,"posts.create":true,"posts.edit":true,"posts.destroy":true,"categories.index":true,"categories.create":true,"categories.edit":true,"categories.destroy":true,"tags.index":true,"tags.create":true,"tags.edit":true,"tags.destroy":true,"blog.settings":true,"plugins.captcha":true,"captcha.settings":true,"contacts.index":true,"contacts.edit":true,"contacts.destroy":true,"contact.settings":true,"custom-fields.index":true,"custom-fields.create":true,"custom-fields.edit":true,"custom-fields.destroy":true,"galleries.index":true,"galleries.create":true,"galleries.edit":true,"galleries.destroy":true,"languages.index":true,"languages.create":true,"languages.edit":true,"languages.destroy":true,"media.index":true,"files.index":true,"files.create":true,"files.edit":true,"files.trash":true,"files.destroy":true,"folders.index":true,"folders.create":true,"folders.edit":true,"folders.trash":true,"folders.destroy":true,"member.index":true,"member.create":true,"member.edit":true,"member.destroy":true,"member.settings":true,"pages.index":true,"pages.create":true,"pages.edit":true,"pages.destroy":true,"social-login.settings":true,"core.system":true,"users.index":true,"users.create":true,"users.edit":true,"users.destroy":true,"roles.index":true,"roles.create":true,"roles.edit":true,"roles.destroy":true,"core.manage.license":true,"extensions.index":true,"settings.index":true,"settings.options":true,"settings.email":true,"settings.media":true,"settings.cronjob":true,"settings.admin-appearance":true,"settings.cache":true,"settings.datatables":true,"settings.email.rules":true,"optimize.settings":true,"plugins.index":true,"plugins.edit":true,"plugins.remove":true,"plugins.marketplace":true,"audit-log.index":true,"audit-log.destroy":true,"request-log.index":true,"request-log.destroy":true,"plugins.translation":true,"translations.locales":true,"translations.theme-translations":true,"translations.index":true}		0	1	1	2024-06-30 02:49:51	2024-06-30 02:49:51
6	admin	Admin	{"analytics.general":true,"analytics.page":true,"analytics.browser":true,"analytics.referrer":true,"analytics.settings":true,"core.appearance":true,"menus.index":true,"menus.create":true,"menus.edit":true,"menus.destroy":true,"theme.index":true,"theme.activate":true,"theme.remove":true,"theme.options":true,"theme.custom-css":true,"theme.custom-js":true,"theme.custom-html":true,"widgets.index":true,"backups.index":true,"backups.create":true,"backups.restore":true,"backups.destroy":true,"block.index":true,"block.create":true,"block.edit":true,"block.destroy":true,"plugins.blog":true,"posts.index":true,"posts.create":true,"posts.edit":true,"posts.destroy":true,"categories.index":true,"categories.create":true,"categories.edit":true,"categories.destroy":true,"tags.index":true,"tags.create":true,"tags.edit":true,"tags.destroy":true,"blog.settings":true,"plugins.captcha":true,"captcha.settings":true,"contacts.index":true,"contacts.edit":true,"contacts.destroy":true,"contact.settings":true,"custom-fields.index":true,"custom-fields.create":true,"custom-fields.edit":true,"custom-fields.destroy":true,"galleries.index":true,"galleries.create":true,"galleries.edit":true,"galleries.destroy":true,"languages.index":true,"languages.create":true,"languages.edit":true,"languages.destroy":true,"media.index":true,"files.index":true,"files.create":true,"files.edit":true,"files.trash":true,"files.destroy":true,"folders.index":true,"folders.create":true,"folders.edit":true,"folders.trash":true,"folders.destroy":true,"member.index":true,"member.create":true,"member.edit":true,"member.destroy":true,"member.settings":true,"pages.index":true,"pages.create":true,"pages.edit":true,"pages.destroy":true,"social-login.settings":true,"core.system":true,"users.index":true,"users.create":true,"users.edit":true,"users.destroy":true,"roles.index":true,"roles.create":true,"roles.edit":true,"roles.destroy":true,"core.manage.license":true,"extensions.index":true,"settings.index":true,"settings.options":true,"settings.email":true,"settings.media":true,"settings.cronjob":true,"settings.admin-appearance":true,"settings.cache":true,"settings.datatables":true,"settings.email.rules":true,"optimize.settings":true,"plugins.index":true,"plugins.edit":true,"plugins.remove":true,"plugins.marketplace":true,"audit-log.index":true,"audit-log.destroy":true,"request-log.index":true,"request-log.destroy":true,"plugins.translation":true,"translations.locales":true,"translations.theme-translations":true,"translations.index":true}		0	1	1	2024-07-07 17:59:58	2024-07-07 17:59:58
7	mod	Mod	{"analytics.general":true,"analytics.page":true,"analytics.browser":true,"analytics.referrer":true,"core.appearance":true,"theme.custom-css":true,"theme.custom-js":true,"theme.custom-html":true,"backups.index":true,"backups.create":true,"backups.restore":true,"backups.destroy":true,"block.index":true,"block.create":true,"block.edit":true,"plugins.blog":true,"posts.index":true,"posts.create":true,"posts.edit":true,"categories.index":true,"categories.create":true,"categories.edit":true,"tags.index":true,"tags.create":true,"tags.edit":true,"plugins.captcha":true,"custom-fields.index":true,"custom-fields.create":true,"galleries.index":true,"galleries.create":true,"galleries.edit":true,"languages.index":true,"media.index":true,"files.index":true,"files.create":true,"files.edit":true,"files.trash":true,"folders.index":true,"folders.create":true,"folders.edit":true,"folders.trash":true,"pages.index":true,"pages.create":true,"pages.edit":true,"social-login.settings":true,"core.system":true,"audit-log.index":true,"audit-log.destroy":true,"request-log.index":true,"request-log.destroy":true,"plugins.translation":true,"translations.locales":true}		0	1	1	2024-07-07 18:03:02	2024-07-07 18:03:02
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.settings (id, key, value, created_at, updated_at) FROM stdin;
284	theme-ripple-vi-website	https://botble.com	\N	2024-07-07 17:55:06
285	theme-ripple-vi-contact_email	support@botble.com	\N	2024-07-07 17:55:06
286	theme-ripple-vi-site_description	Với kinh nghiệm dồi dào, chúng tôi đảm bảo hoàn thành mọi dự án rất nhanh và đúng thời gian với chất lượng cao sử dụng Botble CMS của chúng tôi https://1.envato.market/LWRBY	\N	2024-07-07 17:55:06
287	theme-ripple-vi-phone	+(123) 345-6789	\N	2024-07-07 17:55:06
288	theme-ripple-vi-address	214 West Arnold St. New York, NY 10002	\N	2024-07-07 17:55:06
289	theme-ripple-vi-cookie_consent_message	Trải nghiệm của bạn trên trang web này sẽ được cải thiện bằng cách cho phép cookie 	\N	2024-07-07 17:55:06
290	theme-ripple-vi-cookie_consent_learn_more_url	cookie-policy	\N	2024-07-07 17:55:06
291	theme-ripple-vi-cookie_consent_learn_more_text	Cookie Policy	\N	2024-07-07 17:55:06
292	theme-ripple-vi-logo	general/logo.png	\N	2024-07-07 17:55:06
293	theme-ripple-vi-homepage_id	1	\N	2024-07-07 17:55:06
274	theme-ripple-address	214 West Arnold St. New York, NY 10002	\N	2024-07-07 17:55:06
275	theme-ripple-cookie_consent_message	Your experience on this site will be improved by allowing cookies	\N	2024-07-07 17:55:06
276	theme-ripple-cookie_consent_learn_more_url	/cookie-policy	\N	2024-07-07 17:55:06
277	theme-ripple-cookie_consent_learn_more_text	Cookie Policy	\N	2024-07-07 17:55:06
278	theme-ripple-homepage_id	1	\N	2024-07-07 17:55:06
279	theme-ripple-blog_page_id	2	\N	2024-07-07 17:55:06
282	theme-ripple-vi-copyright	©2022 Botble Technologies. Tất cả quyền đã được bảo hộ.	\N	2024-07-07 17:55:06
283	theme-ripple-vi-favicon	general/favicon.png	\N	2024-07-07 17:55:06
2	is_completed_get_started	1	\N	2024-07-07 17:55:06
299	_method	PUT	\N	2024-07-07 17:55:06
300	_token	FCOfhY4qZbV8TlqV1W6WdXBmMi7TDSPjawKmCua6	\N	2024-07-07 17:55:06
301	admin_email	["admin@cslant.com"]	\N	2024-07-07 17:55:06
302	time_zone	Asia/Ho_Chi_Minh	\N	2024-07-07 17:55:06
303	enable_send_error_reporting_via_email	1	\N	2024-07-07 17:55:06
304	redirect_404_to_homepage	0	\N	2024-07-07 17:55:06
305	locale		\N	2024-07-07 17:55:06
306	theme-ripple-primary_font	Roboto	\N	2024-07-07 17:55:06
307	theme-ripple-primary_color	#AF0F26	\N	2024-07-07 17:55:06
308	theme-ripple-default_breadcrumb_banner_image		\N	2024-07-07 17:55:06
1	activated_plugins	["language","language-advanced","analytics","audit-log","backup","block","blog","captcha","contact","cookie-consent","custom-field","gallery","member","request-log","social-login","translation"]	\N	2024-07-07 17:55:06
262	language_switcher_display	list	\N	2024-07-07 17:55:06
263	language_display	all	\N	2024-07-07 17:55:06
264	language_hide_languages	[]	\N	2024-07-07 17:55:06
265	show_admin_bar	1	\N	2024-07-07 17:55:06
266	theme	ripple	\N	2024-07-07 17:55:06
268	theme-ripple-copyright	©2022 Botble Technologies. All right reserved.	\N	2024-07-07 17:55:06
269	theme-ripple-favicon	theme/cslant-favicon.png	\N	2024-07-07 17:55:06
270	theme-ripple-website	https://botble.com	\N	2024-07-07 17:55:06
271	theme-ripple-contact_email	support@botble.com	\N	2024-07-07 17:55:06
272	theme-ripple-site_description	With experience, we make sure to get every project done very fast and in time with high quality using our Botble CMS https://1.envato.market/LWRBY	\N	2024-07-07 17:55:06
294	theme-ripple-vi-blog_page_id	2	\N	2024-07-07 17:55:06
295	theme-ripple-social_links	[[{"key":"social-name","value":"Facebook"},{"key":"social-icon","value":"fab fa-facebook"},{"key":"social-url","value":"https:\\/\\/facebook.com"}],[{"key":"social-name","value":"Twitter"},{"key":"social-icon","value":"fab fa-twitter"},{"key":"social-url","value":"https:\\/\\/twitter.com"}],[{"key":"social-name","value":"Youtube"},{"key":"social-icon","value":"fab fa-youtube"},{"key":"social-url","value":"https:\\/\\/youtube.com"}]]	\N	2024-07-07 17:55:06
314	theme-ripple-galleries_page_id	\N	\N	2024-07-07 17:55:06
315	theme-ripple-facebook_comment_enabled_in_gallery	no	\N	2024-07-07 17:55:06
273	theme-ripple-phone	+(123) 345-6789	\N	2024-07-07 17:55:06
280	theme-ripple-logo	theme/cslant-logo.png	\N	2024-07-07 17:55:06
309	theme-ripple-show_site_name	0	\N	2024-07-07 17:55:06
310	theme-ripple-seo_title		\N	2024-07-07 17:55:06
311	theme-ripple-seo_description		\N	2024-07-07 17:55:06
312	theme-ripple-seo_og_image		\N	2024-07-07 17:55:06
313	theme-ripple-theme_breadcrumb_enabled	1	\N	2024-07-07 17:55:06
297	media_random_hash	e744a1547bd62a2aeee6119d472e0f3b	\N	2024-07-07 17:55:06
267	theme-ripple-site_title	CSlant Blog	\N	2024-07-07 17:55:06
316	theme-ripple-facebook_chat_enabled	no	\N	2024-07-07 17:55:06
317	theme-ripple-facebook_page_id		\N	2024-07-07 17:55:06
318	theme-ripple-facebook_comment_enabled_in_post	no	\N	2024-07-07 17:55:06
319	theme-ripple-facebook_app_id		\N	2024-07-07 17:55:06
320	theme-ripple-facebook_admins	[]	\N	2024-07-07 17:55:06
321	theme-ripple-number_of_posts_in_a_category	12	\N	2024-07-07 17:55:06
322	theme-ripple-number_of_posts_in_a_tag	12	\N	2024-07-07 17:55:06
323	theme-ripple-login_background	\N	\N	2024-07-07 17:55:06
324	theme-ripple-register_background	\N	\N	2024-07-07 17:55:06
325	theme-ripple-cookie_consent_enable	yes	\N	2024-07-07 17:55:06
326	theme-ripple-cookie_consent_style	full-width	\N	2024-07-07 17:55:06
327	theme-ripple-cookie_consent_button_text	Allow cookies	\N	2024-07-07 17:55:06
328	theme-ripple-cookie_consent_background_color	#000	\N	2024-07-07 17:55:06
329	theme-ripple-cookie_consent_text_color	#fff	\N	2024-07-07 17:55:06
330	theme-ripple-cookie_consent_max_width	1170	\N	2024-07-07 17:55:06
281	theme-ripple-vi-site_title	Một trang web sử dụng Botble CMS	\N	2024-07-07 17:55:06
261	language_hide_default	1	\N	2024-07-07 17:55:06
296	theme-ripple-vi-social_links	[[{"key":"social-name","value":"Facebook"},{"key":"social-icon","value":"fab fa-facebook"},{"key":"social-url","value":"https:\\/\\/facebook.com"}],[{"key":"social-name","value":"Twitter"},{"key":"social-icon","value":"fab fa-twitter"},{"key":"social-url","value":"https:\\/\\/twitter.com"}],[{"key":"social-name","value":"Youtube"},{"key":"social-icon","value":"fab fa-youtube"},{"key":"social-url","value":"https:\\/\\/youtube.com"}]]	\N	2024-07-07 17:55:06
331	api_enabled	1	\N	2024-07-07 17:55:06
332	admin_logo	theme/cslant-text-logo.png	\N	2024-07-07 17:55:06
333	admin_favicon	theme/cslant-favicon.png	\N	2024-07-07 17:55:06
334	login_screen_backgrounds	[]	\N	2024-07-07 17:55:06
335	admin_title	CSlant Blog	\N	2024-07-07 17:55:06
336	admin_appearance_locale	en	\N	2024-07-07 17:55:06
337	rich_editor	ckeditor	\N	2024-07-07 17:55:06
338	admin_appearance_layout	vertical	\N	2024-07-07 17:55:06
339	admin_appearance_show_menu_item_icon	1	\N	2024-07-07 17:55:06
340	admin_appearance_container_width	container-xl	\N	2024-07-07 17:55:06
341	show_theme_guideline_link	1	\N	2024-07-07 17:55:06
342	admin_primary_font	Inter	\N	2024-07-07 17:55:06
343	admin_primary_color	rgb(56, 118, 29)	\N	2024-07-07 17:55:06
344	admin_secondary_color	#6c7a91	\N	2024-07-07 17:55:06
345	admin_heading_color	inherit	\N	2024-07-07 17:55:06
346	admin_text_color	#182433	\N	2024-07-07 17:55:06
347	admin_link_color	rgb(56, 118, 29)	\N	2024-07-07 17:55:06
348	admin_link_hover_color	rgb(39, 78, 19)	\N	2024-07-07 17:55:06
349	admin_appearance_locale_direction	ltr	\N	2024-07-07 17:55:06
\.


--
-- Data for Name: slugs; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.slugs (id, key, reference_id, reference_type, prefix, created_at, updated_at) FROM stdin;
267	homepage	1	Botble\\Page\\Models\\Page	\N	2022-10-04 06:38:46	2022-10-04 06:38:46
268	blog	2	Botble\\Page\\Models\\Page	\N	2022-10-04 06:38:46	2022-10-04 06:38:46
269	contact	3	Botble\\Page\\Models\\Page	\N	2022-10-04 06:38:46	2022-10-04 06:38:46
270	cookie-policy	4	Botble\\Page\\Models\\Page	\N	2022-10-04 06:38:46	2022-10-04 06:38:46
271	perfect	1	Botble\\Gallery\\Models\\Gallery	galleries	2022-10-04 06:38:47	2022-10-04 06:38:47
272	new-day	2	Botble\\Gallery\\Models\\Gallery	galleries	2022-10-04 06:38:47	2022-10-04 06:38:47
273	happy-day	3	Botble\\Gallery\\Models\\Gallery	galleries	2022-10-04 06:38:47	2022-10-04 06:38:47
274	nature	4	Botble\\Gallery\\Models\\Gallery	galleries	2022-10-04 06:38:47	2022-10-04 06:38:47
275	morning	5	Botble\\Gallery\\Models\\Gallery	galleries	2022-10-04 06:38:47	2022-10-04 06:38:47
276	photography	6	Botble\\Gallery\\Models\\Gallery	galleries	2022-10-04 06:38:47	2022-10-04 06:38:47
277	design	1	Botble\\Blog\\Models\\Category	\N	2022-10-04 06:38:48	2022-10-04 06:38:48
278	lifestyle	2	Botble\\Blog\\Models\\Category	\N	2022-10-04 06:38:48	2022-10-04 06:38:48
279	travel-tips	3	Botble\\Blog\\Models\\Category	\N	2022-10-04 06:38:48	2022-10-04 06:38:48
280	healthy	4	Botble\\Blog\\Models\\Category	\N	2022-10-04 06:38:48	2022-10-04 06:38:48
281	travel-tips	5	Botble\\Blog\\Models\\Category	\N	2022-10-04 06:38:48	2022-10-04 06:38:48
282	hotel	6	Botble\\Blog\\Models\\Category	\N	2022-10-04 06:38:48	2022-10-04 06:38:48
283	nature	7	Botble\\Blog\\Models\\Category	\N	2022-10-04 06:38:48	2022-10-04 06:38:48
284	general	1	Botble\\Blog\\Models\\Tag	tag	2022-10-04 06:38:48	2022-10-04 06:38:48
285	design	2	Botble\\Blog\\Models\\Tag	tag	2022-10-04 06:38:48	2022-10-04 06:38:48
286	fashion	3	Botble\\Blog\\Models\\Tag	tag	2022-10-04 06:38:48	2022-10-04 06:38:48
287	branding	4	Botble\\Blog\\Models\\Tag	tag	2022-10-04 06:38:48	2022-10-04 06:38:48
288	modern	5	Botble\\Blog\\Models\\Tag	tag	2022-10-04 06:38:48	2022-10-04 06:38:48
289	the-top-2020-handbag-trends-to-know	1	Botble\\Blog\\Models\\Post	\N	2022-10-04 06:38:48	2022-10-04 06:38:48
290	top-search-engine-optimization-strategies	2	Botble\\Blog\\Models\\Post	\N	2022-10-04 06:38:48	2022-10-04 06:38:48
291	which-company-would-you-choose	3	Botble\\Blog\\Models\\Post	\N	2022-10-04 06:38:48	2022-10-04 06:38:48
292	used-car-dealer-sales-tricks-exposed	4	Botble\\Blog\\Models\\Post	\N	2022-10-04 06:38:48	2022-10-04 06:38:48
293	20-ways-to-sell-your-product-faster	5	Botble\\Blog\\Models\\Post	\N	2022-10-04 06:38:48	2022-10-04 06:38:48
294	the-secrets-of-rich-and-famous-writers	6	Botble\\Blog\\Models\\Post	\N	2022-10-04 06:38:48	2022-10-04 06:38:48
295	imagine-losing-20-pounds-in-14-days	7	Botble\\Blog\\Models\\Post	\N	2022-10-04 06:38:48	2022-10-04 06:38:48
296	are-you-still-using-that-slow-old-typewriter	8	Botble\\Blog\\Models\\Post	\N	2022-10-04 06:38:48	2022-10-04 06:38:48
297	a-skin-cream-thats-proven-to-work	9	Botble\\Blog\\Models\\Post	\N	2022-10-04 06:38:48	2022-10-04 06:38:48
298	10-reasons-to-start-your-own-profitable-website	10	Botble\\Blog\\Models\\Post	\N	2022-10-04 06:38:48	2022-10-04 06:38:48
299	simple-ways-to-reduce-your-unwanted-wrinkles	11	Botble\\Blog\\Models\\Post	\N	2022-10-04 06:38:48	2022-10-04 06:38:48
300	apple-imac-with-retina-5k-display-review	12	Botble\\Blog\\Models\\Post	\N	2022-10-04 06:38:48	2022-10-04 06:38:48
301	10000-web-site-visitors-in-one-monthguaranteed	13	Botble\\Blog\\Models\\Post	\N	2022-10-04 06:38:48	2022-10-04 06:38:48
302	unlock-the-secrets-of-selling-high-ticket-items	14	Botble\\Blog\\Models\\Post	\N	2022-10-04 06:38:48	2022-10-04 06:38:48
303	4-expert-tips-on-how-to-choose-the-right-mens-wallet	15	Botble\\Blog\\Models\\Post	\N	2022-10-04 06:38:48	2022-10-04 06:38:48
304	sexy-clutches-how-to-buy-wear-a-designer-clutch-bag	16	Botble\\Blog\\Models\\Post	\N	2022-10-04 06:38:48	2022-10-04 06:38:48
\.


--
-- Data for Name: slugs_translations; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.slugs_translations (lang_code, slugs_id, key, prefix) FROM stdin;
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.tags (id, name, author_id, author_type, description, status, created_at, updated_at) FROM stdin;
1	General	1	Botble\\ACL\\Models\\User	\N	published	2022-10-04 06:38:48	2022-10-04 06:38:48
2	Design	1	Botble\\ACL\\Models\\User	\N	published	2022-10-04 06:38:48	2022-10-04 06:38:48
3	Fashion	1	Botble\\ACL\\Models\\User	\N	published	2022-10-04 06:38:48	2022-10-04 06:38:48
4	Branding	1	Botble\\ACL\\Models\\User	\N	published	2022-10-04 06:38:48	2022-10-04 06:38:48
5	Modern	1	Botble\\ACL\\Models\\User	\N	published	2022-10-04 06:38:48	2022-10-04 06:38:48
\.


--
-- Data for Name: tags_translations; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.tags_translations (lang_code, tags_id, name, description) FROM stdin;
vi	1	Chung	NULL
vi	2	Thiết kế	NULL
vi	3	Thời trang	NULL
vi	4	Thương hiệu	NULL
vi	5	Hiện đại	NULL
\.


--
-- Data for Name: translations; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.translations (id, status, locale, "group", key, value, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: user_meta; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.user_meta (id, key, value, user_id, created_at, updated_at) FROM stdin;
1	theme_mode	light	1	2024-06-30 02:52:07	2024-06-30 02:52:32
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.users (id, email, email_verified_at, password, remember_token, created_at, updated_at, first_name, last_name, username, avatar_id, super_user, manage_supers, permissions, last_login) FROM stdin;
1	admin@cslant.com	\N	$2y$10$Y591sSGo7bd24UyI8fzzIeq1kHP.8lwmRNOGWaCAsk4Dznwm0dkXO	NULL	2022-10-04 06:38:46	2024-07-07 17:58:39	System	Admin	cslant	310	1	1	NULL	\N
\.


--
-- Data for Name: widgets; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.widgets (id, widget_id, sidebar_id, theme, "position", data, created_at, updated_at) FROM stdin;
1	RecentPostsWidget	footer_sidebar	ripple	0	{"id":"RecentPostsWidget","name":"Recent Posts","number_display":5}	2022-10-04 06:38:50	2022-10-04 06:38:50
2	RecentPostsWidget	top_sidebar	ripple	0	{"id":"RecentPostsWidget","name":"Recent Posts","number_display":5}	2022-10-04 06:38:50	2022-10-04 06:38:50
3	TagsWidget	primary_sidebar	ripple	0	{"id":"TagsWidget","name":"Tags","number_display":5}	2022-10-04 06:38:50	2022-10-04 06:38:50
4	CustomMenuWidget	primary_sidebar	ripple	1	{"id":"CustomMenuWidget","name":"Categories","menu_id":"featured-categories"}	2022-10-04 06:38:50	2022-10-04 06:38:50
5	CustomMenuWidget	primary_sidebar	ripple	2	{"id":"CustomMenuWidget","name":"Social","menu_id":"social"}	2022-10-04 06:38:50	2022-10-04 06:38:50
6	CustomMenuWidget	footer_sidebar	ripple	1	{"id":"CustomMenuWidget","name":"Favorite Websites","menu_id":"favorite-websites"}	2022-10-04 06:38:50	2022-10-04 06:38:50
7	CustomMenuWidget	footer_sidebar	ripple	2	{"id":"CustomMenuWidget","name":"My Links","menu_id":"my-links"}	2022-10-04 06:38:50	2022-10-04 06:38:50
8	RecentPostsWidget	footer_sidebar	ripple-vi	0	{"id":"RecentPostsWidget","name":"B\\u00e0i vi\\u1ebft g\\u1ea7n \\u0111\\u00e2y","number_display":5}	2022-10-04 06:38:50	2022-10-04 06:38:50
9	RecentPostsWidget	top_sidebar	ripple-vi	0	{"id":"RecentPostsWidget","name":"B\\u00e0i vi\\u1ebft g\\u1ea7n \\u0111\\u00e2y","number_display":5}	2022-10-04 06:38:50	2022-10-04 06:38:50
10	TagsWidget	primary_sidebar	ripple-vi	0	{"id":"TagsWidget","name":"Tags","number_display":5}	2022-10-04 06:38:50	2022-10-04 06:38:50
11	CustomMenuWidget	primary_sidebar	ripple-vi	1	{"id":"CustomMenuWidget","name":"Danh m\\u1ee5c n\\u1ed5i b\\u1eadt","menu_id":"danh-muc-noi-bat"}	2022-10-04 06:38:50	2022-10-04 06:38:50
12	CustomMenuWidget	primary_sidebar	ripple-vi	2	{"id":"CustomMenuWidget","name":"M\\u1ea1ng x\\u00e3 h\\u1ed9i","menu_id":"social"}	2022-10-04 06:38:50	2022-10-04 06:38:50
13	CustomMenuWidget	footer_sidebar	ripple-vi	1	{"id":"CustomMenuWidget","name":"Trang web y\\u00eau th\\u00edch","menu_id":"trang-web-yeu-thich"}	2022-10-04 06:38:50	2022-10-04 06:38:50
14	CustomMenuWidget	footer_sidebar	ripple-vi	2	{"id":"CustomMenuWidget","name":"Li\\u00ean k\\u1ebft","menu_id":"lien-ket"}	2022-10-04 06:38:50	2022-10-04 06:38:50
\.


--
-- Name: activations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.activations_id_seq', 9, true);


--
-- Name: admin_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.admin_notifications_id_seq', 1, false);


--
-- Name: audit_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.audit_histories_id_seq', 1, false);


--
-- Name: blocks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.blocks_id_seq', 6, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.categories_id_seq', 8, true);


--
-- Name: contact_replies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.contact_replies_id_seq', 1, false);


--
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.contacts_id_seq', 11, true);


--
-- Name: custom_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.custom_fields_id_seq', 1, false);


--
-- Name: dashboard_widget_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.dashboard_widget_settings_id_seq', 1, false);


--
-- Name: dashboard_widgets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.dashboard_widgets_id_seq', 23, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: field_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.field_groups_id_seq', 1, false);


--
-- Name: field_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.field_items_id_seq', 1, false);


--
-- Name: galleries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.galleries_id_seq', 7, true);


--
-- Name: gallery_meta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.gallery_meta_id_seq', 7, true);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Name: language_meta_lang_meta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.language_meta_lang_meta_id_seq', 1, false);


--
-- Name: languages_lang_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.languages_lang_id_seq', 1, false);


--
-- Name: media_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.media_files_id_seq', 310, true);


--
-- Name: media_folders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.media_folders_id_seq', 35, true);


--
-- Name: media_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.media_settings_id_seq', 1, false);


--
-- Name: member_activity_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.member_activity_logs_id_seq', 1, false);


--
-- Name: members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.members_id_seq', 11, true);


--
-- Name: menu_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.menu_locations_id_seq', 3, true);


--
-- Name: menu_nodes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.menu_nodes_id_seq', 51, true);


--
-- Name: menus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.menus_id_seq', 11, true);


--
-- Name: meta_boxes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.meta_boxes_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.migrations_id_seq', 39, true);


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.pages_id_seq', 5, true);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- Name: post_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.post_categories_id_seq', 192, true);


--
-- Name: post_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.post_tags_id_seq', 81, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.posts_id_seq', 17, true);


--
-- Name: request_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.request_logs_id_seq', 1, false);


--
-- Name: revisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.revisions_id_seq', 1, false);


--
-- Name: role_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.role_users_id_seq', 1, false);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.roles_id_seq', 7, true);


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.settings_id_seq', 349, true);


--
-- Name: slugs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.slugs_id_seq', 305, true);


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.tags_id_seq', 6, true);


--
-- Name: translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.translations_id_seq', 1, false);


--
-- Name: user_meta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.user_meta_id_seq', 2, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: widgets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.widgets_id_seq', 15, true);


--
-- Name: activations activations_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.activations
    ADD CONSTRAINT activations_pkey PRIMARY KEY (id);


--
-- Name: admin_notifications admin_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.admin_notifications
    ADD CONSTRAINT admin_notifications_pkey PRIMARY KEY (id);


--
-- Name: audit_histories audit_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.audit_histories
    ADD CONSTRAINT audit_histories_pkey PRIMARY KEY (id);


--
-- Name: blocks blocks_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.blocks
    ADD CONSTRAINT blocks_pkey PRIMARY KEY (id);


--
-- Name: blocks_translations blocks_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.blocks_translations
    ADD CONSTRAINT blocks_translations_pkey PRIMARY KEY (lang_code, blocks_id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: categories_translations categories_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.categories_translations
    ADD CONSTRAINT categories_translations_pkey PRIMARY KEY (lang_code, categories_id);


--
-- Name: contact_replies contact_replies_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.contact_replies
    ADD CONSTRAINT contact_replies_pkey PRIMARY KEY (id);


--
-- Name: contacts contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: custom_fields custom_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.custom_fields
    ADD CONSTRAINT custom_fields_pkey PRIMARY KEY (id);


--
-- Name: custom_fields_translations custom_fields_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.custom_fields_translations
    ADD CONSTRAINT custom_fields_translations_pkey PRIMARY KEY (lang_code, custom_fields_id);


--
-- Name: dashboard_widget_settings dashboard_widget_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.dashboard_widget_settings
    ADD CONSTRAINT dashboard_widget_settings_pkey PRIMARY KEY (id);


--
-- Name: dashboard_widgets dashboard_widgets_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.dashboard_widgets
    ADD CONSTRAINT dashboard_widgets_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: field_groups field_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.field_groups
    ADD CONSTRAINT field_groups_pkey PRIMARY KEY (id);


--
-- Name: field_items field_items_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.field_items
    ADD CONSTRAINT field_items_pkey PRIMARY KEY (id);


--
-- Name: galleries galleries_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.galleries
    ADD CONSTRAINT galleries_pkey PRIMARY KEY (id);


--
-- Name: galleries_translations galleries_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.galleries_translations
    ADD CONSTRAINT galleries_translations_pkey PRIMARY KEY (lang_code, galleries_id);


--
-- Name: gallery_meta gallery_meta_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.gallery_meta
    ADD CONSTRAINT gallery_meta_pkey PRIMARY KEY (id);


--
-- Name: gallery_meta_translations gallery_meta_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.gallery_meta_translations
    ADD CONSTRAINT gallery_meta_translations_pkey PRIMARY KEY (lang_code, gallery_meta_id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: language_meta language_meta_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.language_meta
    ADD CONSTRAINT language_meta_pkey PRIMARY KEY (lang_meta_id);


--
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (lang_id);


--
-- Name: media_files media_files_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.media_files
    ADD CONSTRAINT media_files_pkey PRIMARY KEY (id);


--
-- Name: media_folders media_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.media_folders
    ADD CONSTRAINT media_folders_pkey PRIMARY KEY (id);


--
-- Name: media_settings media_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.media_settings
    ADD CONSTRAINT media_settings_pkey PRIMARY KEY (id);


--
-- Name: member_activity_logs member_activity_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.member_activity_logs
    ADD CONSTRAINT member_activity_logs_pkey PRIMARY KEY (id);


--
-- Name: members members_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_pkey PRIMARY KEY (id);


--
-- Name: menu_locations menu_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.menu_locations
    ADD CONSTRAINT menu_locations_pkey PRIMARY KEY (id);


--
-- Name: menu_nodes menu_nodes_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.menu_nodes
    ADD CONSTRAINT menu_nodes_pkey PRIMARY KEY (id);


--
-- Name: menus menus_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.menus
    ADD CONSTRAINT menus_pkey PRIMARY KEY (id);


--
-- Name: menus menus_slug_unique; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.menus
    ADD CONSTRAINT menus_slug_unique UNIQUE (slug);


--
-- Name: meta_boxes meta_boxes_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.meta_boxes
    ADD CONSTRAINT meta_boxes_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: pages pages_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: pages_translations pages_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.pages_translations
    ADD CONSTRAINT pages_translations_pkey PRIMARY KEY (lang_code, pages_id);


--
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- Name: post_categories post_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.post_categories
    ADD CONSTRAINT post_categories_pkey PRIMARY KEY (id);


--
-- Name: post_tags post_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.post_tags
    ADD CONSTRAINT post_tags_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: posts_translations posts_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.posts_translations
    ADD CONSTRAINT posts_translations_pkey PRIMARY KEY (lang_code, posts_id);


--
-- Name: request_logs request_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.request_logs
    ADD CONSTRAINT request_logs_pkey PRIMARY KEY (id);


--
-- Name: revisions revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.revisions
    ADD CONSTRAINT revisions_pkey PRIMARY KEY (id);


--
-- Name: role_users role_users_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.role_users
    ADD CONSTRAINT role_users_pkey PRIMARY KEY (user_id, role_id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: roles roles_slug_unique; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_slug_unique UNIQUE (slug);


--
-- Name: settings settings_key_unique; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_key_unique UNIQUE (key);


--
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: slugs slugs_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.slugs
    ADD CONSTRAINT slugs_pkey PRIMARY KEY (id);


--
-- Name: slugs_translations slugs_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.slugs_translations
    ADD CONSTRAINT slugs_translations_pkey PRIMARY KEY (lang_code, slugs_id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: tags_translations tags_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.tags_translations
    ADD CONSTRAINT tags_translations_pkey PRIMARY KEY (lang_code, tags_id);


--
-- Name: translations translations_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.translations
    ADD CONSTRAINT translations_pkey PRIMARY KEY (id);


--
-- Name: user_meta user_meta_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_meta
    ADD CONSTRAINT user_meta_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_unique; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_unique UNIQUE (username);


--
-- Name: widgets widgets_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.widgets
    ADD CONSTRAINT widgets_pkey PRIMARY KEY (id);


--
-- Name: activations_user_id_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX activations_user_id_idx ON public.activations USING btree (user_id);


--
-- Name: activations_user_id_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX activations_user_id_index ON public.activations USING btree (user_id);


--
-- Name: audit_histories_module_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX audit_histories_module_idx ON public.audit_histories USING btree (module);


--
-- Name: audit_histories_user_id_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX audit_histories_user_id_idx ON public.audit_histories USING btree (user_id);


--
-- Name: categories_created_at_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX categories_created_at_idx ON public.categories USING btree (created_at);


--
-- Name: categories_parent_id_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX categories_parent_id_idx ON public.categories USING btree (parent_id);


--
-- Name: categories_status_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX categories_status_idx ON public.categories USING btree (status);


--
-- Name: dashboard_widget_settings_user_id_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX dashboard_widget_settings_user_id_idx ON public.dashboard_widget_settings USING btree (user_id);


--
-- Name: dashboard_widget_settings_user_id_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX dashboard_widget_settings_user_id_index ON public.dashboard_widget_settings USING btree (user_id);


--
-- Name: dashboard_widget_settings_widget_id_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX dashboard_widget_settings_widget_id_idx ON public.dashboard_widget_settings USING btree (widget_id);


--
-- Name: dashboard_widget_settings_widget_id_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX dashboard_widget_settings_widget_id_index ON public.dashboard_widget_settings USING btree (widget_id);


--
-- Name: failed_jobs_uuid_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE UNIQUE INDEX failed_jobs_uuid_idx ON public.failed_jobs USING btree (uuid);


--
-- Name: galleries_user_id_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX galleries_user_id_idx ON public.galleries USING btree (user_id);


--
-- Name: gallery_meta_reference_id_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX gallery_meta_reference_id_idx ON public.gallery_meta USING btree (reference_id);


--
-- Name: jobs_queue_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX jobs_queue_idx ON public.jobs USING btree (queue);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: language_meta_reference_id_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX language_meta_reference_id_idx ON public.language_meta USING btree (reference_id);


--
-- Name: media_files_folder_id_user_id_created_at_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX media_files_folder_id_user_id_created_at_idx ON public.media_files USING btree (folder_id, user_id, created_at);


--
-- Name: media_files_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX media_files_index ON public.media_files USING btree (folder_id, user_id, created_at);


--
-- Name: media_files_user_id_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX media_files_user_id_idx ON public.media_files USING btree (user_id);


--
-- Name: media_files_user_id_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX media_files_user_id_index ON public.media_files USING btree (user_id);


--
-- Name: media_folders_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX media_folders_index ON public.media_folders USING btree (parent_id, user_id, created_at);


--
-- Name: media_folders_parent_id_user_id_created_at_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX media_folders_parent_id_user_id_created_at_idx ON public.media_folders USING btree (parent_id, user_id, created_at);


--
-- Name: media_folders_user_id_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX media_folders_user_id_idx ON public.media_folders USING btree (user_id);


--
-- Name: media_folders_user_id_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX media_folders_user_id_index ON public.media_folders USING btree (user_id);


--
-- Name: member_activity_logs_member_id_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX member_activity_logs_member_id_idx ON public.member_activity_logs USING btree (member_id);


--
-- Name: member_password_resets_email_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX member_password_resets_email_idx ON public.member_password_resets USING btree (email);


--
-- Name: member_password_resets_token_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX member_password_resets_token_idx ON public.member_password_resets USING btree (token);


--
-- Name: members_email_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE UNIQUE INDEX members_email_idx ON public.members USING btree (email);


--
-- Name: menu_locations_menu_id_created_at_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX menu_locations_menu_id_created_at_idx ON public.menu_locations USING btree (menu_id, created_at);


--
-- Name: menu_locations_menu_id_created_at_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX menu_locations_menu_id_created_at_index ON public.menu_locations USING btree (menu_id, created_at);


--
-- Name: menu_nodes_menu_id_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX menu_nodes_menu_id_idx ON public.menu_nodes USING btree (menu_id);


--
-- Name: menu_nodes_menu_id_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX menu_nodes_menu_id_index ON public.menu_nodes USING btree (menu_id);


--
-- Name: menu_nodes_parent_id_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX menu_nodes_parent_id_idx ON public.menu_nodes USING btree (parent_id);


--
-- Name: menu_nodes_parent_id_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX menu_nodes_parent_id_index ON public.menu_nodes USING btree (parent_id);


--
-- Name: menu_nodes_reference_id_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX menu_nodes_reference_id_idx ON public.menu_nodes USING btree (reference_id);


--
-- Name: menu_nodes_reference_type_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX menu_nodes_reference_type_idx ON public.menu_nodes USING btree (reference_type);


--
-- Name: menus_slug_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE UNIQUE INDEX menus_slug_idx ON public.menus USING btree (slug);


--
-- Name: meta_boxes_reference_id_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX meta_boxes_reference_id_idx ON public.meta_boxes USING btree (reference_id);


--
-- Name: meta_boxes_reference_id_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX meta_boxes_reference_id_index ON public.meta_boxes USING btree (reference_id);


--
-- Name: pages_user_id_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX pages_user_id_index ON public.pages USING btree (user_id);


--
-- Name: password_resets_email_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX password_resets_email_idx ON public.password_resets USING btree (email);


--
-- Name: personal_access_tokens_token_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE UNIQUE INDEX personal_access_tokens_token_idx ON public.personal_access_tokens USING btree (token);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_idx ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- Name: posts_author_id_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX posts_author_id_idx ON public.posts USING btree (author_id);


--
-- Name: posts_author_type_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX posts_author_type_idx ON public.posts USING btree (author_type);


--
-- Name: posts_created_at_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX posts_created_at_idx ON public.posts USING btree (created_at);


--
-- Name: posts_status_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX posts_status_idx ON public.posts USING btree (status);


--
-- Name: reference_id; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX reference_id ON public.menu_nodes USING btree (reference_id);


--
-- Name: reference_type; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX reference_type ON public.menu_nodes USING btree (reference_type);


--
-- Name: revisions_revisionable_id_revisionable_type_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX revisions_revisionable_id_revisionable_type_idx ON public.revisions USING btree (revisionable_id, revisionable_type);


--
-- Name: revisions_revisionable_id_revisionable_type_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX revisions_revisionable_id_revisionable_type_index ON public.revisions USING btree (revisionable_id, revisionable_type);


--
-- Name: role_users_role_id_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX role_users_role_id_idx ON public.role_users USING btree (role_id);


--
-- Name: role_users_role_id_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX role_users_role_id_index ON public.role_users USING btree (role_id);


--
-- Name: role_users_user_id_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX role_users_user_id_idx ON public.role_users USING btree (user_id);


--
-- Name: role_users_user_id_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX role_users_user_id_index ON public.role_users USING btree (user_id);


--
-- Name: roles_created_by_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX roles_created_by_idx ON public.roles USING btree (created_by);


--
-- Name: roles_created_by_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX roles_created_by_index ON public.roles USING btree (created_by);


--
-- Name: roles_slug_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE UNIQUE INDEX roles_slug_idx ON public.roles USING btree (slug);


--
-- Name: roles_updated_by_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX roles_updated_by_idx ON public.roles USING btree (updated_by);


--
-- Name: roles_updated_by_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX roles_updated_by_index ON public.roles USING btree (updated_by);


--
-- Name: settings_key_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE UNIQUE INDEX settings_key_idx ON public.settings USING btree (key);


--
-- Name: slugs_key_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX slugs_key_index ON public.slugs USING btree (key);


--
-- Name: slugs_prefix_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX slugs_prefix_index ON public.slugs USING btree (prefix);


--
-- Name: slugs_reference_id_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX slugs_reference_id_index ON public.slugs USING btree (reference_id);


--
-- Name: slugs_reference_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX slugs_reference_index ON public.slugs USING btree (reference_id, reference_type);


--
-- Name: user_meta_user_id_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX user_meta_user_id_idx ON public.user_meta USING btree (user_id);


--
-- Name: user_meta_user_id_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX user_meta_user_id_index ON public.user_meta USING btree (user_id);


--
-- Name: users_email_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE UNIQUE INDEX users_email_idx ON public.users USING btree (email);


--
-- Name: users_username_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE UNIQUE INDEX users_username_idx ON public.users USING btree (username);


--
-- PostgreSQL database dump complete
--

