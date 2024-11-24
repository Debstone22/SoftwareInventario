--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

-- Started on 2024-11-22 23:44:04

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 16385)
-- Name: bd_piedradeagua; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA bd_piedradeagua;


ALTER SCHEMA bd_piedradeagua OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 16386)
-- Name: categoria; Type: TABLE; Schema: bd_piedradeagua; Owner: postgres
--

CREATE TABLE bd_piedradeagua.categoria (
    id_categoria character varying(2) NOT NULL,
    nombre_categoria character varying(50),
    descripcion_categoria character varying(255)
);


ALTER TABLE bd_piedradeagua.categoria OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16406)
-- Name: documento; Type: TABLE; Schema: bd_piedradeagua; Owner: postgres
--

CREATE TABLE bd_piedradeagua.documento (
    id_documento character varying(10) NOT NULL,
    tipo_doc character varying(50) NOT NULL,
    fecha_ven date NOT NULL,
    fecha_emision date NOT NULL
);


ALTER TABLE bd_piedradeagua.documento OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16411)
-- Name: documento_conductor; Type: TABLE; Schema: bd_piedradeagua; Owner: postgres
--

CREATE TABLE bd_piedradeagua.documento_conductor (
    id_trabajador character varying(10) NOT NULL,
    id_documento character varying(10) NOT NULL
);


ALTER TABLE bd_piedradeagua.documento_conductor OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16438)
-- Name: envio; Type: TABLE; Schema: bd_piedradeagua; Owner: postgres
--

CREATE TABLE bd_piedradeagua.envio (
    id_trabajador character varying(10) NOT NULL,
    id_usuario integer NOT NULL,
    fecha_relacion date NOT NULL
);


ALTER TABLE bd_piedradeagua.envio OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16453)
-- Name: material; Type: TABLE; Schema: bd_piedradeagua; Owner: postgres
--

CREATE TABLE bd_piedradeagua.material (
    id_material character varying(3) NOT NULL,
    nombre_material character varying(100) NOT NULL,
    stock numeric(10,2) NOT NULL,
    precio numeric(10,2) NOT NULL,
    id_categoria character varying(2) NOT NULL
);


ALTER TABLE bd_piedradeagua.material OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16475)
-- Name: material_pedido; Type: TABLE; Schema: bd_piedradeagua; Owner: postgres
--

CREATE TABLE bd_piedradeagua.material_pedido (
    id_material character varying(3) NOT NULL,
    id_pedido integer NOT NULL,
    cantidad_pedido smallint NOT NULL
);


ALTER TABLE bd_piedradeagua.material_pedido OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16464)
-- Name: pedido; Type: TABLE; Schema: bd_piedradeagua; Owner: postgres
--

CREATE TABLE bd_piedradeagua.pedido (
    id_pedido integer NOT NULL,
    fecha_pedido timestamp without time zone NOT NULL,
    estado_material character varying(50) NOT NULL,
    desc_pedido character varying(15) NOT NULL,
    id_usuario integer NOT NULL
);


ALTER TABLE bd_piedradeagua.pedido OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16463)
-- Name: pedido_id_pedido_seq; Type: SEQUENCE; Schema: bd_piedradeagua; Owner: postgres
--

CREATE SEQUENCE bd_piedradeagua.pedido_id_pedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bd_piedradeagua.pedido_id_pedido_seq OWNER TO postgres;

--
-- TOC entry 5007 (class 0 OID 0)
-- Dependencies: 226
-- Name: pedido_id_pedido_seq; Type: SEQUENCE OWNED BY; Schema: bd_piedradeagua; Owner: postgres
--

ALTER SEQUENCE bd_piedradeagua.pedido_id_pedido_seq OWNED BY bd_piedradeagua.pedido.id_pedido;


--
-- TOC entry 230 (class 1259 OID 16491)
-- Name: productos; Type: TABLE; Schema: bd_piedradeagua; Owner: postgres
--

CREATE TABLE bd_piedradeagua.productos (
    id_producto integer NOT NULL,
    nombre_producto character varying(255) NOT NULL,
    descripcion_producto text NOT NULL,
    precio_producto numeric(8,2) NOT NULL,
    imagen character varying(200),
    id_categoria character varying(2) NOT NULL
);


ALTER TABLE bd_piedradeagua.productos OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16490)
-- Name: productos_id_producto_seq; Type: SEQUENCE; Schema: bd_piedradeagua; Owner: postgres
--

CREATE SEQUENCE bd_piedradeagua.productos_id_producto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bd_piedradeagua.productos_id_producto_seq OWNER TO postgres;

--
-- TOC entry 5008 (class 0 OID 0)
-- Dependencies: 229
-- Name: productos_id_producto_seq; Type: SEQUENCE OWNED BY; Schema: bd_piedradeagua; Owner: postgres
--

ALTER SEQUENCE bd_piedradeagua.productos_id_producto_seq OWNED BY bd_piedradeagua.productos.id_producto;


--
-- TOC entry 231 (class 1259 OID 16504)
-- Name: registro; Type: TABLE; Schema: bd_piedradeagua; Owner: postgres
--

CREATE TABLE bd_piedradeagua.registro (
    id_registro character varying(10) NOT NULL,
    hora_registro time without time zone NOT NULL,
    fecha_registro date NOT NULL,
    tipo_registro character varying(50) NOT NULL,
    descripcion_registro character varying(255) NOT NULL
);


ALTER TABLE bd_piedradeagua.registro OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16509)
-- Name: registro_conductor; Type: TABLE; Schema: bd_piedradeagua; Owner: postgres
--

CREATE TABLE bd_piedradeagua.registro_conductor (
    id_registro character varying(10) NOT NULL,
    id_trabajador character varying(10) NOT NULL
);


ALTER TABLE bd_piedradeagua.registro_conductor OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16529)
-- Name: registro_vehiculo; Type: TABLE; Schema: bd_piedradeagua; Owner: postgres
--

CREATE TABLE bd_piedradeagua.registro_vehiculo (
    id_registro character varying(10) NOT NULL,
    id_vehiculo character varying(10) NOT NULL,
    fecha_vehiculo date NOT NULL,
    hora_vehiculo time without time zone NOT NULL
);


ALTER TABLE bd_piedradeagua.registro_vehiculo OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16391)
-- Name: rol; Type: TABLE; Schema: bd_piedradeagua; Owner: postgres
--

CREATE TABLE bd_piedradeagua.rol (
    id_rol character varying(1) NOT NULL,
    nombre_rol character varying(20) NOT NULL,
    descripcion_rol character varying(255) NOT NULL,
    tipo_permiso character(3) NOT NULL
);


ALTER TABLE bd_piedradeagua.rol OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16396)
-- Name: trabajador; Type: TABLE; Schema: bd_piedradeagua; Owner: postgres
--

CREATE TABLE bd_piedradeagua.trabajador (
    id_trabajador character varying(10) NOT NULL,
    nom_trabajador character varying(50) NOT NULL,
    ape_trabajador character varying(50) NOT NULL,
    telef_conductor character varying(15) NOT NULL,
    id_rol character varying(1) NOT NULL
);


ALTER TABLE bd_piedradeagua.trabajador OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16596)
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: bd_piedradeagua; Owner: postgres
--

CREATE SEQUENCE bd_piedradeagua.usuario_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bd_piedradeagua.usuario_id_usuario_seq OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16427)
-- Name: usuario; Type: TABLE; Schema: bd_piedradeagua; Owner: postgres
--

CREATE TABLE bd_piedradeagua.usuario (
    id_usuario integer DEFAULT nextval('bd_piedradeagua.usuario_id_usuario_seq'::regclass) NOT NULL,
    nombre_usuario character varying(45) NOT NULL,
    apellido_usuario character varying(45) NOT NULL,
    dni_usuario character varying(15) NOT NULL,
    id_rol character varying(1) DEFAULT 1 NOT NULL,
    correo_usuario character varying(100) NOT NULL,
    contrasena_usuario character varying(100) NOT NULL
);


ALTER TABLE bd_piedradeagua.usuario OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16524)
-- Name: vehiculo; Type: TABLE; Schema: bd_piedradeagua; Owner: postgres
--

CREATE TABLE bd_piedradeagua.vehiculo (
    id_vehiculo character varying(10) NOT NULL,
    modelo character varying(50) NOT NULL,
    marca character varying(50) NOT NULL,
    color character varying(50) NOT NULL,
    placa character varying(15) NOT NULL
);


ALTER TABLE bd_piedradeagua.vehiculo OWNER TO postgres;

--
-- TOC entry 4792 (class 2604 OID 16467)
-- Name: pedido id_pedido; Type: DEFAULT; Schema: bd_piedradeagua; Owner: postgres
--

ALTER TABLE ONLY bd_piedradeagua.pedido ALTER COLUMN id_pedido SET DEFAULT nextval('bd_piedradeagua.pedido_id_pedido_seq'::regclass);


--
-- TOC entry 4793 (class 2604 OID 16494)
-- Name: productos id_producto; Type: DEFAULT; Schema: bd_piedradeagua; Owner: postgres
--

ALTER TABLE ONLY bd_piedradeagua.productos ALTER COLUMN id_producto SET DEFAULT nextval('bd_piedradeagua.productos_id_producto_seq'::regclass);


--
-- TOC entry 4984 (class 0 OID 16386)
-- Dependencies: 218
-- Data for Name: categoria; Type: TABLE DATA; Schema: bd_piedradeagua; Owner: postgres
--

COPY bd_piedradeagua.categoria (id_categoria, nombre_categoria, descripcion_categoria) FROM stdin;
01	Categoría de prueba	Categoria de prueba
\.


--
-- TOC entry 4987 (class 0 OID 16406)
-- Dependencies: 221
-- Data for Name: documento; Type: TABLE DATA; Schema: bd_piedradeagua; Owner: postgres
--

COPY bd_piedradeagua.documento (id_documento, tipo_doc, fecha_ven, fecha_emision) FROM stdin;
\.


--
-- TOC entry 4988 (class 0 OID 16411)
-- Dependencies: 222
-- Data for Name: documento_conductor; Type: TABLE DATA; Schema: bd_piedradeagua; Owner: postgres
--

COPY bd_piedradeagua.documento_conductor (id_trabajador, id_documento) FROM stdin;
\.


--
-- TOC entry 4990 (class 0 OID 16438)
-- Dependencies: 224
-- Data for Name: envio; Type: TABLE DATA; Schema: bd_piedradeagua; Owner: postgres
--

COPY bd_piedradeagua.envio (id_trabajador, id_usuario, fecha_relacion) FROM stdin;
\.


--
-- TOC entry 4991 (class 0 OID 16453)
-- Dependencies: 225
-- Data for Name: material; Type: TABLE DATA; Schema: bd_piedradeagua; Owner: postgres
--

COPY bd_piedradeagua.material (id_material, nombre_material, stock, precio, id_categoria) FROM stdin;
1	Cemento Portland	50.00	12.50	01
\.


--
-- TOC entry 4994 (class 0 OID 16475)
-- Dependencies: 228
-- Data for Name: material_pedido; Type: TABLE DATA; Schema: bd_piedradeagua; Owner: postgres
--

COPY bd_piedradeagua.material_pedido (id_material, id_pedido, cantidad_pedido) FROM stdin;
1	1	10
1	9	50
\.


--
-- TOC entry 4993 (class 0 OID 16464)
-- Dependencies: 227
-- Data for Name: pedido; Type: TABLE DATA; Schema: bd_piedradeagua; Owner: postgres
--

COPY bd_piedradeagua.pedido (id_pedido, fecha_pedido, estado_material, desc_pedido, id_usuario) FROM stdin;
1	2024-11-20 13:35:26.927345	En proceso	prueba	1
2	2024-11-22 16:53:53.291261	Pendiente	prueba	1
3	2024-11-22 16:54:08.366371	Pendiente	prueba	1
4	2024-11-22 16:54:22.692567	Pendiente	prueba	1
5	2024-11-22 16:59:59.050457	Entregado	Cemento	5
9	2024-11-22 21:43:15.615278	En proceso	Arena gruesa	4
\.


--
-- TOC entry 4996 (class 0 OID 16491)
-- Dependencies: 230
-- Data for Name: productos; Type: TABLE DATA; Schema: bd_piedradeagua; Owner: postgres
--

COPY bd_piedradeagua.productos (id_producto, nombre_producto, descripcion_producto, precio_producto, imagen, id_categoria) FROM stdin;
1	Producto de Prueba	Este es un producto de prueba para verificar la funcionalidad.	19.99	/src/views/img/FotosProducto/Logo.webp	01
\.


--
-- TOC entry 4997 (class 0 OID 16504)
-- Dependencies: 231
-- Data for Name: registro; Type: TABLE DATA; Schema: bd_piedradeagua; Owner: postgres
--

COPY bd_piedradeagua.registro (id_registro, hora_registro, fecha_registro, tipo_registro, descripcion_registro) FROM stdin;
\.


--
-- TOC entry 4998 (class 0 OID 16509)
-- Dependencies: 232
-- Data for Name: registro_conductor; Type: TABLE DATA; Schema: bd_piedradeagua; Owner: postgres
--

COPY bd_piedradeagua.registro_conductor (id_registro, id_trabajador) FROM stdin;
\.


--
-- TOC entry 5000 (class 0 OID 16529)
-- Dependencies: 234
-- Data for Name: registro_vehiculo; Type: TABLE DATA; Schema: bd_piedradeagua; Owner: postgres
--

COPY bd_piedradeagua.registro_vehiculo (id_registro, id_vehiculo, fecha_vehiculo, hora_vehiculo) FROM stdin;
\.


--
-- TOC entry 4985 (class 0 OID 16391)
-- Dependencies: 219
-- Data for Name: rol; Type: TABLE DATA; Schema: bd_piedradeagua; Owner: postgres
--

COPY bd_piedradeagua.rol (id_rol, nombre_rol, descripcion_rol, tipo_permiso) FROM stdin;
1	usuario	usuario que realiza la compra	3  
2	jefe	maneja todo	0  
3	conductor	conductor de las compras	2  
4	seguridad	vigilancia de entrada	1  
\.


--
-- TOC entry 4986 (class 0 OID 16396)
-- Dependencies: 220
-- Data for Name: trabajador; Type: TABLE DATA; Schema: bd_piedradeagua; Owner: postgres
--

COPY bd_piedradeagua.trabajador (id_trabajador, nom_trabajador, ape_trabajador, telef_conductor, id_rol) FROM stdin;
\.


--
-- TOC entry 4989 (class 0 OID 16427)
-- Dependencies: 223
-- Data for Name: usuario; Type: TABLE DATA; Schema: bd_piedradeagua; Owner: postgres
--

COPY bd_piedradeagua.usuario (id_usuario, nombre_usuario, apellido_usuario, dni_usuario, id_rol, correo_usuario, contrasena_usuario) FROM stdin;
2	Nombre	Apellido	12345678	1	correo	123
1	Nombre	Apellido	12345678	1	correo@ejemplo.com	123
4	ejemplo	ejemplo	12345678	1	ejemplo3@ejemplo.com	$2y$10$OssuNBXPjr.er9byQwpwzeg5say7RHH41fVpSIYqpvSnMw8z9xpV6
5	ejemplo4	jjjjjj	12345678	1	andres@gmail.com	$2y$10$Bn8C2EoDMbxDbm2vm.avBuL9TNuWGChTZR6lAkrZyPxJNjmFsyw3q
\.


--
-- TOC entry 4999 (class 0 OID 16524)
-- Dependencies: 233
-- Data for Name: vehiculo; Type: TABLE DATA; Schema: bd_piedradeagua; Owner: postgres
--

COPY bd_piedradeagua.vehiculo (id_vehiculo, modelo, marca, color, placa) FROM stdin;
\.


--
-- TOC entry 5009 (class 0 OID 0)
-- Dependencies: 226
-- Name: pedido_id_pedido_seq; Type: SEQUENCE SET; Schema: bd_piedradeagua; Owner: postgres
--

SELECT pg_catalog.setval('bd_piedradeagua.pedido_id_pedido_seq', 9, true);


--
-- TOC entry 5010 (class 0 OID 0)
-- Dependencies: 229
-- Name: productos_id_producto_seq; Type: SEQUENCE SET; Schema: bd_piedradeagua; Owner: postgres
--

SELECT pg_catalog.setval('bd_piedradeagua.productos_id_producto_seq', 1, false);


--
-- TOC entry 5011 (class 0 OID 0)
-- Dependencies: 235
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: bd_piedradeagua; Owner: postgres
--

SELECT pg_catalog.setval('bd_piedradeagua.usuario_id_usuario_seq', 5, true);


--
-- TOC entry 4795 (class 2606 OID 16390)
-- Name: categoria categoria_pkey; Type: CONSTRAINT; Schema: bd_piedradeagua; Owner: postgres
--

ALTER TABLE ONLY bd_piedradeagua.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id_categoria);


--
-- TOC entry 4803 (class 2606 OID 16415)
-- Name: documento_conductor documento_conductor_pkey; Type: CONSTRAINT; Schema: bd_piedradeagua; Owner: postgres
--

ALTER TABLE ONLY bd_piedradeagua.documento_conductor
    ADD CONSTRAINT documento_conductor_pkey PRIMARY KEY (id_trabajador, id_documento);


--
-- TOC entry 4801 (class 2606 OID 16410)
-- Name: documento documento_pkey; Type: CONSTRAINT; Schema: bd_piedradeagua; Owner: postgres
--

ALTER TABLE ONLY bd_piedradeagua.documento
    ADD CONSTRAINT documento_pkey PRIMARY KEY (id_documento);


--
-- TOC entry 4807 (class 2606 OID 16442)
-- Name: envio envio_pkey; Type: CONSTRAINT; Schema: bd_piedradeagua; Owner: postgres
--

ALTER TABLE ONLY bd_piedradeagua.envio
    ADD CONSTRAINT envio_pkey PRIMARY KEY (id_trabajador, id_usuario);


--
-- TOC entry 4813 (class 2606 OID 16479)
-- Name: material_pedido material_pedido_pkey; Type: CONSTRAINT; Schema: bd_piedradeagua; Owner: postgres
--

ALTER TABLE ONLY bd_piedradeagua.material_pedido
    ADD CONSTRAINT material_pedido_pkey PRIMARY KEY (id_material, id_pedido);


--
-- TOC entry 4809 (class 2606 OID 16457)
-- Name: material material_pkey; Type: CONSTRAINT; Schema: bd_piedradeagua; Owner: postgres
--

ALTER TABLE ONLY bd_piedradeagua.material
    ADD CONSTRAINT material_pkey PRIMARY KEY (id_material);


--
-- TOC entry 4811 (class 2606 OID 16469)
-- Name: pedido pedido_pkey; Type: CONSTRAINT; Schema: bd_piedradeagua; Owner: postgres
--

ALTER TABLE ONLY bd_piedradeagua.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id_pedido);


--
-- TOC entry 4815 (class 2606 OID 16498)
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: bd_piedradeagua; Owner: postgres
--

ALTER TABLE ONLY bd_piedradeagua.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id_producto);


--
-- TOC entry 4819 (class 2606 OID 16513)
-- Name: registro_conductor registro_conductor_pkey; Type: CONSTRAINT; Schema: bd_piedradeagua; Owner: postgres
--

ALTER TABLE ONLY bd_piedradeagua.registro_conductor
    ADD CONSTRAINT registro_conductor_pkey PRIMARY KEY (id_registro, id_trabajador);


--
-- TOC entry 4817 (class 2606 OID 16508)
-- Name: registro registro_pkey; Type: CONSTRAINT; Schema: bd_piedradeagua; Owner: postgres
--

ALTER TABLE ONLY bd_piedradeagua.registro
    ADD CONSTRAINT registro_pkey PRIMARY KEY (id_registro);


--
-- TOC entry 4823 (class 2606 OID 16533)
-- Name: registro_vehiculo registro_vehiculo_pkey; Type: CONSTRAINT; Schema: bd_piedradeagua; Owner: postgres
--

ALTER TABLE ONLY bd_piedradeagua.registro_vehiculo
    ADD CONSTRAINT registro_vehiculo_pkey PRIMARY KEY (id_registro, id_vehiculo);


--
-- TOC entry 4797 (class 2606 OID 16395)
-- Name: rol rol_pkey; Type: CONSTRAINT; Schema: bd_piedradeagua; Owner: postgres
--

ALTER TABLE ONLY bd_piedradeagua.rol
    ADD CONSTRAINT rol_pkey PRIMARY KEY (id_rol);


--
-- TOC entry 4799 (class 2606 OID 16400)
-- Name: trabajador trabajador_pkey; Type: CONSTRAINT; Schema: bd_piedradeagua; Owner: postgres
--

ALTER TABLE ONLY bd_piedradeagua.trabajador
    ADD CONSTRAINT trabajador_pkey PRIMARY KEY (id_trabajador);


--
-- TOC entry 4805 (class 2606 OID 16432)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: bd_piedradeagua; Owner: postgres
--

ALTER TABLE ONLY bd_piedradeagua.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 4821 (class 2606 OID 16528)
-- Name: vehiculo vehiculo_pkey; Type: CONSTRAINT; Schema: bd_piedradeagua; Owner: postgres
--

ALTER TABLE ONLY bd_piedradeagua.vehiculo
    ADD CONSTRAINT vehiculo_pkey PRIMARY KEY (id_vehiculo);


--
-- TOC entry 4825 (class 2606 OID 16421)
-- Name: documento_conductor documento_conductor_id_documento_fkey; Type: FK CONSTRAINT; Schema: bd_piedradeagua; Owner: postgres
--

ALTER TABLE ONLY bd_piedradeagua.documento_conductor
    ADD CONSTRAINT documento_conductor_id_documento_fkey FOREIGN KEY (id_documento) REFERENCES bd_piedradeagua.documento(id_documento);


--
-- TOC entry 4826 (class 2606 OID 16416)
-- Name: documento_conductor documento_conductor_id_trabajador_fkey; Type: FK CONSTRAINT; Schema: bd_piedradeagua; Owner: postgres
--

ALTER TABLE ONLY bd_piedradeagua.documento_conductor
    ADD CONSTRAINT documento_conductor_id_trabajador_fkey FOREIGN KEY (id_trabajador) REFERENCES bd_piedradeagua.trabajador(id_trabajador);


--
-- TOC entry 4828 (class 2606 OID 16443)
-- Name: envio envio_id_trabajador_fkey; Type: FK CONSTRAINT; Schema: bd_piedradeagua; Owner: postgres
--

ALTER TABLE ONLY bd_piedradeagua.envio
    ADD CONSTRAINT envio_id_trabajador_fkey FOREIGN KEY (id_trabajador) REFERENCES bd_piedradeagua.trabajador(id_trabajador);


--
-- TOC entry 4829 (class 2606 OID 16448)
-- Name: envio envio_id_usuario_fkey; Type: FK CONSTRAINT; Schema: bd_piedradeagua; Owner: postgres
--

ALTER TABLE ONLY bd_piedradeagua.envio
    ADD CONSTRAINT envio_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES bd_piedradeagua.usuario(id_usuario);


--
-- TOC entry 4830 (class 2606 OID 16458)
-- Name: material material_id_categoria_fkey; Type: FK CONSTRAINT; Schema: bd_piedradeagua; Owner: postgres
--

ALTER TABLE ONLY bd_piedradeagua.material
    ADD CONSTRAINT material_id_categoria_fkey FOREIGN KEY (id_categoria) REFERENCES bd_piedradeagua.categoria(id_categoria);


--
-- TOC entry 4832 (class 2606 OID 16480)
-- Name: material_pedido material_pedido_id_material_fkey; Type: FK CONSTRAINT; Schema: bd_piedradeagua; Owner: postgres
--

ALTER TABLE ONLY bd_piedradeagua.material_pedido
    ADD CONSTRAINT material_pedido_id_material_fkey FOREIGN KEY (id_material) REFERENCES bd_piedradeagua.material(id_material);


--
-- TOC entry 4833 (class 2606 OID 16485)
-- Name: material_pedido material_pedido_id_pedido_fkey; Type: FK CONSTRAINT; Schema: bd_piedradeagua; Owner: postgres
--

ALTER TABLE ONLY bd_piedradeagua.material_pedido
    ADD CONSTRAINT material_pedido_id_pedido_fkey FOREIGN KEY (id_pedido) REFERENCES bd_piedradeagua.pedido(id_pedido);


--
-- TOC entry 4831 (class 2606 OID 16470)
-- Name: pedido pedido_id_usuario_fkey; Type: FK CONSTRAINT; Schema: bd_piedradeagua; Owner: postgres
--

ALTER TABLE ONLY bd_piedradeagua.pedido
    ADD CONSTRAINT pedido_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES bd_piedradeagua.usuario(id_usuario);


--
-- TOC entry 4834 (class 2606 OID 16499)
-- Name: productos productos_id_categoria_fkey; Type: FK CONSTRAINT; Schema: bd_piedradeagua; Owner: postgres
--

ALTER TABLE ONLY bd_piedradeagua.productos
    ADD CONSTRAINT productos_id_categoria_fkey FOREIGN KEY (id_categoria) REFERENCES bd_piedradeagua.categoria(id_categoria);


--
-- TOC entry 4835 (class 2606 OID 16514)
-- Name: registro_conductor registro_conductor_id_registro_fkey; Type: FK CONSTRAINT; Schema: bd_piedradeagua; Owner: postgres
--

ALTER TABLE ONLY bd_piedradeagua.registro_conductor
    ADD CONSTRAINT registro_conductor_id_registro_fkey FOREIGN KEY (id_registro) REFERENCES bd_piedradeagua.registro(id_registro);


--
-- TOC entry 4836 (class 2606 OID 16519)
-- Name: registro_conductor registro_conductor_id_trabajador_fkey; Type: FK CONSTRAINT; Schema: bd_piedradeagua; Owner: postgres
--

ALTER TABLE ONLY bd_piedradeagua.registro_conductor
    ADD CONSTRAINT registro_conductor_id_trabajador_fkey FOREIGN KEY (id_trabajador) REFERENCES bd_piedradeagua.trabajador(id_trabajador);


--
-- TOC entry 4837 (class 2606 OID 16534)
-- Name: registro_vehiculo registro_vehiculo_id_registro_fkey; Type: FK CONSTRAINT; Schema: bd_piedradeagua; Owner: postgres
--

ALTER TABLE ONLY bd_piedradeagua.registro_vehiculo
    ADD CONSTRAINT registro_vehiculo_id_registro_fkey FOREIGN KEY (id_registro) REFERENCES bd_piedradeagua.registro(id_registro);


--
-- TOC entry 4838 (class 2606 OID 16539)
-- Name: registro_vehiculo registro_vehiculo_id_vehiculo_fkey; Type: FK CONSTRAINT; Schema: bd_piedradeagua; Owner: postgres
--

ALTER TABLE ONLY bd_piedradeagua.registro_vehiculo
    ADD CONSTRAINT registro_vehiculo_id_vehiculo_fkey FOREIGN KEY (id_vehiculo) REFERENCES bd_piedradeagua.vehiculo(id_vehiculo);


--
-- TOC entry 4824 (class 2606 OID 16401)
-- Name: trabajador trabajador_id_rol_fkey; Type: FK CONSTRAINT; Schema: bd_piedradeagua; Owner: postgres
--

ALTER TABLE ONLY bd_piedradeagua.trabajador
    ADD CONSTRAINT trabajador_id_rol_fkey FOREIGN KEY (id_rol) REFERENCES bd_piedradeagua.rol(id_rol);


--
-- TOC entry 4827 (class 2606 OID 16586)
-- Name: usuario usuario_id_rol_fkey; Type: FK CONSTRAINT; Schema: bd_piedradeagua; Owner: postgres
--

ALTER TABLE ONLY bd_piedradeagua.usuario
    ADD CONSTRAINT usuario_id_rol_fkey FOREIGN KEY (id_rol) REFERENCES bd_piedradeagua.rol(id_rol);


-- Completed on 2024-11-22 23:44:05

--
-- PostgreSQL database dump complete
--

