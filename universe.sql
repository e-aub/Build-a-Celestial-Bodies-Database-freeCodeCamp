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
-- Name: continent; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.continent (
    continent_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth numeric(5,2) DEFAULT 0 NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    has_life boolean DEFAULT false,
    description text,
    population integer DEFAULT 0 NOT NULL,
    planet_id integer
);


ALTER TABLE public.continent OWNER TO freecodecamp;

--
-- Name: continent_continent_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.continent_continent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.continent_continent_id_seq OWNER TO freecodecamp;

--
-- Name: continent_continent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.continent_continent_id_seq OWNED BY public.continent.continent_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    distance_from_earth numeric(5,2) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    has_life boolean DEFAULT false,
    description text,
    is_spherical boolean DEFAULT false,
    population integer DEFAULT 0 NOT NULL
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
    distance_from_earth numeric(5,2) DEFAULT 0 NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    has_life boolean DEFAULT false,
    description text,
    is_spherical boolean DEFAULT false,
    population integer DEFAULT 0 NOT NULL,
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
    distance_from_earth numeric(5,2) DEFAULT 0 NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    has_life boolean DEFAULT false,
    description text,
    is_spherical boolean DEFAULT false,
    population integer DEFAULT 0 NOT NULL,
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth numeric(5,2) DEFAULT 0 NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    has_life boolean DEFAULT false,
    description text,
    is_spherical boolean DEFAULT false,
    population integer DEFAULT 0 NOT NULL,
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
-- Name: continent continent_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.continent ALTER COLUMN continent_id SET DEFAULT nextval('public.continent_continent_id_seq'::regclass);


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
-- Data for Name: continent; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.continent VALUES (7, 'Continent of Mysteria', 0.45, 200, true, 'A mysterious continent filled with exotic life forms.', 10000, 1);
INSERT INTO public.continent VALUES (8, 'Tropical Haven', 0.78, 150, true, 'A lush continent with vibrant jungles and diverse wildlife.', 25000, 2);
INSERT INTO public.continent VALUES (9, 'Frozen Wasteland', 1.20, 300, false, 'An icy continent with harsh conditions and little life.', 500, 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 23.44, 10, false, 'Nearest major galaxy to the Milky Way', true, 10);
INSERT INTO public.galaxy VALUES (2, 'Sombrero Galaxy', 290.00, 130, false, 'A bright galaxy with a distinct bulge and halo', true, 500);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool Galaxy', 310.00, 500, false, 'Famous spiral galaxy with unique shape', true, 2000);
INSERT INTO public.galaxy VALUES (4, 'Black Eye Galaxy', 170.00, 600, false, 'Known for its dark band of absorbing dust in front of its nucleus', true, 800);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel Galaxy', 210.00, 10, false, 'A large spiral galaxy with well-defined spiral arms', true, 3000);
INSERT INTO public.galaxy VALUES (6, 'Cigar Galaxy', 12.00, 100, false, 'An elongated galaxy with intense star formation', false, 400);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 0.38, 4500, false, 'The only natural satellite of Earth.', true, 0, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 0.38, 4500, false, 'Small, irregularly shaped moon of Mars.', true, 0, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 0.60, 4500, false, 'One of Mars’s two moons, distant and faint.', true, 0, 2);
INSERT INTO public.moon VALUES (4, 'Io', 421.00, 4600, false, 'Volcanically active moon of Jupiter.', true, 0, 3);
INSERT INTO public.moon VALUES (5, 'Europa', 628.00, 4600, false, 'Icy moon of Jupiter, potential subsurface ocean.', true, 0, 3);
INSERT INTO public.moon VALUES (6, 'Ganymede', 970.00, 4600, false, 'Largest moon in the Solar System, orbits Jupiter.', true, 0, 3);
INSERT INTO public.moon VALUES (7, 'Callisto', 880.00, 4600, false, 'Heavily cratered moon of Jupiter.', true, 0, 3);
INSERT INTO public.moon VALUES (8, 'Titan', 120.00, 4500, false, 'Largest moon of Saturn, thick atmosphere.', true, 0, 4);
INSERT INTO public.moon VALUES (9, 'Rhea', 127.00, 4500, false, 'Saturnian moon with a thin atmosphere.', true, 0, 4);
INSERT INTO public.moon VALUES (10, 'Triton', 750.00, 4500, false, 'Largest moon of Neptune, retrograde orbit.', true, 0, 5);
INSERT INTO public.moon VALUES (11, 'Charon', 600.00, 4500, false, 'Largest moon of Pluto, almost a twin planet.', true, 0, 6);
INSERT INTO public.moon VALUES (12, 'Mimas', 185.00, 4500, false, 'Small moon of Saturn, heavily cratered.', true, 0, 4);
INSERT INTO public.moon VALUES (13, 'Enceladus', 238.00, 4500, false, 'Saturn’s moon with icy plumes and ocean.', true, 0, 4);
INSERT INTO public.moon VALUES (14, 'Miranda', 236.00, 4500, false, 'Smallest and innermost moon of Uranus.', true, 0, 5);
INSERT INTO public.moon VALUES (15, 'Oberon', 580.00, 4500, false, 'Second-largest moon of Uranus, icy surface.', true, 0, 5);
INSERT INTO public.moon VALUES (16, 'Ariel', 120.00, 4500, false, 'Uranian moon with icy canyons and valleys.', true, 0, 5);
INSERT INTO public.moon VALUES (17, 'Umbriel', 265.00, 4500, false, 'Dark, icy moon of Uranus.', true, 0, 5);
INSERT INTO public.moon VALUES (18, 'Dione', 560.00, 4500, false, 'Icy moon of Saturn with wispy terrain.', true, 0, 4);
INSERT INTO public.moon VALUES (19, 'Tethys', 299.00, 4500, false, 'Moon of Saturn with an enormous canyon.', true, 0, 4);
INSERT INTO public.moon VALUES (20, 'Hyperion', 180.00, 4500, false, 'Chaotically rotating moon of Saturn.', true, 0, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercura', 45.32, 100, false, 'Small, rocky planet with a thin atmosphere.', true, 0, 1);
INSERT INTO public.planet VALUES (2, 'Voltar', 120.56, 250, true, 'A warm planet with potential microbial life.', true, 2000000, 2);
INSERT INTO public.planet VALUES (3, 'Terran', 0.00, 300, true, 'A planet with abundant water and life forms.', true, 800000000, 1);
INSERT INTO public.planet VALUES (4, 'Xenon', 300.88, 400, false, 'Gas giant with intense storms.', true, 0, 3);
INSERT INTO public.planet VALUES (5, 'Helios', 210.42, 150, false, 'Hot, rocky planet with high radiation levels.', true, 0, 4);
INSERT INTO public.planet VALUES (6, 'Aetheria', 185.33, 275, true, 'Known for its breathable atmosphere and unique flora.', true, 1000000, 2);
INSERT INTO public.planet VALUES (7, 'Thalassa', 78.21, 350, true, 'An ocean world with thriving aquatic life.', true, 2000000, 1);
INSERT INTO public.planet VALUES (8, 'Nebulon', 360.78, 200, false, 'A mysterious planet shrouded in thick clouds.', true, 0, 5);
INSERT INTO public.planet VALUES (9, 'Glacia', 430.12, 180, false, 'Icy planet with sub-zero temperatures.', true, 0, 3);
INSERT INTO public.planet VALUES (10, 'Orbis', 250.67, 50, true, 'Rocky planet with scattered life forms.', true, 750000, 6);
INSERT INTO public.planet VALUES (11, 'Zephyrus', 150.29, 500, false, 'Gas giant with faint rings.', true, 0, 5);
INSERT INTO public.planet VALUES (12, 'Aurora', 98.45, 60, true, 'A vibrant planet with frequent auroras.', true, 300000, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 8.60, 242, false, 'Brightest star in the night sky, part of the Canis Major constellation', true, 400, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 643.41, 142, false, 'Red supergiant in the Orion constellation, known for its variable brightness', true, 300, 2);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 4.24, 120, false, 'Closest known star to the Sun, part of the Alpha Centauri star system', true, 50, 3);
INSERT INTO public.star VALUES (4, 'Rigel', 863.00, 250, false, 'Blue supergiant star in the Orion constellation', true, 220, 4);
INSERT INTO public.star VALUES (5, 'Vega', 25.04, 455, false, 'A main sequence star in the Lyra constellation', true, 150, 5);
INSERT INTO public.star VALUES (6, 'Antares', 550.27, 300, false, 'A red supergiant star in the Scorpius constellation', true, 250, 6);


--
-- Name: continent_continent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.continent_continent_id_seq', 9, true);


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
-- Name: continent continent_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.continent
    ADD CONSTRAINT continent_name_key UNIQUE (name);


--
-- Name: continent continent_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.continent
    ADD CONSTRAINT continent_pkey PRIMARY KEY (continent_id);


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
-- Name: continent continent_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.continent
    ADD CONSTRAINT continent_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

