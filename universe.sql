--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    age_in_millions_of_years numeric,
    description text NOT NULL,
    galaxy_types text,
    cardinal_direction text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40),
    distance_from_earth integer NOT NULL,
    description text,
    moon_type text,
    has_life boolean,
    cardinal_direction text,
    planet_name character varying(40)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    cardinal_direction text NOT NULL,
    distance_from_sun integer,
    has_life boolean,
    description text,
    occupancy integer,
    planet_moon_reference integer NOT NULL,
    planet_name character varying(40)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_planet_moon_reference_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_moon_reference_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_moon_reference_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_moon_reference_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_moon_reference_seq OWNED BY public.planet.planet_moon_reference;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    distance_from_earth numeric NOT NULL,
    description text,
    planet_type text,
    cardinal_direction text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: starship; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.starship (
    starship_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    occupancy integer NOT NULL
);


ALTER TABLE public.starship OWNER TO freecodecamp;

--
-- Name: starship_starship_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.starship_starship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.starship_starship_id_seq OWNER TO freecodecamp;

--
-- Name: starship_starship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.starship_starship_id_seq OWNED BY public.starship.starship_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet planet_moon_reference; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_moon_reference SET DEFAULT nextval('public.planet_planet_moon_reference_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: starship starship_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.starship ALTER COLUMN starship_id SET DEFAULT nextval('public.starship_starship_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'bob', 20, 'small', 'first', 'North');
INSERT INTO public.galaxy VALUES (2, 'jim', 30, 'bigger', 'second', 'South');
INSERT INTO public.galaxy VALUES (5, 'Amanda', 27, 'small', 'first', 'Vancouver');
INSERT INTO public.galaxy VALUES (6, 'Megan', 24, 'medium', 'second', 'Mississippi');
INSERT INTO public.galaxy VALUES (7, 'Ryan', 20, 'huge', 'third', 'Virginia');
INSERT INTO public.galaxy VALUES (8, 'Dave', 50, 'medium', 'father', 'Nashville');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'm1', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'm2', 2, NULL, NULL, NULL, NULL, 'p1');
INSERT INTO public.moon VALUES (12, 'm3', 3, NULL, NULL, NULL, NULL, 'p2');
INSERT INTO public.moon VALUES (13, 'm4', 4, NULL, NULL, NULL, NULL, 'p3');
INSERT INTO public.moon VALUES (14, 'm5', 5, NULL, NULL, NULL, NULL, 'p4');
INSERT INTO public.moon VALUES (15, 'm6', 6, NULL, NULL, NULL, NULL, 'p5');
INSERT INTO public.moon VALUES (16, 'm7', 7, NULL, NULL, NULL, NULL, 'p6');
INSERT INTO public.moon VALUES (17, 'm8', 8, NULL, NULL, NULL, NULL, 'p8');
INSERT INTO public.moon VALUES (18, 'm9', 9, NULL, NULL, NULL, NULL, 'p9');
INSERT INTO public.moon VALUES (19, 'm10', 10, NULL, NULL, NULL, NULL, 'p10');
INSERT INTO public.moon VALUES (20, 'm11', 11, NULL, NULL, NULL, NULL, 'p11');
INSERT INTO public.moon VALUES (21, 'm12', 12, NULL, NULL, NULL, NULL, 'p12');
INSERT INTO public.moon VALUES (22, 'm13', 13, NULL, NULL, NULL, NULL, 'p1');
INSERT INTO public.moon VALUES (23, 'm14', 14, NULL, NULL, NULL, NULL, 'p2');
INSERT INTO public.moon VALUES (24, 'm15', 15, NULL, NULL, NULL, NULL, 'p3');
INSERT INTO public.moon VALUES (25, 'm16', 16, NULL, NULL, NULL, NULL, 'p4');
INSERT INTO public.moon VALUES (26, 'm17', 17, NULL, NULL, NULL, NULL, 'p5');
INSERT INTO public.moon VALUES (27, 'm18', 18, NULL, NULL, NULL, NULL, 'p6');
INSERT INTO public.moon VALUES (28, 'm19', 19, NULL, NULL, NULL, NULL, 'p7');
INSERT INTO public.moon VALUES (29, 'm20', 20, NULL, NULL, NULL, NULL, 'p8');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (25, 'p1', 'North', NULL, NULL, NULL, NULL, 15, 'p1');
INSERT INTO public.planet VALUES (26, 'p2', 'South', NULL, NULL, NULL, NULL, 16, 'p2');
INSERT INTO public.planet VALUES (27, 'p3', 'Vancouver', NULL, NULL, NULL, NULL, 17, 'p3');
INSERT INTO public.planet VALUES (28, 'p4', 'Mississippi', NULL, NULL, NULL, NULL, 18, 'p4');
INSERT INTO public.planet VALUES (29, 'p6', 'Virginia', NULL, NULL, NULL, NULL, 19, 'p6');
INSERT INTO public.planet VALUES (30, 'p5', 'Nashville', NULL, NULL, NULL, NULL, 20, 'p5');
INSERT INTO public.planet VALUES (31, 'p7', 'North', NULL, NULL, NULL, NULL, 21, 'p7');
INSERT INTO public.planet VALUES (32, 'p8', 'South', NULL, NULL, NULL, NULL, 22, 'p8');
INSERT INTO public.planet VALUES (33, 'p9', 'Mississippi', NULL, NULL, NULL, NULL, 23, 'p9');
INSERT INTO public.planet VALUES (34, 'p10', 'Virginia', NULL, NULL, NULL, NULL, 24, 'p10');
INSERT INTO public.planet VALUES (35, 'p11', 'Nashville', NULL, NULL, NULL, NULL, 25, 'p11');
INSERT INTO public.planet VALUES (36, 'p12', 'North', NULL, NULL, NULL, NULL, 26, 'p12');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'star1', 1, 'first', '', 'North');
INSERT INTO public.star VALUES (2, 'star2', 2, NULL, NULL, 'South');
INSERT INTO public.star VALUES (3, 'star3', 3, NULL, NULL, 'Vancouver');
INSERT INTO public.star VALUES (4, 'star4', 4, NULL, NULL, 'Mississippi');
INSERT INTO public.star VALUES (5, 'star5', 5, NULL, NULL, 'Virginia');
INSERT INTO public.star VALUES (6, 'star6', 6, NULL, NULL, 'Nashville');


--
-- Data for Name: starship; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.starship VALUES (1, 'ship1', NULL, 1);
INSERT INTO public.starship VALUES (2, 'ship 2', NULL, 2);
INSERT INTO public.starship VALUES (3, 'ship3', NULL, 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 29, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 36, true);


--
-- Name: planet_planet_moon_reference_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_moon_reference_seq', 26, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: starship_starship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.starship_starship_id_seq', 3, true);


--
-- Name: galaxy cd; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT cd UNIQUE (cardinal_direction);


--
-- Name: star fcd; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fcd UNIQUE (cardinal_direction);


--
-- Name: galaxy galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: planet mid; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT mid UNIQUE (planet_moon_reference);


--
-- Name: planet mname; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT mname UNIQUE (planet_name);


--
-- Name: moon moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: starship starship_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.starship
    ADD CONSTRAINT starship_name_key UNIQUE (name);


--
-- Name: starship starship_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.starship
    ADD CONSTRAINT starship_pkey PRIMARY KEY (starship_id);


--
-- Name: star cd; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT cd FOREIGN KEY (cardinal_direction) REFERENCES public.galaxy(cardinal_direction);


--
-- Name: planet fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk FOREIGN KEY (cardinal_direction) REFERENCES public.star(cardinal_direction);


--
-- Name: moon moon_planet_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_name_fkey FOREIGN KEY (planet_name) REFERENCES public.planet(planet_name);


--
-- PostgreSQL database dump complete
--

