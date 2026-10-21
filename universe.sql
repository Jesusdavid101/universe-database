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
    name character varying(30) NOT NULL,
    description text,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth numeric
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
    name character varying(30) NOT NULL,
    description text,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    planet_id integer
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
    name character varying(30) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    star_id integer
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    has_atmosphere boolean
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    galaxy_id integer
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
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', false, 13600, 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest large spiral galaxy', false, 10000, 2537000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third largest in the Local Group', false, 12000, 2730000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Classic spiral galaxy', false, 400, 23000000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Galaxy with a bright nucleus', true, 13250, 29000000);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 'Ring galaxy', false, 200, 500000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth''s only natural satellite', true, 4500, 0.384, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Larger and closer moon of Mars', false, 4500, 55, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Smaller and farther moon of Mars', false, 4500, 55, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'Most volcanically active body in the Solar System', true, 4500, 588, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'Icy moon with a subsurface ocean', true, 4500, 588, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Largest moon in the Solar System', true, 4500, 588, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Heavily cratered icy moon', true, 4500, 588, 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', 'Small reddish irregular moon', false, 4500, 588, 5);
INSERT INTO public.moon VALUES (9, 'Titan', 'Moon with a thick atmosphere and methane lakes', true, 4500, 1195, 6);
INSERT INTO public.moon VALUES (10, 'Enceladus', 'Icy moon with water geysers', true, 4500, 1195, 6);
INSERT INTO public.moon VALUES (11, 'Mimas', 'Small moon with a giant crater', true, 4500, 1195, 6);
INSERT INTO public.moon VALUES (12, 'Rhea', 'Second largest moon of Saturn', true, 4500, 1195, 6);
INSERT INTO public.moon VALUES (13, 'Dione', 'Icy moon with bright cliffs', true, 4500, 1195, 6);
INSERT INTO public.moon VALUES (14, 'Tethys', 'Icy moon with a huge canyon', true, 4500, 1195, 6);
INSERT INTO public.moon VALUES (15, 'Miranda', 'Moon with extreme and varied terrain', true, 4500, 2580, 7);
INSERT INTO public.moon VALUES (16, 'Ariel', 'Bright icy moon of Uranus', true, 4500, 2580, 7);
INSERT INTO public.moon VALUES (17, 'Umbriel', 'Dark and heavily cratered moon', true, 4500, 2580, 7);
INSERT INTO public.moon VALUES (18, 'Titania', 'Largest moon of Uranus', true, 4500, 2580, 7);
INSERT INTO public.moon VALUES (19, 'Oberon', 'Outermost major moon of Uranus', true, 4500, 2580, 7);
INSERT INTO public.moon VALUES (20, 'Triton', 'Large moon orbiting Neptune backwards', true, 4500, 4300, 8);
INSERT INTO public.moon VALUES (21, 'Nereid', 'Irregular moon with a very eccentric orbit', false, 4500, 4300, 8);
INSERT INTO public.moon VALUES (22, 'Charon', 'Largest moon of Pluto', true, 4500, 5700, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Smallest planet, closest to the Sun', false, true, 4600, 77, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Hottest planet with a thick atmosphere', false, true, 4600, 38, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Our home, the only known planet with life', true, true, 4540, 0, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'The red planet', false, true, 4600, 55, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Largest planet, a gas giant', false, true, 4600, 588, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas giant famous for its rings', false, true, 4600, 1195, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice giant tilted on its side', false, true, 4600, 2580, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Farthest ice giant with strong winds', false, true, 4600, 4300, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf planet in the Kuiper belt', false, true, 4600, 5700, 1);
INSERT INTO public.planet VALUES (10, 'Ceres', 'Dwarf planet in the asteroid belt', false, true, 4600, 263, 1);
INSERT INTO public.planet VALUES (11, 'Proxima b', 'Rocky exoplanet in the habitable zone of Proxima Centauri', false, true, 4850, 40100000, 3);
INSERT INTO public.planet VALUES (12, 'Proxima d', 'Candidate small exoplanet very close to Proxima Centauri', false, true, 4850, 40100000, 3);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestrial', 'Rocky planet with solid surface', true);
INSERT INTO public.planet_type VALUES (2, 'Gas giant', 'Huge planet made mostly of hydrogen and helium', true);
INSERT INTO public.planet_type VALUES (3, 'Ice giant', 'Planet rich in water, ammonia and methane ices', true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Our star, a yellow dwarf', true, 4600, 0.0000158, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'Brightest star in the night sky', true, 242, 8.6, 1);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 'Closest star to the Sun, a red dwarf', true, 4850, 4.24, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'Red supergiant in Orion', true, 10, 548, 1);
INSERT INTO public.star VALUES (5, 'Rigel', 'Blue supergiant in Orion', true, 8, 860, 1);
INSERT INTO public.star VALUES (6, 'Vega', 'Bright white star in Lyra', true, 455, 25, 1);
INSERT INTO public.star VALUES (7, 'Alpha Centauri A', 'Sun-like star in the nearest star system', true, 5300, 4.37, 1);
INSERT INTO public.star VALUES (8, 'V1', 'Cepheid variable star in Andromeda', true, 100, 2537000, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


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
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


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

