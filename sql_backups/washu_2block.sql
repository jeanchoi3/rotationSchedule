--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: sw; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO sw;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: sw
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO sw;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sw
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: sw; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO sw;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: sw
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO sw;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sw
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: sw; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO sw;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: sw
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO sw;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sw
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: sw; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO sw;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: sw; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO sw;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: sw
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO sw;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sw
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: sw
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO sw;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sw
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: sw; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO sw;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: sw
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO sw;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sw
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: sw; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO sw;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: sw
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO sw;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sw
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: sw; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO sw;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: sw
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO sw;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sw
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: sw; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO sw;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: sw
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO sw;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sw
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: sw; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO sw;

--
-- Name: rotationSchedule_app_block; Type: TABLE; Schema: public; Owner: sw; Tablespace: 
--

CREATE TABLE "rotationSchedule_app_block" (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    length integer NOT NULL,
    "maxNumRotations" integer NOT NULL,
    CONSTRAINT "rotationSchedule_app_block_length_check" CHECK ((length >= 0)),
    CONSTRAINT "rotationSchedule_app_block_maxNumRotations_check" CHECK (("maxNumRotations" >= 0))
);


ALTER TABLE public."rotationSchedule_app_block" OWNER TO sw;

--
-- Name: rotationSchedule_app_block_id_seq; Type: SEQUENCE; Schema: public; Owner: sw
--

CREATE SEQUENCE "rotationSchedule_app_block_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."rotationSchedule_app_block_id_seq" OWNER TO sw;

--
-- Name: rotationSchedule_app_block_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sw
--

ALTER SEQUENCE "rotationSchedule_app_block_id_seq" OWNED BY "rotationSchedule_app_block".id;


--
-- Name: rotationSchedule_app_educationreq; Type: TABLE; Schema: public; Owner: sw; Tablespace: 
--

CREATE TABLE "rotationSchedule_app_educationreq" (
    id integer NOT NULL,
    "minLength" integer NOT NULL,
    "maxLength" integer NOT NULL,
    rotation_id integer NOT NULL,
    year_id integer NOT NULL,
    CONSTRAINT "rotationSchedule_app_educationreq_maxLength_check" CHECK (("maxLength" >= 0)),
    CONSTRAINT "rotationSchedule_app_educationreq_minLength_check" CHECK (("minLength" >= 0))
);


ALTER TABLE public."rotationSchedule_app_educationreq" OWNER TO sw;

--
-- Name: rotationSchedule_app_educationreq_id_seq; Type: SEQUENCE; Schema: public; Owner: sw
--

CREATE SEQUENCE "rotationSchedule_app_educationreq_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."rotationSchedule_app_educationreq_id_seq" OWNER TO sw;

--
-- Name: rotationSchedule_app_educationreq_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sw
--

ALTER SEQUENCE "rotationSchedule_app_educationreq_id_seq" OWNED BY "rotationSchedule_app_educationreq".id;


--
-- Name: rotationSchedule_app_event; Type: TABLE; Schema: public; Owner: sw; Tablespace: 
--

CREATE TABLE "rotationSchedule_app_event" (
    id integer NOT NULL,
    "startDate" date NOT NULL,
    "endDate" date NOT NULL,
    resident_id integer NOT NULL,
    rotation_id integer NOT NULL,
    schedule_id integer NOT NULL
);


ALTER TABLE public."rotationSchedule_app_event" OWNER TO sw;

--
-- Name: rotationSchedule_app_event_id_seq; Type: SEQUENCE; Schema: public; Owner: sw
--

CREATE SEQUENCE "rotationSchedule_app_event_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."rotationSchedule_app_event_id_seq" OWNER TO sw;

--
-- Name: rotationSchedule_app_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sw
--

ALTER SEQUENCE "rotationSchedule_app_event_id_seq" OWNED BY "rotationSchedule_app_event".id;


--
-- Name: rotationSchedule_app_program; Type: TABLE; Schema: public; Owner: sw; Tablespace: 
--

CREATE TABLE "rotationSchedule_app_program" (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    "startDate" date NOT NULL,
    "endDate" date NOT NULL,
    "rigidXY" boolean NOT NULL,
    "minClinicWeeks" integer NOT NULL,
    "windowSize" integer NOT NULL
);


ALTER TABLE public."rotationSchedule_app_program" OWNER TO sw;

--
-- Name: rotationSchedule_app_program_id_seq; Type: SEQUENCE; Schema: public; Owner: sw
--

CREATE SEQUENCE "rotationSchedule_app_program_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."rotationSchedule_app_program_id_seq" OWNER TO sw;

--
-- Name: rotationSchedule_app_program_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sw
--

ALTER SEQUENCE "rotationSchedule_app_program_id_seq" OWNED BY "rotationSchedule_app_program".id;


--
-- Name: rotationSchedule_app_resident; Type: TABLE; Schema: public; Owner: sw; Tablespace: 
--

CREATE TABLE "rotationSchedule_app_resident" (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    "inProgram" boolean NOT NULL,
    "vacationStart1" date,
    "vacationEnd1" date,
    "vacationStart2" date,
    "vacationEnd2" date,
    "vacationStart3" date,
    "vacationEnd3" date,
    "vacationPreference" integer NOT NULL,
    elective1_id integer,
    elective2_id integer,
    elective3_id integer,
    elective4_id integer,
    year_id integer,
    elective10_id integer,
    elective5_id integer,
    elective6_id integer,
    elective7_id integer,
    elective8_id integer,
    elective9_id integer,
    email character varying(100),
    couple_id integer
);


ALTER TABLE public."rotationSchedule_app_resident" OWNER TO sw;

--
-- Name: rotationSchedule_app_resident_id_seq; Type: SEQUENCE; Schema: public; Owner: sw
--

CREATE SEQUENCE "rotationSchedule_app_resident_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."rotationSchedule_app_resident_id_seq" OWNER TO sw;

--
-- Name: rotationSchedule_app_resident_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sw
--

ALTER SEQUENCE "rotationSchedule_app_resident_id_seq" OWNED BY "rotationSchedule_app_resident".id;


--
-- Name: rotationSchedule_app_resident_resExcludedBlocks; Type: TABLE; Schema: public; Owner: sw; Tablespace: 
--

CREATE TABLE "rotationSchedule_app_resident_resExcludedBlocks" (
    id integer NOT NULL,
    resident_id integer NOT NULL,
    templateevent_id integer NOT NULL
);


ALTER TABLE public."rotationSchedule_app_resident_resExcludedBlocks" OWNER TO sw;

--
-- Name: rotationSchedule_app_resident_resExcludedBlocks_id_seq; Type: SEQUENCE; Schema: public; Owner: sw
--

CREATE SEQUENCE "rotationSchedule_app_resident_resExcludedBlocks_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."rotationSchedule_app_resident_resExcludedBlocks_id_seq" OWNER TO sw;

--
-- Name: rotationSchedule_app_resident_resExcludedBlocks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sw
--

ALTER SEQUENCE "rotationSchedule_app_resident_resExcludedBlocks_id_seq" OWNED BY "rotationSchedule_app_resident_resExcludedBlocks".id;


--
-- Name: rotationSchedule_app_resident_tracks; Type: TABLE; Schema: public; Owner: sw; Tablespace: 
--

CREATE TABLE "rotationSchedule_app_resident_tracks" (
    id integer NOT NULL,
    resident_id integer NOT NULL,
    track_id integer NOT NULL
);


ALTER TABLE public."rotationSchedule_app_resident_tracks" OWNER TO sw;

--
-- Name: rotationSchedule_app_resident_tracks_id_seq; Type: SEQUENCE; Schema: public; Owner: sw
--

CREATE SEQUENCE "rotationSchedule_app_resident_tracks_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."rotationSchedule_app_resident_tracks_id_seq" OWNER TO sw;

--
-- Name: rotationSchedule_app_resident_tracks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sw
--

ALTER SEQUENCE "rotationSchedule_app_resident_tracks_id_seq" OWNED BY "rotationSchedule_app_resident_tracks".id;


--
-- Name: rotationSchedule_app_rotation; Type: TABLE; Schema: public; Owner: sw; Tablespace: 
--

CREATE TABLE "rotationSchedule_app_rotation" (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    "minResidents" integer NOT NULL,
    "maxResidents" integer NOT NULL,
    "isElective" boolean NOT NULL,
    "recurrenceWindow" integer NOT NULL,
    CONSTRAINT "rotationSchedule_app_rotation_maxResidents_check" CHECK (("maxResidents" >= 0)),
    CONSTRAINT "rotationSchedule_app_rotation_minResidents_check" CHECK (("minResidents" >= 0))
);


ALTER TABLE public."rotationSchedule_app_rotation" OWNER TO sw;

--
-- Name: rotationSchedule_app_rotation_id_seq; Type: SEQUENCE; Schema: public; Owner: sw
--

CREATE SEQUENCE "rotationSchedule_app_rotation_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."rotationSchedule_app_rotation_id_seq" OWNER TO sw;

--
-- Name: rotationSchedule_app_rotation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sw
--

ALTER SEQUENCE "rotationSchedule_app_rotation_id_seq" OWNED BY "rotationSchedule_app_rotation".id;


--
-- Name: rotationSchedule_app_rotationlength; Type: TABLE; Schema: public; Owner: sw; Tablespace: 
--

CREATE TABLE "rotationSchedule_app_rotationlength" (
    id integer NOT NULL,
    "minLength" integer NOT NULL,
    "maxLength" integer NOT NULL,
    block_id integer NOT NULL,
    rotation_id integer NOT NULL,
    CONSTRAINT "rotationSchedule_app_rotationlength_maxLength_check" CHECK (("maxLength" >= 0)),
    CONSTRAINT "rotationSchedule_app_rotationlength_minLength_check" CHECK (("minLength" >= 0))
);


ALTER TABLE public."rotationSchedule_app_rotationlength" OWNER TO sw;

--
-- Name: rotationSchedule_app_rotationlength_id_seq; Type: SEQUENCE; Schema: public; Owner: sw
--

CREATE SEQUENCE "rotationSchedule_app_rotationlength_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."rotationSchedule_app_rotationlength_id_seq" OWNER TO sw;

--
-- Name: rotationSchedule_app_rotationlength_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sw
--

ALTER SEQUENCE "rotationSchedule_app_rotationlength_id_seq" OWNED BY "rotationSchedule_app_rotationlength".id;


--
-- Name: rotationSchedule_app_rotationset; Type: TABLE; Schema: public; Owner: sw; Tablespace: 
--

CREATE TABLE "rotationSchedule_app_rotationset" (
    id integer NOT NULL,
    "rotationSet_name" character varying(200) NOT NULL
);


ALTER TABLE public."rotationSchedule_app_rotationset" OWNER TO sw;

--
-- Name: rotationSchedule_app_rotationset_id_seq; Type: SEQUENCE; Schema: public; Owner: sw
--

CREATE SEQUENCE "rotationSchedule_app_rotationset_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."rotationSchedule_app_rotationset_id_seq" OWNER TO sw;

--
-- Name: rotationSchedule_app_rotationset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sw
--

ALTER SEQUENCE "rotationSchedule_app_rotationset_id_seq" OWNED BY "rotationSchedule_app_rotationset".id;


--
-- Name: rotationSchedule_app_rotationset_rotations; Type: TABLE; Schema: public; Owner: sw; Tablespace: 
--

CREATE TABLE "rotationSchedule_app_rotationset_rotations" (
    id integer NOT NULL,
    rotationset_id integer NOT NULL,
    rotation_id integer NOT NULL
);


ALTER TABLE public."rotationSchedule_app_rotationset_rotations" OWNER TO sw;

--
-- Name: rotationSchedule_app_rotationset_rotations_id_seq; Type: SEQUENCE; Schema: public; Owner: sw
--

CREATE SEQUENCE "rotationSchedule_app_rotationset_rotations_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."rotationSchedule_app_rotationset_rotations_id_seq" OWNER TO sw;

--
-- Name: rotationSchedule_app_rotationset_rotations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sw
--

ALTER SEQUENCE "rotationSchedule_app_rotationset_rotations_id_seq" OWNED BY "rotationSchedule_app_rotationset_rotations".id;


--
-- Name: rotationSchedule_app_schedule; Type: TABLE; Schema: public; Owner: sw; Tablespace: 
--

CREATE TABLE "rotationSchedule_app_schedule" (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    utility double precision NOT NULL
);


ALTER TABLE public."rotationSchedule_app_schedule" OWNER TO sw;

--
-- Name: rotationSchedule_app_schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: sw
--

CREATE SEQUENCE "rotationSchedule_app_schedule_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."rotationSchedule_app_schedule_id_seq" OWNER TO sw;

--
-- Name: rotationSchedule_app_schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sw
--

ALTER SEQUENCE "rotationSchedule_app_schedule_id_seq" OWNED BY "rotationSchedule_app_schedule".id;


--
-- Name: rotationSchedule_app_setedureq; Type: TABLE; Schema: public; Owner: sw; Tablespace: 
--

CREATE TABLE "rotationSchedule_app_setedureq" (
    id integer NOT NULL,
    "setEduReq_set_id" integer NOT NULL,
    "setEduReq_year_id" integer NOT NULL,
    "setEduReq_maxLength" integer NOT NULL,
    "setEduReq_minLength" integer NOT NULL,
    CONSTRAINT "rotationSchedule_app_setedureq_setEduReq_maxLength_check" CHECK (("setEduReq_maxLength" >= 0)),
    CONSTRAINT "rotationSchedule_app_setedureq_setEduReq_minLength_check" CHECK (("setEduReq_minLength" >= 0))
);


ALTER TABLE public."rotationSchedule_app_setedureq" OWNER TO sw;

--
-- Name: rotationSchedule_app_setedureq_id_seq; Type: SEQUENCE; Schema: public; Owner: sw
--

CREATE SEQUENCE "rotationSchedule_app_setedureq_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."rotationSchedule_app_setedureq_id_seq" OWNER TO sw;

--
-- Name: rotationSchedule_app_setedureq_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sw
--

ALTER SEQUENCE "rotationSchedule_app_setedureq_id_seq" OWNED BY "rotationSchedule_app_setedureq".id;


--
-- Name: rotationSchedule_app_settrackedureq; Type: TABLE; Schema: public; Owner: sw; Tablespace: 
--

CREATE TABLE "rotationSchedule_app_settrackedureq" (
    id integer NOT NULL,
    "setTrackEduReq_minLength" integer NOT NULL,
    "setTrackEduReq_maxLength" integer NOT NULL,
    "setTrackEduReq_set_id" integer NOT NULL,
    "setTrackEduReq_track_id" integer NOT NULL,
    CONSTRAINT "rotationSchedule_app_settrackedu_setTrackEduReq_maxLength_check" CHECK (("setTrackEduReq_maxLength" >= 0)),
    CONSTRAINT "rotationSchedule_app_settrackedu_setTrackEduReq_minLength_check" CHECK (("setTrackEduReq_minLength" >= 0))
);


ALTER TABLE public."rotationSchedule_app_settrackedureq" OWNER TO sw;

--
-- Name: rotationSchedule_app_settrackedureq_id_seq; Type: SEQUENCE; Schema: public; Owner: sw
--

CREATE SEQUENCE "rotationSchedule_app_settrackedureq_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."rotationSchedule_app_settrackedureq_id_seq" OWNER TO sw;

--
-- Name: rotationSchedule_app_settrackedureq_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sw
--

ALTER SEQUENCE "rotationSchedule_app_settrackedureq_id_seq" OWNED BY "rotationSchedule_app_settrackedureq".id;


--
-- Name: rotationSchedule_app_setyeardemand; Type: TABLE; Schema: public; Owner: sw; Tablespace: 
--

CREATE TABLE "rotationSchedule_app_setyeardemand" (
    id integer NOT NULL,
    "setYearDemand_minResidents" integer NOT NULL,
    "setYearDemand_maxResidents" integer NOT NULL,
    "setYearDemand_rotation_id" integer NOT NULL,
    "setYearDemand_yearSet_id" integer NOT NULL,
    CONSTRAINT "rotationSchedule_app_setyearde_setYearDemand_maxResidents_check" CHECK (("setYearDemand_maxResidents" >= 0)),
    CONSTRAINT "rotationSchedule_app_setyearde_setYearDemand_minResidents_check" CHECK (("setYearDemand_minResidents" >= 0))
);


ALTER TABLE public."rotationSchedule_app_setyeardemand" OWNER TO sw;

--
-- Name: rotationSchedule_app_setyeardemand_id_seq; Type: SEQUENCE; Schema: public; Owner: sw
--

CREATE SEQUENCE "rotationSchedule_app_setyeardemand_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."rotationSchedule_app_setyeardemand_id_seq" OWNER TO sw;

--
-- Name: rotationSchedule_app_setyeardemand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sw
--

ALTER SEQUENCE "rotationSchedule_app_setyeardemand_id_seq" OWNED BY "rotationSchedule_app_setyeardemand".id;


--
-- Name: rotationSchedule_app_template; Type: TABLE; Schema: public; Owner: sw; Tablespace: 
--

CREATE TABLE "rotationSchedule_app_template" (
    id integer NOT NULL,
    "templateName" character varying(200) NOT NULL
);


ALTER TABLE public."rotationSchedule_app_template" OWNER TO sw;

--
-- Name: rotationSchedule_app_template_id_seq; Type: SEQUENCE; Schema: public; Owner: sw
--

CREATE SEQUENCE "rotationSchedule_app_template_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."rotationSchedule_app_template_id_seq" OWNER TO sw;

--
-- Name: rotationSchedule_app_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sw
--

ALTER SEQUENCE "rotationSchedule_app_template_id_seq" OWNED BY "rotationSchedule_app_template".id;


--
-- Name: rotationSchedule_app_template_templateYears; Type: TABLE; Schema: public; Owner: sw; Tablespace: 
--

CREATE TABLE "rotationSchedule_app_template_templateYears" (
    id integer NOT NULL,
    template_id integer NOT NULL,
    year_id integer NOT NULL
);


ALTER TABLE public."rotationSchedule_app_template_templateYears" OWNER TO sw;

--
-- Name: rotationSchedule_app_template_templateYears_id_seq; Type: SEQUENCE; Schema: public; Owner: sw
--

CREATE SEQUENCE "rotationSchedule_app_template_templateYears_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."rotationSchedule_app_template_templateYears_id_seq" OWNER TO sw;

--
-- Name: rotationSchedule_app_template_templateYears_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sw
--

ALTER SEQUENCE "rotationSchedule_app_template_templateYears_id_seq" OWNED BY "rotationSchedule_app_template_templateYears".id;


--
-- Name: rotationSchedule_app_templateevent; Type: TABLE; Schema: public; Owner: sw; Tablespace: 
--

CREATE TABLE "rotationSchedule_app_templateevent" (
    id integer NOT NULL,
    "blockStartDate" date NOT NULL,
    "blockEndDate" date NOT NULL,
    block_id integer NOT NULL,
    template_id integer NOT NULL
);


ALTER TABLE public."rotationSchedule_app_templateevent" OWNER TO sw;

--
-- Name: rotationSchedule_app_templateevent_id_seq; Type: SEQUENCE; Schema: public; Owner: sw
--

CREATE SEQUENCE "rotationSchedule_app_templateevent_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."rotationSchedule_app_templateevent_id_seq" OWNER TO sw;

--
-- Name: rotationSchedule_app_templateevent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sw
--

ALTER SEQUENCE "rotationSchedule_app_templateevent_id_seq" OWNED BY "rotationSchedule_app_templateevent".id;


--
-- Name: rotationSchedule_app_track; Type: TABLE; Schema: public; Owner: sw; Tablespace: 
--

CREATE TABLE "rotationSchedule_app_track" (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE public."rotationSchedule_app_track" OWNER TO sw;

--
-- Name: rotationSchedule_app_track_excludedBlocks; Type: TABLE; Schema: public; Owner: sw; Tablespace: 
--

CREATE TABLE "rotationSchedule_app_track_excludedBlocks" (
    id integer NOT NULL,
    track_id integer NOT NULL,
    templateevent_id integer NOT NULL
);


ALTER TABLE public."rotationSchedule_app_track_excludedBlocks" OWNER TO sw;

--
-- Name: rotationSchedule_app_track_excludedBlocks_id_seq; Type: SEQUENCE; Schema: public; Owner: sw
--

CREATE SEQUENCE "rotationSchedule_app_track_excludedBlocks_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."rotationSchedule_app_track_excludedBlocks_id_seq" OWNER TO sw;

--
-- Name: rotationSchedule_app_track_excludedBlocks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sw
--

ALTER SEQUENCE "rotationSchedule_app_track_excludedBlocks_id_seq" OWNED BY "rotationSchedule_app_track_excludedBlocks".id;


--
-- Name: rotationSchedule_app_track_id_seq; Type: SEQUENCE; Schema: public; Owner: sw
--

CREATE SEQUENCE "rotationSchedule_app_track_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."rotationSchedule_app_track_id_seq" OWNER TO sw;

--
-- Name: rotationSchedule_app_track_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sw
--

ALTER SEQUENCE "rotationSchedule_app_track_id_seq" OWNED BY "rotationSchedule_app_track".id;


--
-- Name: rotationSchedule_app_trackeducationreq; Type: TABLE; Schema: public; Owner: sw; Tablespace: 
--

CREATE TABLE "rotationSchedule_app_trackeducationreq" (
    id integer NOT NULL,
    "trackEducationReq_minLength" integer NOT NULL,
    "trackEducationReq_maxLength" integer NOT NULL,
    "trackEducationReq_rotation_id" integer NOT NULL,
    "trackEducationReq_track_id" integer NOT NULL,
    CONSTRAINT "rotationSchedule_app_trackedu_trackEducationReq_maxLength_check" CHECK (("trackEducationReq_maxLength" >= 0)),
    CONSTRAINT "rotationSchedule_app_trackedu_trackEducationReq_minLength_check" CHECK (("trackEducationReq_minLength" >= 0))
);


ALTER TABLE public."rotationSchedule_app_trackeducationreq" OWNER TO sw;

--
-- Name: rotationSchedule_app_trackeducationreq_id_seq; Type: SEQUENCE; Schema: public; Owner: sw
--

CREATE SEQUENCE "rotationSchedule_app_trackeducationreq_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."rotationSchedule_app_trackeducationreq_id_seq" OWNER TO sw;

--
-- Name: rotationSchedule_app_trackeducationreq_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sw
--

ALTER SEQUENCE "rotationSchedule_app_trackeducationreq_id_seq" OWNED BY "rotationSchedule_app_trackeducationreq".id;


--
-- Name: rotationSchedule_app_year; Type: TABLE; Schema: public; Owner: sw; Tablespace: 
--

CREATE TABLE "rotationSchedule_app_year" (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    "yearNum" integer NOT NULL,
    CONSTRAINT "rotationSchedule_app_year_yearNum_check" CHECK (("yearNum" >= 0))
);


ALTER TABLE public."rotationSchedule_app_year" OWNER TO sw;

--
-- Name: rotationSchedule_app_year_id_seq; Type: SEQUENCE; Schema: public; Owner: sw
--

CREATE SEQUENCE "rotationSchedule_app_year_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."rotationSchedule_app_year_id_seq" OWNER TO sw;

--
-- Name: rotationSchedule_app_year_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sw
--

ALTER SEQUENCE "rotationSchedule_app_year_id_seq" OWNED BY "rotationSchedule_app_year".id;


--
-- Name: rotationSchedule_app_yeardemand; Type: TABLE; Schema: public; Owner: sw; Tablespace: 
--

CREATE TABLE "rotationSchedule_app_yeardemand" (
    id integer NOT NULL,
    "minResidents" integer NOT NULL,
    "maxResidents" integer NOT NULL,
    rotation_id integer NOT NULL,
    year_id integer NOT NULL,
    CONSTRAINT "rotationSchedule_app_yeardemand_maxResidents_check" CHECK (("maxResidents" >= 0)),
    CONSTRAINT "rotationSchedule_app_yeardemand_minResidents_check" CHECK (("minResidents" >= 0))
);


ALTER TABLE public."rotationSchedule_app_yeardemand" OWNER TO sw;

--
-- Name: rotationSchedule_app_yeardemand_id_seq; Type: SEQUENCE; Schema: public; Owner: sw
--

CREATE SEQUENCE "rotationSchedule_app_yeardemand_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."rotationSchedule_app_yeardemand_id_seq" OWNER TO sw;

--
-- Name: rotationSchedule_app_yeardemand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sw
--

ALTER SEQUENCE "rotationSchedule_app_yeardemand_id_seq" OWNED BY "rotationSchedule_app_yeardemand".id;


--
-- Name: rotationSchedule_app_yearset; Type: TABLE; Schema: public; Owner: sw; Tablespace: 
--

CREATE TABLE "rotationSchedule_app_yearset" (
    id integer NOT NULL,
    "yearSet_name" character varying(200) NOT NULL
);


ALTER TABLE public."rotationSchedule_app_yearset" OWNER TO sw;

--
-- Name: rotationSchedule_app_yearset_id_seq; Type: SEQUENCE; Schema: public; Owner: sw
--

CREATE SEQUENCE "rotationSchedule_app_yearset_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."rotationSchedule_app_yearset_id_seq" OWNER TO sw;

--
-- Name: rotationSchedule_app_yearset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sw
--

ALTER SEQUENCE "rotationSchedule_app_yearset_id_seq" OWNED BY "rotationSchedule_app_yearset".id;


--
-- Name: rotationSchedule_app_yearset_years; Type: TABLE; Schema: public; Owner: sw; Tablespace: 
--

CREATE TABLE "rotationSchedule_app_yearset_years" (
    id integer NOT NULL,
    yearset_id integer NOT NULL,
    year_id integer NOT NULL
);


ALTER TABLE public."rotationSchedule_app_yearset_years" OWNER TO sw;

--
-- Name: rotationSchedule_app_yearset_years_id_seq; Type: SEQUENCE; Schema: public; Owner: sw
--

CREATE SEQUENCE "rotationSchedule_app_yearset_years_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."rotationSchedule_app_yearset_years_id_seq" OWNER TO sw;

--
-- Name: rotationSchedule_app_yearset_years_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sw
--

ALTER SEQUENCE "rotationSchedule_app_yearset_years_id_seq" OWNED BY "rotationSchedule_app_yearset_years".id;


--
-- Name: weather; Type: TABLE; Schema: public; Owner: sw; Tablespace: 
--

CREATE TABLE weather (
    city character varying(80),
    high integer,
    low integer
);


ALTER TABLE public.weather OWNER TO sw;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sw
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sw
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sw
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sw
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sw
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sw
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sw
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sw
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sw
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_block" ALTER COLUMN id SET DEFAULT nextval('"rotationSchedule_app_block_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_educationreq" ALTER COLUMN id SET DEFAULT nextval('"rotationSchedule_app_educationreq_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_event" ALTER COLUMN id SET DEFAULT nextval('"rotationSchedule_app_event_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_program" ALTER COLUMN id SET DEFAULT nextval('"rotationSchedule_app_program_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_resident" ALTER COLUMN id SET DEFAULT nextval('"rotationSchedule_app_resident_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_resident_resExcludedBlocks" ALTER COLUMN id SET DEFAULT nextval('"rotationSchedule_app_resident_resExcludedBlocks_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_resident_tracks" ALTER COLUMN id SET DEFAULT nextval('"rotationSchedule_app_resident_tracks_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_rotation" ALTER COLUMN id SET DEFAULT nextval('"rotationSchedule_app_rotation_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_rotationlength" ALTER COLUMN id SET DEFAULT nextval('"rotationSchedule_app_rotationlength_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_rotationset" ALTER COLUMN id SET DEFAULT nextval('"rotationSchedule_app_rotationset_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_rotationset_rotations" ALTER COLUMN id SET DEFAULT nextval('"rotationSchedule_app_rotationset_rotations_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_schedule" ALTER COLUMN id SET DEFAULT nextval('"rotationSchedule_app_schedule_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_setedureq" ALTER COLUMN id SET DEFAULT nextval('"rotationSchedule_app_setedureq_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_settrackedureq" ALTER COLUMN id SET DEFAULT nextval('"rotationSchedule_app_settrackedureq_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_setyeardemand" ALTER COLUMN id SET DEFAULT nextval('"rotationSchedule_app_setyeardemand_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_template" ALTER COLUMN id SET DEFAULT nextval('"rotationSchedule_app_template_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_template_templateYears" ALTER COLUMN id SET DEFAULT nextval('"rotationSchedule_app_template_templateYears_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_templateevent" ALTER COLUMN id SET DEFAULT nextval('"rotationSchedule_app_templateevent_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_track" ALTER COLUMN id SET DEFAULT nextval('"rotationSchedule_app_track_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_track_excludedBlocks" ALTER COLUMN id SET DEFAULT nextval('"rotationSchedule_app_track_excludedBlocks_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_trackeducationreq" ALTER COLUMN id SET DEFAULT nextval('"rotationSchedule_app_trackeducationreq_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_year" ALTER COLUMN id SET DEFAULT nextval('"rotationSchedule_app_year_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_yeardemand" ALTER COLUMN id SET DEFAULT nextval('"rotationSchedule_app_yeardemand_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_yearset" ALTER COLUMN id SET DEFAULT nextval('"rotationSchedule_app_yearset_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_yearset_years" ALTER COLUMN id SET DEFAULT nextval('"rotationSchedule_app_yearset_years_id_seq"'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: sw
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sw
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: sw
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sw
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: sw
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add rotation	7	add_rotation
20	Can change rotation	7	change_rotation
21	Can delete rotation	7	delete_rotation
22	Can add year	8	add_year
23	Can change year	8	change_year
24	Can delete year	8	delete_year
25	Can add track	9	add_track
26	Can change track	9	change_track
27	Can delete track	9	delete_track
28	Can add program	10	add_program
29	Can change program	10	change_program
30	Can delete program	10	delete_program
31	Can add resident	11	add_resident
32	Can change resident	11	change_resident
33	Can delete resident	11	delete_resident
34	Can add block	12	add_block
35	Can change block	12	change_block
36	Can delete block	12	delete_block
37	Can add schedule	13	add_schedule
38	Can change schedule	13	change_schedule
39	Can delete schedule	13	delete_schedule
40	Can add event	14	add_event
41	Can change event	14	change_event
42	Can delete event	14	delete_event
43	Can add template	15	add_template
44	Can change template	15	change_template
45	Can delete template	15	delete_template
46	Can add template event	16	add_templateevent
47	Can change template event	16	change_templateevent
48	Can delete template event	16	delete_templateevent
49	Can add rotation set	26	add_rotationset
50	Can change rotation set	26	change_rotationset
51	Can delete rotation set	26	delete_rotationset
52	Can add set edu req	27	add_setedureq
53	Can change set edu req	27	change_setedureq
54	Can delete set edu req	27	delete_setedureq
55	Can add set track edu req	31	add_settrackedureq
56	Can change set track edu req	31	change_settrackedureq
57	Can delete set track edu req	31	delete_settrackedureq
58	Can add year set	40	add_yearset
59	Can change year set	40	change_yearset
60	Can delete year set	40	delete_yearset
61	Can add set year demand	41	add_setyeardemand
62	Can change set year demand	41	change_setyeardemand
63	Can delete set year demand	41	delete_setyeardemand
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sw
--

SELECT pg_catalog.setval('auth_permission_id_seq', 63, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: sw
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$12000$WcaT5kUPe1M1$17b4ihq+AjxSJt2tIw0x/ZST//cpg5sIcESs0a1Yjno=	2015-04-19 16:49:36.912084-04	t	jeanchoi3			jeanchoi3@gmail.com	t	t	2015-03-14 16:10:53.758931-04
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: sw
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sw
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sw
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: sw
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sw
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: sw
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2015-03-14 16:16:10.30635-04	1	Barnes Jewish Internal Medicine	1		10	1
2	2015-03-15 11:44:16.611498-04	1	ICU	1		7	1
3	2015-03-15 11:44:28.003786-04	2	Pulmonary	1		7	1
4	2015-03-15 11:45:30.215928-04	1	PGY1	1		8	1
5	2015-03-15 11:47:44.166538-04	2	PGY2	1		8	1
6	2015-03-15 11:47:52.518905-04	3	PGY3	1		8	1
7	2015-03-15 11:52:01.764946-04	1	Jean	1		11	1
8	2015-03-15 12:04:24.330216-04	3	Surgery	1		7	1
9	2015-03-15 12:04:30.016924-04	3	Surgery	2	Changed isElective.	7	1
10	2015-03-15 12:04:44.730096-04	1	Jean	2	Changed elective1.	11	1
11	2015-03-15 12:41:13.466522-04	1	Jean	2	Changed vacationStart2 and vacationEnd2.	11	1
12	2015-03-15 13:00:14.220837-04	1	Four-week	1		12	1
13	2015-03-15 13:00:22.27634-04	2	Three-week	1		12	1
14	2015-03-15 13:00:35.574126-04	1	Template 1	1		15	1
15	2015-03-15 13:00:41.638589-04	2	Template 2	1		15	1
16	2015-03-15 13:01:32.994061-04	1	Template 1	2	No fields changed.	15	1
17	2015-03-15 13:06:13.528213-04	1	TemplateEvent object	1		16	1
18	2015-03-15 13:06:47.142178-04	2	TemplateEvent object	1		16	1
19	2015-03-15 13:16:15.319777-04	2	Rishita	1		11	1
20	2015-03-15 13:16:22.201239-04	3	Karena	1		11	1
21	2015-03-15 13:16:31.262358-04	4	Yolanda	1		11	1
22	2015-03-15 13:16:38.30459-04	5	LiTing	1		11	1
23	2015-03-15 13:30:29.931636-04	4	Clinic	1		7	1
24	2015-03-15 13:37:02.713649-04	3	TemplateEvent object	1		16	1
25	2015-03-15 14:54:24.293182-04	3	TemplateEvent object	3		16	1
26	2015-03-15 14:54:24.297583-04	2	TemplateEvent object	3		16	1
27	2015-03-15 14:54:24.299125-04	1	TemplateEvent object	3		16	1
28	2015-03-15 14:54:43.582632-04	4	TemplateEvent object	1		16	1
29	2015-03-15 14:54:59.421962-04	5	TemplateEvent object	1		16	1
30	2015-03-15 14:55:13.814212-04	6	TemplateEvent object	1		16	1
31	2015-03-15 14:55:35.948425-04	7	TemplateEvent object	1		16	1
32	2015-03-15 14:55:47.792524-04	8	TemplateEvent object	1		16	1
33	2015-03-15 14:55:56.358978-04	9	TemplateEvent object	1		16	1
34	2015-03-15 15:07:14.651246-04	1	Surgery Track	1		9	1
35	2015-03-15 15:09:26.727298-04	1	Surgery Track	2	No fields changed.	9	1
36	2015-03-15 15:09:51.772782-04	1	ICU	2	No fields changed.	7	1
37	2015-03-15 15:11:01.133081-04	1	ICU	2	Changed trackEducationReq_minLength for track education req "TrackEducationReq object".	7	1
38	2015-03-15 15:21:39.349437-04	1	ICU	2	Changed minResidents for year demand "YearDemand object".	7	1
39	2015-03-15 15:22:42.828189-04	1	ICU	2	Deleted education req "EducationReq object".	7	1
40	2015-03-15 15:22:53.388736-04	1	ICU	2	Deleted year demand "YearDemand object".	7	1
41	2015-03-15 15:25:02.348576-04	1	ICU	3		7	1
42	2015-03-15 15:36:46.314988-04	3	Rotation1	2	Changed name.	7	1
43	2015-03-15 15:36:52.105599-04	2	Rotation2	2	Changed name.	7	1
44	2015-03-15 15:37:09.329766-04	5	LiTing	3		11	1
45	2015-03-15 15:37:42.159812-04	1	Barnes Jewish Internal Medicine	2	Changed endDate and windowSize.	10	1
46	2015-03-15 15:38:03.202817-04	1	Four-week	3		12	1
47	2015-03-15 15:38:15.638768-04	3	Two-week	1		12	1
48	2015-03-15 15:38:46.587339-04	10	TemplateEvent object	1		16	1
49	2015-03-15 15:39:01.832632-04	11	TemplateEvent object	1		16	1
50	2015-03-15 15:39:31.146328-04	12	TemplateEvent object	1		16	1
51	2015-03-15 15:40:07.939195-04	13	TemplateEvent object	1		16	1
52	2015-03-15 15:40:21.196594-04	14	TemplateEvent object	1		16	1
53	2015-03-15 15:40:32.368915-04	15	TemplateEvent object	1		16	1
54	2015-03-15 15:42:01.318017-04	3	Rotation1	2	Added year demand "YearDemand object".	7	1
55	2015-03-15 15:42:16.148668-04	3	Rotation1	2	Added year demand "YearDemand object".	7	1
56	2015-03-15 15:42:34.208164-04	3	Rotation1	2	Added year demand "YearDemand object".	7	1
57	2015-03-15 20:35:36.644715-04	3	ICU	2	Changed name.	7	1
58	2015-03-15 20:35:48.774138-04	3	Rotation1	2	Changed name.	7	1
59	2015-03-15 20:37:37.845465-04	1	Jean	2	No fields changed.	11	1
60	2015-03-15 20:40:40.235345-04	5	Vacation	1		7	1
61	2015-03-15 20:43:22.028258-04	3	Two-week	2	Changed includedRotation. Added rotation length "RotationLength object". Changed minLength and maxLength for rotation length "RotationLength object". Changed minLength and maxLength for rotation length "RotationLength object". Changed minLength and maxLength for rotation length "RotationLength object".	12	1
62	2015-03-15 20:43:59.195416-04	2	Three-week	2	Changed maxNumRotations and includedRotation. Added rotation length "RotationLength object". Added rotation length "RotationLength object". Changed minLength and maxLength for rotation length "RotationLength object". Changed minLength and maxLength for rotation length "RotationLength object".	12	1
63	2015-03-15 20:55:44.711422-04	1	Andrew	2	Changed name.	11	1
64	2015-03-15 20:56:37.943284-04	2	Ben	2	Changed name and year.	11	1
65	2015-03-15 20:57:21.207364-04	1	Andrew	2	Changed vacationStart1, vacationEnd1, vacationStart2 and vacationEnd2.	11	1
66	2015-03-15 20:58:06.839736-04	3	Two-week	2	Changed includedRotation. Changed minLength and maxLength for rotation length "RotationLength object". Changed minLength and maxLength for rotation length "RotationLength object". Changed minLength and maxLength for rotation length "RotationLength object". Changed minLength and maxLength for rotation length "RotationLength object".	12	1
67	2015-03-15 20:58:16.069524-04	2	Three-week	2	Changed includedRotation. Changed minLength and maxLength for rotation length "RotationLength object".	12	1
68	2015-03-15 21:00:24.705986-04	2	Ben	2	Changed vacationStart1, vacationEnd1, vacationStart2 and vacationEnd2.	11	1
69	2015-03-15 21:02:39.120075-04	3	Chris	2	Changed name, year, vacationStart1, vacationEnd1, vacationStart2 and vacationEnd2.	11	1
70	2015-03-15 21:03:08.248623-04	4	David	2	Changed name, year, vacationStart1, vacationEnd1, vacationStart2 and vacationEnd2.	11	1
71	2015-03-15 21:05:34.519196-04	6	Eve	1		11	1
72	2015-03-15 21:06:20.175357-04	7	Frank	1		11	1
73	2015-03-15 21:06:56.340478-04	8	Greg	1		11	1
74	2015-03-15 21:07:18.705667-04	9	Hanna	1		11	1
75	2015-03-15 21:07:38.09716-04	10	Ingrid	1		11	1
76	2015-03-15 21:07:58.077517-04	11	Jean	1		11	1
77	2015-03-15 21:08:16.274613-04	3	ICU	2	Changed name.	7	1
78	2015-03-15 21:08:22.353745-04	2	Pulmonary	2	Changed name.	7	1
79	2015-03-15 21:14:43.616061-04	1	Barnes Jewish Internal Medicine	2	Changed endDate.	10	1
80	2015-03-15 21:15:42.173535-04	16	TemplateEvent object	1		16	1
81	2015-03-15 21:15:50.578995-04	17	TemplateEvent object	1		16	1
82	2015-03-15 21:15:58.839257-04	18	TemplateEvent object	1		16	1
83	2015-03-15 21:16:07.926459-04	19	TemplateEvent object	1		16	1
84	2015-03-15 21:17:37.199608-04	19	TemplateEvent object	3		16	1
85	2015-03-15 21:17:37.204419-04	18	TemplateEvent object	3		16	1
86	2015-03-15 21:17:37.205965-04	17	TemplateEvent object	3		16	1
87	2015-03-15 21:17:37.207966-04	16	TemplateEvent object	3		16	1
88	2015-03-15 21:17:46.769696-04	1	Barnes Jewish Internal Medicine	2	Changed endDate.	10	1
89	2015-03-15 21:18:16.957927-04	8	Greg	2	Changed vacationStart2 and vacationEnd2.	11	1
90	2015-03-15 21:18:36.220367-04	9	Hanna	2	Changed vacationStart1, vacationEnd1, vacationStart2 and vacationEnd2.	11	1
91	2015-03-15 21:18:44.311615-04	10	Ingrid	2	Changed vacationStart1, vacationEnd1, vacationStart2 and vacationEnd2.	11	1
92	2015-03-15 21:18:55.615843-04	11	Jean	2	Changed vacationStart1, vacationEnd1, vacationStart2 and vacationEnd2.	11	1
93	2015-03-15 21:20:11.149617-04	11	Jean	3		11	1
94	2015-03-15 21:20:11.153479-04	10	Ingrid	3		11	1
95	2015-03-15 21:20:11.15543-04	9	Hanna	3		11	1
96	2015-03-15 21:22:56.327215-04	1	Andrew	2	Changed vacationStart2 and vacationEnd2.	11	1
97	2015-03-15 21:23:02.215364-04	2	Ben	2	Changed vacationStart2 and vacationEnd2.	11	1
98	2015-03-15 21:23:08.603525-04	3	Chris	2	Changed vacationStart2 and vacationEnd2.	11	1
99	2015-03-15 21:23:14.88334-04	4	David	2	Changed vacationStart2 and vacationEnd2.	11	1
100	2015-03-15 21:23:24.625712-04	6	Eve	2	Changed vacationStart2 and vacationEnd2.	11	1
101	2015-03-15 21:23:35.807212-04	7	Frank	2	Changed vacationStart2 and vacationEnd2.	11	1
102	2015-03-15 21:31:45.323958-04	5	Vacation	2	Changed minLength and maxLength for rotation length "RotationLength object". Changed minLength and maxLength for rotation length "RotationLength object".	7	1
103	2015-03-15 22:05:05.741652-04	5	Vacation	2	Deleted rotation length "RotationLength object". Deleted rotation length "RotationLength object".	7	1
104	2015-03-15 22:05:14.20617-04	5	Vacation	2	No fields changed.	7	1
105	2015-03-15 22:05:36.470526-04	4	Clinic	2	Deleted rotation length "RotationLength object".	7	1
106	2015-03-15 22:05:47.457547-04	4	Clinic	2	No fields changed.	7	1
107	2015-03-15 22:05:55.43148-04	3	ICU	2	Deleted rotation length "RotationLength object".	7	1
108	2015-03-15 22:05:57.228445-04	3	ICU	2	No fields changed.	7	1
109	2015-03-15 22:06:04.044869-04	2	Pulmonary	2	Deleted rotation length "RotationLength object".	7	1
110	2015-03-15 22:06:06.116776-04	2	Pulmonary	2	No fields changed.	7	1
111	2015-03-15 22:07:26.711375-04	2	Pulmonary	2	No fields changed.	7	1
112	2015-03-15 22:09:44.33209-04	4	Clinic	2	Changed minResidents and maxResidents.	7	1
113	2015-03-15 22:09:51.312772-04	3	ICU	2	Changed minResidents and maxResidents.	7	1
114	2015-03-15 22:09:57.523271-04	2	Pulmonary	2	Changed minResidents and maxResidents.	7	1
115	2015-03-15 22:15:27.858155-04	2	Pulmonary	2	Changed minLength and maxLength for rotation length "RotationLength object". Deleted year demand "YearDemand object". Deleted education req "EducationReq object".	7	1
116	2015-03-15 22:15:31.028521-04	2	Pulmonary	2	No fields changed.	7	1
117	2015-03-15 22:15:49.592478-04	3	ICU	2	Changed minLength and maxLength for rotation length "RotationLength object". Changed minResidents for year demand "YearDemand object". Changed minResidents for year demand "YearDemand object".	7	1
118	2015-03-15 22:15:52.244647-04	3	ICU	2	No fields changed.	7	1
119	2015-03-15 22:16:27.245512-04	4	Clinic	2	No fields changed.	7	1
120	2015-03-15 22:18:14.237905-04	5	Vacation	2	Added education req "EducationReq object". Added education req "EducationReq object". Added education req "EducationReq object".	7	1
121	2015-03-15 22:20:38.151242-04	5	Vacation	2	Deleted education req "EducationReq object". Deleted education req "EducationReq object". Deleted education req "EducationReq object".	7	1
122	2015-03-15 22:20:40.491301-04	5	Vacation	2	No fields changed.	7	1
123	2015-03-15 22:21:51.526828-04	4	Clinic	2	Changed minResidents.	7	1
124	2015-03-15 22:22:01.297433-04	3	ICU	2	No fields changed.	7	1
125	2015-03-15 22:37:18.821185-04	1	Andrew	2	Changed elective1.	11	1
126	2015-03-15 22:37:23.967659-04	2	Ben	2	No fields changed.	11	1
127	2015-03-15 22:37:30.558876-04	7	Frank	2	Changed elective1.	11	1
128	2015-03-15 22:39:36.110142-04	3	ICU	2	Changed minResidents.	7	1
129	2015-03-15 22:39:43.750074-04	2	Pulmonary	2	Changed minResidents.	7	1
130	2015-03-16 01:10:01.776718-04	3	ICU	2	Changed maxResidents.	7	1
131	2015-03-16 01:10:06.238892-04	2	Pulmonary	2	Changed maxResidents.	7	1
132	2015-03-16 01:10:10.944824-04	4	Clinic	2	Changed maxResidents.	7	1
133	2015-03-16 01:26:37.171659-04	4	Clinic	2	Changed maxResidents.	7	1
134	2015-03-16 01:26:51.312341-04	3	ICU	2	Changed maxResidents.	7	1
135	2015-03-16 01:26:57.222153-04	2	Pulmonary	2	Changed maxResidents.	7	1
136	2015-03-16 01:27:03.323721-04	5	Vacation	2	No fields changed.	7	1
137	2015-03-16 01:40:49.527459-04	12	Hanna	1		11	1
138	2015-03-16 01:41:14.413681-04	12	Hanna	2	Changed vacationStart2 and vacationEnd2.	11	1
139	2015-03-16 01:41:54.092876-04	12	Hanna	2	Changed vacationStart1, vacationStart2 and vacationEnd2.	11	1
140	2015-03-16 01:48:19.227068-04	5	Vacation	2	Added education req "EducationReq object". Added education req "EducationReq object". Added education req "EducationReq object".	7	1
141	2015-03-16 01:49:51.136712-04	5	Vacation	2	Deleted education req "EducationReq object". Deleted education req "EducationReq object". Deleted education req "EducationReq object".	7	1
142	2015-03-16 02:03:03.597878-04	13	Ingrid	1		11	1
143	2015-03-16 02:03:24.674191-04	14	Jean	1		11	1
144	2015-03-16 02:03:45.964442-04	14	Jean	3		11	1
145	2015-03-16 02:12:47.326126-04	4	Clinic	2	Changed maxResidents.	7	1
146	2015-03-16 02:12:51.79094-04	3	ICU	2	Changed maxResidents.	7	1
147	2015-03-16 02:12:58.720015-04	2	Pulmonary	2	Changed maxResidents.	7	1
148	2015-03-16 02:14:14.001754-04	4	Clinic	2	Changed maxResidents.	7	1
149	2015-03-16 02:14:45.642684-04	4	Clinic	2	Changed maxResidents.	7	1
150	2015-03-16 02:14:53.012535-04	4	Clinic	2	Changed minResidents and maxResidents.	7	1
151	2015-03-16 02:17:12.669221-04	4	Clinic	2	Changed maxLength for rotation length "RotationLength object".	7	1
152	2015-03-16 02:17:23.435342-04	4	Clinic	2	Changed minResidents.	7	1
153	2015-03-16 02:17:56.857791-04	4	Clinic	2	Changed minLength and maxLength for rotation length "RotationLength object".	7	1
154	2015-03-16 02:30:21.829994-04	3	ICU	2	Added education req "EducationReq object". Added education req "EducationReq object".	7	1
155	2015-03-16 02:31:20.291342-04	3	ICU	2	Added education req "EducationReq object". Changed maxLength for education req "EducationReq object".	7	1
234	2015-03-24 16:22:16.098751-04	31	SAR14	1		11	1
235	2015-03-24 16:22:21.416285-04	32	SAR15	1		11	1
156	2015-03-16 02:32:25.303124-04	4	Clinic	2	Added education req "EducationReq object". Added education req "EducationReq object". Added education req "EducationReq object".	7	1
157	2015-03-16 02:39:38.790326-04	1	Barnes Jewish Internal Medicine	2	Changed windowSize.	10	1
158	2015-03-16 02:41:11.732927-04	4	Clinic-block	1		12	1
159	2015-03-16 02:41:21.829347-04	4	Clinic-block	2	Changed includedRotation. Deleted rotation length "RotationLength object".	12	1
160	2015-03-16 02:41:27.431851-04	4	Clinic-block	2	Changed minLength and maxLength for rotation length "RotationLength object".	12	1
161	2015-03-16 02:41:31.654862-04	4	Clinic-block	2	Changed includedRotation. Deleted rotation length "RotationLength object".	12	1
162	2015-03-16 02:41:36.231159-04	4	Clinic-block	2	Changed minLength and maxLength for rotation length "RotationLength object".	12	1
163	2015-03-16 02:41:40.293657-04	4	Clinic-block	2	Changed includedRotation. Deleted rotation length "RotationLength object".	12	1
164	2015-03-16 02:41:44.701392-04	4	Clinic-block	2	Changed minLength and maxLength for rotation length "RotationLength object".	12	1
165	2015-03-16 02:42:01.353915-04	4	Clinic-block	2	Changed includedRotation. Changed rotation and maxLength for rotation length "RotationLength object".	12	1
166	2015-03-16 02:42:08.410216-04	4	Clinic-block	2	Changed maxLength for rotation length "RotationLength object".	12	1
167	2015-03-16 02:42:33.244001-04	4	Clinic-block	2	Changed includedRotation. Changed minLength and maxLength for rotation length "RotationLength object". Deleted rotation length "RotationLength object". Deleted rotation length "RotationLength object".	12	1
168	2015-03-16 02:42:36.795111-04	4	Clinic-block	2	Changed includedRotation. Deleted rotation length "RotationLength object".	12	1
169	2015-03-16 02:42:45.463996-04	4	Clinic-block	2	Changed maxLength for rotation length "RotationLength object". Changed minLength and maxLength for rotation length "RotationLength object".	12	1
170	2015-03-16 02:42:52.040471-04	4	Clinic-block	2	Changed includedRotation. Deleted rotation length "RotationLength object". Deleted rotation length "RotationLength object".	12	1
171	2015-03-16 02:43:01.506597-04	4	Clinic-block	2	Changed maxLength for rotation length "RotationLength object". Changed minLength and maxLength for rotation length "RotationLength object".	12	1
172	2015-03-16 02:43:07.482633-04	4	Clinic-block	2	Changed includedRotation. Deleted rotation length "RotationLength object". Deleted rotation length "RotationLength object".	12	1
173	2015-03-16 02:43:16.634689-04	4	Clinic-block	2	Changed maxLength for rotation length "RotationLength object". Changed minLength and maxLength for rotation length "RotationLength object".	12	1
174	2015-03-16 02:43:26.53411-04	2	Template 2	2	Changed templateYears.	15	1
175	2015-03-16 02:43:35.244753-04	3	Template 3	1		15	1
176	2015-03-16 02:44:10.160677-04	20	TemplateEvent object	1		16	1
177	2015-03-16 02:44:30.113983-04	21	TemplateEvent object	1		16	1
178	2015-03-16 02:44:42.34133-04	22	TemplateEvent object	1		16	1
179	2015-03-16 02:44:52.267831-04	23	TemplateEvent object	1		16	1
180	2015-03-16 02:45:21.153704-04	1	Barnes Jewish Internal Medicine	2	Changed minClinicWeeks.	10	1
181	2015-03-16 02:46:59.728084-04	5	Three-week non-clinic	1		12	1
182	2015-03-16 02:47:16.319673-04	5	Three-week non-clinic	2	Changed minLength and maxLength for rotation length "RotationLength object". Changed minLength and maxLength for rotation length "RotationLength object". Changed minLength and maxLength for rotation length "RotationLength object".	12	1
183	2015-03-16 02:47:27.25171-04	22	TemplateEvent object	2	Changed block.	16	1
184	2015-03-16 02:47:31.584497-04	20	TemplateEvent object	2	Changed block.	16	1
185	2015-03-16 02:48:25.737495-04	2	Template 2	2	No fields changed.	15	1
186	2015-03-16 02:48:52.05955-04	5	Three-week non-clinic	2	Changed includedRotation. Deleted rotation length "RotationLength object". Deleted rotation length "RotationLength object". Deleted rotation length "RotationLength object".	12	1
187	2015-03-16 02:49:01.278309-04	4	Clinic-block	2	Changed includedRotation.	12	1
188	2015-03-16 02:49:28.640505-04	4	Clinic-block	2	Changed minLength and maxLength for rotation length "RotationLength object".	12	1
189	2015-03-16 03:50:09.161971-04	1	Template 1	2	Changed templateYears.	15	1
190	2015-03-16 03:50:25.168923-04	1	Template 1	2	Changed templateYears.	15	1
191	2015-03-16 04:25:26.90376-04	2	Template 2	2	Changed templateYears.	15	1
192	2015-03-16 04:25:36.931831-04	3	Template 3	3		15	1
193	2015-03-21 23:23:14.746453-04	15	Jean	1		11	1
194	2015-03-21 23:23:23.298628-04	16	Katherine	1		11	1
195	2015-03-21 23:23:31.175297-04	17	Lauren	1		11	1
196	2015-03-21 23:24:38.820385-04	17	Lauren	3		11	1
197	2015-03-21 23:25:10.790038-04	16	Katherine	3		11	1
198	2015-03-21 23:25:29.963642-04	15	Jean	3		11	1
199	2015-03-21 23:26:35.67972-04	6	Emergency Medicine	1		7	1
200	2015-03-21 23:26:48.152877-04	7	Cardiology	1		7	1
201	2015-03-21 23:27:07.021493-04	8	Test1	1		7	1
202	2015-03-21 23:27:11.735478-04	9	Test2	1		7	1
203	2015-03-21 23:43:12.765033-04	9	Test2	3		7	1
204	2015-03-21 23:43:12.773744-04	8	Test1	3		7	1
205	2015-03-21 23:43:39.861249-04	7	Cardiology	3		7	1
206	2015-03-21 23:43:39.865242-04	6	Emergency Medicine	3		7	1
207	2015-03-23 15:12:40.06623-04	1	PGY1	2	No fields changed.	8	1
208	2015-03-23 15:12:44.943239-04	2	PGY2	2	Changed yearNum.	8	1
209	2015-03-23 15:12:49.526132-04	3	PGY3	2	Changed yearNum.	8	1
210	2015-03-24 02:04:57.735892-04	1	Andrew	2	Changed couple.	11	1
211	2015-03-24 02:05:03.80523-04	13	Ingrid	2	Changed couple.	11	1
212	2015-03-24 16:12:08.870809-04	13	Ingrid	3		11	1
213	2015-03-24 16:12:08.874275-04	12	Hanna	3		11	1
214	2015-03-24 16:12:08.876471-04	8	Greg	3		11	1
215	2015-03-24 16:12:08.878625-04	7	Frank	3		11	1
216	2015-03-24 16:12:08.880572-04	6	Eve	3		11	1
217	2015-03-24 16:12:08.882206-04	4	David	3		11	1
218	2015-03-24 16:12:08.883636-04	3	Chris	3		11	1
219	2015-03-24 16:12:08.884851-04	2	Ben	3		11	1
220	2015-03-24 16:12:08.886-04	1	Andrew	3		11	1
221	2015-03-24 16:19:55.467274-04	18	SAR1	1		11	1
222	2015-03-24 16:20:10.017899-04	19	SAR2	1		11	1
223	2015-03-24 16:20:16.182488-04	20	SAR3	1		11	1
224	2015-03-24 16:20:23.396877-04	21	SAR4	1		11	1
225	2015-03-24 16:20:28.38412-04	22	SAR5	1		11	1
226	2015-03-24 16:20:34.120922-04	23	SAR6	1		11	1
227	2015-03-24 16:20:39.598438-04	24	SAR7	1		11	1
228	2015-03-24 16:20:46.62225-04	25	SAR8	1		11	1
229	2015-03-24 16:20:53.330294-04	26	SAR9	1		11	1
230	2015-03-24 16:21:00.216089-04	27	SAR10	1		11	1
231	2015-03-24 16:21:10.468507-04	28	SAR11	1		11	1
232	2015-03-24 16:21:16.434687-04	29	SAR12	1		11	1
233	2015-03-24 16:21:22.298024-04	30	SAR13	1		11	1
236	2015-03-24 16:22:26.653644-04	33	SAR16	1		11	1
237	2015-03-24 16:22:35.826093-04	34	SAR17	1		11	1
238	2015-03-24 16:22:41.567947-04	35	SAR18	1		11	1
239	2015-03-24 16:22:47.352215-04	36	SAR19	1		11	1
240	2015-03-24 16:22:55.838308-04	37	SAR20	1		11	1
241	2015-03-24 16:23:01.172932-04	38	SAR21	1		11	1
242	2015-03-24 16:23:06.541431-04	39	SAR22	1		11	1
243	2015-03-24 16:23:14.163291-04	40	SAR23	1		11	1
244	2015-03-24 16:23:19.242612-04	41	SAR24	1		11	1
245	2015-03-24 16:23:24.417468-04	42	SAR25	1		11	1
246	2015-03-24 16:23:30.602268-04	43	SAR26	1		11	1
247	2015-03-24 16:23:39.192109-04	44	SAR27	1		11	1
248	2015-03-24 16:23:44.499568-04	45	SAR28	1		11	1
249	2015-03-24 16:23:50.330763-04	46	SAR29	1		11	1
250	2015-03-24 16:37:09.852243-04	47	SAR30	1		11	1
251	2015-03-24 16:37:15.797377-04	48	SAR31	1		11	1
252	2015-03-24 16:37:23.894416-04	49	SAR32	1		11	1
253	2015-03-24 16:37:31.662026-04	50	SAR33	1		11	1
254	2015-03-24 16:37:36.761298-04	51	SAR34	1		11	1
255	2015-03-24 16:37:41.809048-04	52	SAR35	1		11	1
256	2015-03-24 16:37:47.100691-04	53	SAR36	1		11	1
257	2015-03-24 16:37:54.527209-04	54	SAR37	1		11	1
258	2015-03-24 16:38:00.522648-04	55	SAR38	1		11	1
259	2015-03-24 16:38:05.824559-04	56	SAR39	1		11	1
260	2015-03-24 16:38:14.948244-04	57	SAR40	1		11	1
261	2015-03-24 16:38:20.536602-04	58	SAR41	1		11	1
262	2015-03-24 16:39:19.19758-04	59	SAR42	1		11	1
263	2015-03-24 16:39:25.567943-04	60	SAR43	1		11	1
264	2015-03-24 16:39:30.407393-04	61	SAR44	1		11	1
265	2015-03-24 16:39:35.821512-04	62	SAR45	1		11	1
266	2015-03-24 16:39:40.598156-04	63	SAR46	1		11	1
267	2015-03-24 16:39:45.83118-04	64	SAR47	1		11	1
268	2015-03-24 16:39:53.975189-04	65	SAR48	1		11	1
269	2015-03-24 16:40:00.618324-04	66	SAR49	1		11	1
270	2015-03-24 16:40:07.456027-04	67	SAR50	1		11	1
271	2015-03-24 16:41:22.968966-04	3	ICU	3		7	1
272	2015-03-24 16:41:22.973215-04	2	Pulmonary	3		7	1
273	2015-03-24 16:42:32.475757-04	5	Three-week non-clinic	3		12	1
274	2015-03-24 16:42:32.478258-04	4	Clinic-block	3		12	1
275	2015-03-24 16:42:32.481611-04	3	Two-week	3		12	1
276	2015-03-24 16:42:32.483488-04	2	Three-week	3		12	1
277	2015-03-24 16:42:55.8739-04	6	Four-week	1		12	1
278	2015-03-24 16:43:05.167258-04	7	Three-week	1		12	1
279	2015-03-24 16:43:38.715677-04	6	Four-week	2	Changed minLength and maxLength for rotation length "RotationLength object".	12	1
280	2015-03-24 16:43:45.192419-04	7	Three-week	2	Changed minLength and maxLength for rotation length "RotationLength object".	12	1
281	2015-03-24 16:44:45.069391-04	6	Four-week	2	Changed includedRotation. Changed minLength and maxLength for rotation length "RotationLength object". Deleted rotation length "RotationLength object".	12	1
282	2015-03-24 16:44:54.257298-04	7	Three-week	2	Changed includedRotation. Changed minLength and maxLength for rotation length "RotationLength object". Deleted rotation length "RotationLength object".	12	1
283	2015-03-24 16:47:46.761662-04	10	MICU-N	1		7	1
284	2015-03-24 16:51:26.461007-04	11	MICU-S	1		7	1
285	2015-03-24 16:51:50.705683-04	12	CCU	1		7	1
286	2015-03-24 16:52:31.844423-04	13	Med 1	1		7	1
287	2015-03-24 16:52:51.83204-04	14	Med 2	1		7	1
288	2015-03-24 16:58:07.767655-04	15	Cardiology	1		7	1
289	2015-03-24 16:59:01.587-04	16	Med 2 Night Float	1		7	1
290	2015-03-24 17:00:41.223972-04	17	Cardiology Night Float	1		7	1
291	2015-03-24 17:00:47.787451-04	16	Med 2 Night Float	2	Changed minLength and maxLength for rotation length "RotationLength object".	7	1
292	2015-03-24 17:01:10.314785-04	18	Fourth Night Float	1		7	1
293	2015-03-24 17:02:00.63022-04	19	Procedure	1		7	1
294	2015-03-24 17:02:33.567764-04	20	Med Consult	1		7	1
295	2015-03-24 17:20:30.194219-04	21	Neuro	1		7	1
296	2015-03-24 17:21:13.660455-04	22	Elective	1		7	1
297	2015-03-24 17:22:27.896048-04	23	Geri	1		7	1
298	2015-03-24 17:22:42.891027-04	5	Vacation	2	Deleted rotation length "RotationLength object". Deleted rotation length "RotationLength object".	7	1
299	2015-03-24 17:23:03.561802-04	4	Clinic	2	Changed minResidents and maxResidents. Changed minLength and maxLength for rotation length "RotationLength object". Changed minLength and maxLength for rotation length "RotationLength object".	7	1
300	2015-03-24 17:23:47.91974-04	4	Clinic	2	Changed maxResidents.	7	1
301	2015-03-24 17:23:59.547659-04	23	Geri	2	Changed maxResidents.	7	1
302	2015-03-24 17:25:05.071404-04	4	Clinic	2	Changed maxResidents.	7	1
303	2015-03-24 17:25:55.944636-04	24	Inpt	1		7	1
304	2015-03-24 17:27:26.050516-04	1	Barnes Jewish Internal Medicine	2	Changed startDate and endDate.	10	1
305	2015-03-24 17:28:56.582492-04	19	SAR2	2	Changed vacationStart1, vacationEnd1, vacationStart2 and vacationEnd2.	11	1
306	2015-03-24 17:29:53.794799-04	18	SAR1	2	Changed vacationStart1, vacationEnd1, vacationStart2 and vacationEnd2.	11	1
307	2015-03-24 17:30:58.896622-04	20	SAR3	2	Changed vacationStart1, vacationEnd1, vacationStart2 and vacationEnd2.	11	1
308	2015-03-24 17:31:57.183921-04	21	SAR4	2	Changed vacationStart1, vacationEnd1, vacationStart2 and vacationEnd2.	11	1
309	2015-03-24 17:32:37.690248-04	22	SAR5	2	Changed vacationStart1, vacationEnd1, vacationStart2 and vacationEnd2.	11	1
310	2015-03-24 17:33:50.493693-04	23	SAR6	2	Changed vacationStart1, vacationEnd1, vacationStart2 and vacationEnd2.	11	1
311	2015-03-24 20:14:26.739442-04	24	TemplateEvent object	1		16	1
312	2015-03-24 20:14:42.565291-04	25	TemplateEvent object	1		16	1
313	2015-03-24 20:15:11.845112-04	24	TemplateEvent object	2	Changed blockEndDate.	16	1
314	2015-03-24 20:15:53.583297-04	25	TemplateEvent object	2	Changed blockStartDate and blockEndDate.	16	1
315	2015-03-24 20:16:19.830033-04	26	TemplateEvent object	1		16	1
316	2015-03-24 20:16:39.659816-04	27	TemplateEvent object	1		16	1
317	2015-03-24 20:17:03.585784-04	28	TemplateEvent object	1		16	1
318	2015-03-24 20:17:34.762296-04	29	TemplateEvent object	1		16	1
319	2015-03-24 20:17:56.878572-04	30	TemplateEvent object	1		16	1
320	2015-03-24 20:18:25.568313-04	31	TemplateEvent object	1		16	1
321	2015-03-24 20:18:45.691079-04	32	TemplateEvent object	1		16	1
322	2015-03-24 20:19:15.266405-04	33	TemplateEvent object	1		16	1
323	2015-03-24 20:19:37.387681-04	34	TemplateEvent object	1		16	1
324	2015-03-24 20:20:09.97645-04	35	TemplateEvent object	1		16	1
325	2015-03-24 20:20:29.543221-04	36	TemplateEvent object	1		16	1
326	2015-03-25 16:49:54.653203-04	28	TemplateEvent object	2	No fields changed.	16	1
327	2015-03-25 16:50:10.394169-04	36	TemplateEvent object	3		16	1
328	2015-03-25 16:50:10.398729-04	35	TemplateEvent object	3		16	1
329	2015-03-25 16:50:10.400607-04	34	TemplateEvent object	3		16	1
330	2015-03-25 16:50:10.402197-04	33	TemplateEvent object	3		16	1
331	2015-03-25 16:50:10.404508-04	32	TemplateEvent object	3		16	1
332	2015-03-25 16:50:10.406427-04	31	TemplateEvent object	3		16	1
333	2015-03-25 16:50:10.40848-04	30	TemplateEvent object	3		16	1
334	2015-03-25 16:50:10.409864-04	29	TemplateEvent object	3		16	1
335	2015-03-25 16:50:10.410987-04	28	TemplateEvent object	3		16	1
336	2015-03-25 16:50:44.251911-04	1	Barnes Jewish Internal Medicine	2	Changed endDate.	10	1
337	2015-03-25 16:51:35.609355-04	18	SAR1	2	Changed vacationStart1, vacationEnd1, vacationStart2 and vacationEnd2.	11	1
338	2015-03-25 16:51:45.135333-04	19	SAR2	2	Changed vacationStart2 and vacationEnd2.	11	1
339	2015-03-25 16:51:53.766391-04	20	SAR3	2	Changed vacationStart2 and vacationEnd2.	11	1
340	2015-03-25 16:52:01.576649-04	21	SAR4	2	Changed vacationStart2 and vacationEnd2.	11	1
341	2015-03-25 16:52:09.210369-04	22	SAR5	2	Changed vacationStart2 and vacationEnd2.	11	1
342	2015-03-25 16:52:19.4374-04	23	SAR6	2	Changed vacationStart2 and vacationEnd2.	11	1
343	2015-03-25 16:56:18.321406-04	1	Barnes Jewish Internal Medicine	2	No fields changed.	10	1
344	2015-03-27 00:05:14.254681-04	1	Barnes Jewish Internal Medicine	2	Changed windowSize.	10	1
345	2015-03-27 00:08:54.13185-04	1	Barnes Jewish Internal Medicine	2	Changed minClinicWeeks and windowSize.	10	1
346	2015-03-27 00:44:38.33592-04	1	Barnes Jewish Internal Medicine	2	Changed endDate.	10	1
347	2015-03-27 00:45:22.729605-04	27	TemplateEvent object	2	No fields changed.	16	1
348	2015-03-27 00:45:45.728668-04	37	TemplateEvent object	1		16	1
349	2015-03-27 00:46:02.926923-04	38	TemplateEvent object	1		16	1
350	2015-03-27 00:46:25.916059-04	39	TemplateEvent object	1		16	1
351	2015-03-27 00:46:48.024662-04	40	TemplateEvent object	1		16	1
352	2015-03-27 00:47:08.475839-04	41	TemplateEvent object	1		16	1
353	2015-03-27 00:47:41.013207-04	42	TemplateEvent object	1		16	1
354	2015-03-27 00:48:12.359996-04	43	TemplateEvent object	1		16	1
355	2015-03-27 00:48:29.31025-04	44	TemplateEvent object	1		16	1
356	2015-03-27 00:48:58.270626-04	45	TemplateEvent object	1		16	1
357	2015-03-27 00:49:17.226075-04	46	TemplateEvent object	1		16	1
358	2015-03-27 00:49:56.738023-04	18	SAR1	2	Changed vacationStart1 and vacationEnd1.	11	1
359	2015-03-27 00:50:27.569661-04	19	SAR2	2	Changed vacationStart2 and vacationEnd2.	11	1
360	2015-03-27 00:50:57.906508-04	18	SAR1	2	Changed vacationStart2 and vacationEnd2.	11	1
361	2015-03-27 00:51:27.271596-04	21	SAR4	2	Changed vacationStart2 and vacationEnd2.	11	1
362	2015-03-27 00:51:52.75374-04	22	SAR5	2	Changed vacationStart2 and vacationEnd2.	11	1
363	2015-03-27 00:52:12.417378-04	23	SAR6	2	Changed vacationStart2 and vacationEnd2.	11	1
364	2015-03-27 00:52:51.581636-04	20	SAR3	2	Changed vacationStart2 and vacationEnd2.	11	1
365	2015-03-27 00:53:01.195636-04	23	SAR6	2	No fields changed.	11	1
366	2015-03-27 04:45:55.315649-04	25	Hematology	1		7	1
367	2015-03-27 04:46:02.960392-04	26	Nephrology	1		7	1
368	2015-03-27 04:46:24.331047-04	27	Rheumatology	1		7	1
369	2015-03-27 04:46:38.331394-04	28	Infectious Disease	1		7	1
370	2015-03-27 04:47:27.381975-04	21	Neuro	2	Changed isElective.	7	1
371	2015-03-27 04:47:32.956066-04	15	Cardiology	2	Changed isElective.	7	1
372	2015-03-27 04:47:41.590298-04	23	Geri	2	Changed isElective.	7	1
373	2015-03-27 05:00:18.533917-04	1	Template_1	2	Changed templateName.	15	1
374	2015-03-27 05:00:26.056191-04	2	Template_2	2	Changed templateName.	15	1
375	2015-03-27 05:03:11.525959-04	48	TemplateEvent object	3		16	1
376	2015-03-27 05:03:33.928155-04	47	TemplateEvent object	3		16	1
377	2015-03-27 05:14:25.248159-04	1	Template 1	2	Changed templateName.	15	1
378	2015-03-27 05:14:30.40861-04	2	Template 2	2	Changed templateName.	15	1
379	2015-03-27 05:14:53.441013-04	1	Template_1	2	Changed templateName.	15	1
380	2015-03-27 05:14:57.89684-04	2	Template_2	2	Changed templateName.	15	1
381	2015-04-03 17:17:59.62265-04	28	Infectious Disease	2	Added rotation length "RotationLength object".	7	1
382	2015-04-03 17:19:08.406661-04	26	Nephrology	2	Added rotation length "RotationLength object".	7	1
383	2015-04-03 17:21:43.361078-04	1	RotationSet object	1		26	1
384	2015-04-03 17:34:08.793952-04	1	RotationSet object	3		26	1
385	2015-04-03 17:41:48.405181-04	2	RotationSet object	1		26	1
386	2015-04-03 17:43:25.394618-04	2	RotationSet object	2	No fields changed.	26	1
387	2015-04-03 17:44:12.057544-04	2	RotationSet object	2	Added set edu req "setEduReq object".	26	1
388	2015-04-03 17:53:06.047168-04	1	PGY1	2	Changed rotationDemand. Changed setEduReq_minLength for set edu req "setEduReq object".	8	1
389	2015-04-03 17:57:05.378466-04	2	RotationSet object	3		26	1
390	2015-04-03 17:58:44.199464-04	3	RotationSet object	1		26	1
391	2015-04-03 18:01:09.7648-04	3	RotationSet object	2	Changed setTrackEduReq_minLength for set track edu req "setTrackEduReq object".	26	1
392	2015-04-03 18:05:15.303719-04	1	Surgery Track	2	Changed trackRequiredRotations.	9	1
393	2015-04-03 18:06:15.56094-04	67	SAR50	2	No fields changed.	11	1
394	2015-04-03 18:16:48.261183-04	1	YearSet object	1		40	1
395	2015-04-03 18:16:54.748801-04	1	YearSet object	3		40	1
396	2015-04-03 18:22:06.133629-04	2	YearSet object	1		40	1
397	2015-04-03 18:24:00.328338-04	67	SAR50	2	Changed resExcludedBlocks.	11	1
398	2015-04-03 18:24:03.238466-04	67	SAR50	2	No fields changed.	11	1
399	2015-04-03 18:24:44.701028-04	1	Surgery Track	2	Changed excludedBlocks.	9	1
400	2015-04-03 21:54:19.693567-04	51	2015-03-29 to 2015-04-25, Template_2	3		16	1
401	2015-04-03 21:54:19.699669-04	50	2015-03-02 to 2015-03-29, Template_2	3		16	1
402	2015-04-03 21:54:19.701345-04	49	2015-03-01 to 2015-03-28, Template_2	3		16	1
403	2015-04-03 23:51:50.988338-04	67	SAR50	2	Changed couple.	11	1
404	2015-04-03 23:52:26.636909-04	67	SAR50	2	No fields changed.	11	1
405	2015-04-04 01:26:08.632805-04	67	SAR50	2	Changed resExcludedBlocks.	11	1
406	2015-04-04 01:26:58.205067-04	67	SAR50	2	Changed tracks.	11	1
407	2015-04-04 01:27:08.821227-04	1	Surgery Track	2	No fields changed.	9	1
408	2015-04-04 01:28:07.940192-04	1	Surgery Track	2	Changed excludedBlocks.	9	1
409	2015-04-04 01:28:19.970064-04	67	SAR50	2	No fields changed.	11	1
410	2015-04-04 20:58:25.459125-04	52	2015-06-21 to 2015-07-18, Template_2	1		16	1
411	2015-04-04 20:59:10.578511-04	66	SAR49	2	Changed year.	11	1
412	2015-04-04 20:59:16.643916-04	65	SAR48	2	Changed year.	11	1
413	2015-04-04 21:00:48.410012-04	53	2015-07-19 to 2015-08-15, Template_2	1		16	1
414	2015-04-04 21:25:56.522891-04	54	2015-08-16 to 2015-09-12, Template_2	1		16	1
415	2015-04-04 21:26:15.618549-04	55	2015-09-13 to 2015-10-10, Template_2	1		16	1
416	2015-04-04 21:26:33.091309-04	56	2015-10-11 to 2015-11-07, Template_2	1		16	1
417	2015-04-04 21:26:52.099725-04	57	2015-11-08 to 2015-12-05, Template_2	1		16	1
418	2015-04-04 21:27:10.787724-04	58	2015-12-06 to 2015-12-26, Template_2	1		16	1
419	2015-04-04 21:27:28.752482-04	59	2015-12-27 to 2016-01-16, Template_2	1		16	1
420	2015-04-04 21:27:48.638645-04	60	2016-01-17 to 2016-02-13, Template_2	1		16	1
421	2015-04-04 21:28:05.662705-04	61	2016-02-14 to 2016-03-12, Template_2	1		16	1
422	2015-04-04 21:28:21.258604-04	62	2016-03-13 to 2016-04-09, Template_2	1		16	1
423	2015-04-04 21:28:39.632492-04	63	2016-04-10 to 2016-05-07, Template_2	1		16	1
424	2015-04-04 21:29:01.470553-04	64	2016-05-08 to 2016-06-04, Template_2	1		16	1
425	2015-04-04 21:29:26.710507-04	65	2016-06-05 to 2016-06-25, Template_2	1		16	1
426	2015-04-04 21:34:21.453526-04	28	Infectious Disease	2	Changed minResidents for year demand "YearDemand object".	7	1
427	2015-04-04 21:35:39.227289-04	2	YearSet object	2	No fields changed.	40	1
428	2015-04-04 21:43:52.908408-04	2	YearSet object	2	No fields changed.	40	1
429	2015-04-04 21:46:21.695149-04	2	YearSet object	2	Added set year demand "SetYearDemand object".	40	1
430	2015-04-05 00:18:29.011361-04	1	PGY1	2	Changed minLength for education req "EducationReq object".	8	1
431	2015-04-05 00:20:11.453306-04	1	Surgery Track	2	Changed trackEducationReq_minLength for track education req "TrackEducationReq object".	9	1
432	2015-04-05 00:20:56.602849-04	1	Surgery Track	2	Changed trackRequiredRotations.	9	1
433	2015-04-05 00:21:42.956833-04	3	RotationSet object	2	Changed setEduReq_minLength for set edu req "setEduReq object".	26	1
434	2015-04-05 00:54:26.549713-04	28	Infectious Disease	2	Changed trackEducationReq_minLength for track education req "TrackEducationReq object".	7	1
435	2015-04-05 01:11:48.299236-04	44	SAR27	3		11	1
436	2015-04-05 01:11:48.302149-04	43	SAR26	3		11	1
437	2015-04-05 01:11:48.303952-04	42	SAR25	3		11	1
438	2015-04-05 01:11:48.305332-04	41	SAR24	3		11	1
439	2015-04-05 01:11:48.306671-04	40	SAR23	3		11	1
440	2015-04-05 01:11:48.30806-04	39	SAR22	3		11	1
441	2015-04-05 01:11:48.309394-04	38	SAR21	3		11	1
442	2015-04-05 01:11:48.310685-04	37	SAR20	3		11	1
443	2015-04-05 01:11:48.311971-04	36	SAR19	3		11	1
444	2015-04-05 01:11:48.313197-04	35	SAR18	3		11	1
445	2015-04-05 01:11:48.314424-04	34	SAR17	3		11	1
446	2015-04-05 01:11:48.315681-04	33	SAR16	3		11	1
447	2015-04-05 01:11:48.316936-04	32	SAR15	3		11	1
448	2015-04-05 01:11:48.318175-04	31	SAR14	3		11	1
449	2015-04-05 01:11:48.319422-04	30	SAR13	3		11	1
450	2015-04-05 01:11:48.320728-04	29	SAR12	3		11	1
451	2015-04-05 01:11:48.322364-04	28	SAR11	3		11	1
452	2015-04-05 01:11:48.323673-04	27	SAR10	3		11	1
453	2015-04-05 01:11:48.324946-04	26	SAR9	3		11	1
454	2015-04-05 01:11:48.326243-04	25	SAR8	3		11	1
455	2015-04-05 01:11:48.32751-04	24	SAR7	3		11	1
456	2015-04-05 01:11:48.328726-04	23	SAR6	3		11	1
457	2015-04-05 01:21:52.55809-04	28	Infectious Disease	2	Added rotation length "RotationLength object".	7	1
458	2015-04-05 01:22:15.190061-04	25	Hematology	2	Added rotation length "RotationLength object". Added rotation length "RotationLength object".	7	1
459	2015-04-05 01:22:28.076077-04	4	Clinic	2	Changed minResidents.	7	1
460	2015-04-05 01:23:03.143167-04	3	RotationSet object	2	Changed setEduReq_minLength for set edu req "setEduReq object". Changed setTrackEduReq_minLength for set track edu req "setTrackEduReq object".	26	1
461	2015-04-05 01:23:32.18324-04	2	YearSet object	2	Changed setYearDemand_minResidents for set year demand "SetYearDemand object". Changed setYearDemand_minResidents for set year demand "SetYearDemand object".	40	1
462	2015-04-05 01:24:48.467698-04	4	Clinic	2	No fields changed.	7	1
463	2015-04-05 01:24:56.779255-04	5	Vacation	2	No fields changed.	7	1
464	2015-04-05 01:25:04.966286-04	10	MICU-N	2	No fields changed.	7	1
465	2015-04-05 01:25:17.276955-04	11	MICU-S	2	No fields changed.	7	1
466	2015-04-05 01:25:30.970914-04	12	CCU	2	No fields changed.	7	1
467	2015-04-05 01:25:41.220472-04	13	Med 1	2	Changed minResidents and maxResidents.	7	1
468	2015-04-05 01:25:49.214053-04	14	Med 2	2	Changed minResidents and maxResidents.	7	1
469	2015-04-05 01:25:59.237395-04	15	Cardiology	2	Changed minResidents and maxResidents.	7	1
470	2015-04-05 01:26:07.458168-04	16	Med 2 Night Float	2	No fields changed.	7	1
471	2015-04-05 01:27:52.292-04	3	RotationSet object	3		26	1
472	2015-04-05 01:28:05.454808-04	2	YearSet object	3		40	1
473	2015-04-05 01:28:17.787899-04	1	Surgery Track	3		9	1
474	2015-04-05 01:28:39.098443-04	67	SAR50	2	Changed resExcludedBlocks.	11	1
475	2015-04-05 01:28:42.837526-04	66	SAR49	2	No fields changed.	11	1
476	2015-04-05 01:28:46.698911-04	65	SAR48	2	No fields changed.	11	1
477	2015-04-05 01:31:57.018021-04	1	PGY1	2	Changed requiredRotations. Changed maxLength for education req "EducationReq object".	8	1
478	2015-04-05 02:25:17.311093-04	64	SAR47	3		11	1
479	2015-04-05 02:25:17.319183-04	63	SAR46	3		11	1
480	2015-04-05 02:25:17.326808-04	62	SAR45	3		11	1
481	2015-04-05 02:25:17.334373-04	61	SAR44	3		11	1
482	2015-04-05 02:25:17.336027-04	60	SAR43	3		11	1
483	2015-04-05 02:25:17.337262-04	59	SAR42	3		11	1
484	2015-04-05 02:25:17.338442-04	58	SAR41	3		11	1
485	2015-04-05 02:25:17.339525-04	57	SAR40	3		11	1
486	2015-04-05 02:25:17.340588-04	56	SAR39	3		11	1
487	2015-04-05 02:25:17.341649-04	55	SAR38	3		11	1
488	2015-04-05 02:25:17.342709-04	54	SAR37	3		11	1
489	2015-04-05 02:25:17.343823-04	53	SAR36	3		11	1
490	2015-04-05 02:25:17.345015-04	52	SAR35	3		11	1
491	2015-04-05 02:25:17.346117-04	51	SAR34	3		11	1
492	2015-04-05 02:25:52.620723-04	28	Infectious Disease	3		7	1
493	2015-04-05 02:25:52.629559-04	27	Rheumatology	3		7	1
494	2015-04-05 02:25:52.632411-04	26	Nephrology	3		7	1
495	2015-04-05 02:25:52.634677-04	25	Hematology	3		7	1
496	2015-04-05 02:25:52.637206-04	24	Inpt	3		7	1
497	2015-04-05 02:25:52.638846-04	23	Geri	3		7	1
498	2015-04-05 02:25:52.64017-04	22	Elective	3		7	1
499	2015-04-05 02:25:52.641375-04	21	Neuro	3		7	1
500	2015-04-05 02:25:52.642483-04	20	Med Consult	3		7	1
501	2015-04-05 02:25:52.643561-04	19	Procedure	3		7	1
502	2015-04-05 02:25:52.644615-04	18	Fourth Night Float	3		7	1
503	2015-04-05 02:25:52.645682-04	17	Cardiology Night Float	3		7	1
504	2015-04-05 02:26:14.720512-04	10	MICU-N	2	Changed minResidents and maxResidents.	7	1
505	2015-04-05 02:26:24.394547-04	11	MICU-S	2	Changed minResidents and maxResidents.	7	1
506	2015-04-05 02:26:33.186926-04	12	CCU	2	Changed minResidents and maxResidents.	7	1
507	2015-04-05 02:28:39.777196-04	4	Clinic	2	Changed minResidents. Changed minLength for education req "EducationReq object".	7	1
508	2015-04-05 02:28:46.432622-04	5	Vacation	2	No fields changed.	7	1
509	2015-04-05 02:28:58.164542-04	10	MICU-N	2	Changed minResidents and maxResidents.	7	1
510	2015-04-05 02:29:07.31773-04	11	MICU-S	2	Changed minResidents and maxResidents.	7	1
511	2015-04-05 02:29:17.546357-04	12	CCU	2	Changed minResidents and maxResidents.	7	1
512	2015-04-05 02:29:22.981678-04	13	Med 1	2	No fields changed.	7	1
513	2015-04-05 02:29:28.423099-04	14	Med 2	2	No fields changed.	7	1
514	2015-04-05 02:29:35.336128-04	15	Cardiology	2	No fields changed.	7	1
515	2015-04-05 02:29:45.764628-04	16	Med 2 Night Float	2	Changed minResidents and maxResidents.	7	1
516	2015-04-05 02:29:56.138422-04	16	Med 2 Night Float	2	Changed minLength for rotation length "RotationLength object".	7	1
517	2015-04-05 02:30:25.406814-04	4	Clinic	2	Changed maxLength for rotation length "RotationLength object".	7	1
518	2015-04-05 17:39:57.593905-04	4	Clinic	2	Changed minLength for rotation length "RotationLength object".	7	1
519	2015-04-05 17:40:11.017428-04	6	Four-week	2	No fields changed.	12	1
520	2015-04-05 17:45:36.725933-04	6	Four-week	2	No fields changed.	12	1
521	2015-04-05 17:57:10.080102-04	6	Four-week	2	Changed minLength and maxLength for rotation length "RotationLength object". Changed minLength and maxLength for rotation length "RotationLength object". Changed minLength and maxLength for rotation length "RotationLength object". Changed minLength and maxLength for rotation length "RotationLength object". Changed minLength and maxLength for rotation length "RotationLength object". Changed minLength and maxLength for rotation length "RotationLength object". Changed minLength and maxLength for rotation length "RotationLength object". Changed minLength and maxLength for rotation length "RotationLength object". Changed minLength and maxLength for rotation length "RotationLength object".	12	1
522	2015-04-05 20:06:00.279051-04	4	Clinic	2	No fields changed.	7	1
523	2015-04-05 20:06:18.863676-04	10	MICU-N	2	Changed minLength for rotation length "RotationLength object".	7	1
524	2015-04-05 20:06:23.661665-04	11	MICU-S	2	Changed minLength for rotation length "RotationLength object".	7	1
525	2015-04-05 20:06:34.831992-04	5	Vacation	2	No fields changed.	7	1
526	2015-04-05 20:06:48.57075-04	4	Clinic	2	Changed minLength and maxLength for rotation length "RotationLength object".	7	1
527	2015-04-05 20:12:08.829324-04	67	SAR50	2	Changed resExcludedBlocks.	11	1
528	2015-04-05 20:12:16.817417-04	66	SAR49	2	No fields changed.	11	1
529	2015-04-05 20:12:21.588685-04	65	SAR48	2	No fields changed.	11	1
530	2015-04-05 20:12:25.057879-04	50	SAR33	2	No fields changed.	11	1
531	2015-04-05 20:12:28.968372-04	49	SAR32	2	No fields changed.	11	1
532	2015-04-05 20:12:33.168473-04	48	SAR31	2	No fields changed.	11	1
533	2015-04-05 20:12:36.633516-04	47	SAR30	2	No fields changed.	11	1
534	2015-04-05 20:12:41.055978-04	46	SAR29	2	No fields changed.	11	1
535	2015-04-05 20:12:45.362263-04	45	SAR28	2	No fields changed.	11	1
536	2015-04-05 20:12:49.234377-04	22	SAR5	2	No fields changed.	11	1
537	2015-04-05 20:12:56.794104-04	21	SAR4	2	No fields changed.	11	1
538	2015-04-05 20:13:14.794152-04	20	SAR3	2	No fields changed.	11	1
539	2015-04-05 20:13:21.203106-04	19	SAR2	2	No fields changed.	11	1
540	2015-04-05 20:13:24.690594-04	18	SAR1	2	No fields changed.	11	1
541	2015-04-05 20:14:28.86013-04	16	Med 2 Night Float	2	Changed minLength for rotation length "RotationLength object". Changed minLength and maxLength for rotation length "RotationLength object".	7	1
542	2015-04-05 20:14:35.605515-04	15	Cardiology	2	No fields changed.	7	1
543	2015-04-05 20:14:40.481944-04	14	Med 2	2	No fields changed.	7	1
544	2015-04-05 20:14:44.287642-04	13	Med 1	2	No fields changed.	7	1
545	2015-04-05 20:14:50.582387-04	12	CCU	2	Changed minLength and maxLength for rotation length "RotationLength object".	7	1
546	2015-04-05 20:14:58.469813-04	11	MICU-S	2	Changed minLength for rotation length "RotationLength object". Changed minLength and maxLength for rotation length "RotationLength object".	7	1
547	2015-04-05 20:15:06.072457-04	10	MICU-N	2	Changed minLength for rotation length "RotationLength object".	7	1
548	2015-04-05 20:15:14.648021-04	5	Vacation	2	Changed minLength and maxLength for rotation length "RotationLength object". Changed minLength and maxLength for rotation length "RotationLength object".	7	1
549	2015-04-05 20:15:21.751305-04	4	Clinic	2	Changed minLength for rotation length "RotationLength object". Changed minLength and maxLength for rotation length "RotationLength object".	7	1
550	2015-04-05 20:20:01.096175-04	16	Med 2 Night Float	2	No fields changed.	7	1
551	2015-04-05 20:20:17.413335-04	12	CCU	2	Changed minLength for rotation length "RotationLength object". Changed minLength and maxLength for rotation length "RotationLength object".	7	1
552	2015-04-05 20:20:23.516152-04	11	MICU-S	2	Changed minLength for rotation length "RotationLength object". Changed minLength and maxLength for rotation length "RotationLength object".	7	1
553	2015-04-05 20:20:31.063672-04	10	MICU-N	2	Changed minLength for rotation length "RotationLength object". Changed minLength and maxLength for rotation length "RotationLength object".	7	1
554	2015-04-05 20:20:41.252362-04	5	Vacation	2	Changed minLength and maxLength for rotation length "RotationLength object". Changed minLength and maxLength for rotation length "RotationLength object".	7	1
555	2015-04-05 20:20:49.823832-04	4	Clinic	2	Changed minLength for rotation length "RotationLength object". Changed minLength and maxLength for rotation length "RotationLength object".	7	1
556	2015-04-05 21:09:19.95846-04	6	Four-week	2	No fields changed.	12	1
557	2015-04-05 21:10:14.169061-04	16	Med 2 Night Float	3		7	1
558	2015-04-05 21:10:14.177351-04	15	Cardiology	3		7	1
559	2015-04-05 21:10:14.180467-04	14	Med 2	3		7	1
560	2015-04-05 21:10:14.182856-04	13	Med 1	3		7	1
561	2015-04-05 21:10:14.184296-04	12	CCU	3		7	1
562	2015-04-05 21:10:14.186262-04	11	MICU-S	3		7	1
563	2015-04-05 21:10:14.18788-04	10	MICU-N	3		7	1
564	2015-04-05 21:10:14.189192-04	5	Vacation	3		7	1
565	2015-04-05 21:10:14.190567-04	4	Clinic	3		7	1
566	2015-04-05 22:32:53.809418-04	31	AMB	2	Changed recurrenceWindow.	7	1
567	2015-04-05 22:33:03.408266-04	91	Vacation	3		7	1
568	2015-04-05 22:33:03.411904-04	90	Variety NF	3		7	1
569	2015-04-05 22:33:03.413713-04	89	VACR	3		7	1
570	2015-04-05 22:33:03.415001-04	88	VA	3		7	1
571	2015-04-05 22:33:03.416238-04	87	Underserved	3		7	1
572	2015-04-05 22:33:03.417697-04	86	Rheum	3		7	1
573	2015-04-05 22:33:03.418952-04	85	Research	3		7	1
574	2015-04-05 22:33:03.422003-04	84	Renal_TXP	3		7	1
575	2015-04-05 22:33:03.423327-04	83	Renal	3		7	1
576	2015-04-05 22:33:03.424489-04	82	READ	3		7	1
577	2015-04-05 22:33:03.425599-04	81	QI	3		7	1
578	2015-04-05 22:33:03.426724-04	80	Pulm	3		7	1
579	2015-04-05 22:33:03.427834-04	79	Psych	3		7	1
580	2015-04-05 22:33:03.428912-04	78	Proc	3		7	1
581	2015-04-05 22:33:03.429988-04	77	Primary Care	3		7	1
582	2015-04-05 22:33:03.431073-04	76	Palliative Care	3		7	1
583	2015-04-05 22:33:03.432168-04	75	Ortho	3		7	1
584	2015-04-05 22:33:03.433293-04	74	ONC	3		7	1
585	2015-04-05 22:33:03.434984-04	73	Onc_Amb	3		7	1
586	2015-04-05 22:33:03.436275-04	72	Nutrition	3		7	1
587	2015-04-05 22:33:03.437496-04	71	NF_VA	3		7	1
588	2015-04-05 22:33:03.438663-04	70	NF_ONC	3		7	1
589	2015-04-05 22:33:03.439802-04	69	I_NEURO	3		7	1
590	2015-04-05 22:33:03.440923-04	68	Neuro	3		7	1
591	2015-04-05 22:33:03.442092-04	67	MICU-S	3		7	1
592	2015-04-05 22:33:03.443165-04	66	MICU-N	3		7	1
593	2015-04-05 22:33:03.44441-04	65	Med 2	3		7	1
594	2015-04-05 22:33:03.44564-04	64	Med 1	3		7	1
595	2015-04-05 22:33:03.446792-04	63	MEDICAL LEAVE	3		7	1
596	2015-04-05 22:33:03.447895-04	62	Med 2 NF	3		7	1
597	2015-04-05 22:33:03.455127-04	61	Med 1 NF	3		7	1
598	2015-04-05 22:33:03.462338-04	60	MATERNITY	3		7	1
599	2015-04-05 22:33:03.469293-04	59	ID	3		7	1
600	2015-04-05 22:33:03.475693-04	58	HOSP	3		7	1
601	2015-04-05 22:33:03.477529-04	57	Heme	3		7	1
602	2015-04-05 22:33:03.479245-04	56	GH	3		7	1
603	2015-04-05 22:33:03.480561-04	55	Geri	3		7	1
604	2015-04-05 22:33:03.481787-04	54	GI	3		7	1
605	2015-04-05 22:33:03.483006-04	53	ENDO	3		7	1
606	2015-04-05 22:33:03.484485-04	52	EM_2	3		7	1
607	2015-04-05 22:33:03.485889-04	51	EM_1	3		7	1
608	2015-04-05 22:33:03.487061-04	50	DERM	3		7	1
609	2015-04-05 22:33:03.488157-04	49	CSTAR	3		7	1
610	2015-04-05 22:33:03.489251-04	48	Clinic	3		7	1
611	2015-04-05 22:33:03.49035-04	47	CHIEF RES PREP	3		7	1
612	2015-04-05 22:33:03.491464-04	46	CCU	3		7	1
613	2015-04-05 22:33:03.492635-04	45	CARDS ELECTIVE	3		7	1
614	2015-04-05 22:33:03.493745-04	44	Cards NF	3		7	1
615	2015-04-05 22:33:03.494846-04	43	CARDS FIRM	3		7	1
616	2015-04-05 22:33:03.495924-04	42	CAER	3		7	1
617	2015-04-05 22:33:03.49714-04	41	BMT	3		7	1
618	2015-04-05 22:33:03.498218-04	40	Medicine consults	3		7	1
619	2015-04-05 22:33:03.499296-04	39	Asthma (WC)	3		7	1
620	2015-04-05 22:33:03.500394-04	38	AMB	3		7	1
621	2015-04-05 22:33:03.50194-04	37	AMBJAR	3		7	1
622	2015-04-05 22:33:03.503178-04	36	All_Imm	3		7	1
623	2015-04-05 22:33:03.504313-04	35	CAER	3		7	1
624	2015-04-05 22:33:03.505412-04	34	BMT	3		7	1
625	2015-04-05 22:33:03.506544-04	33	Medicine consults	3		7	1
626	2015-04-05 22:33:03.507745-04	32	Asthma (WC)	3		7	1
627	2015-04-05 22:33:03.50928-04	31	AMB	3		7	1
628	2015-04-05 22:33:03.510635-04	30	AMBJAR	3		7	1
629	2015-04-05 22:33:03.511967-04	29	All_Imm	3		7	1
630	2015-04-05 22:35:23.158129-04	203	Vacation	3		7	1
631	2015-04-05 22:35:23.166333-04	202	Variety NF	3		7	1
632	2015-04-05 22:35:23.172608-04	201	VACR	3		7	1
633	2015-04-05 22:35:23.174351-04	200	VA	3		7	1
634	2015-04-05 22:35:23.175962-04	199	Underserved	3		7	1
635	2015-04-05 22:35:23.177497-04	198	Rheum	3		7	1
636	2015-04-05 22:35:23.179021-04	197	Research	3		7	1
637	2015-04-05 22:35:23.180454-04	196	Renal_TXP	3		7	1
638	2015-04-05 22:35:23.18238-04	195	Renal	3		7	1
639	2015-04-05 22:35:23.183948-04	194	READ	3		7	1
640	2015-04-05 22:35:23.185383-04	193	QI	3		7	1
641	2015-04-05 22:35:23.186719-04	192	Pulm	3		7	1
642	2015-04-05 22:35:23.188229-04	191	Psych	3		7	1
643	2015-04-05 22:35:23.189696-04	190	Proc	3		7	1
644	2015-04-05 22:35:23.191054-04	189	Primary Care	3		7	1
645	2015-04-05 22:35:23.19232-04	188	Palliative Care	3		7	1
646	2015-04-05 22:35:23.193729-04	187	Ortho	3		7	1
647	2015-04-05 22:35:23.19515-04	186	ONC	3		7	1
648	2015-04-05 22:35:23.196432-04	185	Onc_Amb	3		7	1
649	2015-04-05 22:35:23.197885-04	184	Nutrition	3		7	1
650	2015-04-05 22:35:23.199393-04	183	NF_VA	3		7	1
651	2015-04-05 22:35:23.200772-04	182	NF_ONC	3		7	1
652	2015-04-05 22:35:23.201963-04	181	I_NEURO	3		7	1
653	2015-04-05 22:35:23.203104-04	180	Neuro	3		7	1
654	2015-04-05 22:35:23.204267-04	179	MICU-S	3		7	1
655	2015-04-05 22:35:23.205398-04	178	MICU-N	3		7	1
656	2015-04-05 22:35:23.20652-04	177	Med 2	3		7	1
657	2015-04-05 22:35:23.207737-04	176	Med 1	3		7	1
658	2015-04-05 22:35:23.20885-04	175	MEDICAL LEAVE	3		7	1
659	2015-04-05 22:35:23.209999-04	174	Med 2 NF	3		7	1
660	2015-04-05 22:35:23.211141-04	173	Med 1 NF	3		7	1
661	2015-04-05 22:35:23.212949-04	172	MATERNITY	3		7	1
662	2015-04-05 22:35:23.214973-04	171	ID	3		7	1
663	2015-04-05 22:35:23.216661-04	170	HOSP	3		7	1
664	2015-04-05 22:35:23.218182-04	169	Heme	3		7	1
665	2015-04-05 22:35:23.219331-04	168	GH	3		7	1
666	2015-04-05 22:35:23.22042-04	167	Geri	3		7	1
667	2015-04-05 22:35:23.221634-04	166	GI	3		7	1
668	2015-04-05 22:35:23.222742-04	165	ENDO	3		7	1
669	2015-04-05 22:35:23.223856-04	164	EM_2	3		7	1
670	2015-04-05 22:35:23.224945-04	163	EM_1	3		7	1
671	2015-04-05 22:35:23.226064-04	162	DERM	3		7	1
672	2015-04-05 22:35:23.227449-04	161	CSTAR	3		7	1
673	2015-04-05 22:35:23.228905-04	160	Clinic	3		7	1
674	2015-04-05 22:35:23.230166-04	159	CHIEF RES PREP	3		7	1
675	2015-04-05 22:35:23.23143-04	158	CCU	3		7	1
676	2015-04-05 22:35:23.23281-04	157	CARDS ELECTIVE	3		7	1
677	2015-04-05 22:35:23.234289-04	156	Cards NF	3		7	1
678	2015-04-05 22:35:23.236119-04	155	CARDS FIRM	3		7	1
679	2015-04-05 22:35:23.237598-04	154	CAER	3		7	1
680	2015-04-05 22:35:23.238784-04	153	BMT	3		7	1
681	2015-04-05 22:35:23.239884-04	152	Medicine consults	3		7	1
682	2015-04-05 22:35:23.241152-04	151	Asthma (WC)	3		7	1
683	2015-04-05 22:35:23.242527-04	150	AMB	3		7	1
684	2015-04-05 22:35:23.243736-04	149	AMBJAR	3		7	1
685	2015-04-05 22:35:23.244863-04	148	All_Imm	3		7	1
686	2015-04-05 22:35:23.252034-04	147	Vacation	3		7	1
687	2015-04-05 22:35:23.25961-04	146	Variety NF	3		7	1
688	2015-04-05 22:35:23.267241-04	145	VACR	3		7	1
689	2015-04-05 22:35:23.27367-04	144	VA	3		7	1
690	2015-04-05 22:35:23.275255-04	143	Underserved	3		7	1
691	2015-04-05 22:35:23.276798-04	142	Rheum	3		7	1
692	2015-04-05 22:35:23.278168-04	141	Research	3		7	1
693	2015-04-05 22:35:23.279547-04	140	Renal_TXP	3		7	1
694	2015-04-05 22:35:23.281295-04	139	Renal	3		7	1
695	2015-04-05 22:35:23.282713-04	138	READ	3		7	1
696	2015-04-05 22:35:23.284152-04	137	QI	3		7	1
697	2015-04-05 22:35:23.285464-04	136	Pulm	3		7	1
698	2015-04-05 22:35:23.286778-04	135	Psych	3		7	1
699	2015-04-05 22:35:23.288152-04	134	Proc	3		7	1
700	2015-04-05 22:35:23.289425-04	133	Primary Care	3		7	1
701	2015-04-05 22:35:23.290772-04	132	Palliative Care	3		7	1
702	2015-04-05 22:35:23.292089-04	131	Ortho	3		7	1
703	2015-04-05 22:35:23.293557-04	130	ONC	3		7	1
704	2015-04-05 22:35:23.295006-04	129	Onc_Amb	3		7	1
705	2015-04-05 22:35:23.296427-04	128	Nutrition	3		7	1
706	2015-04-05 22:35:23.297953-04	127	NF_VA	3		7	1
707	2015-04-05 22:35:23.299356-04	126	NF_ONC	3		7	1
708	2015-04-05 22:35:23.300686-04	125	I_NEURO	3		7	1
709	2015-04-05 22:35:23.302137-04	124	Neuro	3		7	1
710	2015-04-05 22:35:23.303595-04	123	MICU-S	3		7	1
711	2015-04-05 22:35:23.304914-04	122	MICU-N	3		7	1
712	2015-04-05 22:35:23.306173-04	121	Med 2	3		7	1
713	2015-04-05 22:35:23.308145-04	120	Med 1	3		7	1
714	2015-04-05 22:35:23.310016-04	119	MEDICAL LEAVE	3		7	1
715	2015-04-05 22:35:23.311516-04	118	Med 2 NF	3		7	1
716	2015-04-05 22:35:23.312891-04	117	Med 1 NF	3		7	1
717	2015-04-05 22:35:23.314324-04	116	MATERNITY	3		7	1
718	2015-04-05 22:35:23.318649-04	115	ID	3		7	1
719	2015-04-05 22:35:23.320477-04	114	HOSP	3		7	1
720	2015-04-05 22:35:23.322094-04	113	Heme	3		7	1
721	2015-04-05 22:35:23.323577-04	112	GH	3		7	1
722	2015-04-05 22:35:23.325033-04	111	Geri	3		7	1
723	2015-04-05 22:35:23.326522-04	110	GI	3		7	1
724	2015-04-05 22:35:23.328612-04	109	ENDO	3		7	1
725	2015-04-05 22:35:23.330099-04	108	EM_2	3		7	1
726	2015-04-05 22:35:23.331441-04	107	EM_1	3		7	1
727	2015-04-05 22:35:23.332596-04	106	DERM	3		7	1
728	2015-04-05 22:35:23.333791-04	105	CSTAR	3		7	1
729	2015-04-05 22:35:23.335194-04	104	Clinic	3		7	1
730	2015-04-05 22:35:30.835327-04	103	CHIEF RES PREP	3		7	1
731	2015-04-05 22:35:30.837912-04	102	CCU	3		7	1
732	2015-04-05 22:35:30.8393-04	101	CARDS ELECTIVE	3		7	1
733	2015-04-05 22:35:30.840616-04	100	Cards NF	3		7	1
734	2015-04-05 22:35:30.841883-04	99	CARDS FIRM	3		7	1
735	2015-04-05 22:35:30.843155-04	98	CAER	3		7	1
736	2015-04-05 22:35:30.844428-04	97	BMT	3		7	1
737	2015-04-05 22:35:30.845799-04	96	Medicine consults	3		7	1
738	2015-04-05 22:35:30.852866-04	95	Asthma (WC)	3		7	1
739	2015-04-05 22:35:30.860245-04	94	AMB	3		7	1
740	2015-04-05 22:35:30.868229-04	93	AMBJAR	3		7	1
741	2015-04-05 22:35:30.875006-04	92	All_Imm	3		7	1
742	2015-04-06 00:48:50.817125-04	67	SAR50	3		11	1
743	2015-04-06 00:48:50.829523-04	66	SAR49	3		11	1
744	2015-04-06 00:48:50.831479-04	65	SAR48	3		11	1
745	2015-04-06 00:48:50.833019-04	50	SAR33	3		11	1
746	2015-04-06 00:48:50.834316-04	49	SAR32	3		11	1
747	2015-04-06 00:48:50.835609-04	48	SAR31	3		11	1
748	2015-04-06 00:48:50.837365-04	47	SAR30	3		11	1
749	2015-04-06 00:48:50.838567-04	46	SAR29	3		11	1
750	2015-04-06 00:48:50.839714-04	45	SAR28	3		11	1
751	2015-04-06 00:48:50.840819-04	22	SAR5	3		11	1
752	2015-04-06 00:48:50.841918-04	21	SAR4	3		11	1
753	2015-04-06 00:48:50.849261-04	20	SAR3	3		11	1
754	2015-04-06 00:48:50.856504-04	19	SAR2	3		11	1
755	2015-04-06 00:48:50.864098-04	18	SAR1	3		11	1
756	2015-04-06 01:15:22.884235-04	68	Christina Anderson	2	No fields changed.	11	1
757	2015-04-06 01:16:00.415951-04	156	Diana Zhong	2	Changed couple.	11	1
758	2015-04-06 01:16:12.518126-04	102	Jeffrey Chung	2	Changed couple.	11	1
759	2015-04-06 01:16:49.366844-04	144	Sheng Si	2	Changed couple.	11	1
760	2015-04-06 01:17:24.108487-04	117	Chi-Joan How	2	Changed couple.	11	1
761	2015-04-06 03:23:14.269555-04	2	Global Health	1		9	1
762	2015-04-06 03:23:44.404647-04	3	CSTAR	1		9	1
763	2015-04-06 03:23:53.133069-04	4	VACR	1		9	1
764	2015-04-06 03:24:01.66651-04	5	Primary Care	1		9	1
765	2015-04-06 03:37:14.936505-04	156	Diana Zhong	3		11	1
766	2015-04-06 03:37:14.940942-04	155	Peter Zhao	3		11	1
767	2015-04-06 03:37:14.943437-04	154	Anson Wilks	3		11	1
768	2015-04-06 03:37:14.944787-04	153	Yan Wang	3		11	1
769	2015-04-06 03:37:14.946-04	152	Xiaowen Wang	3		11	1
770	2015-04-06 03:37:14.947279-04	151	Jonathan Walter	3		11	1
771	2015-04-06 03:37:14.948506-04	150	Ted Walker	3		11	1
772	2015-04-06 03:37:14.949644-04	149	Stephanie Velloze	3		11	1
773	2015-04-06 03:37:14.950763-04	148	AnnMarcia Tukpah	3		11	1
774	2015-04-06 03:37:14.951858-04	147	Alex Thomas	3		11	1
775	2015-04-06 03:37:14.953169-04	146	Fiona Strasserking	3		11	1
776	2015-04-06 03:37:14.96026-04	145	Rachel Steinhorn	3		11	1
777	2015-04-06 03:37:14.967826-04	144	Sheng Si	3		11	1
778	2015-04-06 03:37:14.975592-04	143	Jason Romancik	3		11	1
779	2015-04-06 03:37:14.981759-04	142	Anjali Rohatgi	3		11	1
780	2015-04-06 03:37:14.98333-04	141	Desirai Rogan	3		11	1
781	2015-04-06 03:37:14.984501-04	140	Arvind Rengarajan	3		11	1
782	2015-04-06 03:37:14.985609-04	139	David Rawnsley	3		11	1
783	2015-04-06 03:37:14.986725-04	138	Abdirahim Rashid	3		11	1
784	2015-04-06 03:37:14.987856-04	137	Thomas Park	3		11	1
785	2015-04-06 03:37:14.989046-04	136	Eze Okeagu	3		11	1
786	2015-04-06 03:37:14.990291-04	135	Jonas Noe	3		11	1
787	2015-04-06 03:37:14.991441-04	134	Vinaya Mulkareddy	3		11	1
788	2015-04-06 03:37:14.992602-04	133	Ivan Mugisha	3		11	1
789	2015-04-06 03:37:14.994199-04	132	Zachary Morgan	3		11	1
790	2015-04-06 03:37:14.995933-04	131	Megan Mirkes	3		11	1
791	2015-04-06 03:37:14.997599-04	130	Pauras Memon	3		11	1
792	2015-04-06 03:37:14.99949-04	129	Christian McNeely	3		11	1
793	2015-04-06 03:37:15.00115-04	128	Jordan Maryfield	3		11	1
794	2015-04-06 03:37:15.002616-04	127	Laura Marks	3		11	1
795	2015-04-06 03:37:15.003891-04	126	Jimmy Ma	3		11	1
796	2015-04-06 03:37:15.004999-04	125	Jeremy Louissaint	3		11	1
797	2015-04-06 03:37:15.006353-04	124	Han Li	3		11	1
798	2015-04-06 03:37:15.007801-04	123	Timothy Kamerzell	3		11	1
799	2015-04-06 03:37:15.0096-04	122	Michael Joshua Hendrix	3		11	1
800	2015-04-06 03:37:15.011193-04	121	Ramon Jin	3		11	1
801	2015-04-06 03:37:15.012448-04	120	Naomi Jiang	3		11	1
802	2015-04-06 03:37:15.013544-04	119	Joyce Ji	3		11	1
803	2015-04-06 03:37:15.014638-04	118	Nhila Jagadeesan	3		11	1
804	2015-04-06 03:37:15.015729-04	117	Chi-Joan How	3		11	1
805	2015-04-06 03:37:15.016864-04	116	Kirk Hou	3		11	1
806	2015-04-06 03:37:15.018023-04	115	Alonso Heudebert	3		11	1
807	2015-04-06 03:37:15.019156-04	114	Brett Herzog	3		11	1
808	2015-04-06 03:37:15.020242-04	113	Martin Gregory	3		11	1
809	2015-04-06 03:37:15.021316-04	112	Reece Goiffon	3		11	1
810	2015-04-06 03:37:15.022373-04	111	Cassandra Fritz	3		11	1
811	2015-04-06 03:37:15.023667-04	110	Lindsay Frerichs	3		11	1
812	2015-04-06 03:37:15.024825-04	109	Jaime Flores Ruiz	3		11	1
813	2015-04-06 03:37:15.026058-04	108	Kathryn Filson	3		11	1
814	2015-04-06 03:37:15.027581-04	107	Elyse Everett	3		11	1
815	2015-04-06 03:37:15.029079-04	106	Vanessa Eulo	3		11	1
816	2015-04-06 03:37:15.030302-04	105	Kalen Dionne	3		11	1
817	2015-04-06 03:37:15.031408-04	104	Zachary Crees	3		11	1
818	2015-04-06 03:37:15.032493-04	103	John Ciotti	3		11	1
819	2015-04-06 03:37:15.033556-04	102	Jeffrey Chung	3		11	1
820	2015-04-06 03:37:15.035055-04	101	Christopher Chung	3		11	1
821	2015-04-06 03:37:15.036386-04	100	Stephen Chi	3		11	1
822	2015-04-06 03:37:15.037717-04	99	Rahul Chhana	3		11	1
823	2015-04-06 03:37:15.039236-04	98	Puja Chebrolu	3		11	1
824	2015-04-06 03:37:15.040894-04	97	Jeremy Brooks	3		11	1
825	2015-04-06 03:37:15.042107-04	96	Margaret Blattner	3		11	1
826	2015-04-06 03:37:15.043432-04	95	Wenners Ballard, III	3		11	1
827	2015-04-06 03:37:15.045018-04	94	Brandi Baker	3		11	1
828	2015-04-06 03:37:15.046287-04	93	Jordan Atkins	3		11	1
829	2015-04-06 03:37:15.047528-04	92	Christina Anderson	3		11	1
830	2015-04-06 03:37:15.049156-04	91	Alonso Heudebert	3		11	1
831	2015-04-06 03:37:15.050493-04	90	Brett Herzog	3		11	1
832	2015-04-06 03:37:15.051605-04	89	Martin Gregory	3		11	1
833	2015-04-06 03:37:15.052692-04	88	Reece Goiffon	3		11	1
834	2015-04-06 03:37:15.053773-04	87	Cassandra Fritz	3		11	1
835	2015-04-06 03:37:15.061028-04	86	Lindsay Frerichs	3		11	1
836	2015-04-06 03:37:15.068962-04	85	Jaime Flores Ruiz	3		11	1
837	2015-04-06 03:37:15.076087-04	84	Kathryn Filson	3		11	1
838	2015-04-06 03:37:15.082498-04	83	Elyse Everett	3		11	1
839	2015-04-06 03:37:15.084044-04	82	Vanessa Eulo	3		11	1
840	2015-04-06 03:37:15.085237-04	81	Kalen Dionne	3		11	1
841	2015-04-06 03:37:15.086381-04	80	Zachary Crees	3		11	1
842	2015-04-06 03:37:15.087956-04	79	John Ciotti	3		11	1
843	2015-04-06 03:37:15.089202-04	78	Jeffrey Chung	3		11	1
844	2015-04-06 03:37:15.090527-04	77	Christopher Chung	3		11	1
845	2015-04-06 03:37:15.091891-04	76	Stephen Chi	3		11	1
846	2015-04-06 03:37:15.092991-04	75	Rahul Chhana	3		11	1
847	2015-04-06 03:37:15.094074-04	74	Puja Chebrolu	3		11	1
848	2015-04-06 03:37:15.09515-04	73	Jeremy Brooks	3		11	1
849	2015-04-06 03:37:15.096223-04	72	Margaret Blattner	3		11	1
850	2015-04-06 03:37:15.09743-04	71	Wenners Ballard, III	3		11	1
851	2015-04-06 03:37:15.098594-04	70	Brandi Baker	3		11	1
852	2015-04-06 03:37:15.09971-04	69	Jordan Atkins	3		11	1
853	2015-04-06 03:37:15.101255-04	68	Christina Anderson	3		11	1
854	2015-04-06 03:40:00.612042-04	313	Yosafe Wakwaya	3		11	1
855	2015-04-06 03:40:00.614852-04	312	Vaiibhav Patel	3		11	1
856	2015-04-06 03:40:00.616238-04	311	Tokhanh Nguyen	3		11	1
857	2015-04-06 03:40:00.617453-04	310	Timothy Brian Lumpkin	3		11	1
858	2015-04-06 03:40:00.618781-04	309	Yevgeniy Khariton	3		11	1
859	2015-04-06 03:40:00.620209-04	308	Shan Reddy	3		11	1
860	2015-04-06 03:40:00.621486-04	307	Scott McHenry	3		11	1
861	2015-04-06 03:40:00.623427-04	306	Sushma Jonna	3		11	1
862	2015-04-06 03:40:00.624914-04	305	Stephen Hasak	3		11	1
863	2015-04-06 03:40:00.626287-04	304	Scott Goldsmith	3		11	1
864	2015-04-06 03:40:00.627416-04	303	Stacy Dai	3		11	1
865	2015-04-06 03:40:00.628534-04	302	Pooja Koolwal	3		11	1
866	2015-04-06 03:40:00.629623-04	301	Patricia Litkowski	3		11	1
867	2015-04-06 03:40:00.63069-04	300	Nathan Moore	3		11	1
868	2015-04-06 03:40:00.631745-04	299	Ningning Ma	3		11	1
869	2015-04-06 03:40:00.632876-04	298	Michael Weaver	3		11	1
870	2015-04-06 03:40:00.634095-04	297	Michael Hesseler	3		11	1
871	2015-04-06 03:40:00.635167-04	296	Meghan Heberton	3		11	1
872	2015-04-06 03:40:00.636329-04	295	Melissa DeFoe	3		11	1
873	2015-04-06 03:40:00.638522-04	294	Li Zhou	3		11	1
874	2015-04-06 03:40:00.640515-04	293	Lauren Levine	3		11	1
875	2015-04-06 03:40:00.642583-04	292	Khoan Vu	3		11	1
876	2015-04-06 03:40:00.644151-04	291	Kiran Mahmood	3		11	1
877	2015-04-06 03:40:00.645815-04	290	Keerthi Karamched	3		11	1
878	2015-04-06 03:40:00.6475-04	289	Justin Sheehy	3		11	1
879	2015-04-06 03:40:00.64923-04	288	Jesus Jimenez	3		11	1
880	2015-04-06 03:40:00.656544-04	287	Jonathan Chatzkel	3		11	1
881	2015-04-06 03:40:00.665156-04	286	Ian Ross	3		11	1
882	2015-04-06 03:40:00.672558-04	285	Indra Bole	3		11	1
883	2015-04-06 03:40:00.678815-04	284	Happy Thakkar	3		11	1
884	2015-04-06 03:40:00.680692-04	283	Gregory Ratti	3		11	1
885	2015-04-06 03:40:00.682631-04	282	Grant Heberton	3		11	1
886	2015-04-06 03:40:00.684171-04	281	Emily Steiner	3		11	1
887	2015-04-06 03:40:00.685328-04	280	Dmitriy Breytman	3		11	1
888	2015-04-06 03:40:00.686588-04	279	Christopher Rigell	3		11	1
889	2015-04-06 03:40:00.688139-04	278	Chelsea Pearson	3		11	1
890	2015-04-06 03:40:00.689718-04	277	Brian Pierce	3		11	1
891	2015-04-06 03:40:00.691313-04	276	Brittne Halford	3		11	1
892	2015-04-06 03:40:00.694018-04	275	Bahaa Bedair	3		11	1
893	2015-04-06 03:40:00.695577-04	274	Ashish Rastogi	3		11	1
894	2015-04-06 03:40:00.697608-04	273	Amrita Padda	3		11	1
895	2015-04-06 03:40:00.699173-04	272	Andrew Michelson	3		11	1
896	2015-04-06 03:40:00.700324-04	271	Adam Fledderman	3		11	1
897	2015-04-06 03:40:00.701411-04	270	Yeshika Sharma	3		11	1
898	2015-04-06 03:40:00.702497-04	269	Theodore Kim	3		11	1
899	2015-04-06 03:40:00.703717-04	268	Tanya Devnani	3		11	1
900	2015-04-06 03:40:00.704904-04	267	Samuel Reinhardt	3		11	1
901	2015-04-06 03:40:00.70624-04	266	Steven Borson	3		11	1
902	2015-04-06 03:40:00.708037-04	265	Raymond Fohtung	3		11	1
903	2015-04-06 03:40:00.709442-04	264	Ramzi Abboud	3		11	1
904	2015-04-06 03:40:00.710559-04	263	Peter Yen	3		11	1
905	2015-04-06 03:40:00.711638-04	262	Patrick Grierson	3		11	1
906	2015-04-06 03:40:00.712705-04	261	Philip Chu	3		11	1
907	2015-04-06 03:40:00.713934-04	260	Niall Prendergast	3		11	1
908	2015-04-06 03:40:00.715076-04	259	Neal Akhave	3		11	1
909	2015-04-06 03:40:00.716211-04	258	Michael Tang	3		11	1
910	2015-04-06 03:40:00.717306-04	257	Maanasi Samant	3		11	1
911	2015-04-06 03:40:00.718385-04	256	Michael Paley	3		11	1
912	2015-04-06 03:40:00.719852-04	255	Milan Kahanda	3		11	1
913	2015-04-06 03:40:00.721776-04	254	Mate Gergely	3		11	1
914	2015-04-06 03:40:00.723205-04	253	M. Phillip Fejleh	3		11	1
915	2015-04-06 03:40:00.724935-04	252	Michael Biersmith	3		11	1
916	2015-04-06 03:40:00.726292-04	251	Lela Ruck	3		11	1
917	2015-04-06 03:40:00.727409-04	250	Yuan Yuan	3		11	1
918	2015-04-06 03:40:00.728508-04	249	Josh Saef	3		11	1
919	2015-04-06 03:40:00.729598-04	248	Jay Patel	3		11	1
920	2015-04-06 03:40:00.730665-04	247	Jonathan Mizrahi	3		11	1
921	2015-04-06 03:40:00.731843-04	246	Justin Maxfield	3		11	1
922	2015-04-06 03:40:00.733339-04	245	Jessica Ma	3		11	1
923	2015-04-06 03:40:00.734884-04	244	Jeff Friesen	3		11	1
924	2015-04-06 03:40:00.736196-04	243	Jacqueline Chen	3		11	1
925	2015-04-06 03:40:00.737637-04	242	Jason Chan	3		11	1
926	2015-04-06 03:40:00.740003-04	241	Juan Calix	3		11	1
927	2015-04-06 03:40:00.742202-04	240	Joseph Brancheck	3		11	1
928	2015-04-06 03:40:00.744023-04	239	Jaimie Bolda	3		11	1
929	2015-04-06 03:40:00.745789-04	238	Hirak Shah	3		11	1
930	2015-04-06 03:40:00.747231-04	237	Farhan Quader	3		11	1
931	2015-04-06 03:40:00.748385-04	236	Fizza Abbas	3		11	1
932	2015-04-06 03:40:00.749499-04	235	Danicela Younce	3		11	1
933	2015-04-06 03:40:00.750667-04	234	Derek Yee	3		11	1
934	2015-04-06 03:40:00.757879-04	233	David Pham	3		11	1
935	2015-04-06 03:40:00.765869-04	232	Dilan Patel	3		11	1
936	2015-04-06 03:40:00.772866-04	231	Connor Woodland	3		11	1
937	2015-04-06 03:40:00.778761-04	230	Catherine McCarthy	3		11	1
938	2015-04-06 03:40:00.780169-04	229	Chien-Jung Lin	3		11	1
939	2015-04-06 03:40:00.781333-04	228	Chris Jones	3		11	1
940	2015-04-06 03:40:00.782436-04	227	Colin Diffie	3		11	1
941	2015-04-06 03:40:00.783648-04	226	Ben Rogers	3		11	1
942	2015-04-06 03:40:00.78476-04	225	Benjamin Kopecky	3		11	1
943	2015-04-06 03:40:00.785925-04	224	Asrar Khan	3		11	1
944	2015-04-06 03:40:00.787207-04	223	Alex Huh	3		11	1
945	2015-04-06 03:40:00.788641-04	222	Amit Bery	3		11	1
946	2015-04-06 03:40:00.789747-04	221	Diana Zhong	3		11	1
947	2015-04-06 03:40:00.791006-04	220	Peter Zhao	3		11	1
948	2015-04-06 03:40:00.792627-04	219	Anson Wilks	3		11	1
949	2015-04-06 03:40:00.793929-04	218	Yan Wang	3		11	1
950	2015-04-06 03:40:00.795074-04	217	Xiaowen Wang	3		11	1
951	2015-04-06 03:40:00.796262-04	216	Jonathan Walter	3		11	1
952	2015-04-06 03:40:00.797396-04	215	Ted Walker	3		11	1
953	2015-04-06 03:40:00.798534-04	214	Stephanie Velloze	3		11	1
954	2015-04-06 03:40:38.823009-04	213	AnnMarcia Tukpah	3		11	1
955	2015-04-06 03:40:38.826418-04	212	Alex Thomas	3		11	1
956	2015-04-06 03:40:38.827897-04	211	Fiona Strasserking	3		11	1
957	2015-04-06 03:40:38.829212-04	210	Rachel Steinhorn	3		11	1
958	2015-04-06 03:40:38.830517-04	209	Sheng Si	3		11	1
959	2015-04-06 03:40:38.831971-04	208	Jason Romancik	3		11	1
960	2015-04-06 03:40:38.833267-04	207	Anjali Rohatgi	3		11	1
961	2015-04-06 03:40:38.834468-04	206	Desirai Rogan	3		11	1
962	2015-04-06 03:40:38.83602-04	205	Arvind Rengarajan	3		11	1
963	2015-04-06 03:40:38.837856-04	204	David Rawnsley	3		11	1
964	2015-04-06 03:40:38.839585-04	203	Abdirahim Rashid	3		11	1
965	2015-04-06 03:40:38.840694-04	202	Thomas Park	3		11	1
966	2015-04-06 03:40:38.841754-04	201	Eze Okeagu	3		11	1
967	2015-04-06 03:40:38.842842-04	200	Jonas Noe	3		11	1
968	2015-04-06 03:40:38.844036-04	199	Vinaya Mulkareddy	3		11	1
969	2015-04-06 03:40:38.845554-04	198	Ivan Mugisha	3		11	1
970	2015-04-06 03:40:38.846651-04	197	Zachary Morgan	3		11	1
971	2015-04-06 03:40:38.847821-04	196	Megan Mirkes	3		11	1
972	2015-04-06 03:40:38.848946-04	195	Pauras Memon	3		11	1
973	2015-04-06 03:40:38.855771-04	194	Christian McNeely	3		11	1
974	2015-04-06 03:40:38.862859-04	193	Jordan Maryfield	3		11	1
975	2015-04-06 03:40:38.8725-04	192	Laura Marks	3		11	1
976	2015-04-06 03:40:38.879161-04	191	Jimmy Ma	3		11	1
977	2015-04-06 03:40:38.881042-04	190	Jeremy Louissaint	3		11	1
978	2015-04-06 03:40:38.883485-04	189	Han Li	3		11	1
979	2015-04-06 03:40:38.885693-04	188	Timothy Kamerzell	3		11	1
980	2015-04-06 03:40:38.887682-04	187	Michael Joshua Hendrix	3		11	1
981	2015-04-06 03:40:38.889139-04	186	Ramon Jin	3		11	1
982	2015-04-06 03:40:38.890727-04	185	Naomi Jiang	3		11	1
983	2015-04-06 03:40:38.89218-04	184	Joyce Ji	3		11	1
984	2015-04-06 03:40:38.893606-04	183	Nhila Jagadeesan	3		11	1
985	2015-04-06 03:40:38.894946-04	182	Chi-Joan How	3		11	1
986	2015-04-06 03:40:38.896205-04	181	Kirk Hou	3		11	1
987	2015-04-06 03:40:38.897416-04	180	Alonso Heudebert	3		11	1
988	2015-04-06 03:40:38.898614-04	179	Brett Herzog	3		11	1
989	2015-04-06 03:40:38.899804-04	178	Martin Gregory	3		11	1
990	2015-04-06 03:40:38.900964-04	177	Reece Goiffon	3		11	1
991	2015-04-06 03:40:38.902444-04	176	Cassandra Fritz	3		11	1
992	2015-04-06 03:40:38.90387-04	175	Lindsay Frerichs	3		11	1
993	2015-04-06 03:40:38.905251-04	174	Jaime Flores Ruiz	3		11	1
994	2015-04-06 03:40:38.90644-04	173	Kathryn Filson	3		11	1
995	2015-04-06 03:40:38.907608-04	172	Elyse Everett	3		11	1
996	2015-04-06 03:40:38.908774-04	171	Vanessa Eulo	3		11	1
997	2015-04-06 03:40:38.909934-04	170	Kalen Dionne	3		11	1
998	2015-04-06 03:40:38.911085-04	169	Zachary Crees	3		11	1
999	2015-04-06 03:40:38.912298-04	168	John Ciotti	3		11	1
1000	2015-04-06 03:40:38.913668-04	167	Jeffrey Chung	3		11	1
1001	2015-04-06 03:40:38.91499-04	166	Christopher Chung	3		11	1
1002	2015-04-06 03:40:38.91618-04	165	Stephen Chi	3		11	1
1003	2015-04-06 03:40:38.917347-04	164	Rahul Chhana	3		11	1
1004	2015-04-06 03:40:38.918524-04	163	Puja Chebrolu	3		11	1
1005	2015-04-06 03:40:38.92025-04	162	Jeremy Brooks	3		11	1
1006	2015-04-06 03:40:38.921782-04	161	Margaret Blattner	3		11	1
1007	2015-04-06 03:40:38.923335-04	160	Wenners Ballard, III	3		11	1
1008	2015-04-06 03:40:38.924849-04	159	Brandi Baker	3		11	1
1009	2015-04-06 03:40:38.92608-04	158	Jordan Atkins	3		11	1
1010	2015-04-06 03:40:38.927264-04	157	Christina Anderson	3		11	1
1011	2015-04-06 03:43:54.133335-04	558	Yosafe Wakwaya	3		11	1
1012	2015-04-06 03:43:54.135894-04	557	Vaiibhav Patel	3		11	1
1013	2015-04-06 03:43:54.137297-04	556	Tokhanh Nguyen	3		11	1
1014	2015-04-06 03:43:54.138667-04	555	Timothy Brian Lumpkin	3		11	1
1015	2015-04-06 03:43:54.140309-04	554	Yevgeniy Khariton	3		11	1
1016	2015-04-06 03:43:54.141992-04	553	Shan Reddy	3		11	1
1017	2015-04-06 03:43:54.143302-04	552	Scott McHenry	3		11	1
1018	2015-04-06 03:43:54.144952-04	551	Sushma Jonna	3		11	1
1019	2015-04-06 03:43:54.152358-04	550	Stephen Hasak	3		11	1
1020	2015-04-06 03:43:54.159909-04	549	Scott Goldsmith	3		11	1
1021	2015-04-06 03:43:54.167069-04	548	Stacy Dai	3		11	1
1022	2015-04-06 03:43:54.17344-04	547	Pooja Koolwal	3		11	1
1023	2015-04-06 03:43:54.17541-04	546	Patricia Litkowski	3		11	1
1024	2015-04-06 03:43:54.177144-04	545	Nathan Moore	3		11	1
1025	2015-04-06 03:43:54.178621-04	544	Ningning Ma	3		11	1
1026	2015-04-06 03:43:54.179774-04	543	Michael Weaver	3		11	1
1027	2015-04-06 03:43:54.180957-04	542	Michael Hesseler	3		11	1
1028	2015-04-06 03:43:54.182601-04	541	Meghan Heberton	3		11	1
1029	2015-04-06 03:43:54.184403-04	540	Melissa DeFoe	3		11	1
1030	2015-04-06 03:43:54.185847-04	539	Li Zhou	3		11	1
1031	2015-04-06 03:43:54.186956-04	538	Lauren Levine	3		11	1
1032	2015-04-06 03:43:54.188095-04	537	Khoan Vu	3		11	1
1033	2015-04-06 03:43:54.189318-04	536	Kiran Mahmood	3		11	1
1034	2015-04-06 03:43:54.190493-04	535	Keerthi Karamched	3		11	1
1035	2015-04-06 03:43:54.191603-04	534	Justin Sheehy	3		11	1
1036	2015-04-06 03:43:54.19303-04	533	Jesus Jimenez	3		11	1
1037	2015-04-06 03:43:54.194726-04	532	Jonathan Chatzkel	3		11	1
1038	2015-04-06 03:43:54.19603-04	531	Ian Ross	3		11	1
1039	2015-04-06 03:43:54.197194-04	530	Indra Bole	3		11	1
1040	2015-04-06 03:43:54.19841-04	529	Happy Thakkar	3		11	1
1041	2015-04-06 03:43:54.19963-04	528	Gregory Ratti	3		11	1
1042	2015-04-06 03:43:54.200735-04	527	Grant Heberton	3		11	1
1043	2015-04-06 03:43:54.201863-04	526	Emily Steiner	3		11	1
1044	2015-04-06 03:43:54.202967-04	525	Dmitriy Breytman	3		11	1
1045	2015-04-06 03:43:54.204037-04	524	Christopher Rigell	3		11	1
1046	2015-04-06 03:43:54.205151-04	523	Chelsea Pearson	3		11	1
1047	2015-04-06 03:43:54.206263-04	522	Brian Pierce	3		11	1
1048	2015-04-06 03:43:54.207536-04	521	Brittne Halford	3		11	1
1049	2015-04-06 03:43:54.208661-04	520	Bahaa Bedair	3		11	1
1050	2015-04-06 03:43:54.210155-04	519	Ashish Rastogi	3		11	1
1051	2015-04-06 03:43:54.211876-04	518	Amrita Padda	3		11	1
1052	2015-04-06 03:43:54.213389-04	517	Andrew Michelson	3		11	1
1053	2015-04-06 03:43:54.214603-04	516	Adam Fledderman	3		11	1
1054	2015-04-06 03:43:54.215692-04	515	Yeshika Sharma	3		11	1
1055	2015-04-06 03:43:54.217044-04	514	Theodore Kim	3		11	1
1056	2015-04-06 03:43:54.218145-04	513	Tanya Devnani	3		11	1
1057	2015-04-06 03:43:54.219291-04	512	Samuel Reinhardt	3		11	1
1058	2015-04-06 03:43:54.220369-04	511	Steven Borson	3		11	1
1059	2015-04-06 03:43:54.221543-04	510	Raymond Fohtung	3		11	1
1060	2015-04-06 03:43:54.222741-04	509	Ramzi Abboud	3		11	1
1061	2015-04-06 03:43:54.223825-04	508	Peter Yen	3		11	1
1062	2015-04-06 03:43:54.225086-04	507	Patrick Grierson	3		11	1
1063	2015-04-06 03:43:54.226221-04	506	Philip Chu	3		11	1
1064	2015-04-06 03:43:54.227961-04	505	Niall Prendergast	3		11	1
1065	2015-04-06 03:43:54.230243-04	504	Neal Akhave	3		11	1
1066	2015-04-06 03:43:54.232244-04	503	Michael Tang	3		11	1
1067	2015-04-06 03:43:54.234156-04	502	Maanasi Samant	3		11	1
1068	2015-04-06 03:43:54.235948-04	501	Michael Paley	3		11	1
1069	2015-04-06 03:43:54.23756-04	500	Milan Kahanda	3		11	1
1070	2015-04-06 03:43:54.238943-04	499	Mate Gergely	3		11	1
1071	2015-04-06 03:43:54.240219-04	498	M. Phillip Fejleh	3		11	1
1072	2015-04-06 03:43:54.241411-04	497	Michael Biersmith	3		11	1
1073	2015-04-06 03:43:54.242555-04	496	Lela Ruck	3		11	1
1074	2015-04-06 03:43:54.243807-04	495	Yuan Yuan	3		11	1
1075	2015-04-06 03:43:54.245161-04	494	Josh Saef	3		11	1
1076	2015-04-06 03:43:54.252502-04	493	Jay Patel	3		11	1
1077	2015-04-06 03:43:54.260621-04	492	Jonathan Mizrahi	3		11	1
1078	2015-04-06 03:43:54.268962-04	491	Justin Maxfield	3		11	1
1079	2015-04-06 03:43:54.27266-04	490	Jessica Ma	3		11	1
1080	2015-04-06 03:43:54.275875-04	489	Jeff Friesen	3		11	1
1081	2015-04-06 03:43:54.277575-04	488	Jacqueline Chen	3		11	1
1082	2015-04-06 03:43:54.284024-04	487	Jason Chan	3		11	1
1083	2015-04-06 03:43:54.286086-04	486	Juan Calix	3		11	1
1084	2015-04-06 03:43:54.288098-04	485	Joseph Brancheck	3		11	1
1085	2015-04-06 03:43:54.292013-04	484	Jaimie Bolda	3		11	1
1086	2015-04-06 03:43:54.296059-04	483	Hirak Shah	3		11	1
1087	2015-04-06 03:43:54.298115-04	482	Farhan Quader	3		11	1
1088	2015-04-06 03:43:54.299687-04	481	Fizza Abbas	3		11	1
1089	2015-04-06 03:43:54.301336-04	480	Danicela Younce	3		11	1
1090	2015-04-06 03:43:54.303188-04	479	Derek Yee	3		11	1
1091	2015-04-06 03:43:54.305054-04	478	David Pham	3		11	1
1092	2015-04-06 03:43:54.308559-04	477	Dilan Patel	3		11	1
1093	2015-04-06 03:43:54.312294-04	476	Connor Woodland	3		11	1
1094	2015-04-06 03:43:54.314622-04	475	Catherine McCarthy	3		11	1
1095	2015-04-06 03:43:54.316703-04	474	Chien-Jung Lin	3		11	1
1096	2015-04-06 03:43:54.318853-04	473	Chris Jones	3		11	1
1097	2015-04-06 03:43:54.320766-04	472	Colin Diffie	3		11	1
1098	2015-04-06 03:43:54.323288-04	471	Ben Rogers	3		11	1
1099	2015-04-06 03:43:54.325483-04	470	Benjamin Kopecky	3		11	1
1100	2015-04-06 03:43:54.327775-04	469	Asrar Khan	3		11	1
1101	2015-04-06 03:43:54.329547-04	468	Alex Huh	3		11	1
1102	2015-04-06 03:43:54.331183-04	467	Amit Bery	3		11	1
1103	2015-04-06 03:43:54.334028-04	466	Diana Zhong	3		11	1
1104	2015-04-06 03:43:54.336046-04	465	Peter Zhao	3		11	1
1105	2015-04-06 03:43:54.337237-04	464	Anson Wilks	3		11	1
1106	2015-04-06 03:43:54.338324-04	463	Yan Wang	3		11	1
1107	2015-04-06 03:43:54.339497-04	462	Xiaowen Wang	3		11	1
1108	2015-04-06 03:43:54.341403-04	461	Jonathan Walter	3		11	1
1109	2015-04-06 03:43:54.343261-04	460	Ted Walker	3		11	1
1110	2015-04-06 03:43:54.344698-04	459	Stephanie Velloze	3		11	1
1111	2015-04-06 03:43:58.942497-04	458	AnnMarcia Tukpah	3		11	1
1112	2015-04-06 03:43:58.965212-04	457	Alex Thomas	3		11	1
1113	2015-04-06 03:43:58.971762-04	456	Fiona Strasserking	3		11	1
1114	2015-04-06 03:43:58.973467-04	455	Rachel Steinhorn	3		11	1
1115	2015-04-06 03:43:58.974763-04	454	Sheng Si	3		11	1
1116	2015-04-06 03:43:58.97596-04	453	Jason Romancik	3		11	1
1117	2015-04-06 03:43:58.977582-04	452	Anjali Rohatgi	3		11	1
1118	2015-04-06 03:43:58.97946-04	451	Desirai Rogan	3		11	1
1119	2015-04-06 03:43:58.980752-04	450	Arvind Rengarajan	3		11	1
1120	2015-04-06 03:43:58.982195-04	449	David Rawnsley	3		11	1
1121	2015-04-06 03:43:58.983626-04	448	Abdirahim Rashid	3		11	1
1122	2015-04-06 03:43:58.984773-04	447	Thomas Park	3		11	1
1123	2015-04-06 03:43:58.98585-04	446	Eze Okeagu	3		11	1
1124	2015-04-06 03:43:58.986911-04	445	Jonas Noe	3		11	1
1125	2015-04-06 03:43:58.987972-04	444	Vinaya Mulkareddy	3		11	1
1126	2015-04-06 03:43:58.989116-04	443	Ivan Mugisha	3		11	1
1127	2015-04-06 03:43:58.990307-04	442	Zachary Morgan	3		11	1
1128	2015-04-06 03:43:58.991431-04	441	Megan Mirkes	3		11	1
1129	2015-04-06 03:43:58.992494-04	440	Pauras Memon	3		11	1
1130	2015-04-06 03:43:58.99363-04	439	Christian McNeely	3		11	1
1131	2015-04-06 03:43:58.995262-04	438	Jordan Maryfield	3		11	1
1132	2015-04-06 03:43:58.996508-04	437	Laura Marks	3		11	1
1133	2015-04-06 03:43:58.997608-04	436	Jimmy Ma	3		11	1
1134	2015-04-06 03:43:58.999263-04	435	Jeremy Louissaint	3		11	1
1135	2015-04-06 03:43:59.000611-04	434	Han Li	3		11	1
1136	2015-04-06 03:43:59.001798-04	433	Timothy Kamerzell	3		11	1
1137	2015-04-06 03:43:59.002975-04	432	Michael Joshua Hendrix	3		11	1
1138	2015-04-06 03:43:59.004086-04	431	Ramon Jin	3		11	1
1139	2015-04-06 03:43:59.005158-04	430	Naomi Jiang	3		11	1
1140	2015-04-06 03:43:59.006162-04	429	Joyce Ji	3		11	1
1141	2015-04-06 03:43:59.007591-04	428	Nhila Jagadeesan	3		11	1
1142	2015-04-06 03:43:59.00874-04	427	Chi-Joan How	3		11	1
1143	2015-04-06 03:43:59.009953-04	426	Kirk Hou	3		11	1
1144	2015-04-06 03:43:59.011585-04	425	Alonso Heudebert	3		11	1
1145	2015-04-06 03:43:59.013064-04	424	Brett Herzog	3		11	1
1146	2015-04-06 03:43:59.014575-04	423	Martin Gregory	3		11	1
1147	2015-04-06 03:43:59.016167-04	422	Reece Goiffon	3		11	1
1148	2015-04-06 03:43:59.017317-04	421	Cassandra Fritz	3		11	1
1149	2015-04-06 03:43:59.018614-04	420	Lindsay Frerichs	3		11	1
1150	2015-04-06 03:43:59.019808-04	419	Jaime Flores Ruiz	3		11	1
1151	2015-04-06 03:43:59.020943-04	418	Kathryn Filson	3		11	1
1152	2015-04-06 03:43:59.022072-04	417	Elyse Everett	3		11	1
1153	2015-04-06 03:43:59.02317-04	416	Vanessa Eulo	3		11	1
1154	2015-04-06 03:43:59.024302-04	415	Kalen Dionne	3		11	1
1155	2015-04-06 03:43:59.025372-04	414	Zachary Crees	3		11	1
1156	2015-04-06 03:43:59.026501-04	413	John Ciotti	3		11	1
1157	2015-04-06 03:43:59.027712-04	412	Jeffrey Chung	3		11	1
1158	2015-04-06 03:43:59.029733-04	411	Christopher Chung	3		11	1
1159	2015-04-06 03:43:59.031837-04	410	Stephen Chi	3		11	1
1160	2015-04-06 03:43:59.033376-04	409	Rahul Chhana	3		11	1
1161	2015-04-06 03:43:59.034735-04	408	Puja Chebrolu	3		11	1
1162	2015-04-06 03:43:59.03636-04	407	Jeremy Brooks	3		11	1
1163	2015-04-06 03:43:59.037846-04	406	Margaret Blattner	3		11	1
1164	2015-04-06 03:43:59.039104-04	405	Wenners Ballard, III	3		11	1
1165	2015-04-06 03:43:59.040304-04	404	Brandi Baker	3		11	1
1166	2015-04-06 03:43:59.041513-04	403	Jordan Atkins	3		11	1
1167	2015-04-06 03:43:59.042616-04	402	Christina Anderson	3		11	1
1168	2015-04-06 03:43:59.043673-04	401	Jeff Friesen	3		11	1
1169	2015-04-06 03:43:59.045308-04	400	Jacqueline Chen	3		11	1
1170	2015-04-06 03:43:59.052757-04	399	Jason Chan	3		11	1
1171	2015-04-06 03:43:59.066326-04	398	Juan Calix	3		11	1
1172	2015-04-06 03:43:59.072596-04	397	Joseph Brancheck	3		11	1
1173	2015-04-06 03:43:59.074803-04	396	Jaimie Bolda	3		11	1
1174	2015-04-06 03:43:59.076973-04	395	Hirak Shah	3		11	1
1175	2015-04-06 03:43:59.078486-04	394	Farhan Quader	3		11	1
1176	2015-04-06 03:43:59.080089-04	393	Fizza Abbas	3		11	1
1177	2015-04-06 03:43:59.081574-04	392	Danicela Younce	3		11	1
1178	2015-04-06 03:43:59.083262-04	391	Derek Yee	3		11	1
1179	2015-04-06 03:43:59.084715-04	390	David Pham	3		11	1
1180	2015-04-06 03:43:59.08696-04	389	Dilan Patel	3		11	1
1181	2015-04-06 03:43:59.089358-04	388	Connor Woodland	3		11	1
1182	2015-04-06 03:43:59.091945-04	387	Catherine McCarthy	3		11	1
1183	2015-04-06 03:43:59.093294-04	386	Chien-Jung Lin	3		11	1
1184	2015-04-06 03:43:59.094584-04	385	Chris Jones	3		11	1
1185	2015-04-06 03:43:59.095819-04	384	Colin Diffie	3		11	1
1186	2015-04-06 03:43:59.097668-04	383	Ben Rogers	3		11	1
1187	2015-04-06 03:43:59.099966-04	382	Benjamin Kopecky	3		11	1
1188	2015-04-06 03:43:59.101552-04	381	Asrar Khan	3		11	1
1189	2015-04-06 03:43:59.102955-04	380	Alex Huh	3		11	1
1190	2015-04-06 03:43:59.1058-04	379	Amit Bery	3		11	1
1191	2015-04-06 03:43:59.108669-04	378	Diana Zhong	3		11	1
1192	2015-04-06 03:43:59.110959-04	377	Peter Zhao	3		11	1
1193	2015-04-06 03:43:59.112184-04	376	Anson Wilks	3		11	1
1194	2015-04-06 03:43:59.113642-04	375	Yan Wang	3		11	1
1195	2015-04-06 03:43:59.115935-04	374	Xiaowen Wang	3		11	1
1196	2015-04-06 03:43:59.117874-04	373	Jonathan Walter	3		11	1
1197	2015-04-06 03:43:59.119443-04	372	Ted Walker	3		11	1
1198	2015-04-06 03:43:59.122457-04	371	Stephanie Velloze	3		11	1
1199	2015-04-06 03:43:59.124784-04	370	AnnMarcia Tukpah	3		11	1
1200	2015-04-06 03:43:59.126866-04	369	Alex Thomas	3		11	1
1201	2015-04-06 03:43:59.1282-04	368	Fiona Strasserking	3		11	1
1202	2015-04-06 03:43:59.129838-04	367	Rachel Steinhorn	3		11	1
1203	2015-04-06 03:43:59.132155-04	366	Sheng Si	3		11	1
1204	2015-04-06 03:43:59.134336-04	365	Jason Romancik	3		11	1
1205	2015-04-06 03:43:59.136403-04	364	Anjali Rohatgi	3		11	1
1206	2015-04-06 03:43:59.140053-04	363	Desirai Rogan	3		11	1
1207	2015-04-06 03:43:59.145035-04	362	Arvind Rengarajan	3		11	1
1208	2015-04-06 03:43:59.152918-04	361	David Rawnsley	3		11	1
1209	2015-04-06 03:43:59.16005-04	360	Abdirahim Rashid	3		11	1
1210	2015-04-06 03:43:59.172459-04	359	Thomas Park	3		11	1
1211	2015-04-06 03:44:04.964605-04	358	Eze Okeagu	3		11	1
1212	2015-04-06 03:44:04.973264-04	357	Jonas Noe	3		11	1
1213	2015-04-06 03:44:04.977637-04	356	Vinaya Mulkareddy	3		11	1
1214	2015-04-06 03:44:04.979241-04	355	Ivan Mugisha	3		11	1
1215	2015-04-06 03:44:04.980515-04	354	Zachary Morgan	3		11	1
1216	2015-04-06 03:44:04.982051-04	353	Megan Mirkes	3		11	1
1217	2015-04-06 03:44:04.983308-04	352	Pauras Memon	3		11	1
1218	2015-04-06 03:44:04.984431-04	351	Christian McNeely	3		11	1
1219	2015-04-06 03:44:04.985567-04	350	Jordan Maryfield	3		11	1
1220	2015-04-06 03:44:04.986638-04	349	Laura Marks	3		11	1
1221	2015-04-06 03:44:04.988082-04	348	Jimmy Ma	3		11	1
1222	2015-04-06 03:44:04.989632-04	347	Jeremy Louissaint	3		11	1
1223	2015-04-06 03:44:04.990911-04	346	Han Li	3		11	1
1224	2015-04-06 03:44:04.992473-04	345	Timothy Kamerzell	3		11	1
1225	2015-04-06 03:44:04.994147-04	344	Michael Joshua Hendrix	3		11	1
1226	2015-04-06 03:44:04.995325-04	343	Ramon Jin	3		11	1
1227	2015-04-06 03:44:04.996426-04	342	Naomi Jiang	3		11	1
1228	2015-04-06 03:44:04.997777-04	341	Joyce Ji	3		11	1
1229	2015-04-06 03:44:04.999555-04	340	Nhila Jagadeesan	3		11	1
1230	2015-04-06 03:44:05.000796-04	339	Chi-Joan How	3		11	1
1231	2015-04-06 03:44:05.001902-04	338	Kirk Hou	3		11	1
1232	2015-04-06 03:44:05.00297-04	337	Alonso Heudebert	3		11	1
1233	2015-04-06 03:44:05.004031-04	336	Brett Herzog	3		11	1
1234	2015-04-06 03:44:05.005094-04	335	Martin Gregory	3		11	1
1235	2015-04-06 03:44:05.006205-04	334	Reece Goiffon	3		11	1
1236	2015-04-06 03:44:05.007262-04	333	Cassandra Fritz	3		11	1
1237	2015-04-06 03:44:05.008725-04	332	Lindsay Frerichs	3		11	1
1238	2015-04-06 03:44:05.010246-04	331	Jaime Flores Ruiz	3		11	1
1239	2015-04-06 03:44:05.011361-04	330	Kathryn Filson	3		11	1
1240	2015-04-06 03:44:05.012425-04	329	Elyse Everett	3		11	1
1241	2015-04-06 03:44:05.013489-04	328	Vanessa Eulo	3		11	1
1242	2015-04-06 03:44:05.014666-04	327	Kalen Dionne	3		11	1
1243	2015-04-06 03:44:05.015968-04	326	Zachary Crees	3		11	1
1244	2015-04-06 03:44:05.01714-04	325	John Ciotti	3		11	1
1245	2015-04-06 03:44:05.018269-04	324	Jeffrey Chung	3		11	1
1246	2015-04-06 03:44:05.01949-04	323	Christopher Chung	3		11	1
1247	2015-04-06 03:44:05.020654-04	322	Stephen Chi	3		11	1
1248	2015-04-06 03:44:05.021768-04	321	Rahul Chhana	3		11	1
1249	2015-04-06 03:44:05.023114-04	320	Puja Chebrolu	3		11	1
1250	2015-04-06 03:44:05.024583-04	319	Jeremy Brooks	3		11	1
1251	2015-04-06 03:44:05.025794-04	318	Margaret Blattner	3		11	1
1252	2015-04-06 03:44:05.026875-04	317	Wenners Ballard, III	3		11	1
1253	2015-04-06 03:44:05.027941-04	316	Brandi Baker	3		11	1
1254	2015-04-06 03:44:05.029061-04	315	Jordan Atkins	3		11	1
1255	2015-04-06 03:44:05.030215-04	314	Christina Anderson	3		11	1
1256	2015-04-06 03:44:36.437931-04	647	Jessica Ma	2	Changed tracks.	11	1
1257	2015-04-06 03:45:04.394854-04	673	Adam Fledderman	2	Changed tracks.	11	1
1258	2015-04-06 03:45:16.749859-04	675	Amrita Padda	2	Changed tracks.	11	1
1259	2015-04-06 03:45:26.332882-04	676	Ashish Rastogi	2	Changed tracks.	11	1
1260	2015-04-06 03:45:55.02947-04	679	Brian Pierce	2	Changed tracks.	11	1
1261	2015-04-06 03:46:07.006978-04	680	Chelsea Pearson	2	Changed tracks.	11	1
1262	2015-04-06 03:46:17.169403-04	681	Christopher Rigell	2	Changed tracks.	11	1
1263	2015-04-06 03:46:32.277881-04	688	Ian Ross	2	Changed tracks.	11	1
1264	2015-04-06 03:46:51.980855-04	691	Justin Sheehy	2	Changed tracks.	11	1
1265	2015-04-06 03:46:57.288126-04	695	Lauren Levine	2	Changed tracks.	11	1
1266	2015-04-06 03:47:05.91382-04	698	Meghan Heberton	2	Changed tracks.	11	1
1267	2015-04-06 03:47:15.928028-04	704	Pooja Koolwal	2	Changed tracks.	11	1
1268	2015-04-06 03:47:25.482146-04	706	Scott Goldsmith	2	Changed tracks.	11	1
1269	2015-04-06 03:47:36.864852-04	715	Yosafe Wakwaya	2	Changed tracks.	11	1
1270	2015-04-06 03:50:17.108505-04	675	Amrita Padda	2	Changed resExcludedBlocks.	11	1
1271	2015-04-06 03:50:44.094323-04	680	Chelsea Pearson	2	Changed resExcludedBlocks.	11	1
1272	2015-04-06 03:51:19.02896-04	682	Dmitriy Breytman	2	Changed resExcludedBlocks.	11	1
1273	2015-04-06 03:52:17.462543-04	3	CSTAR	2	Changed excludedBlocks.	9	1
1274	2015-04-06 03:52:46.006459-04	675	Amrita Padda	2	No fields changed.	11	1
1275	2015-04-06 03:53:02.496788-04	6	VACR (second part)	3		9	1
1276	2015-04-06 03:56:31.144082-04	3	CSTAR	2	Changed excludedBlocks.	9	1
1277	2015-04-06 03:56:37.20576-04	4	VACR	2	No fields changed.	9	1
1278	2015-04-06 03:57:32.654105-04	5	Primary Care	2	Changed excludedBlocks.	9	1
1279	2015-04-06 03:57:45.275517-04	675	Amrita Padda	2	No fields changed.	11	1
1280	2015-04-06 03:58:37.710358-04	680	Chelsea Pearson	2	Changed resExcludedBlocks.	11	1
1281	2015-04-06 03:58:55.189412-04	682	Dmitriy Breytman	2	Changed resExcludedBlocks.	11	1
1282	2015-04-06 03:59:27.561742-04	679	Brian Pierce	2	Changed resExcludedBlocks.	11	1
1283	2015-04-06 04:00:00.003141-04	681	Christopher Rigell	2	Changed resExcludedBlocks.	11	1
1284	2015-04-06 04:01:14.500221-04	260		3		7	1
1285	2015-04-06 04:03:00.039015-04	204	All_Imm	2	Added rotation length "RotationLength object". Added rotation length "RotationLength object".	7	1
1286	2015-04-06 04:03:44.676159-04	205	AMBJAR	2	Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added year demand "YearDemand object". Added year demand "YearDemand object".	7	1
1287	2015-04-06 04:04:33.527177-04	206	AMB	2	Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added year demand "YearDemand object". Added year demand "YearDemand object".	7	1
1288	2015-04-06 04:06:26.915489-04	207	Asthma (WC)	2	Added rotation length "RotationLength object". Added rotation length "RotationLength object".	7	1
1289	2015-04-06 04:06:57.256691-04	209	BMT	2	Added rotation length "RotationLength object". Added rotation length "RotationLength object".	7	1
1290	2015-04-06 04:07:14.231529-04	208	Medicine consults	2	Added rotation length "RotationLength object". Added rotation length "RotationLength object".	7	1
1291	2015-04-06 04:07:41.69817-04	209	BMT	2	Added year demand "YearDemand object".	7	1
1292	2015-04-06 04:08:16.543988-04	210	CAER	2	Added rotation length "RotationLength object". Added rotation length "RotationLength object".	7	1
1293	2015-04-06 04:08:52.965668-04	211	CARDS FIRM	2	Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added year demand "YearDemand object".	7	1
1294	2015-04-06 04:09:22.822173-04	4	YearSet object	1		40	1
1295	2015-04-06 04:09:50.775634-04	4	YearSet object	2	Added set year demand "SetYearDemand object".	40	1
1296	2015-04-06 04:10:54.039373-04	4	YearSet object	2	Added set year demand "SetYearDemand object". Added set year demand "SetYearDemand object". Added set year demand "SetYearDemand object". Added set year demand "SetYearDemand object". Added set year demand "SetYearDemand object". Added set year demand "SetYearDemand object".	40	1
1297	2015-04-06 04:11:55.093986-04	212	Cards NF	2	Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added year demand "YearDemand object".	7	1
1298	2015-04-06 04:17:02.154814-04	6	Four-week	2	Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object".	12	1
1299	2015-04-06 04:20:38.388341-04	6	Four-week	2	Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object".	12	1
1300	2015-04-06 04:28:26.735984-04	7	Three-week	2	Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object". Added rotation length "RotationLength object".	12	1
1301	2015-04-06 04:33:33.294302-04	1	PGY1	2	Changed requiredRotations. Added education req "EducationReq object". Added year demand "YearDemand object". Added year demand "YearDemand object". Added year demand "YearDemand object". Added year demand "YearDemand object". Added year demand "YearDemand object". Added year demand "YearDemand object". Added year demand "YearDemand object". Added year demand "YearDemand object". Added year demand "YearDemand object". Added year demand "YearDemand object". Added year demand "YearDemand object". Added year demand "YearDemand object".	8	1
1302	2015-04-06 04:37:15.320993-04	1	PGY1	2	Changed requiredRotations. Added year demand "YearDemand object". Changed maxResidents for year demand "YearDemand object". Changed maxResidents for year demand "YearDemand object".	8	1
1303	2015-04-06 04:39:18.668821-04	2	PGY2	2	Changed requiredRotations. Added year demand "YearDemand object". Added year demand "YearDemand object". Added year demand "YearDemand object". Added year demand "YearDemand object". Added year demand "YearDemand object". Added year demand "YearDemand object". Added year demand "YearDemand object".	8	1
1304	2015-04-06 04:41:05.020835-04	3	PGY3	2	Changed requiredRotations. Added education req "EducationReq object". Added education req "EducationReq object". Added year demand "YearDemand object". Added year demand "YearDemand object". Added year demand "YearDemand object". Added year demand "YearDemand object".	8	1
1305	2015-04-06 04:41:26.539372-04	4	YearSet object	2	No fields changed.	40	1
1306	2015-04-06 04:43:10.371643-04	1	PGY1	2	Changed rotationDemand. Added year demand "YearDemand object".	8	1
1307	2015-04-06 04:44:08.516144-04	2	PGY2	2	Changed maxLength for education req "EducationReq object".	8	1
1308	2015-04-06 04:44:20.544641-04	3	PGY3	2	Changed requiredRotations. Changed maxLength for education req "EducationReq object".	8	1
1309	2015-04-06 04:45:44.189117-04	7	Neuro Prelim	1		9	1
1310	2015-04-06 04:45:50.39524-04	8	Prelim	1		9	1
1311	2015-04-06 04:47:09.245321-04	8	Prelim	2	Changed trackEducationReq_maxLength for track education req "TrackEducationReq object".	9	1
1312	2015-04-06 04:51:10.577862-04	583	Kirk Hou	2	Changed vacationStart1.	11	1
1313	2015-04-06 05:11:49.593089-04	259	Vacation	2	Added rotation length "RotationLength object".	7	1
1314	2015-04-06 05:12:02.140007-04	258	Variety NF	2	No fields changed.	7	1
1315	2015-04-06 05:12:12.358842-04	257	VACR	2	No fields changed.	7	1
1316	2015-04-06 11:24:09.221708-04	611	Sheng Si	2	No fields changed.	11	1
1317	2015-04-06 11:24:42.460103-04	65	2016-06-05 to 2016-06-25, Template_2	3		16	1
1318	2015-04-06 11:24:42.464867-04	64	2016-05-08 to 2016-06-04, Template_2	3		16	1
1319	2015-04-06 11:24:42.46724-04	63	2016-04-10 to 2016-05-07, Template_2	3		16	1
1320	2015-04-06 11:24:42.468901-04	62	2016-03-13 to 2016-04-09, Template_2	3		16	1
1321	2015-04-06 11:24:42.470365-04	61	2016-02-14 to 2016-03-12, Template_2	3		16	1
1322	2015-04-06 11:24:42.471676-04	60	2016-01-17 to 2016-02-13, Template_2	3		16	1
1323	2015-04-06 11:24:42.472928-04	59	2015-12-27 to 2016-01-16, Template_2	3		16	1
1324	2015-04-06 11:24:42.474312-04	46	2016-06-05 to 2016-06-25, Template_1	3		16	1
1325	2015-04-06 11:24:42.47569-04	45	2016-05-08 to 2016-06-04, Template_1	3		16	1
1326	2015-04-06 11:24:42.476872-04	44	2016-04-10 to 2016-05-07, Template_1	3		16	1
1327	2015-04-06 11:24:42.478054-04	43	2016-03-13 to 2016-04-09, Template_1	3		16	1
1328	2015-04-06 11:24:42.479358-04	42	2016-02-14 to 2016-03-12, Template_1	3		16	1
1329	2015-04-06 11:24:42.48073-04	41	2016-01-17 to 2016-02-13, Template_1	3		16	1
1330	2015-04-06 11:24:42.481879-04	40	2015-12-27 to 2016-01-16, Template_1	3		16	1
1331	2015-04-06 11:28:32.126098-04	583	Kirk Hou	2	Changed vacationStart1.	11	1
1332	2015-04-06 11:29:35.263214-04	1	Barnes Jewish Internal Medicine	2	Changed endDate.	10	1
1333	2015-04-06 11:38:31.048665-04	58	2015-12-06 to 2015-12-26, Template_2	3		16	1
1334	2015-04-06 11:38:31.053409-04	57	2015-11-08 to 2015-12-05, Template_2	3		16	1
1335	2015-04-06 11:38:31.055346-04	56	2015-10-11 to 2015-11-07, Template_2	3		16	1
1336	2015-04-06 11:38:31.056993-04	39	2015-12-06 to 2015-12-26, Template_1	3		16	1
1337	2015-04-06 11:38:31.058872-04	38	2015-11-08 to 2015-12-05, Template_1	3		16	1
1338	2015-04-06 11:38:31.060547-04	37	2015-10-11 to 2015-11-07, Template_1	3		16	1
1339	2015-04-06 11:38:43.040096-04	1	Barnes Jewish Internal Medicine	2	Changed endDate.	10	1
1340	2015-04-06 11:44:18.754565-04	679	Brian Pierce	3		11	1
1341	2015-04-06 11:48:56.209967-04	1	PGY1	2	No fields changed.	8	1
1342	2015-04-06 11:49:07.025805-04	2	PGY2	2	Changed requiredRotations.	8	1
1343	2015-04-06 11:49:33.588058-04	3	PGY3	2	Changed requiredRotations.	8	1
1344	2015-04-06 11:52:00.727358-04	4	YearSet object	2	Changed setYearDemand_minResidents and setYearDemand_maxResidents for set year demand "SetYearDemand object". Changed setYearDemand_maxResidents for set year demand "SetYearDemand object". Changed setYearDemand_maxResidents for set year demand "SetYearDemand object". Changed setYearDemand_maxResidents for set year demand "SetYearDemand object". Changed setYearDemand_minResidents and setYearDemand_maxResidents for set year demand "SetYearDemand object". Changed setYearDemand_minResidents and setYearDemand_maxResidents for set year demand "SetYearDemand object". Changed setYearDemand_maxResidents for set year demand "SetYearDemand object". Changed setYearDemand_maxResidents for set year demand "SetYearDemand object".	40	1
1345	2015-04-06 11:58:00.505545-04	55	2015-09-13 to 2015-10-10, Template_2	3		16	1
1346	2015-04-06 11:58:00.510548-04	54	2015-08-16 to 2015-09-12, Template_2	3		16	1
1347	2015-04-06 11:58:00.512359-04	53	2015-07-19 to 2015-08-15, Template_2	3		16	1
1348	2015-04-06 11:58:00.513731-04	27	2015-09-13 to 2015-10-10, Template_1	3		16	1
1349	2015-04-06 11:58:00.515018-04	26	2015-08-16 to 2015-09-12, Template_1	3		16	1
1350	2015-04-06 11:58:00.51629-04	25	2015-07-19 to 2015-08-15, Template_1	3		16	1
1351	2015-04-06 11:58:30.619548-04	1	Barnes Jewish Internal Medicine	2	Changed endDate, minClinicWeeks and windowSize.	10	1
1352	2015-04-06 12:00:30.835401-04	680	Chelsea Pearson	3		11	1
1353	2015-04-06 12:16:50.441788-04	578	Schedule9	3		13	1
1354	2015-04-06 12:16:50.447177-04	577	Schedule8	3		13	1
1355	2015-04-06 12:16:50.449386-04	576	Schedule7	3		13	1
1356	2015-04-06 12:16:50.451211-04	575	Schedule6	3		13	1
1357	2015-04-06 12:16:50.453517-04	574	Schedule5	3		13	1
1358	2015-04-06 12:16:50.455339-04	573	Schedule4	3		13	1
1359	2015-04-06 12:16:50.457082-04	572	Schedule3	3		13	1
1360	2015-04-06 12:16:50.458526-04	571	Schedule1	3		13	1
1361	2015-04-06 12:26:04.370244-04	257	VACR	3		7	1
1362	2015-04-06 12:26:04.375691-04	231	MEDICAL LEAVE	3		7	1
1363	2015-04-06 12:26:04.380584-04	228	MATERNITY	3		7	1
1364	2015-04-06 12:26:04.384706-04	217	CSTAR	3		7	1
1365	2015-04-06 12:26:04.391669-04	215	CHIEF RES PREP	3		7	1
1366	2015-04-06 12:26:25.989209-04	1	Barnes Jewish Internal Medicine	2	Changed endDate, minClinicWeeks and windowSize.	10	1
1367	2015-04-06 12:27:02.723972-04	66	2015-07-19 to 2015-08-15, Template_1	1		16	1
1368	2015-04-06 12:27:37.259229-04	67	2015-07-19 to 2015-08-15, Template_2	1		16	1
1369	2015-04-06 12:34:48.61204-04	715	Yosafe Wakwaya	3		11	1
1370	2015-04-06 12:34:48.616498-04	714	Vaiibhav Patel	3		11	1
1371	2015-04-06 12:34:48.618195-04	713	Tokhanh Nguyen	3		11	1
1372	2015-04-06 12:34:48.619673-04	712	Timothy Brian Lumpkin	3		11	1
1373	2015-04-06 12:34:48.621057-04	711	Yevgeniy Khariton	3		11	1
1374	2015-04-06 12:34:48.622835-04	710	Shan Reddy	3		11	1
1375	2015-04-06 12:34:48.624722-04	709	Scott McHenry	3		11	1
1376	2015-04-06 12:34:48.626211-04	708	Sushma Jonna	3		11	1
1377	2015-04-06 12:34:48.627442-04	707	Stephen Hasak	3		11	1
1378	2015-04-06 12:34:48.628629-04	706	Scott Goldsmith	3		11	1
1379	2015-04-06 12:34:48.629761-04	705	Stacy Dai	3		11	1
1380	2015-04-06 12:34:48.630897-04	704	Pooja Koolwal	3		11	1
1381	2015-04-06 12:34:48.632165-04	703	Patricia Litkowski	3		11	1
1382	2015-04-06 12:34:48.633548-04	702	Nathan Moore	3		11	1
1383	2015-04-06 12:34:48.634777-04	701	Ningning Ma	3		11	1
1384	2015-04-06 12:34:48.635949-04	700	Michael Weaver	3		11	1
1385	2015-04-06 12:34:48.637083-04	699	Michael Hesseler	3		11	1
1386	2015-04-06 12:34:48.638211-04	698	Meghan Heberton	3		11	1
1387	2015-04-06 12:34:48.639331-04	697	Melissa DeFoe	3		11	1
1388	2015-04-06 12:34:48.640672-04	696	Li Zhou	3		11	1
1389	2015-04-06 12:34:48.642072-04	695	Lauren Levine	3		11	1
1390	2015-04-06 12:34:48.643438-04	694	Khoan Vu	3		11	1
1391	2015-04-06 12:34:48.644674-04	672	Yeshika Sharma	3		11	1
1392	2015-04-06 12:34:48.646287-04	671	Theodore Kim	3		11	1
1393	2015-04-06 12:34:48.647961-04	670	Tanya Devnani	3		11	1
1394	2015-04-06 12:34:48.64924-04	669	Samuel Reinhardt	3		11	1
1395	2015-04-06 12:34:48.650696-04	668	Steven Borson	3		11	1
1396	2015-04-06 12:34:48.652085-04	667	Raymond Fohtung	3		11	1
1397	2015-04-06 12:34:48.65339-04	666	Ramzi Abboud	3		11	1
1398	2015-04-06 12:34:48.654448-04	665	Peter Yen	3		11	1
1399	2015-04-06 12:34:48.655867-04	664	Patrick Grierson	3		11	1
1400	2015-04-06 12:34:48.656916-04	663	Philip Chu	3		11	1
1401	2015-04-06 12:34:48.658306-04	662	Niall Prendergast	3		11	1
1402	2015-04-06 12:34:48.65962-04	661	Neal Akhave	3		11	1
1403	2015-04-06 12:34:48.660728-04	660	Michael Tang	3		11	1
1404	2015-04-06 12:34:48.662133-04	659	Maanasi Samant	3		11	1
1405	2015-04-06 12:34:48.663522-04	658	Michael Paley	3		11	1
1406	2015-04-06 12:34:48.664694-04	657	Milan Kahanda	3		11	1
1407	2015-04-06 12:34:48.66595-04	656	Mate Gergely	3		11	1
1408	2015-04-06 12:34:48.667785-04	655	M. Phillip Fejleh	3		11	1
1409	2015-04-06 12:34:48.669637-04	654	Michael Biersmith	3		11	1
1410	2015-04-06 12:34:48.671029-04	653	Lela Ruck	3		11	1
1411	2015-04-06 12:34:48.672322-04	652	Yuan Yuan	3		11	1
1412	2015-04-06 12:34:48.674061-04	651	Josh Saef	3		11	1
1413	2015-04-06 12:34:48.675873-04	650	Jay Patel	3		11	1
1414	2015-04-06 12:34:48.677107-04	649	Jonathan Mizrahi	3		11	1
1415	2015-04-06 12:34:48.678287-04	648	Justin Maxfield	3		11	1
1416	2015-04-06 12:34:48.679426-04	647	Jessica Ma	3		11	1
1417	2015-04-06 12:34:48.680632-04	646	Jeff Friesen	3		11	1
1418	2015-04-06 12:34:48.681926-04	645	Jacqueline Chen	3		11	1
1419	2015-04-06 12:34:48.683355-04	623	Diana Zhong	3		11	1
1420	2015-04-06 12:34:48.685318-04	622	Peter Zhao	3		11	1
1421	2015-04-06 12:34:48.686959-04	621	Anson Wilks	3		11	1
1422	2015-04-06 12:34:48.688075-04	620	Yan Wang	3		11	1
1423	2015-04-06 12:34:48.689126-04	619	Xiaowen Wang	3		11	1
1424	2015-04-06 12:34:48.690191-04	618	Jonathan Walter	3		11	1
1425	2015-04-06 12:34:48.691327-04	617	Ted Walker	3		11	1
1426	2015-04-06 12:34:48.692485-04	616	Stephanie Velloze	3		11	1
1427	2015-04-06 12:34:48.69363-04	615	AnnMarcia Tukpah	3		11	1
1428	2015-04-06 12:34:48.694803-04	614	Alex Thomas	3		11	1
1429	2015-04-06 12:38:04.200302-04	613	Fiona Strasserking	3		11	1
1430	2015-04-06 12:38:04.203951-04	612	Rachel Steinhorn	3		11	1
1431	2015-04-06 12:38:04.205391-04	611	Sheng Si	3		11	1
1432	2015-04-06 12:38:04.20669-04	610	Jason Romancik	3		11	1
1433	2015-04-06 12:38:04.208238-04	609	Anjali Rohatgi	3		11	1
1434	2015-04-06 12:38:04.20973-04	608	Desirai Rogan	3		11	1
1435	2015-04-06 12:38:04.211065-04	607	Arvind Rengarajan	3		11	1
1436	2015-04-06 12:38:04.2124-04	606	David Rawnsley	3		11	1
1437	2015-04-06 12:38:04.214734-04	605	Abdirahim Rashid	3		11	1
1438	2015-04-06 12:38:04.216052-04	604	Thomas Park	3		11	1
1439	2015-04-06 12:40:00.291912-04	603	Eze Okeagu	3		11	1
1440	2015-04-06 12:40:00.297232-04	602	Jonas Noe	3		11	1
1441	2015-04-06 12:40:00.298807-04	601	Vinaya Mulkareddy	3		11	1
1442	2015-04-06 12:40:00.300072-04	600	Ivan Mugisha	3		11	1
1443	2015-04-06 12:40:00.301997-04	599	Zachary Morgan	3		11	1
1444	2015-04-06 12:40:00.303632-04	598	Megan Mirkes	3		11	1
1445	2015-04-06 12:40:00.305167-04	597	Pauras Memon	3		11	1
1446	2015-04-06 12:40:00.306415-04	596	Christian McNeely	3		11	1
1447	2015-04-06 12:40:00.307591-04	595	Jordan Maryfield	3		11	1
1448	2015-04-06 12:40:00.308794-04	594	Laura Marks	3		11	1
1449	2015-04-06 12:54:53.671777-04	1	Barnes Jewish Internal Medicine	2	Changed endDate, minClinicWeeks and windowSize.	10	1
1450	2015-04-06 12:55:06.528629-04	67	2015-07-19 to 2015-08-15, Template_2	3		16	1
1451	2015-04-06 12:55:06.532091-04	66	2015-07-19 to 2015-08-15, Template_1	3		16	1
1452	2015-04-06 13:52:14.398227-04	582	Schedule 1	2	Changed name.	13	1
1453	2015-04-06 13:52:18.646933-04	583	Schedule 3	2	Changed name.	13	1
1454	2015-04-06 13:52:22.60261-04	584	Schedule 4	2	Changed name.	13	1
1455	2015-04-06 13:52:26.586526-04	585	Schedule 5	2	Changed name.	13	1
1456	2015-04-08 17:08:33.676086-04	24	2015-07-19 to 2015-08-15, Template_1	2	Changed blockStartDate and blockEndDate.	16	1
1457	2015-04-08 17:08:43.926278-04	52	2015-07-19 to 2015-08-15, Template_2	2	Changed blockStartDate and blockEndDate.	16	1
1458	2015-04-08 17:09:00.146789-04	1	Barnes Jewish Internal Medicine	2	Changed startDate and endDate.	10	1
1459	2015-04-08 19:35:43.874303-04	1	Barnes Jewish Internal Medicine	2	Changed startDate.	10	1
1460	2015-04-08 19:36:05.1411-04	68	2015-06-21 to 2015-07-18, Template_1	1		16	1
1461	2015-04-08 19:36:17.878412-04	69	2015-06-21 to 2015-07-18, Template_2	1		16	1
1462	2015-04-08 20:19:34.344393-04	1	Barnes Jewish Internal Medicine	2	Changed endDate.	10	1
1463	2015-04-08 20:20:16.05074-04	70	2015-08-16 to 2015-09-12, Template_1	1		16	1
1464	2015-04-08 20:20:30.417326-04	71	2015-08-16 to 2015-09-12, Template_2	1		16	1
1465	2015-04-13 15:24:57.469193-04	250	READ	3		7	1
1466	2015-04-13 15:27:34.260013-04	4	YearSet object	2	Changed setYearDemand_minResidents and setYearDemand_maxResidents for set year demand "SetYearDemand object". Changed setYearDemand_maxResidents for set year demand "SetYearDemand object". Changed setYearDemand_maxResidents for set year demand "SetYearDemand object". Changed setYearDemand_maxResidents for set year demand "SetYearDemand object". Changed setYearDemand_minResidents and setYearDemand_maxResidents for set year demand "SetYearDemand object". Changed setYearDemand_minResidents and setYearDemand_maxResidents for set year demand "SetYearDemand object". Changed setYearDemand_maxResidents for set year demand "SetYearDemand object". Changed setYearDemand_maxResidents for set year demand "SetYearDemand object".	40	1
1467	2015-04-13 15:34:08.898545-04	1	Barnes Jewish Internal Medicine	2	Changed endDate.	10	1
1468	2015-04-13 15:34:24.678442-04	71	2015-08-16 to 2015-09-12, Template_2	3		16	1
1469	2015-04-13 15:34:24.68343-04	70	2015-08-16 to 2015-09-12, Template_1	3		16	1
1470	2015-04-13 15:34:24.685652-04	52	2015-07-19 to 2015-08-15, Template_2	3		16	1
1471	2015-04-13 15:34:24.687657-04	24	2015-07-19 to 2015-08-15, Template_1	3		16	1
1472	2015-04-13 15:43:07.348552-04	1	Barnes Jewish Internal Medicine	2	Changed endDate.	10	1
1473	2015-04-13 15:43:33.708821-04	72	2015-07-19 to 2015-08-15, Template_1	1		16	1
1474	2015-04-13 15:43:39.218453-04	72	2015-07-19 to 2015-08-15, Template_1	2	No fields changed.	16	1
1475	2015-04-13 15:43:57.484827-04	73	2015-07-19 to 2015-08-15, Template_2	1		16	1
1476	2015-04-13 15:44:13.057915-04	1	Barnes Jewish Internal Medicine	2	Changed minClinicWeeks and windowSize.	10	1
1477	2015-04-13 15:49:42.35286-04	1	Barnes Jewish Internal Medicine	2	Changed minClinicWeeks and windowSize.	10	1
1478	2015-04-13 16:18:20.244327-04	1	Barnes Jewish Internal Medicine	2	Changed endDate.	10	1
1479	2015-04-13 16:18:43.334962-04	74	2015-08-16 to 2015-09-12, Template_1	1		16	1
1480	2015-04-13 16:18:55.591124-04	75	2015-08-16 to 2015-09-12, Template_2	1		16	1
1481	2015-04-13 17:16:35.90708-04	1	Barnes Jewish Internal Medicine	2	Changed minClinicWeeks and windowSize.	10	1
1482	2015-04-13 17:35:01.593007-04	1	Barnes Jewish Internal Medicine	2	Changed endDate and windowSize.	10	1
1483	2015-04-13 17:35:18.926252-04	75	2015-08-16 to 2015-09-12, Template_2	3		16	1
1484	2015-04-13 17:35:18.929375-04	74	2015-08-16 to 2015-09-12, Template_1	3		16	1
1485	2015-04-13 17:35:18.931605-04	73	2015-07-19 to 2015-08-15, Template_2	3		16	1
1486	2015-04-13 17:35:18.93352-04	72	2015-07-19 to 2015-08-15, Template_1	3		16	1
1487	2015-04-13 17:36:27.306301-04	1	Barnes Jewish Internal Medicine	2	Changed windowSize.	10	1
1488	2015-04-13 17:37:21.559487-04	1	Barnes Jewish Internal Medicine	2	Changed minClinicWeeks.	10	1
1489	2015-04-13 17:39:28.481306-04	1	Barnes Jewish Internal Medicine	2	Changed minClinicWeeks and windowSize.	10	1
1490	2015-04-13 22:31:12.996756-04	1	Barnes Jewish Internal Medicine	2	Changed minClinicWeeks and windowSize.	10	1
1491	2015-04-13 22:31:19.192755-04	1	Barnes Jewish Internal Medicine	2	Changed endDate.	10	1
1492	2015-04-13 22:31:40.056026-04	76	2015-07-19 to 2015-08-15, Template_1	1		16	1
1493	2015-04-13 22:32:08.722709-04	77	2015-07-19 to 2015-08-15, Template_2	1		16	1
1494	2015-04-14 16:57:53.375444-04	216	Clinic	2	Changed maxResidents.	7	1
1495	2015-04-14 17:21:33.246409-04	206	AMB	2	Changed minLength and maxLength for education req "EducationReq object". Changed maxLength for education req "EducationReq object". Changed maxLength for education req "EducationReq object".	7	1
1496	2015-04-14 17:31:52.972569-04	206	AMB	2	No fields changed.	7	1
1497	2015-04-14 17:46:30.681773-04	1	PGY1	2	Changed maxLength for education req "EducationReq object". Changed maxLength for education req "EducationReq object". Added year demand "YearDemand object". Changed minResidents and maxResidents for year demand "YearDemand object". Changed minResidents and maxResidents for year demand "YearDemand object". Changed minResidents and maxResidents for year demand "YearDemand object". Changed minResidents and maxResidents for year demand "YearDemand object". Changed minResidents and maxResidents for year demand "YearDemand object". Changed minResidents and maxResidents for year demand "YearDemand object". Changed minResidents and maxResidents for year demand "YearDemand object". Changed minResidents and maxResidents for year demand "YearDemand object". Changed minResidents and maxResidents for year demand "YearDemand object". Changed minResidents and maxResidents for year demand "YearDemand object". Changed minResidents and maxResidents for year demand "YearDemand object". Changed minResidents and maxResidents for year demand "YearDemand object". Changed minResidents and maxResidents for year demand "YearDemand object".	8	1
1498	2015-04-14 17:46:57.727044-04	1	PGY1	2	Changed requiredRotations and rotationDemand. Changed maxLength for education req "EducationReq object".	8	1
1499	2015-04-14 17:47:08.17161-04	3	PGY3	2	Changed maxLength for education req "EducationReq object".	8	1
1500	2015-04-14 18:04:03.483411-04	261	4th NF	1		7	1
1501	2015-04-14 18:04:48.111627-04	1	PGY1	2	Changed requiredRotations. Changed maxLength for education req "EducationReq object".	8	1
1502	2015-04-14 18:05:17.627581-04	209	BMT	2	No fields changed.	7	1
1503	2015-04-14 18:05:44.172777-04	211	CARDS FIRM	2	Changed minResidents and maxResidents for year demand "YearDemand object".	7	1
1504	2015-04-14 18:05:51.821616-04	211	CARDS FIRM	2	No fields changed.	7	1
1505	2015-04-14 18:06:29.357155-04	206	AMB	2	Changed maxLength for education req "EducationReq object".	7	1
1506	2015-04-14 18:07:31.747724-04	212	Cards NF	2	Added year demand "YearDemand object". Added year demand "YearDemand object". Changed minResidents and maxResidents for year demand "YearDemand object".	7	1
1507	2015-04-14 18:08:20.710399-04	214	CCU	2	Changed minResidents and maxResidents for year demand "YearDemand object". Changed minResidents and maxResidents for year demand "YearDemand object". Changed minResidents and maxResidents for year demand "YearDemand object".	7	1
1508	2015-04-14 18:10:02.255088-04	219	EM_1	2	No fields changed.	7	1
1509	2015-04-14 21:06:46.47508-04	220	EM_2	2	Changed minLength for education req "EducationReq object". Changed maxLength for education req "EducationReq object". Changed maxLength for education req "EducationReq object".	7	1
1510	2015-04-14 21:07:21.279321-04	219	EM_1	2	Added year demand "YearDemand object". Changed maxLength for education req "EducationReq object". Changed maxLength for education req "EducationReq object".	7	1
1511	2015-04-14 21:13:23.300271-04	220	EM_2	2	Added year demand "YearDemand object". Changed minLength for education req "EducationReq object".	7	1
1512	2015-04-14 21:14:00.026159-04	229	Med 1 NF	2	Changed minLength and maxLength for education req "EducationReq object". Changed maxLength for education req "EducationReq object". Changed minLength and maxLength for education req "EducationReq object".	7	1
1513	2015-04-14 21:14:16.587542-04	230	Med 2 NF	2	Changed maxLength for education req "EducationReq object". Changed minLength and maxLength for education req "EducationReq object". Changed minLength and maxLength for education req "EducationReq object".	7	1
1514	2015-04-14 21:14:38.419828-04	232	Med 1	2	Changed minLength and maxLength for education req "EducationReq object". Changed minLength and maxLength for education req "EducationReq object". Changed minLength and maxLength for education req "EducationReq object".	7	1
1515	2015-04-14 21:15:01.972437-04	233	Med 2	2	Changed minLength and maxLength for education req "EducationReq object". Changed minLength and maxLength for education req "EducationReq object". Changed minLength and maxLength for education req "EducationReq object".	7	1
1516	2015-04-14 21:15:20.550892-04	234	MICU-N	2	Changed minLength and maxLength for education req "EducationReq object". Changed minLength and maxLength for education req "EducationReq object". Changed minLength and maxLength for education req "EducationReq object".	7	1
1517	2015-04-14 21:15:37.596718-04	235	MICU-S	2	Changed minLength and maxLength for education req "EducationReq object". Changed minLength and maxLength for education req "EducationReq object". Changed minLength and maxLength for education req "EducationReq object".	7	1
1518	2015-04-14 21:16:04.970283-04	238	NF_ONC	2	Changed minLength and maxLength for education req "EducationReq object". Changed maxLength for education req "EducationReq object". Changed minLength and maxLength for education req "EducationReq object".	7	1
1519	2015-04-14 21:16:20.009569-04	239	NF_VA	2	Changed minLength and maxLength for education req "EducationReq object". Changed maxLength for education req "EducationReq object". Changed minLength and maxLength for education req "EducationReq object".	7	1
1520	2015-04-14 21:17:52.53936-04	211	CARDS FIRM	2	Added year demand "YearDemand object". Added year demand "YearDemand object".	7	1
1521	2015-04-14 21:18:27.833989-04	205	AMBJAR	2	Changed maxResidents for year demand "YearDemand object". Changed maxResidents for year demand "YearDemand object". Deleted education req "EducationReq object".	7	1
1522	2015-04-14 21:18:35.938732-04	205	AMBJAR	2	No fields changed.	7	1
1523	2015-04-14 21:18:50.055291-04	206	AMB	2	Changed maxResidents for year demand "YearDemand object". Changed maxResidents for year demand "YearDemand object".	7	1
1524	2015-04-14 21:19:00.554634-04	209	BMT	2	Changed maxResidents for year demand "YearDemand object".	7	1
1525	2015-04-14 21:19:07.824927-04	211	CARDS FIRM	2	No fields changed.	7	1
1526	2015-04-14 21:19:23.645474-04	212	Cards NF	2	No fields changed.	7	1
1527	2015-04-14 21:19:47.087936-04	214	CCU	2	No fields changed.	7	1
1528	2015-04-14 21:20:13.132949-04	219	EM_1	2	Added year demand "YearDemand object". Added year demand "YearDemand object".	7	1
1529	2015-04-14 21:20:51.266738-04	220	EM_2	2	No fields changed.	7	1
1530	2015-04-14 21:21:12.795249-04	223	Geri	2	Added year demand "YearDemand object". Added year demand "YearDemand object".	7	1
1531	2015-04-14 21:21:47.304135-04	229	Med 1 NF	2	Added year demand "YearDemand object". Added year demand "YearDemand object". Changed minResidents and maxResidents for year demand "YearDemand object". Deleted education req "EducationReq object". Deleted education req "EducationReq object". Deleted education req "EducationReq object".	7	1
1532	2015-04-14 21:21:56.056346-04	229	Med 1 NF	2	No fields changed.	7	1
1590	2015-04-19 21:13:43.904818-04	86	2015-12-06 to 2015-12-26, Template_1	3		16	1
1533	2015-04-14 21:22:07.725009-04	230	Med 2 NF	2	Added year demand "YearDemand object". Added year demand "YearDemand object". Deleted education req "EducationReq object". Deleted education req "EducationReq object". Deleted education req "EducationReq object".	7	1
1534	2015-04-14 21:22:23.398254-04	230	Med 2 NF	2	Changed minResidents and maxResidents for year demand "YearDemand object". Changed maxResidents for year demand "YearDemand object". Changed minResidents and maxResidents for year demand "YearDemand object".	7	1
1535	2015-04-14 21:22:47.100719-04	232	Med 1	2	Added year demand "YearDemand object". Added year demand "YearDemand object". Changed minResidents and maxResidents for year demand "YearDemand object". Deleted education req "EducationReq object". Deleted education req "EducationReq object". Deleted education req "EducationReq object".	7	1
1536	2015-04-14 21:23:09.738183-04	233	Med 2	2	Added year demand "YearDemand object". Added year demand "YearDemand object". Changed minResidents and maxResidents for year demand "YearDemand object". Deleted education req "EducationReq object". Deleted education req "EducationReq object". Deleted education req "EducationReq object".	7	1
1537	2015-04-14 21:23:33.403657-04	234	MICU-N	2	Changed minResidents and maxResidents for year demand "YearDemand object". Changed minResidents and maxResidents for year demand "YearDemand object". Changed minResidents and maxResidents for year demand "YearDemand object". Deleted education req "EducationReq object". Deleted education req "EducationReq object". Deleted education req "EducationReq object".	7	1
1538	2015-04-14 21:23:57.016866-04	235	MICU-S	2	Changed minResidents and maxResidents for year demand "YearDemand object". Changed minResidents and maxResidents for year demand "YearDemand object". Changed minResidents and maxResidents for year demand "YearDemand object". Deleted education req "EducationReq object". Deleted education req "EducationReq object". Deleted education req "EducationReq object".	7	1
1539	2015-04-14 21:24:28.72136-04	238	NF_ONC	2	Added year demand "YearDemand object". Added year demand "YearDemand object". Changed minResidents and maxResidents for year demand "YearDemand object". Deleted education req "EducationReq object". Deleted education req "EducationReq object". Deleted education req "EducationReq object".	7	1
1540	2015-04-14 21:24:46.761315-04	239	NF_VA	2	Added year demand "YearDemand object". Added year demand "YearDemand object". Changed minResidents and maxResidents for year demand "YearDemand object". Deleted education req "EducationReq object". Deleted education req "EducationReq object". Deleted education req "EducationReq object".	7	1
1541	2015-04-14 21:25:40.840831-04	242	ONC	2	Added year demand "YearDemand object". Added year demand "YearDemand object". Changed minResidents and maxResidents for year demand "YearDemand object".	7	1
1542	2015-04-14 21:25:57.873598-04	252	Renal_TXP	2	Changed maxResidents for year demand "YearDemand object".	7	1
1543	2015-04-14 21:26:45.373336-04	256	VA	2	Added year demand "YearDemand object". Changed year, minResidents and maxResidents for year demand "YearDemand object". Changed year, minResidents and maxResidents for year demand "YearDemand object".	7	1
1544	2015-04-14 21:27:09.225666-04	258	Variety NF	2	Changed minResidents and maxResidents for year demand "YearDemand object".	7	1
1545	2015-04-14 21:27:36.10626-04	261	4th NF	2	Added year demand "YearDemand object". Added year demand "YearDemand object".	7	1
1546	2015-04-14 21:33:53.771212-04	7	I_Neuro	2	Changed name.	9	1
1547	2015-04-14 21:48:35.033779-04	799		3		11	1
1548	2015-04-14 21:50:30.343835-04	1	Barnes Jewish Internal Medicine	2	Changed endDate.	10	1
1549	2015-04-14 21:52:26.356075-04	78	2015-08-16 to 2015-09-12, Template_1	1		16	1
1550	2015-04-14 21:52:42.12553-04	79	2015-08-16 to 2015-09-12, Template_2	1		16	1
1551	2015-04-14 21:53:03.401389-04	80	2015-09-13 to 2015-10-10, Template_1	1		16	1
1552	2015-04-14 21:53:16.734457-04	81	2015-09-13 to 2015-10-10, Template_2	1		16	1
1553	2015-04-14 21:53:34.206345-04	82	2015-10-11 to 2015-11-07, Template_1	1		16	1
1554	2015-04-14 21:53:56.400431-04	83	2015-10-11 to 2015-11-07, Template_2	1		16	1
1555	2015-04-14 21:54:19.561795-04	84	2015-11-08 to 2015-12-05, Template_1	1		16	1
1556	2015-04-14 21:54:31.948902-04	85	2015-11-08 to 2015-12-05, Template_2	1		16	1
1557	2015-04-14 21:55:01.304916-04	86	2015-12-06 to 2015-12-26, Template_1	1		16	1
1558	2015-04-14 21:55:16.117728-04	87	2015-12-06 to 2015-12-26, Template_2	1		16	1
1559	2015-04-14 21:55:43.160495-04	88	2015-12-27 to 2016-01-16, Template_1	1		16	1
1560	2015-04-14 21:55:58.758853-04	89	2015-12-27 to 2016-01-16, Template_2	1		16	1
1561	2015-04-14 21:56:50.210689-04	90	2016-01-17 to 2016-02-13, Template_1	1		16	1
1562	2015-04-14 21:57:04.316784-04	91	2016-01-17 to 2016-02-13, Template_2	1		16	1
1563	2015-04-14 21:57:42.603483-04	92	2016-02-14 to 2016-03-12, Template_1	1		16	1
1564	2015-04-14 21:57:58.503381-04	93	2016-02-14 to 2016-03-12, Template_2	1		16	1
1565	2015-04-14 21:58:18.152521-04	94	2016-03-13 to 2016-04-09, Template_1	1		16	1
1566	2015-04-14 21:58:39.003428-04	95	2016-03-13 to 2016-04-09, Template_2	1		16	1
1567	2015-04-14 21:58:57.906792-04	96	2016-04-10 to 2016-05-07, Template_1	1		16	1
1568	2015-04-14 21:59:21.949355-04	97	2016-04-10 to 2016-05-07, Template_2	1		16	1
1569	2015-04-14 21:59:49.168007-04	98	2016-05-08 to 2016-06-04, Template_1	1		16	1
1570	2015-04-14 22:00:06.545142-04	99	2016-05-08 to 2016-06-04, Template_2	1		16	1
1571	2015-04-14 22:00:41.681401-04	100	2016-06-05 to 2016-06-25, Template_1	1		16	1
1572	2015-04-14 22:01:01.603446-04	101	2016-06-05 to 2016-06-25, Template_2	1		16	1
1573	2015-04-14 22:01:19.618026-04	1	Barnes Jewish Internal Medicine	2	Changed endDate.	10	1
1574	2015-04-19 16:50:04.931482-04	4		3		8	1
1575	2015-04-19 21:13:43.875859-04	101	2016-06-05 to 2016-06-25, Template_2	3		16	1
1576	2015-04-19 21:13:43.880972-04	100	2016-06-05 to 2016-06-25, Template_1	3		16	1
1577	2015-04-19 21:13:43.882861-04	99	2016-05-08 to 2016-06-04, Template_2	3		16	1
1578	2015-04-19 21:13:43.884633-04	98	2016-05-08 to 2016-06-04, Template_1	3		16	1
1579	2015-04-19 21:13:43.886125-04	97	2016-04-10 to 2016-05-07, Template_2	3		16	1
1580	2015-04-19 21:13:43.88757-04	96	2016-04-10 to 2016-05-07, Template_1	3		16	1
1581	2015-04-19 21:13:43.8899-04	95	2016-03-13 to 2016-04-09, Template_2	3		16	1
1582	2015-04-19 21:13:43.891788-04	94	2016-03-13 to 2016-04-09, Template_1	3		16	1
1583	2015-04-19 21:13:43.89347-04	93	2016-02-14 to 2016-03-12, Template_2	3		16	1
1584	2015-04-19 21:13:43.895291-04	92	2016-02-14 to 2016-03-12, Template_1	3		16	1
1585	2015-04-19 21:13:43.896813-04	91	2016-01-17 to 2016-02-13, Template_2	3		16	1
1586	2015-04-19 21:13:43.898532-04	90	2016-01-17 to 2016-02-13, Template_1	3		16	1
1587	2015-04-19 21:13:43.900256-04	89	2015-12-27 to 2016-01-16, Template_2	3		16	1
1588	2015-04-19 21:13:43.901775-04	88	2015-12-27 to 2016-01-16, Template_1	3		16	1
1589	2015-04-19 21:13:43.903234-04	87	2015-12-06 to 2015-12-26, Template_2	3		16	1
1591	2015-04-19 21:13:43.906839-04	85	2015-11-08 to 2015-12-05, Template_2	3		16	1
1592	2015-04-19 21:13:43.908741-04	84	2015-11-08 to 2015-12-05, Template_1	3		16	1
1593	2015-04-19 21:13:43.910557-04	83	2015-10-11 to 2015-11-07, Template_2	3		16	1
1594	2015-04-19 21:13:43.913228-04	82	2015-10-11 to 2015-11-07, Template_1	3		16	1
1595	2015-04-19 21:13:43.916144-04	81	2015-09-13 to 2015-10-10, Template_2	3		16	1
1596	2015-04-19 21:13:43.918539-04	80	2015-09-13 to 2015-10-10, Template_1	3		16	1
1597	2015-04-19 21:13:43.920355-04	79	2015-08-16 to 2015-09-12, Template_2	3		16	1
1598	2015-04-19 21:13:43.922209-04	78	2015-08-16 to 2015-09-12, Template_1	3		16	1
1599	2015-04-19 21:13:58.940428-04	1	Barnes Jewish Internal Medicine	2	Changed endDate.	10	1
1600	2015-04-19 21:15:06.022985-04	800		3		11	1
1601	2015-04-19 21:15:15.382076-04	5		3		8	1
1602	2015-04-19 21:15:47.981652-04	1	PGY1	2	Changed requiredRotations.	8	1
1603	2015-04-19 21:16:03.176186-04	2	PGY2	2	Deleted education req "EducationReq object".	8	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sw
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1603, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: sw
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	log entry	admin	logentry
2	permission	auth	permission
3	group	auth	group
4	user	auth	user
5	content type	contenttypes	contenttype
6	session	sessions	session
7	rotation	rotationSchedule_app	rotation
8	year	rotationSchedule_app	year
9	track	rotationSchedule_app	track
10	program	rotationSchedule_app	program
11	resident	rotationSchedule_app	resident
12	block	rotationSchedule_app	block
13	schedule	rotationSchedule_app	schedule
14	event	rotationSchedule_app	event
15	template	rotationSchedule_app	template
16	template event	rotationSchedule_app	templateevent
26	rotation set	rotationSchedule_app	rotationset
27	set edu req	rotationSchedule_app	setedureq
31	set track edu req	rotationSchedule_app	settrackedureq
40	year set	rotationSchedule_app	yearset
41	set year demand	rotationSchedule_app	setyeardemand
54	education req	rotationSchedule_app	educationreq
55	year demand	rotationSchedule_app	yeardemand
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sw
--

SELECT pg_catalog.setval('django_content_type_id_seq', 55, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: sw
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2014-12-03 14:00:43.092397-05
2	auth	0001_initial	2014-12-03 14:00:43.407825-05
3	admin	0001_initial	2014-12-03 14:00:43.644693-05
5	sessions	0001_initial	2014-12-03 14:00:43.794615-05
6	rotationSchedule_app	0002_year	2014-12-03 15:32:07.062708-05
7	rotationSchedule_app	0003_program_track	2014-12-03 16:01:28.882392-05
8	rotationSchedule_app	0004_remove_resident_year	2014-12-03 16:10:38.322734-05
9	rotationSchedule_app	0005_resident_year	2014-12-03 16:30:32.570238-05
10	rotationSchedule_app	0006_resident_tracks	2014-12-03 20:58:44.355405-05
11	rotationSchedule_app	0007_auto_20141204_0251	2014-12-03 21:55:01.927565-05
12	rotationSchedule_app	0008_rotation	2014-12-04 13:55:25.299294-05
13	rotationSchedule_app	0009_auto_20141204_1903	2014-12-04 14:11:54.650152-05
14	rotationSchedule_app	0010_auto_20141204_1930	2014-12-04 14:32:05.571776-05
15	rotationSchedule_app	0010_year_yearname	2014-12-04 15:26:57.661525-05
16	rotationSchedule_app	0011_auto_20141204_2240	2014-12-04 17:42:08.546189-05
17	rotationSchedule_app	0012_remove_resident_track	2014-12-04 22:30:03.903145-05
18	rotationSchedule_app	0013_auto_20141205_0347	2014-12-04 22:53:11.975224-05
19	rotationSchedule_app	0014_auto_20141205_1625	2015-01-05 17:01:17.982631-05
20	rotationSchedule_app	0015_auto_20150121_2118	2015-01-21 16:20:59.55488-05
21	rotationSchedule_app	0016_auto_20150121_2124	2015-01-21 16:29:00.261451-05
22	rotationSchedule_app	0017_block	2015-01-21 16:49:45.63805-05
23	rotationSchedule_app	0018_auto_20150207_1907	2015-02-07 14:10:42.855735-05
24	rotationSchedule_app	0019_auto_20150207_1922	2015-02-07 14:27:54.588232-05
25	rotationSchedule_app	0001_initial	2015-02-22 15:11:58.129965-05
26	rotationSchedule_app	0002_auto_20150226_2038	2015-02-26 15:38:16.485826-05
27	rotationSchedule_app	0003_auto_20150226_2234	2015-02-26 17:34:39.20883-05
28	rotationSchedule_app	0004_program_rigidxy	2015-02-28 11:16:15.365912-05
29	rotationSchedule_app	0005_template	2015-02-28 14:23:11.148719-05
30	rotationSchedule_app	0006_auto_20150228_1924	2015-02-28 14:24:51.841092-05
31	rotationSchedule_app	0007_templateevent	2015-02-28 14:25:17.539618-05
32	rotationSchedule_app	0008_remove_templateevent_year	2015-02-28 14:27:47.971515-05
33	rotationSchedule_app	0009_resident_email	2015-02-28 14:40:58.928103-05
34	rotationSchedule_app	0010_auto_20150228_1950	2015-02-28 14:50:34.441792-05
35	rotationSchedule_app	0002_auto_20150314_2014	2015-03-14 16:14:16.813555-04
36	rotationSchedule_app	0003_auto_20150323_1901	2015-03-23 15:01:40.434687-04
37	rotationSchedule_app	0004_resident_couple	2015-03-24 01:51:02.503857-04
38	rotationSchedule_app	0002_rotationset_setedureq	2015-04-03 17:20:19.391085-04
39	rotationSchedule_app	0003_auto_20150403_2136	2015-04-03 17:36:50.664646-04
40	rotationSchedule_app	0004_rotationset_rotationsetedureq2	2015-04-03 17:41:23.614302-04
41	rotationSchedule_app	0005_remove_rotationset_rotationsetedureq	2015-04-03 17:43:02.810631-04
42	rotationSchedule_app	0006_settrackedureq	2015-04-03 17:55:04.041518-04
43	rotationSchedule_app	0007_rotationset_rotationsettrackedureq	2015-04-03 17:57:57.13222-04
44	rotationSchedule_app	0008_remove_track_excludedblocks	2015-04-03 18:03:41.445556-04
45	rotationSchedule_app	0009_remove_resident_resexcludedblocks	2015-04-03 18:05:53.61619-04
46	rotationSchedule_app	0010_yearset	2015-04-03 18:16:16.585795-04
47	rotationSchedule_app	0011_setyeardemand	2015-04-03 18:18:34.386616-04
48	rotationSchedule_app	0012_yearset_setrotationdemand	2015-04-03 18:20:18.066871-04
49	rotationSchedule_app	0013_resident_resexcludedblocks	2015-04-03 18:23:47.203507-04
50	rotationSchedule_app	0014_track_excludedblocks	2015-04-03 18:24:28.639005-04
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sw
--

SELECT pg_catalog.setval('django_migrations_id_seq', 50, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: sw
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
1x9knq90bpehwmny1098utbibpol0p4r	Y2FjNTNmOGMzNDJlZGQ0ZjZkN2M3ZjgxYjQ1NjA3YWMwYzk0YzgyMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjM1M2M3YTY4MDZjYjY1NWZhNzYxY2YyODRmMTBkOGU5NzljMzYyZDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-03-28 16:11:58.561331-04
62yicgeh9au75weljj2bd4er1yy13ho1	ZDUzNDFkN2JhODZhZDgxYTNjN2M5YTEyMDZhZDRhM2ViNmUyODI4OTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MSwiX2F1dGhfdXNlcl9oYXNoIjoiMzUzYzdhNjgwNmNiNjU1ZmE3NjFjZjI4NGYxMGQ4ZTk3OWMzNjJkNiJ9	2015-04-12 13:51:09.284914-04
gvf8xqdyc6vzmma97i7ti8j8b52w3wsn	Y2FjNTNmOGMzNDJlZGQ0ZjZkN2M3ZjgxYjQ1NjA3YWMwYzk0YzgyMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjM1M2M3YTY4MDZjYjY1NWZhNzYxY2YyODRmMTBkOGU5NzljMzYyZDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-04-17 17:17:50.582973-04
lywj1jhgf1qh605mkcvby3fm9aaz66ns	Y2FjNTNmOGMzNDJlZGQ0ZjZkN2M3ZjgxYjQ1NjA3YWMwYzk0YzgyMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjM1M2M3YTY4MDZjYjY1NWZhNzYxY2YyODRmMTBkOGU5NzljMzYyZDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-05-03 16:49:36.914249-04
\.


--
-- Data for Name: rotationSchedule_app_block; Type: TABLE DATA; Schema: public; Owner: sw
--

COPY "rotationSchedule_app_block" (id, name, length, "maxNumRotations") FROM stdin;
6	Four-week	4	2
7	Three-week	3	2
\.


--
-- Name: rotationSchedule_app_block_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sw
--

SELECT pg_catalog.setval('"rotationSchedule_app_block_id_seq"', 7, true);


--
-- Data for Name: rotationSchedule_app_educationreq; Type: TABLE DATA; Schema: public; Owner: sw
--

COPY "rotationSchedule_app_educationreq" (id, "minLength", "maxLength", rotation_id, year_id) FROM stdin;
707	0	100	256	3
708	0	100	258	3
709	0	100	259	3
710	0	100	204	3
713	0	100	207	3
714	0	100	208	3
715	0	100	209	3
716	0	100	210	3
717	0	100	211	3
718	0	100	212	3
719	0	100	213	3
720	0	100	214	3
721	0	100	216	3
722	0	100	218	3
725	0	100	221	3
726	0	100	222	3
727	0	100	223	3
728	0	100	224	3
729	0	100	225	3
730	0	100	226	3
731	0	100	227	3
738	0	100	236	3
739	0	100	237	3
742	0	100	240	3
743	0	100	241	3
744	0	100	242	3
745	0	100	243	3
746	0	100	244	3
747	0	100	245	3
748	0	100	246	3
749	0	100	247	3
750	0	100	248	3
751	0	100	249	3
752	0	100	251	3
753	0	100	252	3
754	0	100	253	3
755	0	100	254	3
756	0	100	255	3
556	0	0	205	3
712	0	0	206	3
724	0	0	220	3
723	0	0	219	3
810	0	100	256	1
811	0	100	258	1
812	0	100	259	1
813	0	100	261	1
814	0	100	204	1
815	0	100	205	1
816	0	100	206	1
817	0	100	207	1
818	0	100	208	1
819	0	100	209	1
820	0	100	210	1
821	0	100	211	1
822	0	100	212	1
823	0	100	213	1
824	0	100	214	1
825	0	100	216	1
826	0	100	218	1
827	0	100	219	1
828	0	100	220	1
829	0	100	221	1
830	0	100	222	1
831	0	100	223	1
832	0	100	224	1
833	0	100	225	1
834	0	100	226	1
835	0	100	227	1
836	0	100	236	1
837	0	100	237	1
838	0	100	240	1
839	0	100	241	1
840	0	100	242	1
841	0	100	243	1
842	0	100	244	1
843	0	100	245	1
844	0	100	246	1
845	0	100	247	1
846	0	100	248	1
847	0	100	249	1
848	0	100	251	1
849	0	100	252	1
850	0	100	253	1
851	0	100	254	1
852	0	100	255	1
853	0	100	256	2
854	0	100	258	2
855	0	100	259	2
856	0	100	261	2
857	0	100	204	2
858	0	100	205	2
859	0	100	206	2
860	0	100	207	2
861	0	100	208	2
862	0	100	209	2
863	0	100	210	2
864	0	100	211	2
865	0	100	212	2
866	0	100	213	2
867	0	100	214	2
868	0	100	216	2
869	0	100	218	2
870	0	100	219	2
871	0	100	220	2
872	0	100	221	2
873	0	100	222	2
874	0	100	223	2
875	0	100	224	2
876	0	100	225	2
877	0	100	226	2
878	0	100	227	2
879	0	100	236	2
880	0	100	237	2
881	0	100	240	2
882	0	100	241	2
883	0	100	242	2
884	0	100	243	2
885	0	100	244	2
886	0	100	245	2
887	0	100	246	2
888	0	100	247	2
889	0	100	248	2
890	0	100	249	2
891	0	100	251	2
892	0	100	252	2
893	0	100	253	2
894	0	100	254	2
895	0	100	255	2
\.


--
-- Name: rotationSchedule_app_educationreq_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sw
--

SELECT pg_catalog.setval('"rotationSchedule_app_educationreq_id_seq"', 895, true);


--
-- Data for Name: rotationSchedule_app_event; Type: TABLE DATA; Schema: public; Owner: sw
--

COPY "rotationSchedule_app_event" (id, "startDate", "endDate", resident_id, rotation_id, schedule_id) FROM stdin;
240196	2015-06-21	2015-06-28	581	229	656
240197	2015-06-28	2015-07-05	581	229	656
240198	2015-07-05	2015-07-12	581	238	656
240199	2015-07-12	2015-07-19	581	238	656
240200	2015-06-21	2015-06-28	582	216	656
240201	2015-06-28	2015-07-05	582	216	656
240202	2015-07-19	2015-07-26	582	214	656
240203	2015-07-26	2015-08-02	582	214	656
240204	2015-08-02	2015-08-09	582	214	656
240205	2015-08-09	2015-08-16	582	214	656
240206	2015-07-05	2015-07-12	582	230	656
240207	2015-07-12	2015-07-19	582	230	656
240208	2015-06-21	2015-06-28	583	216	656
240209	2015-06-28	2015-07-05	583	216	656
240210	2015-07-05	2015-07-12	583	225	656
240211	2015-07-12	2015-07-19	583	225	656
240212	2015-07-19	2015-07-26	583	214	656
240213	2015-07-26	2015-08-02	583	214	656
240214	2015-08-02	2015-08-09	583	214	656
240215	2015-08-09	2015-08-16	583	214	656
240216	2015-06-21	2015-06-28	584	230	656
240217	2015-06-28	2015-07-05	584	230	656
240218	2015-08-02	2015-08-09	584	230	656
240219	2015-08-09	2015-08-16	584	230	656
240220	2015-07-19	2015-07-26	584	238	656
240221	2015-07-26	2015-08-02	584	238	656
240222	2015-07-05	2015-07-12	584	239	656
240223	2015-07-12	2015-07-19	584	239	656
240224	2015-08-02	2015-08-09	585	216	656
240225	2015-08-09	2015-08-16	585	216	656
240226	2015-07-19	2015-07-26	585	212	656
240227	2015-07-26	2015-08-02	585	212	656
240228	2015-07-05	2015-07-12	585	229	656
240229	2015-07-12	2015-07-19	585	229	656
240230	2015-06-21	2015-06-28	585	238	656
240231	2015-06-28	2015-07-05	585	238	656
240232	2015-06-21	2015-06-28	586	216	656
240233	2015-06-28	2015-07-05	586	216	656
240234	2015-08-02	2015-08-09	586	216	656
240235	2015-08-09	2015-08-16	586	216	656
240236	2015-07-05	2015-07-12	586	230	656
240237	2015-07-12	2015-07-19	586	230	656
240238	2015-07-19	2015-07-26	586	230	656
240239	2015-07-26	2015-08-02	586	230	656
240240	2015-06-21	2015-06-28	587	216	656
240241	2015-06-28	2015-07-05	587	216	656
240242	2015-07-05	2015-07-12	587	236	656
240243	2015-07-12	2015-07-19	587	236	656
240244	2015-08-02	2015-08-09	587	212	656
240245	2015-08-09	2015-08-16	587	212	656
240246	2015-07-19	2015-07-26	587	230	656
240247	2015-07-26	2015-08-02	587	230	656
240248	2015-07-05	2015-07-12	588	216	656
240249	2015-07-12	2015-07-19	588	216	656
240250	2015-07-19	2015-07-26	588	208	656
240251	2015-07-26	2015-08-02	588	208	656
240252	2015-08-02	2015-08-09	588	225	656
240253	2015-08-09	2015-08-16	588	225	656
240254	2015-06-21	2015-06-28	588	251	656
240255	2015-06-28	2015-07-05	588	251	656
240256	2015-06-21	2015-06-28	589	216	656
240257	2015-06-28	2015-07-05	589	216	656
240258	2015-07-05	2015-07-12	589	220	656
240259	2015-07-12	2015-07-19	589	220	656
240260	2015-08-02	2015-08-09	589	220	656
240261	2015-08-09	2015-08-16	589	220	656
240262	2015-07-19	2015-07-26	589	229	656
240263	2015-07-26	2015-08-02	589	229	656
240264	2015-06-21	2015-06-28	590	216	656
240265	2015-06-28	2015-07-05	590	216	656
240266	2015-08-02	2015-08-09	590	216	656
240267	2015-08-09	2015-08-16	590	216	656
240268	2015-07-19	2015-07-26	590	220	656
240269	2015-07-26	2015-08-02	590	220	656
240270	2015-07-05	2015-07-12	590	239	656
240271	2015-07-12	2015-07-19	590	239	656
240272	2015-07-05	2015-07-12	591	216	656
240273	2015-07-12	2015-07-19	591	216	656
240274	2015-07-19	2015-07-26	591	216	656
240275	2015-07-26	2015-08-02	591	216	656
240276	2015-06-21	2015-06-28	591	246	656
240277	2015-06-28	2015-07-05	591	246	656
240278	2015-08-02	2015-08-09	591	238	656
240279	2015-08-09	2015-08-16	591	238	656
240280	2015-07-05	2015-07-12	592	216	656
240281	2015-07-12	2015-07-19	592	216	656
240282	2015-07-19	2015-07-26	592	216	656
240283	2015-07-26	2015-08-02	592	216	656
240284	2015-08-02	2015-08-09	592	212	656
240285	2015-08-09	2015-08-16	592	212	656
240286	2015-06-21	2015-06-28	592	239	656
240287	2015-06-28	2015-07-05	592	239	656
240288	2015-08-02	2015-08-09	593	236	656
240289	2015-08-09	2015-08-16	593	236	656
240290	2015-06-21	2015-06-28	593	211	656
240291	2015-06-28	2015-07-05	593	211	656
240292	2015-07-05	2015-07-12	593	211	656
240293	2015-07-12	2015-07-19	593	211	656
240294	2015-07-19	2015-07-26	593	239	656
240295	2015-07-26	2015-08-02	593	239	656
240296	2015-08-02	2015-08-09	624	216	656
240297	2015-08-09	2015-08-16	624	216	656
240298	2015-06-21	2015-06-28	624	224	656
240299	2015-06-28	2015-07-05	624	224	656
240300	2015-07-19	2015-07-26	624	224	656
240301	2015-07-26	2015-08-02	624	224	656
240302	2015-07-05	2015-07-12	624	220	656
240303	2015-07-12	2015-07-19	624	220	656
240304	2015-06-21	2015-06-28	625	216	656
240305	2015-06-28	2015-07-05	625	216	656
240306	2015-07-19	2015-07-26	625	216	656
240307	2015-07-26	2015-08-02	625	216	656
240308	2015-08-02	2015-08-09	625	224	656
240309	2015-08-09	2015-08-16	625	224	656
240310	2015-07-05	2015-07-12	625	245	656
240311	2015-07-12	2015-07-19	625	245	656
240312	2015-07-05	2015-07-12	626	216	656
240313	2015-07-12	2015-07-19	626	216	656
240314	2015-06-21	2015-06-28	626	224	656
240315	2015-06-28	2015-07-05	626	224	656
240316	2015-07-19	2015-07-26	626	235	656
240317	2015-07-26	2015-08-02	626	235	656
240318	2015-08-02	2015-08-09	626	235	656
240319	2015-08-09	2015-08-16	626	235	656
240320	2015-07-19	2015-07-26	627	216	656
240321	2015-07-26	2015-08-02	627	216	656
240322	2015-06-21	2015-06-28	627	224	656
240323	2015-06-28	2015-07-05	627	224	656
240324	2015-08-02	2015-08-09	627	224	656
240325	2015-08-09	2015-08-16	627	224	656
240326	2015-07-05	2015-07-12	627	251	656
240327	2015-07-12	2015-07-19	627	251	656
240328	2015-07-05	2015-07-12	628	216	656
240329	2015-07-12	2015-07-19	628	216	656
240330	2015-06-21	2015-06-28	628	245	656
240331	2015-06-28	2015-07-05	628	245	656
240332	2015-07-19	2015-07-26	628	245	656
240333	2015-07-26	2015-08-02	628	245	656
240334	2015-08-02	2015-08-09	628	220	656
240335	2015-08-09	2015-08-16	628	220	656
240336	2015-07-19	2015-07-26	629	216	656
240337	2015-07-26	2015-08-02	629	216	656
240338	2015-07-05	2015-07-12	629	224	656
240339	2015-07-12	2015-07-19	629	224	656
240340	2015-08-02	2015-08-09	629	220	656
240341	2015-08-09	2015-08-16	629	220	656
240342	2015-06-21	2015-06-28	629	229	656
240343	2015-06-28	2015-07-05	629	229	656
240344	2015-06-21	2015-06-28	630	216	656
240345	2015-06-28	2015-07-05	630	216	656
240346	2015-07-05	2015-07-12	630	236	656
240347	2015-07-12	2015-07-19	630	236	656
240348	2015-07-19	2015-07-26	630	219	656
240349	2015-07-26	2015-08-02	630	219	656
240350	2015-08-02	2015-08-09	630	219	656
240351	2015-08-09	2015-08-16	630	219	656
240352	2015-06-21	2015-06-28	631	216	656
240353	2015-06-28	2015-07-05	631	216	656
240354	2015-07-19	2015-07-26	631	216	656
240355	2015-07-26	2015-08-02	631	216	656
240356	2015-07-05	2015-07-12	631	224	656
240357	2015-07-12	2015-07-19	631	224	656
240358	2015-08-02	2015-08-09	631	229	656
240359	2015-08-09	2015-08-16	631	229	656
240360	2015-08-02	2015-08-09	632	216	656
240361	2015-08-09	2015-08-16	632	216	656
240362	2015-07-05	2015-07-12	632	224	656
240363	2015-07-12	2015-07-19	632	224	656
240364	2015-07-19	2015-07-26	632	245	656
240365	2015-07-26	2015-08-02	632	245	656
240366	2015-06-21	2015-06-28	632	220	656
240367	2015-06-28	2015-07-05	632	220	656
240368	2015-08-02	2015-08-09	633	216	656
240369	2015-08-09	2015-08-16	633	216	656
240370	2015-07-19	2015-07-26	633	224	656
240371	2015-07-26	2015-08-02	633	224	656
240372	2015-06-21	2015-06-28	633	232	656
240373	2015-06-28	2015-07-05	633	232	656
240374	2015-07-05	2015-07-12	633	232	656
240375	2015-07-12	2015-07-19	633	232	656
240376	2015-08-02	2015-08-09	634	245	656
240377	2015-08-09	2015-08-16	634	245	656
240378	2015-06-21	2015-06-28	634	205	656
240379	2015-06-28	2015-07-05	634	205	656
240380	2015-07-05	2015-07-12	634	205	656
240381	2015-07-12	2015-07-19	634	205	656
240382	2015-07-19	2015-07-26	634	239	656
240383	2015-07-26	2015-08-02	634	239	656
240384	2015-06-21	2015-06-28	635	245	656
240385	2015-06-28	2015-07-05	635	245	656
240386	2015-07-05	2015-07-12	635	220	656
240387	2015-07-12	2015-07-19	635	220	656
240388	2015-07-19	2015-07-26	635	234	656
240389	2015-07-26	2015-08-02	635	234	656
240390	2015-08-02	2015-08-09	635	234	656
240391	2015-08-09	2015-08-16	635	234	656
240392	2015-06-21	2015-06-28	636	216	656
240393	2015-06-28	2015-07-05	636	216	656
240394	2015-08-02	2015-08-09	636	216	656
240395	2015-08-09	2015-08-16	636	216	656
240396	2015-07-19	2015-07-26	636	224	656
240397	2015-07-26	2015-08-02	636	224	656
240398	2015-07-05	2015-07-12	636	245	656
240399	2015-07-12	2015-07-19	636	245	656
240400	2015-06-21	2015-06-28	637	216	656
240401	2015-06-28	2015-07-05	637	216	656
240402	2015-07-05	2015-07-12	637	224	656
240403	2015-07-12	2015-07-19	637	224	656
240404	2015-07-19	2015-07-26	637	232	656
240405	2015-07-26	2015-08-02	637	232	656
240406	2015-08-02	2015-08-09	637	232	656
240407	2015-08-09	2015-08-16	637	232	656
240408	2015-08-02	2015-08-09	638	216	656
240409	2015-08-09	2015-08-16	638	216	656
240410	2015-07-19	2015-07-26	638	245	656
240411	2015-07-26	2015-08-02	638	245	656
240412	2015-06-21	2015-06-28	638	256	656
240413	2015-06-28	2015-07-05	638	256	656
240414	2015-07-05	2015-07-12	638	256	656
240415	2015-07-12	2015-07-19	638	256	656
240416	2015-06-21	2015-06-28	639	211	656
240417	2015-06-28	2015-07-05	639	211	656
240418	2015-07-05	2015-07-12	639	211	656
240419	2015-07-12	2015-07-19	639	211	656
240420	2015-07-19	2015-07-26	639	211	656
240421	2015-07-26	2015-08-02	639	211	656
240422	2015-08-02	2015-08-09	639	211	656
240423	2015-08-09	2015-08-16	639	211	656
240424	2015-07-05	2015-07-12	640	216	656
240425	2015-07-12	2015-07-19	640	216	656
240426	2015-06-21	2015-06-28	640	245	656
240427	2015-06-28	2015-07-05	640	245	656
240428	2015-07-19	2015-07-26	640	247	656
240429	2015-07-26	2015-08-02	640	247	656
240430	2015-08-02	2015-08-09	640	247	656
240431	2015-08-09	2015-08-16	640	247	656
240432	2015-07-05	2015-07-12	641	216	656
240433	2015-07-12	2015-07-19	641	216	656
240434	2015-07-19	2015-07-26	641	237	656
240435	2015-07-26	2015-08-02	641	237	656
240436	2015-08-02	2015-08-09	641	237	656
240437	2015-08-09	2015-08-16	641	237	656
240438	2015-06-21	2015-06-28	641	245	656
240439	2015-06-28	2015-07-05	641	245	656
240440	2015-06-21	2015-06-28	642	216	656
240441	2015-06-28	2015-07-05	642	216	656
240442	2015-07-05	2015-07-12	642	224	656
240443	2015-07-12	2015-07-19	642	224	656
240444	2015-07-19	2015-07-26	642	245	656
240445	2015-07-26	2015-08-02	642	245	656
240446	2015-08-02	2015-08-09	642	246	656
240447	2015-08-09	2015-08-16	642	246	656
240448	2015-07-05	2015-07-12	643	216	656
240449	2015-07-12	2015-07-19	643	216	656
240450	2015-07-19	2015-07-26	643	216	656
240451	2015-07-26	2015-08-02	643	216	656
240452	2015-06-21	2015-06-28	643	224	656
240453	2015-06-28	2015-07-05	643	224	656
240454	2015-08-02	2015-08-09	643	224	656
240455	2015-08-09	2015-08-16	643	224	656
240456	2015-07-05	2015-07-12	644	216	656
240457	2015-07-12	2015-07-19	644	216	656
240458	2015-06-21	2015-06-28	644	224	656
240459	2015-06-28	2015-07-05	644	224	656
240460	2015-07-19	2015-07-26	644	214	656
240461	2015-07-26	2015-08-02	644	214	656
240462	2015-08-02	2015-08-09	644	214	656
240463	2015-08-09	2015-08-16	644	214	656
240464	2015-06-21	2015-06-28	673	211	656
240465	2015-06-28	2015-07-05	673	211	656
240466	2015-07-05	2015-07-12	673	211	656
240467	2015-07-12	2015-07-19	673	211	656
240468	2015-07-19	2015-07-26	673	214	656
240469	2015-07-26	2015-08-02	673	214	656
240470	2015-08-02	2015-08-09	673	214	656
240471	2015-08-09	2015-08-16	673	214	656
240472	2015-08-02	2015-08-09	674	224	656
240473	2015-08-09	2015-08-16	674	224	656
240474	2015-07-19	2015-07-26	674	245	656
240475	2015-07-26	2015-08-02	674	245	656
240476	2015-06-21	2015-06-28	674	242	656
240477	2015-06-28	2015-07-05	674	242	656
240478	2015-07-05	2015-07-12	674	242	656
240479	2015-07-12	2015-07-19	674	242	656
240480	2015-07-19	2015-07-26	675	211	656
240481	2015-07-26	2015-08-02	675	211	656
240482	2015-08-02	2015-08-09	675	211	656
240483	2015-08-09	2015-08-16	675	211	656
240484	2015-06-21	2015-06-28	675	214	656
240485	2015-06-28	2015-07-05	675	214	656
240486	2015-07-05	2015-07-12	675	214	656
240487	2015-07-12	2015-07-19	675	214	656
240488	2015-07-05	2015-07-12	676	216	656
240489	2015-07-12	2015-07-19	676	216	656
240490	2015-06-21	2015-06-28	676	230	656
240491	2015-06-28	2015-07-05	676	230	656
240492	2015-07-19	2015-07-26	676	242	656
240493	2015-07-26	2015-08-02	676	242	656
240494	2015-08-02	2015-08-09	676	242	656
240495	2015-08-09	2015-08-16	676	242	656
240496	2015-07-05	2015-07-12	677	216	656
240497	2015-07-12	2015-07-19	677	216	656
240498	2015-07-19	2015-07-26	677	224	656
240499	2015-07-26	2015-08-02	677	224	656
240500	2015-06-21	2015-06-28	677	245	656
240501	2015-06-28	2015-07-05	677	245	656
240502	2015-08-02	2015-08-09	677	251	656
240503	2015-08-09	2015-08-16	677	251	656
240504	2015-07-19	2015-07-26	678	216	656
240505	2015-07-26	2015-08-02	678	216	656
240506	2015-06-21	2015-06-28	678	242	656
240507	2015-06-28	2015-07-05	678	242	656
240508	2015-07-05	2015-07-12	678	242	656
240509	2015-07-12	2015-07-19	678	242	656
240510	2015-08-02	2015-08-09	678	261	656
240511	2015-08-09	2015-08-16	678	261	656
240512	2015-07-05	2015-07-12	681	208	656
240513	2015-07-12	2015-07-19	681	208	656
240514	2015-07-19	2015-07-26	681	245	656
240515	2015-07-26	2015-08-02	681	245	656
240516	2015-06-21	2015-06-28	681	251	656
240517	2015-06-28	2015-07-05	681	251	656
240518	2015-08-02	2015-08-09	681	220	656
240519	2015-08-09	2015-08-16	681	220	656
240520	2015-07-19	2015-07-26	682	233	656
240521	2015-07-26	2015-08-02	682	233	656
240522	2015-08-02	2015-08-09	682	233	656
240523	2015-08-09	2015-08-16	682	233	656
240524	2015-06-21	2015-06-28	682	235	656
240525	2015-06-28	2015-07-05	682	235	656
240526	2015-07-05	2015-07-12	682	235	656
240527	2015-07-12	2015-07-19	682	235	656
240528	2015-06-21	2015-06-28	683	216	656
240529	2015-06-28	2015-07-05	683	216	656
240530	2015-07-05	2015-07-12	683	224	656
240531	2015-07-12	2015-07-19	683	224	656
240532	2015-08-02	2015-08-09	683	245	656
240533	2015-08-09	2015-08-16	683	245	656
240534	2015-07-19	2015-07-26	683	251	656
240535	2015-07-26	2015-08-02	683	251	656
240536	2015-08-02	2015-08-09	684	216	656
240537	2015-08-09	2015-08-16	684	216	656
240538	2015-07-19	2015-07-26	684	236	656
240539	2015-07-26	2015-08-02	684	236	656
240540	2015-06-21	2015-06-28	684	214	656
240541	2015-06-28	2015-07-05	684	214	656
240542	2015-07-05	2015-07-12	684	214	656
240543	2015-07-12	2015-07-19	684	214	656
240544	2015-06-21	2015-06-28	685	216	656
240545	2015-06-28	2015-07-05	685	216	656
240546	2015-07-19	2015-07-26	685	216	656
240547	2015-07-26	2015-08-02	685	216	656
240548	2015-08-02	2015-08-09	685	208	656
240549	2015-08-09	2015-08-16	685	208	656
240550	2015-07-05	2015-07-12	685	245	656
240551	2015-07-12	2015-07-19	685	245	656
240552	2015-08-02	2015-08-09	686	216	656
240553	2015-08-09	2015-08-16	686	216	656
240554	2015-06-21	2015-06-28	686	245	656
240555	2015-06-28	2015-07-05	686	245	656
240556	2015-07-05	2015-07-12	686	230	656
240557	2015-07-12	2015-07-19	686	230	656
240558	2015-07-19	2015-07-26	686	230	656
240559	2015-07-26	2015-08-02	686	230	656
240560	2015-07-19	2015-07-26	687	216	656
240561	2015-07-26	2015-08-02	687	216	656
240562	2015-07-05	2015-07-12	687	224	656
240563	2015-07-12	2015-07-19	687	224	656
240564	2015-08-02	2015-08-09	687	245	656
240565	2015-08-09	2015-08-16	687	245	656
240566	2015-06-21	2015-06-28	687	209	656
240567	2015-06-28	2015-07-05	687	209	656
240568	2015-07-05	2015-07-12	688	216	656
240569	2015-07-12	2015-07-19	688	216	656
240570	2015-07-19	2015-07-26	688	242	656
240571	2015-07-26	2015-08-02	688	242	656
240572	2015-08-02	2015-08-09	688	242	656
240573	2015-08-09	2015-08-16	688	242	656
240574	2015-06-21	2015-06-28	688	261	656
240575	2015-06-28	2015-07-05	688	261	656
240576	2015-07-19	2015-07-26	689	233	656
240577	2015-07-26	2015-08-02	689	233	656
240578	2015-08-02	2015-08-09	689	233	656
240579	2015-08-09	2015-08-16	689	233	656
240580	2015-06-21	2015-06-28	689	234	656
240581	2015-06-28	2015-07-05	689	234	656
240582	2015-07-05	2015-07-12	689	234	656
240583	2015-07-12	2015-07-19	689	234	656
240584	2015-08-02	2015-08-09	690	216	656
240585	2015-08-09	2015-08-16	690	216	656
240586	2015-07-19	2015-07-26	690	245	656
240587	2015-07-26	2015-08-02	690	245	656
240588	2015-06-21	2015-06-28	690	233	656
240589	2015-06-28	2015-07-05	690	233	656
240590	2015-07-05	2015-07-12	690	233	656
240591	2015-07-12	2015-07-19	690	233	656
240592	2015-08-02	2015-08-09	691	224	656
240593	2015-08-09	2015-08-16	691	224	656
240594	2015-07-05	2015-07-12	691	245	656
240595	2015-07-12	2015-07-19	691	245	656
240596	2015-06-21	2015-06-28	691	246	656
240597	2015-06-28	2015-07-05	691	246	656
240598	2015-07-19	2015-07-26	691	258	656
240599	2015-07-26	2015-08-02	691	258	656
240600	2015-07-19	2015-07-26	692	211	656
240601	2015-07-26	2015-08-02	692	211	656
240602	2015-08-02	2015-08-09	692	211	656
240603	2015-08-09	2015-08-16	692	211	656
240604	2015-06-21	2015-06-28	692	242	656
240605	2015-06-28	2015-07-05	692	242	656
240606	2015-07-05	2015-07-12	692	242	656
240607	2015-07-12	2015-07-19	692	242	656
240608	2015-07-19	2015-07-26	693	216	656
240609	2015-07-26	2015-08-02	693	216	656
240610	2015-08-02	2015-08-09	693	212	656
240611	2015-08-09	2015-08-16	693	212	656
240612	2015-06-21	2015-06-28	693	235	656
240613	2015-06-28	2015-07-05	693	235	656
240614	2015-07-05	2015-07-12	693	235	656
240615	2015-07-12	2015-07-19	693	235	656
240616	2015-07-19	2015-07-26	716	216	656
240617	2015-07-26	2015-08-02	716	216	656
240618	2015-06-21	2015-06-28	716	205	656
240619	2015-06-28	2015-07-05	716	205	656
240620	2015-07-05	2015-07-12	716	205	656
240621	2015-07-12	2015-07-19	716	205	656
240622	2015-08-02	2015-08-09	716	230	656
240623	2015-08-09	2015-08-16	716	230	656
240624	2015-06-21	2015-06-28	717	216	656
240625	2015-06-28	2015-07-05	717	216	656
240626	2015-07-05	2015-07-12	717	230	656
240627	2015-07-12	2015-07-19	717	230	656
240628	2015-07-19	2015-07-26	717	238	656
240629	2015-07-26	2015-08-02	717	238	656
240630	2015-08-02	2015-08-09	717	239	656
240631	2015-08-09	2015-08-16	717	239	656
240632	2015-07-19	2015-07-26	718	216	656
240633	2015-07-26	2015-08-02	718	216	656
240634	2015-07-05	2015-07-12	718	229	656
240635	2015-07-12	2015-07-19	718	229	656
240636	2015-06-21	2015-06-28	718	230	656
240637	2015-06-28	2015-07-05	718	230	656
240638	2015-08-02	2015-08-09	718	238	656
240639	2015-08-09	2015-08-16	718	238	656
240640	2015-07-19	2015-07-26	719	216	656
240641	2015-07-26	2015-08-02	719	216	656
240642	2015-06-21	2015-06-28	719	236	656
240643	2015-06-28	2015-07-05	719	236	656
240644	2015-07-05	2015-07-12	719	212	656
240645	2015-07-12	2015-07-19	719	212	656
240646	2015-08-02	2015-08-09	719	212	656
240647	2015-08-09	2015-08-16	719	212	656
240648	2015-08-02	2015-08-09	720	216	656
240649	2015-08-09	2015-08-16	720	216	656
240650	2015-07-05	2015-07-12	720	230	656
240651	2015-07-12	2015-07-19	720	230	656
240652	2015-07-19	2015-07-26	720	230	656
240653	2015-07-26	2015-08-02	720	230	656
240654	2015-06-21	2015-06-28	720	239	656
240655	2015-06-28	2015-07-05	720	239	656
240656	2015-08-02	2015-08-09	721	216	656
240657	2015-08-09	2015-08-16	721	216	656
240658	2015-06-21	2015-06-28	721	212	656
240659	2015-06-28	2015-07-05	721	212	656
240660	2015-07-05	2015-07-12	721	229	656
240661	2015-07-12	2015-07-19	721	229	656
240662	2015-07-19	2015-07-26	721	238	656
240663	2015-07-26	2015-08-02	721	238	656
240664	2015-07-19	2015-07-26	722	212	656
240665	2015-07-26	2015-08-02	722	212	656
240666	2015-06-21	2015-06-28	722	214	656
240667	2015-06-28	2015-07-05	722	214	656
240668	2015-07-05	2015-07-12	722	214	656
240669	2015-07-12	2015-07-19	722	214	656
240670	2015-08-02	2015-08-09	722	239	656
240671	2015-08-09	2015-08-16	722	239	656
240672	2015-07-19	2015-07-26	723	205	656
240673	2015-07-26	2015-08-02	723	205	656
240674	2015-08-02	2015-08-09	723	205	656
240675	2015-08-09	2015-08-16	723	205	656
240676	2015-06-21	2015-06-28	723	214	656
240677	2015-06-28	2015-07-05	723	214	656
240678	2015-07-05	2015-07-12	723	214	656
240679	2015-07-12	2015-07-19	723	214	656
240680	2015-08-02	2015-08-09	724	216	656
240681	2015-08-09	2015-08-16	724	216	656
240682	2015-07-05	2015-07-12	724	230	656
240683	2015-07-12	2015-07-19	724	230	656
240684	2015-06-21	2015-06-28	724	238	656
240685	2015-06-28	2015-07-05	724	238	656
240686	2015-07-19	2015-07-26	724	238	656
240687	2015-07-26	2015-08-02	724	238	656
240688	2015-07-05	2015-07-12	725	216	656
240689	2015-07-12	2015-07-19	725	216	656
240690	2015-07-19	2015-07-26	725	205	656
240691	2015-07-26	2015-08-02	725	205	656
240692	2015-08-02	2015-08-09	725	205	656
240693	2015-08-09	2015-08-16	725	205	656
240694	2015-06-21	2015-06-28	725	238	656
240695	2015-06-28	2015-07-05	725	238	656
240696	2015-07-05	2015-07-12	726	216	656
240697	2015-07-12	2015-07-19	726	216	656
240698	2015-07-19	2015-07-26	726	220	656
240699	2015-07-26	2015-08-02	726	220	656
240700	2015-06-21	2015-06-28	726	238	656
240701	2015-06-28	2015-07-05	726	238	656
240702	2015-08-02	2015-08-09	726	239	656
240703	2015-08-09	2015-08-16	726	239	656
240704	2015-07-05	2015-07-12	727	216	656
240705	2015-07-12	2015-07-19	727	216	656
240706	2015-07-19	2015-07-26	727	238	656
240707	2015-07-26	2015-08-02	727	238	656
240708	2015-06-21	2015-06-28	727	239	656
240709	2015-06-28	2015-07-05	727	239	656
240710	2015-08-02	2015-08-09	727	239	656
240711	2015-08-09	2015-08-16	727	239	656
240712	2015-07-19	2015-07-26	728	216	656
240713	2015-07-26	2015-08-02	728	216	656
240714	2015-06-21	2015-06-28	728	229	656
240715	2015-06-28	2015-07-05	728	229	656
240716	2015-08-02	2015-08-09	728	230	656
240717	2015-08-09	2015-08-16	728	230	656
240718	2015-07-05	2015-07-12	728	239	656
240719	2015-07-12	2015-07-19	728	239	656
240720	2015-07-05	2015-07-12	729	216	656
240721	2015-07-12	2015-07-19	729	216	656
240722	2015-07-19	2015-07-26	729	216	656
240723	2015-07-26	2015-08-02	729	216	656
240724	2015-08-02	2015-08-09	729	238	656
240725	2015-08-09	2015-08-16	729	238	656
240726	2015-06-21	2015-06-28	729	239	656
240727	2015-06-28	2015-07-05	729	239	656
240728	2015-08-02	2015-08-09	730	212	656
240729	2015-08-09	2015-08-16	730	212	656
240730	2015-06-21	2015-06-28	730	220	656
240731	2015-06-28	2015-07-05	730	220	656
240732	2015-07-05	2015-07-12	730	229	656
240733	2015-07-12	2015-07-19	730	229	656
240734	2015-07-19	2015-07-26	730	238	656
240735	2015-07-26	2015-08-02	730	238	656
240736	2015-07-05	2015-07-12	731	216	656
240737	2015-07-12	2015-07-19	731	216	656
240738	2015-07-19	2015-07-26	731	209	656
240739	2015-07-26	2015-08-02	731	209	656
240740	2015-06-21	2015-06-28	731	238	656
240741	2015-06-28	2015-07-05	731	238	656
240742	2015-08-02	2015-08-09	731	238	656
240743	2015-08-09	2015-08-16	731	238	656
240744	2015-07-19	2015-07-26	732	216	656
240745	2015-07-26	2015-08-02	732	216	656
240746	2015-08-02	2015-08-09	732	236	656
240747	2015-08-09	2015-08-16	732	236	656
240748	2015-07-05	2015-07-12	732	251	656
240749	2015-07-12	2015-07-19	732	251	656
240750	2015-06-21	2015-06-28	732	238	656
240751	2015-06-28	2015-07-05	732	238	656
240752	2015-06-21	2015-06-28	733	216	656
240753	2015-06-28	2015-07-05	733	216	656
240754	2015-07-19	2015-07-26	733	216	656
240755	2015-07-26	2015-08-02	733	216	656
240756	2015-07-05	2015-07-12	733	230	656
240757	2015-07-12	2015-07-19	733	230	656
240758	2015-08-02	2015-08-09	733	230	656
240759	2015-08-09	2015-08-16	733	230	656
240760	2015-07-05	2015-07-12	734	216	656
240761	2015-07-12	2015-07-19	734	216	656
240762	2015-08-02	2015-08-09	734	216	656
240763	2015-08-09	2015-08-16	734	216	656
240764	2015-07-19	2015-07-26	734	229	656
240765	2015-07-26	2015-08-02	734	229	656
240766	2015-06-21	2015-06-28	734	239	656
240767	2015-06-28	2015-07-05	734	239	656
240768	2015-07-05	2015-07-12	735	216	656
240769	2015-07-12	2015-07-19	735	216	656
240770	2015-08-02	2015-08-09	735	216	656
240771	2015-08-09	2015-08-16	735	216	656
240772	2015-07-19	2015-07-26	735	251	656
240773	2015-07-26	2015-08-02	735	251	656
240774	2015-06-21	2015-06-28	735	230	656
240775	2015-06-28	2015-07-05	735	230	656
240776	2015-06-21	2015-06-28	736	216	656
240777	2015-06-28	2015-07-05	736	216	656
240778	2015-08-02	2015-08-09	736	216	656
240779	2015-08-09	2015-08-16	736	216	656
240780	2015-07-05	2015-07-12	736	209	656
240781	2015-07-12	2015-07-19	736	209	656
240782	2015-07-19	2015-07-26	736	230	656
240783	2015-07-26	2015-08-02	736	230	656
240784	2015-08-02	2015-08-09	737	216	656
240785	2015-08-09	2015-08-16	737	216	656
240786	2015-06-21	2015-06-28	737	220	656
240787	2015-06-28	2015-07-05	737	220	656
240788	2015-07-05	2015-07-12	737	230	656
240789	2015-07-12	2015-07-19	737	230	656
240790	2015-07-19	2015-07-26	737	238	656
240791	2015-07-26	2015-08-02	737	238	656
240792	2015-08-02	2015-08-09	738	216	656
240793	2015-08-09	2015-08-16	738	216	656
240794	2015-06-21	2015-06-28	738	211	656
240795	2015-06-28	2015-07-05	738	211	656
240796	2015-07-05	2015-07-12	738	211	656
240797	2015-07-12	2015-07-19	738	211	656
240798	2015-07-19	2015-07-26	738	238	656
240799	2015-07-26	2015-08-02	738	238	656
240800	2015-06-21	2015-06-28	739	216	656
240801	2015-06-28	2015-07-05	739	216	656
240802	2015-07-19	2015-07-26	739	216	656
240803	2015-07-26	2015-08-02	739	216	656
240804	2015-08-02	2015-08-09	739	246	656
240805	2015-08-09	2015-08-16	739	246	656
240806	2015-07-05	2015-07-12	739	258	656
240807	2015-07-12	2015-07-19	739	258	656
240808	2015-08-02	2015-08-09	740	216	656
240809	2015-08-09	2015-08-16	740	216	656
240810	2015-06-21	2015-06-28	740	205	656
240811	2015-06-28	2015-07-05	740	205	656
240812	2015-07-05	2015-07-12	740	205	656
240813	2015-07-12	2015-07-19	740	205	656
240814	2015-07-19	2015-07-26	740	238	656
240815	2015-07-26	2015-08-02	740	238	656
240816	2015-06-21	2015-06-28	741	216	656
240817	2015-06-28	2015-07-05	741	216	656
240818	2015-07-19	2015-07-26	741	216	656
240819	2015-07-26	2015-08-02	741	216	656
240820	2015-07-05	2015-07-12	741	220	656
240821	2015-07-12	2015-07-19	741	220	656
240822	2015-08-02	2015-08-09	741	229	656
240823	2015-08-09	2015-08-16	741	229	656
240824	2015-06-21	2015-06-28	742	216	656
240825	2015-06-28	2015-07-05	742	216	656
240826	2015-08-02	2015-08-09	742	230	656
240827	2015-08-09	2015-08-16	742	230	656
240828	2015-07-05	2015-07-12	742	238	656
240829	2015-07-12	2015-07-19	742	238	656
240830	2015-07-19	2015-07-26	742	238	656
240831	2015-07-26	2015-08-02	742	238	656
240832	2015-08-02	2015-08-09	743	216	656
240833	2015-08-09	2015-08-16	743	216	656
240834	2015-06-21	2015-06-28	743	247	656
240835	2015-06-28	2015-07-05	743	247	656
240836	2015-07-05	2015-07-12	743	247	656
240837	2015-07-12	2015-07-19	743	247	656
240838	2015-07-19	2015-07-26	743	229	656
240839	2015-07-26	2015-08-02	743	229	656
240840	2015-06-21	2015-06-28	744	214	656
240841	2015-06-28	2015-07-05	744	214	656
240842	2015-07-05	2015-07-12	744	214	656
240843	2015-07-12	2015-07-19	744	214	656
240844	2015-07-19	2015-07-26	744	232	656
240845	2015-07-26	2015-08-02	744	232	656
240846	2015-08-02	2015-08-09	744	232	656
240847	2015-08-09	2015-08-16	744	232	656
240848	2015-07-19	2015-07-26	745	216	656
240849	2015-07-26	2015-08-02	745	216	656
240850	2015-06-21	2015-06-28	745	219	656
240851	2015-06-28	2015-07-05	745	219	656
240852	2015-07-05	2015-07-12	745	219	656
240853	2015-07-12	2015-07-19	745	219	656
240854	2015-08-02	2015-08-09	745	229	656
240855	2015-08-09	2015-08-16	745	229	656
240856	2015-07-19	2015-07-26	746	224	656
240857	2015-07-26	2015-08-02	746	224	656
240858	2015-06-21	2015-06-28	746	232	656
240859	2015-06-28	2015-07-05	746	232	656
240860	2015-07-05	2015-07-12	746	232	656
240861	2015-07-12	2015-07-19	746	232	656
240862	2015-08-02	2015-08-09	746	239	656
240863	2015-08-09	2015-08-16	746	239	656
240864	2015-06-21	2015-06-28	747	216	656
240865	2015-06-28	2015-07-05	747	216	656
240866	2015-07-05	2015-07-12	747	245	656
240867	2015-07-12	2015-07-19	747	245	656
240868	2015-07-19	2015-07-26	747	233	656
240869	2015-07-26	2015-08-02	747	233	656
240870	2015-08-02	2015-08-09	747	233	656
240871	2015-08-09	2015-08-16	747	233	656
240872	2015-06-21	2015-06-28	748	216	656
240873	2015-06-28	2015-07-05	748	216	656
240874	2015-07-19	2015-07-26	748	216	656
240875	2015-07-26	2015-08-02	748	216	656
240876	2015-08-02	2015-08-09	748	224	656
240877	2015-08-09	2015-08-16	748	224	656
240878	2015-07-05	2015-07-12	748	238	656
240879	2015-07-12	2015-07-19	748	238	656
240880	2015-07-05	2015-07-12	749	216	656
240881	2015-07-12	2015-07-19	749	216	656
240882	2015-07-19	2015-07-26	749	216	656
240883	2015-07-26	2015-08-02	749	216	656
240884	2015-06-21	2015-06-28	749	245	656
240885	2015-06-28	2015-07-05	749	245	656
240886	2015-08-02	2015-08-09	749	245	656
240887	2015-08-09	2015-08-16	749	245	656
240888	2015-08-02	2015-08-09	750	245	656
240889	2015-08-09	2015-08-16	750	245	656
240890	2015-07-19	2015-07-26	750	220	656
240891	2015-07-26	2015-08-02	750	220	656
240892	2015-06-21	2015-06-28	750	256	656
240893	2015-06-28	2015-07-05	750	256	656
240894	2015-07-05	2015-07-12	750	256	656
240895	2015-07-12	2015-07-19	750	256	656
240896	2015-07-19	2015-07-26	751	216	656
240897	2015-07-26	2015-08-02	751	216	656
240898	2015-08-02	2015-08-09	751	245	656
240899	2015-08-09	2015-08-16	751	245	656
240900	2015-06-21	2015-06-28	751	235	656
240901	2015-06-28	2015-07-05	751	235	656
240902	2015-07-05	2015-07-12	751	235	656
240903	2015-07-12	2015-07-19	751	235	656
240904	2015-08-02	2015-08-09	752	216	656
240905	2015-08-09	2015-08-16	752	216	656
240906	2015-07-19	2015-07-26	752	224	656
240907	2015-07-26	2015-08-02	752	224	656
240908	2015-06-21	2015-06-28	752	256	656
240909	2015-06-28	2015-07-05	752	256	656
240910	2015-07-05	2015-07-12	752	256	656
240911	2015-07-12	2015-07-19	752	256	656
240912	2015-07-19	2015-07-26	753	211	656
240913	2015-07-26	2015-08-02	753	211	656
240914	2015-08-02	2015-08-09	753	211	656
240915	2015-08-09	2015-08-16	753	211	656
240916	2015-06-21	2015-06-28	753	233	656
240917	2015-06-28	2015-07-05	753	233	656
240918	2015-07-05	2015-07-12	753	233	656
240919	2015-07-12	2015-07-19	753	233	656
240920	2015-07-05	2015-07-12	754	245	656
240921	2015-07-12	2015-07-19	754	245	656
240922	2015-07-19	2015-07-26	754	214	656
240923	2015-07-26	2015-08-02	754	214	656
240924	2015-08-02	2015-08-09	754	214	656
240925	2015-08-09	2015-08-16	754	214	656
240926	2015-06-21	2015-06-28	754	238	656
240927	2015-06-28	2015-07-05	754	238	656
240928	2015-06-21	2015-06-28	755	216	656
240929	2015-06-28	2015-07-05	755	216	656
240930	2015-08-02	2015-08-09	755	216	656
240931	2015-08-09	2015-08-16	755	216	656
240932	2015-07-19	2015-07-26	755	245	656
240933	2015-07-26	2015-08-02	755	245	656
240934	2015-07-05	2015-07-12	755	239	656
240935	2015-07-12	2015-07-19	755	239	656
240936	2015-08-02	2015-08-09	756	224	656
240937	2015-08-09	2015-08-16	756	224	656
240938	2015-07-19	2015-07-26	756	225	656
240939	2015-07-26	2015-08-02	756	225	656
240940	2015-06-21	2015-06-28	756	256	656
240941	2015-06-28	2015-07-05	756	256	656
240942	2015-07-05	2015-07-12	756	256	656
240943	2015-07-12	2015-07-19	756	256	656
240944	2015-07-05	2015-07-12	757	216	656
240945	2015-07-12	2015-07-19	757	216	656
240946	2015-07-19	2015-07-26	757	216	656
240947	2015-07-26	2015-08-02	757	216	656
240948	2015-06-21	2015-06-28	757	224	656
240949	2015-06-28	2015-07-05	757	224	656
240950	2015-08-02	2015-08-09	757	251	656
240951	2015-08-09	2015-08-16	757	251	656
240952	2015-07-05	2015-07-12	758	216	656
240953	2015-07-12	2015-07-19	758	216	656
240954	2015-06-21	2015-06-28	758	245	656
240955	2015-06-28	2015-07-05	758	245	656
240956	2015-07-19	2015-07-26	758	205	656
240957	2015-07-26	2015-08-02	758	205	656
240958	2015-08-02	2015-08-09	758	205	656
240959	2015-08-09	2015-08-16	758	205	656
240960	2015-07-05	2015-07-12	759	216	656
240961	2015-07-12	2015-07-19	759	216	656
240962	2015-08-02	2015-08-09	759	216	656
240963	2015-08-09	2015-08-16	759	216	656
240964	2015-07-19	2015-07-26	759	224	656
240965	2015-07-26	2015-08-02	759	224	656
240966	2015-06-21	2015-06-28	759	245	656
240967	2015-06-28	2015-07-05	759	245	656
240968	2015-07-05	2015-07-12	760	216	656
240969	2015-07-12	2015-07-19	760	216	656
240970	2015-06-21	2015-06-28	760	224	656
240971	2015-06-28	2015-07-05	760	224	656
240972	2015-07-19	2015-07-26	760	235	656
240973	2015-07-26	2015-08-02	760	235	656
240974	2015-08-02	2015-08-09	760	235	656
240975	2015-08-09	2015-08-16	760	235	656
240976	2015-07-05	2015-07-12	761	224	656
240977	2015-07-12	2015-07-19	761	224	656
240978	2015-07-19	2015-07-26	761	224	656
240979	2015-07-26	2015-08-02	761	224	656
240980	2015-06-21	2015-06-28	761	225	656
240981	2015-06-28	2015-07-05	761	225	656
240982	2015-08-02	2015-08-09	761	220	656
240983	2015-08-09	2015-08-16	761	220	656
240984	2015-07-05	2015-07-12	762	245	656
240985	2015-07-12	2015-07-19	762	245	656
240986	2015-07-19	2015-07-26	762	234	656
240987	2015-07-26	2015-08-02	762	234	656
240988	2015-08-02	2015-08-09	762	234	656
240989	2015-08-09	2015-08-16	762	234	656
240990	2015-06-21	2015-06-28	762	239	656
240991	2015-06-28	2015-07-05	762	239	656
240992	2015-07-05	2015-07-12	763	216	656
240993	2015-07-12	2015-07-19	763	216	656
240994	2015-06-21	2015-06-28	763	245	656
240995	2015-06-28	2015-07-05	763	245	656
240996	2015-07-19	2015-07-26	763	233	656
240997	2015-07-26	2015-08-02	763	233	656
240998	2015-08-02	2015-08-09	763	233	656
240999	2015-08-09	2015-08-16	763	233	656
241000	2015-06-21	2015-06-28	764	216	656
241001	2015-06-28	2015-07-05	764	216	656
241002	2015-07-05	2015-07-12	764	224	656
241003	2015-07-12	2015-07-19	764	224	656
241004	2015-07-19	2015-07-26	764	236	656
241005	2015-07-26	2015-08-02	764	236	656
241006	2015-08-02	2015-08-09	764	238	656
241007	2015-08-09	2015-08-16	764	238	656
241008	2015-06-21	2015-06-28	765	214	656
241009	2015-06-28	2015-07-05	765	214	656
241010	2015-07-05	2015-07-12	765	214	656
241011	2015-07-12	2015-07-19	765	214	656
241012	2015-07-19	2015-07-26	765	232	656
241013	2015-07-26	2015-08-02	765	232	656
241014	2015-08-02	2015-08-09	765	232	656
241015	2015-08-09	2015-08-16	765	232	656
241016	2015-08-02	2015-08-09	766	216	656
241017	2015-08-09	2015-08-16	766	216	656
241018	2015-07-19	2015-07-26	766	238	656
241019	2015-07-26	2015-08-02	766	238	656
241020	2015-06-21	2015-06-28	766	242	656
241021	2015-06-28	2015-07-05	766	242	656
241022	2015-07-05	2015-07-12	766	242	656
241023	2015-07-12	2015-07-19	766	242	656
241024	2015-08-02	2015-08-09	767	236	656
241025	2015-08-09	2015-08-16	767	236	656
241026	2015-07-19	2015-07-26	767	245	656
241027	2015-07-26	2015-08-02	767	245	656
241028	2015-06-21	2015-06-28	767	235	656
241029	2015-06-28	2015-07-05	767	235	656
241030	2015-07-05	2015-07-12	767	235	656
241031	2015-07-12	2015-07-19	767	235	656
241032	2015-06-21	2015-06-28	768	216	656
241033	2015-06-28	2015-07-05	768	216	656
241034	2015-08-02	2015-08-09	768	216	656
241035	2015-08-09	2015-08-16	768	216	656
241036	2015-07-05	2015-07-12	768	245	656
241037	2015-07-12	2015-07-19	768	245	656
241038	2015-07-19	2015-07-26	768	245	656
241039	2015-07-26	2015-08-02	768	245	656
241040	2015-06-21	2015-06-28	769	233	656
241041	2015-06-28	2015-07-05	769	233	656
241042	2015-07-05	2015-07-12	769	233	656
241043	2015-07-12	2015-07-19	769	233	656
241044	2015-07-19	2015-07-26	769	235	656
241045	2015-07-26	2015-08-02	769	235	656
241046	2015-08-02	2015-08-09	769	235	656
241047	2015-08-09	2015-08-16	769	235	656
241048	2015-07-19	2015-07-26	770	216	656
241049	2015-07-26	2015-08-02	770	216	656
241050	2015-08-02	2015-08-09	770	224	656
241051	2015-08-09	2015-08-16	770	224	656
241052	2015-06-21	2015-06-28	770	237	656
241053	2015-06-28	2015-07-05	770	237	656
241054	2015-07-05	2015-07-12	770	237	656
241055	2015-07-12	2015-07-19	770	237	656
241056	2015-08-02	2015-08-09	771	224	656
241057	2015-08-09	2015-08-16	771	224	656
241058	2015-06-21	2015-06-28	771	211	656
241059	2015-06-28	2015-07-05	771	211	656
241060	2015-07-05	2015-07-12	771	211	656
241061	2015-07-12	2015-07-19	771	211	656
241062	2015-07-19	2015-07-26	771	229	656
241063	2015-07-26	2015-08-02	771	229	656
241064	2015-06-21	2015-06-28	772	216	656
241065	2015-06-28	2015-07-05	772	216	656
241066	2015-07-19	2015-07-26	772	224	656
241067	2015-07-26	2015-08-02	772	224	656
241068	2015-07-05	2015-07-12	772	225	656
241069	2015-07-12	2015-07-19	772	225	656
241070	2015-08-02	2015-08-09	772	209	656
241071	2015-08-09	2015-08-16	772	209	656
241072	2015-06-21	2015-06-28	773	216	656
241073	2015-06-28	2015-07-05	773	216	656
241074	2015-08-02	2015-08-09	773	224	656
241075	2015-08-09	2015-08-16	773	224	656
241076	2015-07-19	2015-07-26	773	251	656
241077	2015-07-26	2015-08-02	773	251	656
241078	2015-07-05	2015-07-12	773	229	656
241079	2015-07-12	2015-07-19	773	229	656
241080	2015-07-05	2015-07-12	774	216	656
241081	2015-07-12	2015-07-19	774	216	656
241082	2015-06-21	2015-06-28	774	245	656
241083	2015-06-28	2015-07-05	774	245	656
241084	2015-07-19	2015-07-26	774	242	656
241085	2015-07-26	2015-08-02	774	242	656
241086	2015-08-02	2015-08-09	774	242	656
241087	2015-08-09	2015-08-16	774	242	656
241088	2015-07-05	2015-07-12	775	216	656
241089	2015-07-12	2015-07-19	775	216	656
241090	2015-06-21	2015-06-28	775	236	656
241091	2015-06-28	2015-07-05	775	236	656
241092	2015-07-19	2015-07-26	775	234	656
241093	2015-07-26	2015-08-02	775	234	656
241094	2015-08-02	2015-08-09	775	234	656
241095	2015-08-09	2015-08-16	775	234	656
241096	2015-06-21	2015-06-28	776	216	656
241097	2015-06-28	2015-07-05	776	216	656
241098	2015-07-05	2015-07-12	776	251	656
241099	2015-07-12	2015-07-19	776	251	656
241100	2015-07-19	2015-07-26	776	235	656
241101	2015-07-26	2015-08-02	776	235	656
241102	2015-08-02	2015-08-09	776	235	656
241103	2015-08-09	2015-08-16	776	235	656
241104	2015-07-19	2015-07-26	777	216	656
241105	2015-07-26	2015-08-02	777	216	656
241106	2015-08-02	2015-08-09	777	245	656
241107	2015-08-09	2015-08-16	777	245	656
241108	2015-06-21	2015-06-28	777	234	656
241109	2015-06-28	2015-07-05	777	234	656
241110	2015-07-05	2015-07-12	777	234	656
241111	2015-07-12	2015-07-19	777	234	656
241112	2015-07-05	2015-07-12	778	216	656
241113	2015-07-12	2015-07-19	778	216	656
241114	2015-08-02	2015-08-09	778	216	656
241115	2015-08-09	2015-08-16	778	216	656
241116	2015-06-21	2015-06-28	778	224	656
241117	2015-06-28	2015-07-05	778	224	656
241118	2015-07-19	2015-07-26	778	245	656
241119	2015-07-26	2015-08-02	778	245	656
241120	2015-06-21	2015-06-28	779	224	656
241121	2015-06-28	2015-07-05	779	224	656
241122	2015-07-19	2015-07-26	779	224	656
241123	2015-07-26	2015-08-02	779	245	656
241124	2015-08-02	2015-08-09	779	245	656
241125	2015-08-09	2015-08-16	779	245	656
241126	2015-07-05	2015-07-12	779	212	656
241127	2015-07-12	2015-07-19	779	212	656
241128	2015-07-05	2015-07-12	780	216	656
241129	2015-07-12	2015-07-19	780	216	656
241130	2015-08-02	2015-08-09	780	216	656
241131	2015-08-09	2015-08-16	780	216	656
241132	2015-06-21	2015-06-28	780	245	656
241133	2015-06-28	2015-07-05	780	245	656
241134	2015-07-19	2015-07-26	780	246	656
241135	2015-07-26	2015-08-02	780	246	656
241136	2015-08-02	2015-08-09	781	224	656
241137	2015-08-09	2015-08-16	781	224	656
241138	2015-07-19	2015-07-26	781	245	656
241139	2015-07-26	2015-08-02	781	245	656
241140	2015-06-21	2015-06-28	781	211	656
241141	2015-06-28	2015-07-05	781	211	656
241142	2015-07-05	2015-07-12	781	211	656
241143	2015-07-12	2015-07-19	781	211	656
241144	2015-07-19	2015-07-26	782	224	656
241145	2015-07-26	2015-08-02	782	245	656
241146	2015-08-02	2015-08-09	782	245	656
241147	2015-08-09	2015-08-16	782	245	656
241148	2015-06-21	2015-06-28	782	233	656
241149	2015-06-28	2015-07-05	782	233	656
241150	2015-07-05	2015-07-12	782	233	656
241151	2015-07-12	2015-07-19	782	233	656
241152	2015-08-02	2015-08-09	783	216	656
241153	2015-08-09	2015-08-16	783	216	656
241154	2015-07-19	2015-07-26	783	224	656
241155	2015-07-26	2015-08-02	783	224	656
241156	2015-06-21	2015-06-28	783	242	656
241157	2015-06-28	2015-07-05	783	242	656
241158	2015-07-05	2015-07-12	783	242	656
241159	2015-07-12	2015-07-19	783	242	656
241160	2015-06-21	2015-06-28	784	216	656
241161	2015-06-28	2015-07-05	784	216	656
241162	2015-08-02	2015-08-09	784	216	656
241163	2015-08-09	2015-08-16	784	216	656
241164	2015-07-05	2015-07-12	784	246	656
241165	2015-07-12	2015-07-19	784	246	656
241166	2015-07-19	2015-07-26	784	212	656
241167	2015-07-26	2015-08-02	784	212	656
241168	2015-06-21	2015-06-28	785	216	656
241169	2015-06-28	2015-07-05	785	216	656
241170	2015-08-02	2015-08-09	785	216	656
241171	2015-08-09	2015-08-16	785	216	656
241172	2015-07-05	2015-07-12	785	224	656
241173	2015-07-12	2015-07-19	785	224	656
241174	2015-07-19	2015-07-26	785	245	656
241175	2015-07-26	2015-08-02	785	245	656
241176	2015-06-21	2015-06-28	786	216	656
241177	2015-06-28	2015-07-05	786	216	656
241178	2015-08-02	2015-08-09	786	216	656
241179	2015-08-09	2015-08-16	786	216	656
241180	2015-07-19	2015-07-26	786	245	656
241181	2015-07-26	2015-08-02	786	245	656
241182	2015-07-05	2015-07-12	786	261	656
241183	2015-07-12	2015-07-19	786	261	656
241184	2015-07-05	2015-07-12	787	216	656
241185	2015-07-12	2015-07-19	787	216	656
241186	2015-06-21	2015-06-28	787	225	656
241187	2015-06-28	2015-07-05	787	225	656
241188	2015-07-19	2015-07-26	787	232	656
241189	2015-07-26	2015-08-02	787	232	656
241190	2015-08-02	2015-08-09	787	232	656
241191	2015-08-09	2015-08-16	787	232	656
241192	2015-06-21	2015-06-28	788	216	656
241193	2015-06-28	2015-07-05	788	216	656
241194	2015-07-19	2015-07-26	788	216	656
241195	2015-07-26	2015-08-02	788	216	656
241196	2015-07-05	2015-07-12	788	224	656
241197	2015-07-12	2015-07-19	788	224	656
241198	2015-08-02	2015-08-09	788	225	656
241199	2015-08-09	2015-08-16	788	225	656
241200	2015-07-05	2015-07-12	789	216	656
241201	2015-07-12	2015-07-19	789	216	656
241202	2015-06-21	2015-06-28	789	224	656
241203	2015-06-28	2015-07-05	789	224	656
241204	2015-07-19	2015-07-26	789	214	656
241205	2015-07-26	2015-08-02	789	214	656
241206	2015-08-02	2015-08-09	789	214	656
241207	2015-08-09	2015-08-16	789	214	656
241208	2015-06-21	2015-06-28	790	216	656
241209	2015-06-28	2015-07-05	790	216	656
241210	2015-07-05	2015-07-12	790	245	656
241211	2015-07-12	2015-07-19	790	245	656
241212	2015-07-19	2015-07-26	790	235	656
241213	2015-07-26	2015-08-02	790	235	656
241214	2015-08-02	2015-08-09	790	235	656
241215	2015-08-09	2015-08-16	790	235	656
241216	2015-08-02	2015-08-09	791	216	656
241217	2015-08-09	2015-08-16	791	216	656
241218	2015-06-21	2015-06-28	791	232	656
241219	2015-06-28	2015-07-05	791	232	656
241220	2015-07-05	2015-07-12	791	232	656
241221	2015-07-12	2015-07-19	791	232	656
241222	2015-07-19	2015-07-26	791	261	656
241223	2015-07-26	2015-08-02	791	261	656
241224	2015-08-02	2015-08-09	792	216	656
241225	2015-08-09	2015-08-16	792	216	656
241226	2015-07-19	2015-07-26	792	225	656
241227	2015-07-26	2015-08-02	792	225	656
241228	2015-06-21	2015-06-28	792	232	656
241229	2015-06-28	2015-07-05	792	232	656
241230	2015-07-05	2015-07-12	792	232	656
241231	2015-07-12	2015-07-19	792	232	656
241232	2015-07-05	2015-07-12	793	216	656
241233	2015-07-12	2015-07-19	793	216	656
241234	2015-06-21	2015-06-28	793	251	656
241235	2015-06-28	2015-07-05	793	251	656
241236	2015-07-19	2015-07-26	793	232	656
241237	2015-07-26	2015-08-02	793	232	656
241238	2015-08-02	2015-08-09	793	232	656
241239	2015-08-09	2015-08-16	793	232	656
241240	2015-07-05	2015-07-12	794	216	656
241241	2015-07-12	2015-07-19	794	216	656
241242	2015-06-21	2015-06-28	794	212	656
241243	2015-06-28	2015-07-05	794	212	656
241244	2015-07-19	2015-07-26	794	234	656
241245	2015-07-26	2015-08-02	794	234	656
241246	2015-08-02	2015-08-09	794	234	656
241247	2015-08-09	2015-08-16	794	234	656
241248	2015-07-19	2015-07-26	795	216	656
241249	2015-07-26	2015-08-02	795	216	656
241250	2015-06-21	2015-06-28	795	224	656
241251	2015-06-28	2015-07-05	795	224	656
241252	2015-07-05	2015-07-12	795	246	656
241253	2015-07-12	2015-07-19	795	246	656
241254	2015-08-02	2015-08-09	795	230	656
241255	2015-08-09	2015-08-16	795	230	656
241256	2015-07-05	2015-07-12	796	216	656
241257	2015-07-12	2015-07-19	796	216	656
241258	2015-07-19	2015-07-26	796	216	656
241259	2015-07-26	2015-08-02	796	216	656
241260	2015-06-21	2015-06-28	796	245	656
241261	2015-06-28	2015-07-05	796	245	656
241262	2015-08-02	2015-08-09	796	251	656
241263	2015-08-09	2015-08-16	796	251	656
241264	2015-07-05	2015-07-12	797	224	656
241265	2015-07-12	2015-07-19	797	224	656
241266	2015-06-21	2015-06-28	797	246	656
241267	2015-06-28	2015-07-05	797	246	656
241268	2015-07-19	2015-07-26	797	242	656
241269	2015-07-26	2015-08-02	797	242	656
241270	2015-08-02	2015-08-09	797	242	656
241271	2015-08-09	2015-08-16	797	242	656
241272	2015-06-21	2015-06-28	798	216	656
241273	2015-06-28	2015-07-05	798	216	656
241274	2015-07-19	2015-07-26	798	216	656
241275	2015-07-26	2015-08-02	798	216	656
241276	2015-08-02	2015-08-09	798	229	656
241277	2015-08-09	2015-08-16	798	229	656
241278	2015-07-05	2015-07-12	798	230	656
241279	2015-07-12	2015-07-19	798	230	656
240016	2015-07-19	2015-07-26	559	219	656
240017	2015-07-26	2015-08-02	559	219	656
240018	2015-08-02	2015-08-09	559	219	656
240019	2015-08-09	2015-08-16	559	219	656
240020	2015-07-05	2015-07-12	559	229	656
240021	2015-07-12	2015-07-19	559	229	656
240022	2015-06-21	2015-06-28	559	238	656
240023	2015-06-28	2015-07-05	559	238	656
240024	2015-07-05	2015-07-12	560	216	656
240025	2015-07-12	2015-07-19	560	216	656
240026	2015-07-19	2015-07-26	560	216	656
240027	2015-07-26	2015-08-02	560	216	656
240028	2015-06-21	2015-06-28	560	230	656
240029	2015-06-28	2015-07-05	560	230	656
240030	2015-08-02	2015-08-09	560	230	656
240031	2015-08-09	2015-08-16	560	230	656
240032	2015-06-21	2015-06-28	561	216	656
240033	2015-06-28	2015-07-05	561	216	656
240034	2015-08-02	2015-08-09	561	216	656
240035	2015-08-09	2015-08-16	561	216	656
240036	2015-07-05	2015-07-12	561	238	656
240037	2015-07-12	2015-07-19	561	238	656
240038	2015-07-19	2015-07-26	561	239	656
240039	2015-07-26	2015-08-02	561	239	656
240040	2015-08-02	2015-08-09	562	216	656
240041	2015-08-09	2015-08-16	562	216	656
240042	2015-06-21	2015-06-28	562	208	656
240043	2015-06-28	2015-07-05	562	208	656
240044	2015-07-05	2015-07-12	562	246	656
240045	2015-07-12	2015-07-19	562	246	656
240046	2015-07-19	2015-07-26	562	229	656
240047	2015-07-26	2015-08-02	562	229	656
240048	2015-06-21	2015-06-28	563	216	656
240049	2015-06-28	2015-07-05	563	216	656
240050	2015-07-19	2015-07-26	563	216	656
240051	2015-07-26	2015-08-02	563	216	656
240052	2015-07-05	2015-07-12	563	212	656
240053	2015-07-12	2015-07-19	563	212	656
240054	2015-08-02	2015-08-09	563	230	656
240055	2015-08-09	2015-08-16	563	230	656
240056	2015-07-05	2015-07-12	564	216	656
240057	2015-07-12	2015-07-19	564	216	656
240058	2015-07-19	2015-07-26	564	220	656
240059	2015-07-26	2015-08-02	564	220	656
240060	2015-08-02	2015-08-09	564	229	656
240061	2015-08-09	2015-08-16	564	229	656
240062	2015-06-21	2015-06-28	564	230	656
240063	2015-06-28	2015-07-05	564	230	656
240064	2015-06-21	2015-06-28	565	216	656
240065	2015-06-28	2015-07-05	565	216	656
240066	2015-07-19	2015-07-26	565	246	656
240067	2015-07-26	2015-08-02	565	246	656
240068	2015-07-05	2015-07-12	565	220	656
240069	2015-07-12	2015-07-19	565	220	656
240070	2015-08-02	2015-08-09	565	239	656
240071	2015-08-09	2015-08-16	565	239	656
240072	2015-07-05	2015-07-12	566	216	656
240073	2015-07-12	2015-07-19	566	216	656
240074	2015-07-19	2015-07-26	566	214	656
240075	2015-07-26	2015-08-02	566	214	656
240076	2015-08-02	2015-08-09	566	214	656
240077	2015-08-09	2015-08-16	566	214	656
240078	2015-06-21	2015-06-28	566	220	656
240079	2015-06-28	2015-07-05	566	220	656
240080	2015-07-19	2015-07-26	567	246	656
240081	2015-07-26	2015-08-02	567	246	656
240082	2015-06-21	2015-06-28	567	219	656
240083	2015-06-28	2015-07-05	567	219	656
240084	2015-07-05	2015-07-12	567	219	656
240085	2015-07-12	2015-07-19	567	219	656
240086	2015-08-02	2015-08-09	567	258	656
240087	2015-08-09	2015-08-16	567	258	656
240088	2015-06-21	2015-06-28	568	211	656
240089	2015-06-28	2015-07-05	568	211	656
240090	2015-07-05	2015-07-12	568	211	656
240091	2015-07-12	2015-07-19	568	211	656
240092	2015-07-19	2015-07-26	568	220	656
240093	2015-07-26	2015-08-02	568	220	656
240094	2015-08-02	2015-08-09	568	230	656
240095	2015-08-09	2015-08-16	568	230	656
240096	2015-06-21	2015-06-28	569	236	656
240097	2015-06-28	2015-07-05	569	236	656
240098	2015-07-19	2015-07-26	569	214	656
240099	2015-07-26	2015-08-02	569	214	656
240100	2015-08-02	2015-08-09	569	214	656
240101	2015-08-09	2015-08-16	569	214	656
240102	2015-07-05	2015-07-12	569	238	656
240103	2015-07-12	2015-07-19	569	238	656
240104	2015-06-21	2015-06-28	570	216	656
240105	2015-06-28	2015-07-05	570	216	656
240106	2015-07-19	2015-07-26	570	216	656
240107	2015-07-26	2015-08-02	570	216	656
240108	2015-08-02	2015-08-09	570	229	656
240109	2015-08-09	2015-08-16	570	229	656
240110	2015-07-05	2015-07-12	570	230	656
240111	2015-07-12	2015-07-19	570	230	656
240112	2015-06-21	2015-06-28	571	216	656
240113	2015-06-28	2015-07-05	571	216	656
240114	2015-07-19	2015-07-26	571	216	656
240115	2015-07-26	2015-08-02	571	216	656
240116	2015-08-02	2015-08-09	571	212	656
240117	2015-08-09	2015-08-16	571	212	656
240118	2015-07-05	2015-07-12	571	238	656
240119	2015-07-12	2015-07-19	571	238	656
240120	2015-07-05	2015-07-12	572	216	656
240121	2015-07-12	2015-07-19	572	216	656
240122	2015-06-21	2015-06-28	572	230	656
240123	2015-06-28	2015-07-05	572	230	656
240124	2015-07-19	2015-07-26	572	230	656
240125	2015-07-26	2015-08-02	572	230	656
240126	2015-08-02	2015-08-09	572	239	656
240127	2015-08-09	2015-08-16	572	239	656
240128	2015-06-21	2015-06-28	573	216	656
240129	2015-06-28	2015-07-05	573	216	656
240130	2015-07-19	2015-07-26	573	216	656
240131	2015-07-26	2015-08-02	573	216	656
240132	2015-08-02	2015-08-09	573	246	656
240133	2015-08-09	2015-08-16	573	246	656
240134	2015-07-05	2015-07-12	573	212	656
240135	2015-07-12	2015-07-19	573	212	656
240136	2015-07-19	2015-07-26	574	216	656
240137	2015-07-26	2015-08-02	574	216	656
240138	2015-06-21	2015-06-28	574	211	656
240139	2015-06-28	2015-07-05	574	211	656
240140	2015-07-05	2015-07-12	574	211	656
240141	2015-07-12	2015-07-19	574	211	656
240142	2015-08-02	2015-08-09	574	238	656
240143	2015-08-09	2015-08-16	574	238	656
240144	2015-07-05	2015-07-12	575	216	656
240145	2015-07-12	2015-07-19	575	216	656
240146	2015-08-02	2015-08-09	575	216	656
240147	2015-08-09	2015-08-16	575	216	656
240148	2015-07-19	2015-07-26	575	238	656
240149	2015-07-26	2015-08-02	575	238	656
240150	2015-06-21	2015-06-28	575	258	656
240151	2015-06-28	2015-07-05	575	258	656
240152	2015-07-05	2015-07-12	576	216	656
240153	2015-07-12	2015-07-19	576	216	656
240154	2015-08-02	2015-08-09	576	216	656
240155	2015-08-09	2015-08-16	576	216	656
240156	2015-07-19	2015-07-26	576	229	656
240157	2015-07-26	2015-08-02	576	229	656
240158	2015-06-21	2015-06-28	576	239	656
240159	2015-06-28	2015-07-05	576	239	656
240160	2015-07-19	2015-07-26	577	216	656
240161	2015-07-26	2015-08-02	577	216	656
240162	2015-07-05	2015-07-12	577	236	656
240163	2015-07-12	2015-07-19	577	236	656
240164	2015-06-21	2015-06-28	577	220	656
240165	2015-06-28	2015-07-05	577	220	656
240166	2015-08-02	2015-08-09	577	230	656
240167	2015-08-09	2015-08-16	577	230	656
240168	2015-07-19	2015-07-26	578	216	656
240169	2015-07-26	2015-08-02	578	216	656
240170	2015-06-21	2015-06-28	578	214	656
240171	2015-06-28	2015-07-05	578	214	656
240172	2015-07-05	2015-07-12	578	214	656
240173	2015-07-12	2015-07-19	578	214	656
240174	2015-08-02	2015-08-09	578	239	656
240175	2015-08-09	2015-08-16	578	239	656
240176	2015-08-02	2015-08-09	579	216	656
240177	2015-08-09	2015-08-16	579	216	656
240178	2015-06-21	2015-06-28	579	229	656
240179	2015-06-28	2015-07-05	579	229	656
240180	2015-07-05	2015-07-12	579	230	656
240181	2015-07-12	2015-07-19	579	230	656
240182	2015-07-19	2015-07-26	579	230	656
240183	2015-07-26	2015-08-02	579	230	656
240184	2015-07-19	2015-07-26	580	216	656
240185	2015-07-26	2015-08-02	580	216	656
240186	2015-06-21	2015-06-28	580	214	656
240187	2015-06-28	2015-07-05	580	214	656
240188	2015-07-05	2015-07-12	580	214	656
240189	2015-07-12	2015-07-19	580	214	656
240190	2015-08-02	2015-08-09	580	239	656
240191	2015-08-09	2015-08-16	580	239	656
240192	2015-08-02	2015-08-09	581	216	656
240193	2015-08-09	2015-08-16	581	216	656
240194	2015-07-19	2015-07-26	581	236	656
240195	2015-07-26	2015-08-02	581	236	656
\.


--
-- Name: rotationSchedule_app_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sw
--

SELECT pg_catalog.setval('"rotationSchedule_app_event_id_seq"', 241279, true);


--
-- Data for Name: rotationSchedule_app_program; Type: TABLE DATA; Schema: public; Owner: sw
--

COPY "rotationSchedule_app_program" (id, name, "startDate", "endDate", "rigidXY", "minClinicWeeks", "windowSize") FROM stdin;
1	Barnes Jewish Internal Medicine	2015-06-21	2015-08-15	f	2	8
\.


--
-- Name: rotationSchedule_app_program_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sw
--

SELECT pg_catalog.setval('"rotationSchedule_app_program_id_seq"', 1, true);


--
-- Data for Name: rotationSchedule_app_resident; Type: TABLE DATA; Schema: public; Owner: sw
--

COPY "rotationSchedule_app_resident" (id, name, "inProgram", "vacationStart1", "vacationEnd1", "vacationStart2", "vacationEnd2", "vacationStart3", "vacationEnd3", "vacationPreference", elective1_id, elective2_id, elective3_id, elective4_id, year_id, elective10_id, elective5_id, elective6_id, elective7_id, elective8_id, elective9_id, email, couple_id) FROM stdin;
560	Jordan Atkins	t	\N	\N	\N	\N	\N	\N	5	241	222	\N	\N	1	\N	\N	\N	\N	\N	\N	Atkins.jatkins@gmail.com	\N
561	Brandi Baker	t	\N	\N	\N	\N	\N	\N	5	227	254	\N	\N	1	\N	\N	\N	\N	\N	\N	brandijbaker@gmail.com	\N
562	Wenners Ballard, III	t	\N	\N	\N	\N	\N	\N	5	213	242	\N	\N	1	\N	\N	\N	\N	\N	\N	Wennersballard3@gmail.com	\N
563	Margaret Blattner	t	\N	\N	\N	\N	\N	\N	5	244	240	\N	\N	1	\N	\N	\N	\N	\N	\N	maggieblattner@gmail.com	\N
564	Jeremy Brooks	t	\N	\N	\N	\N	\N	\N	5	213	248	\N	\N	1	\N	\N	\N	\N	\N	\N	zjeb48@goldmail.etsu.edu	\N
565	Puja Chebrolu	t	\N	\N	\N	\N	\N	\N	5	213	227	\N	\N	1	\N	\N	\N	\N	\N	\N	pujachebrolu@gmail.com	\N
567	Stephen Chi	t	\N	\N	\N	\N	\N	\N	5	254	240	\N	\N	1	\N	\N	\N	\N	\N	\N	stephen.w.chi@gmail.com	\N
568	Christopher Chung	t	\N	\N	\N	\N	\N	\N	5	221	213	\N	\N	1	\N	\N	\N	\N	\N	\N	ChrisLChung@gmail.com	\N
569	Jeffrey Chung	t	\N	\N	\N	\N	\N	\N	5	213	227	\N	\N	1	\N	\N	\N	\N	\N	\N	jffchung@gmail.com	\N
571	Zachary Crees	t	\N	\N	\N	\N	\N	\N	5	241	225	\N	\N	1	\N	\N	\N	\N	\N	\N	zachcrees@gmail.com	\N
572	Kalen Dionne	t	\N	\N	\N	\N	\N	\N	5	241	244	\N	\N	1	\N	\N	\N	\N	\N	\N	Kalen.Dionne@gmail.com	\N
573	Vanessa Eulo	t	\N	\N	\N	\N	\N	\N	5	225	241	\N	\N	1	\N	\N	\N	\N	\N	\N	Vanessa.Eulo@gmail.com	\N
575	Kathryn Filson	t	\N	\N	\N	\N	\N	\N	5	204	213	\N	\N	1	\N	\N	\N	\N	\N	\N	Katy.filson@gmail.com	\N
576	Jaime Flores Ruiz	t	\N	\N	\N	\N	\N	\N	5	225	241	\N	\N	1	\N	\N	\N	\N	\N	\N	jefloresruiz@gmail.com	\N
577	Lindsay Frerichs	t	\N	\N	\N	\N	\N	\N	5	254	240	\N	\N	1	\N	\N	\N	\N	\N	\N	Frerichs@livemail.uthscsa.edu	\N
578	Cassandra Fritz	t	\N	\N	\N	\N	\N	\N	5	222	240	\N	\N	1	\N	\N	\N	\N	\N	\N	clamar0510@gmail.com	\N
580	Martin Gregory	t	\N	\N	\N	\N	\N	\N	5	222	213	\N	\N	1	\N	\N	\N	\N	\N	\N	martin.gregory87@gmail.com	\N
581	Brett Herzog	t	\N	\N	\N	\N	\N	\N	5	241	225	\N	\N	1	\N	\N	\N	\N	\N	\N	herzog.brett@gmail.com	\N
582	Alonso Heudebert	t	\N	\N	\N	\N	\N	\N	5	254	251	\N	\N	1	\N	\N	\N	\N	\N	\N	aiheudebert@gmail.com	\N
584	Chi-Joan How	t	\N	\N	\N	\N	\N	\N	5	225	254	\N	\N	1	\N	\N	\N	\N	\N	\N	Joaniehow@gmail.com	\N
585	Nhila Jagadeesan	t	\N	\N	\N	\N	\N	\N	5	213	222	\N	\N	1	\N	\N	\N	\N	\N	\N	nhila.jagadeesan@gmail.com	\N
586	Joyce Ji	t	\N	\N	\N	\N	\N	\N	5	222	251	\N	\N	1	\N	\N	\N	\N	\N	\N	jjoyce33@gmail.com	\N
588	Ramon Jin	t	\N	\N	\N	\N	\N	\N	5	241	213	\N	\N	1	\N	\N	\N	\N	\N	\N	Ramonjin7@gmail.com	\N
589	Michael Joshua Hendrix	t	\N	\N	\N	\N	\N	\N	5	227	221	\N	\N	1	\N	\N	\N	\N	\N	\N	Doc.arcshot@gmail.com	\N
590	Timothy Kamerzell	t	\N	\N	\N	\N	\N	\N	5	213	221	\N	\N	1	\N	\N	\N	\N	\N	\N	timjkamerzell@gmail.com	\N
591	Han Li	t	\N	\N	\N	\N	\N	\N	5	240	222	\N	\N	1	\N	\N	\N	\N	\N	\N	hanli913@gmail.com	\N
593	Jimmy Ma	t	\N	\N	\N	\N	\N	\N	5	222	248	\N	\N	1	\N	\N	\N	\N	\N	\N	jma988@gmail.com	\N
716	Laura Marks	t	\N	\N	\N	\N	\N	\N	5	254	227	\N	\N	1	\N	\N	\N	\N	\N	\N	markslaura@gmail.com	\N
717	Jordan Maryfield	t	\N	\N	\N	\N	\N	\N	5	241	225	\N	\N	1	\N	\N	\N	\N	\N	\N	Jmaryfie@iupui.edu	\N
720	Megan Mirkes	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	megan.mirkes@gmail.com	\N
721	Zachary Morgan	t	\N	\N	\N	\N	\N	\N	5	248	213	\N	\N	1	\N	\N	\N	\N	\N	\N	zach.a.morgan23@gmail.com	\N
723	Vinaya Mulkareddy	t	\N	\N	\N	\N	\N	\N	5	213	251	\N	\N	1	\N	\N	\N	\N	\N	\N	vmulkare@gmail.com	\N
724	Jonas Noe	t	\N	\N	\N	\N	\N	\N	5	248	213	\N	\N	1	\N	\N	\N	\N	\N	\N	Jonasnoe@gmx.de	\N
727	Abdirahim Rashid	t	\N	\N	\N	\N	\N	\N	5	241	213	\N	\N	1	\N	\N	\N	\N	\N	\N	abdiraxim@gmail.com	\N
728	David Rawnsley	t	\N	\N	\N	\N	\N	\N	5	213	248	\N	\N	1	\N	\N	\N	\N	\N	\N	dave.rawnsley@gmail.com	\N
730	Desirai Rogan	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	Desirai.Rogan@gmail.com	\N
733	Sheng Si	t	\N	\N	\N	\N	\N	\N	5	213	221	\N	\N	1	\N	\N	\N	\N	\N	\N	shensgi@gmail.com	\N
734	Rachel Steinhorn	t	\N	\N	\N	\N	\N	\N	5	213	251	\N	\N	1	\N	\N	\N	\N	\N	\N	rhsteinhorn@gmail.com	\N
736	Alex Thomas	t	\N	\N	\N	\N	\N	\N	5	222	251	\N	\N	1	\N	\N	\N	\N	\N	\N	alex.thomas@louisville.edu	\N
738	Stephanie Velloze	t	\N	\N	\N	\N	\N	\N	5	213	227	\N	\N	1	\N	\N	\N	\N	\N	\N	Stephanie.velloze@gmail.com	\N
740	Jonathan Walter	t	\N	\N	\N	\N	\N	\N	5	213	222	\N	\N	1	\N	\N	\N	\N	\N	\N	jonathandavidwalter@gmail.com	\N
741	Xiaowen Wang	t	\N	\N	\N	\N	\N	\N	5	213	222	\N	\N	1	\N	\N	\N	\N	\N	\N	wang26x@gmail.com	\N
742	Yan Wang	t	\N	\N	\N	\N	\N	\N	5	222	244	\N	\N	1	\N	\N	\N	\N	\N	\N	ywange@uchicago.edu	\N
745	Diana Zhong	t	\N	\N	\N	\N	\N	\N	5	213	248	\N	\N	1	\N	\N	\N	\N	\N	\N	Dzhong515@gmail.com	\N
633	Connor Woodland	t	\N	\N	\N	\N	\N	\N	5	221	254	240	225	2	255	213	207	249	243	241		\N
634	Dilan Patel	t	\N	\N	\N	\N	\N	\N	5	209	225	222	227	2	204	248	241	243	249	255		\N
635	David Pham	t	\N	\N	\N	\N	\N	\N	5	240	246	248	254	2	249	213	207	218	243	241		\N
636	Derek Yee	t	\N	\N	\N	\N	\N	\N	5	248	246	240	221	2	249	244	218	204	207	241		\N
747	Jeff Friesen	t	\N	\N	\N	\N	\N	\N	5	248	251	244	222	2	210	227	207	218	243	241		\N
748	Jessica Ma	t	\N	\N	\N	\N	\N	\N	5	254	240	221	244	2	248	218	243	249	255	204		\N
749	Justin Maxfield	t	\N	\N	\N	\N	\N	\N	5	227	209	221	213	2	241	251	204	218	207	243		\N
750	Jonathan Mizrahi	t	\N	\N	\N	\N	\N	\N	5	254	244	248	251	2	218	221	241	204	249	210		\N
751	Jay Patel	t	\N	\N	\N	\N	\N	\N	5	227	225	248	222	2	210	251	218	207	241	204		\N
752	Josh Saef	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N		\N
753	Yuan Yuan	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N		\N
754	Lela Ruck	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N		\N
755	Michael Biersmith	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N		\N
756	M. Phillip Fejleh	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N		\N
757	Mate Gergely	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N		\N
758	Milan Kahanda	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N		\N
759	Michael Paley	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N		\N
760	Maanasi Samant	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N		\N
761	Michael Tang	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N		\N
762	Neal Akhave	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N		\N
764	Philip Chu	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N		\N
766	Peter Yen	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N		\N
767	Ramzi Abboud	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N		\N
768	Raymond Fohtung	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N		\N
769	Steven Borson	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N		\N
770	Samuel Reinhardt	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N		\N
771	Tanya Devnani	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N		\N
773	Yeshika Sharma	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N		\N
774	Brian Pierce	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N		\N
775	Chelsea Pearson	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N		\N
776	Khoan Vu	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N		\N
777	Lauren Levine	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N		\N
559	Christina Anderson	t	\N	\N	\N	\N	\N	\N	5	213	225	\N	\N	1	\N	\N	\N	\N	\N	\N	Doctor.Tina19@gmail.com	\N
566	Rahul Chhana	t	\N	\N	\N	\N	\N	\N	5	213	225	\N	\N	1	\N	\N	\N	\N	\N	\N	Rahulchhana@gmail.com	\N
570	John Ciotti	t	\N	\N	\N	\N	\N	\N	5	213	254	\N	\N	1	\N	\N	\N	\N	\N	\N	jrciotti@gmail.com	\N
574	Elyse Everett	t	\N	\N	\N	\N	\N	\N	5	244	254	\N	\N	1	\N	\N	\N	\N	\N	\N	Lisi.aufman@gmail.com	\N
579	Reece Goiffon	t	\N	\N	\N	\N	\N	\N	5	248	254	\N	\N	1	\N	\N	\N	\N	\N	\N	rjgoiffon@wustl.edu	\N
583	Kirk Hou	t	\N	\N	\N	\N	\N	\N	5	254	218	\N	\N	1	\N	\N	\N	\N	\N	\N	Kirk.hou@gmail.com	\N
587	Naomi Jiang	t	\N	\N	\N	\N	\N	\N	5	241	244	\N	\N	1	\N	\N	\N	\N	\N	\N	Njiang1@gmail.com	\N
592	Jeremy Louissaint	t	\N	\N	\N	\N	\N	\N	5	222	213	\N	\N	1	\N	\N	\N	\N	\N	\N	JEL2041@med.cornell.edu	\N
718	Christian McNeely	t	\N	\N	\N	\N	\N	\N	5	213	240	\N	\N	1	\N	\N	\N	\N	\N	\N	Mcneely011@gmail.com	\N
719	Pauras Memon	t	\N	\N	\N	\N	\N	\N	5	225	251	\N	\N	1	\N	\N	\N	\N	\N	\N	pauras.memon@gmail.com	\N
722	Ivan Mugisha	t	\N	\N	\N	\N	\N	\N	5	213	254	\N	\N	1	\N	\N	\N	\N	\N	\N	ivanmugs@yahoo.com	\N
725	Eze Okeagu	t	\N	\N	\N	\N	\N	\N	5	213	225	\N	\N	1	\N	\N	\N	\N	\N	\N	eze_okeagu@med.unc.edu	\N
726	Thomas Park	t	\N	\N	\N	\N	\N	\N	5	213	222	\N	\N	1	\N	\N	\N	\N	\N	\N	Parktm89@gmail.com	\N
729	Arvind Rengarajan	t	\N	\N	\N	\N	\N	\N	5	222	213	\N	\N	1	\N	\N	\N	\N	\N	\N	arvindrenga@gmail.com	\N
731	Anjali Rohatgi	t	\N	\N	\N	\N	\N	\N	5	227	241	\N	\N	1	\N	\N	\N	\N	\N	\N	Anjali.rohatgi@gmail.com	\N
732	Jason Romancik	t	\N	\N	\N	\N	\N	\N	5	225	241	\N	\N	1	\N	\N	\N	\N	\N	\N	jason.romancik@gmail.com	\N
735	Fiona Strasserking	t	\N	\N	\N	\N	\N	\N	5	213	227	\N	\N	1	\N	\N	\N	\N	\N	\N	fstrasserking99@gmail.com	\N
737	AnnMarcia Tukpah	t	\N	\N	\N	\N	\N	\N	5	213	222	\N	\N	1	\N	\N	\N	\N	\N	\N	Tukpah.a@gmail.com	\N
739	Ted Walker	t	\N	\N	\N	\N	\N	\N	5	222	254	\N	\N	1	\N	\N	\N	\N	\N	\N	Ted.walker@uth.tmc.edu	\N
743	Anson Wilks	t	\N	\N	\N	\N	\N	\N	5	213	244	\N	\N	1	\N	\N	\N	\N	\N	\N	anson.w.wilks@gmail.com	\N
744	Peter Zhao	t	\N	\N	\N	\N	\N	\N	5	241	225	\N	\N	1	\N	\N	\N	\N	\N	\N	peterzhao100@gmail.com	\N
624	Amit Bery	t	\N	\N	\N	\N	\N	\N	5	248	227	254	221	2	243	246	207	204	249	255		\N
625	Alex Huh	t	\N	\N	\N	\N	\N	\N	5	222	246	225	254	2	218	227	207	210	249	204		\N
626	Asrar Khan	t	\N	\N	\N	\N	\N	\N	5	213	213	246	251	2	249	248	204	218	207	255		\N
627	Benjamin Kopecky	t	\N	\N	\N	\N	\N	\N	5	240	225	227	254	2	210	244	204	218	243	207		\N
628	Ben Rogers	t	\N	\N	\N	\N	\N	\N	5	213	222	248	254	2	243	221	218	204	255	241		\N
629	Colin Diffie	t	\N	\N	\N	\N	\N	\N	5	254	221	246	222	2	218	226	207	241	204	210		\N
630	Chris Jones	t	\N	\N	\N	\N	\N	\N	5	248	209	225	227	2	204	222	241	241	207	207		\N
631	Chien-Jung Lin	t	\N	\N	\N	\N	\N	\N	5	213	246	251	227	2	207	248	243	241	204	218		\N
632	Catherine McCarthy	t	\N	\N	\N	\N	\N	\N	5	221	251	240	225	2	241	227	210	243	218	249		\N
637	Danicela Younce	t	\N	\N	\N	\N	\N	\N	5	225	209	251	244	2	207	240	241	204	218	243		\N
638	Fizza Abbas	t	\N	\N	\N	\N	\N	\N	5	221	254	221	221	2	\N	254	204	\N	\N	\N		\N
639	Farhan Quader	t	\N	\N	\N	\N	\N	\N	5	222	251	246	225	2	243	213	204	218	207	241		\N
640	Hirak Shah	t	\N	\N	\N	\N	\N	\N	5	213	225	227	254	2	\N	221	218	204	241	249		\N
641	Jaimie Bolda	t	\N	\N	\N	\N	\N	\N	5	213	248	246	227	2	241	221	207	204	218	243		\N
642	Joseph Brancheck	t	\N	\N	\N	\N	\N	\N	5	222	244	248	240	2	207	246	218	243	255	249		\N
643	Juan Calix	t	\N	\N	\N	\N	\N	\N	5	227	254	209	221	2	\N	251	204	255	218	\N		\N
644	Jason Chan	t	\N	\N	\N	\N	\N	\N	5	209	225	254	251	2	249	240	241	204	207	218		\N
746	Jacqueline Chen	t	\N	\N	\N	\N	\N	\N	5	222	225	246	213	2	255	244	218	204	241	243		\N
763	Niall Prendergast	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N		\N
765	Patrick Grierson	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N		\N
772	Theodore Kim	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N		\N
673	Adam Fledderman	t	\N	\N	\N	\N	\N	\N	5	213	254	246	225	3	\N	248	218	243	204	\N		\N
674	Andrew Michelson	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N		\N
675	Amrita Padda	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N		\N
676	Ashish Rastogi	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N		\N
677	Bahaa Bedair	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N		\N
678	Brittne Halford	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N		\N
681	Christopher Rigell	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N		\N
682	Dmitriy Breytman	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N		\N
683	Emily Steiner	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N		\N
684	Grant Heberton	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N		\N
685	Gregory Ratti	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N		\N
686	Happy Thakkar	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N		\N
687	Indra Bole	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N		\N
688	Ian Ross	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N		\N
689	Jonathan Chatzkel	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N		\N
690	Jesus Jimenez	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N		\N
691	Justin Sheehy	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N		\N
692	Keerthi Karamched	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N		\N
693	Kiran Mahmood	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N		\N
778	Li Zhou	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N		\N
779	Melissa DeFoe	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N		\N
780	Meghan Heberton	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N		\N
781	Michael Hesseler	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N		\N
782	Michael Weaver	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N		\N
783	Ningning Ma	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N		\N
784	Nathan Moore	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N		\N
785	Patricia Litkowski	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N		\N
786	Pooja Koolwal	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N		\N
787	Stacy Dai	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N		\N
788	Scott Goldsmith	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N		\N
789	Stephen Hasak	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N		\N
790	Sushma Jonna	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N		\N
791	Scott McHenry	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N		\N
792	Shan Reddy	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N		\N
793	Yevgeniy Khariton	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N		\N
794	Timothy Brian Lumpkin	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N		\N
795	Tokhanh Nguyen	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N		\N
796	Vaiibhav Patel	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N		\N
797	Yosafe Wakwaya	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N		\N
798	Plotzker	t	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N		\N
\.


--
-- Name: rotationSchedule_app_resident_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sw
--

SELECT pg_catalog.setval('"rotationSchedule_app_resident_id_seq"', 800, true);


--
-- Data for Name: rotationSchedule_app_resident_resExcludedBlocks; Type: TABLE DATA; Schema: public; Owner: sw
--

COPY "rotationSchedule_app_resident_resExcludedBlocks" (id, resident_id, templateevent_id) FROM stdin;
\.


--
-- Name: rotationSchedule_app_resident_resExcludedBlocks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sw
--

SELECT pg_catalog.setval('"rotationSchedule_app_resident_resExcludedBlocks_id_seq"', 49, true);


--
-- Data for Name: rotationSchedule_app_resident_tracks; Type: TABLE DATA; Schema: public; Owner: sw
--

COPY "rotationSchedule_app_resident_tracks" (id, resident_id, track_id) FROM stdin;
6	673	3
8	676	3
12	688	2
13	691	3
22	675	4
25	681	4
\.


--
-- Name: rotationSchedule_app_resident_tracks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sw
--

SELECT pg_catalog.setval('"rotationSchedule_app_resident_tracks_id_seq"', 25, true);


--
-- Data for Name: rotationSchedule_app_rotation; Type: TABLE DATA; Schema: public; Owner: sw
--

COPY "rotationSchedule_app_rotation" (id, name, "minResidents", "maxResidents", "isElective", "recurrenceWindow") FROM stdin;
204	All_Imm	0	1	t	0
207	Asthma (WC)	0	1	t	0
208	Medicine consults	1	1	t	0
210	CAER	0	1	t	0
213	CARDS ELECTIVE	0	3	t	0
218	DERM	0	1	t	0
221	ENDO	0	1	t	0
222	GI	0	3	t	0
224	GH	0	100	f	0
225	Heme	1	2	t	0
226	HOSP	0	1	t	0
227	ID	0	3	t	0
236	Neuro	2	3	f	0
237	I_NEURO	1	1	f	0
240	Nutrition	0	1	t	0
241	Onc_Amb	0	1	t	0
243	Ortho	0	1	t	0
244	Palliative Care	0	1	t	0
245	Primary Care	0	100	f	0
246	Proc	1	3	t	0
247	Psych	1	1	f	0
248	Pulm	0	2	t	0
249	QI	0	1	t	0
251	Renal	1	3	t	0
253	Research	0	100	f	0
254	Rheum	0	2	t	0
255	Underserved	0	1	t	0
259	Vacation	0	100	f	0
216	Clinic	12	40	f	0
205	AMBJAR	3	3	t	0
206	AMB	0	20	f	8
209	BMT	1	1	t	0
211	CARDS FIRM	0	100	f	0
212	Cards NF	0	100	f	0
214	CCU	8	8	f	0
219	EM_1	1	2	f	0
220	EM_2	2	5	f	0
223	Geri	0	2	f	0
229	Med 1 NF	0	100	f	0
230	Med 2 NF	0	100	f	0
232	Med 1	0	100	f	0
233	Med 2	0	100	f	0
234	MICU-N	0	100	f	0
235	MICU-S	0	100	f	0
238	NF_ONC	0	100	f	0
239	NF_VA	0	100	f	0
242	ONC	0	100	f	0
252	Renal_TXP	0	1	t	0
256	VA	0	100	f	0
258	Variety NF	1	1	f	0
261	4th NF	0	100	f	0
\.


--
-- Name: rotationSchedule_app_rotation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sw
--

SELECT pg_catalog.setval('"rotationSchedule_app_rotation_id_seq"', 261, true);


--
-- Data for Name: rotationSchedule_app_rotationlength; Type: TABLE DATA; Schema: public; Owner: sw
--

COPY "rotationSchedule_app_rotationlength" (id, "minLength", "maxLength", block_id, rotation_id) FROM stdin;
149	1	3	7	204
150	2	2	6	204
151	4	4	6	205
152	3	3	7	205
153	2	2	6	206
154	2	2	7	206
155	2	2	6	207
156	1	3	7	207
157	2	2	6	209
158	3	3	7	209
159	2	2	6	208
160	1	3	7	208
161	2	4	6	210
162	2	3	7	210
163	4	4	6	211
164	3	3	7	211
165	2	2	6	212
166	1	3	7	212
167	2	2	6	213
168	4	4	6	214
169	2	2	6	216
170	2	2	6	218
171	2	2	6	221
172	4	4	6	219
173	2	2	6	220
174	2	2	6	222
175	2	2	6	223
176	2	2	6	225
177	2	2	6	226
178	2	2	6	227
179	2	2	6	229
180	2	2	6	230
181	4	4	6	232
182	4	4	6	233
183	4	4	6	234
184	4	4	6	235
185	2	2	6	236
186	4	4	6	237
187	2	2	6	238
188	2	2	6	239
189	2	2	6	240
190	2	2	6	241
191	4	4	6	242
192	2	2	6	243
193	2	2	6	244
194	2	2	6	246
195	4	4	6	247
196	2	2	6	248
197	2	2	6	249
199	2	2	6	251
200	2	2	6	252
201	2	4	6	253
202	2	2	6	254
203	2	2	6	255
204	4	4	6	256
205	2	2	6	258
206	1	3	7	212
207	1	3	7	213
208	3	3	7	214
209	1	3	7	216
210	2	3	7	218
211	3	3	7	219
212	3	3	7	220
213	1	3	7	221
214	1	3	7	222
215	2	3	7	223
216	1	3	7	225
217	2	3	7	226
218	1	3	7	227
219	1	3	7	229
220	1	3	7	230
221	3	3	7	232
222	3	3	7	233
223	3	3	7	234
224	3	3	7	235
225	1	3	7	236
226	3	3	7	237
227	1	3	7	238
228	1	3	7	239
229	1	3	7	240
230	1	3	7	241
231	3	3	7	242
232	1	3	7	243
233	1	3	7	244
234	3	3	7	247
235	1	3	7	246
236	1	3	7	248
237	2	2	7	249
239	1	3	7	251
240	1	3	7	252
241	2	3	7	253
242	1	3	7	254
243	2	2	7	255
244	3	3	7	256
245	1	3	7	258
246	1	2	7	259
247	2	2	6	259
248	2	2	6	261
249	1	3	7	261
\.


--
-- Name: rotationSchedule_app_rotationlength_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sw
--

SELECT pg_catalog.setval('"rotationSchedule_app_rotationlength_id_seq"', 249, true);


--
-- Data for Name: rotationSchedule_app_rotationset; Type: TABLE DATA; Schema: public; Owner: sw
--

COPY "rotationSchedule_app_rotationset" (id, "rotationSet_name") FROM stdin;
\.


--
-- Name: rotationSchedule_app_rotationset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sw
--

SELECT pg_catalog.setval('"rotationSchedule_app_rotationset_id_seq"', 3, true);


--
-- Data for Name: rotationSchedule_app_rotationset_rotations; Type: TABLE DATA; Schema: public; Owner: sw
--

COPY "rotationSchedule_app_rotationset_rotations" (id, rotationset_id, rotation_id) FROM stdin;
\.


--
-- Name: rotationSchedule_app_rotationset_rotations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sw
--

SELECT pg_catalog.setval('"rotationSchedule_app_rotationset_rotations_id_seq"', 24, true);


--
-- Data for Name: rotationSchedule_app_schedule; Type: TABLE DATA; Schema: public; Owner: sw
--

COPY "rotationSchedule_app_schedule" (id, name, utility) FROM stdin;
656	Best Solution	0
\.


--
-- Name: rotationSchedule_app_schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sw
--

SELECT pg_catalog.setval('"rotationSchedule_app_schedule_id_seq"', 656, true);


--
-- Data for Name: rotationSchedule_app_setedureq; Type: TABLE DATA; Schema: public; Owner: sw
--

COPY "rotationSchedule_app_setedureq" (id, "setEduReq_set_id", "setEduReq_year_id", "setEduReq_maxLength", "setEduReq_minLength") FROM stdin;
\.


--
-- Name: rotationSchedule_app_setedureq_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sw
--

SELECT pg_catalog.setval('"rotationSchedule_app_setedureq_id_seq"', 2, true);


--
-- Data for Name: rotationSchedule_app_settrackedureq; Type: TABLE DATA; Schema: public; Owner: sw
--

COPY "rotationSchedule_app_settrackedureq" (id, "setTrackEduReq_minLength", "setTrackEduReq_maxLength", "setTrackEduReq_set_id", "setTrackEduReq_track_id") FROM stdin;
\.


--
-- Name: rotationSchedule_app_settrackedureq_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sw
--

SELECT pg_catalog.setval('"rotationSchedule_app_settrackedureq_id_seq"', 1, true);


--
-- Data for Name: rotationSchedule_app_setyeardemand; Type: TABLE DATA; Schema: public; Owner: sw
--

COPY "rotationSchedule_app_setyeardemand" (id, "setYearDemand_minResidents", "setYearDemand_maxResidents", "setYearDemand_rotation_id", "setYearDemand_yearSet_id") FROM stdin;
3	4	4	211	4
4	1	1	212	4
5	1	1	229	4
6	1	1	230	4
7	4	4	232	4
8	4	4	233	4
9	1	1	238	4
10	1	1	239	4
\.


--
-- Name: rotationSchedule_app_setyeardemand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sw
--

SELECT pg_catalog.setval('"rotationSchedule_app_setyeardemand_id_seq"', 10, true);


--
-- Data for Name: rotationSchedule_app_template; Type: TABLE DATA; Schema: public; Owner: sw
--

COPY "rotationSchedule_app_template" (id, "templateName") FROM stdin;
1	Template_1
2	Template_2
\.


--
-- Name: rotationSchedule_app_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sw
--

SELECT pg_catalog.setval('"rotationSchedule_app_template_id_seq"', 3, true);


--
-- Data for Name: rotationSchedule_app_template_templateYears; Type: TABLE DATA; Schema: public; Owner: sw
--

COPY "rotationSchedule_app_template_templateYears" (id, template_id, year_id) FROM stdin;
22	1	1
23	2	2
24	2	3
\.


--
-- Name: rotationSchedule_app_template_templateYears_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sw
--

SELECT pg_catalog.setval('"rotationSchedule_app_template_templateYears_id_seq"', 24, true);


--
-- Data for Name: rotationSchedule_app_templateevent; Type: TABLE DATA; Schema: public; Owner: sw
--

COPY "rotationSchedule_app_templateevent" (id, "blockStartDate", "blockEndDate", block_id, template_id) FROM stdin;
68	2015-06-21	2015-07-18	6	1
69	2015-06-21	2015-07-18	6	2
76	2015-07-19	2015-08-15	6	1
77	2015-07-19	2015-08-15	6	2
\.


--
-- Name: rotationSchedule_app_templateevent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sw
--

SELECT pg_catalog.setval('"rotationSchedule_app_templateevent_id_seq"', 101, true);


--
-- Data for Name: rotationSchedule_app_track; Type: TABLE DATA; Schema: public; Owner: sw
--

COPY "rotationSchedule_app_track" (id, name) FROM stdin;
2	Global Health
3	CSTAR
4	VACR
5	Primary Care
8	Prelim
7	I_Neuro
\.


--
-- Data for Name: rotationSchedule_app_track_excludedBlocks; Type: TABLE DATA; Schema: public; Owner: sw
--

COPY "rotationSchedule_app_track_excludedBlocks" (id, track_id, templateevent_id) FROM stdin;
\.


--
-- Name: rotationSchedule_app_track_excludedBlocks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sw
--

SELECT pg_catalog.setval('"rotationSchedule_app_track_excludedBlocks_id_seq"', 22, true);


--
-- Name: rotationSchedule_app_track_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sw
--

SELECT pg_catalog.setval('"rotationSchedule_app_track_id_seq"', 8, true);


--
-- Data for Name: rotationSchedule_app_trackeducationreq; Type: TABLE DATA; Schema: public; Owner: sw
--

COPY "rotationSchedule_app_trackeducationreq" (id, "trackEducationReq_minLength", "trackEducationReq_maxLength", "trackEducationReq_rotation_id", "trackEducationReq_track_id") FROM stdin;
252	0	100	256	8
254	0	100	258	8
255	0	100	259	8
256	0	100	204	8
257	0	100	205	8
258	0	100	206	8
259	0	100	207	8
260	0	100	208	8
261	0	100	209	8
262	0	100	210	8
263	0	100	211	8
264	0	100	212	8
265	0	100	213	8
266	0	100	214	8
268	0	100	216	8
270	0	100	218	8
271	0	100	219	8
272	0	100	220	8
273	0	100	221	8
274	0	100	222	8
275	0	100	223	8
276	0	100	224	8
277	0	100	225	8
278	0	100	226	8
279	0	100	227	8
281	0	100	229	8
282	0	100	230	8
284	0	100	232	8
285	0	100	233	8
286	0	100	234	8
287	0	100	235	8
288	0	100	236	8
289	0	100	237	8
290	0	100	238	8
291	0	100	239	8
292	0	100	240	8
293	0	100	241	8
294	0	100	242	8
295	0	100	243	8
296	0	100	244	8
297	0	100	245	8
298	0	100	246	8
299	0	100	247	8
300	0	100	248	8
301	0	100	249	8
303	0	100	251	8
304	0	100	252	8
305	0	100	253	8
306	0	100	254	8
307	0	100	255	8
210	0	0	214	8
308	0	100	256	7
309	0	100	258	7
310	0	100	259	7
311	0	100	204	7
312	0	100	205	7
313	0	100	206	7
314	0	100	207	7
315	0	100	208	7
316	0	100	209	7
317	0	100	210	7
318	0	100	211	7
319	0	100	212	7
320	0	100	213	7
321	0	100	214	7
322	0	100	216	7
323	0	100	218	7
324	0	100	219	7
325	0	100	220	7
326	0	100	221	7
327	0	100	222	7
328	0	100	223	7
329	0	100	224	7
330	0	100	225	7
331	0	100	226	7
332	0	100	227	7
333	0	100	229	7
334	0	100	230	7
335	0	100	232	7
336	0	100	233	7
337	0	100	234	7
338	0	100	235	7
339	0	100	236	7
340	0	100	237	7
341	0	100	238	7
342	0	100	239	7
343	0	100	240	7
344	0	100	241	7
345	0	100	242	7
346	0	100	243	7
347	0	100	244	7
348	0	100	245	7
349	0	100	246	7
350	0	100	247	7
351	0	100	248	7
352	0	100	249	7
353	0	100	251	7
354	0	100	252	7
355	0	100	253	7
356	0	100	254	7
357	0	100	255	7
\.


--
-- Name: rotationSchedule_app_trackeducationreq_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sw
--

SELECT pg_catalog.setval('"rotationSchedule_app_trackeducationreq_id_seq"', 357, true);


--
-- Data for Name: rotationSchedule_app_year; Type: TABLE DATA; Schema: public; Owner: sw
--

COPY "rotationSchedule_app_year" (id, name, "yearNum") FROM stdin;
3	PGY3	3
1	PGY1	1
2	PGY2	2
\.


--
-- Name: rotationSchedule_app_year_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sw
--

SELECT pg_catalog.setval('"rotationSchedule_app_year_id_seq"', 5, true);


--
-- Data for Name: rotationSchedule_app_yeardemand; Type: TABLE DATA; Schema: public; Owner: sw
--

COPY "rotationSchedule_app_yeardemand" (id, "minResidents", "maxResidents", rotation_id, year_id) FROM stdin;
270	1	1	212	3
245	2	2	214	3
274	2	2	211	3
248	0	0	205	3
249	0	0	206	3
276	0	0	219	3
280	0	0	229	3
282	1	1	230	3
284	2	2	232	3
286	2	2	233	3
246	2	2	234	3
247	2	2	235	3
288	0	0	238	3
290	0	0	239	3
291	4	4	242	3
293	0	0	256	3
250	1	1	261	3
296	0	100	256	1
297	0	100	258	1
298	0	100	261	1
299	0	100	205	1
300	0	100	209	1
301	0	100	211	1
302	0	100	212	1
303	0	100	214	1
304	0	100	219	1
305	0	100	223	1
306	0	100	229	1
307	0	100	230	1
308	0	100	232	1
309	0	100	233	1
310	0	100	234	1
311	0	100	235	1
312	0	100	236	1
313	0	100	238	1
314	0	100	239	1
315	0	100	242	1
316	0	100	243	1
317	0	100	252	1
318	0	100	256	2
319	0	100	258	2
320	0	100	261	2
321	0	100	230	2
322	0	100	223	2
323	0	100	232	2
324	0	100	233	2
325	0	100	234	2
326	0	100	235	2
327	0	100	206	2
328	0	100	239	2
329	0	100	242	2
330	0	100	211	2
331	0	100	212	2
332	0	100	238	2
333	0	100	214	2
334	0	100	219	2
335	0	100	220	2
336	0	100	229	2
\.


--
-- Name: rotationSchedule_app_yeardemand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sw
--

SELECT pg_catalog.setval('"rotationSchedule_app_yeardemand_id_seq"', 336, true);


--
-- Data for Name: rotationSchedule_app_yearset; Type: TABLE DATA; Schema: public; Owner: sw
--

COPY "rotationSchedule_app_yearset" (id, "yearSet_name") FROM stdin;
3	All Years
4	Upper level
\.


--
-- Name: rotationSchedule_app_yearset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sw
--

SELECT pg_catalog.setval('"rotationSchedule_app_yearset_id_seq"', 4, true);


--
-- Data for Name: rotationSchedule_app_yearset_years; Type: TABLE DATA; Schema: public; Owner: sw
--

COPY "rotationSchedule_app_yearset_years" (id, yearset_id, year_id) FROM stdin;
5	3	1
6	3	2
7	3	3
26	4	2
27	4	3
\.


--
-- Name: rotationSchedule_app_yearset_years_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sw
--

SELECT pg_catalog.setval('"rotationSchedule_app_yearset_years_id_seq"', 27, true);


--
-- Data for Name: weather; Type: TABLE DATA; Schema: public; Owner: sw
--

COPY weather (city, high, low) FROM stdin;
San Francisco	46	50
\.


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_3e9b09fd5d2f73da_uniq; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_3e9b09fd5d2f73da_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: rotationSchedule_app_block_pkey; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY "rotationSchedule_app_block"
    ADD CONSTRAINT "rotationSchedule_app_block_pkey" PRIMARY KEY (id);


--
-- Name: rotationSchedule_app_educationreq_pkey; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY "rotationSchedule_app_educationreq"
    ADD CONSTRAINT "rotationSchedule_app_educationreq_pkey" PRIMARY KEY (id);


--
-- Name: rotationSchedule_app_event_pkey; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY "rotationSchedule_app_event"
    ADD CONSTRAINT "rotationSchedule_app_event_pkey" PRIMARY KEY (id);


--
-- Name: rotationSchedule_app_program_pkey; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY "rotationSchedule_app_program"
    ADD CONSTRAINT "rotationSchedule_app_program_pkey" PRIMARY KEY (id);


--
-- Name: rotationSchedule_app_resident__resident_id_templateevent_id_key; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY "rotationSchedule_app_resident_resExcludedBlocks"
    ADD CONSTRAINT "rotationSchedule_app_resident__resident_id_templateevent_id_key" UNIQUE (resident_id, templateevent_id);


--
-- Name: rotationSchedule_app_resident_pkey; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY "rotationSchedule_app_resident"
    ADD CONSTRAINT "rotationSchedule_app_resident_pkey" PRIMARY KEY (id);


--
-- Name: rotationSchedule_app_resident_resExcludedBlocks_pkey; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY "rotationSchedule_app_resident_resExcludedBlocks"
    ADD CONSTRAINT "rotationSchedule_app_resident_resExcludedBlocks_pkey" PRIMARY KEY (id);


--
-- Name: rotationSchedule_app_resident_tracks_pkey; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY "rotationSchedule_app_resident_tracks"
    ADD CONSTRAINT "rotationSchedule_app_resident_tracks_pkey" PRIMARY KEY (id);


--
-- Name: rotationSchedule_app_resident_tracks_resident_id_track_id_key; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY "rotationSchedule_app_resident_tracks"
    ADD CONSTRAINT "rotationSchedule_app_resident_tracks_resident_id_track_id_key" UNIQUE (resident_id, track_id);


--
-- Name: rotationSchedule_app_rotation_pkey; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY "rotationSchedule_app_rotation"
    ADD CONSTRAINT "rotationSchedule_app_rotation_pkey" PRIMARY KEY (id);


--
-- Name: rotationSchedule_app_rotationlength_pkey; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY "rotationSchedule_app_rotationlength"
    ADD CONSTRAINT "rotationSchedule_app_rotationlength_pkey" PRIMARY KEY (id);


--
-- Name: rotationSchedule_app_rotationset_pkey; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY "rotationSchedule_app_rotationset"
    ADD CONSTRAINT "rotationSchedule_app_rotationset_pkey" PRIMARY KEY (id);


--
-- Name: rotationSchedule_app_rotationset_rotations_pkey; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY "rotationSchedule_app_rotationset_rotations"
    ADD CONSTRAINT "rotationSchedule_app_rotationset_rotations_pkey" PRIMARY KEY (id);


--
-- Name: rotationSchedule_app_rotationset_rotationset_id_rotation_id_key; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY "rotationSchedule_app_rotationset_rotations"
    ADD CONSTRAINT "rotationSchedule_app_rotationset_rotationset_id_rotation_id_key" UNIQUE (rotationset_id, rotation_id);


--
-- Name: rotationSchedule_app_schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY "rotationSchedule_app_schedule"
    ADD CONSTRAINT "rotationSchedule_app_schedule_pkey" PRIMARY KEY (id);


--
-- Name: rotationSchedule_app_setedureq_pkey; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY "rotationSchedule_app_setedureq"
    ADD CONSTRAINT "rotationSchedule_app_setedureq_pkey" PRIMARY KEY (id);


--
-- Name: rotationSchedule_app_settrackedureq_pkey; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY "rotationSchedule_app_settrackedureq"
    ADD CONSTRAINT "rotationSchedule_app_settrackedureq_pkey" PRIMARY KEY (id);


--
-- Name: rotationSchedule_app_setyeardemand_pkey; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY "rotationSchedule_app_setyeardemand"
    ADD CONSTRAINT "rotationSchedule_app_setyeardemand_pkey" PRIMARY KEY (id);


--
-- Name: rotationSchedule_app_template_pkey; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY "rotationSchedule_app_template"
    ADD CONSTRAINT "rotationSchedule_app_template_pkey" PRIMARY KEY (id);


--
-- Name: rotationSchedule_app_template_templateY_template_id_year_id_key; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY "rotationSchedule_app_template_templateYears"
    ADD CONSTRAINT "rotationSchedule_app_template_templateY_template_id_year_id_key" UNIQUE (template_id, year_id);


--
-- Name: rotationSchedule_app_template_templateYears_pkey; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY "rotationSchedule_app_template_templateYears"
    ADD CONSTRAINT "rotationSchedule_app_template_templateYears_pkey" PRIMARY KEY (id);


--
-- Name: rotationSchedule_app_templateevent_pkey; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY "rotationSchedule_app_templateevent"
    ADD CONSTRAINT "rotationSchedule_app_templateevent_pkey" PRIMARY KEY (id);


--
-- Name: rotationSchedule_app_track_exclud_track_id_templateevent_id_key; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY "rotationSchedule_app_track_excludedBlocks"
    ADD CONSTRAINT "rotationSchedule_app_track_exclud_track_id_templateevent_id_key" UNIQUE (track_id, templateevent_id);


--
-- Name: rotationSchedule_app_track_excludedBlocks_pkey; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY "rotationSchedule_app_track_excludedBlocks"
    ADD CONSTRAINT "rotationSchedule_app_track_excludedBlocks_pkey" PRIMARY KEY (id);


--
-- Name: rotationSchedule_app_track_pkey; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY "rotationSchedule_app_track"
    ADD CONSTRAINT "rotationSchedule_app_track_pkey" PRIMARY KEY (id);


--
-- Name: rotationSchedule_app_trackeducationreq_pkey; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY "rotationSchedule_app_trackeducationreq"
    ADD CONSTRAINT "rotationSchedule_app_trackeducationreq_pkey" PRIMARY KEY (id);


--
-- Name: rotationSchedule_app_year_pkey; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY "rotationSchedule_app_year"
    ADD CONSTRAINT "rotationSchedule_app_year_pkey" PRIMARY KEY (id);


--
-- Name: rotationSchedule_app_yeardemand_pkey; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY "rotationSchedule_app_yeardemand"
    ADD CONSTRAINT "rotationSchedule_app_yeardemand_pkey" PRIMARY KEY (id);


--
-- Name: rotationSchedule_app_yearset_pkey; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY "rotationSchedule_app_yearset"
    ADD CONSTRAINT "rotationSchedule_app_yearset_pkey" PRIMARY KEY (id);


--
-- Name: rotationSchedule_app_yearset_years_pkey; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY "rotationSchedule_app_yearset_years"
    ADD CONSTRAINT "rotationSchedule_app_yearset_years_pkey" PRIMARY KEY (id);


--
-- Name: rotationSchedule_app_yearset_years_yearset_id_year_id_key; Type: CONSTRAINT; Schema: public; Owner: sw; Tablespace: 
--

ALTER TABLE ONLY "rotationSchedule_app_yearset_years"
    ADD CONSTRAINT "rotationSchedule_app_yearset_years_yearset_id_year_id_key" UNIQUE (yearset_id, year_id);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: rotationschedule_app_educationreq_91b4a700; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX rotationschedule_app_educationreq_91b4a700 ON "rotationSchedule_app_educationreq" USING btree (year_id);


--
-- Name: rotationschedule_app_educationreq_f0cc0e70; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX rotationschedule_app_educationreq_f0cc0e70 ON "rotationSchedule_app_educationreq" USING btree (rotation_id);


--
-- Name: rotationschedule_app_event_95a915ae; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX rotationschedule_app_event_95a915ae ON "rotationSchedule_app_event" USING btree (resident_id);


--
-- Name: rotationschedule_app_event_9bc70bb9; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX rotationschedule_app_event_9bc70bb9 ON "rotationSchedule_app_event" USING btree (schedule_id);


--
-- Name: rotationschedule_app_event_f0cc0e70; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX rotationschedule_app_event_f0cc0e70 ON "rotationSchedule_app_event" USING btree (rotation_id);


--
-- Name: rotationschedule_app_resident_0867f308; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX rotationschedule_app_resident_0867f308 ON "rotationSchedule_app_resident" USING btree (elective6_id);


--
-- Name: rotationschedule_app_resident_11bfdc58; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX rotationschedule_app_resident_11bfdc58 ON "rotationSchedule_app_resident" USING btree (elective10_id);


--
-- Name: rotationschedule_app_resident_181e3588; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX rotationschedule_app_resident_181e3588 ON "rotationSchedule_app_resident" USING btree (elective8_id);


--
-- Name: rotationschedule_app_resident_1cc40dcf; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX rotationschedule_app_resident_1cc40dcf ON "rotationSchedule_app_resident" USING btree (elective1_id);


--
-- Name: rotationschedule_app_resident_1db06da3; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX rotationschedule_app_resident_1db06da3 ON "rotationSchedule_app_resident" USING btree (elective5_id);


--
-- Name: rotationschedule_app_resident_20abf7e9; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX rotationschedule_app_resident_20abf7e9 ON "rotationSchedule_app_resident" USING btree (couple_id);


--
-- Name: rotationschedule_app_resident_2f0c2429; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX rotationschedule_app_resident_2f0c2429 ON "rotationSchedule_app_resident" USING btree (elective4_id);


--
-- Name: rotationschedule_app_resident_45dab4e8; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX rotationschedule_app_resident_45dab4e8 ON "rotationSchedule_app_resident" USING btree (elective2_id);


--
-- Name: rotationschedule_app_resident_53e8f8ad; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX rotationschedule_app_resident_53e8f8ad ON "rotationSchedule_app_resident" USING btree (elective7_id);


--
-- Name: rotationschedule_app_resident_7ef90ea2; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX rotationschedule_app_resident_7ef90ea2 ON "rotationSchedule_app_resident" USING btree (elective9_id);


--
-- Name: rotationschedule_app_resident_91b4a700; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX rotationschedule_app_resident_91b4a700 ON "rotationSchedule_app_resident" USING btree (year_id);


--
-- Name: rotationschedule_app_resident_c971f2ab; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX rotationschedule_app_resident_c971f2ab ON "rotationSchedule_app_resident" USING btree (elective3_id);


--
-- Name: rotationschedule_app_resident_resexcludedblocks_3aa746d5; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX rotationschedule_app_resident_resexcludedblocks_3aa746d5 ON "rotationSchedule_app_resident_resExcludedBlocks" USING btree (templateevent_id);


--
-- Name: rotationschedule_app_resident_resexcludedblocks_95a915ae; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX rotationschedule_app_resident_resexcludedblocks_95a915ae ON "rotationSchedule_app_resident_resExcludedBlocks" USING btree (resident_id);


--
-- Name: rotationschedule_app_resident_tracks_2edb7cf7; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX rotationschedule_app_resident_tracks_2edb7cf7 ON "rotationSchedule_app_resident_tracks" USING btree (track_id);


--
-- Name: rotationschedule_app_resident_tracks_95a915ae; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX rotationschedule_app_resident_tracks_95a915ae ON "rotationSchedule_app_resident_tracks" USING btree (resident_id);


--
-- Name: rotationschedule_app_rotationlength_7e53bca2; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX rotationschedule_app_rotationlength_7e53bca2 ON "rotationSchedule_app_rotationlength" USING btree (block_id);


--
-- Name: rotationschedule_app_rotationlength_f0cc0e70; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX rotationschedule_app_rotationlength_f0cc0e70 ON "rotationSchedule_app_rotationlength" USING btree (rotation_id);


--
-- Name: rotationschedule_app_rotationset_rotations_3f50b505; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX rotationschedule_app_rotationset_rotations_3f50b505 ON "rotationSchedule_app_rotationset_rotations" USING btree (rotationset_id);


--
-- Name: rotationschedule_app_rotationset_rotations_f0cc0e70; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX rotationschedule_app_rotationset_rotations_f0cc0e70 ON "rotationSchedule_app_rotationset_rotations" USING btree (rotation_id);


--
-- Name: rotationschedule_app_setedureq_aa2aabb1; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX rotationschedule_app_setedureq_aa2aabb1 ON "rotationSchedule_app_setedureq" USING btree ("setEduReq_year_id");


--
-- Name: rotationschedule_app_setedureq_b2dbd73f; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX rotationschedule_app_setedureq_b2dbd73f ON "rotationSchedule_app_setedureq" USING btree ("setEduReq_set_id");


--
-- Name: rotationschedule_app_settrackedureq_71ee5221; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX rotationschedule_app_settrackedureq_71ee5221 ON "rotationSchedule_app_settrackedureq" USING btree ("setTrackEduReq_set_id");


--
-- Name: rotationschedule_app_settrackedureq_7fbe3d14; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX rotationschedule_app_settrackedureq_7fbe3d14 ON "rotationSchedule_app_settrackedureq" USING btree ("setTrackEduReq_track_id");


--
-- Name: rotationschedule_app_setyeardemand_73418e2b; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX rotationschedule_app_setyeardemand_73418e2b ON "rotationSchedule_app_setyeardemand" USING btree ("setYearDemand_rotation_id");


--
-- Name: rotationschedule_app_setyeardemand_a8980f7a; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX rotationschedule_app_setyeardemand_a8980f7a ON "rotationSchedule_app_setyeardemand" USING btree ("setYearDemand_yearSet_id");


--
-- Name: rotationschedule_app_template_templateyears_74f53564; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX rotationschedule_app_template_templateyears_74f53564 ON "rotationSchedule_app_template_templateYears" USING btree (template_id);


--
-- Name: rotationschedule_app_template_templateyears_91b4a700; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX rotationschedule_app_template_templateyears_91b4a700 ON "rotationSchedule_app_template_templateYears" USING btree (year_id);


--
-- Name: rotationschedule_app_templateevent_74f53564; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX rotationschedule_app_templateevent_74f53564 ON "rotationSchedule_app_templateevent" USING btree (template_id);


--
-- Name: rotationschedule_app_templateevent_7e53bca2; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX rotationschedule_app_templateevent_7e53bca2 ON "rotationSchedule_app_templateevent" USING btree (block_id);


--
-- Name: rotationschedule_app_track_excludedblocks_2edb7cf7; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX rotationschedule_app_track_excludedblocks_2edb7cf7 ON "rotationSchedule_app_track_excludedBlocks" USING btree (track_id);


--
-- Name: rotationschedule_app_track_excludedblocks_3aa746d5; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX rotationschedule_app_track_excludedblocks_3aa746d5 ON "rotationSchedule_app_track_excludedBlocks" USING btree (templateevent_id);


--
-- Name: rotationschedule_app_trackeducationreq_8d38c2f5; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX rotationschedule_app_trackeducationreq_8d38c2f5 ON "rotationSchedule_app_trackeducationreq" USING btree ("trackEducationReq_track_id");


--
-- Name: rotationschedule_app_trackeducationreq_a11b248e; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX rotationschedule_app_trackeducationreq_a11b248e ON "rotationSchedule_app_trackeducationreq" USING btree ("trackEducationReq_rotation_id");


--
-- Name: rotationschedule_app_yeardemand_91b4a700; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX rotationschedule_app_yeardemand_91b4a700 ON "rotationSchedule_app_yeardemand" USING btree (year_id);


--
-- Name: rotationschedule_app_yeardemand_f0cc0e70; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX rotationschedule_app_yeardemand_f0cc0e70 ON "rotationSchedule_app_yeardemand" USING btree (rotation_id);


--
-- Name: rotationschedule_app_yearset_years_1ae009bb; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX rotationschedule_app_yearset_years_1ae009bb ON "rotationSchedule_app_yearset_years" USING btree (yearset_id);


--
-- Name: rotationschedule_app_yearset_years_91b4a700; Type: INDEX; Schema: public; Owner: sw; Tablespace: 
--

CREATE INDEX rotationschedule_app_yearset_years_91b4a700 ON "rotationSchedule_app_yearset_years" USING btree (year_id);


--
-- Name: a5e01f255f3f0078112b6208e9cc8b48; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_trackeducationreq"
    ADD CONSTRAINT a5e01f255f3f0078112b6208e9cc8b48 FOREIGN KEY ("trackEducationReq_track_id") REFERENCES "rotationSchedule_app_track"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: af25018b53881877b4a32026dd8dee53; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_templateevent"
    ADD CONSTRAINT af25018b53881877b4a32026dd8dee53 FOREIGN KEY (template_id) REFERENCES "rotationSchedule_app_template"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth__content_type_id_e0bc4230f14812d_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth__content_type_id_e0bc4230f14812d_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissio_group_id_34ecd09eac73dcf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_group_id_34ecd09eac73dcf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permission_id_100763367ac7607a_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permission_id_100763367ac7607a_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user__permission_id_3767492f1bcdfec2_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user__permission_id_3767492f1bcdfec2_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_7b673f9b13bed655_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_7b673f9b13bed655_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_7af6fec354e5ecb2_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_7af6fec354e5ecb2_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permiss_user_id_67832932f20d4b1c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permiss_user_id_67832932f20d4b1c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: c4962cd3061c4c60e95c8c75f5026530; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_resident"
    ADD CONSTRAINT c4962cd3061c4c60e95c8c75f5026530 FOREIGN KEY (elective10_id) REFERENCES "rotationSchedule_app_rotation"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: c74b7145e28327876e72b3d1dcf69d0f; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_resident"
    ADD CONSTRAINT c74b7145e28327876e72b3d1dcf69d0f FOREIGN KEY (elective6_id) REFERENCES "rotationSchedule_app_rotation"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: couple_id_2a30798f2c7e6395_fk_rotationschedule_app_resident_id; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_resident"
    ADD CONSTRAINT couple_id_2a30798f2c7e6395_fk_rotationschedule_app_resident_id FOREIGN KEY (couple_id) REFERENCES "rotationSchedule_app_resident"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: d0dff6b1bae5276680b5e95221798a61; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_event"
    ADD CONSTRAINT d0dff6b1bae5276680b5e95221798a61 FOREIGN KEY (schedule_id) REFERENCES "rotationSchedule_app_schedule"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: d16b9c955591182436d1e024cdd83cb0; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_resident"
    ADD CONSTRAINT d16b9c955591182436d1e024cdd83cb0 FOREIGN KEY (elective8_id) REFERENCES "rotationSchedule_app_rotation"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: d19d38cb5c9c6268d7c05351af447ddf; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_settrackedureq"
    ADD CONSTRAINT d19d38cb5c9c6268d7c05351af447ddf FOREIGN KEY ("setTrackEduReq_set_id") REFERENCES "rotationSchedule_app_rotationset"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: d1e08bb61f6579d61de01039da1bef8d; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_track_excludedBlocks"
    ADD CONSTRAINT d1e08bb61f6579d61de01039da1bef8d FOREIGN KEY (templateevent_id) REFERENCES "rotationSchedule_app_templateevent"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: d252a7651a39c920157c2ffd5ec3a13b; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_setedureq"
    ADD CONSTRAINT d252a7651a39c920157c2ffd5ec3a13b FOREIGN KEY ("setEduReq_set_id") REFERENCES "rotationSchedule_app_rotationset"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: d254b6b672ebeb025b2a0a66d4dc3c8f; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_event"
    ADD CONSTRAINT d254b6b672ebeb025b2a0a66d4dc3c8f FOREIGN KEY (resident_id) REFERENCES "rotationSchedule_app_resident"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: d2bb14c907115e53f65cc5ecdba35288; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_yeardemand"
    ADD CONSTRAINT d2bb14c907115e53f65cc5ecdba35288 FOREIGN KEY (rotation_id) REFERENCES "rotationSchedule_app_rotation"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: d403972aa95032110ff64b3d6e0b511f; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_educationreq"
    ADD CONSTRAINT d403972aa95032110ff64b3d6e0b511f FOREIGN KEY (rotation_id) REFERENCES "rotationSchedule_app_rotation"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: d4af4a1171f7800b153cd32929f138db; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_setyeardemand"
    ADD CONSTRAINT d4af4a1171f7800b153cd32929f138db FOREIGN KEY ("setYearDemand_rotation_id") REFERENCES "rotationSchedule_app_rotation"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: d4cf41650191732a3769558f72fa2f3b; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_settrackedureq"
    ADD CONSTRAINT d4cf41650191732a3769558f72fa2f3b FOREIGN KEY ("setTrackEduReq_track_id") REFERENCES "rotationSchedule_app_track"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: d551356643bf13509a8b610aa947fdb7; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_resident"
    ADD CONSTRAINT d551356643bf13509a8b610aa947fdb7 FOREIGN KEY (elective3_id) REFERENCES "rotationSchedule_app_rotation"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: d642f6871ccd5b08460c904a4711a005; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_rotationset_rotations"
    ADD CONSTRAINT d642f6871ccd5b08460c904a4711a005 FOREIGN KEY (rotationset_id) REFERENCES "rotationSchedule_app_rotationset"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: d6b67b2efbf798479e7b9f4847fdeb3e; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_resident"
    ADD CONSTRAINT d6b67b2efbf798479e7b9f4847fdeb3e FOREIGN KEY (elective4_id) REFERENCES "rotationSchedule_app_rotation"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: d6e9b394a523c07225569b98f845a8a4; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_rotationlength"
    ADD CONSTRAINT d6e9b394a523c07225569b98f845a8a4 FOREIGN KEY (rotation_id) REFERENCES "rotationSchedule_app_rotation"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: d71ae21355414605869ef86d249abfdc; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_event"
    ADD CONSTRAINT d71ae21355414605869ef86d249abfdc FOREIGN KEY (rotation_id) REFERENCES "rotationSchedule_app_rotation"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: d74995152e0eb5588b0234fcaa2a3353; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_resident_resExcludedBlocks"
    ADD CONSTRAINT d74995152e0eb5588b0234fcaa2a3353 FOREIGN KEY (resident_id) REFERENCES "rotationSchedule_app_resident"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: d74c01901a0b53c8883b477e6f85d2d7; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_resident"
    ADD CONSTRAINT d74c01901a0b53c8883b477e6f85d2d7 FOREIGN KEY (elective7_id) REFERENCES "rotationSchedule_app_rotation"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: d7a76b950f61457c772763b54abfa702; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_resident_tracks"
    ADD CONSTRAINT d7a76b950f61457c772763b54abfa702 FOREIGN KEY (resident_id) REFERENCES "rotationSchedule_app_resident"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: d8670705dc163dd5f806f14abbdb1eee; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_template_templateYears"
    ADD CONSTRAINT d8670705dc163dd5f806f14abbdb1eee FOREIGN KEY (template_id) REFERENCES "rotationSchedule_app_template"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: d87e7402b9b8ad1e04567eaf619301cf; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_setedureq"
    ADD CONSTRAINT d87e7402b9b8ad1e04567eaf619301cf FOREIGN KEY ("setEduReq_year_id") REFERENCES "rotationSchedule_app_year"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: d88fe6ae3c6bff713466f353a70166a2; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_resident"
    ADD CONSTRAINT d88fe6ae3c6bff713466f353a70166a2 FOREIGN KEY (elective2_id) REFERENCES "rotationSchedule_app_rotation"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: d8b9f39a822db14c37b58d36352ef350; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_trackeducationreq"
    ADD CONSTRAINT d8b9f39a822db14c37b58d36352ef350 FOREIGN KEY ("trackEducationReq_rotation_id") REFERENCES "rotationSchedule_app_rotation"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: d928894e4089b0dad9b0388099ff6691; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_rotationset_rotations"
    ADD CONSTRAINT d928894e4089b0dad9b0388099ff6691 FOREIGN KEY (rotation_id) REFERENCES "rotationSchedule_app_rotation"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: d93d553c956ecb474abc38ca08b3cee5; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_setyeardemand"
    ADD CONSTRAINT d93d553c956ecb474abc38ca08b3cee5 FOREIGN KEY ("setYearDemand_yearSet_id") REFERENCES "rotationSchedule_app_yearset"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: d93e9a64c47db117dcacb152cc700207; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_resident"
    ADD CONSTRAINT d93e9a64c47db117dcacb152cc700207 FOREIGN KEY (elective1_id) REFERENCES "rotationSchedule_app_rotation"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: d9c62abf631498176d2bad8a312bb070; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_resident"
    ADD CONSTRAINT d9c62abf631498176d2bad8a312bb070 FOREIGN KEY (elective9_id) REFERENCES "rotationSchedule_app_rotation"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ddc311cc334c045b4532b7c960dee34a; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_resident"
    ADD CONSTRAINT ddc311cc334c045b4532b7c960dee34a FOREIGN KEY (elective5_id) REFERENCES "rotationSchedule_app_rotation"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djan_content_type_id_544b07e62b5e01bc_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT djan_content_type_id_544b07e62b5e01bc_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_206fe795ba3a57d9_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_206fe795ba3a57d9_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: e655be2d5088f9af7c151ebb9a1cba63; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_resident_resExcludedBlocks"
    ADD CONSTRAINT e655be2d5088f9af7c151ebb9a1cba63 FOREIGN KEY (templateevent_id) REFERENCES "rotationSchedule_app_templateevent"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rota_block_id_481db16fdcea4c0d_fk_rotationschedule_app_block_id; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_rotationlength"
    ADD CONSTRAINT rota_block_id_481db16fdcea4c0d_fk_rotationschedule_app_block_id FOREIGN KEY (block_id) REFERENCES "rotationSchedule_app_block"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rota_block_id_697c98cf87703d0c_fk_rotationschedule_app_block_id; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_templateevent"
    ADD CONSTRAINT rota_block_id_697c98cf87703d0c_fk_rotationschedule_app_block_id FOREIGN KEY (block_id) REFERENCES "rotationSchedule_app_block"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rota_track_id_69d4f756e0fab0d3_fk_rotationschedule_app_track_id; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_track_excludedBlocks"
    ADD CONSTRAINT rota_track_id_69d4f756e0fab0d3_fk_rotationschedule_app_track_id FOREIGN KEY (track_id) REFERENCES "rotationSchedule_app_track"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rota_track_id_7237083021447ab9_fk_rotationschedule_app_track_id; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_resident_tracks"
    ADD CONSTRAINT rota_track_id_7237083021447ab9_fk_rotationschedule_app_track_id FOREIGN KEY (track_id) REFERENCES "rotationSchedule_app_track"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rotati_year_id_24eebd151da420b3_fk_rotationschedule_app_year_id; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_yearset_years"
    ADD CONSTRAINT rotati_year_id_24eebd151da420b3_fk_rotationschedule_app_year_id FOREIGN KEY (year_id) REFERENCES "rotationSchedule_app_year"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rotati_year_id_2b72c35eeb8dbe58_fk_rotationschedule_app_year_id; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_yeardemand"
    ADD CONSTRAINT rotati_year_id_2b72c35eeb8dbe58_fk_rotationschedule_app_year_id FOREIGN KEY (year_id) REFERENCES "rotationSchedule_app_year"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rotati_year_id_55080e4623164704_fk_rotationschedule_app_year_id; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_resident"
    ADD CONSTRAINT rotati_year_id_55080e4623164704_fk_rotationschedule_app_year_id FOREIGN KEY (year_id) REFERENCES "rotationSchedule_app_year"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rotati_year_id_56b4e5d5040c19d2_fk_rotationschedule_app_year_id; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_educationreq"
    ADD CONSTRAINT rotati_year_id_56b4e5d5040c19d2_fk_rotationschedule_app_year_id FOREIGN KEY (year_id) REFERENCES "rotationSchedule_app_year"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rotati_year_id_62cedb7e1cbf1d49_fk_rotationschedule_app_year_id; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_template_templateYears"
    ADD CONSTRAINT rotati_year_id_62cedb7e1cbf1d49_fk_rotationschedule_app_year_id FOREIGN KEY (year_id) REFERENCES "rotationSchedule_app_year"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: yearset_id_55f6a772c98003ac_fk_rotationschedule_app_yearset_id; Type: FK CONSTRAINT; Schema: public; Owner: sw
--

ALTER TABLE ONLY "rotationSchedule_app_yearset_years"
    ADD CONSTRAINT yearset_id_55f6a772c98003ac_fk_rotationschedule_app_yearset_id FOREIGN KEY (yearset_id) REFERENCES "rotationSchedule_app_yearset"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

