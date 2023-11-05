--
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    image_url text,
    symbolism character varying(30)
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    aparent_magnitud numeric(4,2) NOT NULL,
    distance_kpc integer NOT NULL,
    name_origin text
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
-- Name: meteor_shower; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.meteor_shower (
    meteor_shower_id integer NOT NULL,
    name character varying(30) NOT NULL,
    date_of_peak date,
    velocity_km_s integer,
    parent_body character varying(30),
    constellation_id integer NOT NULL
);


ALTER TABLE public.meteor_shower OWNER TO freecodecamp;

--
-- Name: meteor_shower_meteor_shower_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.meteor_shower_meteor_shower_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meteor_shower_meteor_shower_id_seq OWNER TO freecodecamp;

--
-- Name: meteor_shower_meteor_shower_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.meteor_shower_meteor_shower_id_seq OWNED BY public.meteor_shower.meteor_shower_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    designation character varying(30) NOT NULL,
    mean_radius_km numeric(7,2) NOT NULL
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
    star_id integer NOT NULL,
    has_rings boolean NOT NULL,
    rotation_period numeric(6,2),
    revolution_period integer,
    is_rocky boolean NOT NULL
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
    galaxy_id integer NOT NULL,
    constellation_id integer,
    distance_ly numeric(9,2),
    temperature_k integer NOT NULL,
    age_my integer NOT NULL,
    spectral_type character varying(20) NOT NULL,
    mass_sm numeric(7,2)
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: meteor_shower meteor_shower_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteor_shower ALTER COLUMN meteor_shower_id SET DEFAULT nextval('public.meteor_shower_meteor_shower_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Virgo', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/VirgoCC.jpg/330px-VirgoCC.jpg', 'the Maiden');
INSERT INTO public.constellation VALUES (2, 'Leo', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/LeoCC.jpg/330px-LeoCC.jpg', 'the Lion');
INSERT INTO public.constellation VALUES (3, 'Gemini', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/GeminiCC.jpg/420px-GeminiCC.jpg', 'the Twins, Castor and Pollux');
INSERT INTO public.constellation VALUES (4, 'Boötes', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bb/BootesCC.jpg/300px-BootesCC.jpg', 'The Herdsman');
INSERT INTO public.constellation VALUES (5, 'Aries', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/AriesCC.jpg/384px-AriesCC.jpg', 'the Ram');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', -6.50, 0, 'The appearance from Earth of the galaxy—a band of light');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 3.40, 770, 'Andromeda, which is shortened from "Andromeda Galaxy", gets its name from the area of the sky in which it appears, the constellation of Andromeda.');
INSERT INTO public.galaxy VALUES (3, 'Sculptor Galaxy', 7.20, 3700, 'Named after its location in the Sculptor Constellation. Also called the Silver Dollar or Silver Coin Galaxy, because of its light and circular appearance.');
INSERT INTO public.galaxy VALUES (4, 'Triangulum Galaxy', 5.70, 2900, 'Named after its location within the Triangulum constellation.');
INSERT INTO public.galaxy VALUES (5, 'Bodes Galaxy', 6.94, 12000, 'Named for Johann Elert Bode who discovered this galaxy in 1774.');
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 0.90, 160, 'Named after Ferdinand Magellan.');


--
-- Data for Name: meteor_shower; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.meteor_shower VALUES (1, 'Leonids', '9999-11-17', 71, '55P/Tempel–Tuttle', 2);
INSERT INTO public.meteor_shower VALUES (2, 'Geminids', '9999-12-14', 35, NULL, 3);
INSERT INTO public.meteor_shower VALUES (3, 'Quadrantids', '9999-01-03', 41, '2003 EH', 4);
INSERT INTO public.meteor_shower VALUES (4, 'Arietids', '9999-06-08', 71, NULL, 5);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 'Earth I', 1737.40);
INSERT INTO public.moon VALUES (2, 'Ganymede', 14, 'Jupiter III', 2634.10);
INSERT INTO public.moon VALUES (3, 'Callisto', 14, 'Jupiter IV', 2410.30);
INSERT INTO public.moon VALUES (4, 'Io', 14, 'Jupiter I', 1821.60);
INSERT INTO public.moon VALUES (5, 'Europa', 14, 'Jupiter II', 1560.80);
INSERT INTO public.moon VALUES (6, 'Titan', 15, 'Saturn VI', 2574.73);
INSERT INTO public.moon VALUES (7, 'Triton', 17, 'Neptune I', 1353.40);
INSERT INTO public.moon VALUES (8, 'Rhea', 15, 'Saturn V', 1532.40);
INSERT INTO public.moon VALUES (9, 'Iapetus', 15, 'Saturn VIII', 1492.00);
INSERT INTO public.moon VALUES (10, 'Dione', 15, 'Saturn IV', 1128.80);
INSERT INTO public.moon VALUES (11, 'Tethys', 15, 'Saturn III', 531.10);
INSERT INTO public.moon VALUES (12, 'Oberon', 16, 'Uranus IV', 761.40);
INSERT INTO public.moon VALUES (13, 'Umbriel', 16, 'Uranus II', 584.70);
INSERT INTO public.moon VALUES (14, 'Ariel', 16, 'Uranus I', 578.90);
INSERT INTO public.moon VALUES (15, 'Charon', 18, 'Pluto I', 606.00);
INSERT INTO public.moon VALUES (16, 'Enceladus', 15, 'Saturn II', 252.10);
INSERT INTO public.moon VALUES (17, 'Miranda', 16, 'Uranus V', 235.80);
INSERT INTO public.moon VALUES (18, 'Mimas', 15, 'Saturn I', 415.60);
INSERT INTO public.moon VALUES (19, 'Hyperion', 15, 'Saturn VII', 135.00);
INSERT INTO public.moon VALUES (20, 'Proteus', 17, 'Neptune VIII', 210.00);
INSERT INTO public.moon VALUES (21, 'Nereid ', 17, 'Neptune II', 178.50);
INSERT INTO public.moon VALUES (22, 'Vanth', 19, 'Orcus I', 221.25);
INSERT INTO public.moon VALUES (23, 'Himalia', 14, 'Jupiter VI', 69.80);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, false, 58.66, 88, true);
INSERT INTO public.planet VALUES (2, 'Venus', 1, false, 243.00, 224, true);
INSERT INTO public.planet VALUES (3, 'Earth', 1, false, 1.00, 365, true);
INSERT INTO public.planet VALUES (13, 'Mars', 1, false, 1.03, 687, true);
INSERT INTO public.planet VALUES (14, 'Jupiter', 1, true, 0.42, 4332, false);
INSERT INTO public.planet VALUES (15, 'Saturn', 1, true, 0.45, 10775, false);
INSERT INTO public.planet VALUES (16, 'Uranus', 1, true, 0.71, 30681, false);
INSERT INTO public.planet VALUES (17, 'Neptune', 1, true, 0.67, 60193, false);
INSERT INTO public.planet VALUES (18, 'Pluto', 1, false, 1.00, NULL, true);
INSERT INTO public.planet VALUES (19, 'Orcus', 1, false, NULL, NULL, true);
INSERT INTO public.planet VALUES (20, 'Haumea', 1, false, 0.16, NULL, true);
INSERT INTO public.planet VALUES (21, 'Eris', 1, false, 15.78, NULL, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, NULL, 0.00, 5772, 4600, 'G2V', 1.00);
INSERT INTO public.star VALUES (2, 'Spica', 1, 1, 250.00, 25300, 12500, 'B1V', 11.43);
INSERT INTO public.star VALUES (3, 'Zavijava', 1, 1, 35.65, 6132, 2900, 'F9 V', 1.41);
INSERT INTO public.star VALUES (4, 'Porrima', 1, 1, 38.10, 6757, 1140, 'F0 V/F0 V', 1.56);
INSERT INTO public.star VALUES (5, 'Minelauva', 1, 1, 198.00, 3999, 1234, 'M3 III', 1.40);
INSERT INTO public.star VALUES (6, 'Regulus', 1, 2, 79.30, 11668, 1000, 'B8 IVn', 3.80);
INSERT INTO public.star VALUES (7, 'Denebola', 1, 2, 35.90, 8500, 380, 'A3Va', 1.78);
INSERT INTO public.star VALUES (8, 'Algieba', 1, 2, 130.00, 4470, 1234, 'K1 III', 1.23);


--
-- Name: constellation_constellation_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: meteor_shower_meteor_shower_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.meteor_shower_meteor_shower_id_seq', 4, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 21, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: meteor_shower meteor_shower_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteor_shower
    ADD CONSTRAINT meteor_shower_name_key UNIQUE (name);


--
-- Name: meteor_shower meteor_shower_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteor_shower
    ADD CONSTRAINT meteor_shower_pkey PRIMARY KEY (meteor_shower_id);


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
-- Name: meteor_shower meteor_shower_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteor_shower
    ADD CONSTRAINT meteor_shower_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


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
-- Name: star star_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

