--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

-- Started on 2020-02-14 20:03:40

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
-- TOC entry 202 (class 1259 OID 40991)
-- Name: evento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.evento (
    nombre character varying(150) NOT NULL,
    descripcion character varying(2000) NOT NULL,
    lugar character varying(2000) NOT NULL,
    fecha date NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.evento OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 41066)
-- Name: evento_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.evento_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.evento_id_seq1 OWNER TO postgres;

--
-- TOC entry 2847 (class 0 OID 0)
-- Dependencies: 206
-- Name: evento_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.evento_id_seq1 OWNED BY public.evento.id;


--
-- TOC entry 203 (class 1259 OID 40999)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    nombre character varying(100) NOT NULL,
    apellido character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    telefono numeric(15,0) NOT NULL,
    usuario character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 41005)
-- Name: usuario_asiste_evento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario_asiste_evento (
    usuario integer NOT NULL,
    evento integer NOT NULL
);


ALTER TABLE public.usuario_asiste_evento OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 41036)
-- Name: usuario_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_id_seq1 OWNER TO postgres;

--
-- TOC entry 2848 (class 0 OID 0)
-- Dependencies: 205
-- Name: usuario_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_seq1 OWNED BY public.usuario.id;


--
-- TOC entry 2699 (class 2604 OID 41068)
-- Name: evento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evento ALTER COLUMN id SET DEFAULT nextval('public.evento_id_seq1'::regclass);


--
-- TOC entry 2700 (class 2604 OID 41038)
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq1'::regclass);


--
-- TOC entry 2837 (class 0 OID 40991)
-- Dependencies: 202
-- Data for Name: evento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.evento VALUES ('Evento1', 'Evento de prueba', 'Alicante', '2019-11-27', 1);
INSERT INTO public.evento VALUES ('Evento2', 'Evento de prueba 2', 'Valencia', '2019-11-27', 2);
INSERT INTO public.evento VALUES ('asdf', 'asdf', 'asdf', '1111-11-11', 3);
INSERT INTO public.evento VALUES ('wergys', 'sfghdfh', 'dfghjdfj', '2019-12-31', 4);


--
-- TOC entry 2838 (class 0 OID 40999)
-- Dependencies: 203
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuario VALUES ('Fran', 'Garcia', 'fran@email.com', 666666666, 'FGarcia', '1234', 1);
INSERT INTO public.usuario VALUES ('Pepe', 'López', 'pepe@email.com', 666666668, 'PLopez', '1234', 2);
INSERT INTO public.usuario VALUES ('Cristian', 'Jimenez', 'kaiser@email.com', 666666669, 'CJime', '1234', 3);
INSERT INTO public.usuario VALUES ('asdfqawer', 'Brohgdjdfwn', 'ahjfgkjsdf', 4567453, 'iopiuo', 'ggh', 6);
INSERT INTO public.usuario VALUES ('asdf', 'asdf', 'asdf', 987654, 'iopiuo', 'asdf', 15);
INSERT INTO public.usuario VALUES ('asdf', 'asdf', 'asdf', 645654, 'asdf', 'asdf', 22);
INSERT INTO public.usuario VALUES ('asdf', 'asdf', 'asdf', 35161651, 'asdf', 'asdf', 23);


--
-- TOC entry 2839 (class 0 OID 41005)
-- Dependencies: 204
-- Data for Name: usuario_asiste_evento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuario_asiste_evento VALUES (1, 1);
INSERT INTO public.usuario_asiste_evento VALUES (1, 2);
INSERT INTO public.usuario_asiste_evento VALUES (3, 2);
INSERT INTO public.usuario_asiste_evento VALUES (3, 1);


--
-- TOC entry 2849 (class 0 OID 0)
-- Dependencies: 206
-- Name: evento_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.evento_id_seq1', 4, true);


--
-- TOC entry 2850 (class 0 OID 0)
-- Dependencies: 205
-- Name: usuario_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_id_seq1', 23, true);


--
-- TOC entry 2702 (class 2606 OID 41077)
-- Name: evento evento_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evento
    ADD CONSTRAINT evento_pk PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 41015)
-- Name: usuario_asiste_evento usuario_asiste_evento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_asiste_evento
    ADD CONSTRAINT usuario_asiste_evento_pkey PRIMARY KEY (usuario, evento);


--
-- TOC entry 2704 (class 2606 OID 41047)
-- Name: usuario usuario_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pk PRIMARY KEY (id);


--
-- TOC entry 2705 (class 1259 OID 41053)
-- Name: fki_usuario_asiste_evento_ibfk2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_usuario_asiste_evento_ibfk2 ON public.usuario_asiste_evento USING btree (usuario);


--
-- TOC entry 2706 (class 1259 OID 41083)
-- Name: fki_usuario_asiste_evento_ibfk_1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_usuario_asiste_evento_ibfk_1 ON public.usuario_asiste_evento USING btree (evento);


--
-- TOC entry 2710 (class 2606 OID 41078)
-- Name: usuario_asiste_evento usuario_asiste_evento_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_asiste_evento
    ADD CONSTRAINT usuario_asiste_evento_ibfk_1 FOREIGN KEY (evento) REFERENCES public.evento(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 2709 (class 2606 OID 41059)
-- Name: usuario_asiste_evento usuario_asiste_evento_ibfk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_asiste_evento
    ADD CONSTRAINT usuario_asiste_evento_ibfk_2 FOREIGN KEY (usuario) REFERENCES public.usuario(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


-- Completed on 2020-02-14 20:03:41

--
-- PostgreSQL database dump complete
--

