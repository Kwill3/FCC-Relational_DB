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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_type character varying(15),
    description text,
    has_active_stars boolean
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
    name character varying(50) NOT NULL,
    planet_id integer,
    diameter_in_km integer,
    has_atmosphere boolean,
    description text
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
-- Name: nebula; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nebula (
    nebula_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    description text
);


ALTER TABLE public.nebula OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.nebula_nebula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nebula_nebula_id_seq OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.nebula_nebula_id_seq OWNED BY public.nebula.nebula_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    volume_wrt_earth numeric(7,3),
    mass_wrt_earth numeric(7,3),
    star_id integer,
    planet_type character varying(15),
    has_life boolean,
    is_spherical boolean,
    description text
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
    name character varying(50) NOT NULL,
    galaxy_id integer,
    age_in_millions_of_years integer,
    description text
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
-- Name: nebula nebula_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula ALTER COLUMN nebula_id SET DEFAULT nextval('public.nebula_nebula_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 'Our galaxy, home to the Solar System.', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 'Nearest major galaxy to the Milky Way.', true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 'A smaller spiral galaxy in the Local Group.', true);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Elliptical', 'Known for its bright nucleus and dust lane.', false);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 'Famous for its well-defined spiral arms.', true);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Irregular', 'A satellite galaxy of the Milky Way.', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, 3474, false, 'Earth''s only natural moon, influencing tides.');
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22, false, 'A small, irregularly shaped moon of Mars.');
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12, false, 'The smaller and outermost moon of Mars.');
INSERT INTO public.moon VALUES (4, 'Io', 4, 3643, false, 'A volcanically active moon of Jupiter.');
INSERT INTO public.moon VALUES (5, 'Europa', 4, 3122, false, 'A moon of Jupiter with a potential subsurface ocean.');
INSERT INTO public.moon VALUES (6, 'Ganymede', 4, 5268, false, 'The largest moon in the Solar System.');
INSERT INTO public.moon VALUES (7, 'Callisto', 4, 4821, false, 'A heavily cratered moon of Jupiter.');
INSERT INTO public.moon VALUES (8, 'Proxima b-1', 5, 1500, false, 'A small moon orbiting Proxima b.');
INSERT INTO public.moon VALUES (9, 'Proxima b-2', 5, 800, false, 'A rocky moon with minimal atmosphere.');
INSERT INTO public.moon VALUES (10, 'Proxima c-1', 6, 2000, false, 'A moon orbiting the ice giant Proxima c.');
INSERT INTO public.moon VALUES (11, 'Sirius B-1a', 7, 4000, true, 'A large moon with a thin atmosphere.');
INSERT INTO public.moon VALUES (12, 'Sirius B-1b', 7, 2500, false, 'A rocky moon orbiting Sirius B-1.');
INSERT INTO public.moon VALUES (13, 'Sirius B-2a', 8, 1000, false, 'A small moon orbiting Sirius B-2.');
INSERT INTO public.moon VALUES (14, 'Betelgeuse X-1', 9, 3000, false, 'A moon orbiting Betelgeuse X.');
INSERT INTO public.moon VALUES (15, 'Betelgeuse X-2', 9, 1800, false, 'A smaller moon with a dusty surface.');
INSERT INTO public.moon VALUES (16, 'Vega Prime-1', 10, 1200, false, 'A moon orbiting Vega Prime.');
INSERT INTO public.moon VALUES (17, 'Vega Prime-2', 10, 900, false, 'A small, cratered moon.');
INSERT INTO public.moon VALUES (18, 'Vega Secundus-1', 11, 3500, true, 'A large moon with a thin atmosphere.');
INSERT INTO public.moon VALUES (19, 'Vega Secundus-2', 11, 2000, false, 'A moon with a faint ring system.');
INSERT INTO public.moon VALUES (20, 'Andromeda X-1', 12, 2500, false, 'A moon orbiting the ice giant Andromeda X.');


--
-- Data for Name: nebula; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nebula VALUES (1, 'Orion Nebula', 1, 'A star-forming region in the Milky Way.');
INSERT INTO public.nebula VALUES (2, 'Eagle Nebula', 1, 'Known for the Pillars of Creation.');
INSERT INTO public.nebula VALUES (3, 'Andromeda Nebula', 2, 'A bright nebula in the Andromeda galaxy.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1.000, 1.000, 1, 'Terrestrial', true, true, 'Home to diverse life forms and liquid water.');
INSERT INTO public.planet VALUES (2, 'Mars', 0.151, 0.107, 1, 'Terrestrial', false, true, 'Known for its red color and potential past water.');
INSERT INTO public.planet VALUES (3, 'Venus', 0.857, 0.815, 1, 'Terrestrial', false, true, 'Earth''s sister planet with a thick atmosphere.');
INSERT INTO public.planet VALUES (4, 'Jupiter', 1321.000, 317.800, 1, 'Gas Giant', false, true, 'Largest planet in the Solar System.');
INSERT INTO public.planet VALUES (5, 'Proxima b', NULL, 1.070, 2, 'Terrestrial', NULL, true, 'Exoplanet in the habitable zone of Proxima Centauri.');
INSERT INTO public.planet VALUES (6, 'Proxima c', NULL, 7.000, 2, 'Ice Giant', false, true, 'A cold, distant planet orbiting Proxima Centauri.');
INSERT INTO public.planet VALUES (7, 'Sirius B-1', NULL, NULL, 3, 'Gas Giant', false, true, 'A massive gas giant orbiting Sirius B.');
INSERT INTO public.planet VALUES (8, 'Sirius B-2', NULL, NULL, 3, 'Terrestrial', false, true, 'A rocky planet with extreme radiation.');
INSERT INTO public.planet VALUES (9, 'Betelgeuse X', NULL, 16.000, 4, 'Gas Giant', false, true, 'A massive planet orbiting a dying star.');
INSERT INTO public.planet VALUES (10, 'Vega Prime', NULL, NULL, 5, 'Terrestrial', false, true, 'A rocky planet with extreme temperatures.');
INSERT INTO public.planet VALUES (11, 'Vega Secundus', NULL, NULL, 5, 'Gas Giant', false, true, 'A gas giant with a faint ring system.');
INSERT INTO public.planet VALUES (12, 'Andromeda X', NULL, NULL, 6, 'Ice Giant', false, true, 'An ice giant in the Andromeda galaxy.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, 'The star at the center of our Solar System.');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 4800, 'Closest known star to the Sun, a red dwarf.');
INSERT INTO public.star VALUES (3, 'Sirius', 1, 250, 'Brightest star in the night sky, a binary system.');
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 10, 'A red supergiant in the Orion constellation.');
INSERT INTO public.star VALUES (5, 'Vega', 1, 455, 'A bright star in the Lyra constellation.');
INSERT INTO public.star VALUES (6, 'Andromeda Prime', 2, 5200, 'A massive star in the Andromeda galaxy.');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.nebula_nebula_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


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
-- Name: nebula nebula_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_name_key UNIQUE (name);


--
-- Name: nebula nebula_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_pkey PRIMARY KEY (nebula_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: nebula nebula_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

