--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    orbit numeric(10,2) NOT NULL,
    planet_id integer NOT NULL,
    last_seen date,
    observer text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    age numeric(10,2) NOT NULL,
    distance numeric(12,3) NOT NULL,
    has_life boolean DEFAULT false
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
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    diameter integer NOT NULL,
    is_habitable boolean DEFAULT false
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
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    mass numeric(12,3) NOT NULL,
    has_rings boolean DEFAULT false,
    distance_from_sun numeric(12,3) NOT NULL
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    temperature integer NOT NULL,
    is_visible boolean DEFAULT true
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halleys Comet', 5.20, 1, '1986-02-09', NULL);
INSERT INTO public.comet VALUES (2, 'Comet NEOWISE', 6.40, 3, '2020-07-23', NULL);
INSERT INTO public.comet VALUES (3, 'Comet Hale-Bopp', 8.00, 2, '1997-04-01', NULL);
INSERT INTO public.comet VALUES (4, 'Comet Tempel 1', 4.60, 4, '2005-07-04', NULL);
INSERT INTO public.comet VALUES (5, 'Comet McNaught', 3.10, 5, '2007-01-12', NULL);
INSERT INTO public.comet VALUES (6, 'Comet 67P', 3.60, 6, '2014-08-06', NULL);
INSERT INTO public.comet VALUES (7, 'Comet ISON', 4.20, 3, '2013-11-28', NULL);
INSERT INTO public.comet VALUES (8, 'Comet Lovejoy', 2.50, 10, '2011-12-17', NULL);
INSERT INTO public.comet VALUES (9, 'Comet Shoemaker-Levy 9', 2.90, 12, '1994-07-16', NULL);
INSERT INTO public.comet VALUES (10, 'Comet Swift-Tuttle', 6.10, 2, '1992-08-25', NULL);
INSERT INTO public.comet VALUES (11, 'Comet Encke', 3.30, 1, '2017-11-25', NULL);
INSERT INTO public.comet VALUES (12, 'Comet Johnson', 5.50, 11, '2015-03-20', NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13.80, 0.000, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10.00, 2.537, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 5.00, 3.100, false);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 13.70, 53.500, false);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 12.00, 15.800, true);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 9.80, 28.000, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3475, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12, false);
INSERT INTO public.moon VALUES (4, 'Titan', 5, 5150, false);
INSERT INTO public.moon VALUES (5, 'Europa', 1, 3121, false);
INSERT INTO public.moon VALUES (6, 'Io', 1, 3643, false);
INSERT INTO public.moon VALUES (7, 'Callisto', 1, 4821, false);
INSERT INTO public.moon VALUES (8, 'Ganymede', 1, 5268, false);
INSERT INTO public.moon VALUES (9, 'Rhea', 5, 1528, false);
INSERT INTO public.moon VALUES (10, 'Enceladus', 5, 504, false);
INSERT INTO public.moon VALUES (11, 'Triton', 6, 2706, false);
INSERT INTO public.moon VALUES (12, 'Charon', 7, 1212, false);
INSERT INTO public.moon VALUES (13, 'Ceres', 8, 946, false);
INSERT INTO public.moon VALUES (14, 'Oberon', 6, 1522, false);
INSERT INTO public.moon VALUES (15, 'Titania', 6, 1577, false);
INSERT INTO public.moon VALUES (16, 'Miranda', 6, 471, false);
INSERT INTO public.moon VALUES (17, 'Ariel', 6, 1157, false);
INSERT INTO public.moon VALUES (18, 'Umbriel', 6, 1171, false);
INSERT INTO public.moon VALUES (19, 'Mimas', 5, 396, false);
INSERT INTO public.moon VALUES (20, 'FakeMoon', 1, 3475, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 5.972, false, 1.000);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 0.641, false, 1.520);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 4.867, false, 0.720);
INSERT INTO public.planet VALUES (4, 'Jupiter', 1, 1898.000, true, 5.200);
INSERT INTO public.planet VALUES (5, 'Saturn', 1, 568.000, true, 9.580);
INSERT INTO public.planet VALUES (6, 'Uranus', 1, 86.800, true, 19.200);
INSERT INTO public.planet VALUES (7, 'Neptune', 1, 102.000, true, 30.100);
INSERT INTO public.planet VALUES (8, 'Mercury', 1, 0.330, false, 0.390);
INSERT INTO public.planet VALUES (9, 'Kepler-22b', 2, 15.000, true, 0.810);
INSERT INTO public.planet VALUES (10, 'Proxima b', 5, 1.170, false, 0.050);
INSERT INTO public.planet VALUES (11, 'Alpha Centauri Bb', 5, 1.200, false, 0.030);
INSERT INTO public.planet VALUES (12, 'Alpha Centauri Cb', 4, 1.200, false, 0.030);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 5778, true);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 2, 5790, true);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 9940, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 3, 3500, false);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 2, 3050, true);
INSERT INTO public.star VALUES (6, 'Rigel', 4, 12000, true);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 12, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


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
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: comet comet_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

