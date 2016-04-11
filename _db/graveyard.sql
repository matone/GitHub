--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.1
-- Dumped by pg_dump version 9.5.1

-- Started on 2016-04-11 10:43:37

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE "GraveYardDB";
--
-- TOC entry 2180 (class 1262 OID 16594)
-- Name: GraveYardDB; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "GraveYardDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Slovak_Slovakia.1250' LC_CTYPE = 'Slovak_Slovakia.1250';


ALTER DATABASE "GraveYardDB" OWNER TO postgres;

\connect "GraveYardDB"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 2181 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 1 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2183 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 182 (class 1259 OID 29563)
-- Name: applicant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE applicant (
    id integer NOT NULL,
    city character varying(255),
    email character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    phone_number character varying(255),
    postal_code character varying(255),
    street character varying(255)
);


ALTER TABLE applicant OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 29571)
-- Name: deceased; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE deceased (
    id integer NOT NULL,
    age integer,
    first_name character varying(255),
    last_name character varying(255)
);


ALTER TABLE deceased OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 29579)
-- Name: exhumation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE exhumation (
    id integer NOT NULL,
    date_from timestamp without time zone,
    applicant_id integer NOT NULL,
    deceased_id integer NOT NULL
);


ALTER TABLE exhumation OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 29681)
-- Name: funeral; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE funeral (
    id integer NOT NULL,
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    applicant_id integer NOT NULL,
    deceased_id integer NOT NULL,
    grave_id integer NOT NULL
);


ALTER TABLE funeral OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 29589)
-- Name: grave; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE grave (
    id integer NOT NULL,
    all_places_number integer,
    full_places_number integer,
    grave_number integer,
    sector_id integer
);


ALTER TABLE grave OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 29561)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hibernate_sequence OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 29594)
-- Name: management; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE management (
    id integer NOT NULL,
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    manager_id integer NOT NULL,
    sector_id integer NOT NULL
);


ALTER TABLE management OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 29599)
-- Name: manager; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE manager (
    id integer NOT NULL,
    city character varying(255),
    email character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    phone_number character varying(255),
    postal_code character varying(255),
    street character varying(255)
);


ALTER TABLE manager OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 29607)
-- Name: owner; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE owner (
    id integer NOT NULL,
    city character varying(255),
    email character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    phone_number character varying(255),
    postal_code character varying(255),
    street character varying(255)
);


ALTER TABLE owner OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 29615)
-- Name: rent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE rent (
    id integer NOT NULL,
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    grave_id integer NOT NULL,
    owner_id integer NOT NULL
);


ALTER TABLE rent OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 29620)
-- Name: sector; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sector (
    id integer NOT NULL,
    all_graves_number integer,
    full_graves_number integer,
    sector_number integer,
    size integer
);


ALTER TABLE sector OWNER TO postgres;

--
-- TOC entry 2166 (class 0 OID 29563)
-- Dependencies: 182
-- Data for Name: applicant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY applicant (id, city, email, first_name, last_name, phone_number, postal_code, street) FROM stdin;
1	Carvalhal da Aroeira	sgordon0@npr.org	Scott	Gordon	351-(571)948-8566	983-58-5222	Colorado
2	Uurainen	crobertson1@lycos.com	Cheryl	Robertson	358-(732)122-8894	163-87-1037	Browning
3	Doloon	gjones2@sbwire.com	Gary	Jones	976-(507)239-0221	102-83-2540	Maple Wood
4	Cẩm Phả	kthompson3@europa.eu	Kathy	Thompson	84-(599)423-3708	343-61-6402	Darwin
5	Vilca	rmorgan4@freewebs.com	Rose	Morgan	51-(185)606-8765	542-16-9897	Jenifer
6	San Roque	awillis5@bigcartel.com	Alice	Willis	63-(750)443-1437	390-95-9515	Melody
7	Kembang	athompson6@blogs.com	Aaron	Thompson	62-(634)670-9838	458-05-0137	Gale
8	Pleven	gharrison7@a8.net	Gregory	Harrison	359-(277)481-9002	321-54-6327	Carioca
9	Budapest	bfranklin8@spiegel.de	Billy	Franklin	36-(289)876-8080	943-40-8866	Nevada
10	Monte-Carlo	aalvarez9@noaa.gov	Adam	Alvarez	377-(262)563-5657	225-09-9725	Johnson
11	Fatuulan	gwalkera@miitbeian.gov.cn	Gregory	Walker	62-(443)273-8224	846-45-2706	Lillian
12	Narawayong	atorresb@tamu.edu	Andrea	Torres	62-(431)682-1628	367-80-7192	Pearson
13	Aikmel	jlongc@howstuffworks.com	Jack	Long	62-(221)742-9730	457-13-0087	Hazelcrest
14	Los Tangos	cblackd@upenn.edu	Christine	Black	504-(501)392-4916	549-53-2934	International
15	Calape	dblacke@lycos.com	Dorothy	Black	63-(757)619-2358	674-46-6867	Mallory
16	Gävle	malexanderf@php.net	Matthew	Alexander	46-(699)301-7291	763-24-3508	Coolidge
17	Balugo	tgeorgeg@wunderground.com	Tammy	George	63-(751)567-5116	666-52-4318	Calypso
18	Kentville	gharrish@hibu.com	Gloria	Harris	1-(236)776-8233	118-35-0225	Scott
19	Kuantan	bperezi@feedburner.com	Brandon	Perez	60-(464)425-9322	985-26-0592	Moulton
20	Arīḩā	tlongj@etsy.com	Tammy	Long	963-(544)761-0717	482-02-2789	Eagle Crest
21	Bulgan	jcunninghamk@sphinn.com	Judy	Cunningham	976-(398)242-9014	249-20-6685	Manley
22	Pong	khansenl@pcworld.com	Kathleen	Hansen	66-(751)156-9529	235-60-8413	Nevada
23	Estância Velha	kwatkinsm@webnode.com	Katherine	Watkins	55-(584)535-8596	984-84-5347	Merry
24	Forécariah	jrossn@ovh.net	Joyce	Ross	224-(700)326-3225	372-38-3993	Roxbury
25	Qinglin	jalexandero@yelp.com	Joseph	Alexander	86-(473)576-3280	296-84-5652	Karstens
26	Granada	dchavezp@photobucket.com	Doris	Chavez	57-(768)886-8461	542-80-6399	Shasta
27	Changlu	lwardq@tmall.com	Linda	Ward	86-(658)690-6143	956-22-5532	West
28	Cuauhtemoc	jrayr@mtv.com	Joyce	Ray	52-(852)984-1057	376-85-7870	Shoshone
29	Changjiang	cburnss@cnet.com	Chris	Burns	86-(225)960-3927	200-23-8716	Linden
30	Huichang	jholmest@nbcnews.com	Jonathan	Holmes	86-(554)330-3457	453-06-8220	Stang
31	Tagbilaran City	epowellu@parallels.com	Edward	Powell	63-(405)474-2409	850-91-4439	Warrior
32	Pesisir	halexanderv@aol.com	Harry	Alexander	62-(651)992-1860	947-32-8017	Del Sol
33	Corujeira	ghowellw@icio.us	Gloria	Howell	351-(146)879-3920	179-23-6962	Marquette
34	Rochester	jwoodx@nsw.gov.au	Julia	Wood	1-(585)960-0606	107-44-8551	5th
35	Pewel Wielka	tsmithy@yolasite.com	Thomas	Smith	48-(665)174-5161	603-67-1298	Calypso
36	Chambéry	ameyerz@bigcartel.com	Ann	Meyer	33-(238)396-0861	377-62-1499	Nelson
37	Yiqi	pcampbell10@github.com	Paula	Campbell	86-(529)821-8957	944-62-5637	Bayside
38	Jalanbaru	dgreene11@irs.gov	Douglas	Greene	62-(777)615-1140	280-53-7971	Hanover
39	Fucheng	ccarter12@technorati.com	Charles	Carter	86-(471)399-0207	920-18-7312	Jenna
40	São Domingos de Rana	scampbell13@vkontakte.ru	Steven	Campbell	351-(661)514-0463	388-75-6153	Bartelt
41	Vallenar	pmoreno14@over-blog.com	Patrick	Moreno	56-(418)771-5783	826-96-3028	Saint Paul
42	Calasgasan	jlawrence15@stanford.edu	Janet	Lawrence	63-(322)588-9268	702-69-6248	Longview
43	Nowy Tomyśl	rlane16@time.com	Raymond	Lane	48-(629)923-6667	506-14-5133	Bluestem
44	Daojiang	rcole17@nsw.gov.au	Robin	Cole	86-(799)709-2173	945-21-0520	Westridge
45	Zhaigang	shudson18@newsvine.com	Sara	Hudson	86-(409)676-1740	836-69-4759	Messerschmidt
46	Javarthushuu	jflores19@altervista.org	Judy	Flores	976-(364)171-8596	776-05-6691	Golf View
47	Milwaukee	msmith1a@etsy.com	Mark	Smith	1-(414)469-1631	347-64-7953	Barby
48	Baltimore	hwhite1b@princeton.edu	Harry	White	1-(410)936-5644	571-28-5708	Golf View
49	Ipoh	gporter1c@printfriendly.com	George	Porter	60-(674)721-1679	810-16-4750	Burrows
50	Strelka	bmorris1d@npr.org	Brandon	Morris	7-(724)909-0153	256-49-9756	Northland
51	Lazaro Cardenas	mbanks1e@woothemes.com	Matthew	Banks	52-(787)507-6158	246-46-3649	Autumn Leaf
52	Esperanza	spierce1f@ebay.com	Sarah	Pierce	63-(212)783-5645	725-74-5480	Harper
53	Xia’ertai	chunt1g@ask.com	Cheryl	Hunt	86-(459)739-9498	916-35-6697	Stoughton
54	Liuhou	rdavis1h@va.gov	Raymond	Davis	86-(101)470-5945	754-79-4328	Stang
55	Pomabamba	sbarnes1i@unc.edu	Stephanie	Barnes	51-(823)392-9989	280-59-6495	Algoma
56	San Quintin	jrichardson1j@arizona.edu	Joe	Richardson	63-(112)604-3742	943-74-1878	Butternut
57	Egvekinot	jmeyer1k@artisteer.com	Joseph	Meyer	7-(127)974-4326	668-47-3312	Vera
58	Gueset	ckelley1l@unc.edu	Carol	Kelley	63-(244)719-5132	574-69-1867	Rieder
59	Legaspi	ptaylor1m@fema.gov	Patrick	Taylor	63-(143)861-4951	383-37-4266	Portage
60	Jakubowice Murowane	eclark1n@liveinternet.ru	Earl	Clark	48-(402)609-2328	700-44-7647	Oak
61	Paço	jfrazier1o@wikispaces.com	Jennifer	Frazier	351-(721)245-9489	210-41-3362	Almo
62	Thị Trấn Vạn Hà	bmeyer1p@cornell.edu	Betty	Meyer	84-(110)490-8489	661-85-8043	Truax
63	San Isidro	ariley1q@wordpress.com	Anne	Riley	63-(826)805-7617	161-60-2757	Summit
64	Volokolamsk	rnelson1r@discovery.com	Ronald	Nelson	7-(141)234-1742	897-28-7665	Messerschmidt
65	Duisburg	jreynolds1s@patch.com	Johnny	Reynolds	49-(649)336-9577	848-12-7386	Mariners Cove
66	Kirzhach	phanson1t@imdb.com	Paul	Hanson	7-(352)728-8662	727-40-9185	Muir
67	Leipzig	ajames1u@spotify.com	Alan	James	49-(302)383-1252	895-15-6489	Eggendart
68	Zambujeira	kscott1v@weibo.com	Karen	Scott	351-(453)316-0404	663-42-1901	Iowa
69	Sé	djenkins1w@nhs.uk	Denise	Jenkins	351-(578)592-3605	644-88-3361	International
70	Ribeiro	ssanders1x@illinois.edu	Scott	Sanders	351-(438)224-1094	846-78-9212	Lerdahl
71	Khisarya	lfowler1y@hc360.com	Louise	Fowler	359-(928)282-0000	354-02-5391	Fisk
72	Zhongbao	pharvey1z@domainmarket.com	Paul	Harvey	86-(512)751-8218	335-84-9640	Grasskamp
73	Sangiang	sgarcia20@freewebs.com	Shirley	Garcia	62-(853)904-5148	701-82-2527	Mayer
74	Concepción	ksimpson21@eepurl.com	Kevin	Simpson	56-(982)401-5365	598-81-4733	Menomonie
75	Tsirang	jgray22@friendfeed.com	James	Gray	975-(706)866-2786	234-99-0668	Prairie Rose
76	Saubara	larmstrong23@dell.com	Lisa	Armstrong	55-(651)859-4470	214-54-8959	Erie
77	Yongtai	sreid24@symantec.com	Susan	Reid	86-(774)598-7370	481-03-2521	Pond
78	Atabayan	aross25@qq.com	Amy	Ross	63-(286)455-4342	690-83-1185	Melrose
79	Cantapoy	jfields26@blinklist.com	Jane	Fields	63-(625)587-6673	286-18-1983	Graceland
80	Maia	kwatson27@google.pl	Kenneth	Watson	351-(204)729-6644	584-72-9826	Merry
81	Ternovka	dhoward28@ocn.ne.jp	Douglas	Howard	7-(539)785-7590	521-04-9585	Monument
82	Al Maşlūb	nwallace29@i2i.jp	Nancy	Wallace	967-(163)262-5680	281-14-7481	Paget
83	Akademgorodok	dthompson2a@bbc.co.uk	Donald	Thompson	7-(249)565-4104	814-33-1239	Roxbury
84	Dębica	jtorres2b@paypal.com	Joe	Torres	48-(193)659-1869	961-15-8689	Bellgrove
85	Huansheng	rbaker2c@quantcast.com	Rose	Baker	86-(594)244-7325	199-14-5268	Spohn
86	Megalochórion	bkelley2d@accuweather.com	Brandon	Kelley	30-(996)283-9976	758-39-1386	Grayhawk
87	Mostek	mwillis2e@ifeng.com	Marie	Willis	420-(303)949-4164	186-17-8018	Anniversary
88	Pitangui	jferguson2f@globo.com	Jimmy	Ferguson	55-(720)646-4100	304-09-2349	Colorado
89	Miaotang	bgrant2g@posterous.com	Brandon	Grant	86-(962)614-7469	659-42-3721	Golden Leaf
90	Jingcheng	bboyd2h@bloglines.com	Brenda	Boyd	86-(945)366-4195	769-54-9532	Fairview
91	Porto Seguro	lmills2i@howstuffworks.com	Linda	Mills	55-(168)422-7387	470-06-8751	Algoma
92	Koźmin Wielkopolski	bmoreno2j@artisteer.com	Billy	Moreno	48-(141)486-5197	467-94-5230	Chinook
93	Zarqa	awelch2k@storify.com	Ashley	Welch	962-(239)460-0453	282-44-3914	Meadow Valley
94	Koroška Bela	sdavis2l@geocities.jp	Shirley	Davis	386-(998)635-2563	615-31-1533	Oneill
95	Korenëvo	amorris2m@vimeo.com	Andrew	Morris	7-(343)627-6170	103-79-7598	Kensington
96	Isfahan	hcarr2n@state.tx.us	Harold	Carr	98-(626)676-7876	484-06-5817	Morrow
97	Lansing	cfields2o@booking.com	Christopher	Fields	1-(517)543-3298	160-57-8447	Green Ridge
98	Beigucheng	jlee2p@spotify.com	Jennifer	Lee	86-(557)517-0300	545-33-0450	Sachs
99	Gumel	tjohnston2q@dagondesign.com	Timothy	Johnston	234-(780)791-7108	210-80-4010	Kensington
100	Berlin	lfrazier2r@joomla.org	Linda	Frazier	49-(466)642-2050	487-33-3123	Derek
101	Talitsa	akelly0@google.com.br	Alice	Kelly	7-(256)765-1491	\N	353 Memorial Terrace
102	Jandira	rmartin1@archive.org	Robert	Martin	55-(458)141-6094	\N	2 Gale Terrace
103	Kouzhen	cweaver2@cloudflare.com	Catherine	Weaver	86-(840)999-7216	\N	73212 Porter Circle
104	Narva-Jõesuu	jstevens3@storify.com	Janet	Stevens	372-(662)727-5657	\N	608 Northfield Trail
105	Laiponda	rking4@dell.com	Ruby	King	62-(795)333-9307	\N	1580 Havey Circle
106	Bethanie	mwells5@google.ru	Marie	Wells	264-(788)291-8393	\N	44730 Hoard Crossing
107	Macheke	hcoleman6@gov.uk	Henry	Coleman	263-(756)747-0166	\N	92 Di Loreto Plaza
108	Ngedhusuba	dwagner7@samsung.com	Donald	Wagner	62-(522)787-7141	\N	8 Sugar Avenue
109	Bayasgalant	dfox8@tinypic.com	Dennis	Fox	976-(171)805-3926	\N	60 Dakota Street
110	Lame	bgarrett9@sourceforge.net	Brandon	Garrett	234-(646)262-3638	\N	87065 2nd Alley
111	Looc	jramireza@elegantthemes.com	Jessica	Ramirez	63-(613)357-8560	\N	150 Sage Junction
112	Topory	kcruzb@nationalgeographic.com	Keith	Cruz	380-(451)148-7016	\N	714 Hansons Road
113	Skellefteå	hkellyc@jiathis.com	Harold	Kelly	46-(780)470-4307	931 57	58 1st Parkway
114	Portland	mlopezd@netlog.com	Maria	Lopez	1-(208)742-8119	97211	72 Lukken Avenue
115	Gagarin	cbradleye@answers.com	Craig	Bradley	374-(666)397-8150	\N	733 Meadow Valley Parkway
116	Nahiyat Ghammas	whowardf@wikia.com	William	Howard	964-(662)266-0855	\N	09 Toban Court
117	Lévis	rmedinag@artisteer.com	Roy	Medina	1-(216)923-3719	\N	5067 Bunting Drive
118	Drosáto	mandersonh@123-reg.co.uk	Michael	Anderson	30-(368)450-0942	\N	707 Melrose Lane
119	Yangchengzhuang	klopezi@amazon.de	Kathryn	Lopez	86-(441)398-6448	\N	26337 Corben Hill
120	Murcia	mgriffinj@yale.edu	Melissa	Griffin	63-(574)856-5220	\N	4206 Randy Drive
121	Zhongcun	jmccoyk@360.cn	Jonathan	Mccoy	86-(354)626-7564	\N	1494 Packers Terrace
122	Eldama Ravine	jdixonl@surveymonkey.com	Judith	Dixon	254-(348)251-9065	\N	79640 Wayridge Crossing
123	Lyon	rmarshallm@plala.or.jp	Raymond	Marshall	33-(479)815-6486	69413 CEDEX 06	9 Dunning Park
124	Jun’an	gandersonn@gnu.org	Gloria	Anderson	86-(422)939-8703	\N	4 Debs Place
125	Newton	mmillero@blogs.com	Melissa	Miller	44-(111)629-6807	IV1	0 Oakridge Circle
126	Périgny	gaustinp@cdc.gov	Gerald	Austin	33-(511)686-1996	17184 CEDEX	0 Cordelia Place
127	Salfīt	fhenryq@discuz.net	Frank	Henry	970-(346)490-1975	\N	41358 Nova Lane
128	Lavadorinhos	nbrooksr@google.es	Nicole	Brooks	351-(376)893-2946	4415-708	144 Ilene Hill
129	Shostka	rwilsons@storify.com	Ronald	Wilson	380-(591)386-3789	\N	6488 Crowley Point
130	Kahama	dkingt@ftc.gov	Dennis	King	255-(436)461-6152	\N	74776 6th Hill
131	Náchod	shunteru@wix.com	Samuel	Hunter	420-(677)842-1185	\N	96 Lakeland Parkway
132	Ngedhubasa	pallenv@wordpress.com	Patrick	Allen	62-(196)244-0144	\N	3871 Hagan Park
133	Chartres	kellisw@epa.gov	Karen	Ellis	33-(690)610-5753	28009 CEDEX	45 Nobel Avenue
134	Qiawan	ldayx@ehow.com	Linda	Day	86-(552)420-5017	\N	931 Shasta Road
135	Lansing	kkingy@blog.com	Karen	King	1-(517)832-2677	48919	1 Donald Hill
136	Copán	hjohnstonz@alexa.com	Harold	Johnston	504-(782)837-0984	\N	933 Goodland Alley
137	Obuasi	gflores10@google.de	Gerald	Flores	233-(520)902-6497	\N	54547 Logan Lane
138	Guadalupe	jroberts11@nationalgeographic.com	Jesse	Roberts	51-(961)570-4823	\N	079 Everett Terrace
139	Tabinay	hphillips12@yahoo.co.jp	Harold	Phillips	63-(363)456-7726	\N	25 Oneill Park
140	Voskresensk	bhughes13@weibo.com	Betty	Hughes	7-(509)793-1953	\N	93329 Heath Center
141	Campos	jburke14@last.fm	Joshua	Burke	351-(820)980-3259	4620-031	84133 Luster Plaza
142	Buenavista	cschmidt15@linkedin.com	Christina	Schmidt	57-(759)205-6302	\N	1 Merrick Parkway
143	Donggong	smorris16@eventbrite.com	Stephen	Morris	86-(662)526-3184	\N	155 Barby Crossing
144	Pingling	bwhite17@irs.gov	Billy	White	86-(973)287-4416	\N	74027 1st Point
145	Upper Hell's Gate	mwood18@wix.com	Mark	Wood	599-(954)267-7172	\N	16 Linden Lane
146	Sundbyberg	mmorrison19@deliciousdays.com	Martha	Morrison	46-(984)495-2044	174 49	54889 Onsgard Parkway
147	Kochetok	chansen1a@newyorker.com	Cheryl	Hansen	380-(574)417-4348	\N	69359 Gulseth Road
148	San Rafael	cberry1b@chronoengine.com	Craig	Berry	63-(351)723-0462	\N	77 Emmet Way
149	Tlogosari	hray1c@desdev.cn	Harry	Ray	62-(982)920-0008	\N	89524 Fulton Hill
150	Rosario de Mora	klynch1d@shutterfly.com	Kevin	Lynch	503-(384)129-8582	\N	652 Prentice Lane
151	Boac	kpatterson1e@so-net.ne.jp	Kenneth	Patterson	63-(504)903-6029	\N	261 Iowa Crossing
152	Chepo	sperez1f@google.it	Sandra	Perez	507-(411)579-8701	\N	343 Melody Circle
153	Boliney	tferguson1g@ezinearticles.com	Teresa	Ferguson	63-(246)680-4430	\N	3 Towne Place
154	Jevremovac	swest1h@time.com	Stephen	West	381-(871)486-9598	\N	1 Comanche Point
155	Hetang	awillis1i@amazonaws.com	Ann	Willis	86-(464)262-6175	\N	70 Orin Court
156	Tokorozawa	ebishop1j@gravatar.com	Edward	Bishop	81-(536)524-6760	\N	588 Hermina Way
157	Batad	jrogers1k@skype.com	Juan	Rogers	63-(600)143-1865	\N	08987 Hovde Road
158	Loum	thall1l@ebay.co.uk	Terry	Hall	237-(157)312-6981	\N	73 Fairfield Drive
159	San Antonio	dboyd1m@github.io	Deborah	Boyd	1-(210)219-1798	78215	0 High Crossing Pass
160	Wentang	cnguyen1n@edublogs.org	Carol	Nguyen	86-(574)405-2157	\N	95889 Weeping Birch Park
161	Le Mans	nperez1o@salon.com	Nancy	Perez	33-(975)530-6058	72100	9 Menomonie Street
162	Ciudad Ojeda	sevans1p@mapy.cz	Stephanie	Evans	58-(722)402-8133	\N	56962 Armistice Parkway
163	Thaton	talexander1q@tinypic.com	Tammy	Alexander	95-(705)664-0368	\N	14980 Goodland Center
164	José de Freitas	bblack1r@cbslocal.com	Barbara	Black	55-(828)540-3637	\N	9782 Esch Trail
165	Banqiao	rgardner1s@google.co.uk	Roger	Gardner	86-(541)771-7478	\N	58 Fairfield Court
166	Az Zarbah	jstanley1t@nih.gov	Joe	Stanley	963-(606)695-9490	\N	3 3rd Terrace
167	Thị Trấn Yên Thế	bhill1u@google.pl	Brandon	Hill	84-(475)767-0448	\N	13 Algoma Pass
168	Shalakusha	hrobinson1v@ucsd.edu	Heather	Robinson	7-(503)693-4998	\N	107 Chinook Pass
169	Debar	cnelson1w@mac.com	Carolyn	Nelson	389-(261)157-2256	\N	3743 Corscot Road
170	Shiogama	bcole1x@va.gov	Bonnie	Cole	81-(612)144-1883	\N	91 Lunder Circle
171	Zhemtala	trice1y@sun.com	Teresa	Rice	7-(446)524-2744	\N	0 Mcbride Lane
172	Svyetlahorsk	tbailey1z@epa.gov	Teresa	Bailey	375-(829)317-0797	\N	17 Bowman Plaza
173	Libacao	dmcdonald20@icq.com	Douglas	Mcdonald	63-(792)337-6955	\N	0778 Sunfield Plaza
174	Longmen	jpowell21@google.com.au	Juan	Powell	86-(208)928-2590	\N	6 Mcbride Terrace
175	Pangai	ahawkins22@feedburner.com	Andrea	Hawkins	676-(968)131-1003	\N	6693 Blackbird Way
176	Örebro	jmorgan23@samsung.com	John	Morgan	46-(810)578-7358	701 43	46 Village Green Alley
177	Portela	dweaver24@yahoo.com	Daniel	Weaver	351-(692)144-8950	4690-300	6 Anzinger Parkway
178	Manquiring	cperez25@about.com	Carl	Perez	63-(473)350-4915	\N	5 Vermont Court
179	Hujiagou	cortiz26@shinystat.com	Carl	Ortiz	86-(900)540-6116	\N	2 Melby Pass
180	Sidaurip	lmyers27@telegraph.co.uk	Larry	Myers	62-(110)960-5736	\N	3 Valley Edge Court
181	Nuasepu	rrose28@devhub.com	Roger	Rose	62-(972)419-1330	\N	04 Sutherland Park
182	Konispol	lprice29@walmart.com	Lisa	Price	355-(133)397-0671	\N	95013 Thompson Court
183	Богданци	ldavis2a@lulu.com	Linda	Davis	389-(986)700-3712	\N	15261 Hoard Road
184	Bayt ‘Īnūn	rwebb2b@flavors.me	Richard	Webb	970-(770)698-5223	\N	28675 Mayfield Parkway
185	Shchelkovo	cmatthews2c@purevolume.com	Christina	Matthews	7-(465)869-2363	\N	0 North Trail
186	Mananjary	dbrooks2d@1688.com	Donald	Brooks	261-(832)109-3561	\N	1 Johnson Alley
187	Évora	pstephens2e@ftc.gov	Patricia	Stephens	351-(624)982-0120	7000-062	2 Hintze Point
188	Budapest	tvasquez2f@bandcamp.com	Thomas	Vasquez	36-(363)701-5189	1147	49651 Bobwhite Terrace
189	Pueblo	gstevens2g@simplemachines.org	George	Stevens	1-(719)198-7500	81010	30430 Ludington Street
190	Taganskiy	gmccoy2h@go.com	Gary	Mccoy	7-(213)744-2656	\N	5 Holy Cross Alley
191	Hualian	rhudson2i@irs.gov	Rebecca	Hudson	886-(843)820-6966	\N	79021 Hazelcrest Road
192	Vrsi	sschmidt2j@utexas.edu	Samuel	Schmidt	385-(551)978-2153	\N	5 Barnett Avenue
193	Loreto	lyoung2k@hugedomains.com	Linda	Young	63-(909)565-0537	\N	98 Mallory Junction
194	Tangdong	rsimmons2l@google.it	Rebecca	Simmons	86-(823)474-1332	\N	61192 Columbus Road
195	Liangwa	cdean2m@addtoany.com	Christopher	Dean	86-(371)637-8840	\N	297 Hooker Park
196	Waddān	dbowman2n@google.com.br	Dennis	Bowman	218-(217)253-9880	\N	2 Hudson Street
197	Melfort	pmitchell2o@diigo.com	Patrick	Mitchell	1-(756)214-9142	\N	15 Aberg Avenue
198	Erfangping	jbrooks2p@behance.net	Jonathan	Brooks	86-(103)159-1675	\N	72426 Fremont Terrace
199	Janūb as Surrah	rday2q@house.gov	Roger	Day	965-(234)993-4906	\N	80774 Sauthoff Way
200	Czerwionka-Leszczyny	jolson2r@yellowbook.com	Julia	Olson	48-(316)221-6049	\N	67 Thompson Park
\.


--
-- TOC entry 2167 (class 0 OID 29571)
-- Dependencies: 183
-- Data for Name: deceased; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY deceased (id, age, first_name, last_name) FROM stdin;
1	99	Robin	Walker
2	67	Sean	Kelly
3	82	Jason	Hill
4	12	Howard	Rodriguez
5	79	Adam	Garza
6	75	Jane	Stevens
7	58	John	Chavez
8	22	Carlos	Ferguson
9	57	Wanda	Robertson
10	10	Jennifer	Sims
11	98	Cheryl	Morris
12	94	Robin	Parker
13	100	Andrew	Larson
14	72	Billy	Graham
15	14	Sharon	Parker
16	78	Jerry	Warren
17	34	Gary	Peters
18	10	Phillip	Hall
19	59	Thomas	Nguyen
20	54	Terry	Lynch
21	52	Philip	Porter
22	23	Daniel	Lawson
23	97	Kenneth	Dunn
24	43	Ann	Anderson
25	5	Rose	Bishop
26	41	Benjamin	Garcia
27	24	Donald	Oliver
28	47	Ralph	Perez
29	96	Steve	Welch
30	6	Linda	Johnston
31	98	Victor	Gonzales
32	89	John	Kelly
33	84	Jose	Greene
34	83	Emily	Simmons
35	13	Nicole	Sims
36	46	Melissa	Fisher
37	66	Emily	Gonzales
38	80	Mark	Adams
39	54	Harry	James
40	87	Julie	Hayes
41	53	Jesse	Medina
42	40	Ashley	Riley
43	91	Samuel	Allen
44	78	Amanda	Cox
45	82	Rose	Hawkins
46	84	Arthur	Rodriguez
47	58	Christine	Hill
48	64	Julie	Kennedy
49	31	Kimberly	Flores
50	10	Scott	Coleman
51	15	Terry	Long
52	41	Doris	Coleman
53	34	Elizabeth	Palmer
54	18	Amy	Howell
55	100	Justin	Wilson
56	89	Paul	Hicks
57	61	Deborah	Kelly
58	52	Roger	King
59	30	Harry	White
60	44	Heather	Ross
61	100	Laura	Hamilton
62	41	Cynthia	Carr
63	21	Antonio	Bennett
64	87	Kelly	Fisher
65	89	Jacqueline	Jackson
66	20	Kathryn	Martin
67	47	Chris	Gonzales
68	14	Lillian	Sanchez
69	77	Linda	Kelly
70	9	Sharon	Kelley
71	43	Katherine	Riley
72	50	Wayne	Olson
73	70	Roy	Russell
74	99	Edward	Stephens
75	18	Anna	Brooks
76	21	Evelyn	Murphy
77	16	Juan	Morales
78	40	Sandra	Stewart
79	56	Janice	Burns
80	74	Helen	Stanley
81	85	Carolyn	Pierce
82	11	Brian	Hayes
83	83	Ruby	Allen
84	21	George	Webb
85	18	Ruby	Hawkins
86	26	Eric	Carroll
87	85	Martin	Pierce
88	54	Aaron	Frazier
89	88	Ralph	George
90	38	Dorothy	Simpson
91	100	Heather	Wallace
92	46	Phillip	Russell
93	17	Marie	Cunningham
94	18	Debra	Miller
95	22	Beverly	Lee
96	65	Kathryn	Simpson
97	83	Benjamin	Payne
98	64	Todd	Frazier
99	40	Walter	Cooper
100	66	Steven	Gilbert
101	31	Denise	Morris
102	17	Walter	Schmidt
103	55	Julia	Gray
104	45	Carolyn	Murphy
105	98	Sara	Hayes
106	36	Tina	Lewis
107	82	Dennis	Morales
108	18	Howard	Anderson
109	75	Terry	Flores
110	8	Samuel	Wilson
111	85	Billy	Williamson
112	87	Jeffrey	Jenkins
113	83	Jeffrey	Banks
114	72	Adam	Miller
115	78	Charles	Black
116	51	Fred	Kim
117	78	Frank	Sanders
118	22	Randy	Thompson
119	52	Janice	Morgan
120	93	Mildred	Hansen
121	84	Benjamin	Romero
122	5	Eugene	Stewart
123	69	Lawrence	Warren
124	61	Samuel	Wright
125	95	Judy	Holmes
126	73	Michael	Martinez
127	45	Annie	Diaz
128	13	Shawn	Gordon
129	97	Angela	Hansen
130	76	Kimberly	Jacobs
131	48	Nicholas	Black
132	99	Peter	Perez
133	87	Samuel	Garrett
134	13	Heather	Owens
135	20	Carl	Rice
136	72	Kathryn	Gibson
137	25	Betty	Olson
138	87	Robert	Henderson
139	92	Annie	Peterson
140	82	Marilyn	Ferguson
141	41	Joseph	Green
142	89	Jerry	Cruz
143	57	Lois	Perry
144	9	Lois	Burke
145	76	Alice	Morales
146	36	William	Medina
147	88	Martha	Lewis
148	8	Joan	Fuller
149	11	Kevin	Austin
150	53	Paul	Fox
151	92	Timothy	Freeman
152	79	Jacqueline	Griffin
153	71	Juan	Duncan
154	72	Patrick	Hamilton
155	48	Virginia	Montgomery
156	41	Sharon	Hansen
157	56	Robin	Powell
158	71	Joseph	Watkins
159	81	Benjamin	Fox
160	65	Richard	Fuller
161	15	Stephanie	Gibson
162	79	Chris	Sims
163	55	Evelyn	Moore
164	82	Joseph	Rogers
165	18	Timothy	Banks
166	71	Wanda	Williamson
167	20	Kelly	Sullivan
168	7	Annie	Foster
169	77	Craig	Ryan
170	64	Annie	Coleman
171	90	Deborah	Williams
172	79	Harold	Cook
173	40	Stephen	Lawrence
174	35	Cheryl	Hayes
175	62	Christopher	Smith
176	33	Ann	Nichols
177	37	Cynthia	Cook
178	7	John	Thomas
179	76	Lawrence	Hanson
180	54	Lawrence	Watson
181	68	Kathryn	Ruiz
182	75	Douglas	George
183	39	John	Simpson
184	64	Brenda	Murray
185	35	Timothy	Anderson
186	68	Nicole	Mccoy
187	31	Sarah	Robertson
188	12	Carolyn	Carr
189	41	Margaret	Meyer
190	42	Walter	Pierce
191	30	Nicole	Meyer
192	84	Margaret	Johnston
193	30	Ruby	Baker
194	59	Juan	Ray
195	91	Lori	Garza
196	20	Amy	Morris
197	93	Wanda	Knight
198	43	Larry	Burke
199	32	Steve	Knight
200	18	Katherine	Bailey
201	6	Debra	Harvey
202	93	Samuel	Stewart
203	43	Gregory	Baker
204	80	Johnny	Murray
205	33	Paula	Gonzales
206	18	Jose	Watson
207	85	Clarence	Peterson
208	51	Anthony	Russell
209	12	Steve	Bishop
210	98	Doris	Morgan
211	93	Sean	Rogers
212	10	Joe	Hughes
213	14	Sean	Patterson
214	40	Amanda	Nichols
215	51	David	Long
216	40	Helen	Elliott
217	30	Beverly	Williams
218	8	Judith	Willis
219	30	Amy	Henderson
220	16	Edward	Patterson
221	30	Amy	Hamilton
222	58	Evelyn	Fields
223	8	Gloria	Brown
224	54	Bruce	Garcia
225	88	Matthew	Nelson
226	19	Harold	Harrison
227	44	Jessica	Hall
228	55	Judith	Kelley
229	44	Raymond	Owens
230	84	Jennifer	Gardner
231	34	Keith	Hansen
232	12	James	Johnson
233	17	Wayne	Schmidt
234	94	Heather	Gomez
235	20	Craig	Castillo
236	50	Steven	Long
237	16	Jesse	Bryant
238	63	Jessica	Sanders
239	72	Ryan	Garza
240	6	Todd	Day
241	13	Todd	Long
242	98	Joe	Morris
243	89	Thomas	Brown
244	35	Irene	Walker
245	71	Gloria	Wright
246	16	Amanda	Simmons
247	36	Carl	Ellis
248	33	Roger	Mills
249	27	Bruce	Warren
250	6	Willie	Watkins
251	35	Roger	Payne
252	16	Margaret	Webb
253	50	Harold	Burns
254	82	Cheryl	Hernandez
255	72	Doris	Schmidt
256	93	Jonathan	Black
257	42	Phyllis	Jackson
258	30	Robert	Harris
259	85	Dorothy	Banks
260	93	Julie	Greene
261	52	Bonnie	Murphy
262	60	Wayne	Kennedy
263	88	Martha	Richards
264	73	Tammy	Hansen
265	54	Paula	Morris
266	74	Steve	Little
267	63	Andrew	Freeman
268	37	Joseph	Williamson
269	73	Ruby	Wagner
270	71	Charles	Porter
271	85	Mary	Cox
272	83	Joan	Cruz
273	37	Alice	Young
274	12	Michael	Murray
275	24	Ralph	Richards
276	10	Roy	Reid
277	32	Rebecca	Gilbert
278	57	Arthur	Jenkins
279	10	Willie	Jacobs
280	6	Antonio	Hughes
281	92	Debra	Hicks
282	23	Terry	Porter
283	22	Amy	James
284	81	Jason	Ryan
285	54	Joan	Foster
286	45	Gloria	George
287	88	Raymond	Bennett
288	77	Nicole	Sanchez
289	30	Margaret	Carpenter
290	19	Robin	Jacobs
291	60	Teresa	Meyer
292	94	Katherine	Powell
293	100	Sara	Mcdonald
294	30	Julie	Murray
295	80	Diane	Hernandez
296	12	Ralph	Lopez
297	84	Bonnie	Boyd
298	60	Christina	Payne
299	48	Henry	Fowler
300	54	Denise	Frazier
301	69	Heather	Ford
302	26	Gloria	Harris
303	32	Wanda	Price
304	97	Janice	Stone
305	24	Eric	Warren
306	17	Ann	Fisher
307	45	Edward	Parker
308	7	Kimberly	George
309	6	Maria	Reid
310	18	Mark	Wells
311	46	Louise	Marshall
312	93	Billy	Richards
313	80	Howard	Porter
314	83	Judy	Dixon
315	27	Dennis	Marshall
316	58	Gloria	Kim
317	27	Edward	Ray
318	52	Karen	Olson
319	27	Nancy	Reed
320	51	Edward	Kim
321	91	Dorothy	Franklin
322	49	Robert	Clark
323	91	Linda	Hughes
324	71	Samuel	Tucker
325	95	Harry	Jordan
326	13	Alice	Coleman
327	68	Annie	Crawford
328	76	Roy	Ruiz
329	27	Roger	Kim
330	31	Paula	Hicks
331	62	Rachel	Cruz
332	89	Jesse	Murray
333	8	Earl	Ellis
334	73	Michael	Howell
335	83	Walter	Andrews
336	61	Jack	Duncan
337	31	Benjamin	Bishop
338	68	Douglas	Taylor
339	74	Shirley	Wheeler
340	30	Eugene	Fisher
341	16	Anthony	Palmer
342	14	Debra	Harris
343	93	Phillip	Ferguson
344	48	Ruth	Cunningham
345	7	Howard	Little
346	80	Brian	Armstrong
347	12	Jacqueline	Rodriguez
348	17	Carl	Bowman
349	17	Diana	Morales
350	35	Victor	Smith
351	52	Christine	Welch
352	66	Pamela	Mitchell
353	99	Andrew	Owens
354	51	Jonathan	Meyer
355	44	Jeremy	Chapman
356	49	Stephen	Howard
357	46	Anna	Myers
358	87	Steven	Murphy
359	84	Edward	Hall
360	98	Daniel	Stone
361	31	Jose	Russell
362	75	Johnny	Grant
363	43	Steven	Reynolds
364	68	Keith	Taylor
365	94	Howard	Cruz
366	39	Shawn	Scott
367	78	Kenneth	White
368	50	Helen	Owens
369	10	Frances	Willis
370	50	Ronald	Butler
371	12	Debra	Carroll
372	32	Jacqueline	Hanson
373	70	Timothy	Marshall
374	31	Stephen	Young
375	63	Brian	Gordon
376	40	Gary	Meyer
377	14	Sharon	Alvarez
378	90	Joe	Hall
379	39	Sandra	Green
380	27	Mary	Medina
381	34	Phillip	Robertson
382	43	Anthony	Berry
383	74	Harold	Wheeler
384	76	Nicole	Cook
385	72	Gloria	Hunter
386	54	James	Berry
387	75	Julie	Gilbert
388	74	Earl	Robertson
389	52	Gloria	Allen
390	85	Alan	Alvarez
391	57	Julie	Matthews
392	74	Sharon	Gonzalez
393	83	Randy	Fuller
394	63	Martha	Griffin
395	69	Adam	Stevens
396	52	Tammy	Cole
397	92	William	Mendoza
398	20	Randy	Wilson
399	48	Peter	Flores
400	21	Karen	Kelley
401	19	Marie	Sanchez
402	19	Lawrence	Brooks
403	10	Albert	Marshall
404	24	Kenneth	Alexander
405	38	Kathryn	Rose
406	41	Frances	Jenkins
407	13	Phyllis	Bennett
408	98	Deborah	Ryan
409	92	Rachel	Long
410	15	Sandra	Ford
411	42	Virginia	Thompson
412	52	Christopher	Wagner
413	12	Jane	Lee
414	12	Susan	Dunn
415	26	Anna	Richards
416	32	Martha	Gray
417	81	Nicholas	Edwards
418	94	Jerry	Fox
419	62	Jesse	Austin
420	7	Linda	Roberts
421	71	Margaret	Phillips
422	75	Mildred	Moore
423	58	Jesse	Campbell
424	59	Antonio	Wells
425	5	Jerry	Smith
426	6	Maria	Lynch
427	89	Jeremy	Knight
428	94	Doris	Scott
429	6	Todd	Hayes
430	82	Pamela	Wallace
431	35	Bruce	Dean
432	51	Albert	Nichols
433	71	Albert	Martinez
434	89	Amanda	Ross
435	45	Phyllis	Crawford
436	13	Daniel	Bryant
437	42	Jonathan	White
438	35	Cynthia	Day
439	13	John	Fowler
440	89	Edward	Wood
441	36	Harold	Arnold
442	10	Jesse	Sanders
443	91	Mildred	Burke
444	81	Adam	West
445	38	Ernest	Campbell
446	22	Jennifer	Cole
447	94	Amy	Anderson
448	88	Louis	Simpson
449	96	Sean	Parker
450	72	Elizabeth	Bishop
451	56	Patricia	Patterson
452	29	Philip	Gonzales
453	40	Christopher	Fowler
454	83	Sean	Peterson
455	50	Janet	Morrison
456	7	Wayne	Garrett
457	7	Wayne	Schmidt
458	75	Ronald	Greene
459	80	Amanda	Romero
460	42	Clarence	Hunt
461	53	Steve	Gray
462	36	Lillian	Fields
463	71	Amy	Elliott
464	41	Anna	Russell
465	58	Lori	Hanson
466	73	Nicole	Carr
467	88	Bruce	Burns
468	56	Rebecca	Gray
469	84	Kimberly	Thomas
470	31	Sandra	Carpenter
471	66	Wanda	Reyes
472	63	Deborah	Hanson
473	63	Phyllis	Reed
474	41	Anne	Evans
475	43	Eugene	Wright
476	35	Kathleen	Knight
477	8	Lawrence	Morrison
478	92	Sara	Crawford
479	68	Cynthia	Henderson
480	10	Rebecca	Porter
481	38	Judith	Brown
482	64	Teresa	Mitchell
483	100	Katherine	Patterson
484	15	Ralph	Phillips
485	38	Tina	Reed
486	42	Steven	Wright
487	60	Mildred	Little
488	93	Adam	Carr
489	15	Beverly	Henry
490	9	Doris	Reynolds
491	64	Tina	Ross
492	53	Carl	Moore
493	71	Albert	Foster
494	85	Howard	Palmer
495	59	Doris	Stephens
496	9	Peter	Mcdonald
497	87	Jason	Henderson
498	9	Bobby	Boyd
499	82	Paula	Richardson
500	34	Joyce	Bowman
\.


--
-- TOC entry 2168 (class 0 OID 29579)
-- Dependencies: 184
-- Data for Name: exhumation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY exhumation (id, date_from, applicant_id, deceased_id) FROM stdin;
2	2016-05-11 17:00:00	1	379
3	2016-05-10 10:00:00	1	386
\.


--
-- TOC entry 2175 (class 0 OID 29681)
-- Dependencies: 191
-- Data for Name: funeral; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY funeral (id, date_from, date_to, applicant_id, deceased_id, grave_id) FROM stdin;
1	1969-06-12 09:01:37	\N	28	1	176
2	1967-01-10 00:53:57	\N	58	2	83
3	1971-09-29 18:22:34	\N	87	3	34
4	1991-02-28 21:00:06	\N	24	4	36
5	1963-08-09 16:28:08	\N	26	5	191
6	1982-06-18 19:07:54	\N	33	6	154
7	1957-05-18 23:39:18	\N	86	7	291
8	1971-10-24 14:02:45	\N	99	8	35
9	1989-10-10 16:50:46	\N	99	9	115
10	1962-02-11 15:50:34	\N	72	10	75
11	1999-10-19 20:56:16	\N	77	11	57
12	1979-12-05 11:47:46	\N	90	12	42
13	1978-03-01 22:54:04	\N	14	13	36
14	1980-09-13 01:58:19	\N	95	14	197
15	1981-05-27 06:03:45	\N	67	15	254
16	1977-06-02 20:11:25	\N	11	16	21
17	1962-01-07 09:45:23	\N	73	17	23
18	2012-04-15 04:59:27	\N	27	18	79
19	1978-05-29 16:02:29	\N	9	19	148
20	1994-12-30 09:15:24	\N	61	20	129
21	2003-07-21 02:28:56	\N	28	21	125
22	1956-05-30 21:07:22	\N	85	22	117
23	2007-06-25 17:29:21	\N	37	23	117
24	1957-09-29 23:06:29	\N	52	24	120
25	1990-03-29 23:51:20	\N	28	25	289
26	1998-05-02 02:14:17	\N	70	26	68
27	2012-06-21 23:29:00	\N	46	27	61
28	1997-06-26 00:55:56	\N	53	28	87
29	2002-10-08 09:31:32	\N	39	29	59
30	1999-01-23 17:33:21	\N	86	30	116
31	1979-06-13 22:10:52	\N	45	31	156
32	1954-08-26 02:24:31	\N	13	32	53
33	1964-09-22 16:20:09	\N	9	33	97
34	1966-12-25 00:55:20	\N	39	34	121
35	1972-11-02 17:01:17	\N	55	35	56
36	1956-10-13 03:40:27	\N	71	36	255
37	1982-05-26 20:05:42	\N	40	37	264
38	1964-04-16 06:39:30	\N	68	38	27
39	1974-10-16 21:23:18	\N	55	39	183
40	1978-01-16 02:52:43	\N	89	40	275
41	1980-09-30 17:05:39	\N	57	41	110
42	1975-06-03 22:31:38	\N	3	42	297
43	1976-01-16 17:24:12	\N	91	43	265
44	1957-11-06 08:40:51	\N	63	44	117
45	1984-01-15 17:48:28	\N	46	45	109
46	2003-07-19 14:37:13	\N	16	46	147
47	2001-05-10 02:27:56	\N	30	47	197
48	1988-07-10 15:30:42	\N	66	48	147
49	1954-10-17 10:48:34	\N	2	49	38
50	2011-09-20 07:53:17	\N	45	50	184
51	2002-11-13 21:06:42	\N	16	51	75
52	1954-10-12 11:48:43	\N	90	52	5
53	2012-06-07 10:05:55	\N	29	53	154
54	1983-02-06 15:00:24	\N	13	54	268
55	2015-07-21 09:43:58	\N	73	55	244
56	2007-08-20 03:17:39	\N	5	56	75
57	1987-10-26 10:02:25	\N	77	57	248
58	1968-10-09 12:14:58	\N	21	58	217
59	2014-06-01 03:38:48	\N	34	59	278
60	1956-11-15 22:01:22	\N	79	60	92
61	1950-07-29 17:06:45	\N	9	61	275
62	2002-01-26 05:28:50	\N	31	62	64
63	2004-04-26 19:46:30	\N	82	63	196
64	2001-04-01 20:19:18	\N	16	64	222
65	1970-04-05 23:18:32	\N	49	65	267
66	1975-01-26 10:19:30	\N	71	66	157
67	1967-08-14 03:49:13	\N	27	67	122
68	1954-05-19 20:34:35	\N	3	68	41
69	1960-02-21 09:00:37	\N	82	69	24
70	1989-11-21 17:26:22	\N	87	70	161
71	1988-08-27 02:20:34	\N	98	71	13
72	2012-08-07 21:49:03	\N	31	72	197
73	1987-12-05 14:51:21	\N	42	73	212
74	1950-08-07 15:28:01	\N	34	74	211
75	1970-10-02 01:48:44	\N	71	75	230
76	1995-04-23 03:45:49	\N	27	76	129
77	2003-01-16 02:17:54	\N	66	77	296
78	2010-11-04 13:56:10	\N	36	78	84
79	1970-11-27 14:58:49	\N	68	79	95
80	2003-11-30 13:12:40	\N	52	80	221
81	2010-06-27 00:56:54	\N	84	81	146
82	1960-02-03 07:38:12	\N	12	82	189
83	1972-10-25 23:30:22	\N	53	83	48
84	1983-10-20 21:14:36	\N	83	84	140
85	2014-09-08 01:44:18	\N	100	85	118
86	1977-05-04 04:49:48	\N	74	86	169
87	1973-02-12 11:10:36	\N	74	87	244
88	1996-09-08 10:05:30	\N	24	88	125
89	1994-07-10 07:18:35	\N	23	89	149
90	1962-04-01 08:06:20	\N	45	90	172
91	1986-01-27 22:11:47	\N	53	91	178
92	1988-01-21 06:23:59	\N	21	92	105
93	1950-06-22 07:53:15	\N	9	93	97
94	1973-10-03 00:08:07	\N	92	94	145
95	2013-02-17 07:00:55	\N	95	95	121
96	1967-11-06 13:04:44	\N	49	96	39
97	1995-05-04 05:39:07	\N	61	97	132
98	1989-06-15 20:16:38	\N	83	98	116
99	2008-06-24 14:18:54	\N	72	99	291
100	1990-01-08 09:35:48	\N	35	100	71
101	1973-11-19 21:28:26	\N	74	101	113
102	1973-05-11 15:16:28	\N	77	102	107
103	1993-07-20 12:19:38	\N	37	103	204
104	1973-11-04 19:35:54	\N	49	104	67
105	1970-02-26 12:58:04	\N	7	105	265
106	1968-01-06 18:44:35	\N	86	106	97
107	2009-11-21 10:59:55	\N	16	107	191
108	2013-06-08 05:45:31	\N	42	108	72
109	1981-04-19 16:56:07	\N	79	109	122
110	2000-11-22 22:53:59	\N	48	110	40
111	1993-09-26 21:13:26	\N	87	111	226
112	1951-09-25 13:40:04	\N	38	112	171
113	1998-01-16 02:01:18	\N	82	113	89
114	1994-08-21 01:24:50	\N	83	114	256
115	1996-02-26 12:05:04	\N	69	115	135
116	1989-08-11 17:15:06	\N	59	116	53
117	2013-08-10 04:39:21	\N	7	117	110
118	1986-09-30 05:50:11	\N	55	118	240
119	2010-12-26 11:11:08	\N	14	119	17
120	1950-12-09 21:40:31	\N	59	120	108
121	1985-12-15 07:27:45	\N	43	121	267
122	1999-08-07 06:37:11	\N	41	122	266
123	1976-09-24 08:53:40	\N	86	123	48
124	1971-06-20 02:32:03	\N	41	124	223
125	1982-10-05 01:22:36	\N	29	125	71
126	1992-09-04 20:54:51	\N	74	126	162
127	1995-09-19 17:36:32	\N	91	127	113
128	2016-01-26 09:20:37	\N	37	128	66
129	1960-03-13 17:48:15	\N	46	129	78
130	2008-01-11 21:26:06	\N	69	130	52
131	1967-08-28 16:24:20	\N	45	131	178
132	1991-08-06 07:12:56	\N	73	132	225
133	1952-01-18 14:48:49	\N	36	133	253
134	1990-04-20 07:42:40	\N	7	134	125
135	1959-12-18 18:53:17	\N	47	135	139
136	1957-03-19 01:44:04	\N	6	136	272
137	1991-02-07 20:42:47	\N	76	137	163
138	2004-12-25 14:44:31	\N	55	138	248
139	2009-04-02 14:53:51	\N	59	139	19
140	1953-05-31 21:24:58	\N	25	140	112
141	1988-01-09 08:31:23	\N	30	141	22
142	1985-04-24 07:45:46	\N	24	142	256
143	1973-11-23 03:04:44	\N	99	143	296
144	2014-10-25 12:49:13	\N	62	144	192
145	1980-12-28 07:13:35	\N	62	145	18
146	1955-07-04 05:16:22	\N	30	146	179
147	1996-02-20 12:18:09	\N	43	147	150
148	1962-01-03 12:17:56	\N	70	148	24
149	2012-02-11 03:17:05	\N	38	149	210
150	1981-06-07 19:42:32	\N	31	150	186
151	1960-11-17 22:06:26	\N	77	151	191
152	1990-11-07 12:22:33	\N	52	152	38
153	2014-02-18 21:19:03	\N	81	153	82
154	1977-02-28 18:54:36	\N	77	154	284
155	1970-09-11 08:51:08	\N	83	155	129
156	2014-02-16 06:55:22	\N	53	156	254
157	1962-05-23 14:31:01	\N	38	157	148
158	1992-01-08 12:21:29	\N	45	158	132
159	1990-05-26 06:12:09	\N	98	159	129
160	2002-12-08 22:15:17	\N	83	160	263
161	1981-11-13 02:06:37	\N	15	161	19
162	2007-09-22 11:13:35	\N	54	162	90
163	1985-11-18 00:16:28	\N	96	163	144
164	1973-08-12 22:04:56	\N	54	164	13
165	1983-07-15 12:19:53	\N	95	165	4
166	1965-04-18 18:14:09	\N	70	166	61
167	1992-06-02 06:41:35	\N	55	167	215
168	1959-10-25 17:51:23	\N	43	168	247
169	2000-12-30 16:37:41	\N	57	169	94
170	1957-01-01 08:39:27	\N	100	170	56
171	2004-01-21 23:27:13	\N	76	171	39
172	1975-08-17 23:26:10	\N	4	172	89
173	1999-10-09 03:47:20	\N	56	173	255
174	2009-04-02 11:19:45	\N	57	174	13
175	1988-01-11 19:26:10	\N	66	175	235
176	2003-02-06 00:38:24	\N	83	176	97
177	1959-08-03 19:39:52	\N	79	177	21
178	1992-04-29 18:52:30	\N	71	178	58
179	1969-08-02 19:47:17	\N	33	179	203
180	1999-11-19 02:24:34	\N	90	180	194
181	1976-07-23 19:36:03	\N	65	181	258
182	1959-07-17 04:24:08	\N	56	182	88
183	1970-07-14 17:43:51	\N	64	183	259
184	1979-04-24 16:39:08	\N	7	184	82
185	1954-08-08 06:17:23	\N	73	185	134
186	1969-10-07 13:05:32	\N	35	186	161
187	1997-07-29 20:25:30	\N	100	187	70
188	2008-05-27 19:58:51	\N	33	188	121
189	1959-06-07 04:13:32	\N	98	189	230
190	2013-01-19 11:54:57	\N	17	190	286
191	2011-12-29 02:44:12	\N	30	191	165
192	1996-05-20 13:36:05	\N	68	192	79
193	2012-02-04 04:21:28	\N	89	193	114
194	1975-11-16 18:03:08	\N	46	194	34
195	1965-12-11 05:52:43	\N	47	195	254
196	1979-01-26 12:04:40	\N	30	196	92
197	1962-01-25 08:43:49	\N	61	197	68
198	1979-08-13 23:58:42	\N	25	198	99
199	1980-04-23 16:21:24	\N	24	199	114
200	1978-06-13 03:11:55	\N	3	200	246
201	1964-11-05 15:21:32	\N	42	201	194
202	2012-08-05 22:07:08	\N	52	202	297
203	1958-11-06 20:01:36	\N	85	203	139
204	1977-12-07 02:15:58	\N	79	204	274
205	1950-11-07 03:12:30	\N	59	205	130
206	1984-04-17 04:36:17	\N	12	206	293
207	1996-04-20 19:20:34	\N	66	207	193
208	1959-03-08 18:08:42	\N	58	208	242
209	2001-02-19 05:35:35	\N	41	209	295
210	1969-01-15 02:07:01	\N	17	210	197
211	1969-12-03 00:22:38	\N	61	211	132
212	2005-10-17 17:57:22	\N	94	212	71
213	1968-11-10 16:36:03	\N	33	213	4
214	1976-04-10 18:45:47	\N	99	214	162
215	1985-09-21 18:23:41	\N	72	215	193
216	2010-01-17 20:14:05	\N	2	216	69
217	1961-03-04 22:52:25	\N	56	217	81
218	1987-01-16 14:42:44	\N	44	218	96
219	1954-01-13 02:37:09	\N	71	219	86
220	2002-11-07 14:42:44	\N	60	220	41
221	2005-08-29 19:46:15	\N	10	221	181
222	1966-04-30 20:49:59	\N	10	222	24
223	1979-08-05 21:57:40	\N	87	223	213
224	1991-03-24 13:25:18	\N	74	224	34
225	1975-09-24 12:20:00	\N	52	225	38
226	1988-01-31 12:18:18	\N	61	226	16
227	1994-04-29 19:51:48	\N	16	227	19
228	1953-02-11 03:57:27	\N	30	228	130
229	1974-09-13 17:44:27	\N	87	229	290
230	1963-11-28 11:46:41	\N	88	230	279
231	1983-07-29 19:11:00	\N	94	231	299
232	1983-07-03 18:20:35	\N	54	232	36
233	1983-07-28 03:35:05	\N	77	233	15
234	1958-02-15 00:30:38	\N	54	234	252
235	2004-05-03 08:33:37	\N	90	235	110
236	1969-06-21 04:13:39	\N	59	236	206
237	2013-02-26 06:25:39	\N	38	237	85
238	1986-05-13 11:35:28	\N	36	238	160
239	1967-07-08 03:39:17	\N	91	239	235
240	2014-09-06 15:16:49	\N	95	240	257
241	2000-12-17 19:58:04	\N	86	241	140
242	1974-01-28 23:23:40	\N	50	242	243
243	1950-06-24 17:21:35	\N	49	243	209
244	1952-03-05 12:35:13	\N	76	244	227
245	1969-10-18 00:29:14	\N	97	245	198
246	1979-09-10 22:30:04	\N	49	246	122
247	1959-09-02 09:13:24	\N	47	247	202
248	1996-11-05 01:22:53	\N	63	248	84
249	2006-08-13 04:31:03	\N	32	249	274
250	1960-04-08 01:11:49	\N	55	250	253
251	1984-06-13 15:49:19	\N	72	251	71
252	1966-06-12 15:46:19	\N	65	252	62
253	1991-02-09 00:40:34	\N	61	253	27
254	2008-06-17 03:10:06	\N	63	254	34
255	1975-11-15 06:46:19	\N	17	255	136
256	1954-09-28 21:59:47	\N	57	256	16
257	2005-01-03 04:47:42	\N	32	257	34
258	2003-03-08 19:01:29	\N	52	258	88
259	1972-08-14 09:56:28	\N	59	259	165
260	1988-08-09 07:46:31	\N	70	260	110
261	1998-06-26 10:33:48	\N	83	261	90
262	2000-05-22 08:52:02	\N	75	262	237
263	2000-10-22 10:33:31	\N	8	263	149
264	1968-12-13 20:26:41	\N	28	264	179
265	1984-02-03 17:15:15	\N	94	265	62
266	1977-05-18 06:33:45	\N	26	266	75
267	1971-08-10 05:59:37	\N	52	267	210
268	1982-11-10 16:35:50	\N	46	268	83
269	1981-05-14 02:32:18	\N	27	269	280
270	1950-05-25 11:11:34	\N	18	270	16
271	1977-12-19 23:10:13	\N	52	271	159
272	2011-03-16 04:25:38	\N	9	272	149
273	2014-05-01 05:36:44	\N	42	273	102
274	2004-04-18 19:16:05	\N	37	274	269
275	2004-09-04 10:58:52	\N	86	275	196
276	1954-07-03 20:47:25	\N	78	276	269
277	1998-11-22 06:38:01	\N	49	277	228
278	1971-05-24 10:06:32	\N	81	278	122
279	1965-03-30 11:00:45	\N	41	279	277
280	2003-01-21 04:25:20	\N	50	280	149
281	1957-02-21 04:59:04	\N	52	281	243
282	1976-07-17 14:49:38	\N	54	282	147
283	1956-07-19 20:25:20	\N	55	283	147
284	1979-06-17 09:30:12	\N	45	284	87
285	2010-07-29 11:27:04	\N	35	285	256
286	2011-09-24 04:27:15	\N	35	286	90
287	1981-07-18 08:25:28	\N	6	287	192
288	1983-06-23 20:02:59	\N	35	288	251
289	1970-06-20 03:29:18	\N	24	289	167
290	1954-02-12 17:58:36	\N	77	290	44
291	1976-01-12 15:31:52	\N	32	291	107
292	1994-04-04 03:11:50	\N	38	292	232
293	1976-11-16 23:14:55	\N	34	293	294
294	1951-12-03 22:42:05	\N	43	294	127
295	1960-09-28 22:05:52	\N	51	295	123
296	1982-06-07 21:13:24	\N	80	296	50
297	1970-10-19 09:31:23	\N	49	297	237
298	1966-10-27 17:21:17	\N	79	298	72
299	2008-03-17 02:41:58	\N	8	299	209
300	2000-05-04 19:10:20	\N	94	300	131
301	1994-10-26 04:17:34	\N	91	301	191
302	1983-10-20 09:59:15	\N	3	302	233
303	1960-01-19 12:06:53	\N	1	303	295
304	1960-08-15 18:09:30	\N	39	304	292
305	1993-07-02 20:44:36	\N	38	305	43
306	1985-11-18 01:59:43	\N	32	306	90
307	1964-05-05 07:40:00	\N	66	307	126
308	1964-08-28 13:15:06	\N	91	308	156
309	1987-04-20 00:44:44	\N	79	309	215
310	1987-02-19 15:33:27	\N	46	310	153
311	1976-01-06 22:32:33	\N	54	311	287
312	1971-04-09 17:25:55	\N	57	312	158
313	1992-05-06 17:00:51	\N	5	313	35
314	1954-03-19 10:28:48	\N	81	314	242
315	1964-02-22 04:42:38	\N	88	315	58
316	1978-09-13 08:30:32	\N	60	316	54
317	1997-04-07 20:09:11	\N	62	317	199
318	1978-10-04 09:47:47	\N	23	318	254
319	2001-11-06 11:40:22	\N	86	319	11
320	1976-12-06 21:52:18	\N	32	320	191
321	1972-04-18 18:26:04	\N	10	321	134
322	1956-09-22 16:46:18	\N	33	322	45
323	1950-09-19 22:10:21	\N	82	323	300
324	1959-03-17 19:24:43	\N	29	324	87
325	1971-10-05 18:05:26	\N	75	325	199
326	1952-03-22 09:22:34	\N	14	326	46
327	2009-03-15 07:47:29	\N	51	327	14
328	1982-01-23 23:38:48	\N	41	328	95
329	2002-08-21 01:42:46	\N	15	329	214
330	1969-06-15 19:00:18	\N	54	330	14
331	1995-07-29 19:05:07	\N	27	331	296
332	1977-11-18 03:35:08	\N	63	332	134
333	1960-12-22 05:08:55	\N	38	333	102
334	2013-08-03 18:41:09	\N	95	334	192
335	2009-09-29 02:11:42	\N	56	335	79
336	1956-11-28 14:35:11	\N	86	336	16
337	2015-06-26 03:30:38	\N	100	337	277
338	2014-07-30 01:26:01	\N	72	338	69
339	1967-07-01 22:45:25	\N	44	339	266
340	1982-04-07 01:48:26	\N	87	340	264
341	1991-05-23 01:55:23	\N	48	341	249
342	1955-06-25 08:44:51	\N	46	342	28
343	2001-07-09 17:36:35	\N	46	343	277
344	1984-08-04 20:01:57	\N	100	344	174
345	1990-06-21 08:15:02	\N	78	345	170
346	1987-10-15 08:05:26	\N	96	346	48
347	1958-03-31 03:36:12	\N	26	347	6
348	1996-09-09 02:29:59	\N	58	348	273
349	2010-07-16 11:49:30	\N	21	349	140
350	1970-05-21 19:16:51	\N	87	350	222
351	1978-05-07 08:31:58	\N	55	351	144
352	2002-01-16 23:16:23	\N	4	352	179
353	2000-05-23 15:15:45	\N	98	353	262
354	1978-07-09 12:17:33	\N	72	354	12
355	1987-12-19 12:21:48	\N	15	355	103
356	2010-01-02 10:45:15	\N	59	356	99
357	1992-12-27 10:05:37	\N	32	357	221
358	1975-12-04 13:13:51	\N	16	358	93
359	1981-06-03 06:07:03	\N	38	359	234
360	1965-08-13 04:36:31	\N	25	360	213
361	1997-05-07 22:44:21	\N	21	361	271
362	2015-09-14 22:57:36	\N	80	362	117
363	1974-08-03 18:49:49	\N	64	363	279
364	2008-04-09 21:57:02	\N	79	364	67
365	1974-01-25 20:59:48	\N	88	365	32
366	1958-10-27 05:37:38	\N	24	366	10
367	1998-06-27 18:38:24	\N	84	367	77
368	1997-02-10 21:49:23	\N	57	368	95
369	1951-11-30 18:23:55	\N	73	369	37
370	1950-03-09 05:20:36	\N	21	370	200
371	1953-06-02 04:46:42	\N	79	371	35
372	1974-01-29 17:46:16	\N	73	372	275
373	2000-11-23 07:35:43	\N	33	373	165
374	2000-07-06 07:16:01	\N	26	374	177
375	2001-10-28 20:55:08	\N	43	375	116
376	1965-12-07 16:33:01	\N	35	376	121
377	1951-07-24 20:58:05	\N	90	377	20
378	2002-04-14 14:02:01	\N	62	378	109
380	1993-03-06 17:30:06	\N	21	380	93
381	2012-03-22 07:56:29	\N	83	381	92
382	1986-06-22 06:07:06	\N	38	382	33
383	1989-07-23 08:24:22	\N	5	383	158
384	1995-04-23 10:11:23	\N	42	384	259
385	1954-06-23 10:39:20	\N	75	385	218
387	2014-12-20 07:08:05	\N	100	387	144
388	2010-03-20 16:32:42	\N	45	388	158
389	1965-08-25 09:02:32	\N	2	389	279
390	1991-07-11 12:41:12	\N	39	390	300
391	2008-10-30 06:19:11	\N	1	391	19
392	2015-08-11 17:58:10	\N	3	392	130
393	1954-03-22 09:26:27	\N	70	393	76
394	1980-01-17 04:51:43	\N	87	394	90
395	1965-12-23 16:22:30	\N	65	395	96
396	1962-05-31 09:06:46	\N	41	396	64
397	2003-09-22 04:29:51	\N	70	397	75
398	1979-02-20 14:53:26	\N	86	398	50
399	1961-05-13 16:28:24	\N	26	399	142
400	2003-07-12 21:42:32	\N	49	400	287
401	1984-01-08 03:58:23	\N	28	401	146
402	2004-11-30 03:59:20	\N	9	402	202
403	1995-05-29 20:07:36	\N	49	403	208
404	2003-08-08 11:39:31	\N	69	404	175
405	1975-08-15 18:50:25	\N	25	405	179
406	2007-11-01 08:21:16	\N	25	406	104
407	2006-07-12 02:57:19	\N	70	407	100
408	1983-01-04 02:18:01	\N	35	408	255
409	1977-01-26 22:10:55	\N	13	409	266
410	1989-08-15 02:39:47	\N	37	410	296
411	1952-10-20 01:53:59	\N	92	411	66
412	1957-05-16 04:48:57	\N	18	412	35
413	1965-07-07 07:25:26	\N	48	413	49
414	1964-06-09 09:53:19	\N	30	414	244
415	1975-08-04 10:37:59	\N	70	415	1
416	1976-08-21 23:25:21	\N	91	416	27
417	1956-05-27 16:12:59	\N	55	417	152
418	1990-10-08 18:52:09	\N	55	418	210
419	1976-08-24 18:37:17	\N	58	419	94
420	2014-12-05 23:01:22	\N	20	420	297
421	1989-08-08 07:20:30	\N	69	421	213
422	1950-11-26 03:09:57	\N	77	422	234
423	1974-11-03 15:12:01	\N	45	423	128
424	2015-09-01 00:52:55	\N	20	424	136
425	1995-01-21 02:15:21	\N	16	425	167
426	2012-01-06 22:20:18	\N	79	426	113
427	2011-04-16 09:49:19	\N	30	427	148
428	1980-03-01 02:32:17	\N	58	428	147
429	1975-04-01 22:25:51	\N	79	429	78
430	2001-12-11 06:41:12	\N	15	430	124
431	1960-09-02 21:46:06	\N	55	431	113
432	1985-10-08 14:58:48	\N	15	432	160
433	1986-04-12 14:24:27	\N	1	433	50
434	1993-11-19 23:11:55	\N	8	434	233
435	1969-10-08 03:19:38	\N	26	435	263
436	1993-02-20 00:37:55	\N	49	436	149
437	1959-06-15 20:52:27	\N	74	437	146
438	1961-02-26 10:48:47	\N	86	438	85
439	2014-02-25 07:18:35	\N	5	439	11
440	1951-12-05 15:48:12	\N	57	440	168
441	2002-05-16 19:16:20	\N	62	441	94
442	2005-01-12 20:23:29	\N	41	442	151
443	2009-08-18 12:53:44	\N	5	443	65
444	1963-01-27 08:37:04	\N	17	444	266
445	1996-08-08 11:29:11	\N	6	445	12
446	1992-03-04 10:36:19	\N	89	446	79
447	1982-01-08 03:09:30	\N	44	447	7
448	2002-12-06 09:37:18	\N	61	448	237
449	1952-05-15 15:45:50	\N	99	449	201
450	1997-08-12 21:52:45	\N	46	450	222
451	2013-02-01 08:31:07	\N	21	451	40
452	1981-03-21 17:34:58	\N	45	452	101
453	1953-06-09 20:04:41	\N	9	453	175
454	1960-09-12 21:45:00	\N	81	454	210
455	1952-02-16 21:43:36	\N	25	455	127
456	1956-08-25 18:40:06	\N	52	456	157
457	1994-04-27 22:08:50	\N	43	457	97
458	1971-03-29 05:40:01	\N	85	458	61
459	1981-07-08 15:53:37	\N	69	459	98
460	1965-11-30 15:08:31	\N	40	460	9
461	1978-08-12 20:29:15	\N	51	461	39
462	2013-04-11 21:18:17	\N	55	462	70
463	1960-04-13 06:15:59	\N	20	463	103
464	1958-10-11 08:37:23	\N	46	464	240
465	2010-08-16 20:28:59	\N	75	465	6
466	1970-12-29 20:13:47	\N	10	466	272
467	2008-07-29 07:02:50	\N	78	467	235
468	2009-01-16 03:00:30	\N	19	468	4
469	1970-12-12 23:06:31	\N	73	469	63
470	2012-10-05 22:30:06	\N	28	470	119
471	1951-02-07 16:02:57	\N	99	471	65
472	1976-12-01 15:50:47	\N	90	472	126
473	2016-03-23 12:39:27	\N	22	473	230
474	1972-05-15 00:14:59	\N	76	474	56
475	1967-04-26 22:47:02	\N	72	475	283
476	2013-04-28 19:04:14	\N	99	476	232
477	2016-03-07 14:36:05	\N	96	477	216
478	1991-07-29 06:15:49	\N	92	478	40
479	2015-02-17 15:50:39	\N	36	479	55
480	1999-05-20 23:37:23	\N	81	480	237
481	1978-06-17 16:53:27	\N	67	481	34
482	1957-06-02 09:15:17	\N	21	482	249
483	1972-05-09 23:20:30	\N	48	483	289
484	1986-06-28 11:16:49	\N	4	484	259
485	2013-03-08 13:44:51	\N	16	485	299
486	1996-06-03 12:28:42	\N	70	486	284
487	2015-10-29 03:34:50	\N	48	487	83
488	1979-09-06 00:22:48	\N	82	488	246
489	1952-06-21 19:25:15	\N	24	489	292
490	1970-06-18 10:26:45	\N	81	490	5
491	2001-08-10 17:48:43	\N	72	491	123
492	1962-01-19 08:55:49	\N	91	492	159
493	2005-06-02 18:59:29	\N	70	493	66
494	2012-08-17 13:51:10	\N	69	494	248
495	1977-01-01 16:07:27	\N	74	495	96
496	1988-01-15 20:13:46	\N	100	496	60
497	1994-04-27 03:28:35	\N	36	497	119
498	2014-03-13 06:01:18	\N	77	498	30
499	1985-09-04 04:20:53	\N	92	499	174
500	2014-10-14 02:09:21	\N	60	500	6
379	1974-01-28 21:48:31	2016-05-11 17:00:00	2	379	16
386	1997-09-14 09:24:01	2016-05-10 10:00:00	16	386	175
\.


--
-- TOC entry 2169 (class 0 OID 29589)
-- Dependencies: 185
-- Data for Name: grave; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY grave (id, all_places_number, full_places_number, grave_number, sector_id) FROM stdin;
140	4	3	140	2
141	4	0	141	2
142	5	1	142	10
143	5	0	143	9
144	5	3	144	3
70	5	2	70	3
225	3	1	225	6
226	4	1	226	2
149	5	5	149	10
191	5	5	191	9
210	4	4	210	10
34	6	6	34	2
16	5	4	16	1
145	5	1	145	8
146	4	3	146	5
147	5	5	147	8
148	3	3	148	10
150	4	1	150	10
151	5	1	151	4
152	4	1	152	4
153	3	1	153	5
154	3	2	154	8
155	3	0	155	9
156	5	2	156	5
157	3	2	157	7
158	5	3	158	5
159	3	2	159	10
160	3	2	160	8
161	5	2	161	9
162	4	2	162	1
163	3	1	163	4
164	4	0	164	1
165	4	3	165	1
166	4	0	166	6
167	3	2	167	4
168	5	1	168	5
169	3	1	169	8
170	4	1	170	2
171	5	1	171	5
172	3	1	172	3
173	4	0	173	7
174	3	2	174	8
176	5	1	176	9
177	5	1	177	4
178	3	2	178	5
179	4	4	179	10
180	3	0	180	2
181	3	1	181	7
182	5	0	182	9
183	4	1	183	8
184	5	1	184	7
185	5	0	185	6
186	3	1	186	8
187	5	0	187	9
188	3	0	188	7
189	5	1	189	9
190	4	0	190	10
192	3	3	192	7
193	5	2	193	7
194	5	2	194	6
195	3	0	195	1
196	5	2	196	6
197	5	4	197	9
198	5	1	198	3
199	4	2	199	6
200	4	1	200	4
201	4	1	201	8
202	4	2	202	10
203	5	1	203	5
204	3	1	204	1
205	5	0	205	5
206	5	1	206	3
207	3	0	207	10
208	4	1	208	10
209	3	2	209	2
211	5	1	211	9
212	4	1	212	6
213	5	3	213	8
214	5	1	214	9
215	5	2	215	7
216	5	1	216	2
217	5	1	217	7
218	5	1	218	3
219	3	0	219	7
220	5	0	220	2
221	4	2	221	1
222	3	3	222	6
223	5	1	223	3
224	4	0	224	7
1	3	1	1	4
2	5	0	2	5
3	3	0	3	5
4	5	3	4	4
5	3	2	5	6
6	4	3	6	9
7	3	1	7	10
8	4	0	8	7
9	3	1	9	2
10	4	1	10	9
11	5	2	11	7
12	5	2	12	10
13	3	3	13	3
14	5	2	14	7
15	5	1	15	2
17	5	1	17	6
18	3	1	18	2
19	4	4	19	5
20	5	1	20	1
21	3	2	21	7
22	5	1	22	7
23	5	1	23	5
24	3	3	24	4
25	3	0	25	4
26	4	0	26	10
27	5	3	27	6
28	5	1	28	7
29	3	0	29	5
30	5	1	30	5
31	3	0	31	2
32	3	1	32	1
33	4	1	33	2
35	5	4	35	4
36	5	3	36	5
37	4	1	37	7
38	4	3	38	8
39	4	3	39	5
40	5	3	40	9
41	3	2	41	8
42	4	1	42	6
43	4	1	43	7
44	3	1	44	7
45	3	1	45	10
46	3	1	46	8
47	3	0	47	9
48	4	3	48	1
49	5	1	49	8
50	3	3	50	10
51	4	0	51	6
52	3	1	52	6
53	4	2	53	1
54	5	1	54	10
55	3	1	55	3
56	3	3	56	4
57	3	1	57	8
58	4	2	58	1
59	4	1	59	1
60	4	1	60	7
61	4	3	61	6
62	4	2	62	9
63	5	1	63	10
64	4	2	64	7
65	5	2	65	2
66	5	3	66	4
67	3	2	67	3
68	4	2	68	4
69	5	2	69	4
175	3	2	175	1
72	4	2	72	10
73	3	0	73	5
74	5	0	74	5
76	5	1	76	2
77	4	1	77	10
78	3	2	78	9
79	5	4	79	6
80	4	0	80	2
81	5	1	81	6
82	3	2	82	9
83	5	3	83	9
84	4	2	84	9
85	5	2	85	9
86	3	1	86	9
87	3	3	87	2
88	5	2	88	2
89	3	2	89	6
91	4	0	91	2
92	5	3	92	3
93	4	2	93	4
94	5	3	94	8
95	5	3	95	3
96	5	3	96	9
98	5	1	98	10
99	5	2	99	9
100	3	1	100	8
101	5	1	101	9
102	3	2	102	6
103	3	2	103	9
104	3	1	104	8
105	3	1	105	7
106	4	0	106	10
107	4	2	107	1
108	4	1	108	5
109	4	2	109	10
111	4	0	111	3
112	5	1	112	1
113	5	4	113	7
114	4	2	114	8
115	4	1	115	6
116	3	3	116	3
117	5	4	117	6
118	4	1	118	1
119	4	2	119	5
120	4	1	120	9
121	4	4	121	8
122	5	4	122	9
123	4	2	123	6
124	3	1	124	6
125	3	3	125	6
126	5	2	126	5
127	5	2	127	10
128	4	1	128	4
129	4	4	129	5
130	5	3	130	3
131	4	1	131	8
132	3	3	132	6
133	4	0	133	8
134	4	3	134	6
135	5	1	135	6
136	4	2	136	7
137	4	0	137	10
138	5	0	138	7
139	5	2	139	6
71	4	4	71	3
75	5	5	75	4
90	5	5	90	10
97	5	5	97	9
110	4	4	110	3
227	3	1	227	5
228	4	1	228	5
229	3	0	229	2
230	3	3	230	10
231	4	0	231	9
232	4	2	232	3
233	5	2	233	4
234	3	2	234	8
235	3	3	235	6
236	3	0	236	4
237	4	4	237	8
238	5	0	238	4
239	5	0	239	3
240	4	2	240	1
241	5	0	241	9
242	4	2	242	6
243	4	2	243	6
244	4	3	244	2
245	4	0	245	9
246	3	2	246	5
247	4	1	247	10
248	4	3	248	1
249	4	2	249	7
250	4	0	250	5
251	5	1	251	3
252	5	1	252	5
253	5	2	253	4
254	5	4	254	4
255	3	3	255	2
256	4	3	256	8
257	5	1	257	1
258	3	1	258	1
259	5	3	259	7
260	3	0	260	1
261	4	0	261	10
262	4	1	262	2
263	5	2	263	1
264	4	2	264	2
265	4	2	265	8
266	5	4	266	5
267	3	2	267	2
268	4	1	268	5
269	4	2	269	3
270	5	0	270	8
271	5	1	271	10
272	3	2	272	6
273	5	1	273	8
274	4	2	274	3
275	5	3	275	5
276	4	0	276	5
277	4	3	277	9
278	3	1	278	9
279	5	3	279	3
280	3	1	280	5
281	3	0	281	3
282	4	0	282	4
283	3	1	283	4
284	4	2	284	5
285	3	0	285	6
286	4	1	286	2
287	3	2	287	6
288	4	0	288	5
289	3	2	289	1
290	5	1	290	8
291	5	2	291	6
292	3	2	292	2
293	3	1	293	6
294	3	1	294	6
295	4	2	295	3
296	4	4	296	4
297	3	3	297	5
298	5	0	298	6
299	3	2	299	6
300	3	2	300	6
\.


--
-- TOC entry 2184 (class 0 OID 0)
-- Dependencies: 181
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 6, true);


--
-- TOC entry 2170 (class 0 OID 29594)
-- Dependencies: 186
-- Data for Name: management; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY management (id, date_from, date_to, manager_id, sector_id) FROM stdin;
1	1956-08-03 07:24:16	\N	1	1
2	1986-08-25 07:18:39	\N	2	2
3	1996-08-22 15:53:53	\N	3	3
4	2000-02-15 05:49:31	\N	4	4
5	2011-12-20 23:26:41	\N	5	5
6	2011-05-05 09:49:58	\N	6	6
7	1960-02-12 17:01:37	\N	7	7
8	1992-07-22 16:56:07	\N	8	8
9	1988-04-22 18:35:16	\N	9	9
10	1975-10-23 20:11:00	\N	10	10
\.


--
-- TOC entry 2171 (class 0 OID 29599)
-- Dependencies: 187
-- Data for Name: manager; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY manager (id, city, email, first_name, last_name, phone_number, postal_code, street) FROM stdin;
1	Latacunga	brichardson0@mayoclinic.com	Barbara	Richardson	593-(518)142-1628	581-08-6285	Randy
2	Fengpo	progers1@flavors.me	Phyllis	Rogers	86-(135)419-9252	205-09-9061	Express
3	Yangzi Jianglu	brobertson2@google.co.uk	Brenda	Robertson	86-(577)185-1560	749-78-0807	Forest Run
4	Yanbei	gmatthews3@mozilla.com	Gerald	Matthews	86-(181)420-9847	824-82-2097	Lakewood
5	Hamburg	akelley4@berkeley.edu	Anne	Kelley	49-(670)974-8845	758-67-9100	Fairview
6	Casa Nova	dvasquez5@cyberchimps.com	Dennis	Vasquez	351-(331)869-7035	412-70-5077	Mccormick
7	Halmstad	jroberts6@networkadvertising.org	Jason	Roberts	46-(761)387-4696	721-28-2629	Almo
8	Jablonec nad Jizerou	cmartinez7@hibu.com	Craig	Martinez	420-(505)798-0822	757-34-7950	6th
9	General La Madrid	mrichardson8@soup.io	Mark	Richardson	54-(961)502-4581	103-99-9341	Laurel
10	Cergy-Pontoise	rrogers9@hud.gov	Roger	Rogers	33-(343)463-2538	130-50-6647	Lerdahl
11	Changshan	lhendersona@google.pl	Linda	Henderson	86-(100)932-1398	518-19-1841	Crowley
12	Lila	ajacobsb@wix.com	Anna	Jacobs	63-(696)189-0461	725-84-6501	Gateway
13	Santo Domingo	ehunterc@gizmodo.com	Earl	Hunter	63-(329)621-4611	800-01-3172	Truax
14	Íquira	wknightd@ucoz.ru	William	Knight	57-(389)102-3947	494-49-7213	Iowa
15	Krmelín	cwhitee@feedburner.com	Charles	White	420-(498)893-0866	666-09-5346	Utah
16	Iradan	cgordonf@sciencedirect.com	Carol	Gordon	996-(229)857-3590	197-60-6714	Kenwood
17	Łęki	cmillsg@google.com.br	Carlos	Mills	48-(363)720-0459	313-78-6734	Eggendart
18	Kansas City	rperezh@phoca.cz	Ruby	Perez	1-(816)634-3013	884-53-3620	Shoshone
19	Sumoto	aporteri@unicef.org	Andrew	Porter	81-(583)866-4636	496-34-1596	Service
20	Si Racha	ehowellj@infoseek.co.jp	Earl	Howell	66-(644)113-6185	634-57-0054	Lakewood Gardens
21	Canmang	dchapmank@businessinsider.com	Debra	Chapman	86-(767)319-1873	675-93-8478	Melrose
22	La Unión	mperkinsl@netscape.com	Melissa	Perkins	503-(797)122-4714	351-61-4644	Hollow Ridge
23	Moñitos	clarsonm@europa.eu	Christopher	Larson	57-(596)528-2944	714-03-7853	Dryden
24	Zhangcunping	jfostern@about.me	Joan	Foster	86-(765)867-1658	675-10-7315	Cottonwood
25	Tampa	pphillipso@furl.net	Patricia	Phillips	1-(813)406-6267	962-31-7890	Mallory
26	Xinmin	tcookp@tripadvisor.com	Theresa	Cook	86-(375)985-2752	925-61-4204	Ronald Regan
27	Shido	kfranklinq@umn.edu	Kathleen	Franklin	81-(729)431-9029	498-64-3262	Ludington
28	Stari Bar	ngeorger@hubpages.com	Norma	George	382-(644)995-9653	472-27-5784	Dakota
29	Nanterre	dholmess@dion.ne.jp	Donald	Holmes	33-(149)820-2236	630-05-1575	Amoth
30	Batibati	hturnert@mapquest.com	Helen	Turner	62-(842)113-3915	210-93-8372	Surrey
31	Petani	phughesu@ebay.com	Pamela	Hughes	62-(610)440-7413	386-61-2100	Garrison
32	Dalang	lhudsonv@yelp.com	Linda	Hudson	86-(104)340-1629	722-97-0812	Mcbride
33	Huaniao	iwoodw@cmu.edu	Irene	Wood	86-(853)537-0322	295-35-3678	Golden Leaf
34	Anastácio	sfullerx@japanpost.jp	Samuel	Fuller	55-(422)768-5147	487-07-5440	Banding
35	Beberibe	crichardsy@yolasite.com	Carolyn	Richards	55-(951)945-8845	372-95-1627	Westend
36	Dongtian	cmartinezz@macromedia.com	Carol	Martinez	86-(926)722-3772	912-87-6417	Pepper Wood
37	Pamoyanan	bmurphy10@twitpic.com	Brenda	Murphy	62-(851)443-1981	351-76-4369	Sunbrook
38	Ruyigi	boliver11@blogger.com	Brian	Oliver	257-(632)999-8578	911-01-7384	Arapahoe
39	Río Blanquito	rriley12@tripod.com	Russell	Riley	504-(218)204-5993	980-66-4006	Duke
40	Laxou	ascott13@wikipedia.org	Alan	Scott	33-(810)429-8329	238-83-7425	Knutson
41	Karasuk	alawrence14@barnesandnoble.com	Anne	Lawrence	7-(752)547-0281	901-07-9514	Arizona
42	Azteca	bgreen15@sourceforge.net	Bonnie	Green	52-(893)830-9094	549-89-6327	Graedel
43	Tottori	lryan16@yahoo.com	Louise	Ryan	81-(526)265-1360	214-83-4516	Burning Wood
44	Jinhua	gduncan17@etsy.com	Gloria	Duncan	86-(289)946-6097	224-94-6296	Kinsman
45	Aksu	wgarza18@cyberchimps.com	Wayne	Garza	7-(693)173-1723	709-58-8053	Superior
46	Ladoeiro	alynch19@timesonline.co.uk	Antonio	Lynch	351-(346)832-1771	687-08-4577	Grasskamp
47	Hongshanyao	bgray1a@list-manage.com	Betty	Gray	86-(285)407-5129	609-48-4232	Rusk
48	Rendui	mwebb1b@homestead.com	Melissa	Webb	86-(161)822-0117	556-00-4539	Basil
49	Yafan	aross1c@google.com.br	Andrea	Ross	86-(584)303-7047	350-38-8736	Nancy
50	Kitahiroshima	mhoward1d@infoseek.co.jp	Martin	Howard	81-(436)998-2912	914-11-3724	Comanche
51	Uva	hlynch1e@php.net	Helen	Lynch	7-(684)608-4619	964-06-3554	Mosinee
52	Pokrovskoye-Streshnëvo	jlynch1f@flickr.com	Jonathan	Lynch	7-(904)562-4686	785-05-2021	Helena
53	Atikokan	hwatson1g@drupal.org	Harry	Watson	1-(683)983-5009	454-39-8110	Forest
54	Néa Palátia	mjacobs1h@netlog.com	Mary	Jacobs	30-(682)978-6298	256-68-4237	Hooker
55	Buriti Bravo	dwilson1i@state.gov	Donna	Wilson	55-(321)519-0278	584-75-0388	Cody
56	Žagarė	hrodriguez1j@pbs.org	Henry	Rodriguez	370-(339)885-9764	687-38-4800	Westridge
57	Zelenodolsk	llarson1k@yellowpages.com	Lisa	Larson	7-(763)611-5467	325-61-2238	Express
58	Montélimar	jhowell1l@storify.com	Juan	Howell	33-(203)213-4022	530-03-4354	Hermina
59	Argasari	jlarson1m@multiply.com	Joshua	Larson	62-(664)929-5293	436-68-2515	John Wall
60	Romilly-sur-Seine	gmurphy1n@mapquest.com	George	Murphy	33-(770)858-6550	270-23-9167	Eggendart
61	Dongpu	jfowler1o@google.nl	Jacqueline	Fowler	86-(101)445-8200	615-59-4175	Victoria
62	Cardal	hgonzales1p@topsy.com	Helen	Gonzales	598-(948)712-8222	350-97-9071	Milwaukee
63	Jingtou	dchapman1q@ezinearticles.com	Donald	Chapman	86-(538)123-2852	257-42-3085	Lyons
64	Huacaschuque	jcarter1r@sourceforge.net	Jennifer	Carter	51-(294)617-7762	793-57-3786	Meadow Ridge
65	Krajan Satu	aclark1s@hao123.com	Andrea	Clark	62-(622)632-4412	576-37-3289	Ronald Regan
66	Feondari	dnichols1t@washington.edu	Debra	Nichols	62-(363)499-6727	425-46-3961	Londonderry
67	Nykvarn	jkennedy1u@shareasale.com	Jimmy	Kennedy	46-(605)953-6090	397-17-4489	3rd
68	Nieborów	kmorris1v@ebay.co.uk	Karen	Morris	48-(654)737-9635	893-16-4643	Fuller
69	Jishi	lvasquez1w@va.gov	Lisa	Vasquez	86-(681)418-7040	861-04-2811	Red Cloud
70	Kanoya	rtucker1x@archive.org	Ronald	Tucker	81-(433)834-9556	942-65-1969	Brickson Park
71	Kaindy	abradley1y@yahoo.com	Andrew	Bradley	996-(659)595-9626	191-23-7639	Vidon
72	Baş Göynük	mdixon1z@hao123.com	Martha	Dixon	994-(997)413-6490	317-42-7909	Sachs
73	Mont-Joli	jmatthews20@newsvine.com	Julia	Matthews	1-(721)866-3711	174-62-0669	Lindbergh
74	Sukasirna	abryant21@ustream.tv	Amanda	Bryant	62-(194)840-3928	198-35-5786	Crowley
75	Thulamahashi	aowens22@yolasite.com	Ashley	Owens	27-(867)857-3111	133-25-3566	Ramsey
76	Gostynin	bray23@bing.com	Brandon	Ray	48-(763)480-9197	699-15-6513	Summerview
77	Zhlobin	pcarroll24@ycombinator.com	Peter	Carroll	375-(231)668-7044	876-32-1394	Lotheville
78	Lidingö	jalvarez25@oakley.com	Joshua	Alvarez	46-(351)939-3300	466-95-9141	Holmberg
79	Vicente Guerrero	nramirez26@spotify.com	Nicholas	Ramirez	52-(486)542-2412	378-32-6617	Comanche
80	Caqu	swood27@chron.com	Susan	Wood	86-(387)475-2495	705-94-2735	Ilene
81	Krasnodar	nevans28@redcross.org	Nancy	Evans	7-(844)665-2891	629-99-5111	Summit
82	K Bang	jhowell29@arstechnica.com	Jacqueline	Howell	84-(170)864-4884	362-22-7326	Jana
83	Jintan	rjones2a@huffingtonpost.com	Randy	Jones	86-(350)957-7665	984-18-6205	Warbler
84	Hamburg	agardner2b@ustream.tv	Anne	Gardner	49-(347)266-1183	413-80-0402	Chive
85	El Limon	jspencer2c@google.com	Jimmy	Spencer	52-(361)635-4532	131-16-5627	Stuart
86	Iset’	dtorres2d@zimbio.com	Denise	Torres	7-(155)415-1919	493-19-7958	Macpherson
87	Fengcheng	tdunn2e@bbb.org	Timothy	Dunn	86-(255)373-4619	972-87-7777	Fisk
88	Houston	dpayne2f@jiathis.com	Daniel	Payne	1-(832)474-5776	414-03-3581	Coolidge
89	Malianzhuang	dwallace2g@ebay.co.uk	Doris	Wallace	86-(402)133-8703	879-36-0172	Darwin
90	Little Current	mmorrison2h@hostgator.com	Mildred	Morrison	1-(845)250-0269	928-30-4399	Brown
91	Gibbons	ahunter2i@washington.edu	Annie	Hunter	1-(776)122-3816	143-50-0992	Fallview
92	Bentar Girang	jcox2j@samsung.com	Jacqueline	Cox	62-(169)917-3930	219-49-0520	Old Shore
93	Bzenec	rlittle2k@dell.com	Rose	Little	420-(580)211-5696	350-87-6222	Chive
94	Остров Пасхи	coliver2l@sphinn.com	Carolyn	Oliver	56-(517)367-5725	587-58-2179	Chive
95	Kanália	acampbell2m@ihg.com	Anne	Campbell	30-(544)545-1359	434-27-8960	Pawling
96	Tabant	drice2n@sbwire.com	Dorothy	Rice	212-(949)191-4604	703-02-2958	Chinook
97	Desa Margaluyu	tcollins2o@chicagotribune.com	Thomas	Collins	62-(401)949-8617	407-00-9430	Thompson
98	Могила	wreynolds2p@netlog.com	William	Reynolds	389-(526)917-2413	741-01-1220	Marquette
99	Kunsan	ecarroll2q@time.com	Eugene	Carroll	82-(714)325-4617	240-08-9086	Corscot
100	Nepomuceno	cdixon2r@infoseek.co.jp	Carol	Dixon	55-(821)607-2677	247-88-5370	Caliangt
\.


--
-- TOC entry 2172 (class 0 OID 29607)
-- Dependencies: 188
-- Data for Name: owner; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY owner (id, city, email, first_name, last_name, phone_number, postal_code, street) FROM stdin;
1	Papelón	astone0@symantec.com	Annie	Stone	58-(937)266-9572	662-40-2572	Drewry
2	Beichan	ahudson1@netscape.com	Ashley	Hudson	86-(918)975-6573	535-64-0337	Linden
3	Silvares	hgibson2@google.es	Harold	Gibson	351-(412)974-3226	169-23-4470	International
4	Laiguangying	bmedina3@ucsd.edu	Brenda	Medina	86-(236)893-7942	889-02-6171	Sherman
5	Shancheng	gelliott4@amazon.co.uk	George	Elliott	86-(340)510-1996	259-16-2711	Hazelcrest
6	Ermidas do Sado	mfox5@mediafire.com	Mary	Fox	351-(978)354-6423	896-63-2027	Sommers
7	Karangkeng	dhill6@aol.com	Debra	Hill	62-(459)684-3258	190-30-3605	Valley Edge
8	Laval	swoods7@netscape.com	Sean	Woods	1-(321)844-6398	893-56-8910	Prentice
9	Antipolo	gbrown8@mozilla.com	Gregory	Brown	63-(735)837-8510	980-63-6383	Logan
10	Ierápetra	wwright9@bravesites.com	Willie	Wright	30-(941)782-8486	128-48-8739	Sheridan
11	Springfield	gmontgomerya@chron.com	Gary	Montgomery	1-(571)939-3925	749-13-5052	Clove
12	Gornje Moštre	lkingb@vinaora.com	Lois	King	387-(210)661-8818	241-61-1948	Maple Wood
13	Telouet	mmorenoc@live.com	Margaret	Moreno	212-(325)588-3617	137-68-3058	Crowley
14	Ban Lŭng	rhayesd@fotki.com	Russell	Hayes	855-(524)167-2996	488-14-4807	Trailsway
15	Binawara	aalexandere@theatlantic.com	Adam	Alexander	62-(806)639-9117	367-02-1855	Boyd
16	Gibato	sbowmanf@examiner.com	Sarah	Bowman	63-(625)312-4090	448-89-8030	Banding
17	Esquipulas	hfosterg@wp.com	Helen	Foster	506-(756)816-1939	221-95-7918	Roxbury
18	Barlinek	jwilliamsh@discovery.com	Jeremy	Williams	48-(493)732-5695	219-32-8248	Waubesa
19	Buruanga	scooki@twitpic.com	Steve	Cook	63-(345)884-8129	281-57-7579	Manufacturers
20	Kijini	lcastilloj@ow.ly	Louis	Castillo	255-(243)838-8602	814-45-7575	Dryden
21	Ar Rudayyif	mramirezk@youtube.com	Margaret	Ramirez	216-(555)394-7991	523-21-2380	Oakridge
22	Pallanchacra	lortizl@bigcartel.com	Lori	Ortiz	51-(336)965-6158	667-80-5102	Stephen
23	Varser	dramosm@deviantart.com	Diane	Ramos	374-(693)798-6257	392-88-9834	Homewood
24	El Alamo	jgeorgen@bloglines.com	Julie	George	52-(428)294-7665	869-79-3404	Raven
25	Delcevo	solivero@drupal.org	Scott	Oliver	389-(579)707-7621	611-80-0012	Maple Wood
26	Pruszcz	jmontgomeryp@ca.gov	Justin	Montgomery	48-(375)128-1419	546-14-6048	Morrow
27	Madrid	erodriguezq@discuz.net	Emily	Rodriguez	34-(437)587-0800	731-44-8860	Killdeer
28	Zastron	acoler@newyorker.com	Alice	Cole	27-(617)761-7955	383-98-8165	Reinke
29	Maibu	cparkers@google.com.hk	Carl	Parker	63-(332)287-8707	920-84-0337	Fairfield
30	Varnávas	bportert@rediff.com	Brenda	Porter	30-(173)430-0182	373-57-6264	Hagan
31	Kallinge	mkimu@posterous.com	Marie	Kim	46-(835)715-9264	893-89-9939	Ridgeview
32	Bukui	kramirezv@businesswire.com	Kathy	Ramirez	86-(472)749-8083	691-02-3634	Southridge
33	Hultsfred	gpiercew@tripod.com	Gloria	Pierce	46-(823)838-5317	932-83-9556	Bobwhite
34	Tessalit	rmitchellx@topsy.com	Russell	Mitchell	223-(477)950-2154	246-79-3729	Paget
35	Rongai	bharrisy@bbb.org	Brandon	Harris	254-(752)726-8034	115-14-6138	Little Fleur
36	Bantul	bbowmanz@istockphoto.com	Brian	Bowman	62-(824)871-5335	889-06-6697	Springview
37	Tysmenychany	abrown10@admin.ch	Anna	Brown	380-(507)643-1819	896-48-1055	Reindahl
38	Nerekhta	kbanks11@chron.com	Karen	Banks	7-(407)393-7304	997-35-8562	Hagan
39	Tongyuanpu	efields12@dyndns.org	Evelyn	Fields	86-(231)238-8571	958-99-4575	Melrose
40	Garajati	sjohnston13@wired.com	Shirley	Johnston	62-(946)326-9651	872-87-2398	Jackson
41	Lucma	bmills14@icio.us	Brenda	Mills	51-(857)977-5074	786-87-0136	Swallow
42	Buenavista	rjohnston15@hud.gov	Rachel	Johnston	52-(146)221-0932	665-01-0432	Johnson
43	Tiksi	lgonzalez16@friendfeed.com	Linda	Gonzalez	7-(214)825-3017	900-71-0672	Spohn
44	Fengjiang	gwest17@wix.com	Gregory	West	86-(213)747-1541	102-57-4844	Glendale
45	Campo	gharper18@scribd.com	George	Harper	351-(171)282-9232	739-32-2708	Forest Run
46	La Soledad	ajohnston19@spiegel.de	Aaron	Johnston	52-(582)740-4582	228-56-6681	Farwell
47	Bogoria	ebanks1a@harvard.edu	Edward	Banks	48-(995)263-0031	805-59-9110	Monica
48	Sumberagung	djohnson1b@walmart.com	Doris	Johnson	62-(979)618-8931	476-26-4116	Erie
49	Berehomet	preid1c@goo.gl	Phillip	Reid	380-(453)801-4925	164-75-1530	Mockingbird
50	Haz-Zebbug	kcarpenter1d@shutterfly.com	Kimberly	Carpenter	356-(546)874-9576	809-79-4426	Sherman
51	Kalodu	dwilliamson1e@harvard.edu	Donna	Williamson	62-(262)849-9964	719-61-3253	Mayer
52	El Paso	wclark1f@toplist.cz	William	Clark	1-(915)988-6549	739-47-8671	Oxford
53	Pointe-à-Pitre	jfisher1g@smugmug.com	James	Fisher	590-(857)378-0831	356-89-2597	Shoshone
54	Santisimo Rosario	rwood1h@purevolume.com	Russell	Wood	63-(115)703-4468	107-69-7008	Banding
55	Pangascasan	jfox1i@umich.edu	Jean	Fox	63-(648)461-0507	520-35-0674	Shopko
56	Macia	rcruz1j@examiner.com	Robert	Cruz	258-(517)335-4854	754-09-0640	Fairview
57	Araguari	mjackson1k@jalbum.net	Marilyn	Jackson	55-(962)493-9518	276-74-7546	Hanover
58	Jiangkou	pday1l@slashdot.org	Paula	Day	86-(520)507-8289	561-08-4564	Bay
59	Labrang	cwilliamson1m@elpais.com	Carolyn	Williamson	86-(103)292-9603	913-53-6173	Barnett
60	El Llano	lmurray1n@opensource.org	Laura	Murray	504-(809)688-9980	946-65-6280	South
61	Měnín	drussell1o@last.fm	Daniel	Russell	420-(397)469-5527	989-30-9467	Dayton
62	Carusucan	cweaver1p@mysql.com	Clarence	Weaver	63-(588)291-5847	677-91-1534	Kedzie
63	Lurut	amoore1q@washingtonpost.com	Aaron	Moore	62-(544)692-6824	922-56-1934	Cody
64	Puerto Berrío	smartinez1r@google.fr	Sharon	Martinez	57-(388)748-7965	975-67-9567	Weeping Birch
65	Trondheim	rweaver1s@deliciousdays.com	Roger	Weaver	47-(556)773-6535	585-54-9242	Autumn Leaf
66	Centenary	smurray1t@artisteer.com	Samuel	Murray	263-(447)654-5632	450-18-2555	Mcguire
67	Ḩalāwah	arodriguez1u@prlog.org	Anthony	Rodriguez	962-(399)268-9865	367-13-8829	Doe Crossing
68	Alvaro Obregon	kalexander1v@stumbleupon.com	Kelly	Alexander	52-(422)372-9028	765-00-7425	Superior
69	Salitrillos	amatthews1w@tmall.com	Amanda	Matthews	506-(848)417-0076	317-35-8678	Sutherland
70	Gorskaya	hmcdonald1x@chronoengine.com	Harold	Mcdonald	7-(488)214-6515	444-20-0667	Express
71	Aksakovo	dwebb1y@tripod.com	Donald	Webb	359-(261)206-4296	823-49-7305	Lakeland
72	Balzers	adiaz1z@sourceforge.net	Albert	Diaz	423-(700)745-6127	100-41-6969	Crowley
73	Tidaholm	jarmstrong20@youku.com	Jean	Armstrong	46-(849)396-8367	183-84-3266	Dovetail
74	Shuiquan	lmitchell21@jiathis.com	Laura	Mitchell	86-(759)479-1937	330-37-1075	Golden Leaf
75	Kamiiso	jmurphy22@behance.net	Julia	Murphy	81-(496)400-4864	130-43-1070	Killdeer
76	Muruy	pcook23@dailymotion.com	Pamela	Cook	62-(204)119-8071	440-51-0279	Bluestem
77	Santa Justina	glopez24@woothemes.com	Gregory	Lopez	63-(236)290-6791	264-91-5126	Gale
78	Zhukovskiy	mwarren25@dropbox.com	Marilyn	Warren	7-(232)614-6483	859-52-3766	Prentice
79	Iwye	rfisher26@amazon.de	Ronald	Fisher	375-(334)191-9394	476-70-5810	Boyd
80	Xigangzi	shenry27@imdb.com	Stephanie	Henry	86-(845)170-8036	503-32-7593	Jenna
81	Reriz	lalvarez28@nps.gov	Lois	Alvarez	351-(346)632-3790	849-29-2063	International
82	Laranjal Paulista	mreid29@cnbc.com	Martha	Reid	55-(266)563-5155	520-39-4189	Warbler
83	Pasar Kidul	jgordon2a@ebay.com	Joan	Gordon	62-(201)794-8715	214-56-8674	Bartillon
84	Fenais da Ajuda	sjacobs2b@networkadvertising.org	Sean	Jacobs	351-(444)428-1996	942-87-0981	Claremont
85	Conception Bay South	jbarnes2c@t-online.de	John	Barnes	1-(664)266-1140	752-55-2560	Butterfield
86	Huishi	tking2d@omniture.com	Todd	King	86-(496)512-8181	764-38-3416	Green
87	Baliuag	egreen2e@google.com.hk	Eugene	Green	63-(331)976-6471	712-78-4887	Sullivan
88	Sungayang	hfisher2f@disqus.com	Howard	Fisher	62-(962)105-7506	694-55-5101	Straubel
89	Maní	jcook2g@usda.gov	Jerry	Cook	57-(365)343-0697	766-82-2547	Coleman
90	Baiqiao	scampbell2h@bing.com	Shawn	Campbell	86-(942)918-5906	855-17-7651	Vahlen
91	Mshinskaya	cboyd2i@a8.net	Carolyn	Boyd	7-(199)454-8938	461-20-5862	Mayer
92	Saint-Denis	pgardner2j@furl.net	Patricia	Gardner	33-(132)965-3516	346-12-4632	Dennis
93	Al Masallamiyya	vcook2k@reuters.com	Victor	Cook	249-(135)655-6989	404-20-9496	Northfield
94	Taipingchuan	rpeterson2l@yandex.ru	Roger	Peterson	86-(172)885-3226	344-57-1481	Carpenter
95	Koupéla	agriffin2m@elpais.com	Angela	Griffin	226-(439)955-7246	425-89-5044	Monterey
96	Tours	mcole2n@vk.com	Matthew	Cole	33-(244)606-2890	888-33-3951	Vera
97	Jayanca	jboyd2o@icq.com	John	Boyd	51-(778)752-7917	642-31-5361	Oriole
98	Pizarro	rlawrence2p@furl.net	Rose	Lawrence	57-(417)680-1392	517-27-3399	Fair Oaks
99	Mosina	gadams2q@xing.com	Gloria	Adams	48-(573)327-0140	444-42-8490	Fieldstone
100	João Câmara	amorrison2r@themeforest.net	Aaron	Morrison	55-(951)407-1751	960-92-2912	Wayridge
101	Talitsa	akelly0@google.com.br	Alice	Kelly	7-(256)765-1491	\N	353 Memorial Terrace
102	Jandira	rmartin1@archive.org	Robert	Martin	55-(458)141-6094	\N	2 Gale Terrace
103	Kouzhen	cweaver2@cloudflare.com	Catherine	Weaver	86-(840)999-7216	\N	73212 Porter Circle
104	Narva-Jõesuu	jstevens3@storify.com	Janet	Stevens	372-(662)727-5657	\N	608 Northfield Trail
105	Laiponda	rking4@dell.com	Ruby	King	62-(795)333-9307	\N	1580 Havey Circle
106	Bethanie	mwells5@google.ru	Marie	Wells	264-(788)291-8393	\N	44730 Hoard Crossing
107	Macheke	hcoleman6@gov.uk	Henry	Coleman	263-(756)747-0166	\N	92 Di Loreto Plaza
108	Ngedhusuba	dwagner7@samsung.com	Donald	Wagner	62-(522)787-7141	\N	8 Sugar Avenue
109	Bayasgalant	dfox8@tinypic.com	Dennis	Fox	976-(171)805-3926	\N	60 Dakota Street
110	Lame	bgarrett9@sourceforge.net	Brandon	Garrett	234-(646)262-3638	\N	87065 2nd Alley
111	Looc	jramireza@elegantthemes.com	Jessica	Ramirez	63-(613)357-8560	\N	150 Sage Junction
112	Topory	kcruzb@nationalgeographic.com	Keith	Cruz	380-(451)148-7016	\N	714 Hansons Road
113	Skellefteå	hkellyc@jiathis.com	Harold	Kelly	46-(780)470-4307	931 57	58 1st Parkway
114	Portland	mlopezd@netlog.com	Maria	Lopez	1-(208)742-8119	97211	72 Lukken Avenue
115	Gagarin	cbradleye@answers.com	Craig	Bradley	374-(666)397-8150	\N	733 Meadow Valley Parkway
116	Nahiyat Ghammas	whowardf@wikia.com	William	Howard	964-(662)266-0855	\N	09 Toban Court
117	Lévis	rmedinag@artisteer.com	Roy	Medina	1-(216)923-3719	\N	5067 Bunting Drive
118	Drosáto	mandersonh@123-reg.co.uk	Michael	Anderson	30-(368)450-0942	\N	707 Melrose Lane
119	Yangchengzhuang	klopezi@amazon.de	Kathryn	Lopez	86-(441)398-6448	\N	26337 Corben Hill
120	Murcia	mgriffinj@yale.edu	Melissa	Griffin	63-(574)856-5220	\N	4206 Randy Drive
121	Zhongcun	jmccoyk@360.cn	Jonathan	Mccoy	86-(354)626-7564	\N	1494 Packers Terrace
122	Eldama Ravine	jdixonl@surveymonkey.com	Judith	Dixon	254-(348)251-9065	\N	79640 Wayridge Crossing
123	Lyon	rmarshallm@plala.or.jp	Raymond	Marshall	33-(479)815-6486	69413 CEDEX 06	9 Dunning Park
124	Jun’an	gandersonn@gnu.org	Gloria	Anderson	86-(422)939-8703	\N	4 Debs Place
125	Newton	mmillero@blogs.com	Melissa	Miller	44-(111)629-6807	IV1	0 Oakridge Circle
126	Périgny	gaustinp@cdc.gov	Gerald	Austin	33-(511)686-1996	17184 CEDEX	0 Cordelia Place
127	Salfīt	fhenryq@discuz.net	Frank	Henry	970-(346)490-1975	\N	41358 Nova Lane
128	Lavadorinhos	nbrooksr@google.es	Nicole	Brooks	351-(376)893-2946	4415-708	144 Ilene Hill
129	Shostka	rwilsons@storify.com	Ronald	Wilson	380-(591)386-3789	\N	6488 Crowley Point
130	Kahama	dkingt@ftc.gov	Dennis	King	255-(436)461-6152	\N	74776 6th Hill
131	Náchod	shunteru@wix.com	Samuel	Hunter	420-(677)842-1185	\N	96 Lakeland Parkway
132	Ngedhubasa	pallenv@wordpress.com	Patrick	Allen	62-(196)244-0144	\N	3871 Hagan Park
133	Chartres	kellisw@epa.gov	Karen	Ellis	33-(690)610-5753	28009 CEDEX	45 Nobel Avenue
134	Qiawan	ldayx@ehow.com	Linda	Day	86-(552)420-5017	\N	931 Shasta Road
135	Lansing	kkingy@blog.com	Karen	King	1-(517)832-2677	48919	1 Donald Hill
136	Copán	hjohnstonz@alexa.com	Harold	Johnston	504-(782)837-0984	\N	933 Goodland Alley
137	Obuasi	gflores10@google.de	Gerald	Flores	233-(520)902-6497	\N	54547 Logan Lane
138	Guadalupe	jroberts11@nationalgeographic.com	Jesse	Roberts	51-(961)570-4823	\N	079 Everett Terrace
139	Tabinay	hphillips12@yahoo.co.jp	Harold	Phillips	63-(363)456-7726	\N	25 Oneill Park
140	Voskresensk	bhughes13@weibo.com	Betty	Hughes	7-(509)793-1953	\N	93329 Heath Center
141	Campos	jburke14@last.fm	Joshua	Burke	351-(820)980-3259	4620-031	84133 Luster Plaza
142	Buenavista	cschmidt15@linkedin.com	Christina	Schmidt	57-(759)205-6302	\N	1 Merrick Parkway
143	Donggong	smorris16@eventbrite.com	Stephen	Morris	86-(662)526-3184	\N	155 Barby Crossing
144	Pingling	bwhite17@irs.gov	Billy	White	86-(973)287-4416	\N	74027 1st Point
145	Upper Hell's Gate	mwood18@wix.com	Mark	Wood	599-(954)267-7172	\N	16 Linden Lane
146	Sundbyberg	mmorrison19@deliciousdays.com	Martha	Morrison	46-(984)495-2044	174 49	54889 Onsgard Parkway
147	Kochetok	chansen1a@newyorker.com	Cheryl	Hansen	380-(574)417-4348	\N	69359 Gulseth Road
148	San Rafael	cberry1b@chronoengine.com	Craig	Berry	63-(351)723-0462	\N	77 Emmet Way
149	Tlogosari	hray1c@desdev.cn	Harry	Ray	62-(982)920-0008	\N	89524 Fulton Hill
150	Rosario de Mora	klynch1d@shutterfly.com	Kevin	Lynch	503-(384)129-8582	\N	652 Prentice Lane
151	Boac	kpatterson1e@so-net.ne.jp	Kenneth	Patterson	63-(504)903-6029	\N	261 Iowa Crossing
152	Chepo	sperez1f@google.it	Sandra	Perez	507-(411)579-8701	\N	343 Melody Circle
153	Boliney	tferguson1g@ezinearticles.com	Teresa	Ferguson	63-(246)680-4430	\N	3 Towne Place
154	Jevremovac	swest1h@time.com	Stephen	West	381-(871)486-9598	\N	1 Comanche Point
155	Hetang	awillis1i@amazonaws.com	Ann	Willis	86-(464)262-6175	\N	70 Orin Court
156	Tokorozawa	ebishop1j@gravatar.com	Edward	Bishop	81-(536)524-6760	\N	588 Hermina Way
157	Batad	jrogers1k@skype.com	Juan	Rogers	63-(600)143-1865	\N	08987 Hovde Road
158	Loum	thall1l@ebay.co.uk	Terry	Hall	237-(157)312-6981	\N	73 Fairfield Drive
159	San Antonio	dboyd1m@github.io	Deborah	Boyd	1-(210)219-1798	78215	0 High Crossing Pass
160	Wentang	cnguyen1n@edublogs.org	Carol	Nguyen	86-(574)405-2157	\N	95889 Weeping Birch Park
161	Le Mans	nperez1o@salon.com	Nancy	Perez	33-(975)530-6058	72100	9 Menomonie Street
162	Ciudad Ojeda	sevans1p@mapy.cz	Stephanie	Evans	58-(722)402-8133	\N	56962 Armistice Parkway
163	Thaton	talexander1q@tinypic.com	Tammy	Alexander	95-(705)664-0368	\N	14980 Goodland Center
164	José de Freitas	bblack1r@cbslocal.com	Barbara	Black	55-(828)540-3637	\N	9782 Esch Trail
165	Banqiao	rgardner1s@google.co.uk	Roger	Gardner	86-(541)771-7478	\N	58 Fairfield Court
166	Az Zarbah	jstanley1t@nih.gov	Joe	Stanley	963-(606)695-9490	\N	3 3rd Terrace
167	Thị Trấn Yên Thế	bhill1u@google.pl	Brandon	Hill	84-(475)767-0448	\N	13 Algoma Pass
168	Shalakusha	hrobinson1v@ucsd.edu	Heather	Robinson	7-(503)693-4998	\N	107 Chinook Pass
169	Debar	cnelson1w@mac.com	Carolyn	Nelson	389-(261)157-2256	\N	3743 Corscot Road
170	Shiogama	bcole1x@va.gov	Bonnie	Cole	81-(612)144-1883	\N	91 Lunder Circle
171	Zhemtala	trice1y@sun.com	Teresa	Rice	7-(446)524-2744	\N	0 Mcbride Lane
172	Svyetlahorsk	tbailey1z@epa.gov	Teresa	Bailey	375-(829)317-0797	\N	17 Bowman Plaza
173	Libacao	dmcdonald20@icq.com	Douglas	Mcdonald	63-(792)337-6955	\N	0778 Sunfield Plaza
174	Longmen	jpowell21@google.com.au	Juan	Powell	86-(208)928-2590	\N	6 Mcbride Terrace
175	Pangai	ahawkins22@feedburner.com	Andrea	Hawkins	676-(968)131-1003	\N	6693 Blackbird Way
176	Örebro	jmorgan23@samsung.com	John	Morgan	46-(810)578-7358	701 43	46 Village Green Alley
177	Portela	dweaver24@yahoo.com	Daniel	Weaver	351-(692)144-8950	4690-300	6 Anzinger Parkway
178	Manquiring	cperez25@about.com	Carl	Perez	63-(473)350-4915	\N	5 Vermont Court
179	Hujiagou	cortiz26@shinystat.com	Carl	Ortiz	86-(900)540-6116	\N	2 Melby Pass
180	Sidaurip	lmyers27@telegraph.co.uk	Larry	Myers	62-(110)960-5736	\N	3 Valley Edge Court
181	Nuasepu	rrose28@devhub.com	Roger	Rose	62-(972)419-1330	\N	04 Sutherland Park
182	Konispol	lprice29@walmart.com	Lisa	Price	355-(133)397-0671	\N	95013 Thompson Court
183	Богданци	ldavis2a@lulu.com	Linda	Davis	389-(986)700-3712	\N	15261 Hoard Road
184	Bayt ‘Īnūn	rwebb2b@flavors.me	Richard	Webb	970-(770)698-5223	\N	28675 Mayfield Parkway
185	Shchelkovo	cmatthews2c@purevolume.com	Christina	Matthews	7-(465)869-2363	\N	0 North Trail
186	Mananjary	dbrooks2d@1688.com	Donald	Brooks	261-(832)109-3561	\N	1 Johnson Alley
187	Évora	pstephens2e@ftc.gov	Patricia	Stephens	351-(624)982-0120	7000-062	2 Hintze Point
188	Budapest	tvasquez2f@bandcamp.com	Thomas	Vasquez	36-(363)701-5189	1147	49651 Bobwhite Terrace
189	Pueblo	gstevens2g@simplemachines.org	George	Stevens	1-(719)198-7500	81010	30430 Ludington Street
190	Taganskiy	gmccoy2h@go.com	Gary	Mccoy	7-(213)744-2656	\N	5 Holy Cross Alley
191	Hualian	rhudson2i@irs.gov	Rebecca	Hudson	886-(843)820-6966	\N	79021 Hazelcrest Road
192	Vrsi	sschmidt2j@utexas.edu	Samuel	Schmidt	385-(551)978-2153	\N	5 Barnett Avenue
193	Loreto	lyoung2k@hugedomains.com	Linda	Young	63-(909)565-0537	\N	98 Mallory Junction
194	Tangdong	rsimmons2l@google.it	Rebecca	Simmons	86-(823)474-1332	\N	61192 Columbus Road
195	Liangwa	cdean2m@addtoany.com	Christopher	Dean	86-(371)637-8840	\N	297 Hooker Park
196	Waddān	dbowman2n@google.com.br	Dennis	Bowman	218-(217)253-9880	\N	2 Hudson Street
197	Melfort	pmitchell2o@diigo.com	Patrick	Mitchell	1-(756)214-9142	\N	15 Aberg Avenue
198	Erfangping	jbrooks2p@behance.net	Jonathan	Brooks	86-(103)159-1675	\N	72426 Fremont Terrace
199	Janūb as Surrah	rday2q@house.gov	Roger	Day	965-(234)993-4906	\N	80774 Sauthoff Way
200	Czerwionka-Leszczyny	jolson2r@yellowbook.com	Julia	Olson	48-(316)221-6049	\N	67 Thompson Park
\.


--
-- TOC entry 2173 (class 0 OID 29615)
-- Dependencies: 189
-- Data for Name: rent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rent (id, date_from, date_to, grave_id, owner_id) FROM stdin;
1	2004-01-26 11:16:59	\N	1	31
2	1950-08-07 08:12:36	\N	2	86
3	1983-04-16 17:19:08	\N	3	69
4	1999-11-20 23:26:12	\N	4	92
5	1988-11-25 05:57:53	\N	5	58
6	2011-01-21 06:09:24	\N	6	200
7	2005-01-19 03:44:49	\N	7	76
8	1976-12-15 02:09:33	\N	8	88
9	1971-07-28 22:23:54	\N	9	153
10	2008-01-31 01:27:33	\N	10	126
11	1972-02-27 09:25:21	\N	11	162
12	2003-05-08 00:51:36	\N	12	188
13	1985-02-04 23:30:07	\N	13	172
14	1953-06-28 07:38:42	\N	14	57
15	1950-06-16 22:10:20	\N	15	31
16	1982-01-14 00:01:03	\N	16	25
17	2000-01-08 03:08:32	\N	17	153
18	1952-08-27 02:01:07	\N	18	173
19	2003-04-11 04:05:19	\N	19	33
20	1967-11-29 04:39:27	\N	20	176
21	1988-11-06 21:29:44	\N	21	173
22	1970-06-28 02:54:08	\N	22	80
23	1960-07-18 04:45:16	\N	23	187
24	2002-03-27 12:28:35	\N	24	119
25	2006-08-23 00:43:08	\N	25	128
26	1950-02-02 08:34:46	\N	26	24
27	1980-09-27 08:17:20	\N	27	4
28	1967-11-10 07:23:51	\N	28	60
29	2007-12-07 17:21:13	\N	29	136
30	2004-05-02 02:24:25	\N	30	93
31	1991-09-19 15:29:14	\N	31	132
32	1961-09-12 23:04:19	\N	32	49
33	1993-10-27 15:33:13	\N	33	77
34	2001-05-28 13:36:38	\N	34	169
35	1958-11-15 11:28:11	\N	35	114
36	1990-06-16 06:45:04	\N	36	2
37	1995-01-18 20:38:50	\N	37	175
38	2015-05-16 03:44:57	\N	38	163
39	1986-08-16 00:58:36	\N	39	192
40	1968-08-29 18:01:59	\N	40	22
41	1967-06-10 00:35:01	\N	41	110
42	1961-01-15 11:31:19	\N	42	192
43	1967-03-24 11:38:08	\N	43	121
44	1950-05-04 00:38:11	\N	44	96
45	2003-11-05 13:07:36	\N	45	198
46	1999-12-12 01:53:28	\N	46	108
47	1953-09-26 07:46:12	\N	47	150
48	1986-03-06 02:38:48	\N	48	138
49	1994-12-26 04:10:16	\N	49	84
50	2013-10-19 22:13:36	\N	50	153
51	1954-09-09 15:51:16	\N	51	137
52	1994-10-07 05:18:20	\N	52	118
53	1959-06-05 18:19:13	\N	53	88
54	1973-11-15 13:31:10	\N	54	115
55	1986-04-30 14:46:33	\N	55	153
56	1989-07-28 14:03:29	\N	56	35
57	2002-02-26 12:07:33	\N	57	158
58	2002-06-12 15:55:29	\N	58	98
59	1997-08-16 04:03:24	\N	59	151
60	2001-01-29 17:35:53	\N	60	164
61	1993-07-24 10:34:27	\N	61	97
62	1985-09-30 13:46:10	\N	62	3
63	2005-02-01 14:22:37	\N	63	26
64	2013-12-03 13:12:15	\N	64	197
65	2015-10-22 09:18:49	\N	65	77
66	1986-07-10 14:04:01	\N	66	87
67	1968-03-02 11:56:43	\N	67	126
68	1961-03-13 07:54:15	\N	68	26
69	1973-07-22 18:01:31	\N	69	102
70	1975-03-29 01:33:20	\N	70	135
71	2000-08-02 07:19:29	\N	71	31
72	1984-07-11 01:50:48	\N	72	140
73	1960-11-13 22:53:40	\N	73	78
74	1983-09-27 01:46:21	\N	74	166
75	1953-09-17 07:54:36	\N	75	126
76	1990-11-30 17:50:19	\N	76	140
77	2000-07-09 19:18:31	\N	77	143
78	1952-08-05 07:04:37	\N	78	119
79	2011-06-25 05:15:46	\N	79	31
80	1959-03-12 05:12:47	\N	80	132
81	1993-07-20 16:06:07	\N	81	68
82	2006-03-01 22:43:06	\N	82	126
83	1972-06-03 08:28:37	\N	83	95
84	1996-12-24 15:54:41	\N	84	52
85	1990-09-30 03:43:53	\N	85	32
86	1989-07-31 03:22:10	\N	86	168
87	1969-02-03 03:43:14	\N	87	176
88	1963-08-19 13:35:13	\N	88	107
89	1995-12-29 17:58:21	\N	89	11
90	1962-06-10 19:32:03	\N	90	187
91	1982-04-17 21:38:47	\N	91	60
92	2004-12-31 01:07:43	\N	92	22
93	1983-07-11 09:49:00	\N	93	92
94	1985-11-20 21:34:27	\N	94	32
95	2005-12-01 14:44:15	\N	95	105
96	1983-07-26 17:52:28	\N	96	85
97	1988-05-12 03:07:41	\N	97	107
98	2001-11-08 19:27:26	\N	98	74
99	2011-03-13 13:56:44	\N	99	194
100	2011-12-21 21:23:38	\N	100	53
101	1960-06-16 05:19:30	\N	101	38
102	1984-08-21 08:38:16	\N	102	72
103	1967-04-09 22:16:21	\N	103	101
104	1954-07-21 00:15:34	\N	104	122
105	2000-11-08 14:39:31	\N	105	168
106	1978-08-13 07:15:44	\N	106	88
107	1980-05-10 01:27:15	\N	107	65
108	1954-06-18 19:20:38	\N	108	146
109	1993-09-20 11:48:15	\N	109	14
110	1989-09-07 11:27:14	\N	110	67
111	2007-04-21 22:25:08	\N	111	61
112	1975-04-09 09:32:53	\N	112	48
113	1978-07-02 01:17:04	\N	113	30
114	1950-08-08 22:44:30	\N	114	60
115	1955-12-28 16:29:21	\N	115	83
116	1991-03-17 02:46:28	\N	116	43
117	1986-09-27 13:47:23	\N	117	185
118	2011-10-29 14:04:55	\N	118	185
119	1972-01-15 17:13:58	\N	119	7
120	2013-09-12 02:05:19	\N	120	71
121	1977-07-20 00:02:03	\N	121	102
122	2014-12-22 11:26:10	\N	122	83
123	1957-11-08 22:07:20	\N	123	76
124	1972-09-27 10:02:29	\N	124	182
125	2001-07-13 22:54:51	\N	125	170
126	1954-08-19 12:57:12	\N	126	31
127	2005-10-14 19:29:12	\N	127	173
128	2001-12-07 10:51:20	\N	128	49
129	1979-12-05 11:32:02	\N	129	197
130	1994-01-01 21:54:37	\N	130	63
131	1985-09-20 03:40:35	\N	131	21
132	2006-11-26 20:30:09	\N	132	179
133	1988-02-09 03:07:21	\N	133	117
134	1988-01-16 06:01:18	\N	134	161
135	1952-09-24 16:24:57	\N	135	43
136	2001-08-16 07:34:09	\N	136	192
137	2006-01-26 11:21:46	\N	137	43
138	2002-06-08 01:09:51	\N	138	182
139	2013-06-13 18:30:14	\N	139	29
140	2014-11-21 05:01:25	\N	140	86
141	1962-09-13 15:45:12	\N	141	80
142	1979-05-12 00:41:11	\N	142	190
143	1960-02-08 08:22:09	\N	143	60
144	1971-09-06 11:00:03	\N	144	153
145	2016-02-26 12:56:49	\N	145	67
146	2007-09-17 19:18:58	\N	146	194
147	1992-01-28 22:53:54	\N	147	80
148	1984-10-26 13:00:50	\N	148	66
149	1996-01-30 17:13:59	\N	149	156
150	1955-05-18 17:07:52	\N	150	127
151	2011-11-27 14:51:51	\N	151	70
152	1951-12-29 19:45:31	\N	152	110
153	1964-01-29 12:52:24	\N	153	51
154	1970-09-04 18:14:38	\N	154	61
155	1981-02-04 05:32:07	\N	155	147
156	1993-09-21 08:34:06	\N	156	38
157	2005-04-04 13:33:56	\N	157	19
158	1967-09-22 12:31:13	\N	158	107
159	1950-01-16 22:30:45	\N	159	31
160	1970-08-13 11:54:57	\N	160	157
161	1982-09-22 18:38:50	\N	161	110
162	1961-07-08 22:13:16	\N	162	70
163	2010-11-02 13:39:13	\N	163	104
164	1981-10-01 07:25:22	\N	164	19
165	1973-12-12 09:21:33	\N	165	117
166	2011-08-09 02:43:41	\N	166	45
167	1970-07-03 07:00:01	\N	167	164
168	1951-11-13 12:21:14	\N	168	130
169	1992-10-29 19:01:32	\N	169	180
170	1981-11-02 13:58:47	\N	170	30
171	2010-01-13 01:38:24	\N	171	80
172	1997-08-04 20:33:53	\N	172	138
173	1953-07-02 06:09:49	\N	173	44
174	2004-01-13 18:31:20	\N	174	128
175	1974-02-02 23:31:53	\N	175	42
176	2014-10-09 14:11:53	\N	176	194
177	1954-05-27 18:19:17	\N	177	96
178	1987-01-29 04:31:45	\N	178	195
179	2003-08-04 19:11:39	\N	179	92
180	1980-11-06 01:30:38	\N	180	130
181	1996-07-09 00:52:15	\N	181	83
182	1976-01-25 12:47:37	\N	182	112
183	1993-10-19 16:02:53	\N	183	109
184	1976-05-27 14:39:54	\N	184	175
185	1963-05-06 21:51:45	\N	185	162
186	1965-05-20 17:57:41	\N	186	100
187	1979-08-31 16:38:58	\N	187	155
188	2004-07-05 10:40:03	\N	188	123
189	1973-08-11 16:02:20	\N	189	45
190	1959-05-14 02:06:19	\N	190	33
191	1961-03-12 14:16:14	\N	191	68
192	1982-09-25 09:48:12	\N	192	36
193	1956-12-19 18:20:49	\N	193	148
194	1975-02-08 18:57:43	\N	194	158
195	1983-05-23 22:57:36	\N	195	93
196	2010-10-11 00:37:20	\N	196	174
197	1966-07-29 00:55:44	\N	197	161
198	1990-10-06 10:19:16	\N	198	28
199	1998-08-04 01:41:11	\N	199	61
200	1965-05-13 14:34:24	\N	200	40
201	1959-01-26 17:34:40	\N	201	102
202	2009-08-15 20:26:18	\N	202	175
203	1980-04-26 02:22:22	\N	203	88
204	1986-04-05 04:49:18	\N	204	105
205	1986-02-02 23:07:00	\N	205	98
206	2008-04-11 15:42:16	\N	206	165
207	1965-10-24 14:30:14	\N	207	181
208	1961-03-30 23:01:52	\N	208	87
209	1999-10-25 06:36:19	\N	209	123
210	2007-07-18 10:42:52	\N	210	38
211	2010-06-30 13:51:04	\N	211	128
212	1976-01-13 07:13:34	\N	212	182
213	1984-10-13 00:17:57	\N	213	70
214	2014-03-25 05:33:34	\N	214	198
215	1986-01-26 21:07:14	\N	215	157
216	1957-02-12 19:31:11	\N	216	34
217	1990-03-29 15:42:34	\N	217	93
218	1983-05-10 14:49:06	\N	218	198
219	1984-06-06 08:22:41	\N	219	142
220	1959-12-06 01:11:25	\N	220	92
221	2001-03-21 22:38:13	\N	221	22
222	1989-01-20 21:14:12	\N	222	71
223	1961-12-18 18:42:54	\N	223	160
224	2012-10-19 12:45:35	\N	224	84
225	1995-07-31 16:10:20	\N	225	174
226	1950-09-14 14:40:50	\N	226	28
227	2004-10-23 17:52:52	\N	227	17
228	2011-03-11 11:00:55	\N	228	103
229	1994-01-25 07:17:50	\N	229	79
230	1971-10-31 12:37:52	\N	230	43
231	1966-05-17 12:57:12	\N	231	56
232	1950-09-07 22:43:06	\N	232	83
233	1959-03-27 16:06:26	\N	233	157
234	1980-03-01 08:16:44	\N	234	25
235	1952-10-18 10:43:14	\N	235	161
236	1977-10-07 18:24:38	\N	236	62
237	1963-09-13 18:55:22	\N	237	171
238	1976-09-25 12:57:07	\N	238	136
239	1984-07-05 09:04:51	\N	239	189
240	1992-08-05 18:30:33	\N	240	167
241	1995-04-04 00:59:54	\N	241	6
242	1974-07-05 13:06:06	\N	242	164
243	2014-12-24 07:42:06	\N	243	72
244	1991-10-17 21:39:15	\N	244	161
245	1980-06-18 19:54:27	\N	245	47
246	2014-05-06 17:43:27	\N	246	101
247	1979-05-13 02:42:37	\N	247	90
248	1952-08-27 13:04:31	\N	248	96
249	2014-02-04 22:23:35	\N	249	105
250	1953-09-28 06:26:41	\N	250	60
251	2011-09-11 16:55:24	\N	251	140
252	1967-12-17 13:50:27	\N	252	142
253	1961-11-08 13:40:43	\N	253	188
254	1955-02-12 20:46:24	\N	254	192
255	2004-11-28 11:37:20	\N	255	111
256	2008-04-16 23:27:01	\N	256	51
257	1950-07-26 08:40:39	\N	257	91
258	1983-05-10 10:38:50	\N	258	76
259	1954-05-04 22:20:37	\N	259	140
260	2010-09-16 21:54:31	\N	260	90
261	1957-09-11 06:05:41	\N	261	178
262	1968-07-06 23:24:54	\N	262	122
263	1989-09-24 13:05:23	\N	263	161
264	1958-04-03 12:50:09	\N	264	149
265	1955-12-29 13:28:20	\N	265	109
266	1957-02-06 19:44:59	\N	266	196
267	1990-02-07 08:25:10	\N	267	95
268	1989-02-14 08:05:38	\N	268	95
269	1956-07-25 08:25:03	\N	269	31
270	1954-09-02 00:15:08	\N	270	127
271	1981-01-10 03:00:41	\N	271	168
272	1982-01-08 22:25:16	\N	272	68
273	1992-05-19 20:05:18	\N	273	57
274	1977-04-01 09:35:28	\N	274	116
275	1955-02-26 14:10:22	\N	275	110
276	1955-02-01 14:42:08	\N	276	137
277	2011-12-11 00:01:07	\N	277	86
278	2000-08-11 07:01:28	\N	278	29
279	1966-05-11 17:54:06	\N	279	86
280	2013-10-21 11:16:34	\N	280	40
281	1996-05-20 02:07:04	\N	281	157
282	1997-01-25 01:35:28	\N	282	41
283	1994-07-05 03:35:03	\N	283	69
284	1956-03-24 05:56:22	\N	284	19
285	2006-05-17 17:17:40	\N	285	19
286	1986-07-30 18:35:49	\N	286	63
287	1998-02-28 12:01:59	\N	287	119
288	1960-11-21 15:03:33	\N	288	189
289	1951-08-14 11:12:38	\N	289	195
290	1966-09-25 13:19:04	\N	290	138
291	1982-01-21 12:04:03	\N	291	72
292	1981-12-19 06:51:03	\N	292	19
293	1996-07-02 21:52:37	\N	293	5
294	2000-09-01 14:21:29	\N	294	44
295	1973-09-19 07:23:05	\N	295	30
296	2000-01-23 20:24:30	\N	296	79
297	2006-03-12 05:09:56	\N	297	71
298	1951-04-01 13:45:38	\N	298	65
299	2015-09-27 04:06:44	\N	299	34
300	1981-09-14 00:28:56	\N	300	40
\.


--
-- TOC entry 2174 (class 0 OID 29620)
-- Dependencies: 190
-- Data for Name: sector; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sector (id, all_graves_number, full_graves_number, sector_number, size) FROM stdin;
1	246	24	1	198
2	262	28	2	128
3	205	25	3	532
4	272	26	4	496
5	58	36	5	117
6	135	40	6	538
7	206	28	7	291
8	184	29	8	173
9	76	34	9	577
10	78	30	10	548
\.


--
-- TOC entry 2022 (class 2606 OID 29570)
-- Name: applicant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY applicant
    ADD CONSTRAINT applicant_pkey PRIMARY KEY (id);


--
-- TOC entry 2024 (class 2606 OID 29578)
-- Name: deceased_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY deceased
    ADD CONSTRAINT deceased_pkey PRIMARY KEY (id);


--
-- TOC entry 2026 (class 2606 OID 29583)
-- Name: exhumation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY exhumation
    ADD CONSTRAINT exhumation_pkey PRIMARY KEY (id);


--
-- TOC entry 2040 (class 2606 OID 29685)
-- Name: funeral_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funeral
    ADD CONSTRAINT funeral_pkey PRIMARY KEY (id);


--
-- TOC entry 2028 (class 2606 OID 29593)
-- Name: grave_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY grave
    ADD CONSTRAINT grave_pkey PRIMARY KEY (id);


--
-- TOC entry 2030 (class 2606 OID 29598)
-- Name: management_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY management
    ADD CONSTRAINT management_pkey PRIMARY KEY (id);


--
-- TOC entry 2032 (class 2606 OID 29606)
-- Name: manager_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY manager
    ADD CONSTRAINT manager_pkey PRIMARY KEY (id);


--
-- TOC entry 2034 (class 2606 OID 29614)
-- Name: owner_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY owner
    ADD CONSTRAINT owner_pkey PRIMARY KEY (id);


--
-- TOC entry 2036 (class 2606 OID 29619)
-- Name: rent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rent
    ADD CONSTRAINT rent_pkey PRIMARY KEY (id);


--
-- TOC entry 2038 (class 2606 OID 29624)
-- Name: sector_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sector
    ADD CONSTRAINT sector_pkey PRIMARY KEY (id);


--
-- TOC entry 2041 (class 2606 OID 29625)
-- Name: fk391rasx5swp8rbjmcu4brbkyr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY exhumation
    ADD CONSTRAINT fk391rasx5swp8rbjmcu4brbkyr FOREIGN KEY (applicant_id) REFERENCES applicant(id);


--
-- TOC entry 2044 (class 2606 OID 29655)
-- Name: fk79ngcgrnmrqjestb7d5nougju; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY management
    ADD CONSTRAINT fk79ngcgrnmrqjestb7d5nougju FOREIGN KEY (manager_id) REFERENCES manager(id);


--
-- TOC entry 2042 (class 2606 OID 29630)
-- Name: fk9d9qbkvvymr342il75nec01fx; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY exhumation
    ADD CONSTRAINT fk9d9qbkvvymr342il75nec01fx FOREIGN KEY (deceased_id) REFERENCES deceased(id);


--
-- TOC entry 2046 (class 2606 OID 29665)
-- Name: fke3ln627vtf89gwyt2jfqegnqk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rent
    ADD CONSTRAINT fke3ln627vtf89gwyt2jfqegnqk FOREIGN KEY (grave_id) REFERENCES grave(id);


--
-- TOC entry 2048 (class 2606 OID 29686)
-- Name: fkfd0lm4e7tukjcukmb67tc7vb2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funeral
    ADD CONSTRAINT fkfd0lm4e7tukjcukmb67tc7vb2 FOREIGN KEY (applicant_id) REFERENCES applicant(id);


--
-- TOC entry 2047 (class 2606 OID 29670)
-- Name: fkh823qm9xw5v6f9wtu8wb9hc3d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rent
    ADD CONSTRAINT fkh823qm9xw5v6f9wtu8wb9hc3d FOREIGN KEY (owner_id) REFERENCES owner(id);


--
-- TOC entry 2049 (class 2606 OID 29691)
-- Name: fkj0ldjaa445km9ceh1lknowcvm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funeral
    ADD CONSTRAINT fkj0ldjaa445km9ceh1lknowcvm FOREIGN KEY (deceased_id) REFERENCES deceased(id);


--
-- TOC entry 2043 (class 2606 OID 29650)
-- Name: fkjiuwh8osheytrpntvw6naj17u; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY grave
    ADD CONSTRAINT fkjiuwh8osheytrpntvw6naj17u FOREIGN KEY (sector_id) REFERENCES sector(id);


--
-- TOC entry 2045 (class 2606 OID 29660)
-- Name: fkjj0x4s9bhnhwrosgjnnmn5hw6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY management
    ADD CONSTRAINT fkjj0x4s9bhnhwrosgjnnmn5hw6 FOREIGN KEY (sector_id) REFERENCES sector(id);


--
-- TOC entry 2050 (class 2606 OID 29696)
-- Name: fknufbtrt8av0ebmfrinoem63qb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funeral
    ADD CONSTRAINT fknufbtrt8av0ebmfrinoem63qb FOREIGN KEY (grave_id) REFERENCES grave(id);


--
-- TOC entry 2182 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-04-11 10:43:38

--
-- PostgreSQL database dump complete
--

