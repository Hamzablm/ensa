--
-- PostgreSQL database dump
--

-- Dumped from database version 11.4
-- Dumped by pg_dump version 11.4

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

SET default_with_oids = false;

--
-- Name: category; Type: TABLE; Schema: public; Owner: nasser
--

CREATE TABLE public.category
(
    id_category  integer NOT NULL,
    name         character varying(200),
    url_category character varying(200)
);


ALTER TABLE public.category OWNER TO nasser;

--
-- Name: category_id_category_seq; Type: SEQUENCE; Schema: public; Owner: nasser
--

CREATE
SEQUENCE public.category_id_category_seq
    AS integer
    START
WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE
1;


ALTER TABLE public.category_id_category_seq OWNER TO nasser;

--
-- Name: category_id_category_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nasser
--

ALTER
SEQUENCE public.category_id_category_seq OWNED BY public.category.id_category;


--
-- Name: legacy_price; Type: TABLE; Schema: public; Owner: nasser
--

CREATE TABLE public.legacy_price
(
    id_price    integer NOT NULL,
    new_price   integer,
    date        date,
    id_product  integer,
    id_category integer,
    id_store    integer
);


ALTER TABLE public.legacy_price OWNER TO nasser;

--
-- Name: legacy_price_id_price_seq; Type: SEQUENCE; Schema: public; Owner: nasser
--

CREATE
SEQUENCE public.legacy_price_id_price_seq
    AS integer
    START
WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE
1;


ALTER TABLE public.legacy_price_id_price_seq OWNER TO nasser;

--
-- Name: legacy_price_id_price_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nasser
--

ALTER
SEQUENCE public.legacy_price_id_price_seq OWNED BY public.legacy_price.id_price;


--
-- Name: product; Type: TABLE; Schema: public; Owner: nasser
--

CREATE TABLE public.product
(
    id_product   integer NOT NULL,
    name         character varying(200),
    sales        integer,
    total_rating character varying(50),
    date_product date,
    url_image    character varying(500),
    url_product  character varying(500),
    id_category  integer,
    id_store     integer,
    price        character varying(50)
);


ALTER TABLE public.product OWNER TO nasser;

--
-- Name: product_id_product_seq; Type: SEQUENCE; Schema: public; Owner: nasser
--

CREATE
SEQUENCE public.product_id_product_seq
    AS integer
    START
WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE
1;


ALTER TABLE public.product_id_product_seq OWNER TO nasser;

--
-- Name: product_id_product_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nasser
--

ALTER
SEQUENCE public.product_id_product_seq OWNED BY public.product.id_product;


--
-- Name: store; Type: TABLE; Schema: public; Owner: nasser
--

CREATE TABLE public.store
(
    id_store     integer NOT NULL,
    name         character varying(200),
    total_rating character varying(50),
    url_store    character varying(1000)
);


ALTER TABLE public.store OWNER TO nasser;

--
-- Name: store_id_store_seq; Type: SEQUENCE; Schema: public; Owner: nasser
--

CREATE
SEQUENCE public.store_id_store_seq
    AS integer
    START
WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE
1;


ALTER TABLE public.store_id_store_seq OWNER TO nasser;

--
-- Name: store_id_store_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nasser
--

ALTER
SEQUENCE public.store_id_store_seq OWNED BY public.store.id_store;


--
-- Name: category id_category; Type: DEFAULT; Schema: public; Owner: nasser
--

ALTER TABLE ONLY public.category ALTER COLUMN id_category SET DEFAULT nextval('public.category_id_category_seq'::regclass);


--
-- Name: legacy_price id_price; Type: DEFAULT; Schema: public; Owner: nasser
--

ALTER TABLE ONLY public.legacy_price ALTER COLUMN id_price SET DEFAULT nextval('public.legacy_price_id_price_seq'::regclass);


--
-- Name: product id_product; Type: DEFAULT; Schema: public; Owner: nasser
--

ALTER TABLE ONLY public.product ALTER COLUMN id_product SET DEFAULT nextval('public.product_id_product_seq'::regclass);


--
-- Name: store id_store; Type: DEFAULT; Schema: public; Owner: nasser
--

ALTER TABLE ONLY public.store ALTER COLUMN id_store SET DEFAULT nextval('public.store_id_store_seq'::regclass);


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: nasser
--

COPY public.category (id_category, name, url_category) FROM stdin;
1	Chaussures Homme	https://www.jumia.ma/chaussures-hommes/?shipped_from=country_local
2	Chaussures Femme	https://www.jumia.ma/chaussures-femmes/?shipped_from=country_local
3	Fournitures de bureau	https://www.jumia.ma/fournitures/?shipped_from=country_local
4	Ustensiles de cuisine et gadgets	https://www.jumia.ma/cuisine-salle-manger-ustensiles-cuisine-gadgets/?shipped_from=country_local
5	Téléphone portable	https://www.jumia.ma/telephones-smartphones/?shipped_from=country_local
6	Tablettes	https://www.jumia.ma/tablettes-tactiles/?shipped_from=country_local
7	Télévisions	https://www.jumia.ma/tvs/?shipped_from=country_local
8	Ordinateurs	https://www.jumia.ma/ordinateurs-pc/?shipped_from=country_local
9	Stockage de données	https://www.jumia.ma/stockage/?shipped_from=country_local
10	Imprimantes et scanners	https://www.jumia.ma/imprimantes-pc/?shipped_from=country_local
\.


--
-- Data for Name: legacy_price; Type: TABLE DATA; Schema: public; Owner: nasser
--

COPY public.legacy_price (id_price, new_price, date, id_product, id_category, id_store) FROM stdin;
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: nasser
--

COPY public.product (id_product, name, sales, total_rating, date_product, url_image, url_product, id_category, id_store, price) FROM stdin;
1	Chaussure	213	(4)	2020-01-07	https://ma.jumia.is/6qBOxi8BGUoQiZK_H_tWhixEnq8=/fit-in/220x220/filters:fill(white):sharpen(1,0,false):quality(100)/product/85/259023/1.jpg?1468	https://www.jumia.ma/defacto-chaussure-32095258.html	1	249	65
2	Chaussure	213		2020-01-07	https://ma.jumia.is/CF2HuKOMi-dnAyOY7UDVMM6u8Cc=/fit-in/220x220/filters:fill(white):sharpen(1,0,false):quality(100)/product/16/259023/1.jpg?1386	https://www.jumia.ma/defacto-chaussure-32095261.html	1	249	69
3	Chaussure	213		2020-01-07	https://ma.jumia.is/ntAt3fUTyfFapiBl4fcYGPsVAwI=/fit-in/220x220/filters:fill(white):sharpen(1,0,false):quality(100)/product/06/259023/1.jpg?1468	https://www.jumia.ma/defacto-chaussure-32095260.html	1	249	105
4	Chaussures En Cuir Pour Hommes - Noir	213	(71)	2020-01-07	https://ma.jumia.is/akeeE4O2JmxLm7LRJPV97weimeY=/fit-in/220x220/filters:fill(white):sharpen(1,0,false):quality(100)/product/89/108682/1.jpg?3381	https://www.jumia.ma/fashion-chaussures-en-cuir-pour-hommes-noir-28680198.html	1	11	98
5	Basket Pour Homme	213	(33)	2020-01-07	https://ma.jumia.is/PmgQGqtm8aS5tkC4O9w4oyL6EKE=/fit-in/220x220/filters:fill(white):sharpen(1,0,false):quality(100)/product/69/108682/1.jpg?3382	https://www.jumia.ma/fashion-basket-pour-homme-28680196.html	1	11	128
6	Baskets Pour Hommes	213	(25)	2020-01-07	https://ma.jumia.is/D8Klb_4xjA6csOjvippUE8ZPooI=/fit-in/220x220/filters:fill(white):sharpen(1,0,false):quality(100)/product/79/108682/1.jpg?3381	https://www.jumia.ma/fashion-baskets-pour-hommes-28680197.html	1	11	128
7	Sneakers Pour Homme	213	(81)	2020-01-07	https://ma.jumia.is/sgTFh5RRApN_jGQ3G1RN_ZSJMhE=/fit-in/220x220/filters:fill(white):sharpen(1,0,false):quality(100)/product/45/768582/1.jpg?8169	https://www.jumia.ma/fashion-sneakers-pour-homme-28586754.html	1	11	188
8	Sneakers Pour Hommes	213	(45)	2020-01-07	https://ma.jumia.is/ICloj5tSEdrPiGUicQzyYkDM9Ss=/fit-in/220x220/filters:fill(white):sharpen(1,0,false):quality(100)/product/35/768582/1.jpg?4449	https://www.jumia.ma/fashion-sneakers-pour-hommes-28586753.html	1	11	168
9	Sneakers pour Homme - Blanc	213	(24)	2020-01-07	https://ma.jumia.is/QXck9U--4apFe0JsOE6W-_FZaCE=/fit-in/220x220/filters:fill(white):sharpen(1,0,false):quality(100)/product/78/724262/1.jpg?0465	https://www.jumia.ma/fashion-sneakers-pour-homme-blanc-26242787.html	1	23	199
10	Basket Pour Homme	213	(22)	2020-01-07	https://ma.jumia.is/Ef-l2WRS9Pl6OzQgMkxUQlrrtUs=/fit-in/220x220/filters:fill(white):sharpen(1,0,false):quality(100)/product/59/108682/1.jpg?3382	https://www.jumia.ma/fashion-basket-pour-homme-28680195.html	1	11	128
11	BENASSI JDI - 343880-403	213	(64)	2020-01-07	https://ma.jumia.is/4FQq_D3kd-f-pRtctG_1AP2RGFg=/fit-in/220x220/filters:fill(white):sharpen(1,0,false):quality(100)/product/85/367313/1.jpg?1073	https://www.jumia.ma/nike-benassi-jdi-343880-403-31376358.html	1	241	149
12	AIR FORCE 1 MID '07 - 315123-111	213	(31)	2020-01-07	https://ma.jumia.is/kqfAMHXZpTSTyj-gwDMcxREVzag=/fit-in/220x220/filters:fill(white):sharpen(1,0,false):quality(100)/product/13/367313/1.jpg?9167	https://www.jumia.ma/nike-air-force-1-mid-07-315123-111-31376331.html	1	241	579
13	Baskets Pour Hommes - Noir	213	(12)	2020-01-07	https://ma.jumia.is/4jhRNFv-NvkaRJGPFcG6fsbXmZs=/fit-in/220x220/filters:fill(white):sharpen(1,0,false):quality(100)/product/68/724262/1.jpg?0465	https://www.jumia.ma/fashion-baskets-pour-hommes-noir-26242786.html	1	23	199
14	Chaussures mode en toile pour hommes	213	(25)	2020-01-07	https://ma.jumia.is/UnPoaxw_drL0i8NZxvMxXJgSTDc=/fit-in/220x220/filters:fill(white):sharpen(1,0,false):quality(100)/product/39/724262/1.jpg?5691	https://www.jumia.ma/fashion-chaussures-mode-en-toile-pour-hommes-26242793.html	1	23	269
15	Bottines Chelsea Mezzo en cuir véritable - Noir.	213	(43)	2020-01-07	https://ma.jumia.is/gSur6C5U_QaVmB2HXzoqThmm_i0=/fit-in/220x220/filters:fill(white):sharpen(1,0,false):quality(100)/product/35/737522/1.jpg?3799	https://www.jumia.ma/mezzo-bottines-chelsea-mezzo-en-cuir-veritable-noir.-22573753.html	1	171	199
16	High-quality Men Sneakers Big Size Shoes Summer/Autumn Mens - Red	213	(7)	2020-01-07	https://ma.jumia.is/zPXNjIUvTRT5XRZIDLNyP2HcYhg=/fit-in/220x220/filters:fill(white):sharpen(1,0,false):quality(100)/product/19/724262/1.jpg?0465	https://www.jumia.ma/fashion-high-quality-men-sneakers-big-size-shoes-summerautumn-mens-red-26242791.html	1	23	199
17	Hommes de haute qualité Sneakers grande taille chaussures hommes - rouge	213	(8)	2020-01-07	https://ma.jumia.is/bVVGqXGSKBST7ENYnc3oybRRCaw=/fit-in/220x220/filters:fill(white):sharpen(1,0,false):quality(100)/product/88/724262/1.jpg?0466	https://www.jumia.ma/fashion-hommes-de-haute-qualite-sneakers-grande-taille-chaussures-hommes-rouge-26242788.html	1	23	199
18	Chaussures médicales à bande en CUIR - Noir	213	(5)	2020-01-07	https://ma.jumia.is/myF6i6mgGJq8iEZxaJHrO3rrI7o=/fit-in/220x220/filters:fill(white):sharpen(1,0,false):quality(100)/product/15/747442/1.jpg?6788	https://www.jumia.ma/redano-chaussures-medicales-a-bande-en-cuir-noir-24474751.html	1	185	299
19	Nouvelles chaussures pour hommes à rayures de couleur assortie	213	(4)	2020-01-07	https://ma.jumia.is/2671tYx7xMMmWTAmiKUBHyzpT5k=/fit-in/220x220/filters:fill(white):sharpen(1,0,false):quality(100)/product/49/724262/1.jpg?0465	https://www.jumia.ma/fashion-nouvelles-chaussures-pour-hommes-a-rayures-de-couleur-assortie-26242794.html	1	23	269
20	Baskets Mezzo en cuir véritable - Noir	213	(6)	2020-01-07	https://ma.jumia.is/kunRkLpid58QMJ5d-UsgqbYKWXk=/fit-in/220x220/filters:fill(white):sharpen(1,0,false):quality(100)/product/44/540362/1.jpg?5419	https://www.jumia.ma/mezzo-baskets-mezzo-en-cuir-veritable-noir-26304544.html	1	171	139
21	CLASSIC CORTEZ LEATHER - 749571-100	213	(11)	2020-01-07	https://ma.jumia.is/9G1rgK5NZLgQzbJNxljnRmD8JTw=/fit-in/220x220/filters:fill(white):sharpen(1,0,false):quality(100)/product/56/367313/1.jpg?0060	https://www.jumia.ma/nike-classic-cortez-leather-749571-100-31376365.html	1	241	439
22	Chaussures formelles d'été Hommes Chaussures en cuir de qualité Respirant	213		2020-01-07	https://ma.jumia.is/HusrTNADLcZBpGIYKJ-AcK5isaE=/fit-in/220x220/filters:fill(white):sharpen(1,0,false):quality(100)/product/69/724262/1.jpg?0465	https://www.jumia.ma/fashion-chaussures-formelles-dete-hommes-chaussures-en-cuir-de-qualite-respirant-26242796.html	1	23	229
23	Baskets montantes Mezzo en cuir - Noir	213	(263)	2020-01-07	https://ma.jumia.is/uDh1ZljLpPTPetBduOHX9-L41sw=/fit-in/220x220/filters:fill(white):sharpen(1,0,false):quality(100)/product/65/074671/1.jpg?9225	https://www.jumia.ma/mezzo-baskets-montantes-mezzo-en-cuir-noir-17647056.html	1	171	169
24	Baskets Mezzo en cuir véritable - Noir	213	(10)	2020-01-07	https://ma.jumia.is/nuKi-p913Z9Xain-A8gNC7Vr04w=/fit-in/220x220/filters:fill(white):sharpen(1,0,false):quality(100)/product/92/540362/1.jpg?5415	https://www.jumia.ma/mezzo-baskets-mezzo-en-cuir-veritable-noir-26304529.html	1	171	149
25	forces military boots men's leather outdoor combat boots high breathable-black	213	(1)	2020-01-07	https://ma.jumia.is/AlwQhaGBqSIEccrPfdpVsDLRBTk=/fit-in/220x220/filters:fill(white):sharpen(1,0,false):quality(100)/product/55/186592/1.jpg?1776	https://www.jumia.ma/generic-forces-military-boots-mens-leather-outdoor-combat-boots-high-breathable-black-29568155.html	1	26	459
26	Bottines D'Urbano en cuir - Noir	213	(10)	2020-01-07	https://ma.jumia.is/e8NCbHXLcNrdrKo7LVayIywLj20=/fit-in/220x220/filters:fill(white):sharpen(1,0,false):quality(100)/product/22/561632/1.jpg?4583	https://www.jumia.ma/durbano-bottines-durbano-en-cuir-noir-23616522.html	1	305	269
27	Chaussures DUO sport & classe en CUIR - Noir	213	(2)	2020-01-07	https://ma.jumia.is/cDhgLfkttkFIdNgx8YNdLzDclvc=/fit-in/220x220/filters:fill(white):sharpen(1,0,false):quality(100)/product/04/978123/1.jpg?7137	https://www.jumia.ma/boliga-chaussures-duo-sport-classe-en-cuir-noir-32187940.html	1	185	279
28	Stan Smith Blanc Rouge	213	(7)	2020-01-07	https://ma.jumia.is/luxhCrS88Q9Ilkuksk0Z_7cX9D0=/fit-in/220x220/filters:fill(white):sharpen(1,0,false):quality(100)/product/64/276582/1.jpg?0251	https://www.jumia.ma/adidas-stan-smith-blanc-rouge-28567246.html	1	100	600
29	Chaussures RIGIDE BOLIGA anti-froid en CUIR - Marron	213		2020-01-07	https://ma.jumia.is/rFGJs36Q-SAyrxb5y9w_ykfQjJ8=/fit-in/220x220/filters:fill(white):sharpen(1,0,false):quality(100)/product/94/817242/1.jpg?2398	https://www.jumia.ma/boliga-chaussures-rigide-boliga-anti-froid-en-cuir-marron-24271849.html	1	185	299
30	Sabots médical simple en CUIR - Noir	213	(4)	2020-01-07	https://ma.jumia.is/W0ols3oAPUzhPmbsV8VqJS_-300=/fit-in/220x220/filters:fill(white):sharpen(1,0,false):quality(100)/product/89/634732/1.jpg?9094	https://www.jumia.ma/jives-sabots-medical-simple-en-cuir-noir-23743698.html	1	185	229
31	Chaussure nouvelle collection BOLIGA rigide en CUIR - Noir	213		2020-01-07	https://ma.jumia.is/oDLdQeoGCLidpy_STcPCUYsDk5I=/fit-in/220x220/filters:fill(white):sharpen(1,0,false):quality(100)/product/62/262623/1.jpg?3862	https://www.jumia.ma/boliga-chaussure-nouvelle-collection-boliga-rigide-en-cuir-noir-32626226.html	1	185	299
32	Baskets Mezzo en cuir véritable - Noir	213	(12)	2020-01-07	https://ma.jumia.is/MxvMUFQGhIsFoWd7-9cjnw38k-k=/fit-in/220x220/filters:fill(white):sharpen(1,0,false):quality(100)/product/83/540362/1.jpg?5418	https://www.jumia.ma/mezzo-baskets-mezzo-en-cuir-veritable-noir-26304538.html	1	171	149
33	Mocassins Collège Mezzo en daim - Bistre	213		2020-01-07	https://ma.jumia.is/dxIRGXmEIiWvDykeTkh9GOQFQec=/fit-in/220x220/filters:fill(white):sharpen(1,0,false):quality(100)/product/64/118581/1.jpg?3449	https://www.jumia.ma/mezzo-mocassins-college-mezzo-en-daim-bistre-18581146.html	1	171	159
34	Bottines D'Urbano en cuir - Marron	213	(1)	2020-01-07	https://ma.jumia.is/9iIY_gloclA95bEvQArmvLuVcLU=/fit-in/220x220/filters:fill(white):sharpen(1,0,false):quality(100)/product/92/561632/1.jpg?4329	https://www.jumia.ma/durbano-bottines-durbano-en-cuir-marron-23616529.html	1	305	269
35	Nouvelle mode Chaussure sport en CUIR - Noir	213	(5)	2020-01-07	https://ma.jumia.is/JapQ6k_YOAoqMtYqR3tHDkX14pI=/fit-in/220x220/filters:fill(white):sharpen(1,0,false):quality(100)/product/00/146592/1.jpg?5739	https://www.jumia.ma/orios-nouvelle-mode-chaussure-sport-en-cuir-noir-29564100.html	1	185	279
36	Promo Chaussures de ville Cuir Noir	213		2020-01-07	https://ma.jumia.is/oj_uSmVSEPL9hjr7LCuz16zfrCA=/fit-in/220x220/filters:fill(white):sharpen(1,0,false):quality(100)/product/14/700513/1.jpg?0131	https://www.jumia.ma/generic-promo-chaussures-de-ville-cuir-noir-31500741.html	1	170	219
37	Bottines Chelsea Mezzo en daim véritable - Bleu marine	213	(1)	2020-01-07	https://ma.jumia.is/_oOlp3Z6JfrE19I7bwFg9ib6Yas=/fit-in/220x220/filters:fill(white):sharpen(1,0,false):quality(100)/product/65/737522/1.jpg?7888	https://www.jumia.ma/mezzo-bottines-chelsea-mezzo-en-daim-veritable-bleu-marine-22573756.html	1	171	189
38	Richelieus Mezzo en daim vÃ©ritable â€“ Marron - 44	213	(1)	2020-01-07	https://ma.jumia.is/_txzCBD1bv7YhF9Kt6TtXywaYlI=/fit-in/220x220/filters:fill(white):sharpen(1,0,false):quality(100)/product/84/340362/1.jpg?5300	https://www.jumia.ma/mezzo-richelieus-mezzo-en-daim-vcritable-a-marron-44-26304348.html	1	171	149
39	Déstockage Bottines Noir	213		2020-01-07	https://ma.jumia.is/-v1FRZzSNxaMq4hIh87rZHxAeLc=/fit-in/220x220/filters:fill(white):sharpen(1,0,false):quality(100)/product/04/700513/1.jpg?0131	https://www.jumia.ma/generic-destockage-bottines-noir-31500740.html	1	170	299
40	Mocassins Mezzo en cuir véritable - Tabac	213	(1)	2020-01-07	https://ma.jumia.is/1jfkYN2KPWVPS_sXxDJRPFjsxn8=/fit-in/220x220/filters:fill(white):sharpen(1,0,false):quality(100)/product/65/916402/1.jpg?4137	https://www.jumia.ma/mezzo-mocassins-mezzo-en-cuir-veritable-tabac-20461956.html	1	171	199
41	AIR FORCE 1 MID '07 - 315123-111	213	(31)	2020-01-07	https://ma.jumia.is/kqfAMHXZpTSTyj-gwDMcxREVzag=/fit-in/220x220/filters:fill(white):sharpen(1,0,false):quality(100)/product/13/367313/1.jpg?9167	https://www.jumia.ma/nike-air-force-1-mid-07-315123-111-31376331.html	1	241	579
42	Baskets Pour Hommes - Noir	213	(12)	2020-01-07	https://ma.jumia.is/4jhRNFv-NvkaRJGPFcG6fsbXmZs=/fit-in/220x220/filters:fill(white):sharpen(1,0,false):quality(100)/product/68/724262/1.jpg?0465	https://www.jumia.ma/fashion-baskets-pour-hommes-noir-26242786.html	1	23	199
43	Chaussures mode en toile pour hommes	213	(25)	2020-01-07	https://ma.jumia.is/UnPoaxw_drL0i8NZxvMxXJgSTDc=/fit-in/220x220/filters:fill(white):sharpen(1,0,false):quality(100)/product/39/724262/1.jpg?5691	https://www.jumia.ma/fashion-chaussures-mode-en-toile-pour-hommes-26242793.html	1	23	269
\.


--
-- Data for Name: store; Type: TABLE DATA; Schema: public; Owner: nasser
--

COPY public.store (id_store, name, total_rating, url_store) FROM stdin;
283	Princess Univers	34%	 https://www.jumia.ma/princess-univers/
285	Badishop story	92%	 https://www.jumia.ma/badishop-story/
159	Style Men	20%	 https://www.jumia.ma/style-men/
286	Elegantina	48%	 https://www.jumia.ma/elegantina/
11	LD-SEA-COD	80%	 https://www.jumia.ma/ld-sea-cod/
165	Sapatos	100%	 https://www.jumia.ma/s-sapatos/
170	oxo shop	80%	 https://www.jumia.ma/shop-oxo/
171	Oscar Shoes	86%	 https://www.jumia.ma/oscar-shoes/
23	Qualife-SEA-COD	80%	 https://www.jumia.ma/qualife-sea-cod/
26	SuperMa-SEA-COD	74%	 https://www.jumia.ma/superma-sea-cod/
305	Magaztii	86%	 https://www.jumia.ma/magaztii-shop/
306	Ladies' Beauty	86%	 https://www.jumia.ma/ladies-beauty/
185	Tamariss shop	86%	 https://www.jumia.ma/tamariss-shop/
313	Souk 4 Shop	74%	 https://www.jumia.ma/souk-4-shop/
314	Swrose-Sea-COD	74%	 https://www.jumia.ma/swrose-sea-cod/
317	street land	62%	 https://www.jumia.ma/street-land/
318	Gobi star	86%	 https://www.jumia.ma/gobi-star/
321	Jacodi	40%	 https://www.jumia.ma/jacodi-1564581707/
200	Exist	46%	 https://www.jumia.ma/exist-1572606170/
325	INADVANCE	74%	 https://www.jumia.ma/inadvance/
347	FASHION AVENUE	74%	 https://www.jumia.ma/fashion-avenue/
348	FARAHAT STORE .	100%	 https://www.jumia.ma/farahat-store-/
231	Tauntte Shoes SEA-COD	94%	 https://www.jumia.ma/tauntte-shoes-sea-cod/
241	Jumia	98%	 https://www.jumia.ma
355	super New	94%	 https://www.jumia.ma/super-new/
360	Footzone	86%	 https://www.jumia.ma/footzone/
361	ChassAmine Store	86%	 https://www.jumia.ma/chassamine-store/
249	DeFacto	86%	 https://www.jumia.ma/defacto-1551797701/
100	AdidaStore	74%	 https://www.jumia.ma/adidastore/
253	Duuyue - SEA - COD	74%	 https://www.jumia.ma/duuyue-sea-cod/
369	E-DESTOCK	100%	 https://www.jumia.ma/e-destock/
375	Moon Shop	80%	 https://www.jumia.ma/moon-shop/
376	Shopping Happy	80%	 https://www.jumia.ma/shopping-happy/
267	Aaquila	92%	 https://www.jumia.ma/aaquila/
382	Adlane-shop	66%	 https://www.jumia.ma/adlane-shop/
272	FIT AVENUE	100%	 https://www.jumia.ma/fit-avenue/
129	OLMA fashion	100%	 https://www.jumia.ma/olma-fashion/
275	Simplicity	92%	 https://www.jumia.ma/simplicity-shop/
384	Outlet Sport	74%	 https://www.jumia.ma/outlet-sport/
278	Beauty winshop	80%	 https://www.jumia.ma/beauty-winshop/
279	Ruvet	80%	 https://www.jumia.ma/ruvet/
280	Moroccan Shoes	86%	 https://www.jumia.ma/moroccan-shoes-shop/
281	GEO MODE	100%	 https://www.jumia.ma/geo-mode/
385	Best marque	80%	 https://www.jumia.ma/best-marque/
386	Shym Shop	80%	 https://www.jumia.ma/shym-shop/
387	Geeker-shop-Sea-COD	74%	 https://www.jumia.ma/geeker-sea-cod/
388	FARAHAT shop	66%	 https://www.jumia.ma/farahat-shop-1537789133/
389	INAYA	100%	 https://www.jumia.ma/inaya/
390	Happy bébé	40%	 https://www.jumia.ma/happy-bebe/
392	emashop	80%	 https://www.jumia.ma/emashop/
149	Gabriel	100%	 https://www.jumia.ma/gabriel-shop/
\.


--
-- Name: category_id_category_seq; Type: SEQUENCE SET; Schema: public; Owner: nasser
--

SELECT pg_catalog.setval('public.category_id_category_seq', 1, false);


--
-- Name: legacy_price_id_price_seq; Type: SEQUENCE SET; Schema: public; Owner: nasser
--

SELECT pg_catalog.setval('public.legacy_price_id_price_seq', 1, false);


--
-- Name: product_id_product_seq; Type: SEQUENCE SET; Schema: public; Owner: nasser
--

SELECT pg_catalog.setval('public.product_id_product_seq', 44, true);


--
-- Name: store_id_store_seq; Type: SEQUENCE SET; Schema: public; Owner: nasser
--

SELECT pg_catalog.setval('public.store_id_store_seq', 392, true);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: nasser
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id_category);


--
-- Name: legacy_price legacy_price_pkey; Type: CONSTRAINT; Schema: public; Owner: nasser
--

ALTER TABLE ONLY public.legacy_price
    ADD CONSTRAINT legacy_price_pkey PRIMARY KEY (id_price);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: nasser
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id_product);


--
-- Name: store store_pkey; Type: CONSTRAINT; Schema: public; Owner: nasser
--

ALTER TABLE ONLY public.store
    ADD CONSTRAINT store_pkey PRIMARY KEY (id_store);


--
-- Name: legacy_price legacy_price_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: nasser
--

ALTER TABLE ONLY public.legacy_price
    ADD CONSTRAINT legacy_price_ibfk_1 FOREIGN KEY (id_product) REFERENCES public.product(id_product);


--
-- Name: legacy_price legacy_price_ibfk_2; Type: FK CONSTRAINT; Schema: public; Owner: nasser
--

ALTER TABLE ONLY public.legacy_price
    ADD CONSTRAINT legacy_price_ibfk_2 FOREIGN KEY (id_category) REFERENCES public.category(id_category);


--
-- Name: legacy_price legacy_price_ibfk_3; Type: FK CONSTRAINT; Schema: public; Owner: nasser
--

ALTER TABLE ONLY public.legacy_price
    ADD CONSTRAINT legacy_price_ibfk_3 FOREIGN KEY (id_store) REFERENCES public.store(id_store);


--
-- Name: product product_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: nasser
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_ibfk_1 FOREIGN KEY (id_category) REFERENCES public.category(id_category);


--
-- Name: product product_ibfk_2; Type: FK CONSTRAINT; Schema: public; Owner: nasser
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_ibfk_2 FOREIGN KEY (id_store) REFERENCES public.store(id_store);


--
-- PostgreSQL database dump complete
--
