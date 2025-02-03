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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(20) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (97, 2018, 'Final', 324, 325, 4, 2);
INSERT INTO public.games VALUES (98, 2018, 'Third Place', 326, 327, 2, 0);
INSERT INTO public.games VALUES (99, 2018, 'Semi-Final', 325, 327, 2, 1);
INSERT INTO public.games VALUES (100, 2018, 'Semi-Final', 324, 326, 1, 0);
INSERT INTO public.games VALUES (101, 2018, 'Quarter-Final', 325, 328, 3, 2);
INSERT INTO public.games VALUES (102, 2018, 'Quarter-Final', 327, 329, 2, 0);
INSERT INTO public.games VALUES (103, 2018, 'Quarter-Final', 326, 330, 2, 1);
INSERT INTO public.games VALUES (104, 2018, 'Quarter-Final', 324, 331, 2, 0);
INSERT INTO public.games VALUES (105, 2018, 'Eighth-Final', 327, 332, 2, 1);
INSERT INTO public.games VALUES (106, 2018, 'Eighth-Final', 329, 333, 1, 0);
INSERT INTO public.games VALUES (107, 2018, 'Eighth-Final', 326, 334, 3, 2);
INSERT INTO public.games VALUES (108, 2018, 'Eighth-Final', 330, 335, 2, 0);
INSERT INTO public.games VALUES (109, 2018, 'Eighth-Final', 325, 336, 2, 1);
INSERT INTO public.games VALUES (110, 2018, 'Eighth-Final', 328, 337, 2, 1);
INSERT INTO public.games VALUES (111, 2018, 'Eighth-Final', 331, 338, 2, 1);
INSERT INTO public.games VALUES (112, 2018, 'Eighth-Final', 324, 339, 4, 3);
INSERT INTO public.games VALUES (113, 2014, 'Final', 340, 339, 1, 0);
INSERT INTO public.games VALUES (114, 2014, 'Third Place', 341, 330, 3, 0);
INSERT INTO public.games VALUES (115, 2014, 'Semi-Final', 339, 341, 1, 0);
INSERT INTO public.games VALUES (116, 2014, 'Semi-Final', 340, 330, 7, 1);
INSERT INTO public.games VALUES (117, 2014, 'Quarter-Final', 341, 342, 1, 0);
INSERT INTO public.games VALUES (118, 2014, 'Quarter-Final', 339, 326, 1, 0);
INSERT INTO public.games VALUES (119, 2014, 'Quarter-Final', 330, 332, 2, 1);
INSERT INTO public.games VALUES (120, 2014, 'Quarter-Final', 340, 324, 1, 0);
INSERT INTO public.games VALUES (121, 2014, 'Eighth-Final', 330, 343, 2, 1);
INSERT INTO public.games VALUES (122, 2014, 'Eighth-Final', 332, 331, 2, 0);
INSERT INTO public.games VALUES (123, 2014, 'Eighth-Final', 324, 344, 2, 0);
INSERT INTO public.games VALUES (124, 2014, 'Eighth-Final', 340, 345, 2, 1);
INSERT INTO public.games VALUES (125, 2014, 'Eighth-Final', 341, 335, 2, 1);
INSERT INTO public.games VALUES (126, 2014, 'Eighth-Final', 342, 346, 2, 1);
INSERT INTO public.games VALUES (127, 2014, 'Eighth-Final', 339, 333, 1, 0);
INSERT INTO public.games VALUES (128, 2014, 'Eighth-Final', 326, 347, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (324, 'France');
INSERT INTO public.teams VALUES (325, 'Croatia');
INSERT INTO public.teams VALUES (326, 'Belgium');
INSERT INTO public.teams VALUES (327, 'England');
INSERT INTO public.teams VALUES (328, 'Russia');
INSERT INTO public.teams VALUES (329, 'Sweden');
INSERT INTO public.teams VALUES (330, 'Brazil');
INSERT INTO public.teams VALUES (331, 'Uruguay');
INSERT INTO public.teams VALUES (332, 'Colombia');
INSERT INTO public.teams VALUES (333, 'Switzerland');
INSERT INTO public.teams VALUES (334, 'Japan');
INSERT INTO public.teams VALUES (335, 'Mexico');
INSERT INTO public.teams VALUES (336, 'Denmark');
INSERT INTO public.teams VALUES (337, 'Spain');
INSERT INTO public.teams VALUES (338, 'Portugal');
INSERT INTO public.teams VALUES (339, 'Argentina');
INSERT INTO public.teams VALUES (340, 'Germany');
INSERT INTO public.teams VALUES (341, 'Netherlands');
INSERT INTO public.teams VALUES (342, 'Costa Rica');
INSERT INTO public.teams VALUES (343, 'Chile');
INSERT INTO public.teams VALUES (344, 'Nigeria');
INSERT INTO public.teams VALUES (345, 'Algeria');
INSERT INTO public.teams VALUES (346, 'Greece');
INSERT INTO public.teams VALUES (347, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 128, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 347, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games fk_opponent_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_opponent_id FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games fk_winner_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_winner_id FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

