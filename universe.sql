--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(100) NOT NULL,
    galaxy_type character varying(50),
    distance_mly numeric,
    number_of_stars integer,
    discovered_year smallint
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
    planet_id integer,
    name character varying(100) NOT NULL,
    mean_radius_km numeric(8,2),
    orbital_period_days numeric(8,2),
    discovered_year smallint
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
    star_id integer,
    name character varying(100) NOT NULL,
    planet_type text,
    orbital_period_days numeric(8,2),
    has_life boolean
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
    galaxy_id integer,
    name character varying(100) NOT NULL,
    mass_solar numeric(6,3),
    is_variable boolean,
    age_billion_years integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_planet (
    star_planet_id integer NOT NULL,
    star_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.star_planet OWNER TO freecodecamp;

--
-- Name: star_planet_star_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_planet_star_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_planet_star_planet_id_seq OWNER TO freecodecamp;

--
-- Name: star_planet_star_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_planet_star_planet_id_seq OWNED BY public.star_planet.star_planet_id;


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
-- Name: star_planet star_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet ALTER COLUMN star_planet_id SET DEFAULT nextval('public.star_planet_star_planet_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0.0, 100000000, 1610);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2530, 100000000, 964);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 3000, 40000000, 1654);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Elliptical', 29000, 80000000, 1781);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 23000, 100000000, 1773);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Spiral', 21000, 100000000, 1781);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Moon', 1737.10, 27.30, 1610);
INSERT INTO public.moon VALUES (2, 4, 'Phobos', 11.30, 0.30, 1877);
INSERT INTO public.moon VALUES (3, 4, 'Deimos', 6.20, 1.30, 1877);
INSERT INTO public.moon VALUES (4, 7, 'Alpha1-1a', 40000.00, 100.00, 2020);
INSERT INTO public.moon VALUES (5, 7, 'Alpha1-1b', 35000.00, 120.00, 2020);
INSERT INTO public.moon VALUES (6, 8, 'Alpha1-2a', 30000.00, 150.00, 2021);
INSERT INTO public.moon VALUES (7, 8, 'Alpha1-2b', 25000.00, 180.00, 2021);
INSERT INTO public.moon VALUES (8, 11, 'Tri1-Planet1a', 50000.00, 200.00, 2022);
INSERT INTO public.moon VALUES (9, 11, 'Tri1-Planet1b', 45000.00, 220.00, 2022);
INSERT INTO public.moon VALUES (10, 11, 'Tri1-Planet1c', 47000.00, 240.00, 2022);
INSERT INTO public.moon VALUES (11, 12, 'Tri1-Planet2a', 15000.00, 50.00, 2022);
INSERT INTO public.moon VALUES (12, 12, 'Tri1-Planet2b', 12000.00, 60.00, 2022);
INSERT INTO public.moon VALUES (13, 3, 'Earth Twin', 1730.00, 27.00, 2020);
INSERT INTO public.moon VALUES (14, 5, 'Proxima Moon 1', 10.00, 5.00, 2020);
INSERT INTO public.moon VALUES (15, 5, 'Proxima Moon 2', 12.00, 7.00, 2020);
INSERT INTO public.moon VALUES (16, 6, 'Proxima Moon 3', 15.00, 10.00, 2020);
INSERT INTO public.moon VALUES (17, 1, 'Mercury Moon 1', 5.00, 2.00, 2023);
INSERT INTO public.moon VALUES (18, 2, 'Venus Moon 1', 6.00, 2.00, 2023);
INSERT INTO public.moon VALUES (19, 9, 'Alpha2-1a', 1800.00, 30.00, 2023);
INSERT INTO public.moon VALUES (20, 10, 'Alpha2-2a', 2000.00, 35.00, 2023);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', 'Terrestrial', 88.00, false);
INSERT INTO public.planet VALUES (2, 1, 'Venus', 'Terrestrial', 225.00, false);
INSERT INTO public.planet VALUES (3, 1, 'Earth', 'Terrestrial', 365.25, true);
INSERT INTO public.planet VALUES (4, 1, 'Mars', 'Terrestrial', 687.00, false);
INSERT INTO public.planet VALUES (5, 2, 'Proxima b', 'Terrestrial', 11.20, false);
INSERT INTO public.planet VALUES (6, 2, 'Proxima c', 'Terrestrial', 5.15, false);
INSERT INTO public.planet VALUES (7, 3, 'Alpha1-1', 'Gas Giant', 400.00, false);
INSERT INTO public.planet VALUES (8, 3, 'Alpha1-2', 'Gas Giant', 600.00, false);
INSERT INTO public.planet VALUES (9, 4, 'Alpha2-1', 'Terrestrial', 250.00, false);
INSERT INTO public.planet VALUES (10, 4, 'Alpha2-2', 'Terrestrial', 300.00, false);
INSERT INTO public.planet VALUES (11, 5, 'Tri1-Planet1', 'Gas Giant', 700.00, false);
INSERT INTO public.planet VALUES (12, 5, 'Tri1-Planet2', 'Terrestrial', 320.00, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 1.000, false, 4);
INSERT INTO public.star VALUES (2, 1, 'Proxima', 0.123, true, 5);
INSERT INTO public.star VALUES (3, 2, 'Alpha Centauri A', 1.100, false, 5);
INSERT INTO public.star VALUES (4, 2, 'Alpha Centauri B', 0.907, false, 5);
INSERT INTO public.star VALUES (5, 3, 'TriStar 1', 0.900, true, 3);
INSERT INTO public.star VALUES (6, 3, 'TriStar 2', 1.050, false, 4);


--
-- Data for Name: star_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_planet VALUES (1, 1, 1, 'Sun-Mercury Link');
INSERT INTO public.star_planet VALUES (2, 1, 2, 'Sun-Venus Link');
INSERT INTO public.star_planet VALUES (3, 1, 3, 'Sun-Earth Link');
INSERT INTO public.star_planet VALUES (4, 1, 4, 'Sun-Mars Link');
INSERT INTO public.star_planet VALUES (5, 2, 5, 'Proxima-Proxima b Link');
INSERT INTO public.star_planet VALUES (6, 2, 6, 'Proxima-Proxima c Link');
INSERT INTO public.star_planet VALUES (7, 3, 7, 'TriStar1-Alpha1-1 Link');
INSERT INTO public.star_planet VALUES (8, 3, 8, 'TriStar1-Alpha1-2 Link');
INSERT INTO public.star_planet VALUES (9, 4, 9, 'Alpha Centauri B-Alpha2-1 Link');
INSERT INTO public.star_planet VALUES (10, 4, 10, 'Alpha Centauri B-Alpha2-2 Link');
INSERT INTO public.star_planet VALUES (11, 5, 11, 'TriStar2-Tri1-Planet1 Link');
INSERT INTO public.star_planet VALUES (12, 5, 12, 'TriStar2-Tri1-Planet2 Link');


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
-- Name: star_planet_star_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_planet_star_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: star_planet star_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet
    ADD CONSTRAINT star_planet_name_key UNIQUE (name);


--
-- Name: star_planet star_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet
    ADD CONSTRAINT star_planet_pkey PRIMARY KEY (star_planet_id);


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
-- Name: star_planet star_planet_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet
    ADD CONSTRAINT star_planet_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star_planet star_planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet
    ADD CONSTRAINT star_planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

