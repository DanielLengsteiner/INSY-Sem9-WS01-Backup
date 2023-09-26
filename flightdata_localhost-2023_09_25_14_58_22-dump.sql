--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0 (Debian 16.0-1.pgdg120+1)
-- Dumped by pg_dump version 16.0 (Debian 16.0-1.pgdg120+1)

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

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: airlines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.airlines (
    id character(2) NOT NULL,
    name character varying(100) DEFAULT ''::character varying NOT NULL,
    country character(2) DEFAULT ''::bpchar NOT NULL
);


ALTER TABLE public.airlines OWNER TO postgres;

--
-- Name: airports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.airports (
    airportcode character(3) NOT NULL,
    name character varying(100) DEFAULT NULL::character varying,
    country character(2) DEFAULT ''::bpchar NOT NULL,
    city character varying(100) DEFAULT NULL::character varying
);


ALTER TABLE public.airports OWNER TO postgres;

--
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    code character(2) NOT NULL,
    name character varying(100) DEFAULT NULL::character varying
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- Name: countriesfull; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countriesfull (
    code2 character(2) NOT NULL,
    code3 character(3) DEFAULT NULL::bpchar,
    name character varying(100) DEFAULT NULL::character varying,
    continentcode character(2) NOT NULL,
    continentname character varying(50) DEFAULT NULL::character varying
);


ALTER TABLE public.countriesfull OWNER TO postgres;

--
-- Name: flights; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flights (
    airline character(2) DEFAULT ''::bpchar NOT NULL,
    flightnr character(3) DEFAULT ''::bpchar NOT NULL,
    departure_time timestamp without time zone,
    departure_airport character(3) DEFAULT NULL::bpchar,
    destination_time timestamp without time zone,
    destination_airport character(3) DEFAULT NULL::bpchar,
    planetype integer
);


ALTER TABLE public.flights OWNER TO postgres;

--
-- Name: passengers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.passengers (
    id integer NOT NULL,
    firstname character varying(50) DEFAULT NULL::character varying,
    lastname character varying(50) DEFAULT NULL::character varying,
    airline character(2) DEFAULT NULL::bpchar,
    flightnr character(4) DEFAULT NULL::bpchar,
    rownr integer,
    seatposition character(1) DEFAULT NULL::bpchar
);


ALTER TABLE public.passengers OWNER TO postgres;

--
-- Name: passengers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.passengers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.passengers_id_seq OWNER TO postgres;

--
-- Name: passengers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.passengers_id_seq OWNED BY public.passengers.id;


--
-- Name: planes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planes (
    id integer NOT NULL,
    manufacturer character varying(50) NOT NULL,
    type character varying(50) NOT NULL,
    lengthoverall double precision,
    span double precision,
    maxspeed integer,
    initialserviceyear integer,
    maxseats integer,
    seatsperrow smallint
);


ALTER TABLE public.planes OWNER TO postgres;

--
-- Name: planes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.planes_id_seq OWNER TO postgres;

--
-- Name: planes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planes_id_seq OWNED BY public.planes.id;


--
-- Name: passengers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passengers ALTER COLUMN id SET DEFAULT nextval('public.passengers_id_seq'::regclass);


--
-- Name: planes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planes ALTER COLUMN id SET DEFAULT nextval('public.planes_id_seq'::regclass);


--
-- Data for Name: airlines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.airlines (id, name, country) FROM stdin;
0A	Amber Air	LT
0B	Blue Air	RO
0C	IBL Aviation	MU
0D	Darwin Airline	CH
0J	Jetclub	CH
A2	Cielos Airlines	PE
A3	Aegean Airlines	GR
A4	Southern Winds Airlines	AR
A5	Airlinair	FR
A6	Air Alps Aviation	AT
A7	Air Plus Comet	ES
A8	Benin Golf Air	BJ
A9	Georgian Airways	GE
AA	American Airlines	US
AB	Air Berlin	DE
AC	Air Canada	CA
AD	Air Paradise International	ID
AE	Mandarin Airlines	TW
AF	Air France	FR
AG	Air Contractors	IE
AH	Air Algérie	DZ
AI	Air India Limited	IN
AJ	Aero Contractors	NG
AK	AirAsia	MY
AL	Transaviaexport	BY
AM	Aeroméxico	MX
AN	Ansett Australia	AU
AO	Australian Airlines	AU
AP	Air One	IT
AQ	Aloha Airlines	US
AR	Aerolineas Argentinas	AR
AS	Alaska Airlines, Inc.	US
AT	Royal Air Maroc	MA
AU	Austral Lineas Aereas	AR
AV	Avianca - Aerovias Nacionales de Colombia, S.A.	CO
AW	Dirgantara Air Service	ID
AX	Trans States Airlines	US
AY	Finnair	FI
AZ	Alitalia	IT
B2	Belavia Belarusian Airlines	BY
B3	Bellview Airlines	NG
B4	BACH Flugbetriebsges	AT
B5	Flightline	GB
B6	JetBlue Airways	US
B8	Eritrean Airlines	ER
B9	Air Bangladesh	BD
BA	British Airways	GB
BB	Seaborne Airlines	US
BC	Skymark Airlines	JP
BD	BMI	GB
BE	Flybe	GB
BF	Bluebird Cargo	IS
BG	Biman Bangladesh Airlines	BD
BH	Hawkair	CA
BI	Royal Brunei Airlines	VG
BJ	Nouvel Air Tunisie	TN
BK	Potomac Air	US
BL	Pacific Airlines	VN
BM	Bayu Indonesia Air	ID
BN	Horizon Airlines	AU
BO	Bouraq Indonesia Airlines	ID
BP	Air Botswana	BW
BQ	Aeromar	DO
BR	EVA Air	TW
BS	British International Helicopters	GB
BT	Air Baltic	LV
BV	Blue Panorama Airlines	IT
BW	Caribbean Airlines	TT
BX	Coast Air	NO
BZ	Blue Dart Aviation	IN
C0	Centralwings	PL
C3	ICAR Airlines	UA
C4	Zimex Aviation	CH
C5	CommutAir	US
C6	CanJet	CA
C7	Rico Linhas Aéreas	BR
C8	Chicago Express	US
C9	Cirrus Airlines	DE
CA	Air China	CN
CC	Air Atlanta Icelandic	IS
CD	Alliance Air	IN
CE	Nationwide Airlines	ZA
CF	City Airline	SE
CG	Airlines PNG	PN
CH	Bemidji Airlines	US
CI	China Airlines	TW
CJ	China Northern Airlines	CN
CK	China Cargo Airlines	CN
CL	Lufthansa CityLine	DE
CM	Copa Airlines	PA
CN	Islands Nationair	PN
CO	Continental Airlines	US
CP	Canadian Airlines	CA
CQ	Sunshine Express Airlines	AU
CR	OAG	GB
CS	Continental Micronesia	US
CT	Civil Air Transport	TW
CU	Cubana de Aviación	CU
CV	Air Chathams	NC
CW	Air Marshall Islands	MH
CX	Cathay Pacific	HK
CY	Cyprus Airways	CY
CZ	China Southern Airlines	CN
D3	Daallo Airlines	DJ
D4	Alidaunia	IT
D5	Dauair	DE
D6	Interair South Africa	ZA
D7	FlyAsianXpress	MY
D8	Djibouti Airlines	DJ
D9	Aeroflot-Don	RO
DA	Air Georgia	GE
DB	Brit Air	FR
DC	Golden Air	SE
DD	Nok Air	TH
DE	Condor Flugdienst	DE
DG	South East Asian Airlines	PH
DH	Independence Air	US
DI	dba	DE
DJ	Pacific Blue	NC
DK	Eastland Air	AU
DL	Delta Air Lines	US
DM	Maersk	DK
DO	Dominicana de Aviación	DO
DP	First Choice Airways	GB
DQ	Coastal Air	US
DR	Air Mediterranee	FR
DT	TAAG Angola Airlines	AO
DU	Hemus Air	BG
DV	Lufttaxi Fluggesellschaft	DE
DW	Aero-Charter Ukraine	UA
DX	DAT Danish Air Transport	DK
DY	Norwegian Air Shuttle	NO
E0	Eos Airlines	US
E1	Kampuchea Airlines	KH
E2	Rio Grande Air	US
E3	Domodedovo Airlines	RO
E4	Aero Asia International	PK
E5	Samara Airlines	RO
E6	Bringer Air Cargo Taxi Aereo	BR
E7	Estafeta Carga Aerea	MX
E8	Alpi Eagles	IT
E9	Boston-Maine Airways	US
EA	European Air Express	DE
EB	Eagle Air	TZ
EC	Avialeasing Aviation Company	UZ
ED	Airblue	PK
EE	Aero Airlines	EE
EF	Far Eastern Air Transport	TW
EG	Japan Asia Airways	JP
EH	Air Nippon Network Co. Ltd.	JP
EI	Aer Lingus	IE
EJ	New England Airlines	US
EK	Emirates Airline	AE
EL	Air Nippon	JP
EM	Aero Benin	BJ
EN	Air Dolomiti	IT
EO	Express One International	US
EP	Hewa Bora Airways	CD
EQ	Iran Aseman Airlines	IR
ER	TAME	EC
ES	Astar Air Cargo	US
ET	DHL International	BH
EU	Ethiopian Airlines	ET
EV	Empresa Ecuatoriana De Aviacion	EC
EW	Atlantic Southeast Airlines	US
EX	Eurowings	DE
EY	Air Santo Domingo	DO
EZ	Etihad Airways	AE
F2	Sun Air of Scandinavia	DK
F3	Fly Air	TR
F4	Faso Airways	BF
F5	Albarka Air	NG
F6	Cosmic Air	NP
F7	Faroejet	FO
F9	Flybaboo	CH
FA	Frontier Airlines	US
FB	Safair	ZA
FC	Bulgaria Air	BG
FD	Finncomm Airlines	FI
FE	Thai AirAsia	TH
FF	Primaris Airlines	US
FG	Airshop	NL
FH	Ariana Afghan Airlines	AF
FI	Futura International Airways	ES
FJ	Icelandair	IS
FK	Air Pacific	FJ
FL	Africa West	TG
FM	AirTran Airways	US
FN	Shanghai Airlines	CN
FO	Regional Air Lines	MA
FP	Airlines of Tasmania	AU
FQ	Freedom Air	US
FR	Thomas Cook Airlines	BE
FS	Ryanair	IE
FT	Servicios de Transportes Aéreos Fueguinos	AR
FV	Siem Reap Airways	KH
FW	Rossiya	RO
FX	Ibex Airlines	JP
FY	Firefly	MY
G0	Northwest Regional Airlines	AU
G1	Ghana International Airlines	GH
G2	Gorkha Airlines	NP
G3	City Connexion Airlines	BI
G4	Gol Transportes Aéreos	BR
G5	Avirex	GA
G6	Allegiant Air	US
G7	Guine Bissaur Airlines	GW
G8	Air Service Gabon	GA
G9	Gujarat Airways	IN
GA	Air Arabia	AE
GB	Garuda Indonesia	ID
GC	ABX Air	US
GD	Gambia International Airlines	GM
GE	Air Alpha Greenland	DK
GF	TransAsia Airways	TW
GG	Air Guyane	GF
GH	Air Comores International	KM
GI	Ghana Airways	GH
GJ	Itek Air	KG
GK	Eurofly	IT
GL	Air Greenland	DK
GM	Miami Air International	US
GN	Air Slovakia	SK
GO	Air Gabon	GA
GP	Kuzu Airlines Cargo	TR
GQ	Palau Trans Pacific Airline	PW
GR	Aurigny Air Services	GB
GS	Air Foyle	GB
GT	Grant Aviation	US
GU	JetX Airlines	IS
GV	GB Airways	GB
GW	Aero Flight	DE
GX	Kuban Airlines	RO
GY	Pacificair	PH
GZ	Tri-MG Intra Asia Airlines	ID
H2	Rotation International Air Services	ET
H3	Hola Airlines	ES
H4	Sky Airline	CL
H5	Inter Islands Airlines	CV
H6	Mavial Magadan Airlines	RO
H7	Hageland Aviation Services	US
H8	Eagle Air	UG
H9	Air D'Ayiti	HT
HA	Pegasus Airlines	TR
HB	Hawaiian Airlines	US
HC	Harbor Airlines	US
HD	Air Holland	NL
HE	Hokkaido International Airlines	JP
HF	Luftfahrtgesellschaft Walter	DE
HG	Hapagfly	DE
HH	Niki	AT
HI	Pearl Airways	HT
HJ	Hope Air	CA
HK	Asian Express Airlines	AU
HM	Four Star Aviation / Four Star Cargo	US
HN	Air Seychelles	SC
HO	Heavylift Cargo Airlines	AU
HP	Antinea Airlines	DZ
HQ	Phoenix Airways	CH
HR	Harmony Airways	CA
HT	Hahn Air	DE
HU	Aeromist-Kharkiv	UA
HV	Hainan Airlines	CN
HW	Transavia Holland	NL
HX	Hello	CH
HY	North-Wright Airways	CA
HZ	Uzbekistan Airways	UZ
I0	Great Wall Airlines	CN
I1	Paramount Airways	IN
I2	Imair Airlines	AZ
I4	Sat Airlines	KZ
I6	Interstate Airline	NL
I7	Sky Eyes	TH
I9	Air Italy	IT
IA	Indigo	US
IB	Iraqi Airways	IQ
IC	Iberia Airlines	ES
ID	Indian Airlines	IN
IE	Interlink Airlines	ZA
IF	Solomon Airlines	SB
IG	Islas Airways	ES
IH	Meridiana	IT
II	Falcon Aviation	SE
IJ	IBC Airways	US
IK	InteliJet Airways	CO
IM	Lankair	LK
IN	Menajet	LB
IO	MAT Macedonian Airlines	MK
IP	Indonesian Airlines	ID
IQ	Atyrau Air Ways	KZ
IR	Augsburg Airways	DE
IS	Iran Air	IR
IT	Irtysh Airlines	UZ
IV	Kingfisher Airlines	IN
IW	Wind Jet	IT
IX	AOM French Airlines	FR
IY	Air India Express	IN
IZ	Yemenia	YE
J0	Jazeera Airways	KW
J1	Berjaya Air	MY
J2	Arkia Israel Airlines	IL
J3	Azerbaijan Airlines	AZ
J4	Northwestern Air	CA
J6	Buffalo Airways	CA
J7	Centre-Avia	RO
J8	ValuJet Airlines	US
J9	Guinee Airlines	GN
JA	Air Bosna	BA
JB	B&H Airlines	BA
JC	Helijet	CA
JD	Mango	ZA
JE	JAL Express	JP
JF	Jetairfly	BE
JG	Midway Airlines	US
JH	L.A.B. Flying Service	US
JI	Nordeste Linhas Aereas Regionais	BR
JJ	Aviogenex	RS
JK	TAM Brazilian Airlines	BR
JL	Spanair	ES
JM	Japan Airlines Domestic	JP
JN	Air Jamaica	JM
JO	Excel Airways	GB
JP	JALways	JP
JQ	Adria Airways	SI
JR	Jetstar Airways	AU
JS	Aero California	MX
JT	Air Koryo	CZ
JU	Lion Mentari Airlines	ID
JV	Jat Airways	RS
JW	Bearskin Lake Air Service	CA
JX	Arrow Air	US
JY	Jett8 Airlines Cargo	SG
JZ	Air Turks and Caicos	TC
K2	Skyways Express	SE
K4	Eurolot	PL
K5	Kalitta Air	US
K6	Wings of Alaska	US
K8	Bravo Air Congo	CD
K9	Airlink Zambia	ZM
KA	Krylo Airlines	RO
KB	Dragonair, Hong Kong Dragon Airlines	HK
KC	Druk Air	BT
KD	Air Astana	KZ
KE	KD Avia	RO
KF	Korean Air	QA
KG	Blue1	FI
KI	LAI - Linea Aerea IAACA	VE
KJ	Adam Air	ID
KK	British Mediterranean Airways	GB
KL	Atlasjet	TR
KM	KLM Royal Dutch Airlines	NL
KN	Air Malta	MT
KO	China United Airlines	CN
KP	Alaska Central Express	US
KQ	Kiwi International Air Lines	US
KR	Kenya Airways	KE
KS	Comores Airlines	KM
KU	Peninsula Airways	US
KV	Kuwait Airways	KW
KX	Kavminvodyavia	RO
KY	Cayman Airways	KY
KZ	Kibris Türk Hava	TR
L1	Nippon Cargo Airlines	JP
L2	Lufthansa Systems	DE
L3	Lynden Air Cargo	US
L4	LTU Austria	AT
L5	Lynx Aviation	US
L6	Lufttransport	NO
L7	Tbilaviamsheni	GE
L8	Linea Aerea SAPSA	CL
L9	Air Luxor GB	GW
LA	Teamline Air	AT
LB	LAN Airlines	CL
LC	Lloyd Aereo Boliviano	BO
LD	Varig Logística	BR
LF	Linea Turistica Aerotuy	VE
LG	FlyNordic	SE
LH	Luxair	LU
LI	Lufthansa Cargo	DE
LJ	Leeward Islands Air Transport	AG
LK	Sierra National Airlines	SL
LL	Air Luxor	PT
LM	Allegro	MX
LN	Livingston	IT
LO	Libyan Arab Airlines	LY
LP	LOT Polish Airlines	PL
LQ	LAN Peru	PE
LR	Lebanese Air Transport	LB
LS	LACSA	CR
LT	Jet2.com	GB
LU	LTU International	DE
LV	LAN Express	CL
LW	Albanian Airlines	AL
LX	Pacific Wings	US
LY	Swiss International Air Lines	CH
LZ	El Al Israel Airlines	IL
M3	Mahfooz Aviation	GM
M4	North Flying	DK
M5	Nova Airline	SD
M6	Kenmore Air	US
M7	Amerijet International	US
M9	Tropical Airways	HT
MA	Motor Sich	UA
MB	Malév Hungarian Airlines	HU
MC	MNG Airlines	TR
MD	Air Mobility Command	US
ME	Air Madagascar	MG
MF	Middle East Airlines	LB
MG	Xiamen Airlines	CN
MH	Champion Air	US
MI	Malaysia Airlines	MY
MJ	SilkAir	SG
MK	Líneas Aéreas Privadas Argentinas	AR
ML	Air Mauritius	MU
MM	African Transport Trading and Investment Company	SD
MN	SAM Colombia	CO
MO	Comair	ZA
MP	Calm Air	CA
MQ	Martinair	NL
MR	American Eagle Airlines	US
MS	Air Mauritanie	MR
MT	Egyptair	EG
MU	Thomas Cook Airlines	GB
MV	China Eastern Airlines	CN
MW	Armenian International Airways	AM
MX	Maya Island Air	BZ
MY	Mexicana de Aviación	MX
MZ	Midwest Airlines (Egypt)	EG
N2	Merpati Nusantara Airlines	ID
N3	Kabo Air	NG
N4	Omskavia Airline	RO
N5	National Airlines	CL
N6	Skagway Air Service	US
N7	Nuevo Continente	PE
N8	National Airlines	US
N9	Hong Kong Airlines	HK
NA	North Coast Aviation	PN
NB	National Airlines	US
NC	Sterling Airlines	DK
NE	Northern Air Cargo	US
NF	SkyEurope	SK
NG	Air Vanuatu	VU
NH	Lauda Air	AT
NI	All Nippon Airways	JP
NK	Portugalia	PT
NL	Spirit Airlines	US
NM	Shaheen Air International	PK
NN	Mount Cook Airlines	NC
NO	VIM Airlines	RO
NQ	Neos	IT
NR	Air Japan	JP
NT	Pamir Airways	AF
NU	Binter Canarias	ES
NV	Japan Transocean Air	JP
NW	Air Central	JP
NX	Northwest Airlines	US
NY	Air Macau	LU
NZ	Air Iceland	IS
O2	Eagle Airways	NC
O6	Oceanic Airlines	GN
O7	Oceanair	BR
O8	Ozjet Airlines	AU
OA	Oasis Hong Kong Airlines	HK
OB	Olympic Airlines	GR
OE	Astrakhan Airlines	RO
OF	Asia Overnight Express	PH
OJ	Comair	US
OK	Overland Airways	NG
OL	Czech Airlines	CZ
OM	Ostfriesische Lufttransport	DE
ON	MIAT Mongolian Airlines	MN
OO	Our Airline	NR
OP	SkyWest Airlines	US
OR	Chalk's Ocean Airways	US
OS	Arkefly	NL
OT	Austrian Airlines	AT
OU	Aeropelican Air Services	AU
OV	Croatia Airlines	CI
OW	Estonian Air	EE
OX	Executive Airlines	US
OY	Orient Thai Airlines	TH
OZ	Omni Air International	US
P0	Ozark Air Lines	US
P5	Proflight Commuter Services	ZM
P7	AeroRepública	CO
P8	Russian Sky Airlines	RO
P9	Pantanal Linhas Aéreas	BR
PA	Perm Airlines	RO
PC	Pan American World Airways	US
PD	Continental Airways	RO
PE	Porter Airlines	CA
PF	Air Europe	IT
PG	Palestinian Airlines	EG
PH	Bangkok Airways	TH
PI	Polynesian Airlines	WS
PJ	Sun Air (Fiji)	FJ
PK	Air Saint Pierre	FR
PL	Pakistan International Airlines	PK
PM	Airstars	RO
PN	Tropic Air	BZ
PO	Pan American Airways	US
PQ	Polar Air Cargo	US
PR	Panafrican Airways	IT
PS	Philippine Airlines	PH
PT	Ukraine International Airlines	UA
PU	West Air Sweden	SE
PV	PLUNA	UY
PW	PAN Air	ES
PX	Precision Air	TZ
PY	Air Niugini	PN
PZ	Surinam Airways	SR
Q3	TAM Mercosur	PY
Q4	Zambian Airways	ZM
Q5	Mastertop Linhas Aereas	BR
Q6	40-Mile Air	US
Q8	Aero Condor Peru	PE
Q9	Pacific East Asia Cargo Airlines	PH
QB	Afrinat International Airlines	GM
QC	Georgian National Airlines	GE
QD	Air Corridor	MZ
QE	Air Class Lineas Aereas	UY
QF	Crossair Europe	CH
QH	Sunstate Airlines	AU
QI	Kyrgyzstan	KG
QJ	Cimber Air	DK
QK	Jet Airways	US
QL	Air Canada Jazz	CA
QM	Aero Lanka	LK
QN	Air Malawi	MW
QO	Air Armenia	AM
QQ	Origin Pacific Airways	NC
QR	Reno Air	US
QS	Qatar Airways	QA
QT	Travel Service	CZ
QU	TAMPA	CO
QV	East African	UG
QW	Lao Airlines	KG
QX	Blue Wings	DE
QY	Horizon Air	US
QZ	European Air Transport	BE
R0	Indonesia AirAsia	ID
R1	Royal Airlines	PK
R3	Orenburg Airlines	RO
R5	Aircompany Yakutia	RO
R6	Malta Air Charter	MT
R7	RACSA	GT
R8	Aserca Airlines	VE
R9	Kyrgyzstan Airlines	KG
RA	Camai Air	US
RB	Royal Nepal Airlines	NP
RC	Syrian Arab Airlines	SY
RD	Atlantic Airways	FO
RE	Ryan International Airlines	US
RF	Aer Arann	IE
RG	Florida West International Airways	US
RH	VRG Linhas Aereas	BR
RI	Republic Express Airlines	ID
RJ	Mandala Airlines	ID
RK	Royal Jordanian	JO
RL	Royal Khmer Airlines	KH
RO	Royal Phnom Penh Airways	KH
RP	Tarom	RO
RQ	Chautauqua Airlines	US
RR	Kam Air	AF
RS	Royal Air Force	GB
RU	Royal Air Force of Oman	OM
RV	SkyKing Turks and Caicos Airways	TC
RW	Caspian Airlines	IR
RX	Republic Airlines	US
RZ	Aviaexpress	HU
S0	Euro Exec Express	SE
S2	Slok Air Gambia	GM
S3	Air Sahara	IN
S4	Santa Barbara Airlines	VE
S5	SATA International	PT
S6	Trast Aero	KG
S7	Star Air	DK
S8	S7 Airlines	RO
S9	Shovkoviy Shlyah	UA
SA	East African Safari Air	KE
SB	South African Airways	ZA
SC	Air Caledonie International	FR
SD	Shandong Airlines	CN
SE	Sudan Airways	SD
SF	XL Airways France	FR
SG	Tassili Airlines	DZ
SH	Spicejet	IN
SI	Fly Me Sweden	SE
SJ	Skynet Airlines	IE
SK	Freedom Air	NC
SL	SAS Braathens	NO
SM	Rio Sul Serviços Aéreos Regionais	BR
SN	Swedline Express	SE
SO	Brussels Airlines	BE
SP	Sosoliso Airlines	NG
SQ	SATA Air Acores	PT
SR	Singapore Airlines Cargo	SG
SS	Swissair	CH
ST	Corsairfly	FR
SU	Germania	DE
SV	Aeroflot Russian Airlines	RO
SW	Saudi Arabian Airlines	SA
SX	Air Namibia	NA
SY	Skybus Airlines	US
T2	Sun Country Airlines	US
T3	Thai Air Cargo	TH
T4	Eastern Airways	GB
T6	Hellas Jet	GR
T7	Tavrey Airlines	UA
T9	Twin Jet	FR
TC	Thai Star Airlines	TH
TD	Air Tanzania	TZ
TE	Tulip Air	NP
TF	FlyLal	LT
TG	MalmÃ¶ Aviation	SE
TH	Thai Airways International	TH
TI	Transmile Air Services	MY
TK	Tol-Air Services	US
TL	Turkish Airlines	TR
TN	Trans Mediterranean Airlines	LB
TO	Air Tahiti Nui	FR
TP	President Airlines	KH
TQ	TAP Portugal	PT
TR	Tandem Aero	MD
TS	Tiger Airways	SG
TT	Air Transat	CA
TU	Tiger Airways Australia	AU
TV	Tunisair	TN
TW	Virgin Express	BE
TX	Trans World Airlines	US
TY	Air Caraïbes	FR
TZ	Iberworld	ES
U2	ATA Airlines	US
U3	United Feeder Service	US
U4	Avies	EE
U5	PMTair	KH
U6	USA3000 Airlines	US
U7	Ural Airlines	RO
U8	USA Jet Airlines	US
UA	Armavia	AM
UB	United Airlines	US
UD	Myanma Airways	MM
UE	Hex'Air	FR
UF	Transeuropean Airlines	RO
UG	UM Airlines	UA
UH	Tuninter	TN
UI	US Helicopter Corporation	US
UL	Eurocypria Airlines	CY
UM	SriLankan Airlines	LK
UN	Air Zimbabwe	ZW
UO	Transaero Airlines	RO
UP	Hong Kong Express Airways	HK
UQ	Bahamasair	BS
US	O'Connor Airlines	AU
UT	USAir Express	US
UU	UTair Aviation	RO
UX	Air Austral	FR
UY	Air Europa	ES
UZ	Cameroon Airlines	CM
V0	El-Buraq Air Transport	LY
V2	Conviasa	VE
V3	Karat	RO
V4	Carpatair	RO
V5	Reem Air	KG
V7	Royal Aruban Airline	AW
V8	Air Senegal International	SN
V9	ATRAN Cargo Airlines	RU
VA	BAL Bashkirian Airlines	RO
VC	Viasa	VE
VD	Voyageur Airways	CA
VE	SwedJet Airways	SE
VF	Volare Airlines	IT
VG	Valuair	SG
VI	VLM Airlines	BE
VJ	Volga-Dnepr Airlines	RO
VK	Jatayu Airlines	ID
VL	Virgin Nigeria Airways	NG
VM	Air VIA	BG
VN	Viaggio Air	BG
VO	Vietnam Airlines	VN
VP	Austrian Arrows	AT
VR	VASP	BR
VS	TACV	PT
VT	Virgin Atlantic Airways	GB
VU	Air Tahiti	PF
VV	Air Ivoire	IT
VW	Aerosvit Airlines	UA
VX	Aeromar	MX
VY	Virgin America	US
VZ	Vueling Airlines	ES
W1	MyTravel Airways	GB
W2	WDL Aviation	DE
W3	Canadian Western Airlines	CA
W4	Flyhy Cargo Airlines	TH
W5	Aero Services Executive	FR
W6	Mahan Air	IR
W8	Wizz Air	BG
W9	Cargojet Airways	CA
WA	Eastwind Airlines	US
WB	Western Airlines	US
WC	Rwandair Express	RW
WD	Islena De Inversiones	HN
WE	DAS Air Cargo	UG
WF	Centurion Air Cargo	US
WG	Widerøe	NO
WH	Sunwing Airlines	CA
WJ	China Northwest Airlines	CN
WK	WebJet Linhas Aéreas	BR
WN	Edelweiss Air	CH
WO	Southwest Airlines	US
WR	World Airways	US
WS	Royal Tongan Airlines	TO
WT	WestJet	CA
WV	Wasaya Airways	CA
WW	Swe Fly	SE
WX	Bmibaby	GB
WY	CityJet	IE
WZ	Oman Air	OM
X3	West African Airlines	BJ
X7	Hapag-Lloyd Express (TUIfly)	DE
XE	Chitaavia	RO
XF	ExpressJet	US
XG	Vladivostok Air	RO
XJ	Calima Aviacion	ES
XK	Mesaba Airlines	US
XL	Corse-Mediterranee	FR
XM	Aerolane	EC
XO	J-Air	JP
XP	LTE International Airways	ES
XQ	Xtra Airways	US
XS	SunExpress	TR
XT	SITA	BE
Y4	SkyStar Airways	TH
Y5	Volaris	MX
Y8	Pace Airlines	US
Y9	Yangtze River Express	CN
YH	Kish Air	IR
YK	West Caribbean Airways	CO
YL	Cyprus Turkish Airlines	TR
YM	Yamal Airlines	RO
YS	Montenegro Airlines	ME
YT	Régional Compagnie Aérienne Européenne	FR
YV	Air Togo	TG
YW	Mesa Airlines	US
YX	Air Nostrum	ES
Z3	Midwest Airlines	US
Z4	Avient Aviation	ZW
Z7	Zoom Airlines	CA
Z8	ADC Airlines	NG
ZA	Amaszonas	BO
ZB	Interavia Airlines	RO
ZE	Monarch Airlines	GB
ZG	Lineas Aereas Azteca	MX
ZH	Viva Macau	LU
ZI	Shenzhen Airlines	CN
ZK	Aigle Azur	FR
ZL	Great Lakes Airlines	US
ZP	Regional Express	AU
ZS	Silk Way Airlines	AZ
ZT	Sama Airlines	SA
ZU	Titan Airways	GB
ZV	Helios Airways	CY
ZW	Air Midwest	US
ZX	Air Wisconsin	US
ZY	Air Georgian	CA
\.


--
-- Data for Name: airports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.airports (airportcode, name, country, city) FROM stdin;
0A7	Hendersonville Airport	US	Hendersonville
AAA	Anaa	PF	Anaa
AAB	Arrabury	AU	Arrabury
AAC	Al Arish International Airport	EG	Al Arish
AAD	Ad-Dabbah	SD	Ad-Dabbah
AAE	Les Salines	DZ	Annaba
AAF	Municipal	US	Apalachicola
AAG	Arapoti	BR	Arapoti
AAH	Aachen/Merzbruck	DE	Aachen
AAI	Arraias	BR	Arraias
AAJ	Cayana Airstrip	SR	Awaradam
AAK	Aranuka	KI	Aranuka
AAL	Aalborg	DK	Aalborg
AAM	Mala Mala	ZA	Mala Mala
AAN	Al Ain	AE	Al Ain
AAO	Anaco	VE	Anaco
AAP	Andrau Airpark	US	Houston, TX
AAQ	Anapa	RU	Anapa
AAR	Aarhus Airport	DK	Aarhus
AAS	Apalapsili	ID	Apalapsili
AAT	Altay	CN	Altay
AAU	Asau	WS	Asau
AAV	Allah Valley	PH	Surallah
AAW	Abbottabad	PK	Abbottabad
AAX	Araxa	BR	Araxa
AAY	Al Ghaydah	YE	Al Ghaydah
AAZ	Ambriz	AO	Ambriz
ABA	Abakan	RU	Abakan
ABB	RAF Station	GB	Abingdon
ABC	Los Llanos	ES	Albacete
ABD	Abadan	IR	Abadan
ABE	Lehigh Valley International	US	Allentown
ABF	Abaiang	KI	Abaiang
ABG	Abingdon	AU	Abingdon
ABH	Alpha	AU	Alpha
ABI	Municipal	US	Abilene
ABJ	Felix Houphouet Boigny	CI	Abidjan
ABK	Kabri Dar	ET	Kabri Dar
ABL	Ambler	US	Ambler
ABM	Bamaga Injinoo	AU	Bamaga, Queensland
ABN	Albina	SR	Albina
ABO	Aboisso	CI	Aboisso
ABP	Atkamba	PG	Atkamba
ABQ	Albuquerque International	US	Albuquerque
ABR	Municipal	US	Aberdeen
ABS	Abu Simbel	EG	Abu Simbel
ABT	Al-Aqiq	SA	Al-Baha
ABU	Atambua	ID	Atambua
ABV	Nnamdi Azikiwe International Airport	NG	Abuja
ABW	Abau	PG	Abau
ABX	Albury	AU	Albury
ABY	Dougherty County	US	Albany
ABZ	Dyce	GB	Aberdeen
ACA	General Juan N. Alvarez International	MX	Acapulco
ACB	Antrim County	US	Bellaire
ACC	Kotoka	GH	Accra
ACD	Acandi	CO	Acandi
ACE	Lanzarote	ES	Arrecife
ACH	Altenrhein	CH	Altenrhein
ACI	The Blaye	GB	Alderney
ACJ	Anuradhapura	LK	Anuradhapura
ACK	Nantucket Memorial	US	Nantucket
ACL	Aguaclara	CO	Aguaclara
ACM	Arica	CO	Arica
ACN	International	MX	Ciudad Acuna
ACO	Ascona	CH	Ascona
ACP	Sahand	IR	Sahand
ACR	Araracuara	CO	Araracuara
ACS	Achinsk	RU	Achinsk
ACT	Municipal	US	Waco
ACU	Achutupo	PA	Achutupo
ACV	Arcata	US	Arcata
ACX	Xingyi	CN	Xingyi
ACY	Atlantic City Intl	US	Atlantic City
ACZ	Zabol A/P	IR	Zabol
ADA	Adana	TR	Adana
ADB	Adnan Menderes	TR	Izmir
ADC	Andakombe	PG	Andakombe
ADD	Bole International	ET	Addis Ababa
ADE	International	YE	Aden
ADF	Adiyaman	TR	Adiyaman
ADG	Lenawee County	US	Adrian
ADH	Aldan	RU	Aldan
ADI	Arandis	NA	Arandis
ADJ	Marka International Airport	JO	Amman
ADK	Adak Island Ns	US	Adak Island
ADL	Adelaide International Airport	AU	Adelaide
ADM	Ardmore Municipal Arpt	US	Ardmore
ADN	Andes	CO	Andes
ADO	Andamooka	AU	Andamooka
ADP	Ampara	LK	Ampara
ADQ	Kodiak Airport	US	Kodiak
ADR	Andrews	US	Andrews
ADS	Addison Airport	US	Dallas
ADT	Ada	US	Ada
ADU	Ardabil	IR	Ardabil
ADV	Andover	GB	Andover
ADW	Andrews AFB	US	Camp Springs
ADX	Leuchars	GB	St Andrews
ADY	Alldays	ZA	Alldays
ADZ	San Andres Island	CO	San Andres Island
AEA	Abemama Atoll	KI	Abemama Atoll
AED	Aleneva	US	Aleneva
AEG	Aek Godang	ID	Aek Godang
AEH	Abecher	TD	Abecher
AEI	Algeciras	ES	Algeciras
AEK	Aseki	PG	Aseki
AEL	Albert Lea	US	Albert Lea
AEO	Aioun El Atrouss	MR	Aioun El Atrouss
AEP	Arpt. Jorge Newbery	AR	Buenos Aires
AER	Adler/Sochi	RU	Adler/Sochi
AES	Vigra	NO	Aalesund
AET	Allakaket	US	Allakaket
AEU	Abu Musa	IR	Abu Musa
AEX	Alexandria International	US	Alexandria, LA
AEY	Akureyri	IS	Akureyri
AFA	San Rafael	AR	San Rafael
AFD	Port Alfred	ZA	Port Alfred
AFF	USAF Academy Airstrip	US	Colorado Springs
AFI	Amalfi	CO	Amalfi
AFK	Kondavattavan Tank	LK	Ampara
AFL	Alta Floresta	BR	Alta Floresta
AFN	Municipal	US	Jaffrey
AFO	Municipal	US	Afton
AFR	Afore	PG	Afore
AFS	Zarafshan	UZ	Zarafshan
AFT	Afutara Aerodrome	SB	Afutara
AFW	Fort Worth Alliance	US	Fort Worth, TX
AFY	Afyon	TR	Afyon
AFZ	Sabzevar	IR	Sabzevar
AGA	Agadir Almassira	MA	Agadir
AGB	Augsburg - Muehlhausen	DE	Munich
AGC	Allegheny County	US	Pittsburgh
AGD	Anggi	ID	Anggi
AGE	Flugplatz	DE	Wangerooge
AGF	La Garenne	FR	Agen
AGG	Angoram	PG	Angoram
AGH	Angelholm	SE	Angelholm/Helsingborg
AGI	Wageningen	SR	Wageningen
AGJ	Aguni	JP	Aguni
AGK	Kagua	PG	Kagua
AGL	Wanigela	PG	Wanigela
AGM	Tasiilaq	GL	Tasiilaq
AGN	Angoon	US	Angoon
AGO	Municipal	US	Magnolia
AGP	Pablo Ruiz Picasso	ES	Malaga
AGQ	Agrinion	GR	Agrinion
AGR	Kheria	IN	Agra
AGS	Bush Field	US	Augusta
AGT	Alejo Garcia	PY	Ciudad Del Este
AGU	Aguascalients	MX	Aguascalientes
AGV	Acarigua	VE	Acarigua
AGW	Agnew	AU	Agnew
AGX	Agatti Island	IN	Agatti Island
AGY	Argyle Downs	AU	Argyle Downs
AGZ	Aggeneys	ZA	Aggeneys
AHA	Naha Air Force Base	JP	Okinawa
AHB	Abha	SA	Abha
AHC	Amedee AAF	US	Herlong
AHD	Downtown	US	Ardmore
AHE	Ahe Airport	PF	Ahe
AHF	Municipal	US	Arapahoe
AHH	Municipal	US	Amery
AHI	Amahai	ID	Amahai
AHL	Aishalton	GY	Aishalton
AHN	Athens	US	Athens
AHO	Fertilia	IT	Alghero
AHS	Ahuas	HN	Ahuas
AHT	Amchitka	US	Amchitka
AHU	Charif Al Idrissi	MA	Al Hoceima
AHY	Ambatolahy	MG	Ambatolahy
AHZ	Alpe D Huez	FR	Alpe D Huez
AIA	Alliance	US	Alliance
AIB	Anita Bay	US	Anita Bay
AIC	Airok	MH	Airok, Ailinglaplap
AID	Municipal	US	Anderson
AIE	Aiome	PG	Aiome
AIF	Assis	BR	Assis
AIG	Yalinga	CF	Yalinga
AIH	Aiambak	PG	Aiambak
AII	Alisabieh	DJ	Alisabieh
AIK	Municipal	US	Aiken
AIL	Ailigandi	PA	Ailigandi
AIM	Ailuk Island	MH	Ailuk Island
AIN	Wainwright	US	Wainwright
AIO	Municipal	US	Atlantic
AIP	Ailinglapalap Island	MH	Ailinglapalap Island
AIR	Aripuana	BR	Aripuana
AIS	Arorae Island	KI	Arorae Island
AIT	Aitutaki	CK	Aitutaki
AIU	Atiu Island	CK	Atiu Island
AIV	George Downer	US	Aliceville, AL
AIW	Ai-ais	NA	Ai-ais
AIY	Bader Field	US	Atlantic City
AIZ	Lee C Fine Memorial	US	Kaiser/Lake Ozark
AJA	Campo Dell Oro	FR	Ajaccio
AJF	Jouf	SA	Sakaka Al Jouf
AJI	A?ri	TR	Agri
AJJ	Akjoujt	MR	Akjoujt
AJK	Araak	IR	Araak
AJL	Aizawl	IN	Aizawl
AJN	Ouani	KM	Anjouan
AJO	Aljouf	YE	Aljouf
AJR	Arvidsjaur	SE	Arvidsjaur
AJS	Abreojos	MX	Abreojos
AJU	Santa Maria	BR	Aracaju
AJY	Agades	NE	Agades
AKA	Ankang	CN	Ankang
AKB	Atka	US	Atka
AKC	Fulton International	US	Akron/Canton
AKD	Akola	IN	Akola
AKE	Akieni	GA	Akieni
AKF	Kufrah	LY	Kufrah
AKG	Anguganak	PG	Anguganak
AKH	Prince Sultan Air Base	SA	Al Kharj
AKI	Akiak	US	Akiak
AKJ	Asahikawa	JP	Asahikawa
AKK	Akhiok SPB	US	Akhiok
AKL	Auckland International	NZ	Auckland
AKM	Zakouma	TD	Zakouma
AKN	King Salmon	US	King Salmon
AKO	Colorado Plains Regional Airport	US	Akron, CO
AKP	Anaktuvuk	US	Anaktuvuk
AKQ	Gunung Batin	ID	Astraksetra
AKR	Akure	NG	Akure
AKT	Raf Akrotiri	CY	Akrotiri
AKU	Aksu	CN	Aksu
AKV	Akulivik	CA	Akulivik
AKW	Aghajari	IR	Aghajari
AKX	Aktyubinsk	KZ	Aktyubinsk
AKY	Civil	MM	Sittwe
ALA	Almaty	KZ	Almaty
ALB	Albany International	US	Albany
ALC	Alicante El Altet	ES	Alicante
ALD	Alerta	PE	Alerta
ALE	Alpine	US	Alpine
ALF	Alta	NO	Alta
ALG	Houari Boumediene	DZ	Algiers
ALH	Albany	AU	Albany
ALI	International	US	Alice
ALJ	Kortdoorn	ZA	Alexander Bay
ALK	Asela	ET	Asela
ALL	Albenga	IT	Albenga
ALM	Municipal	US	Alamogordo
ALN	Alton	US	Alton
ALO	Waterloo	US	Waterloo
ALP	Nejrab	SY	Aleppo
ALQ	Federal	BR	Alegrete
ALR	Alexandra	NZ	Alexandra
ALS	Municipal	US	Alamosa
ALT	Alenquer	BR	Alenquer
ALU	Alula	SO	Alula
ALV	Andorra La Vella H/P	AD	Andorra La Vella
ALW	Walla Walla	US	Walla Walla
ALX	Thomas C Russell Fld	US	Alexander City, AL
ALY	El Nohza	EG	Alexandria
ALZ	Alitak SPB	US	Alitak
AMA	Rick Husband Amarillo International	US	Amarillo, TX
AMB	Ambilobe	MG	Ambilobe
AMC	Am Timan	TD	Am Timan
AMD	Ahmedabad	IN	Ahmedabad
AME	Alto Molocue	MZ	Alto Molocue
AMF	Ama	PG	Ama
AMG	Amboin	PG	Amboin
AMH	Arba Mintch	ET	Arba Mintch
AMI	Selaparang	ID	Mataram
AMJ	Almenara	BR	Almenara
AMK	Animas Airpark	US	Durango
AML	Puerto Armuellas	PA	Puerto Armuellas
AMM	Queen Alia Intl	JO	Amman
AMN	Gratiot Community	US	Alma
AMO	Mao	TD	Mao
AMP	Ampanihy	MG	Ampanihy
AMQ	Pattimura	ID	Ambon
AMR	Arno	MH	Arno
AMS	Amsterdam-Schiphol	NL	Amsterdam
AMT	Amata	AU	Amata
AMU	Amanab	PG	Amanab
AMV	Amderma	RU	Amderma
AMW	Ames	US	Ames
AMX	Ammaroo	AU	Ammaroo
AMY	Ambatomainty	MG	Ambatomainty
AMZ	Ardmore	NZ	Ardmore
ANA	Orange County Steel Salvage Heliport	US	Anaheim
ANB	Anniston Metropolitan	US	Anniston, AL
ANC	Ted Stevens Anchorage International Airport	US	Anchorage
AND	Anderson	US	Anderson
ANE	Marce	FR	Angers
ANF	Cerro Moreno	CL	Antofagasta
ANG	Brie-Champniers	FR	Angouleme
ANH	Anuha Island Resort	SB	Anuha Island Resort
ANI	Aniak	US	Aniak
ANJ	Zanaga	CG	Zanaga
ANK	Etimesgut	TR	Ankara
ANL	Andulo	AO	Andulo
ANM	Antsirabato	MG	Antalaha
ANN	Annette Island	US	Annette Island
ANO	Angoche	MZ	Angoche
ANP	Lee	US	Annapolis
ANQ	Tri-State Steuben Cty	US	Angola
ANR	Deurne/ Antwerp Airport	BE	Antwerp
ANS	Andahuaylas	PE	Andahuaylas
ANT	St Anton	AT	St Anton
ANU	V. C. Bird Intl	AG	St. John's
ANV	Anvik	US	Anvik
ANW	Ainsworth	US	Ainsworth
ANX	Andenes	NO	Andenes
ANY	Anthony	US	Anthony
ANZ	Angus Downs	AU	Angus Downs
AOA	Aroa	PG	Aroa
AOB	Annanberg	PG	Annanberg
AOC	Altenburg Nobitz	DE	Altenburg
AOD	Abou Deia	TD	Abou Deia
AOE	Anadolu University	TR	Eskisehir
AOG	Anshan	CN	Anshan
AOH	Allen County	US	Lima
AOI	Falconara	IT	Ancona
AOJ	Aomori	JP	Aomori
AOK	Karpathos	GR	Karpathos
AOL	Paso De Los Libres	AR	Paso De Los Libres
AON	Arona	PG	Arona
AOO	Martinsburg	US	Martinsburg
AOR	Alor Setar	MY	Alor Setar
AOS	Amook	US	Amook
AOT	Corrado Gex	IT	Aosta
AOU	Attopeu	LA	Attopeu
APA	Arapahoe Co	US	Denver
APB	Apolo	BO	Apolo
APC	Napa County	US	Napa
APE	San Juan Aposento	PE	San Juan Aposento
APF	Naples	US	Naples
APG	Phillips AAF	US	Aberdeen
APH	Camp A P Hill	US	Bowling Green
API	Apiay	CO	Apiay
APK	Apataki	PF	Apataki
APL	Nampula	MZ	Nampula
APN	Alpena County Regional	US	Alpena
APO	Apartado	CO	Apartado
APP	Asapa	PG	Asapa
APQ	Arapiraca	BR	Arapiraca
APR	April River	PG	April River
APS	Anapolis	BR	Anapolis
APT	Marion County	US	Jasper
APU	Apucarana	BR	Apucarana
APV	Apple Valley	US	Apple Valley
APW	Faleolo	WS	Apia
APX	Arapongas	BR	Arapongas
APY	Alto Parnaiba	BR	Alto Parnaiba
APZ	Zapala	AR	Zapala
AQA	Araraquara	BR	Araraquara
AQB	Quiche Airport	GT	Quiche
AQG	Anqing	CN	Anqing
AQI	Qaisumah	SA	Qaisumah
AQJ	King Hussein Intl	JO	Aqaba
AQM	Ariquemes	BR	Ariquemes
AQP	Rodriguez Ballon	PE	Arequipa
AQS	Saqani	FJ	Saqani
AQY	Alyeska	US	Alyeska
ARA	Acadiana Regional	US	New Iberia
ARB	Municipal	US	Ann Arbor, MI
ARC	Arctic Village	US	Arctic Village
ARD	Alor Island	ID	Alor Island
ARE	Arecibo	PR	Arecibo
ARF	Acaricuara	CO	Acaricuara
ARG	Walnut Ridge	US	Walnut Ridge
ARH	Arkhangelsk	RU	Arkhangelsk
ARI	Chacalluta	CL	Arica
ARJ	Arso	ID	Arso
ARK	Arusha	TZ	Arusha
ARL	Arly	BF	Arly
ARM	Armidale	AU	Armidale
ARN	Arlanda	SE	Stockholm
ARO	Arboletas	CO	Arboletas
ARP	Aragip	PG	Aragip
ARQ	Arauquita	CO	Arauquita
ARR	Alto Rio Senguerr	AR	Alto Rio Senguerr
ARS	Aragarcas	BR	Aragarcas
ART	Watertown	US	Watertown
ARU	Aracatuba	BR	Aracatuba
ARV	Noble F. Lee	US	Minocqua
ARW	Arad	RO	Arad
ARX	Asbury Park	US	Neptune, NJ
ARY	Ararat	AU	Ararat
ASA	Assab International	ER	Assab
ASB	Ashgabat	TM	Ashgabat
ASC	Ascension	BO	Ascension
ASD	Andros Town	BS	Andros Town
ASE	Aspen	US	Aspen
ASF	Astrakhan	RU	Astrakhan
ASG	Ashburton	NZ	Ashburton
ASH	Boire Field	US	Nashua, NH
ASI	Wideawake Field	SH	Georgetown, Ascension Island
ASJ	Amami O Shima	JP	Amami O Shima
ASK	Yamoussoukro	CI	Yamoussoukro
ASL	Harrison County	US	Marshall
ASM	Yohannes IV	ER	Asmara
ASN	Talladega	US	Talladega
ASO	Asosa	ET	Asosa
ASP	Alice Springs	AU	Alice Springs
ASQ	Austin	US	Austin
ASR	Erkilet International Airport	TR	Kayseri
AST	Astoria	US	Astoria
ASU	Silvio Pettirossi	PY	Asuncion
ASV	Amboseli	KE	Amboseli
ASW	Aswan	EG	Aswan
ASX	Ashland	US	Ashland
ASY	Ashley	US	Ashley
ASZ	Asirim	PG	Asirim
ATA	Anta	PE	Anta
ATB	Atbara	SD	Atbara
ATD	Atoifi	SB	Atoifi
ATE	Antlers	US	Antlers
ATF	Chachoan	EC	Ambato
ATG	Attock	PK	Attock
ATH	Eleftherios Venizelos	GR	Athens
ATI	Artigas	UY	Artigas
ATJ	Antsirabe	MG	Antsirabe
ATK	Atqasuk	US	Atqasuk
ATL	Hartsfield-jackson Atlanta International	US	Atlanta, GA
ATM	Altamira	BR	Altamira
ATN	Namatanai	PG	Namatanai
ATO	Ohio University	US	Athens
ATP	Airstrip	PG	Aitape
ATQ	Raja Sansi	IN	Amritsar
ATR	Mouakchott	MR	Atar
ATS	Artesia	US	Artesia
ATT	Atmautluak	US	Atmautluak
ATU	Casco Cove	US	Attu Island
ATV	Ati	TD	Ati
ATW	Outagamie County	US	Appleton
ATX	Atbasar	KZ	Atbasar
ATY	Watertown	US	Watertown
ATZ	Assiut	EG	Assiut
AUA	Reina Beatrix	AW	Aruba
AUB	Itauba	BR	Itauba
AUC	Arauca	CO	Arauca
AUD	Augustus Downs	AU	Augustus Downs
AUE	Abu Rudeis	EG	Abu Rudeis
AUF	Auxerre Branches	FR	Auxerre
AUG	Augusta	US	Augusta
AUH	Abu Dhabi International	AE	Abu Dhabi
AUI	Aua Island	PG	Aua Island
AUJ	Ambunti	PG	Ambunti
AUK	Alakanuk	US	Alakanuk
AUL	Aur Island	MH	Aur Island
AUM	Austin	US	Austin
AUN	Auburn	US	Auburn
AUO	Auburn-Opelika	US	Auburn
AUP	Agaun	PG	Agaun
AUQ	Atuona	PF	Atuona
AUR	Aurillac	FR	Aurillac
AUS	Austin-bergstrom International	US	Austin
AUT	Atauro	ID	Atauro
AUU	Aurukun Mission	AU	Aurukun Mission
AUV	Aumo	PG	Aumo
AUW	Municipal	US	Wausau
AUX	Araguaina	BR	Araguaina
AUY	Aneityum	VU	Aneityum
AUZ	Municipal Airport	US	Aurora
AVA	An Shun/Huang Guo Shu	CN	An Shun
AVB	Aviano	IT	Aviano
AVF	Avoriaz	FR	Avoriaz
AVG	Auvergne	AU	Auvergne
AVI	Maximo Gomez	CU	Ciego De Avila
AVK	Arvaikheer	MN	Arvaikheer
AVL	Asheville Regional Airport	US	Fletcher
AVN	Avignon-Caumont	FR	Avignon
AVO	Municipal	US	Avon Park
AVP	Wilkes-Barre/Scranton International Airport	US	Wilkes-Barre/Scranton, PA
AVU	Avu Avu	SB	Avu Avu
AVV	Avalon	AU	Geelong
AVW	Avra Valley	US	Tucson
AVX	Avalon Bay	US	Catalina Island
AWA	Awassa	ET	Awassa
AWB	Awaba	PG	Awaba
AWD	Aniwa	VU	Aniwa
AWE	Alowe	GA	Alowe
AWH	Awareh	ET	Awareh
AWK	Wake Island	UM	Wake Island
AWM	Municipal	US	West Memphis
AWN	Alton Downs	AU	Alton Downs
AWP	Austral Downs	AU	Austral Downs
AWR	Awar	PG	Awar
AWZ	Ahwaz	IR	Ahwaz
AXA	Wallblake	AI	Anguilla
AXB	Alexandria Bay	US	Alexandria Bay
AXC	Aramac	AU	Aramac
AXD	Dimokritos	GR	Alexandroupolis
AXE	Xanxere	BR	Xanxere
AXG	Algona	US	Algona
AXK	Ataq	YE	Ataq
AXL	Alexandria	AU	Alexandria
AXM	El Eden	CO	Armenia
AXN	Alexandria	US	Alexandria
AXP	Springpoint Arpt	BS	Spring Point
AXR	Arutua	PF	Arutua
AXS	Municipal	US	Altus
AXT	Akita	JP	Akita
AXU	Axum	ET	Axum
AXV	Neil Armstrong	US	Wapakoneta
AXX	Angel Fire	US	Angel Fire
AYA	Ayapel	CO	Ayapel
AYC	Ayacucho	CO	Ayacucho
AYD	Alroy Downs	AU	Alroy Downs
AYE	AAF Heliport	US	Fort Devens
AYG	Yaguara	CO	Yaguara
AYH	RAF Station	GB	Alconbury
AYI	Yari	CO	Yari
AYK	Arkalyk	KZ	Arkalyk
AYL	Anthony Lagoon	AU	Anthony Lagoon
AYN	Anyang	CN	Anyang
AYO	Ayolas	PY	Ayolas
AYP	Yanamilla	PE	Ayacucho
AYQ	Connellan	AU	Ayers Rock
AYR	Ayr	AU	Ayr
AYS	Ware County	US	Waycross
AYT	Antalya	TR	Antalya
AYU	Aiyura	PG	Aiyura
AYW	Ayawasi	ID	Ayawasi
AYZ	Zahns	US	Amityville
AZB	Amazon Bay	PG	Amazon Bay
AZD	Yazd	IR	Yazd
AZG	Apatzingan	MX	Apatzingan
AZI	Bateen	AE	Abu Dhabi
AZN	Andizhan	UZ	Andizhan
AZO	Kalamazoo/Battle Creek Intl	US	Kalamazoo
AZP	Atizapan	MX	Mexico City
AZR	Adrar	DZ	Adrar
AZS	Samaná El Catey International	DO	El Catey
AZT	Zapatoca	CO	Zapatoca
AZZ	Ambriz	AO	Ambriz
BAA	Bialla	PG	Bialla
BAB	Beale AFB	US	Marysville
BAC	Barranca De Upia	CO	Barranca De Upia
BAD	Barksdale AFB	US	Shreveport
BAE	Barcelonnette	FR	Barcelonnette
BAF	Barnes	US	Westfield
BAG	Loakan	PH	Baguio
BAH	Bahrain International	BH	Manama
BAI	Buenos Aires	CR	Buenos Aires
BAJ	Bali	PG	Bali
BAL	Batman	TR	Batman
BAM	Lander County	US	Battle Mountain
BAN	Basongo	ZR	Basongo
BAO	Udorn	TH	Ban Mak Khaen
BAP	Baibara	PG	Baibara
BAQ	E Cortissoz	CO	Barranquilla
BAR	Baker Aaf	US	Baker Island
BAS	Balalae	SB	Balalae
BAT	Airport Chafei Amsei	BR	Barretos
BAU	Bauru	BR	Bauru
BAV	Baotou	CN	Baotou
BAW	Biawonque	GA	Biawonque
BAX	Barnaul	RU	Barnaul
BAY	Baia Mare	RO	Baia Mare
BAZ	Barbelos	BR	Barbelos
BBA	Teniente Vidal	CL	Balmaceda
BBB	Municipal	US	Benson
BBC	Bay City	US	Bay City
BBD	Curtis Field	US	Brady
BBE	Big Bell	AU	Big Bell
BBF	Burlington	US	Burlington
BBG	Butaritari	KI	Butaritari
BBH	Barth	DE	Barth
BBI	Bhubaneswar	IN	Bhubaneswar
BBJ	Bitburg Air Base	DE	Bitburg
BBK	Kasane	BW	Kasane
BBL	Babolsar	IR	Babolsar
BBM	Battambang	KH	Battambang
BBN	Bario	MY	Bario
BBO	Berbera	SO	Berbera
BBP	Bembridge	GB	Bembridge
BBQ	Barbuda	AG	Barbuda
BBR	Baillif	GP	Basse Terre
BBS	Blackbushe	GB	Yateley
BBT	Berberati	CF	Berberati
BBU	Baneasa	RO	Bucharest
BBV	Hkg	CI	Bereby
BBW	Broken Bow	US	Broken Bow
BBX	Wings Field	US	Blue Bell
BBY	Bambari	CF	Bambari
BBZ	Zambezi	ZM	Zambezi
BCA	Baracoa	CU	Baracoa
BCB	Virginia Tech	US	Blacksburg
BCC	Bear Creek	US	Bear Creek
BCD	Bacolod	PH	Bacolod
BCE	Bryce	US	Bryce
BCF	Bouca	CF	Bouca
BCG	Bemichi	GY	Bemichi
BCH	Cakung International	TP	Baucau
BCI	Barcaldine	AU	Barcaldine
BCJ	Baca Grande	US	Baca Grande
BCK	Bolwarra	AU	Bolwarra
BCL	Barra Colorado	CR	Barra Colorado
BCM	Bacau	RO	Bacau
BCN	El Prat De Llobregat	ES	Barcelona
BCO	Jinka	ET	Jinka
BCP	Bambu	PG	Bambu
BCQ	Brack	LY	Brack
BCR	Boca Do Acre	BR	Boca Do Acre
BCS	Southern Seaplane	US	Belle Chasse
BCT	Public	US	Boca Raton
BCU	Bauchi	NG	Bauchi
BCV	Belmopan	BZ	Belmopan
BCW	Benguera Island	MZ	Benguera Island
BCX	Beloreck	RU	Beloreck
BCY	Bulchi	ET	Bulchi
BCZ	Bickerton Island	AU	Bickerton Island
BDA	Kindley Field	BM	Bermuda
BDB	Bundaberg	AU	Bundaberg
BDC	Barra Do Corda	BR	Barra Do Corda
BDD	Badu Island	AU	Badu Island
BDE	Baudette	US	Baudette
BDF	Rinkenberger	US	Bradford
BDG	Blanding	US	Blanding
BDH	Bandar Lengeh	IR	Bandar Lengeh
BDI	Bird Island	SC	Bird Island
BDJ	Sjamsudin Noor	ID	Banjarmasin
BDK	Bondoukou	CI	Bondoukou
BDL	Bradley International	US	Windsor Locks, CT
BDM	Bandirma	TR	Bandirma
BDN	Talhar	PK	Badin
BDO	Husein Sastranegara	ID	Bandung
BDP	Bhadrapur	NP	Bhadrapur
BDQ	Vadodara	IN	Vadodara
BDR	Igor I. Sikorsky Mem.	US	Bridgeport
BDS	Papola Casale	IT	Brindisi
BDT	Gbadolite	CD	Gbadolite
BDU	Bardufoss	NO	Bardufoss
BDV	Moba	ZR	Moba
BDW	Bedford Downs	AU	Bedford Downs
BDX	Broadus	US	Broadus
BDY	State	US	Bandon
BDZ	Baindoung	PG	Baindoung
BEA	Bereina	PG	Bereina
BEB	Benbecula	GB	Benbecula
BEC	Beech	US	Wichita
BED	Hanscom Field	US	Bedford/Hanscom
BEE	Beagle Bay	AU	Beagle Bay
BEF	Bluefields	NI	Bluefields
BEG	Nikola Tesla	RS	Belgrade
BEH	Ross Field	US	Benton Harbor
BEI	Beica	ET	Beica
BEJ	Kalimaru	ID	Tanjung Redep
BEK	Bareli	IN	Bareli
BEL	Val De Cans	BR	Belem
BEM	Bossembele	CF	Bossembele
BEN	Benina Intl	LY	Benghazi
BEO	Belmont	AU	Newcastle
BEP	Bellary	IN	Bellary
BEQ	Honington	GB	Bury St Edmunds
BER	Berlin Metropolitan Area	DE	Berlin
BES	Brest Lesquin	FR	Brest
BET	Bethel Airport	US	Bethel
BEU	Bedourie	AU	Bedourie
BEV	Beer Sheba	IL	Beer Sheba
BEW	Beira	MZ	Beira
BEX	Benson (RAF Station)	GB	Benson
BEY	Beirut Rafic Hariri Airport	LB	Beirut
BEZ	Beru	KI	Beru
BFA	Bahia Negra	PY	Bahia Negra
BFB	Blue Fox Bay	US	Blue Fox Bay
BFC	Bloomfield	AU	Bloomfield
BFD	Bradford	US	Bradford
BFE	Bielefeld	DE	Bielefeld
BFF	Scotts Bluff County	US	Scottsbluff
BFG	Bullfrog Basin	US	Bullfrog Basin
BFH	Bacacheri	BR	Curitiba
BFI	Boeing Field/King County International Airport	US	Seattle
BFJ	Ba	FJ	Ba
BFK	Buffalo Municipal Airport	US	Buffalo
BFL	Meadows Field	US	Bakersfield
BFM	Mob Aerospace	US	Mobile
BFN	Bloemfontein	ZA	Bloemfontein
BFO	Buffalo Range	ZW	Buffalo Range
BFP	Beaver Falls	US	Beaver Falls
BFQ	Bahia Pinas	PA	Bahia Pinas
BFR	Virgil I Grissom Muni	US	Bedford
BFS	Aldergrove International Airport	GB	Belfast
BFT	County	US	Beaufort
BFU	Bengbu	CN	Bengbu
BFV	Buri Ram	TH	Buri Ram
BFW	Sidi Belabbes	DZ	Sidi Belabbes
BFX	Bafoussam	CM	Bafoussam
BGA	Palo Negro	CO	Bucaramanga
BGB	Booue	GA	Booue
BGC	Braganca	PT	Braganca
BGD	Borger	US	Borger
BGE	Decatur County	US	Bainbridge
BGF	Bangui	CF	Bangui
BGG	Bongouanou	CI	Bongouanou
BGH	Abbaye	MR	Boghe
BGI	Grantley Adams International	BB	Bridgetown
BGJ	Borgarfjordur Eystri	IS	Borgarfjordur Eystri
BGK	Big Creek	BZ	Big Creek
BGL	Baglung	NP	Baglung
BGM	Greater Binghamton	US	Binghamton, NY
BGN	R.A.F.	DE	Brueggen
BGO	Bergen Airport, Flesland	NO	Bergen
BGP	Bongo	GA	Bongo
BGQ	Big Lake	US	Big Lake
BGR	Bangor International Airport	US	Bangor
BGS	Webb AFB	US	Big Spring
BGT	Bagdad	US	Bagdad, AZ
BGU	Bangassou	CF	Bangassou
BGV	Bento Goncalves	BR	Bento Goncalves
BGW	Al Rasheed	IQ	Baghdad
BGX	Airport Cmdt. Gustavo Kraemer	BR	Bage
BGY	Orio al Serio	IT	Bergamo
BGZ	Braga	PT	Braga
BHA	Bahia De Caraquez	EC	Bahia De Caraquez
BHB	Bar Harbor	US	Bar Harbor
BHC	Bhurban Heliport	US	Bhurban
BHD	George Best Belfast City	GB	Belfast
BHE	Woodbourne Air Station	NZ	Blenheim
BHF	Bahia Cupica	CO	Bahia Cupica
BHG	Brus Laguna	HN	Brus Laguna
BHH	Bisha	SA	Bisha
BHI	Comandante	AR	Bahia Blanca
BHJ	Rudra Mata	IN	Bhuj
BHK	Bukhara	UZ	Bukhara
BHL	Bahia Angeles	MX	Bahia Angeles
BHM	Birmingham	US	Birmingham
BHN	Beihan	YE	Beihan
BHO	Bhopal	IN	Bhopal
BHP	Bhojpur	NP	Bhojpur
BHQ	Broken Hill	AU	Broken Hill
BHR	Bharatpur Airport	NP	Bharatpur
BHS	Raglan	AU	Bathurst
BHT	Brighton Downs	AU	Brighton Downs
BHU	Bhavnagar	IN	Bhavnagar
BHV	Bahawalpur	PK	Bahawalpur
BHW	Bhagatanwala Apt	PK	Sargodha
BHX	Birmingham International Airport	GB	Birmingham
BHY	Beihai	CN	Beihai
BIA	Poretta	FR	Bastia
BIB	Baidoa	SO	Baidoa
BIC	Big Creek	US	Big Creek
BID	Block Island	US	Block Island
BIE	Beatrice	US	Beatrice
BIF	Biggs Aaf	US	El Paso
BIG	Intermediate Field	US	Big Delta
BIH	Bishop	US	Bishop
BII	Enyu Airfield	MH	Bikini Atoll
BIJ	Biliau	PG	Biliau
BIK	Frans Kaisepo	ID	Biak
BIL	Billings	US	Billings
BIM	International	BS	Bimini
BIN	Bamiyan	AF	Bamiyan
BIO	Sondica	ES	Bilbao
BIP	Bulimba	AU	Bulimba
BIQ	Biarritz Parme	FR	Biarritz
BIR	Biratnagar	NP	Biratnagar
BIS	Bismarck	US	Bismarck
BIT	Baitadi	NP	Baitadi
BIU	Bildudalur	IS	Bildudalur
BIV	Bria	CF	Bria
BIW	Billiluna	AU	Billiluna
BIX	Keesler AFB	US	Biloxi
BIY	Bisho	ZA	Bisho
BIZ	Bimin	PG	Bimin
BJA	Bejaia	DZ	Bejaia
BJB	Bojnord	IR	Bojnord
BJC	Jeffco	US	Broomfield
BJD	Bakkafjordur	IS	Bakkafjordur
BJF	Batsfjord	NO	Batsfjord
BJG	Bolaang	ID	Bolaang
BJH	Bajhang	NP	Bajhang
BJI	Bemidji	US	Bemidji
BJJ	Wayne County	US	Wooster
BJK	Benjina	ID	Benjina
BJL	Yundum International	GM	Banjul
BJM	International	BI	Bujumbura
BJN	Bajone	MZ	Bajone
BJO	Bermejo	BO	Bermejo
BJP	Braganca Paulista	BR	Braganca Paulista
BJR	Bahar Dar	ET	Bahar Dar
BJT	Bentota River	LK	Bentota River
BJU	Bajura Airport	NP	Bajura
BJV	Milas	TR	Milas
BJW	Bajawa	ID	Bajawa
BJX	Del Bajío International	MX	León
BJY	Batajnica	RS	Belgrade
BJZ	Talaveral La Real	ES	Badajoz
BKA	Bykovo	RU	Moscow
BKB	Bikaner	IN	Bikaner
BKC	Buckland	US	Buckland
BKD	Stephens County	US	Breckenridge
BKE	Baker	US	Baker
BKF	Lake Brooks SPB	US	Katmai National Park
BKH	Barking Sands PMRF	US	Kekaha
BKI	Kota-Kinabalu International Airport	MY	Kota-Kinabalu
BKJ	Boke	GN	Boke
BKK	Suvarnabhumi International	TH	Bangkok
BKL	Burke Lakefront	US	Cleveland
BKM	Bakalalan	MY	Bakalalan
BKN	Birni Nkoni	NE	Birni Nkoni
BKO	Bamako	ML	Bamako
BKP	Barkly Downs	AU	Barkly Downs
BKQ	Blackall	AU	Blackall
BKR	Bokoro	TD	Bokoro
BKS	Padangkemiling	ID	Bengkulu
BKT	Blackstone AAF	US	Blackstone
BKU	Betioky	MG	Betioky
BKW	Beckley	US	Beckley
BKX	Brookings	US	Brookings
BKY	Kavumu	CD	Bukavu
BKZ	Bukoba	TZ	Bukoba
BLA	Gen J A Anzoategui	VE	Barcelona
BLB	Balboa	PA	Balboa
BLC	Bamenda	CM	Bali
BLD	Boulder City	US	Boulder City
BLE	Dala Airport	SE	Borlange
BLF	Princeton	US	Princeton
BLG	Belaga	MY	Belaga
BLH	Blythe	US	Blythe
BLI	Bellingham	US	Bellingham
BLJ	Batna	DZ	Batna
BLK	Blackpool Airport	GB	Blackpool
BLL	Billund	DK	Billund
BLM	Monmouth Executive Airport	US	Belmar - Farmingdale
BLN	Benalla	AU	Benalla
BLO	Blonduos	IS	Blonduos
BLP	Bellavista	PE	Bellavista
BLQ	Guglielmo Marconi	IT	Bologna
BLR	Bangalore International Airport	IN	Bangalore
BLS	Bollon	AU	Bollon
BLT	Blackwater	AU	Blackwater
BLU	Blue Canyon	US	Blue Canyon
BLV	Belleville	US	Belleville
BLW	Bellows Field	US	Waimanalo
BLX	Belluno	IT	Belluno
BLY	Belmullet	IE	Belmullet
BLZ	Chileka	MW	Blantyre
BMA	Bromma	SE	Stockholm
BMB	Bumba	ZR	Bumba
BMC	Brigham City	US	Brigham City
BMD	Belo	MG	Belo
BME	Broome	AU	Broome, Western Australia
BMF	Bakouma	CF	Bakouma
BMG	Bloomington	US	Bloomington
BMH	Bomai	PG	Bomai
BMI	Central Illinois Regional Airport at Bloomington-Normal	US	Bloomington/Normal, IL
BMJ	Baramita	GY	Baramita
BMK	Borkum	DE	Borkum
BML	Berlin Municipal Airport	US	Berlin
BMM	Bitam	GA	Bitam
BMN	Bamerny	IQ	Bamerny
BMO	Bhamo	MM	Bhamo
BMP	Brampton Island	AU	Brampton Island
BMQ	Bamburi	KE	Bamburi
BMR	Baltrum	DE	Baltrum Island
BMS	Brumado	BR	Brumado
BMT	Beaumont Muni	US	Beaumont
BMU	Bima	ID	Bima
BMV	Phung-Duc	VN	Banmethuot
BMW	Bordj Badji Mokhtar	DZ	Bordj Badji Mokhtar
BMX	Big Mountain	US	Big Mountain
BMY	Belep Island	NC	Belep Island
BMZ	Bamu	PG	Bamu
BNA	Nashville International	US	Nashville, TN
BNB	Boende	ZR	Boende
BNC	Beni	ZR	Beni
BND	Bandar Abbas	IR	Bandar Abbas
BNE	Brisbane International	AU	Brisbane
BNF	Warm Spring Bay SPB	US	Baranof
BNG	Banning	US	Banning
BNH	Barnes	US	Hartford
BNI	Benin City	NG	Benin City
BNK	Ballina Byron Gateway	AU	Ballina
BNL	Barnwell Regional	US	Barnwell, SC
BNM	Bodinumu	PG	Bodinumu
BNN	Bronnoy	NO	Bronnoysund
BNO	Burns	US	Burns
BNP	Bannu	PK	Bannu
BNQ	Baganga	PH	Baganga
BNR	Banfora	BF	Banfora
BNS	Barinas	VE	Barinas
BNT	Bundi	PG	Bundi
BNU	Blumenau	BR	Blumenau
BNV	Boana	PG	Boana
BNW	Boone	US	Boone
BNX	Banja Luka	BA	Banja Luka
BNY	Bellona	SB	Bellona
BNZ	Banz	PG	Banz
BOA	Boma	ZR	Boma
BOB	Motu Mute	PF	Bora Bora
BOC	Bocas Del Toro	PA	Bocas Del Toro
BOD	Mérignac	FR	Bordeaux
BOE	Boundji	CG	Boundji
BOF	Bolling AFB	US	Washington
BOG	Eldorado International	CO	Bogota
BOH	Bournemouth International	GB	Bournemouth
BOI	Boise Air Terminal/Gowen Field	US	Boise, ID
BOJ	Bourgas	BG	Bourgas
BOK	Brookings State	US	Brookings
BOL	Bally Kelly	GB	Bally Kelly
BOM	Chhatrapati Shivaji International	IN	Mumbai
BON	Flamingo International	AN	Kralendijk
BOO	Bodo	NO	Bodo
BOP	Bouar	CF	Bouar
BOQ	Boku	PG	Boku
BOR	Fontaine	FR	Belfort
BOS	Logan International	US	Boston
BOT	Boset	PG	Boset
BOU	Bourges	FR	Bourges
BOV	Boang	PG	Boang
BOW	Bartow	US	Bartow
BOX	Borroloola	AU	Borroloola
BOY	Borgo	BF	Bobo Dioulasso
BOZ	Bozoum	CF	Bozoum
BPA	Grumman	US	Bethpage
BPB	Boridi	PG	Boridi
BPC	Bamenda	CM	Bamenda
BPD	Bapi	PG	Bapi
BPE	Bagan	MM	Bagan
BPF	Batuna Aerodrome	SB	Batuna
BPG	Barra Do Garcas	BR	Barra Do Garcas
BPH	Bislig	PH	Bislig
BPI	Big Piney-marbleton	US	Big Piney
BPK	Biangabip	PG	Biangabip
BPN	Sepingan	ID	Balikpapan
BPS	Porto Seguro	BR	Porto Seguro
BPT	Jefferson County	US	Beaumont
BPU	Beppu	JP	Beppu
BPX	Bangda	CN	Bangda
BPY	Besalampy	MG	Besalampy
BQA	Baler	PH	Baler
BQB	Bussellton	AU	Bussellton
BQE	Bubaque	GW	Bubaque
BQH	Biggin Hill	GB	Biggin Hill
BQI	Bagani	NA	Bagani
BQK	Glynco Jetport	US	Brunswick
BQL	Boulia	AU	Boulia
BQN	Borinquen	PR	Aguadilla
BQO	Bouna	CI	Bouna
BQQ	Barra	BR	Barra
BQS	Blagoveschensk	RU	Blagoveschensk
BQT	Brest	BY	Brest
BQU	J. F. Mitchell	VC	Bequia
BQV	Bartlett SPB	US	Gustavus
BQW	Balgo Hills	AU	Balgo Hills
BRA	Barreiras	BR	Barreiras
BRB	Barreirinhas	BR	Barreirinhas
BRC	International	AR	San Carlos DeBariloche
BRD	Brainerd Lakes Regional	US	Brainerd, MN
BRE	Bremen	DE	Bremen
BRF	Bradford	GB	Bradford
BRG	Municipal	US	Whitesburg
BRH	Brahman	PG	Brahman
BRI	Palese	IT	Bari
BRJ	Bright	AU	Bright
BRK	Bourke	AU	Bourke
BRL	Burlington	US	Burlington
BRM	Barquisimeto	VE	Barquisimeto
BRN	Belp	CH	Berne
BRO	South Padre Is. Intl	US	Brownsville
BRP	Biaru	PG	Biaru
BRQ	Turany	CZ	Brno
BRR	North Bay	GB	Barra
BRS	Bristol	GB	Bristol
BRT	Bathurst Island	AU	Bathurst Island
BRU	Brussels Airport	BE	Brussels
BRV	Bremerhaven	DE	Bremerhaven
BRW	Wiley Post/W.Rogers M	US	Barrow
BRX	Barahona	DO	Barahona
BRY	Samuels Field	US	Bardstown, KY
BRZ	Borotou	CI	Borotou
BSA	Bossaso	SO	Bossaso
BSB	Presidente Juscelino Kubitschek	BR	Brasília, Distrito Federal
BSC	Bahia Solano	CO	Bahia Solano
BSD	Baoshan	CN	Baoshan
BSE	Sematan	MY	Sematan
BSF	Bradshaw AAF	US	Pohakuloa
BSG	Bata	GQ	Bata
BSH	Brighton	GB	Brighton
BSI	Blairsville	US	Blairsville
BSJ	Bairnsdale	AU	Bairnsdale
BSK	Biskra	DZ	Biskra
BSL	Euroairport Basel Mulhouse Freiburg	CH	Mulhouse/basel
BSM	Bishe-kola	IR	Bishe-kola
BSN	Bossangoa	CF	Bossangoa
BSO	Basco	PH	Basco
BSP	Bensbach	PG	Bensbach
BSQ	Bisbee Municipal Arpt	US	Bisbee
BSR	International	IQ	Basra
BSS	Balsas	BR	Balsas
BST	Bost	AF	Bost
BSU	Basankusu	ZR	Basankusu
BSV	Besakoa	PG	Besakoa
BSW	Boswell Bay	US	Boswell Bay
BSX	Bassein	MM	Bassein
BSY	Bardera	SO	Bardera
BSZ	Bartletts	US	Bartletts
BTA	Yaoundé	CM	Yaoundé
BTB	Betou	CG	Betou
BTC	Batticaloa	LK	Batticaloa
BTD	Brunette Downs	AU	Brunette Downs
BTE	Bonthe	SL	Bonthe
BTF	Salt Lake Skypark	US	Bountiful
BTG	Batangafo	CF	Batangafo
BTH	Hang Nadim	ID	Batam
BTI	Barter Island	US	Barter Island
BTJ	Sultan Iskandarmuda Airport	ID	Banda Aceh
BTK	Bratsk	RU	Bratsk
BTL	WK Kellogg Regional	US	Battle Creek
BTM	Bert Mooney Airport	US	Butte, (MT)
BTN	Bennettsville	US	Bennettsville
BTO	Botopasie	SR	Botopasie
BTP	Butler County - Kenny Scholter Field	US	Butler
BTQ	Butare	RW	Butare
BTR	Ryan	US	Baton Rouge
BTS	M. R. ?tefánika	SK	Bratislava
BTT	Bettles	US	Bettles
BTU	Bintulu	MY	Bintulu
BTV	Burlington International	US	Burlington
BTW	Batu Licin	ID	Batu Licin
BTX	Betoota	AU	Betoota
BTY	Beatty	US	Beatty
BTZ	Bursa Airport	TR	Bursa
BUA	Buka	PG	Buka
BUB	Municipal	US	Burwell
BUC	Burketown	AU	Burketown
BUD	Ferihegy	HU	Budapest
BUF	Buffalo Niagara International	US	Buffalo, NY
BUG	Gen V Deslandes	AO	Benguela
BUH	Metropolitan Area	RO	Bucharest
BUI	Bokondini	ID	Bokondini
BUJ	Ain Eddis	DZ	Boussaada
BUK	Albuq	YE	Albuq
BUL	Bulolo	PG	Bulolo
BUM	Butler	US	Butler
BUN	Buenaventura	CO	Buenaventura
BUO	Burao	SO	Burao
BUP	Bhatinda	IN	Bhatinda
BUQ	Bulawayo	ZW	Bulawayo
BUR	Bob Hope	US	Burbank
BUS	Batum	GE	Batumi
BUT	Burtonwood	GB	Burtonwood
BUU	Buyo	CI	Buyo
BUV	Bella Union	UY	Bella Union
BUW	Baubau	ID	Baubau
BUX	Bunia	ZR	Bunia
BUY	Bunbury	AU	Bunbury
BUZ	Bushehr	IR	Bushehr
BVA	Beauvais-Tille	FR	Paris
BVB	Boa Vista	BR	Boa Vista
BVC	Rabil	CV	Boa Vista
BVD	Sea Port	US	Beaver Inlet
BVE	Laroche	FR	Brive-La-Gaillarde
BVF	Dama	FJ	Bua
BVG	Berlevag	NO	Berlevag
BVH	Vilhena	BR	Vilhena
BVI	Birdsville	AU	Birdsville, Queensland
BVK	Huacaraje	BO	Huacaraje
BVL	Baures	BO	Baures
BVM	Belmonte	BR	Belmonte
BVO	Bartlesville	US	Bartlesville
BVP	Bolovip	PG	Bolovip
BVR	Esperadinha	CV	Brava
BVS	Breves	BR	Breves
BVU	Beluga	US	Beluga
BVW	Batavia Downs	AU	Batavia Downs
BVX	Municipal	US	Batesville
BVY	Beverly Municiple Airport	US	Beverly
BVZ	Beverley Springs	AU	Beverley Springs
BWA	Bhairawa	NP	Bhairawa
BWB	Barrow Island	AU	Barrow Island
BWC	Brawley	US	Brawley
BWD	Brownwood	US	Brownwood
BWE	Braunschweig	DE	Braunschweig
BWF	Walney Island	GB	Barrow-In-Furness
BWG	Warren County	US	Bowling Green
BWH	Butterworth	MY	Butterworth
BWI	Baltimore/Washington International Thurgood Marshall	US	Baltimore, MD
BWJ	Bawan	PG	Bawan
BWK	Bol	HR	Bol
BWL	Blackwell	US	Blackwell
BWM	Bowman	US	Bowman
BWN	Bandar Seri Begwan International Airport	BN	Bandar Seri Begawan
BWO	Balakovo	RU	Balakovo
BWP	Bewani	PG	Bewani
BWQ	Brewarrina	AU	Brewarrina
BWS	Blaine	US	Blaine
BWT	Burnie Wynyard	AU	Burnie
BWU	Sydney Bankstown	AU	Sydney
BWY	Bentwaters St	GB	Woodbridge
BXA	George R Carr	US	Bogalusa
BXB	Babo	ID	Babo
BXC	Boxborough	US	Boxborough
BXD	Bade	ID	Bade
BXE	Bakel	SN	Bakel
BXF	Belburn	AU	Belburn
BXG	Bendigo	AU	Bendigo
BXH	Balhash	KZ	Balhash
BXI	Boundiali	CI	Boundiali
BXJ	Burundai	KZ	Burundai
BXK	Buckeye Municipal	US	Buckeye
BXL	Blue Lagoon	FJ	Blue Lagoon
BXM	Batom	ID	Batom
BXN	Imsik Airport	TR	Bodrum
BXO	Buochs	GW	Buochs
BXR	Bam	IR	Bam
BXS	Borrego Springs	US	Borrego Springs
BXT	Bontang	ID	Bontang
BXU	Butuan	PH	Butuan
BXV	Breiddalsvik	IS	Breiddalsvik
BXX	Borama International	SO	Borama
BXZ	Bunsil	PG	Bunsil
BYA	Boundary	US	Boundary
BYB	Dibaa	OM	Dibaa
BYC	Yacuiba	BO	Yacuiba
BYD	Beidah	YE	Beidah
BYG	Municipal	US	Buffalo
BYH	Blytheville AFB	US	Blytheville, AR
BYI	Rupert	US	Rupert
BYK	Bouake	CI	Bouake
BYL	Bella Yella	LR	Bella Yella
BYM	C.M. de Cespedes	CU	Bayamo
BYN	Bayankhongor	MN	Bayankhongor
BYO	Bonito Airport	BR	Bonito
BYQ	Bunyu	ID	Bunyu
BYR	Laeso Airport	DK	Laeso Island
BYS	Bicycle Lake AAF	US	Fort Irwin
BYT	Bantry	IE	Bantry
BYU	Bindlacher-Berg	DE	Bayreuth
BYW	Blakely Island	US	Blakely Island
BYX	Baniyala	AU	Baniyala
BZA	San Pedro	NI	Bonanza
BZB	Bazaruto Island	MZ	Bazaruto Island
BZC	Buzios	BR	Buzios
BZD	Balranald	AU	Balranald
BZE	Philip S. W. Goldson International	BZ	Belize City
BZG	Bydgoszcz I. J. Paderewski Airport	PL	Bydgoszcz
BZH	Bumi Hills	ZW	Bumi Hills
BZI	Balikesir	TR	Balikesir
BZK	Briansk	RU	Briansk
BZL	Barisal	BD	Barisal
BZM	Woensdrecht	NL	Bergen Op Zoom
BZN	Gallatin Field	US	Bozeman
BZO	Bolzano	IT	Bolzano
BZP	Bizant	AU	Bizant
BZR	Beziers Vias	FR	Beziers
BZS	Buzzards Pt S	US	Washington
BZT	Hinkles Ferry	US	Brazoria
BZU	Buta	ZR	Buta
BZV	Maya Maya	CG	Brazzaville
BZY	Beltsy	MD	Beltsy
BZZ	Raf Brize Norton	GB	Oxford
CAA	Catacamas	HN	Catacamas
CAB	Cabinda	AO	Cabinda
CAC	Cascavel	BR	Cascavel
CAD	Cadillac	US	Cadillac
CAE	Metropolitan Airport	US	Columbia, SC
CAF	Carauari	BR	Carauari
CAG	Elmas	IT	Cagliari
CAH	Ca Mau	VN	Ca Mau
CAI	Cairo International	EG	Cairo
CAJ	Canaima	VE	Canaima
CAK	Akron/canton Regional	US	Akron/Canton, OH
CAL	Machrihanish	GB	Campbeltown
CAM	Camiri	BO	Camiri
CAN	New Baiyun	CN	Guangzhou
CAO	Clayton	US	Clayton
CAP	Cap Haitien	HT	Cap Haitien
CAQ	Caucasia	CO	Caucasia
CAR	Municipal	US	Caribou
CAS	Anfa	MA	Casablanca
CAT	New Bight	BS	Cat Island
CAU	Caruaru	BR	Caruaru
CAV	Cazombo	AO	Cazombo
CAW	Bartolomeu Lisandro	BR	Campos
CAX	Carlisle	GB	Carlisle
CAY	Rochambeau	GF	Cayenne
CAZ	Cobar	AU	Cobar
CBA	Corner Bay	US	Corner Bay
CBB	J Wilsterman	BO	Cochabamba
CBC	Cherrabun	AU	Cherrabun
CBD	Car Nicobar	IN	Car Nicobar
CBE	Wiley Ford	US	Cumberland
CBF	Municipal	US	Council Bluffs
CBG	Cambridge	GB	Cambridge
CBH	Leger	DZ	Bechar
CBI	Cape Barren Island	AU	Cape Barren Island
CBJ	Cabo Rojo	DO	Cabo Rojo
CBK	Municipal	US	Colby
CBL	Ciudad Bolivar	VE	Ciudad Bolivar
CBM	Columbus AFB	US	Columbus, MS
CBN	Penggung	ID	Cirebon
CBO	Awang	PH	Cotabato
CBP	Coimbra	PT	Coimbra
CBQ	Calabar	NG	Calabar
CBR	Canberra	AU	Canberra
CBS	Oro Negro	VE	Cabimas
CBT	Catumbela	AO	Catumbela
CBU	Cottbus	DE	Cottbus
CBV	Coban	GT	Coban
CBW	Campo Mourao	BR	Campo Mourao
CBX	Condobolin	AU	Condobolin
CBY	Canobie	AU	Canobie
CBZ	Cabin Creek	US	Cabin Creek
CCA	Chaffee AFB	US	Fort Chaffee
CCB	Cable Airport	US	Upland, CA
CCC	Cayo Coco	CU	Cayo Coco
CCD	Century City	US	Los Angeles
CCE	Grand Case	GP	St Martin
CCF	Salvaza	FR	Carcassonne
CCG	Crane County Arpt	US	Crane
CCH	Chile Chico	CL	Chile Chico
CCI	Concordia	BR	Concordia
CCJ	Kozhikode Airport	IN	Kozhikode
CCK	Cocos Islands	CC	Cocos Islands
CCL	Chinchilla	AU	Chinchilla
CCM	Criciuma	BR	Criciuma
CCN	Chakcharan	AF	Chakcharan
CCO	Carimagua	CO	Carimagua
CCP	Carriel Sur	CL	Concepcion
CCQ	Cachoeira	BR	Cachoeira
CCR	Buchanan Fld	US	Concord
CCS	Simon Bolivar International Airport	VE	Caracas
CCT	Colonia Catriel	AR	Colonia Catriel
CCU	Netaji Subhas Chandra	IN	Kolkata
CCV	Craig Cove	VU	Craig Cove
CCW	Cowell	AU	Cowell
CCX	Caceres	BR	Caceres
CCY	Municipal	US	Charles City
CCZ	Chub Cay	BS	Chub Cay
CDA	Cooinda	AU	Cooinda
CDB	Cold Bay	US	Cold Bay
CDC	Cedar City	US	Cedar City
CDD	Cauquira	HN	Cauquira
CDE	Caledonia	PA	Caledonia
CDG	Charles De Gaulle	FR	Paris
CDH	Harrell Fld	US	Camden
CDI	Cachoeiro Itapemirim	BR	Cachoeiro Itapemirim
CDJ	Conceicao Do Araguaia	BR	Conceicao Do Araguaia
CDK	Lewis	US	Cedar Key
CDL	Candle	US	Candle
CDN	Woodward Fld	US	Camden
CDO	Cradock	ZA	Cradock
CDP	Cuddapah	IN	Cuddapah
CDQ	Croydon	AU	Croydon
CDR	Chadron	US	Chadron
CDS	Childress	US	Childress
CDU	Camden	AU	Camden
CDV	Mudhole Smith	US	Cordova
CDW	Caldwell Wright	US	Caldwell, NJ
CDY	Cagayan De Sulu	PH	Cagayan De Sulu
CDZ	Cadiz	ES	Cadiz
CEA	Cessna Aircraft Field	US	Wichita
CEB	Mactan-Cebu International	PH	Cebu
CEC	Mc Namara Fld	US	Crescent City
CED	Ceduna	AU	Ceduna
CEE	Cherepovets	RU	Cherepovets
CEF	Westover ARB/Metropolitan	US	Chicopee, MA
CEG	Chester	GB	Chester
CEH	Chelinda	MW	Chelinda
CEI	Chiang Rai	TH	Chiang Rai
CEJ	Chernigov	UA	Chernigov
CEK	Chelyabinsk	RU	Chelyabinsk
CEL	Cape Eleuthera	BS	Cape Eleuthera
CEM	Central	US	Central
CEN	Ciudad Obregon	MX	Ciudad Obregon
CEO	Waco Kungo	AO	Waco Kungo
CEP	Concepcion	BO	Concepcion
CEQ	Mandelieu	FR	Cannes
CER	Maupertus	FR	Cherbourg
CES	Cessnock	AU	Cessnock
CET	Le Pontreau	FR	Cholet
CEU	Oconee County	US	Clemson
CEV	Mettle Field	US	Connersville
CEW	Bob Sikes	US	Crestview
CEX	Chena Hot Springs	US	Chena Hot Springs
CEY	Calloway County	US	Murray
CEZ	Montezuma County	US	Cortez
CFA	Coffee Point	US	Coffee Point
CFB	Cabo Frio	BR	Cabo Frio
CFC	Cacador	BR	Cacador
CFD	Coulter Field	US	Bryan
CFE	Aulnat	FR	Clermont-Ferrand
CFF	Cafunfo	AO	Cafunfo
CFG	Cienfuegos	CU	Cienfuegos
CFH	Clifton Hills	AU	Clifton Hills
CFI	Camfield	AU	Camfield
CFK	Chefornak	US	Chefornak, AK
CFN	Donegal	IE	Carrickfinn
CFO	Confreza	BR	Confreza
CFP	Carpentaria Downs	AU	Carpentaria Downs
CFQ	Creston Valley Airport	CA	Creston
CFR	Carpiquet	FR	Caen
CFS	Coffs Harbour	AU	Coffs Harbour
CFT	Morenci	US	Clifton
CFU	Ioannis Kapodistrias	GR	Kerkyra
CFV	Municipal	US	Coffeyville
CGA	Craig SPB	US	Craig
CGB	Intl. Airpt. Marechal Rondon	BR	Cuiaba
CGC	Cape Gloucester	PG	Cape Gloucester
CGD	Changde	CN	Changde
CGE	Cambridge	US	Cambridge
CGF	Cuyahoga County	US	Cleveland
CGG	Casiguran	PH	Casiguran
CGH	Congonhas International Airport	BR	Sao Paulo
CGI	Cape Girardeau	US	Cape Girardeau
CGJ	Chingola	ZM	Chingola
CGK	Soekarno-Hatta International	ID	Jakarta
CGM	Mambajao	PH	Camiguin
CGN	Cologne/bonn	DE	Cologne
CGO	Zhengzhou	CN	Zhengzhou
CGP	Patenga	BD	Chittagong
CGQ	Changchun	CN	Changchun
CGR	Intl. Airport Campo Grande	BR	Campo Grande
CGS	College Park	US	College Park
CGT	Chinguitti	MR	Chinguitti
CGU	Ciudad Guayana	VE	Ciudad Guayana
CGV	Caiguna	AU	Caiguna
CGX	Merrill C Meigs (closed)	US	Chicago
CGY	Cagayan De Oro Domestic Airport	PH	Cagayan De Oro
CGZ	Municipal	US	Casa Grande
CHA	Lovell Field	US	Chattanooga,TN
CHB	Chilas	PK	Chilas
CHC	Christchurch International	NZ	Christchurch
CHD	Williams Gateway Airport	US	Mesa
CHE	Reenroe	IE	Caherciveen
CHF	Jinhae	KR	Jinhae
CHG	Chaoyang Airport	CN	Chaoyang
CHH	Chachapoyas	PE	Chachapoyas
CHI	Chicago FSS	US	Chicago
CHJ	Chipinge	ZW	Chipinge
CHK	Municipal	US	Chickasha
CHL	Challis	US	Challis
CHM	Chimbote	PE	Chimbote
CHN	Jeonju	KR	Jeonju
CHO	Albemarle	US	Charlottesville
CHP	Circle Hot Springs	US	Circle Hot Springs
CHQ	Souda	GR	Chania
CHR	Chateauroux	FR	Chateauroux
CHS	Charleston, AFB Municipal	US	Charleston, SC
CHT	Karewa	NZ	Chatham Island
CHU	Chuathbaluk	US	Chuathbaluk
CHV	Chaves	PT	Chaves
CHW	Jiuhuang	CN	Jiuquan
CHX	Changuinola	PA	Changuinola
CHY	Choiseul Bay	SB	Choiseul Bay
CHZ	State	US	Chiloquin
CIA	Ciampino	IT	Rome
CIB	Ap In The Sky	US	Catalina Island
CIC	Chico	US	Chico
CID	Cedar Rapids	US	Cedar Rapids
CIE	Collie	AU	Collie
CIF	Chifeng	CN	Chifeng
CIG	Craig-Moffat	US	Craig
CIH	Changzhi	CN	Changzhi
CIJ	Capitan Anibal Arab	BO	Cobija
CIK	Chalkyitsik	US	Chalkyitsik
CIL	Melsing Creek	US	Council
CIM	Cimitarra	CO	Cimitarra
CIN	Carroll	US	Carroll
CIO	MCAL Lopez	PY	Concepcion
CIP	Chipata	ZM	Chipata
CIQ	Chiquimula	GT	Chiquimula
CIR	Cairo	US	Cairo
CIS	Canton Island	KI	Canton Island
CIT	Shimkent	KZ	Shimkent
CIU	Chippewa County	US	Sault Ste Marie
CIV	Chomley	US	Chomley
CIW	Canouan Island	VC	Canouan Island
CIX	Cornel Ruiz	PE	Chiclayo
CIY	Comiso	IT	Comiso
CIZ	Coari	BR	Coari
CJA	Cajamarca	PE	Cajamarca
CJB	Peelamedu	IN	Coimbatore
CJC	El Loa	CL	Calama
CJD	Candilejas	CO	Candilejas
CJH	Chilko Lake	CA	Chilko Lake
CJJ	Cheongju	KR	Cheongju
CJL	Chitral	PK	Chitral
CJM	Chumphon Airport	TH	Chumphon
CJN	Gillespie Field	US	El Cajon
CJS	Abraham Gonzalez International	MX	Ciudad Juarez
CJT	Copalar	MX	Comitan
CJU	Jeju Airport	KR	Jeju
CKA	Kegelman Af	US	Cherokee
CKB	Benedum	US	Clarksburg
CKC	Cherkassy	UA	Cherkassy
CKD	Crooked Creek	US	Crooked Creek
CKE	Clear Lake	US	Clear Lake
CKG	Chongqing Jiangbei International	CN	Chongqing
CKH	Chokurdah	RU	Chokurdah
CKI	Croker Island	AU	Croker Island
CKK	Cherokee	US	Cherokee
CKL	Chkalovsky	RU	Chkalovsky
CKM	Fletcher Field	US	Clarksdale, MS
CKN	Municipal	US	Crookston
CKO	Cornelio Procopio	BR	Cornelio Procopio
CKR	Crane Island	US	Crane Island
CKS	Carajas	BR	Carajas
CKT	Sarakhs	IR	Sarakhs
CKU	City	US	Cordova
CKV	Outlaw Field	US	Clarksville, TN
CKX	Chicken	US	Chicken
CKY	Conakry	GN	Conakry
CKZ	Canakkale	TR	Canakkale
CLA	Comilla	BD	Comilla
CLB	Castlebar	IE	Castlebar
CLC	Metroport	US	Clearlake
CLD	Mc Clellan-Palomar Airport	US	Carlsbad, CA
CLE	Hopkins International	US	Cleveland
CLG	Coalinga	US	Coalinga
CLH	Coolah	AU	Coolah
CLI	Clintonville	US	Clintonville
CLJ	Cluj Napoca International Airport	RO	Cluj-Napoca
CLK	Municipal	US	Clinton
CLL	Easterwood Field	US	College Station, TX
CLM	Fairchild Intl	US	Port Angeles
CLN	Carolina	BR	Carolina
CLO	Alfonso B. Aragon	CO	Cali
CLP	Clarks Point	US	Clarks Point
CLQ	Colima	MX	Colima
CLR	Calipatria	US	Calipatria
CLS	Centralia	US	Chehalis
CLT	Charlotte Douglas	US	Charlotte
CLU	Columbus Municipal	US	Columbus
CLV	Caldas Novas	BR	Caldas Novas
CLW	Executive	US	Clearwater
CLX	Clorinda	AR	Clorinda
CLY	Ste Catherine	FR	Calvi
CLZ	Calabozo	VE	Calabozo
CMA	Cunnamulla	AU	Cunnamulla
CMB	Bandaranayake	LK	Colombo
CMC	Camocim	BR	Camocim
CMD	Cootamundra	AU	Cootamundra
CME	Ciudad Del Carmen	MX	Ciudad Del Carmen
CMF	Chambery	FR	Chambery
CMG	Intl. Airport Corumba	BR	Corumba
CMH	Port Columbus Intl	US	Columbus
CMI	University Of Illinois Willard	US	Champaign
CMJ	Chi Mei	TW	Chi Mei
CMK	Club Makokola	MW	Club Makokola
CML	Camooweal	AU	Camooweal
CMM	Carmelita	GT	Carmelita
CMN	Mohamed V	MA	Casablanca
CMO	Obbia	SO	Obbia
CMP	Campo Alegre	BR	Santana Do Araguaia
CMQ	Clermont	AU	Clermont
CMR	Colmar-houssen	FR	Colmar
CMS	Scusciuban	SO	Scusciuban
CMT	Cameta	BR	Cameta
CMU	Chimbu	PG	Kundiawa
CMV	Coromandel	NZ	Coromandel
CMW	Ign Agramonte Intl	CU	Camaguey
CMX	Houghton County	US	Hancock
CMY	Fort Mccoy	US	Sparta
CMZ	Caia	MZ	Caia
CNA	Cananea	MX	Cananea
CNB	Coonamble	AU	Coonamble
CNC	Coconut Island	AU	Coconut Island
CND	Kogalniceanu	RO	Constanta
CNE	Canon City	US	Canon City
CNF	Tancredo Neves International	BR	Belo Horizonte, Minas Gerais
CNG	Parvaud	FR	Cognac
CNH	Municipal	US	Claremont
CNI	Changhai	CN	Changhai
CNJ	Cloncurry	AU	Cloncurry
CNK	Blosser Municipal	US	Concordia
CNL	Sindal	DK	Sindal
CNM	Carlsbad	US	Carlsbad
CNN	Chulman	RU	Chulman
CNO	Chino	US	Chino
CNP	Neerlerit Inaat	GL	Neerlerit Inaat
CNQ	Camba Punta	AR	Corrientes
CNR	Chanaral	CL	Chanaral
CNS	Cairns	AU	Cairns
CNT	Charata	AR	Charata
CNU	Martin Johnson	US	Chanute
CNV	Canavieiras	BR	Canavieiras
CNW	TSTC Waco Airport	US	Waco, TX
CNX	Chiang Mai International	TH	Chiang Mai
CNY	Canyonlands Field	US	Moab
CNZ	Cangamba	AO	Cangamba
COA	Columbia	US	Columbia
COB	Coolibah	AU	Coolibah
COC	Concordia	AR	Concordia
COD	Yellowstone Regional	US	Cody/Yellowstone
COF	Patrick AFB	US	Cocoa
COG	Mandinga	CO	Condoto
COH	Cooch Behar	IN	Cooch Behar
COI	Merritt Island	US	Cocoa
COJ	Coonabarabran	AU	Coonabarabran
COK	Cochin International	IN	Kochi
COL	Isle Of Coll	GB	Isle Of Coll
COM	Coleman	US	Coleman
CON	Concord	US	Concord
COO	Cotonou	BJ	Cotonou
COP	Cooperstown - Westville Airport	US	Cooperstown, NY
COQ	Choibalsan	MN	Choibalsan
COR	Pajas Blancas	AR	Cordoba
COS	Colorado Springs	US	Colorado Springs
COT	Cotulla	US	Cotulla
COU	Columbia Regional	US	Columbia
COV	Covilha	PT	Covilha
COW	Coquimbo	CL	Coquimbo
COX	Congo Town	BS	Congo Town
COY	Coolawanyah	AU	Coolawanyah
COZ	Constanza	DO	Constanza
CPA	A. Tubman	LR	Cape Palmas
CPB	Capurgana	CO	Capurgana
CPC	Chapelco	AR	San Martin DeLos Andes
CPD	Coober Pedy	AU	Coober Pedy
CPE	Campeche International	MX	Campeche
CPF	Cepu	ID	Cepu
CPG	Carmen De Patagones	AR	Carmen De Patagones
CPH	Kastrup	DK	Copenhagen
CPI	Cape Orford	PG	Cape Orford
CPL	Chaparral	CO	Chaparral
CPM	Compton	US	Compton, CA
CPN	Cape Rodney	PG	Cape Rodney
CPO	Chamonate	CL	Copiapo
CPQ	International	BR	Campinas
CPR	Natrona County International Airport	US	Casper, WY
CPS	St. Louis Downtown Airport	US	St Louis, Il
CPT	Cape Town International	ZA	Cape Town
CPU	Cururupu	BR	Cururupu
CPV	Joao Suassuna	BR	Campina Grande
CPX	Culebra	PR	Culebra
CQA	Canarana Airport	BR	Canarana
CQD	Shahre-kord	IR	Shahre-kord
CQF	Calais	FR	Calais
CQM	Ciudad Real Central	ES	Ciudad Real
CQP	Cape Flattery	AU	Cape Flattery
CQS	Costa Marques	BR	Costa Marques
CQT	Caquetania	CO	Caquetania
CRA	Craiova	RO	Craiova
CRB	Collarenebri	AU	Collarenebri
CRC	Cartago	CO	Cartago
CRD	Comodoro Rivadavia	AR	Comodoro Rivadavia
CRE	Grand Strand Airport	US	Myrtle Beach
CRF	Carnot	CF	Carnot
CRG	Craig Municipal	US	Jacksonville
CRH	Cherribah	AU	Cherribah
CRI	Crooked Island	BS	Crooked Island
CRJ	Coorabie	AU	Coorabie
CRK	Diosdado Macapagal International (Clark Int)	PH	Angeles City
CRL	Charleroi Brussels South	BE	Brussels
CRM	National	PH	Catarman
CRN	Cromarty	GB	Cromarty
CRO	Corcoran	US	Corcoran
CRP	Corpus Christi International Airport	US	Corpus Christi, TX
CRQ	Caravelas	BR	Caravelas
CRR	Ceres	AR	Ceres
CRS	Corsicana	US	Corsicana
CRT	Municipal	US	Crossett
CRU	Carriacou Is	GD	Carriacou Is
CRV	Crotone	IT	Crotone
CRW	Yeager	US	Charleston
CRX	Roscoe Turner	US	Corinth
CRY	Carlton Hill	AU	Carlton Hill
CRZ	Turkmenabad	TM	Turkmenabad
CSA	Isle Of Colonsay	GB	Isle Of Colonsay
CSB	Caransebes	RO	Caransebes
CSC	Canas	CR	Canas
CSD	Cresswell Downs	AU	Cresswell Downs
CSE	Crested Butte	US	Crested Butte
CSF	Creil	FR	Creil
CSG	Columbus Metropolitan	US	Columbus, GA
CSH	Solovky	RU	Solovetsky
CSI	Casino	AU	Casino
CSJ	Cape St Jacques	VN	Cape St Jacques
CSK	Cap Skirring	SN	Cap Skirring
CSM	Sherman	US	Clinton
CSN	Carson City	US	Carson City
CSO	Cochstedt	DE	Cochstedt
CSP	Coast Guard Heliport	US	Cape Spencer
CSQ	Municipal	US	Creston
CSR	Casuarito	CO	Casuarito
CSS	Cassilandia	BR	Cassilandia
CST	Castaway	FJ	Castaway
CSU	Santa Cruz Do Sul	BR	Santa Cruz Do Sul
CSV	Memorial	US	Crossville
CSW	Colorado do Oeste	BR	Colorado do Oeste
CSX	Changsha	CN	Changsha
CSY	Cheboksary	RU	Cheboksary
CSZ	Brigadier Hector Ruiz	AR	Coronel Suarez
CTA	Fontanarossa	IT	Catania
CTB	Cut Bank	US	Cut Bank
CTC	Catamarca	AR	Catamarca
CTD	Chitre	PA	Chitre
CTE	Carti	PA	Carti
CTF	Coatepeque Airport	GT	Coatepeque
CTG	Rafael Nunez	CO	Cartagena
CTH	Chestercounty Carlson	US	Coatesville
CTI	Cuito Cuanavale	AO	Cuito Cuanavale
CTK	Canton	US	Canton
CTL	Charleville	AU	Charleville
CTM	Chetumal	MX	Chetumal
CTN	Cooktown	AU	Cooktown
CTO	Peconic River	US	Calverton
CTP	Carutapera	BR	Carutapera
CTQ	Do Palmar	BR	Santa Vitoria
CTR	Cattle Creek	AU	Cattle Creek
CTS	New Chitose Airport	JP	Sapporo
CTT	Le Castellet	FR	Le Castellet
CTU	Shuangliu	CN	Chengdu
CTW	Cottonwood	US	Cottonwood
CTX	Cortland	US	Cortland
CTY	Cross City	US	Cross City
CTZ	Sampson County	US	Clinton
CUA	Ciudad Constitucion	MX	Ciudad Constitucion
CUB	Owens Field	US	Columbia
CUC	Camilo Dazo	CO	Cucuta
CUD	Caloundra	AU	Caloundra
CUE	Cuenca	EC	Cuenca
CUF	Levaldigi	IT	Cuneo
CUG	Cudal	AU	Cudal
CUH	Municipal	US	Cushing
CUI	Currillo	CO	Currillo
CUJ	Culion	PH	Culion
CUK	Caye Caulker	BZ	Caye Caulker
CUL	Fedl De Bachigualato	MX	Culiacan
CUM	Cumana	VE	Cumana
CUN	Cancún International	MX	Cancun
CUO	Caruru	CO	Caruru
CUP	Carupano	VE	Carupano
CUQ	Coen	AU	Coen
CUR	Hato International Airport	AN	Curacao
CUS	Municipal	US	Columbus
CUT	Cutral	AR	Cutral
CUU	Gen Fierro Villalobos	MX	Chihuahua
CUV	Casigua	VE	Casigua
CUW	Cube Cove	US	Cube Cove
CUX	Cuddihy Field	US	Corpus Christi
CUY	Cue	AU	Cue
CUZ	Velazco Astete	PE	Cuzco
CVA	Civic Ar Heli	US	Pittsburgh
CVB	Chungribu	PG	Chungribu
CVC	Cleve	AU	Cleve
CVE	Covenas	CO	Covenas
CVF	Courchevel	FR	Courchevel
CVG	Cincinnati/Northern Kentucky	US	Covington, KY
CVH	Caviahue	AR	Caviahue
CVI	Caleta Olivia	AR	Caleta Olivia
CVJ	General Mariano Matamoros Airport	MX	Cuernavaca
CVL	Cape Vogel	PG	Cape Vogel
CVM	Ciudad Victoria	MX	Ciudad Victoria
CVN	Municipal	US	Clovis
CVO	Albany	US	Albany
CVQ	Carnarvon	AU	Carnarvon
CVR	Hughes	US	Culver City
CVS	Cannon AFB	US	Clovis
CVT	West Midlands International	GB	Coventry
CVU	Corvo Island	PT	Corvo Island
CWA	Central Wisconsin	US	Wausau
CWB	Afonso Pena International Airport	BR	Curitiba
CWC	Chernovtsy	UA	Chernovtsy
CWG	Callaway Gardens	US	Callaway Gardens
CWI	Clinton	US	Clinton
CWL	Cardiff	GB	Cardiff
CWO	Ft Wolter AAF	US	Mineral Wells
CWP	Campbellpore	PK	Campbellpore
CWR	Cowarie	AU	Cowarie
CWS	Center Island	US	Center Island
CWT	Cowra	AU	Cowra
CWW	Corowa	AU	Corowa
CXA	Caicara Del Orinoco	VE	Caicara Del Orinoco
CXC	Chitina Arpt	US	Chitina
CXF	Coldfoot	US	Coldfoot
CXH	Coal Harbour	CA	Vancouver
CXI	Cassidy International Airport	KI	Christmas Island
CXJ	Campo Dos Bugres	BR	Caxias Do Sul
CXL	International	US	Calexico
CXN	Candala	SO	Candala
CXO	Montgomery Co	US	Conroe
CXP	Tunggul Wulung	ID	Cilacap
CXQ	Christmas Creek	AU	Christmas Creek
CXR	Nha Trang (no Longer in Operation)	VN	Nha Trang
CXT	Charters Towers	AU	Charters Towers
CXY	Cat Cays	BS	Cat Cays
CYA	Les Cayes	HT	Les Cayes
CYB	Gerrard-Smith	KY	Cayman Brac Is
CYC	Caye Chapel	BZ	Caye Chapel
CYE	Crystal Lake	US	Crystal Lake
CYF	Chefornak SPB	US	Chefornak
CYG	Corryong	AU	Corryong
CYI	Chiayi	TW	Chiayi
CYL	Coyoles	HN	Coyoles
CYM	Chatham SPB	US	Chatham
CYO	Cayo Largo Del Sur	CU	Cayo Largo Del Sur
CYP	Calbayog	PH	Calbayog
CYR	Laguna De Los Patos	UY	Colonia
CYS	Cheyenne	US	Cheyenne
CYT	Intermediate	US	Yakataga
CYU	Cuyo	PH	Cuyo
CYX	Cherskiy	RU	Cherskiy
CYZ	Cauayan	PH	Cauayan
CZA	Chichen Itza	MX	Chichen Itza
CZB	Carlos Ruhl	BR	Cruz Alta
CZC	Copper Centre	US	Copper Centre
CZE	Coro	VE	Coro
CZF	Cape Romanzof	US	Cape Romanzof
CZH	Corozal	BZ	Corozal
CZJ	Corazon De Jesus	PA	Corazon De Jesus
CZK	Cascade Locks/Stevens	US	Cascade Locks
CZL	Ain El Bey	DZ	Constantine
CZM	Cozumel	MX	Cozumel
CZN	Chisana Field	US	Chisana
CZO	Chistochina	US	Chistochina
CZP	Cape Pole	US	Cape Pole
CZS	Intl. Airpt. Cruzeiro Do Sul	BR	Cruzeiro Do Sul
CZT	Carrizo Springs	US	Carrizo Springs
CZU	Corozal	CO	Corozal
CZW	Czestochowa	PL	Czestochowa
CZX	Changzhou	CN	Changzhou
CZY	Cluny	AU	Cluny
CZZ	Campo	US	Campo
DAA	Davison AAF	US	Fort Belvoir
DAB	Regional	US	Daytona Beach
DAC	Zia International	BD	Dhaka
DAD	Da Nang	VN	Da Nang
DAE	Daparizo	IN	Daparizo
DAF	Daup	PG	Daup
DAG	Barstow-Daggett	US	Daggett
DAH	Dathina	YE	Dathina
DAI	Darjeeling	IN	Darjeeling
DAJ	Dauan Island	AU	Dauan Island
DAK	Dakhla	EG	Dakhla Oasis
DAL	Love Field	US	Dallas
DAM	International	SY	Damascus
DAN	Municipal	US	Danville
DAO	Dabo	PG	Dabo
DAP	Darchula	NP	Darchula
DAR	International	TZ	Dar Es Salaam
DAS	Great Bear Lake	CA	Great Bear Lake
DAT	Datong	CN	Datong
DAU	Daru	PG	Daru
DAV	Enrique Malek	PA	David
DAX	Daxian	CN	Daxian
DAY	James Cox Dayton Intl	US	Dayton, Oh
DAZ	Darwaz	AF	Darwaz
DBA	Dalbandin	PK	Dalbandin
DBB	Alalamain Intl.	EG	Dabaa City
DBD	Dhanbad	IN	Dhanbad
DBM	Debra Marcos	ET	Debra Marcos
DBN	Municipal	US	Dublin
DBO	Dubbo	AU	Dubbo
DBP	Debepare	PG	Debepare
DBQ	Municipal	US	Dubuque
DBS	Dubois	US	Dubois
DBT	Debra Tabor	ET	Debra Tabor
DBU	Dambulu Oya Tank	LK	Dambula
DBV	Dubrovnik	HR	Dubrovnik
DBY	Dalby	AU	Dalby
DCA	Ronald Reagan Washington National Airport	US	Washington, DC
DCF	Cane Field	DM	Roseau
DCI	Rafsu Decimomannu	IT	Decimomannu
DCK	Dahl Creek Arpt	US	Dahl Creek
DCM	Mazamet	FR	Castres
DCR	Decatur Hi-Way	US	Decatur
DCT	Duncan Town	BS	Duncan Town
DCU	Pyor	US	Decatur
DDC	Dodge City Municipal	US	Dodge City
DDG	Dandong	CN	Dandong
DDI	Daydream Is	AU	Daydream Is
DDM	Dodoima	PG	Dodoima
DDN	Delta Downs	AU	Delta Downs
DDP	Dorado Beach	PR	Dorado
DDU	Dadu	PK	Dadu
DEA	Dera Ghazi Khan	PK	Dera Ghazi Khan
DEB	Debrecen	HU	Debrecen
DEC	Decatur Arpt	US	Decatur
DED	Dehra Dun	IN	Dehra Dun
DEF	Dezful	IR	Dezful
DEH	Municipal	US	Decorah
DEI	Denis Island	SC	Denis Island
DEL	Indira Gandhi Intl	IN	New Delhi
DEM	Dembidollo	ET	Dembidollo
DEN	Denver International	US	Denver
DEO	Hyatt Regency H/P	US	Dearborn
DEP	Deparizo	IN	Deparizo
DER	Derim	PG	Derim
DES	Desroches	SC	Desroches
DET	Detroit City	US	Detroit, MI
DEZ	Al Jafrah	SY	Deirezzor
DFI	Memorial	US	Defiance
DFP	Drumduff	AU	Drumduff
DFW	Dallas/Fort Worth International	US	Dallas, TX
DGA	Dangriga	BZ	Dangriga
DGB	Danger Bay	US	Danger Bay
DGC	Degahbur	ET	Degahbur
DGD	Dalgaranga	AU	Dalgaranga
DGE	Mudgee	AU	Mudgee
DGF	Bisbee-Douglas International	US	Douglas
DGG	Daugo	PG	Daugo
DGK	Dugong	MZ	Dugong
DGL	Douglas Municipal	US	Douglas
DGM	Dongguan	CN	Dongguan
DGN	NAF	US	Dahlgren
DGO	Guadalupe Victoria	MX	Durango
DGP	Daugavpils	LV	Daugavpils
DGR	Dargaville	NZ	Dargaville
DGT	Dumaguete	PH	Dumaguete
DGU	Dedougou	BF	Dedougou
DGW	Converse County	US	Douglas
DHA	King Abdulaziz AB	SA	Dhahran
DHD	Durham Downs	AU	Durham Downs
DHF	Al Dhafra Military Apt	AE	Abu Dhabi
DHI	Dhangarhi	NP	Dhangarhi
DHL	Dhala	YE	Dhala
DHM	Gaggal Airport	IN	Dharamsala
DHN	Dothan Arpt	US	Dothan
DHR	De Kooy/Den Helder Airport	NL	Den Helder
DHT	Dalhart	US	Dalhart
DIB	Dibrugarh	IN	Dibrugarh
DIC	Dili City Heliport	TP	Dili
DIE	Antsiranana/Arrachart	MG	Antsiranana
DIG	Diqing	CN	Diqing
DIJ	Dijon	FR	Dijon
DIK	Dickinson	US	Dickinson
DIL	Presidente Nicolau Lobato International Airport	TP	Dili
DIM	Dimbokro	CI	Dimbokro
DIN	Dien Bien	VN	Dien Bien Phu
DIO	Diomede Island	US	Diomede Island
DIP	Diapaga	BF	Diapaga
DIQ	Divinopolis	BR	Divinopolis
DIR	Aba Tenna D Yilma	ET	Dire Dawa
DIS	Loubomo	CG	Loubomo
DIU	Diu	IN	Diu
DIV	Divo	CI	Divo
DIW	Mawella Lagoon	LK	Dickwella
DIY	Diyarbakir	TR	Diyarbakir
DJA	Djougou	BJ	Djougou
DJB	Sultan Taha Syarifudn	ID	Jambi
DJE	Djerba-Zarzis	TN	Djerba
DJG	Inedbirenne	DZ	Djanet
DJJ	Sentani	ID	Jayapura
DJM	Djambala	CG	Djambala
DJN	Delta Junction	US	Delta Junction
DJO	Daloa	CI	Daloa
DJU	Djupivogur	IS	Djupivogur
DKI	Dunk Island	AU	Dunk Island
DKK	Dunkirk	US	Dunkirk
DKR	Dakar-Yoff-Léopold Sédar Senghor International	SN	Dakar
DKS	Dikson	RU	Dikson
DKV	Docker River	AU	Docker River
DLA	Douala	CM	Douala
DLB	Dalbertis	PG	Dalbertis
DLC	Dalian	CN	Dalian
DLD	Dagali Airport	NO	Geilo
DLE	Tavaux	FR	Dole
DLF	Laughlin Afb	US	Del Rio
DLG	Municipal	US	Dillingham
DLH	Duluth International	US	Duluth
DLI	Lienkhang	VN	Dalat
DLK	Dulkaninna	AU	Dulkaninna
DLL	Dillon	US	Dillon
DLM	Dalaman	TR	Dalaman
DLN	Dillon	US	Dillon
DLO	Dolomi	US	Dolomi
DLP	Disneyland Paris	FR	Disneyland Paris
DLS	Columbia Gorge Regional/The Dalles Municipal Airport	US	The Dalles
DLU	Dali	CN	Dali City
DLV	Delissaville	AU	Delissaville
DLY	Dillons Bay	VU	Dillons Bay
DLZ	Dalanzadgad	MN	Dalanzadgad
DMA	Davis Monthan AFB	US	Tucson
DMB	Zhambyl	KZ	Zhambyl
DMD	Doomadgee	AU	Doomadgee
DME	Domodedovo	RU	Moscow
DMK	Don Muang	TH	Bangkok
DMM	King Fahd International Airport	SA	Dammam
DMN	Deming	US	Deming
DMO	Sedalia	US	Sedalia
DMR	Dhamar	YE	Dhamar
DMT	Diamantino	BR	Diamantino
DMU	Dimapur	IN	Dimapur
DNA	Kadena AB	JP	Okinawa
DNB	Dunbar	AU	Dunbar
DNC	Danane	CI	Danane
DND	Dundee	GB	Dundee
DNE	Dallas North Airport	US	Dallas
DNF	Martuba	LY	Derna
DNG	Doongan	AU	Doongan
DNH	Dunhuang	CN	Dunhuang
DNI	Wad Medani	SD	Wad Medani
DNK	Dnepropetrovsk	UA	Dnepropetrovsk
DNL	Daniel Field	US	Augusta, GA
DNM	Denham	AU	Denham
DNN	Municipal	US	Dalton
DNO	Dianopolis	BR	Dianopolis
DNP	Dang	NP	Dang
DNQ	Deniliquin	AU	Deniliquin
DNR	Pleurtuit	FR	Dinard
DNS	Municipal	US	Denison
DNT	Downtown Heliport	US	Santa Ana
DNU	Dinangat	PG	Dinangat
DNV	Vermilion County	US	Danville, IL
DNX	Galegu	SD	Dinder
DNZ	Cardak	TR	Denizli
DOA	Doany	MG	Doany
DOB	Dobo Airport	ID	Dobo
DOC	Dornoch	GB	Dornoch
DOD	Dodoma	TZ	Dodoma
DOE	Djoemoe	SR	Djoemoe
DOF	Dora Bay	US	Dora Bay
DOG	Dongola	SD	Dongola
DOH	Doha	QA	Doha
DOI	Doini	PG	Doini
DOK	Donetsk International Airport	UA	Donetsk
DOL	St Gatien	FR	Deauville
DOM	Melville Hall	DM	Dominica
DON	Dos Lagunas	GT	Dos Lagunas
DOO	Dorobisoro	PG	Dorobisoro
DOP	Dolpa	NP	Dolpa
DOR	Dori	BF	Dori
DOS	Dios	PG	Dios
DOU	Dourados	BR	Dourados
DOV	Dover AFB	US	Dover-Cheswold, DE
DOX	Dongara	AU	Dongara
DOY	Dongying	CN	Dongying
DPA	Dupage County	US	Chicago
DPE	Dieppe	FR	Dieppe
DPG	Michael AAF	US	Dugway
DPK	Deer Park	US	Deer Park
DPL	Dipolog	PH	Dipolog
DPO	Devonport	AU	Devonport
DPS	Ngurah Rai International	ID	Denpasar, Bali
DPU	Dumpu	PG	Dumpu
DRA	Desert Rock	US	Mercury, NV
DRB	Derby	AU	Derby
DRC	Dirico	AO	Dirico
DRD	Dorunda Station	AU	Dorunda Station
DRE	Drummond Island	US	Drummond Island
DRF	Drift River	US	Drift River
DRG	Deering	US	Deering
DRH	Dabra	ID	Dabra
DRI	Beauregard Parish	US	De Ridder
DRJ	Drietabbetje	SR	Drietabbetje
DRM	Drama	GR	Drama
DRN	Dirranbandi	AU	Dirranbandi
DRO	La Plata	US	Durango
DRR	Durrie	AU	Durrie
DRS	Dresden Arpt	DE	Dresden
DRT	International	US	Del Rio
DRU	Drummond	US	Drummond
DRW	Darwin	AU	Darwin
DRY	Drysdale River	AU	Drysdale River
DSA	Robin Hood	GB	Doncaster/Sheffield
DSC	Dschang	CM	Dschang
DSD	La Desirade	GP	La Desirade
DSE	Combolcha	ET	Dessie
DSG	Dilasag	PH	Dilasag
DSI	Destin-Fort Walton Beach Airport	US	Destin
DSK	Dera Ismail Khan	PK	Dera Ismail Khan
DSL	Daru	SL	Daru
DSM	Des Moines International	US	Des Moines, IA
DSN	Dongsheng	CN	Dongsheng
DSV	Dansville	US	Dansville
DTA	Delta	US	Delta
DTD	Datadawai	ID	Datadawai
DTE	Naga	PH	Daet
DTH	Death Valley	US	Death Valley
DTL	Municipal	US	Detroit Lakes
DTM	Dortmund	DE	Dortmund
DTN	Shreveport Downtown	US	Shreveport, LA
DTR	Decatur Island	US	Decatur Island
DTW	Detroit Metropolitan Wayne County	US	Detroit, MI
DUA	Eaker	US	Durant
DUB	Dublin	IE	Dublin
DUC	Halliburton Field	US	Duncan
DUD	Dunedin International	NZ	Dunedin
DUE	Dundo	AO	Dundo
DUF	Pine Island Airport	US	Corolla, NC
DUG	Bisbee-Douglas Intl	US	Douglas
DUJ	Du Bois-Jefferson County	US	Du Bois
DUK	Dukuduk	ZA	Dukuduk
DUM	Pinang Kampai	ID	Dumai
DUN	Dundas	GL	Dundas
DUQ	Duncan/Quam	CA	Duncan/Quam
DUR	Durban International	ZA	Durban
DUS	Düsseldorf International Airport (rhein-ruhr)	DE	Dusseldorf
DUT	Emergency Field	US	Dutch Harbor
DVA	Deva	RO	Deva
DVK	Diavik	CA	Diavik
DVL	Devils Lake	US	Devils Lake
DVN	Davenport	US	Davenport
DVO	Francisco Bangoy International	PH	Davao
DVP	Davenport Downs	AU	Davenport Downs
DVR	Daly River	AU	Daly River
DVT	Phoenix Deer Valley Airport	US	Phoenix
DWA	Dwangwa	MW	Dwangwa
DWB	Soalala	MG	Soalala
DWD	Dawadmi	SA	Dawadmi
DWF	Wright AFB	US	Dayton
DWH	David Wayne Hooks	US	Houston
DWN	Downtown Airpark	US	Oklahoma City
DWS	Walt Disney World	US	Orlando
DXA	Deux Alpes	FR	Deux Alpes
DXB	Dubai	AE	Dubai
DXD	Dixie	AU	Dixie
DXR	Danbury Municipal Airport	US	Danbury, CT
DYA	Dysart	AU	Dysart
DYG	Dayong	CN	Dayong
DYL	Doylestown	US	Doylestown
DYM	Diamantina Lakes	AU	Diamantina Lakes
DYR	Anadyr	RU	Anadyr
DYS	Dyess AFB	US	Abilene
DYU	Dushanbe	TJ	Dushanbe
DYW	Daly Waters	AU	Daly Waters
DZA	Dzaoudzi	KM	Dzaoudzi
DZI	Codazzi	CO	Codazzi
DZN	Zhezhazgan	KZ	Zhezkazgan
DZO	Santa Bernardina	UY	Durazno
DZU	Dazu	CN	Dazu
EAA	Eagle	US	Eagle
EAB	Abbse	YE	Abbse
EAE	Emae	VU	Emae
EAL	Elenak	MH	Kwajalein Atoll
EAM	Nejran	SA	Nejran
EAN	Phifer Field	US	Wheatland
EAR	Kearney	US	Kearney
EAS	Donostia - San Sebastian	ES	San Sebastian
EAT	Pangborn Field	US	Wenatchee
EAU	Chippewa Valley Regional Airport	US	Eau Claire, WI
EBA	Marina Di Campo	IT	Elba Island
EBB	Entebbe	UG	Entebbe
EBD	El Obeid	SD	El Obeid
EBG	El Bagre	CO	El Bagre
EBJ	Esbjerg	DK	Esbjerg
EBL	Erbil International (Irbil Northwest)	IQ	Erbil
EBM	El Borma	TN	El Borma
EBN	Ebadon	MH	Ebadon
EBO	Ebon Airport	MH	Ebon
EBR	Downtown	US	Baton Rouge
EBS	Municipal	US	Webster City
EBU	Boutheon	FR	St Etienne
EBW	Ebolowa	CM	Ebolowa
ECA	Emmet County Airport	US	East Tawas
ECG	Elizabeth City	US	Elizabeth City, NC
ECH	Echuca	AU	Echuca
ECN	Ercan	CY	Lefkosa
ECO	El Encanto	CO	El Encanto
ECR	El Charco	CO	El Charco
ECS	Mondell	US	Newcastle
EDA	Edna Bay	US	Edna Bay
EDB	Eldebba	SD	Eldebba
EDD	Erldunda	AU	Erldunda
EDE	Municipal	US	Edenton
EDF	Elmendorf Afb	US	Anchorage
EDG	Weide AAF	US	Edgewood
EDI	Edinburgh	GB	Edinburgh
EDK	El Dorado	US	El Dorado
EDL	Eldoret	KE	Eldoret
EDM	Les Ajoncs	FR	La Roche
EDO	Edremit/korfez	TR	Edremit/korfez
EDQ	Erandique	HN	Erandique
EDR	Edward River	AU	Edward River
EDW	Edwards AFB	US	Edwards AFB
EED	Needles	US	Needles
EEK	Eek	US	Eek
EEN	Dillant-Hopkins	US	Keene
EFB	Eight Fathom Bight	US	Eight Fathom Bight
EFD	Ellington Field	US	Houston
EFG	Efogi	PG	Efogi
EFK	Newport	US	Newport
EFL	Kefalonia Istland International Airport	GR	Kefalonia
EFO	East Fork	US	East Fork
EFW	Municipal	US	Jefferson
EGA	Engati	PG	Engati
EGC	Roumanieres	FR	Bergerac
EGE	Eagle County	US	Vail/Eagle
EGI	Duke Field	US	Valparaiso
EGL	Neghelli	ET	Neghelli
EGM	Sege	SB	Sege
EGN	Geneina	SD	Geneina
EGO	Belgorod	RU	Belgorod
EGP	Maverick Co	US	Eagle Pass
EGS	Egilsstadir	IS	Egilsstadir
EGV	Eagle River	US	Eagle River
EGX	Egegik	US	Egegik
EHL	El Bolson	AR	El Bolson
EHM	Cape Newenham	US	Cape Newenham
EHT	Rentschler	US	East Hartford
EIA	Popondetta	PG	Eia
EIB	Eisenach	DE	Eisenach
EIE	Eniseysk	RU	Eniseysk
EIH	Einasleigh	AU	Einasleigh
EIL	Eielson AFB	US	Fairbanks
EIN	Eindhoven	NL	Eindhoven
EIS	Beef Island	VG	Beef Island
EIY	Ein Yahav	IL	Ein Yahav
EJA	Variguies	CO	Barrancabermeja
EJH	Wedjh	SA	Wedjh
EJT	Enijet	MH	Mili Atoll
EKA	Murray Field	US	Eureka, CA
EKB	Ekibastuz	KZ	Ekibastuz
EKD	Elkedra	AU	Elkedra
EKE	Ekereku	GY	Ekereku
EKI	Municipal	US	Elkhart
EKN	Elkins	US	Elkins
EKO	Elko Regional	US	Elko, NV
EKT	Eskilstuna	SE	Eskilstuna
EKX	Elizabethtown	US	Elizabethtown
ELA	Eagle Lake	US	Eagle Lake
ELB	San Bernado	CO	El Banco
ELC	Elcho Island	AU	Elcho Island
ELD	Goodwin Field	US	El Dorado
ELE	El Real	PA	El Real
ELF	El Fasher	SD	El Fasher
ELG	Djamet	DZ	El Golea
ELH	International	BS	North Eleuthera
ELI	Elim	US	Elim
ELJ	El Recreo	CO	El Recreo
ELK	Municipal	US	Elk City
ELL	Ellisras	ZA	Ellisras
ELM	Elmira Corning Regional	US	Corning, NY
ELN	Bowers Field	US	Ellensburg
ELO	Eldorado	AR	Eldorado
ELP	El Paso International Airport	US	El Paso
ELQ	Gassim Regional Airport	SA	Buraidah
ELR	Elelim	ID	Elelim
ELS	East London	ZA	East London
ELT	Tour Sinai City	EG	Tour Sinai City
ELU	Guemar	DZ	El Oued
ELV	Elfin Cove SPB	US	Elfin Cove
ELW	Ellamar	US	Ellamar
ELX	El Tigre	VE	El Tigre
ELY	Yelland	US	Ely
ELZ	Municipal	US	Wellsville
EMA	East Midlands	GB	Derby
EMB	Embarkadero	US	San Francisco
EMD	Emerald	AU	Emerald
EME	Emden	DE	Emden
EMG	Empangeni	ZA	Empangeni
EMI	Emirau	PG	Emirau
EMK	Emmonak	US	Emmonak
EML	Emmen	CH	Luzern
EMM	Kemerer	US	Kemerer
EMN	Nema	MR	Nema
EMO	Emo	PG	Emo
EMP	Emporia	US	Emporia
EMS	Embessa	PG	Embessa
EMT	El Monte	US	El Monte
EMX	El Maiten	AR	El Maiten
EMY	El Minya	EG	El Minya
ENA	Kenai	US	Kenai
ENB	Eneabba West	AU	Eneabba West
ENC	Essey	FR	Nancy
END	Vance Afb	US	Enid
ENE	Ende	ID	Ende
ENF	Enontekio	FI	Enontekio
ENH	Enshi	CN	Enshi
ENI	El Nido	PH	El Nido
ENJ	El Naranjo	GT	El Naranjo
ENK	Enniskillen St. Angelo	GB	Enniskillen
ENL	Municipal	US	Centralia
ENN	Municipal	US	Nenana
ENO	Teniente Prim Alarcon	PY	Encarnacion
ENQ	Coronel E Soto Cano AB	HN	Coronel E Soto Cano AB
ENS	Twente	NL	Enschede
ENT	Enewetak Island	MH	Enewetak Island
ENU	Enugu	NG	Enugu
ENV	Wendover	US	Wendover
ENW	Kenosha Regional Airport	US	Kenosha
EOH	Enrique Olaya Herrera International Airport	CO	Medellín
EOI	Eday	GB	Eday
EOK	Keokuk	US	Keokuk
EOR	El Dorado	VE	El Dorado
EOS	Neosho	US	Neosho
EOZ	Elorza	VE	Elorza
EPA	El Palomar	AR	El Palomar
EPG	Browns	US	Weeping Water
EPH	Ephrata	US	Ephrata
EPI	Epi	VU	Epi
EPK	Episkopi	CY	Episkopi
EPL	Mirecourt	FR	Epinal
EPN	Epena	CG	Epena
EPR	Esperance	AU	Esperance
EPS	Arroyo Barril International	DO	Samana
EPT	Eliptamin	PG	Eliptamin
EPU	Parnu	EE	Parnu
EQS	Esquel	AR	Esquel
ERA	Erigavo	SO	Erigavo
ERB	Ernabella	AU	Ernabella
ERC	Erzincan	TR	Erzincan
ERD	Berdyansk	UA	Berdyansk
ERE	Erave	PG	Erave
ERF	Erfurt	DE	Erfurt
ERH	Moulay Ali Cherif	MA	Er-Rachidia
ERI	International	US	Erie
ERM	Comandante Kraemer	BR	Erechim
ERN	Eirunepe	BR	Eirunepe
ERO	Coast Guard	US	Eldred Rock
ERR	Errol	US	Errol
ERS	Eros	NA	Windhoek
ERT	Erdenet	MN	Erdenet
ERU	Erume	PG	Erume
ERV	Kerrville	US	Kerrville, TX
ERZ	Erzurum Hava Alani	TR	Erzurum
ESB	Esenboga	TR	Ankara
ESC	Delta County Arpt	US	Escanaba
ESD	Orcas Island	US	Eastsound
ESE	Ensenada	MX	Ensenada
ESF	Esler Field	US	Alexandria
ESG	Mariscal Estigarribia	PY	Mariscal Estigarribia
ESH	Shoreham	GB	Shoreham By Sea
ESI	Espinosa	BR	Espinosa
ESK	Eskisehir	TR	Eskisehir
ESL	Elista	RU	Elista
ESM	Esmeraldas	EC	Esmeraldas
ESN	Easton	US	Easton
ESO	Espanola	US	Espanola
ESP	Birchwood-Pocono	US	East Stroudsburg
ESR	El Salvador	CL	El Salvador
ESS	Essen	DE	Essen
EST	Municipal	US	Estherville
ESU	Essaouira	MA	Essaouira
ESW	State	US	Easton
ETB	West Bend	US	West Bend
ETD	Etadunna	AU	Etadunna
ETE	Genda Wuha	ET	Genda Wuha
ETH	Eilat	IL	Eilat
ETN	Municipal	US	Eastland
ETS	Municipal	US	Enterprise
ETZ	Metz-nancy-lorraine	FR	Metz/nancy
EUA	Kaufana	TO	Eua
EUC	Eucla	AU	Eucla
EUE	Eureka	US	Eureka
EUF	Weedon Field	US	Eufaula
EUG	Eugene	US	Eugene
EUM	Neumuenster	DE	Neumuenster
EUN	Hassan I	MA	Laayoune
EUO	Paratebueno	CO	Paratebueno
EUQ	Evelio Javier	PH	Antique
EUX	F D Roosevelt	AN	St Eustatius
EVA	Landing Strip	US	Evadale
EVD	Eva Downs	AU	Eva Downs
EVE	Evenes	NO	Harstad-narvik
EVG	Sveg	SE	Sveg
EVH	Evans Head	AU	Evans Head
EVM	Eveleth	US	Eveleth
EVN	Zvartnots	AM	Yerevan
EVV	Evansville Regional Airport	US	Evansville, IN
EVW	Evanston	US	Evanston
EVX	Evreux	FR	Evreux
EWB	New Bedford	US	New Bedford
EWD	Wildman Lake	US	Wildman Lake
EWE	Ewer	ID	Ewer
EWI	Enarotali	ID	Enarotali
EWK	City-County	US	Newton
EWN	Simmons Nott	US	New Bern, NC
EWO	Ewo	CG	Ewo
EWR	Newark Liberty International	US	Newark
EWY	Greenham RAF	GB	Newbury
EXI	SPB	US	Excursion Inlet
EXM	Exmouth Gulf	AU	Exmouth Gulf
EXT	Exeter	GB	Exeter
EYL	Yelimane	ML	Yelimane
EYP	El Yopal	CO	El Yopal
EYR	Yerington	US	Yerington
EYS	Eliye Springs	KE	Eliye Springs
EYW	International	US	Key West
EZE	Ezeiza Ministro Pistarini	AR	Buenos Aires
EZS	Elazig	TR	Elazig
FAA	Faranah	GN	Faranah
FAB	Farnborough	GB	Farnborough
FAC	Faaite	PF	Faaite
FAE	Vagar	FO	Sorvágur
FAF	Felker AAF	US	Fort Eustis
FAG	Fagurholsmyri	IS	Fagurholsmyri
FAH	Farah	AF	Farah
FAI	Fairbanks International Airport	US	Fairbanks
FAJ	Diego Jimenez Torres	PR	Fajardo
FAK	False Island	US	False Island
FAL	Falcon State	US	Roma
FAM	Regional	US	Farmington
FAN	Lista	NO	Farsund
FAO	Faro	PT	Faro
FAQ	Freida River	PG	Freida River
FAR	Hector Field	US	Fargo
FAS	Faskrudsfjordur	IS	Faskrudsfjordur
FAT	Fresno Air Terminal Airport	US	Fresno
FAV	Fakarava	PF	Fakarava
FAY	Municipal	US	Fayetteville
FAZ	Fasa	IR	Fasa
FBD	Faizabad	AF	Faizabad
FBE	Francisco Beltrao	BR	Francisco Beltrao
FBG	Simmons AAF	US	Fort Bragg
FBK	Ft Wainwright	US	Fairbanks, AK
FBL	Municipal	US	Faribault
FBM	Luano	CD	Lubumbashi
FBR	Fort Bridger	US	Fort Bridger
FBS	Friday Harbor SPB	US	Friday Harbor SPB
FBY	Municipal	US	Fairbury
FCA	Glacier Park International	US	Kalispell, MT
FCB	Ficksburg Sentra Oes	ZA	Ficksburg
FCH	Fresno-Chandler	US	Fresno
FCM	Flying Cloud	US	Minneapolis
FCN	Cuxhaven/Nordholz	DE	Cuxhaven
FCO	Leonardo da Vinci International (Fiumicino)	IT	Rome
FCS	Butts AAF	US	Colorado Springs
FCT	Firing Center AAF	US	Yakima
FCY	Municipal	US	Forrest City
FDE	Bringeland	NO	Forde
FDF	Lamentin	MQ	Fort De France
FDH	Friedrichshafen	DE	Friedrichshafen
FDK	Frederick Municipal	US	Frederick
FDR	Municipal	US	Frederick
FDU	Bandundu	ZR	Bandundu
FDY	Findlay	US	Findlay
FEA	Fetlar	GB	Fetlar
FEB	Sanfebagar	NP	Sanfebagar
FEC	Feira De Santana	BR	Feira De Santana
FEG	Fergana	UZ	Fergana
FEJ	Feijo	BR	Feijo
FEK	Ferkessedougou	CI	Ferkessedougou
FEL	Fuerstenfeldbruck	DE	Fuerstenfeldbruck
FEN	Fernando De Noronha	BR	Fernando De Noronha
FEP	Albertus	US	Freeport
FER	Fergusons Gulf	KE	Fergusons Gulf
FES	San Fernando	ES	San Fernando
FET	Municipal	US	Fremont
FEW	Warren AFB	US	Cheyenne
FEZ	Sais	MA	Fez
FFA	First Flight	US	Kill Devil Hills
FFD	RAF Station	GB	Fairford
FFL	Municipal	US	Fairfield
FFM	Fergus Falls	US	Fergus Falls
FFO	Patterson Afb	US	Dayton
FFT	Capital City	US	Frankfort, KY
FFU	Futaleufu	CL	Futaleufu
FGD	Fderik	MR	Fderik
FGI	Fagali I	WS	Apia
FGL	Fox Glacier	NZ	Fox Glacier
FGR	Fuengirola	ES	Fuengirola
FGU	Fangatau	PF	Fangatau
FHU	Municipal	US	Sierra Vista
FHZ	Fakahina	PF	Fakahina
FIC	Fire Cove	US	Fire Cove
FID	Elizabeth Field	US	Fishers Island
FIE	Fair Isle	GB	Fair Isle
FIG	Fria	GN	Fria
FIH	N?djili International	CD	Kinshasa
FIK	Finke	AU	Finke
FIL	Municipal	US	Fillmore
FIN	Finschhafen	PG	Finschhafen
FIV	Five Finger	US	Five Finger Coast Guard Heliport
FIZ	Fitzroy Crossing	AU	Fitzroy Crossing
FJR	Fujairah Intl	AE	Al-fujairah
FKB	Soellingen	DE	Karlsruhe/Baden Baden
FKH	Sculthorp RAF	GB	Fakenham
FKI	Kisangani	CD	Kisangani
FKJ	Fukui	JP	Fukui
FKL	Chess-Lambertin	US	Franklin
FKN	Municipal	US	Franklin
FKQ	Fak Fak	ID	Fak Fak
FKS	Fukushima Airport	JP	Fukushima
FLA	Capitolio	CO	Florencia
FLB	Cangapara	BR	Floriano
FLC	Falls Creek	AU	Falls Creek
FLD	Fond Du Lac	US	Fond Du Lac
FLE	Fort Lee AAF	US	Petersburg
FLF	Schaferhaus	DE	Flensburg
FLG	Pulliam Field	US	Grand Canyon
FLH	Flotta	GB	Flotta
FLI	Flateyri	IS	Flateyri
FLJ	Falls Bay	US	Falls Bay
FLL	Fort Lauderdale/hollywood International	US	Fort Lauderdale, FL
FLM	Filadelfia	PY	Filadelfia
FLN	Hercilio Luz	BR	Florianopolis
FLO	Florence	US	Florence
FLP	Flippin	US	Flippin
FLR	Peretola	IT	Florence
FLS	Flinders Island	AU	Flinders Island
FLT	Flat	US	Flat
FLU	Flushing	US	New York
FLV	Sherman AAF	US	Fort Leavenworth
FLW	Santa Cruz	PT	Flores Island
FLX	Municipal	US	Fallon
FLY	Finley	AU	Finley
FMA	El Pucu	AR	Formosa
FMC	Five Mile	US	Five Mile
FME	Tipton AAF	US	Fort Meade
FMG	Flamingo	CR	Flamingo
FMH	Otis AFB	US	Falmouth
FMI	Kalemie	ZR	Kalemie
FMM	Memmingen-Allgäu	DE	Memmingen
FMN	Municipal	US	Farmington
FMO	Münster Osnabrück International	DE	Greven, North Rhine-Westphalia
FMS	Municipal	US	Fort Madison
FMY	Page Field	US	Fort Myers
FNA	Lungi International	SL	Freetown
FNB	Neubrandenburg	DE	Neubrandenburg
FNC	Madeira	PT	Funchal
FNE	Fane	PG	Fane
FNG	Fada Ngourma	BF	Fada Ngourma
FNH	Fincha	ET	Fincha
FNI	Garons	FR	Nimes
FNJ	Sunan International	KP	Pyongyang
FNK	Fin Creek	US	Fin Creek
FNL	Municipal Airport	US	Fort Collins/Loveland
FNR	SPB	US	Funter Bay
FNT	Bishop International Airport	US	Flint
FOA	Foula	GB	Foula
FOB	Fort Bragg	US	Fort Bragg
FOC	Fuzhou	CN	Fuzhou
FOD	Fort Dodge Regional	US	Fort Dodge, IA
FOE	Forbes Field	US	Topeka, KS
FOG	Gino Lisa	IT	Foggia
FOK	Suffolk County	US	Westhampton
FOM	Foumban	CM	Foumban
FON	Fortuna	CR	Fortuna
FOO	Numfoor	ID	Numfoor
FOP	Morris AAF	US	Forest Park
FOR	Pinto Martins	BR	Fortaleza
FOS	Forrest	AU	Forrest
FOT	Forster	AU	Forster
FOU	Fougamou	GA	Fougamou
FOX	Fox	US	Fox
FOY	Foya	LR	Foya
FPO	Grand Bahama International	BS	Freeport
FPR	St Lucie County	US	Fort Pierce
FPY	Perry-Foley	US	Perry
FRA	Frankfurt International Airport (rhein-main)	DE	Frankfurt
FRB	Forbes	AU	Forbes
FRC	Franca	BR	Franca
FRD	Friday Harbor	US	Friday Harbor
FRE	Fera Island	SB	Fera Island
FRF	Rhein-Main AFB	DE	Frankfurt
FRG	Republic Field	US	Farmingdale
FRH	Municipal	US	French Lick
FRI	Marshall AAF	US	Fort Riley, KS
FRJ	Frejus	FR	Frejus
FRK	Fregate Is	SC	Fregate Is
FRL	Luigi Ridolfi	IT	Forli
FRM	Fairmont	US	Fairmont
FRN	Bryant AAF	US	Fort Richardson
FRO	Flora	NO	Floro
FRP	Fresh Water Bay	US	Fresh Water Bay
FRQ	Feramin	PG	Feramin
FRR	Front Royal-Warren County	US	Front Royal, (VA)
FRS	Santa Elena	GT	Flores
FRT	Frutillar	CL	Frutillar
FRU	Manas (Bishkek)	KG	Bishkek
FRW	Francistown	BW	Francistown
FRY	Fryeburg	US	Fryeburg
FRZ	Fritzlar Airbase	DE	Fritzlar
FSC	Sud Corse	FR	Figari
FSD	Joe Foss Field Airport	US	Sioux Falls
FSI	Henry Post AAF	US	Fort Sill
FSK	Municipal	US	Fort Scott
FSL	Fossil Downs	AU	Fossil Downs
FSM	Regional	US	Fort Smith
FSN	Haley AAF	US	Fort Sheridan
FSP	Saint-pierre Pointe-blanche	PM	St Pierre
FSS	Kinloss	GB	Forres
FST	Pecos County	US	Fort Stockton
FSU	Fort Sumner	US	Fort Sumner
FTA	Futuna Airport	VU	Futuna Island
FTE	El Calafate	AR	El Calafate, Santa Cruz
FTG	Front Range Airport	US	Watkins
FTI	Fitiuta	AS	Fitiuta
FTK	Godman AAF	US	Fort Knox
FTL	Fortuna Ledge	US	Fortuna Ledge
FTU	Marillac	MG	Fort Dauphin
FTW	Meacham Field	US	Fort Worth
FTX	Owando	CG	Owando
FTY	Fulton County	US	Atlanta
FUB	Fulleborn	PG	Fulleborn
FUD	Sui Fen He	CN	Sui Fen He
FUE	Fuerteventura	ES	Puerto del Rosario
FUG	Fuyang	CN	Fuyang
FUJ	Fukue	JP	Fukue
FUK	Fukuoka	JP	Fukuoka
FUL	Municipal	US	Fullerton
FUM	Fuma	PG	Fuma
FUN	International	TV	Funafuti Atol
FUO	Fuoshan	CN	Fuoshan
FUT	Futuna Island	WF	Futuna Island
FVL	Flora Valey	AU	Flora Valley
FVR	Forrest River Airport	AU	Forrest River
FWA	Municipal/Baer Field	US	Fort Wayne
FWH	Fort Worth NAS Jrb/Carswell Field	US	Fort Worth, TX
FWL	Farewell	US	Farewell
FWM	Heliport	GB	Fort William
FXE	Executive	US	Fort Lauderdale
FXM	Flaxman Island	US	Flaxman Island
FXO	Cuamba	MZ	Cuamba
FXY	Municipal	US	Forest City
FYM	Municipal	US	Fayetteville
FYN	Fuyun	CN	Fuyun
FYT	Faya	TD	Faya
FYU	Fort Yukon	US	Fort Yukon
FYV	Municipal (Drake Fld)	US	Fayetteville
FZO	Filton	GB	Bristol
GAA	Guamal	CO	Guamal
GAB	Gabbs	US	Gabbs
GAC	Gracias	HN	Gracias
GAD	Municipal	US	Gadsden
GAE	Gabes	TN	Gabes
GAF	Gafsa	TN	Gafsa
GAG	Gage	US	Gage, OK
GAH	Gayndah	AU	Gayndah
GAI	Montgomery County	US	Gaithersburg
GAJ	Junmachi	JP	Yamagata
GAK	Gakona	US	Gakona
GAL	Galena	US	Galena
GAM	Gambell	US	Gambell
GAN	Gan Airport	MV	Gan Island
GAO	Los Canos	CU	Guantanamo
GAP	Gusap	PG	Gusap
GAQ	Gao	ML	Gao
GAR	Garaina	PG	Garaina
GAS	Garissa	KE	Garissa
GAT	Tallard	FR	Gap
GAU	Borjhar	IN	Gawahati
GAV	Gag Island	ID	Gag Island
GAW	Gangaw	MM	Gangaw
GAX	Gamba	GA	Gamba
GAY	Gaya	IN	Gaya
GAZ	Guasopa	PG	Guasopa
GBA	Big Bay	VU	Big Bay
GBB	Gara Djebilet	DZ	Gara Djebilet
GBC	Gasuke	PG	Gasuke
GBD	Great Bend	US	Great Bend
GBE	Sir Seretse Khama International	BW	Gaborone
GBF	Negarbo	PG	Negarbo
GBG	Galesburg	US	Galesburg
GBH	Galbraith Lake	US	Galbraith Lake
GBI	Auxiliary Airfield	BS	Grand Bahama
GBJ	Les Bases	GP	Marie Galante
GBK	Gbangbatok	SL	Gbangbatok
GBL	Goulburn Island	AU	Goulburn Island
GBM	Garbaharey	SO	Garbaharey
GBN	San Giovanni Rotondo	IT	San Giovanni Rotondo
GBO	Baltimore Greenbelt T	US	Baltimore
GBP	Gamboola	AU	Gamboola
GBQ	Muharraq	BH	Muharraq
GBR	Walter J. Koladza Airport	US	Great Barrington
GBS	Port Fitzroy	NZ	Port Fitzroy
GBT	Gorgan	IR	Gorgan
GBU	Khashm El Girba	SD	Khashm El Girba
GBV	Gibb River	AU	Gibb River
GBZ	Great Barrier Island	NZ	Great Barrier Island
GCA	Guacamaya	CO	Guacamaya
GCC	Campbell County	US	Gillette
GCH	Gachsaran	IR	Gachsaran
GCI	Guernsey	GB	Guernsey
GCJ	Grand Central	ZA	Johannesburg
GCK	Garden City Municipal Airport	US	Garden City, KS
GCM	Owen Roberts International	KY	Georgetown
GCN	National Park	US	Grand Canyon
GCV	Gravatai	BR	Gravatai
GCY	Municipal	US	Greenville
GDA	Gounda	CF	Gounda
GDC	Donaldson Center	US	Greenville
GDD	Gordon Downs	AU	Gordon Downs
GDE	Gode/Iddidole	ET	Gode/Iddidole
GDG	Magdagachi	RU	Magdagachi
GDH	Golden Horn Lodge SPB	US	Golden Horn Lodge, Alaska
GDI	Gordil	CF	Gordil
GDJ	Gandajika	ZR	Gandajika
GDL	Don Miguel Hidalgo y Costilla International	MX	Guadalajara
GDM	Municipal	US	Gardner
GDN	Lech Walesa	PL	Gdansk
GDO	Vare Maria	VE	Guasdualito
GDP	Guadalupe	BR	Guadalupe
GDQ	Gondar	ET	Gondar
GDT	Grand Turk Is	TC	Grand Turk Is
GDV	Dawson Community	US	Glendive
GDW	Gladwin	US	Gladwin
GDX	Magadan	RU	Magadan
GDZ	Gelendzik	RU	Gelendzik
GEA	Magenta	NC	Noumea
GEB	Gebe	ID	Gebe
GEC	Gecitkale	CY	Gecitkale
GED	Sussex County	US	Georgetown
GEE	George Town	AU	George Town
GEF	Geva Airstrip	SB	Geva
GEG	Spokane International	US	Spokane
GEI	Green Islands	PG	Green Islands
GEK	Ganes Creek	US	Ganes Creek
GEL	Sepe Tiaraju	BR	Santo Angelo
GEO	Cheddi Jagan International	GY	Georgetown
GER	Rafael Cabrera	CU	Nueva Gerona
GES	General Santos International	PH	General Santos
GET	Geraldton	AU	Geraldton
GEV	Gallivare	SE	Gallivare
GEW	Gewoia	PG	Gewoia
GEX	Geelong	AU	Geelong
GEY	South Big Horn County	US	Greybull
GFA	Malmstrom AFB	US	Great Falls
GFB	Togiak Fish	US	Togiak Fish
GFD	Pope Field	US	Greenfield
GFE	Grenfell	AU	Grenfell
GFF	Griffith	AU	Griffith
GFK	Grand Forks	US	Grand Forks
GFL	Warren County	US	Glens Falls
GFN	Grafton	AU	Grafton
GFO	Bartica	GY	Bartica
GFR	Granville	FR	Granville
GFY	Grootfontein	NA	Grootfontein
GGC	Lumbala	AO	Lumbala
GGD	Gregory Downs	AU	Gregory Downs
GGE	Georgetown	US	Georgetown
GGG	Kilgore	US	Kilgore
GGL	Gilgal	CO	Gilgal
GGN	Gagnoa	CI	Gagnoa
GGO	Guiglo	CI	Guiglo
GGR	Garoe	SO	Garoe
GGS	Gobernador Gregores	AR	Gobernador Gregores
GGT	Exuma International	BS	George Town
GGW	International	US	Glasgow
GHA	Noumerate	DZ	Ghardaia
GHB	Governors Harbour	BS	Governors Harbour
GHC	Great Harbour	BS	Great Harbour
GHD	Ghimbi	ET	Ghimbi
GHE	Garachine	PA	Garachine
GHF	Giebelstadt	DE	Giebelstadt
GHK	Gush Katif	IL	Gush Katif
GHM	Municipal	US	Centerville
GHN	Guanghan	CN	Guanghan
GHT	Ghat	LY	Ghat
GHU	Gualeguaychu	AR	Gualeguaychu
GIB	North Front	GI	Gibraltar
GIC	Boigu Island	AU	Boigu Island
GID	Gitega	BI	Gitega
GIF	Gilbert Field	US	Winter Haven
GIG	Galeão?antonio Carlos Jobim International Airport	BR	Rio De Janeiro
GII	Siguiri	GN	Siguiri
GIL	Gilgit	PK	Gilgit
GIM	Miele Mimbale	GA	Miele Mimbale
GIR	Girardot	CO	Girardot
GIS	Gisborne	NZ	Gisborne
GIT	Geita	TZ	Geita
GIU	Sigiriya Slaf Base	LK	Sigiriya
GIY	Giyani	ZA	Giyani
GIZ	Jazan	SA	Jazan
GJA	Guanaja	HN	Guanaja
GJL	Jijel	DZ	Jijel
GJM	Guajara-Mirim	BR	Guajara-Mirim
GJR	Gjogur	IS	Gjogur
GJT	Walker Field	US	Grand Junction
GKA	Goroka	PG	Goroka
GKE	Geilenkirchen	DE	Geilenkirchen
GKH	Gorkha	NP	Gorkha
GKL	Great Keppel Island	AU	Great Keppel Island
GKN	Gulkana	US	Gulkana
GKO	Kongoboumba	GA	Kongoboumba
GKT	Gatlinburg	US	Gatlinburg
GLA	Glasgow International	GB	Glasgow
GLC	Geladi	ET	Geladi
GLD	Renner Field	US	Goodland
GLE	Municipal	US	Gainesville
GLF	Golfito	CR	Golfito
GLG	Glengyle	AU	Glengyle
GLH	Greenville	US	Greenville
GLI	Glen Innes	AU	Glen Innes
GLK	Galcaio	SO	Galcaio
GLL	Klanten Arpt	NO	Gol
GLM	Glenormiston	AU	Glenormiston
GLN	Goulimime	MA	Goulimime
GLO	Gloucestershire	GB	Gloucester
GLP	Gulgubip	PG	Gulgubip
GLQ	Glennallen	US	Glennallen
GLR	Otsego County	US	Gaylord
GLS	Scholes Field	US	Galveston
GLT	Gladstone	AU	Gladstone
GLV	Golovin	US	Golovin
GLW	Municipal	US	Glasgow
GLX	Galela	ID	Galela
GLY	Goldsworthy	AU	Goldsworthy
GLZ	Gilze-Rijen	NL	Breda
GMA	Gemena	ZR	Gemena
GMB	Gambela	ET	Gambela
GMC	Guerima	CO	Guerima
GME	Gomel	BY	Gomel
GMI	Gasmata Island	PG	Gasmata Island
GMM	Gamboma	CG	Gamboma
GMN	Greymouth	NZ	Greymouth
GMP	Gimpo International	KR	Seoul
GMR	Gambier Is	PF	Gambier Is
GMS	Guimaraes	BR	Guimaraes
GMT	Granite Mountain	US	Granite Mountain
GMU	Greenville Downtown	US	Greenville
GMV	Monument Valley	US	Monument Valley Gldngs
GMY	Rheindahlen	DE	Rheindahlen
GMZ	La Gomera	ES	San Sebas De La Gomera
GNA	Grodna	BY	Grodna
GNB	Grenoble-isere Airport (St Geoirs)	FR	Grenoble
GND	Point Salines International	GD	St. Georges
GNE	Ghent	BE	Ghent
GNG	Gooding	US	Gooding
GNI	Green Island	TW	Green Island
GNM	Guanambi	BR	Guanambi
GNN	Ghinnir	ET	Ghinnir
GNR	General Roca	AR	General Roca
GNS	Binaka	ID	Gunungsitoli
GNT	Milan	US	Grants
GNU	Goodnews Bay	US	Goodnews Bay
GNV	Gainesville Regional	US	Gainesville
GNZ	Ghanzi	BW	Ghanzi
GOA	Cristoforo Colombo	IT	Genova
GOB	Goba	ET	Goba
GOC	Gora	PG	Gora
GOE	Gonalia	PG	Gonalia
GOF	Goodfellow AFB	US	San Angelo
GOG	Gobabis	NA	Gobabis
GOH	Nuuk	GL	Nuuk
GOI	Dabolim	IN	Goa
GOJ	Nizhniy Novgorod	RU	Nizhniy Novgorod
GOK	Guthrie	US	Guthrie
GOL	State	US	Gold Beach
GOM	Goma	CD	Goma
GON	New London	US	New London
GOO	Goondiwindi	AU	Goondiwindi
GOP	Gorakhpur	IN	Gorakhpur
GOQ	Golmud	CN	Golmud
GOR	Gore	ET	Gore
GOS	Gosford	AU	Gosford
GOT	Landvetter	SE	Gothenburg
GOU	Garoua	CM	Garoua
GOV	Nhulunbuy	AU	Gove
GOY	Amparai	LK	Gal Oya
GOZ	Gorna Oriahovitsa	BG	Gorna Oriahovitsa
GPA	Araxos Airport	GR	Patras
GPB	Tancredo Thomaz Faria	BR	Guarapuava
GPI	Guapi	CO	Guapi
GPL	Guapiles	CR	Guapiles
GPN	Garden Point	AU	Garden Point
GPO	General Pico	AR	General Pico
GPS	Baltra	EC	Galapagos Is
GPT	Gulfport-Biloxi International	US	Gulfport
GPZ	Grand Rapids	US	Grand Rapids
GQJ	RAF Station	GB	Machrihanish
GQQ	Galion	US	Galion
GRA	Gamarra	CO	Gamarra
GRB	Austin-straubel Field	US	Green Bay
GRC	Grand Cess	LR	Grand Cess
GRD	Greenwood	US	Greenwood
GRE	Municipal	US	Greenville
GRF	Gray Aaf	US	Tacoma
GRG	Gardez	AF	Gardez
GRH	Garuahi	PG	Garuahi
GRI	Grand Island	US	Grand Island, NE
GRJ	George	ZA	George
GRK	Gray Aaf	US	Fort Hood, TX
GRL	Garasa	PG	Garasa
GRM	Devils Track	US	Grand Marais
GRN	Gordon	US	Gordon
GRO	Girona-Costa Brava	ES	Gerona
GRP	Gurupi	BR	Gurupi
GRQ	Eelde	NL	Groningen
GRR	Gerald R. Ford International	US	Grand Rapids, MI
GRS	Baccarini	IT	Grosseto
GRT	Gujrat	PK	Gujrat
GRU	Aeroporto Internacional Guarulhos	BR	Sao Paulo
GRV	Groznyj	RU	Groznyj
GRW	Graciosa Island	PT	Graciosa Island
GRX	Granada	ES	Granada
GRY	Grimsey	IS	Grimsey
GRZ	Thalerhof	AT	Graz
GSA	Long Pasia	MY	Long Pasia
GSB	Seymour Johnson AFB	US	Goldsboro
GSC	Gascoyne Junction	AU	Gascoyne Junction
GSE	Gothenburg City Airport	SE	Gothenburg
GSH	Goshen	US	Goshen
GSI	Guadalcanal	SB	Guadalcanal
GSL	Taltheilei Narrows	CA	Taltheilei Narrows
GSM	Gheshm	IR	Gheshm
GSN	Mount Gunson	AU	Mount Gunson
GSO	Piedmont Triad Intl	US	Greensboro, NC
GSP	Greenville Spartanbur Int'l Airport	US	Greenville
GSQ	Shark Elowainat	EG	Shark Elowainat
GSR	Gardo	SO	Gardo
GSS	Sabi Sabi	ZA	Sabi Sabi
GST	Gustavus Arpt	US	Gustavus
GSU	Gedaref	SD	Gedaref
GSY	Binbrook	GB	Grimsby
GTA	Gatokae Aerodrom	SB	Gatokae
GTB	Genting	MY	Genting
GTC	Green Turtle	BS	Green Turtle
GTE	Alyangula	AU	Groote Eylandt
GTF	International	US	Great Falls
GTG	Municipal	US	Grantsburg
GTI	Guettin	DE	Guettin
GTK	Sungei Tekai	MY	Sungei Tekai
GTN	Glentanner	NZ	Mount Cook
GTO	Tolotio	ID	Gorontalo
GTR	Golden Triangle Reg.	US	Columbus
GTS	Granites	AU	Granites
GTT	Georgetown	AU	Georgetown
GTW	Holesov	CZ	Zlin
GTY	Gettysburg	US	Gettysburg
GUA	La Aurora	GT	Guatemala City
GUB	Guerrero Negro	MX	Guerrero Negro
GUC	Gunnison	US	Gunnison
GUD	Goundam	ML	Goundam
GUE	Guriaso	PG	Guriaso
GUF	Edwards	US	Gulf Shores
GUG	Guari	PG	Guari
GUH	Gunnedah	AU	Gunnedah
GUI	Guiria	VE	Guiria
GUJ	Guaratingueta	BR	Guaratingueta
GUL	Goulburn	AU	Goulburn
GUM	Guam International	GU	Agana
GUN	Gunter AFB	US	Montgomery
GUO	Gualaco	HN	Gualaco
GUP	Senator Clark	US	Gallup
GUQ	Guanare	VE	Guanare
GUR	Gurney	PG	Alotau
GUS	Grissom Afb	US	Peru, Indiana
GUT	Guetersloh	DE	Guetersloh
GUU	Grundarfjordur	IS	Grundarfjordur
GUV	Mougulu	PG	Mougulu
GUW	Atyrau International	KZ	Atyrau
GUX	Guna	IN	Guna
GUY	Guymon	US	Guymon
GUZ	Guarapari	BR	Guarapari
GVA	Geneve-cointrin	CH	Geneva
GVE	Municipal	US	Gordonsville
GVI	Green River	PG	Green River
GVL	Lee Gilmer Memorial	US	Gainesville
GVP	Greenvale	AU	Greenvale
GVR	Governador Valadares	BR	Governador Valadares
GVT	Majors Field	US	Greenville
GVW	Richards-Gebaur	US	Grandview
GVX	Sandviken	SE	Gavle
GWA	Gwa	MM	Gwa
GWD	Gwadar	PK	Gwadar
GWE	Gweru	ZW	Gweru
GWL	Gwalior	IN	Gwalior
GWN	Gnarowein	PG	Gnarowein
GWO	Leflore	US	Greenwood
GWS	Glenwood Springs	US	Glenwood Springs
GWT	Westerland - Sylt	DE	Westerland
GWV	Glendale	US	Glendale
GWW	Raf Gatow (no longer in operation)	DE	Berlin
GWY	Carnmore	IE	Galway
GXF	Seiyun	YE	Seiyun
GXG	Negage	AO	Negage
GXH	NAF	GB	Mildenhall
GXQ	Ten. Vidal	CL	Coyhaique
GXX	Yagoua	CM	Yagoua
GXY	Weld County	US	Greeley
GYA	Guayaramerin	BO	Guayaramerin
GYD	Heydar Aliyev International (Bina International)	AZ	Baku
GYE	Simon Bolivar	EC	Guayaquil
GYI	Gisenyi	RW	Gisenyi
GYL	Argyle	AU	Argyle
GYM	Gen Jose M Yanez	MX	Guaymas
GYN	Santa Genoveva	BR	Goiania
GYP	Gympie	AU	Gympie
GYR	Litchfield	US	Goodyear
GYS	Guang Yuan	CN	Guang Yuan
GYY	Gary/Chicago International	US	Gary, IN
GZA	Gaza - Yaser Arafat International Airport	PS	Rafah
GZI	Ghazni	AF	Ghazni
GZM	Gozo Heliport	MT	Gozo
GZO	Gizo	SB	Gizo
GZT	Gaziantep	TR	Gaziantep
GZW	Ghazvin	IR	Ghazvin
HAA	Hasvik	NO	Hasvik
HAB	Marion County	US	Hamilton
HAC	Hachijo Jima	JP	Hachijo Jima
HAD	Halmstad	SE	Halmstad
HAE	Havasupai	US	Havasupai
HAF	Half Moon	US	Half Moon
HAH	Prince Said Ibrahim In	KM	Moroni
HAI	Dr Haines	US	Three Rivers
HAJ	Hanover Arpt	DE	Hanover
HAK	Haikou	CN	Haikou
HAL	Halali	NA	Halali
HAM	Hamburg Airport	DE	Hamburg
HAN	Noibai International	VN	Hanoi
HAO	Hamilton	US	Hamilton
HAP	Long Island	AU	Long Island
HAQ	Hanimaadhoo	MV	Hanimaadhoo
HAR	Capital City	US	Harrisburg
HAS	Hail	SA	Hail
HAT	Heathlands	AU	Heathlands
HAU	Haugesund	NO	Haugesund
HAV	Jose Marti Intl	CU	Havana
HAW	Haverfordwest	GB	Haverfordwest
HAX	Hatbox Field	US	Muskogee
HAY	Haycock	US	Haycock
HAZ	Hatzfeldthaven	PG	Hatzfeldthaven
HBA	Hobart	AU	Hobart
HBB	Industrial Airpark	US	Hobbs
HBC	Hanus Bay	US	Hanus Bay
HBD	Habi	PG	Habi
HBE	Amiryah West	EG	Alexandria
HBG	The Hattiesburg-Bobby L. Chain Mun.	US	Hattiesburg
HBH	Hobart Bay	US	Hobart Bay
HBI	Harbour Island	BS	Harbour Island
HBL	Babelegi Heliport	ZA	Babelegi
HBN	Flamingo	VN	Phu-bon
HBO	Municipal	US	Humboldt
HBR	Hobart	US	Hobart, OK
HBT	Hafr Albatin	SA	Hafr Albatin
HBX	Hubli	IN	Hubli
HCA	Howard County	US	Big Spring
HCB	Shoal Cove	US	Shoal Cove
HCC	Columbia County	US	Hudson
HCM	Eil	SO	Eil
HCN	Hengchun	TW	Hengchun
HCQ	Halls Creek	AU	Halls Creek
HCR	Holy Cross	US	Holy Cross
HCS	Randburg Heliport	ZA	Johannesburg
HCW	Cheraw	US	Cheraw
HDA	Hidden Falls	US	Hidden Falls
HDB	Heidelberg	DE	Heidelberg
HDD	Hyderabad	PK	Hyderabad
HDE	Brewster Field	US	Holdrege
HDF	Heringsdorf	DE	Heringsdorf
HDH	Dillingham Airfield	US	Oahu
HDM	Hamadan	IR	Hamadan
HDN	Yampa Valley	US	Hayden
HDR	Havadarya	IR	Havadarya
HDS	Hoedspruit Airport	ZA	Hoedspruit
HDY	Hat Yai	TH	Hat Yai
HEA	Herat	AF	Herat
HEB	Henzada	MM	Henzada
HED	Herendeen	US	Herendeen
HEE	Thompson-Robbins	US	Helena
HEH	Heho	MM	Heho
HEI	Heide-Buesum	DE	Heide-Buesum
HEK	Heihe	CN	Heihe
HEL	Helsinki-vantaa	FI	Vantaa
HEM	Helsinki-malmi	FI	Helsinki
HEN	Hendon	GB	Hendon
HEO	Haelogo	PG	Haelogo
HER	Nikos Kazantzakis Airport	GR	Heraklion
HES	State	US	Hermiston
HET	Hohhot	CN	Hohhot
HEV	Huelva	ES	Huelva
HEW	Hellinikon (Closed)	GR	Athens
HEX	Santo Domingo Herrera	DO	Santo Domingo
HEY	Hanchey Army Heliport	US	Ozark
HEZ	Hardy-Anders	US	Natchez
HFA	Haifa	IL	Haifa
HFD	Brainard	US	Hartford
HFE	Shanghai	CN	Luogang
HFF	Mackall AAF	US	Hoffman
HFN	Hornafjordur	IS	Hornafjordur
HFS	Hagfors	SE	Hagfors
HFT	Hammerfest	NO	Hammerfest
HFY	Greenwood Municipal Airport	US	Greenwood, Indiana (IN)
HGA	Hargeisa	SO	Hargeisa
HGD	Hughenden	AU	Hughenden
HGH	Hangzhou	CN	Hangzhou
HGI	Higlieg	SD	Higlieg
HGL	Helgoland	DE	Helgoland
HGN	Mae Hong Son	TH	Mae Hong Son
HGO	Korhogo	CI	Korhogo
HGR	Wash. County Regional	US	Hagerstown
HGS	Hastings	SL	Freetown
HGT	Hunter AAF	US	Jolon
HGU	Kagamuga	PG	Mount Hagen
HGZ	Hogatza	US	Hogatza
HHA	Huanghua International	CN	Changsha
HHE	Hachinohe	JP	Hachinohe
HHH	Hilton Head	US	Hilton Head
HHI	Wheeler AFB	US	Wahiawa
HHN	Frankfurt-Hahn	DE	Hahn
HHP	H K Heliport	HK	Hong Kong
HHQ	Hua Hin Airport	TH	Hua Hin
HHR	Hawthorne	US	Hawthorne
HHZ	Hikueru	PF	Hikueru
HIB	Chisholm	US	Chisholm
HIC	Iscor Heliport	ZA	Pretoria
HID	Horn Island	AU	Horn Island
HIE	Regional	US	Whitefield
HIF	Hill Afb	US	Ogden
HIG	Highbury	AU	Highbury
HIH	Hook Island	AU	Hook Island
HII	Municipal	US	Lake Havasu City
HIJ	International	JP	Hiroshima
HIK	Hickam AFB	US	Honolulu
HIL	Shillavo	ET	Shillavo
HIM	Hingurakgoda	LK	Hingurakgoda
HIN	Sacheon	KR	Jinju
HIO	Portland	US	Hillsboro
HIP	Headingly	AU	Headingly
HIR	Henderson Intl	SB	Honiara
HIS	Hayman Island	AU	Hayman Island
HIT	Hivaro	PG	Hivaro
HIW	Hiroshima West	JP	Hiroshima
HIX	Hiva Oa	PF	Hiva Oa
HJJ	Zhi Jiang	CN	Zhi Jiang
HJR	Khajuraho	IN	Khajuraho
HJT	Khujirt	MN	Khujirt
HKA	Municipal	US	Blytheville
HKB	Healy Lake	US	Healy Lake
HKD	Hakodate	JP	Hakodate
HKG	Hong Kong International	HK	Hong Kong
HKK	Hokitika Arpt	NZ	Hokitika
HKN	Hoskins	PG	Hoskins
HKS	Hawkins Field	US	Jackson
HKT	Phuket International	TH	Phuket
HKV	Haskovo	BG	Haskovo
HKY	Hickory	US	Hickory
HLA	Lanseria	ZA	Lanseria
HLB	Hillenbrand	US	Batesville
HLC	Hill City	US	Hill City
HLD	Hailar	CN	Hailar
HLF	Hultsfred - Vimmerby	SE	Hultsfred
HLG	Ohio County	US	Wheeling
HLH	Ulanhot	CN	Ulanhot
HLI	Hollister	US	Hollister
HLL	Hillside	AU	Hillside
HLM	Park Township	US	Holland
HLN	Helena	US	Helena
HLP	Halim Perdana Kusuma	ID	Jakarta
HLR	Fort Hood AAF	US	Killeen
HLS	St Helens	AU	St Helens
HLT	Hamilton	AU	Hamilton
HLU	Houailou	NC	Houailou
HLV	Helenvale	AU	Helenvale
HLW	Hluhluwe	ZA	Hluhluwe
HLY	Anglesey Airport	GB	Holyhead
HLZ	Hamilton	NZ	Hamilton
HMA	Khanty-Mansiysk	RU	Khanty-mansiysk
HME	Oued Irara Apt	DZ	Hassi Messaoud
HMG	Hermannsburg	AU	Hermannsburg
HMI	Hami	CN	Hami
HMJ	Khmelnitskiy	UA	Khmelnitskiy
HMN	Holloman AFB	US	Alamogordo
HMO	Gen Pesqueira Garcia	MX	Hermosillo
HMR	Hamar Arpt	NO	Hamar
HMS	Homeshore	US	Homeshore AK
HMT	Ryan Field	US	Hemet
HMV	Hemavan	SE	Hemavan
HNA	Hanamaki	JP	Hanamaki
HNB	Municipal	US	Huntingburg
HNC	Hatteras	US	Hatteras
HND	Tokyo Haneda International	JP	Tokyo
HNE	Tahneta Pass	US	Tahneta Pass Lodge
HNG	Hienghene	NC	Hienghene
HNH	Hoonah	US	Hoonah
HNI	Heiweni	PG	Heiweni
HNK	Hinchinbrook Island	AU	Hinchinbrook Island
HNL	Honolulu International	US	Honolulu
HNM	Hana	US	Hana
HNN	Honinabi	PG	Honinabi
HNS	Municipal	US	Haines
HNX	Hanna	CA	Hanna
HNY	Hengyang	CN	Hengyang
HOA	Hola	KE	Hola
HOB	Lea County	US	Hobbs
HOC	Komako	PG	Komako
HOD	Hodeidah Arpt	YE	Hodeidah
HOE	Houeisay	LA	Houeisay
HOF	Alahsa	SA	Alahsa
HOG	Frank Pais	CU	Holguin
HOH	Hohenems-Dornbirn	AT	Hohenems
HOI	Hao Island	PF	Hao Island
HOK	Hooker Creek	AU	Hooker Creek
HOL	Holikachu	US	Holikachu
HOM	Homer	US	Homer
HON	Howes	US	Huron
HOO	Nhon Co	VN	Quanduc
HOP	Campbell AAF	US	Hopkinsville
HOQ	Hof	DE	Hof
HOR	Horta	PT	Horta
HOS	Oscar Reguera	AR	Chos Malal
HOT	Memorial Field	US	Hot Springs
HOU	William P Hobby	US	Houston, TX
HOV	Hovden	NO	Orsta-Volda
HOW	Howard Afb	PA	Fort Kobbe
HOX	Homalin	MM	Homalin
HOY	Hoy Island	GB	Hoy Island
HPB	Hooper Bay	US	Hooper Bay
HPE	Hope Vale	AU	Hope Vale
HPH	Catbi	VN	Haiphong
HPN	Westchester County Apt	US	White Plains
HPP	Poipet	KH	Poipet
HPR	Central Hpr	ZA	Pretoria
HPT	Municipal	US	Hampton
HPV	Princeville	US	Kauai Island
HPY	Baytown Airport	US	Baytown
HQM	Bowerman	US	Hoquiam
HRA	Mansehra	PK	Mansehra
HRB	Harbin	CN	Harbin
HRC	Zhairem	KZ	Zhairem
HRE	Harare	ZW	Harare
HRG	Hurghada	EG	Hurghada
HRJ	Chaurjhari	NP	Chaurjhari
HRK	Kharkov	UA	Kharkov
HRL	Valley International	US	Harlingen
HRN	Heliport	AU	Heron Island
HRO	Boone County	US	Harrison
HRR	Herrera	CO	Herrera
HRS	Harrismith Airport	ZA	Harrismith
HRT	Linton-On-Ouse	GB	Harrogate
HRY	Henbury	AU	Henbury
HRZ	Horizontina	BR	Horizontina
HSB	Raleigh	US	Harrisburg
HSC	Shaoguan	CN	Shaoguan
HSG	Saga	JP	Saga
HSH	Henderson Sky Harbor	US	Las Vegas
HSI	Hastings	US	Hastings
HSK	Huesca-Pirineos	ES	Huesca
HSL	Huslia	US	Huslia
HSM	Horsham	AU	Horsham
HSN	Zhoushan	CN	Zhoushan
HSP	Ingalls Field	US	Hot Springs
HSS	Hissar	IN	Hissar
HST	AFB	US	Homestead
HSV	Huntsville International - Carl T. Jones Field	US	Huntsville, AL
HSZ	Hsinchu	TW	Hsinchu
HTA	Chita	RU	Chita
HTB	Terre-de-Bas	GP	Terre-de-Bas
HTF	Hatfield	GB	Hatfield
HTG	Hatanga	RU	Hatanga
HTH	Hawthorne	US	Hawthorne
HTI	Hamilton Island	AU	Hamilton Island
HTL	Roscommon County	US	Houghton
HTM	Khatgal	MN	Khatgal
HTN	Hotan	CN	Hotan
HTO	East Hampton	US	East Hampton
HTR	Hateruma	JP	Hateruma
HTS	Tri-State/Milton	US	Huntington
HTU	Hopetoun	AU	Hopetoun
HTW	Lawrence County Airpark	US	Chesapeake/Huntington Wv
HTZ	Hato Corozal	CO	Hato Corozal
HUA	Redstone AAF	US	Huntsville
HUB	Humbert River	AU	Humbert River
HUC	Humacao Arpt	PR	Humacao
HUD	Humboldt	US	Humboldt
HUE	Humera	ET	Humera
HUF	Hulman Field	US	Terre Haute
HUG	Huehuetenango	GT	Huehuetenango
HUH	Huahine	PF	Huahine
HUI	Phu Bai	VN	Hue
HUJ	Hugo	US	Hugo
HUK	Hukuntsi	BW	Hukuntsi
HUL	International	US	Houlton
HUM	Terrebonne	US	Houma
HUN	Hualien	TW	Hualien
HUQ	Houn	LY	Houn
HUS	Municipal	US	Hughes
HUT	Hutchinson	US	Hutchinson
HUU	Huanuco	PE	Huanuco
HUV	Hudiksvall	SE	Hudiksvall
HUX	Huatulco	MX	Huatulco
HUY	Humberside International	GB	Humberside
HUZ	Huizhou	CN	Huizhou
HVA	Analalava	MG	Analalava
HVB	Hervey Bay	AU	Hervey Bay
HVD	Khovd	MN	Khovd
HVE	Intermediate	US	Hanksville
HVG	Valan	NO	Honningsvag
HVK	Holmavik	IS	Holmavik
HVM	Hvammstangi	IS	Hvammstangi
HVN	New Haven	US	New Haven
HVR	City County	US	Havre
HVS	Municipal	US	Hartsville
HWA	Hawabango	PG	Hawabango
HWD	Air Terminal	US	Hayward
HWI	SPB	US	Hawk Inlet
HWK	Wilpena Pound	AU	Hawker
HWN	Hwange Nat Park	ZW	Hwange Nat Park
HWO	North Perry	US	Hollywood
HXX	Hay	AU	Hay
HYA	Barnstable	US	Hyannis
HYC	High Wycombe	GB	High Wycombe
HYD	Hyderabad Airport	IN	Hyderabad
HYF	Hayfields	PG	Hayfields
HYG	SPB	US	Hydaburg
HYL	SPB	US	Hollis
HYN	Huangyan	CN	Huangyan
HYR	Municipal	US	Hayward
HYS	Municipal	US	Hays
HYV	Hyvinkaa	FI	Hyvinkaa
HZA	Herzlia	IL	Herzlia
HZB	Merville/Calonne	FR	Hazebrouck
HZG	Hanzhong	CN	Hanzhong
HZH	Liping	CN	Liping City
HZK	Husavik	IS	Husavik
HZL	Hazleton	US	Hazleton
HZV	Hazyview	ZA	Hazyview
IAA	Igarka	RU	Igarka
IAB	Mcconnell AFB	US	Wichita
IAD	Washington Dulles International	US	Washington, DC
IAG	International	US	Niagara Falls
IAH	George Bush Intercontinental	US	Houston
IAM	In Amenas	DZ	In Amenas
IAN	Bob Barker Memorial	US	Kiana
IAQ	Bahregan	IR	Bahregan
IAR	Yaroslavl	RU	Yaroslavl
IAS	Iasi	RO	Iasi
IAU	Iaura	PG	Iaura
IBA	Ibadan	NG	Ibadan
IBE	Ibague	CO	Ibague
IBI	Iboki	PG	Iboki
IBL	Indigo Bay Lodge	MZ	Indigo Bay Lodge
IBO	Ibo	MZ	Ibo
IBP	Iberia	PE	Iberia
IBZ	Ibiza	ES	Ibiza
ICA	Icabaru	VE	Icabaru
ICI	Cicia	FJ	Cicia
ICK	Nieuw Nickerie	SR	Nieuw Nickerie
ICL	Municipal	US	Clarinda
ICN	Incheon International	KR	Seoul
ICO	Sicogon Island	PH	Sicogon Island
ICR	Nicaro	CU	Nicaro
ICT	Mid-Continent	US	Wichita
ICY	Icy Bay	US	Icy Bay
IDA	Fanning Field	US	Idaho Falls
IDB	Idre	SE	Idre
IDC	Ila Da Chilonzuene	MZ	Ila Da Chilonzuene
IDF	Idiofa	ZR	Idiofa
IDG	Municipal	US	Ida Grove
IDI	ndiana County Airport (Jimmy Stewart Field)	US	Indiana, PA
IDK	Indulkana	AU	Indulkana
IDN	Indagen	PG	Indagen
IDO	Rio	BR	Santa Isabel Do Morro
IDP	Independence	US	Independence
IDR	Devi Ahilyabai Holkar	IN	Indore
IEG	Babimost	PL	Zielona Gora
IEJ	Iejima	JP	Iejima
IES	Riesa	DE	Riesa
IEV	Zhulhany	UA	Kiev
IFA	Iowa Falls	US	Iowa Falls
IFF	Iffley	AU	Iffley
IFH	Hesa	IR	Hesa
IFJ	Isafjordur	IS	Isafjordur
IFL	Innisfail	AU	Innisfail
IFN	Isfahan International	IR	Isfahan
IFO	Ivano-Frankovsk	UA	Ivano-Frankovsk
IFP	Laughlin Bullhead Intl	US	Bullhead City
IGA	Inagua	BS	Inagua
IGB	Ingeniero Jacobacci	AR	Ingeniero Jacobacci
IGE	Iguela	GA	Iguela
IGG	Igiugig	US	Igiugig
IGH	Ingham	AU	Ingham
IGL	Cigli Military Arpt	TR	Izmir
IGM	Kingman	US	Kingman
IGN	Maria Cristina	PH	Iligan
IGO	Chigorodo	CO	Chigorodo
IGR	Cataratas	AR	Iguazu
IGS	Ingolstadt-manching	DE	Ingolstadt-manching
IGU	Cataratas	BR	Iguassu Falls
IHA	Niihama	JP	Niihama
IHC	Inhaca	MZ	Inhaca
IHN	Qishn	YE	Qishn
IHO	Ihosy	MG	Ihosy
IHR	Iran Shahr	IR	Iran Shahr
IHU	Ihu	PG	Ihu
IIA	Inishmaan	IE	Galloway
IIL	Ilaam	IR	Ilaam
IIN	Nishinoomote	JP	Nishinoomote
IIS	Nissan Island	PG	Nissan Island
IJK	Izhevsk	RU	Izhevsk
IJU	J. Batista Bos Filho Airport	BR	Ijui
IJX	Municipal	US	Jacksonville
IKA	Imam Khomeini Airport	IR	Tehran
IKB	Wilkes County	US	Wilkesboro
IKI	Iki	JP	Iki
IKK	Greater Kankakee	US	Kankakee
IKL	Ikela	CD	Ikela
IKO	Nikolski AFS	US	Nikolski
IKP	Inkerman	AU	Inkerman
IKS	Tiksi	RU	Tiksi
IKT	Irkutsk	RU	Irkutsk
ILA	Illaga	ID	Illaga
ILB	Ilha Solteira	BR	Ilha Solteira
ILE	Municipal	US	Killeen
ILF	Ilford	CA	Ilford
ILG	Greater Wilmington	US	Wilmington
ILH	Illis Airbase	DE	Illisheim
ILI	Iliamna	US	Iliamna
ILK	Ilaka	MG	Ilaka
ILL	Willmar	US	Willmar
ILM	Wilmington International	US	Wilmington
ILN	Clinton Field	US	Wilmington
ILO	Iloilo International	PH	Iloilo
ILP	Ile Des Pins	NC	Ile Des Pins
ILQ	Ilo	PE	Ilo
ILR	Ilorin	NG	Ilorin
ILU	Kilaguni	KE	Kilaguni
ILX	Ileg	PG	Ileg
ILY	Glenegedale	GB	Islay
ILZ	Zilina	SK	Zilina
IMA	Iamalele	PG	Iamalele
IMB	Imbaimadai	GY	Imbaimadai
IMD	Imonda	PG	Imonda
IMF	Municipal	IN	Imphal
IMG	Inhaminga	MZ	Inhaminga
IMI	Ine Island	MH	Ine Island
IMK	Simikot	NP	Simikot
IML	Imperial	US	Imperial
IMM	Immokalee	US	Immokalee
IMN	Imane	PG	Imane
IMO	Zemio	CF	Zemio
IMP	Imperatriz	BR	Imperatriz
IMT	Ford	US	Iron Mountain
IMZ	Nimroz	AF	Nimroz
INA	Inta	RU	Inta
INB	Independence	BZ	Independence
INC	Yinchuan	CN	Yinchuan
IND	Indianapolis International	US	Indianapolis, IN
INE	Chinde	MZ	Chinde
INF	Newark Liberty International	DZ	In Guezzam
ING	Lago Argentino	AR	Lago Argentino
INH	Inhambane	MZ	Inhambane
INI	Constantine The Great International	RS	Nis
INJ	Injune	AU	Injune
INK	Wink	US	Wink
INL	Falls Intl	US	International Falls
INM	Innamincka	AU	Innamincka
INN	Innsbruck-kranebitten	AT	Innsbruck
INO	Inongo	CD	Inongo
INQ	Inisheer	IE	Inisheer
INR	Kincheloe AFB	US	Sault Ste Marie
INS	Af Aux	US	Indian Springs
INT	Smith-Reynolds	US	Winston Salem
INU	Nauru International	NR	Nauru Island
INV	Inverness	GB	Inverness
INW	Winslow-Lindbergh	US	Winslow, AZ
INX	Inanwatan	ID	Inanwatan
INY	Inyati	ZA	Inyati
INZ	In Salah	DZ	In Salah
IOA	Ioannina	GR	Ioannina
IOK	Iokea	PG	Iokea
IOM	Ronaldsway	GB	Isle Of Man
ION	Impfondo	CG	Impfondo
IOP	Ioma	PG	Ioma
IOR	Kilronan	IE	Inishmore
IOS	Eduardo Gomes	BR	Ilheus
IOU	Ile Ouen	NC	Ile Ouen
IOW	Iowa City	US	Iowa City, IA
IPA	Ipota	VU	Ipota
IPC	Mataveri Intl	CL	Easter Island
IPE	Ipil	PH	Ipil
IPG	Ipiranga	BR	Ipiranga
IPH	Sultan Azlan Shah Airport	MY	Ipoh
IPI	San Luis	CO	Ipiales
IPL	Imperial County	US	Imperial
IPN	Usiminas	BR	Ipatinga
IPT	Lycoming County	US	Williamsport
IPU	Ipiau	BR	Ipiau
IPW	Ipswich (Closed)	GB	Ipswich
IQM	Qiemo	CN	Qiemo
IQN	Qingyang	CN	Qingyang
IQQ	Cavancha	CL	Iquique
IQT	C.F. Secada	PE	Iquitos
IRA	Kirakira	SB	Kirakira
IRB	Municipal	US	Iraan
IRC	Circle City	US	Circle
IRD	Ishurdi	BD	Ishurdi
IRE	Irece	BR	Irece
IRG	Lockhart River	AU	Lockhart River
IRI	Nduli	TZ	Iringa
IRJ	Capitan Vicente Almando	AR	La Rioja
IRK	Municipal	US	Kirksville
IRN	Iriona	HN	Iriona
IRO	Birao	CF	Birao
IRP	Matari	ZR	Isiro
IRS	Kirsch Municipal	US	Sturgis
ISA	Mount Isa	AU	Mount Isa
ISB	Islamabad International	PK	Islamabad
ISC	St Marys	GB	Isles Of Scilly
ISD	Iscuande	CO	Iscuande
ISE	Isparta	TR	Isparta
ISG	Ishigaki	JP	Ishigaki
ISH	Ischia	IT	Ischia
ISI	Isisford	AU	Isisford
ISJ	Isla Mujeres	MX	Isla Mujeres
ISK	Gandhinagar Arpt	IN	Nasik
ISL	Isabel Pass	US	Isabel Pass
ISM	Kissimmee Gateway	US	Kissimmee
ISN	Sloulin Field Intl	US	Williston
ISO	Stallings Field	US	Kinston
ISP	Long Island Mac Arthur	US	Islip, NY
ISQ	Schoolcraft County	US	Manistique
ISS	Wiscasset	US	Wiscasset
IST	Ataturk	TR	Istanbul
ISW	Alexander Field	US	Wisconsin Rapids
ISZ	Cincinnati-Blue Ash Airport	US	Cincinnati, OH
ITA	Itacoatiara	BR	Itacoatiara
ITB	Itaituba	BR	Itaituba
ITE	Itubera	BR	Itubera
ITH	Tompkins County	US	Ithaca
ITI	Itambacuri	BR	Itambacuri
ITK	Itokama	PG	Itokama
ITM	Itami	JP	Osaka
ITN	Itabuna	BR	Itabuna
ITO	Hilo International	US	Hilo, Hawaii (HI)
ITP	Itaperuna	BR	Itaperuna
ITQ	Itaqui	BR	Itaqui
ITR	Hidroeletrica	BR	Itumbiara
IUE	Hanan	NU	Niue Island
IUL	Ilu	ID	Ilu
IUM	Summit Lake	CA	Summit Lake
IUS	Inus	PG	Inus
IVA	Ambanja	MG	Ambanja
IVC	Invercargill	NZ	Invercargill
IVG	Ivangrad	ME	Berane
IVH	Ivishak	US	Ivishak
IVL	Ivalo	FI	Ivalo
IVO	Chivolo	CO	Chivolo
IVR	Inverell	AU	Inverell
IVW	Inverway	AU	Inverway
IWA	Ivanova	RU	Ivanova
IWD	Gogebic County	US	Ironwood
IWJ	Iwami	JP	Iwami
IWO	Iwo Jima Airbase	JP	Iwo Jima Vol
IWS	West Houston	US	Houston
IXA	Singerbhil	IN	Agartala
IXB	Bagdogra	IN	Bagdogra
IXC	Chandigarh	IN	Chandigarh
IXD	Bamrauli	IN	Allahabad
IXE	Bajpe	IN	Mangalore
IXG	Sambre	IN	Belgaum
IXH	Kailashahar	IN	Kailashahar
IXI	Lilabari	IN	Lilabari
IXJ	Satwari	IN	Jammu
IXK	Keshod	IN	Keshod
IXL	Bakula Rimpoche	IN	Leh
IXM	Madurai	IN	Madurai
IXN	Khowai	IN	Khowai
IXP	Pathankot	IN	Pathankot
IXQ	Kamalpur	IN	Kamalpur
IXR	Birsa Munda International	IN	Ranchi
IXS	Kumbhirgram	IN	Silchar
IXT	Pasighat	IN	Pasighat
IXU	Chikkalthana	IN	Aurangabad
IXV	Along	IN	Along
IXW	Sonari	IN	Jamshedpur
IXY	Kandla	IN	Kandla
IXZ	Port Blair	IN	Port Blair
IYK	Kern County	US	Inyokern
IZO	Izumo	JP	Izumo
IZT	Ixtepec	MX	Ixtepec
JAA	Jalalabad	AF	Jalalabad
JAB	Jabiru	AU	Jabiru
JAC	Jackson Hole	US	Jackson
JAD	Jandakot	AU	Perth
JAE	Technology Park	US	Atlanta
JAF	Kankesanturai	LK	Jaffna
JAG	Jacobabad	PK	Jacobabad
JAH	Agora Helipad	FR	Aubagne
JAI	Sanganeer	IN	Jaipur
JAJ	Perimeter Mall	US	Atlanta
JAK	Jacmel	HT	Jacmel
JAL	Jalapa	MX	Jalapa
JAM	Jambol	BG	Jambol
JAN	Jackson-evers	US	Jackson
JAO	Beaver Ruin	US	Atlanta
JAP	Punta Renes	CR	Punta Renes
JAQ	Jacquinot Bay	PG	Jacquinot Bay
JAR	Jahrom	US	Jahrom
JAS	County	US	Jasper
JAT	Jabot	MH	Jabot
JAU	Jauja	PE	Jauja
JAV	Ilulissat	GL	Ilulissat
JAX	Jacksonville,	US	Jacksonville, FL
JBC	Boston City Heliport	US	Boston
JBK	Berkeley	US	Berkeley
JBP	Commerce Bus. Plaza	US	Los Angeles
JBR	Jonesboro	US	Jonesboro
JBS	Hacienda Bus.Park H/P	US	Pleasanton
JBT	City Landing	US	Bethel
JCA	Croisette Heliport	FR	Cannes
JCB	Joacaba	BR	Joacaba
JCC	China Basin Heliport	US	San Francisco
JCD	Downtown Heliport	VI	St Croix Island
JCE	Convention Center H/P	US	Oakland
JCH	Qasigiannguit	GL	Qasigiannguit
JCI	New Century Aircenter Airport	US	Olathe, KS
JCJ	Chuja Heliport	KR	Jeju
JCK	Julia Creek	AU	Julia Creek
JCM	Jacobina	BR	Jacobina
JCN	Heliport	KR	Incheon
JCO	Heliport	MT	Comino
JCR	Jacareacanga	BR	Jacareacanga
JCT	Kimble County	US	Junction
JCU	Ceuta Heliport	ES	Ceuta
JCX	Citicorp Plaza H/P	US	Los Angeles
JCY	Johnson	US	Johnson
JDA	John Day	US	John Day
JDB	Downtown Heliport	US	Dallas
JDF	Francisco De Assis	BR	Juiz De Fora
JDH	Jodhpur	IN	Jodhpur
JDM	Downtown Heliport	US	Miami
JDN	Jordan	US	Jordan
JDO	Regional Do Cariri	BR	Juazeiro Do Norte
JDP	Heliport De Paris	FR	Paris
JDT	Downtown Heliport	US	Minneapolis
JDX	Central Bus. District	US	Houston
JDY	Heliport	US	Downey
JDZ	Jingdezhen	CN	Jingdezhen
JED	King Abdulaziz International	SA	Jeddah
JEE	Jeremie	HT	Jeremie
JEF	Memorial	US	Jefferson City, MO
JEG	Aasiaat	GL	Aasiaat
JEJ	Jeh	MH	Jeh
JEM	Heliport	US	Emeryville
JEQ	Jequie	BR	Jequie
JER	Jersey	GB	Jersey
JEV	Heliport	FR	Evry
JFK	John F Kennedy Intl	US	New York
JFM	Heliport	AU	Fremantle
JFN	Ashtabula	US	Jefferson
JFR	Frederikshab	GL	Paamiut
JGA	Govardhanpur	IN	Jamnagar
JGB	Jagdalpur	IN	Jagdalpur
JGC	Heliport	US	Grand Canyon
JGE	Heliport	KR	Geoje
JGL	Galleria Heliport	US	Atlanta
JGN	Jiayuguan	CN	Jiayuguan
JGO	Qeqertarsuaq	GL	Qeqertarsuaq
JGP	Greenway Plaza H/P	US	Houston
JGQ	Transco Twr Galleria	US	Houston
JGR	Heliport	GL	Groennedal
JGS	Ji An/Jing Gang Shan	CN	Ji An
JGX	Heliport	US	Glendale
JHB	Sultan Ismail Intl	MY	Johor Bahru
JHC	Island Heliport	US	Garden City
JHE	Heliport	SE	Angelholm/Helsingborg
JHG	Gasa	CN	Jinghong
JHM	Kapalua West Maui	US	Lahaina
JHQ	Shute Harbour H/P	AU	Shute Harbour
JHS	Sisimiut	GL	Sisimiut
JHW	Jamestown	US	Jamestown
JHY	Hyatt Regency H/P	US	Cambridge
JIA	Juina	BR	Juina, Mato Grosso
JIB	Ambouli	DJ	Djibouti
JID	City Of Industry H/P	US	Los Angeles
JIJ	Jigiga	ET	Jijiga
JIK	Ikaria	GR	Ikaria Island
JIL	Jilin	CN	Jilin
JIM	Jimma	ET	Jimma
JIN	Jinja	UG	Jinja
JIO	Intl Heliport	US	Ontario
JIP	Jipijapa	EC	Jipijapa
JIR	Jiri	NP	Jiri
JIU	Jiujiang	CN	Jiujiang
JIW	Jiwani	PK	Jiwani
JJI	Juanjui	PE	Juanjui
JJN	Jinjiang	CN	Jinjiang
JJU	Heliport	GL	Qaqortoq
JKG	Axamo	SE	Jonkoping
JKH	Chios	GR	Chios
JKR	Janakpur	NP	Janakpur
JKT	Metropolitan Area	ID	Jakarta
JKV	Cherokee County	US	Jacksonville, TX
JLA	Quartz Creek	US	Cooper Lodge
JLB	Heliport	US	Long Beach
JLD	Heliport	SE	Landskrona
JLH	US Army Heliport	US	Arlington Heights
JLN	Joplin Regional	US	Joplin, MO
JLO	Jesolo	IT	Jesolo
JLP	Juan Les Pins	FR	Juan Les Pins
JLR	Jabalpur	IN	Jabalpur
JLS	Jales	BR	Jales
JLX	Union Station H/P	US	Los Angeles
JMA	Marriot Astrodome	US	Houston
JMB	Jamba	AO	Jamba
JMC	Marin County	US	Sausalito, CA
JMD	Market Centre H/P	US	Dallas
JMH	Marriott Heliport	US	Schaumburg
JMK	Mikonos	GR	Mikonos
JMM	Malmo Harbour Heliport	SE	Malmo
JMN	Municipal Heliport	US	Mankato
JMO	Jomsom	NP	Jomsom
JMS	Jamestown	US	Jamestown
JMU	Jiamusi	CN	Jiamusi
JMY	Mammy Yoko Heliport	SL	Freetown
JNA	Januaria	BR	Januaria
JNB	Oliver Reginald Tambo International (Jan Smuts International)	ZA	Johannesburg
JNG	Jining	CN	Jining
JNH	North Park Inn H/P	US	Dallas
JNI	Junin	AR	Junin
JNN	Nanortalik	GL	Nanortalik
JNP	Heliport	US	Newport Beach
JNS	Heliport	GL	Narsaq
JNU	Boundary Bay	US	Juneau
JNX	Naxos Airport	GR	Naxos
JNZ	Jinzhou	CN	Jinzhou
JOC	Centerport Heliport	US	Santa Ana
JOE	Joensuu	FI	Joensuu
JOG	Adisutjipto	ID	Yogyakarta
JOH	Port Saint Johns	ZA	Port Saint Johns
JOI	Lauro Carneiro De Loyola	BR	Joinville
JOK	Joshkar-Ola	RU	Joshkar-Ola
JOL	Jolo	PH	Jolo
JOM	Njombe	TZ	Njombe
JON	Johnston Island	UM	Johnston Island
JOP	Josephstaal	PG	Josephstaal
JOR	The City Heliport	US	Orange
JOS	Jos	NG	Jos
JOT	Municipal	US	Joliet
JPA	Castro Pinto	BR	Joao Pessoa
JPD	Heliport	US	Pasadena
JPN	Pentagon Army	US	Washington
JPR	Ji-Parana	BR	Ji-Parana
JPT	Park Ten Heliport	US	Houston
JPU	La Defense Heliport	FR	Paris
JQA	Qaarsut	GL	Qaarsut
JQE	Jaque	PA	Jaque
JRA	West 30th St Heliport	US	New York
JRB	Downtown Manhattan H/p	US	New York, NY
JRC	Municipal Heliport	US	Rochester
JRD	Heliport	US	Riverside
JRE	East 60th Street H/P	US	New York
JRH	Rowriah	IN	Jorhat
JRK	Arsuk	GL	Arsuk
JRN	Juruena	BR	Juruena
JRO	Kilimanjaro	TZ	Kilimanjaro
JRS	Atarot	IL	Jerusalem
JSA	Jaisalmer	IN	Jaisalmer
JSD	Sikorsky Heliport	US	Stratford, CT
JSG	San Rafael H/P	US	San Rafael
JSH	Sitia	GR	Sitia
JSI	Skiathos	GR	Skiathos
JSK	Municipal Heliport	US	Saint Cloud
JSL	Steel Pier Hlpt	US	Atlantic City
JSM	Jose De San Martin	AR	Jose De San Martin
JSN	Sherman Oaks H/P	US	Los Angeles
JSO	Sodertalje Heliport	SE	Sodertalje
JSP	Seogwipo Heliport	KR	Jeju
JSR	Jessore	BD	Jessore
JSS	Spetsai Island	GR	Spetsai Island
JST	Cambria County	US	Johnstown
JSU	Heliport	GL	Maniitsoq
JSY	Syros Island	GR	Syros Island
JTI	Jatai	BR	Jatai
JTO	Heliport	US	Thousand Oaks
JTR	Santorini (Thira)	GR	Santorini (Thira)
JTY	Astypalaia	GR	Astypalaia Island
JUA	Juara	BR	Juara
JUB	Juba	SD	Juba
JUC	Universal City H/P	US	Los Angeles
JUI	Juist	DE	Juist
JUJ	El Cadillal	AR	Jujuy
JUL	Juliaca	PE	Juliaca
JUM	Jumla	NP	Jumla
JUN	Jundah	AU	Jundah
JUO	Jurado	CO	Jurado
JUP	Cable Heliport	US	Upland
JUR	Jurien Bay	AU	Jurien Bay
JUT	Juticalpa	HN	Juticalpa
JUV	Heliport	GL	Upernavik
JUZ	Juzhou	CN	Juzhou
JVA	Ankavandra	MG	Ankavandra
JVI	Central Jersey Regional Airport	US	Manville
JVL	Rock County	US	Janesville
JWA	Jwaneng	BW	Jwaneng
JWC	Warner Cntr Bus. Plaza	US	Los Angeles
JWH	Westchase Hilton H/P	US	Houston
JWL	Woodlawns	US	Houston
JWN	Zanjan	IR	Zanjan
JXN	Reynolds Municipal	US	Jackson
JYR	Jiroft	IR	Jiroft
JYV	Jyvaskyla	FI	Jyvaskyla
JZH	Jiu Zhai Huang Long	CN	Song Pan
KAA	Kasama	ZM	Kasama
KAB	Kariba	ZW	Kariba
KAC	Kameshli	SY	Kameshli
KAD	Kaduna	NG	Kaduna
KAE	SPB	US	Kake
KAF	Karato	PG	Karato
KAG	Gangneung	KR	Gangneung
KAH	City Heliport	AU	Melbourne
KAI	Kaieteur	GY	Kaieteur
KAJ	Kajaani	FI	Kajaani
KAK	Kar	PG	Kar
KAL	Kaltag	US	Kaltag
KAM	Kamaran Is	YE	Kamaran Is
KAN	Aminu Kano Intl Apt	NG	Kano
KAO	Kuusamo	FI	Kuusamo
KAP	Kapanga	ZR	Kapanga
KAQ	Kamulai	PG	Kamulai
KAR	Kamarang	GY	Kamarang
KAS	Karasburg	NA	Karasburg
KAT	Kaitaia	NZ	Kaitaia
KAU	Kauhava	FI	Kauhava
KAV	Kavanayen	VE	Kavanayen
KAW	Kawthaung	MM	Kawthaung
KAX	Kalbarri	AU	Kalbarri
KAY	Wakaya Island	FJ	Wakaya Island
KAZ	Kau	ID	Kau
KBA	Kabala	SL	Kabala
KBB	Kirkimbie	AU	Kirkimbie
KBC	Birch Creek	US	Birch Creek
KBD	Kimberley Downs	AU	Kimberley Downs
KBE	Hot Springs SPB	US	Bell Island
KBF	Karubaga	ID	Karubaga
KBG	Kabalega Falls	UG	Kabalega Falls
KBH	Kalat	PK	Kalat
KBI	Kribi	CM	Kribi
KBJ	Kings Canyon	AU	Kings Canyon
KBK	Klag Bay	US	Klag Bay
KBL	Khwaja Rawash	AF	Kabul
KBM	Kabwum	PG	Kabwum
KBN	Kabinda	ZR	Kabinda
KBO	Kabalo	ZR	Kabalo
KBP	Borispol	UA	Kiev
KBQ	Kasungu	MW	Kasungu
KBR	Sultan Ismail Petra	MY	Kota Bharu
KBS	Bo	SL	Bo
KBT	Kaben	MH	Kaben
KBU	Kotabaru	ID	Kotabaru
KBV	Krabi	TH	Krabi
KBW	Chignik Bay	US	Chignik
KBX	Kambuaya	ID	Kambuaya
KBY	Streaky Bay	AU	Streaky Bay
KBZ	Kaikoura	NZ	Kaikoura
KCA	Kuqa	CN	Kuqa
KCB	Tepoe Airstrip	SR	Kasikasima
KCC	Coffman Cove SPB	US	Coffman Cove
KCD	Kamur	ID	Kamur
KCE	Collinsville	AU	Collinsville
KCF	Kadanwari	PK	Kadanwari
KCG	Fisheries	US	Chignik
KCH	Kuching	MY	Kuching
KCI	Kon	ID	Kon
KCJ	Komaio	PG	Komaio
KCL	Lagoon	US	Chignik
KCM	Kahramanmaras	TR	Kahramanmaras
KCN	SPB	US	Chernofski
KCO	Cengiz Topel	TR	Kocaeli
KCP	Kamenets-podolskiy	UA	Kamenets-podolskiy
KCQ	Chignik	US	Chignik
KCR	Colorado Creek	US	Colorado Creek
KCS	Kings Creek Station	AU	Kings Creek Station
KCT	Koggala	LK	Koggala
KCU	Masindi	UG	Masindi
KCZ	Kochi	JP	Kochi
KDA	Kolda	SN	Kolda
KDB	Kambalda	AU	Kambalda
KDC	Kandi	BJ	Kandi
KDD	Khuzdar	PK	Khuzdar
KDE	Koroba	PG	Koroba
KDF	Kouba	DZ	Kouba
KDG	Kardjali	BG	Kardjali
KDH	Kandahar	AF	Kandahar
KDI	Wolter Monginsidi	ID	Kendari
KDK	Municipal	US	Kodiak
KDL	Kardla	EE	Kardla
KDM	Kaadedhdhoo	MV	Kaadedhdhoo
KDN	Ndende	GA	Ndende
KDO	Kadhdhoo	MV	Kadhdhoo
KDP	Kandep	PG	Kandep
KDQ	Kamberatoro	PG	Kamberatoro
KDR	Kandrian	PG	Kandrian
KDS	Kamaran Downs	AU	Kamaran Downs
KDT	Kamphangsaen	TH	Kamphangsaen
KDU	Skardu	PK	Skardu
KDV	Kandavu	FJ	Kandavu
KDW	Vic. Resevour Kandy	LK	Kandy
KDY	Mahaweli	LK	Mahaweli
KDZ	Polgolla Reservoir	LK	Katugastota
KEA	Keisah	ID	Keisah
KEB	Nanwalek	US	Nanwalek
KEC	Kasenga	ZR	Kasenga
KED	Kaedi	MR	Kaedi
KEE	Kelle	CG	Kelle
KEF	Keflavik International	IS	Reykjavik
KEG	Keglsugl	PG	Keglsugl
KEH	Kenmore Air Harbor	US	Kenmore Air Harbor
KEI	Kepi	ID	Kepi
KEJ	Kemerovo	RU	Kemerovo
KEK	Ekwok	US	Ekwok
KEL	Kiel-Holtenau	DE	Kiel
KEM	Kemi/Tornio	FI	Kemi/Tornio
KEN	Kenema	SL	Kenema
KEO	Odienne	CI	Odienne
KEP	Nepalganj	NP	Nepalganj
KEQ	Kebar	ID	Kebar
KER	Kerman	IR	Kerman
KES	Kelsey	CA	Kelsey
KET	Keng Tung	MM	Keng Tung
KEU	Kelly Bar	US	Kelly Bar
KEV	Halli	FI	Kuorevesi
KEW	Keewaywin	CA	Keewaywin
KEX	Kanabea	PG	Kanabea
KEY	Kericho	KE	Kericho
KEZ	Kelaniya River	LK	Kelaniya
KFA	Kiffa	MR	Kiffa
KFG	Kalkurung	AU	Kalkurung
KFP	False Pass	US	False Pass
KFS	Kastamonu	TR	Kastamonu
KGA	Kananga	ZR	Kananga
KGB	Konge	PG	Konge
KGC	Kingscote	AU	Kingscote
KGD	Kaliningrad Devau	RU	Kaliningrad
KGE	Kagau	SB	Kagau
KGF	Karaganda	KZ	Karaganda
KGG	Kedougou	SN	Kedougou
KGH	Yongai	PG	Yongai
KGI	Kalgoorlie	AU	Kalgoorlie
KGJ	Karonga	MW	Karonga
KGK	New Koliganek	US	New Koliganek
KGL	Gregoire Kayibanda	RW	Kigali
KGM	Kungum	PG	Kungum
KGN	Kasongo Lunda	ZR	Kasongo Lunda
KGO	Kirovograd	UA	Kirovograd
KGP	Kogalym International	RU	Kogalym
KGR	Kulgera	AU	Kulgera
KGS	Kos Island International Airport	GR	Kos
KGU	Keningau	MY	Keningau
KGW	Kagi	PG	Kagi
KGX	Grayling	US	Grayling
KGY	Kingaroy	AU	Kingaroy, Queensland
KGZ	Glacier Creek	US	Glacier Creek
KHA	Khaneh	IR	Khaneh
KHC	Kerch	UA	Kerch
KHD	Khorramabad	IR	Khorramabad
KHE	Kherson	UA	Kherson
KHG	Kashi	CN	Kashi
KHH	Kaoshiung International Airport	TW	Kaohsiung
KHI	Quaid-e-azam Intl	PK	Karachi
KHJ	Kauhajoki	FI	Kauhajoki
KHK	Khark Island	IR	Khark Island
KHL	Khulna	BD	Khulna
KHM	Khamti	MM	Khamti
KHN	Nanchang	CN	Nanchang
KHO	Khoka Moya	ZA	Khoka Moya
KHR	Kharkhorin	MN	Kharkhorin
KHS	Khasab	OM	Khasab
KHT	Khost	AF	Khost
KHU	Kremenchug	UA	Kremenchug
KHV	Novyy	RU	Khabarovsk
KHW	Khwai River Lodge	BW	Khwai River Lodge
KHY	Khoy	IR	Khoy
KHZ	Kauehi	PF	Kauehi
KIA	Kaiapit	PG	Kaiapit
KIB	SPB	US	Ivanof Bay
KIC	Mesa Del Rey	US	King City
KID	Kristianstad	SE	Kristianstad
KIE	Aropa	PG	Kieta
KIF	Kingfisher Lake	CA	Kingfisher Lake
KIG	Koinghaas	ZA	Koinghaas
KIH	Kish Island	IR	Kish Island
KII	Kibuli	PG	Kibuli
KIJ	Niigata	JP	Niigata
KIK	Kirkuk	IQ	Kirkuk
KIL	Kilwa	ZR	Kilwa
KIM	Kimberley	ZA	Kimberley
KIN	Norman Manley	JM	Kingston
KIO	Kili Island	MH	Kili Island
KIP	Kickapoo	US	Wichita Falls
KIQ	Kira	PG	Kira
KIR	Kerry	IE	Farranfore
KIS	Kisumu	KE	Kisumu
KIT	Kithira	GR	Kithira
KIU	Kiunga	KE	Kiunga
KIV	International Airport Chisinau	MD	Chisinau
KIW	Southdowns	ZM	Kitwe
KIX	Kansai International	JP	Osaka
KIY	Kilwa	TZ	Kilwa
KIZ	Kikinonda	PG	Kikinonda
KJA	Krasnojarsk	RU	Krasnojarsk
KJK	Kortrijk	BE	Kortrijk
KJP	Kerama	JP	Kerama
KJU	Kamiraba	PG	Kamiraba
KKA	Koyuk	US	Koyuk
KKB	SPB	US	Kitoi Bay
KKC	Khon Kaen	TH	Khon Kaen
KKD	Kokoda	PG	Kokoda
KKE	Kerikeri/Bay of Islands	NZ	Kerikeri
KKF	Kagvik Creek	US	Kagvik Creek
KKG	Konawaruk	GY	Konawaruk
KKH	Kongiganak	US	Kongiganak
KKI	Spb	US	Akiachak
KKJ	Kita Kyushu	JP	Kita Kyushu
KKK	Kalakaket AFS	US	Kalakaket
KKL	Karluk Lake SPB	US	Karluk Lake
KKM	Lop Buri	TH	Lop Buri
KKN	Hoeybuktmoen	NO	Kirkenes
KKO	Kaikohe	NZ	Kaikohe
KKP	Koolburra	AU	Koolburra
KKR	Kaukura Atoll	PF	Kaukura Atoll
KKT	Kentland	US	Kentland
KKU	Ekuk	US	Ekuk
KKW	Kikwit	ZR	Kikwit
KKX	Kikaiga Shima	JP	Kikaiga Shima
KKY	Kilkenny	IE	Kilkenny
KKZ	Koh Kong	KH	Koh Kong
KLB	Kalabo	ZM	Kalabo
KLC	Kaolack	SN	Kaolack
KLD	Migalovo	RU	Kalinin
KLE	Kaele	CM	Kaele
KLF	Kaluga	RU	Kaluga
KLG	Municipal	US	Kalskag
KLH	Kolhapur	IN	Kolhapur
KLI	Kota Koli	ZR	Kota Koli
KLK	Kalokol	KE	Kalokol
KLL	Levelock	US	Levelock
KLM	Kalaleh	IR	Kalaleh
KLN	Larsen SPB	US	Larsen Bay
KLO	Kalibo	PH	Kalibo
KLP	Kelp Bay	US	Kelp Bay
KLQ	Keluang	ID	Keluang
KLR	Kalmar	SE	Kalmar
KLS	Longview	US	Kelso
KLT	Kaiserslautern	DE	Kaiserslautern
KLU	Alpe Adria	AT	Klagenfurt
KLV	Karlovy Vary	CZ	Karlovy Vary
KLW	Klawock	US	Klawock
KLX	Kalamata	GR	Kalamata
KLY	Kalima	ZR	Kalima
KLZ	Kleinzee	ZA	Kleinzee
KMA	Kerema	PG	Kerema
KMB	Koinambe	PG	Koinambe
KMC	King Khalid Military	SA	King Khalid Mil. City
KMD	Mandji	GA	Mandji
KME	Kamembe	RW	Kamembe
KMF	Kamina	PG	Kamina
KMG	Kunming	CN	Kunming
KMH	Kuruman	ZA	Kuruman
KMI	Miyazaki	JP	Miyazaki
KMJ	Kumamoto	JP	Kumamoto
KMK	Makabana	CG	Makabana
KML	Kamileroi	AU	Kamileroi
KMM	Kimam	ID	Kimam
KMN	Kamina	ZR	Kamina
KMO	Manokotak SPB	US	Manokotak
KMP	J.G.H. Van Der Wath	NA	Keetmanshoop
KMQ	Komatsu	JP	Komatsu
KMR	Karimui	PG	Karimui
KMS	Kumasi	GH	Kumasi
KMT	Kampot	KH	Kampot
KMU	Kismayu	SO	Kismayu
KMV	Kalemyo	MM	Kalemyo
KMW	Kostroma	RU	Kostroma
KMX	Khamis Mushait	SA	Khamis Mushait
KMY	Moser Bay	US	Moser Bay
KMZ	Kaoma	ZM	Kaoma
KNA	Vina del Mar	CL	Vina del Mar
KNB	Kanab	US	Kanab
KND	Kindu	ZR	Kindu
KNE	Kanainj	PG	Kanainj
KNF	Marham RAF	GB	Kings Lynn
KNG	Kaimana	ID	Kaimana
KNH	Shang-Yi	TW	Kinmen
KNI	Katanning	AU	Katanning
KNJ	Kindamba	CG	Kindamba
KNK	Kakhonak	US	Kakhonak
KNL	Kelanoa	PG	Kelanoa
KNM	Kaniama	ZR	Kaniama
KNN	Kankan	GN	Kankan
KNO	Knokke/Het Zoute	BE	Knokke/Het Zoute
KNP	Capanda	AO	Capanda
KNQ	Kone	NC	Kone
KNR	Jam	IR	Kangan
KNS	King Island	AU	King Island, Tasmania
KNT	Municipal	US	Kennett
KNU	Kanpur	IN	Kanpur
KNV	Knights Inlet	CA	Knights Inlet
KNW	New Stuyahok	US	New Stuyahok
KNX	Kununurra	AU	Kununurra
KNY	Kinoosao	CA	Kinoosao
KNZ	Kenieba	ML	Kenieba
KOA	Kona International Airport	US	Kona, HI
KOB	Koutaba	CM	Koutaba
KOC	Koumac	NC	Koumac
KOD	Kotabangun	ID	Kotabangun
KOE	Eltari	ID	Kupang
KOF	Komatipoort	ZA	Komatipoort
KOG	Khong	LA	Khong
KOH	Koolatah	AU	Koolatah
KOI	Orkney Island	GB	Orkney Island
KOJ	Kagoshima	JP	Kagoshima
KOK	Kruunupyy	FI	Kokkola/Pietarsaari
KOL	Koumala	CF	Koumala
KOM	Komo-Manda	PG	Komo-Manda
KON	Kontum	VN	Kontum
KOO	Kongolo	ZR	Kongolo
KOP	Nakhon Phanom	TH	Nakhon Phanom
KOQ	Koethen	DE	Koethen
KOR	Kokoro	PG	Kokoro
KOS	Sihanoukville	KH	Sihanoukville
KOT	Kotlik	US	Kotlik
KOU	Koulamoutou	GA	Koulamoutou
KOV	Kokshetau	KZ	Kokshetau
KOW	Ganzhou	CN	Ganzhou
KOX	Kokonao	ID	Kokonao
KOY	Olga Bay SPB	US	Olga Bay
KOZ	Ouzinkie SPB	US	Ouzinkie
KPA	Kopiago	PG	Kopiago
KPB	Point Baker SPB	US	Point Baker
KPC	Port Clarence	US	Port Clarence
KPD	King Of Prussia	US	King Of Prussia
KPE	Yapsiei	PG	Yapsiei
KPF	Kondubol	PG	Kondubol
KPG	Kurupung	GY	Kurupung
KPH	Pauloff Harbor SPB	US	Pauloff Harbor
KPI	Kapit	MY	Kapit
KPK	Parks SPB	US	Parks
KPL	Kapal	PG	Kapal
KPM	Kompiam	PG	Kompiam
KPN	Kipnuk SPB	US	Kipnuk
KPO	Pohang	KR	Pohang
KPP	Kalpowar	AU	Kalpowar
KPR	Port Williams SPB	US	Port Williams
KPS	Kempsey	AU	Kempsey
KPT	Jackpot	US	Jackpot
KPV	Perryville SPB	US	Perryville
KPY	Port Bailey SPB	US	Port Bailey
KQA	Akutan	US	Akutan
KQB	Koonibba	AU	Koonibba
KQL	Kol	PG	Kol
KRA	Kerang	AU	Kerang
KRB	Karumba	AU	Karumba
KRC	Kerinci	ID	Kerinci
KRD	Kurundi	AU	Kurundi
KRE	Kirundo	BI	Kirundo
KRF	Kramfors	SE	Kramfors
KRG	Karasabai	GY	Karasabai
KRI	Kikori	PG	Kikori
KRJ	Karawari	PG	Karawari
KRK	John Paul II Balice International	PL	Krakow
KRL	Korla	CN	Korla
KRM	Karanambo	GY	Karanambo
KRN	Kiruna	SE	Kiruna
KRO	Kurgan	RU	Kurgan
KRP	Karup	DK	Karup
KRQ	Kramatorsk	UA	Kramatorsk
KRR	Pashkovsky	RU	Krasnodar
KRS	Kjevik	NO	Kristiansand
KRT	Civil	SD	Khartoum
KRU	Kerau	PG	Kerau
KRV	Kerio Valley	KE	Kerio Valley
KRW	Turkmanbashi	TM	Turkmenbashi
KRX	Kar Kar	PG	Kar Kar
KRY	Karamay	CN	Karamay
KRZ	Kiri	ZR	Kiri
KSA	Kosrae	FM	Kosrae
KSB	Kasanombe	PG	Kasanombe
KSC	Barca	SK	Kosice
KSD	Karlstad	SE	Karlstad
KSE	Kasese	UG	Kasese
KSF	Kassel-Calden	DE	Kassel
KSG	Kisengan	PG	Kisengan
KSH	Kermanshah	IR	Kermanshah
KSI	Kissidougou	GN	Kissidougou
KSJ	Kasos Island	GR	Kasos Island
KSK	Karlskoga	SE	Karlskoga
KSL	Kassala	SD	Kassala
KSM	Saint Marys	US	Saint Marys
KSN	Kostanay	KZ	Kostanay
KSO	Aristoteles Airport	GR	Kastoria
KSP	Kosipe	PG	Kosipe
KSQ	Karshi	UZ	Karshi
KSR	Federal No 1	US	Sandy River
KSS	Sikasso	ML	Sikasso
KST	Kosti	SD	Kosti
KSU	Kvernberget	NO	Kristiansund
KSV	Springvale	AU	Springvale
KSW	Kiryat Shmona	IL	Kiryat Shmona
KSX	Yasuru	PG	Yasuru
KSY	Kars	TR	Kars
KSZ	Kotlas	RU	Kotlas
KTA	Karratha	AU	Karratha
KTB	Thorne Bay	US	Thorne Bay
KTC	Katiola	CI	Katiola
KTD	Kitadaito	JP	Kitadaito
KTE	Kerteh	MY	Kerteh
KTF	Takaka	NZ	Takaka
KTG	Ketapang	ID	Ketapang
KTH	SPB	US	Tikchik
KTI	Kratie	KH	Kratie
KTK	Kanua	PG	Kanua
KTL	Kitale	KE	Kitale
KTM	Tribhuvan	NP	Kathmandu
KTN	International	US	Ketchikan
KTO	Kato	GY	Kato
KTP	Tinson	JM	Kingston
KTQ	Kitee	FI	Kitee
KTR	Tindal	AU	Katherine
KTS	Brevig Mission	US	Teller Mission
KTT	Kittila	FI	Kittila
KTU	Kota	IN	Kota
KTV	Kamarata	VE	Kamarata
KTW	Pyrzowice	PL	Katowice
KTX	Koutiala	ML	Koutiala
KTY	Katukurunda Slaf Base	LK	Katukurunda
KTZ	Kwun Tong	HK	Kwun Tong
KUA	Kuantan	MY	Kuantan
KUC	Kuria	KI	Kuria
KUD	Kudat	MY	Kudat
KUE	Kukundu	SB	Kukundu
KUF	Kurumoch	RU	Samara
KUG	Kubin Island	AU	Kubin Island
KUH	Kushiro	JP	Kushiro
KUI	Kawau Island	NZ	Kawau Island
KUJ	Kushimoto	JP	Kushimoto
KUK	Kasigluk	US	Kasigluk
KUL	Kuala Lumpur International Airport (klia)	MY	Kuala Lumpur
KUM	Yakushima	JP	Yakushima
KUN	Kaunas	LT	Kaunas
KUO	Kuopio	FI	Kuopio
KUP	Kupiano	PG	Kupiano
KUQ	Kuri	PG	Kuri
KUR	Kuran-O-Munjan	AF	Kuran-O-Munjan
KUS	Kulusuk	GL	Kulusuk
KUT	Kopitnari	GE	Kutaisi
KUU	Kullu Manali	IN	Bhuntar Kullu.
KUV	Gunsan	KR	Gunsan
KUW	Kugururok River	PG	Kugururok River
KUX	Kuyol	PG	Kuyol
KUY	Kamusi Airport	US	Kamusi
KUZ	Gunsan Airbase	KR	Gunsan AB
KVA	Megas Alexandros International	GR	Kavala
KVB	Skovde	SE	Skovde
KVC	King Cove	US	King Cove
KVD	Gyandzha	AZ	Gyandzha
KVE	Kitava	PG	Kitava
KVG	Kavieng	PG	Kavieng
KVK	Kirovsk	RU	Kirovsk
KVL	Kivalina	US	Kivalina
KVU	Korolevu	FJ	Korolevu
KVX	Kirov	RU	Kirov
KWA	Kwajalein	MH	Kwajalein
KWB	Karimunjawa	ID	Karimunjawa
KWD	Kawadjia	CF	Kawadjia
KWE	Guiyang	CN	Guiyang
KWF	Waterfall SPB	US	Waterfall
KWG	Krivoy Rog	UA	Krivoy Rog
KWH	Khwahan	AF	Khwahan
KWI	Kuwait International	KW	Kuwait City
KWJ	Gwangju	KR	Gwangju
KWK	Kwigillingok	US	Kwigillingok
KWL	Guilin	CN	Guilin
KWM	Kowanyama	AU	Kowanyama
KWN	Kwinhagak	US	Quinhagak
KWO	Kawito	PG	Kawito
KWP	Village SPB	US	West Point
KWR	Kwai Harbour	SB	Kwai Harbour
KWS	Kwailabesi Aerodrom	SB	Kwailabesi
KWT	Kwethluk	US	Kwethluk
KWU	Mansion House	NZ	Mansion House
KWV	Kurwina	PG	Kurwina
KWX	Kiwai Island	PG	Kiwai Island
KWY	Kiwayu	KE	Kiwayu
KWZ	Kolwezi	CD	Kolwezi
KXA	Kasaan SPB	US	Kasaan
KXE	Klerksdorp	ZA	Klerksdorp
KXF	Koro Island	FJ	Koro Island
KXK	Komsomolsk Na Amure	RU	Komsomolsk Na Amure
KXR	Karoola	PG	Karoola
KXU	Katiu	PF	Katiu
KYA	Konya	TR	Konya
KYB	Yangoonabie	AU	Yangoonabie
KYD	Orchid Island	TW	Orchid Island
KYE	Kleyate	LB	Tripoli
KYF	Yeelirrie	AU	Yeelirrie
KYI	Yalata Mission	AU	Yalata Mission
KYK	Karluk	US	Karluk
KYL	Port Largo	US	Key Largo
KYN	Milton Keynes	GB	Milton Keynes
KYO	Topp Of Tampa	US	Tampa
KYP	Kyaukpyu	MM	Kyaukpyu
KYS	Kayes	ML	Kayes
KYT	Kyauktaw	MM	Kyauktaw
KYU	Koyukuk	US	Koyukuk
KYX	Yalumet	PG	Yalumet
KYZ	Kyzyl	RU	Kyzyl
KZB	Zachar Bay SPB	US	Zachar Bay
KZC	Kompong-Chhna	KH	Kompong-Chhna
KZD	Krakor	KH	Krakor
KZF	Kaintiba	PG	Kaintiba
KZG	Kitzingen	DE	Kitzingen
KZH	Kizhuyak	US	Kizhuyak
KZI	Philippos Airport	GR	Kozani
KZK	Kompong Thom	KH	Kompong Thom
KZN	Kazan	RU	Kazan
KZO	Kzyl-Orda	KZ	Kzyl-Orda
KZS	Kastelorizo	GR	Kastelorizo
LAA	Lamar Field	US	Lamar
LAB	Lablab	PG	Lablab
LAC	Layang-Layang Airstrip	MY	Pulau Layang-Layang Is
LAD	4 de Fevereiro	AO	Luanda
LAE	Nadzab	PG	Lae
LAF	Purdue University	US	Lafayette
LAG	La Guaira	VE	La Guaira
LAH	Labuha	ID	Labuha
LAI	Servel	FR	Lannion
LAJ	Lages	BR	Lages
LAK	Aklavik	CA	Aklavik
LAL	Municipal	US	Lakeland
LAM	Los Alamos	US	Los Alamos
LAN	Capital City	US	Lansing
LAO	Laoag International Airport	PH	Laoag
LAP	General Manuel Márquez De León International Airport	MX	La Paz
LAQ	La Braq	LY	Beida
LAR	General Brees Field	US	Laramie
LAS	Mc Carran Intl	US	Las Vegas
LAT	La Uribe	CO	La Uribe
LAU	Lamu	KE	Lamu
LAV	Lalomalava	WS	Lalomalava
LAW	Municipal	US	Lawton
LAX	Los Angeles International	US	Los Angeles
LAY	Ladysmith	ZA	Ladysmith
LAZ	Bom Jesus Da Lapa	BR	Bom Jesus Da Lapa
LBA	Leeds/bradford	GB	Leeds
LBB	International	US	Lubbock
LBC	Lübeck Blankensee	DE	Lübeck
LBD	Khudzhand	TJ	Khudzhand
LBE	Westmoreland County	US	Latrobe
LBF	Lee Bird Field	US	North Platte
LBG	Le Bourget	FR	Paris
LBH	Palm Beach SPB	AU	Sydney
LBI	Le Sequestre	FR	Albi
LBJ	Mutiara	ID	Labuan Bajo
LBK	Liboi	KE	Liboi
LBL	Municipal	US	Liberal
LBM	Luabo	MZ	Luabo
LBN	Lake Baringo	KE	Lake Baringo
LBO	Lusambo	ZR	Lusambo
LBP	Long Banga Airfield	MY	Long Banga
LBQ	Lambarene	GA	Lambarene
LBR	Labrea	BR	Labrea
LBS	Labasa	FJ	Labasa
LBT	Lumberton	US	Lumberton
LBU	Labuan	MY	Labuan
LBV	Libreville	GA	Libreville
LBW	Long Bawan	ID	Long Bawan
LBX	Lubang	PH	Lubang
LBY	Montoir	FR	La Baule-Escoublac
LBZ	Lukapa	AO	Lukapa
LCA	Larnaca	CY	Larnaca
LCB	Pontes e Lacerda	BR	Pontes e Lacerda
LCC	Galatina	IT	Lecce
LCD	Louis Trichardt	ZA	Louis Trichardt
LCE	Goloson International	HN	La Ceiba
LCF	Las Vegas	GT	Rio Dulce
LCG	La Coruna	ES	La Coruna
LCH	Municipal	US	Lake Charles
LCI	Municipal	US	Laconia
LCJ	Lodz Lublinek	PL	Lodz
LCK	Rickenbacker	US	Columbus
LCL	La Coloma	CU	La Coloma
LCM	La Cumbre	AR	La Cumbre
LCN	Balcanoona	AU	Balcanoona
LCO	Lague	CG	Lague
LCP	Loncopue	AR	Loncopue
LCR	La Chorrera	CO	La Chorrera
LCS	Las Canas	CR	Las Canas
LCV	Lucca	IT	Lucca
LCX	Liancheng	CN	Longyan
LCY	London City Airport	GB	London
LDA	Malda	IN	Malda
LDB	Londrina	BR	Londrina
LDC	Lindeman Island	AU	Lindeman Island
LDE	Tarbes Ossun Lourdes	FR	Lourdes/Tarbes
LDG	Leshukonskoye	RU	Leshukonskoye
LDH	Lord Howe Island	AU	Lord Howe Island
LDI	Kikwetu	TZ	Lindi
LDJ	Linden	US	Linden
LDK	Hovby	SE	Lidkoping
LDM	Mason County	US	Ludington
LDN	Lamidanda	NP	Lamidanda
LDO	Ladouanie	SR	Ladouanie
LDR	Lodar	YE	Lodar
LDU	Lahad Datu	MY	Lahad Datu
LDV	Landivisiau	FR	Landivisiau
LDW	Lansdowne	AU	Lansdowne
LDX	St-Laurent du Maroni	GF	St Laurent du Maroni
LDY	Eglinton (City of Derry)	GB	Derry
LDZ	Londolozi	ZA	Londolozi
LEA	Learmonth	AU	Learmonth
LEB	White River	US	White River
LEC	Chapada Diamantina	BR	Lencois
LED	Pulkovo	RU	St Petersburg
LEE	Leesburg	US	Leesburg
LEF	Lebakeng	LS	Lebakeng
LEG	Aleg	MR	Aleg
LEH	Octeville	FR	Le Havre
LEI	Almeria	ES	Almeria
LEJ	Halle	DE	Leipzig-Halle
LEK	Labe	GN	Labe
LEL	Lake Evella	AU	Lake Evella
LEM	Lemmon	US	Lemmon
LEN	Leon	ES	Leon
LEO	Leconi	GA	Leconi
LEP	Leopoldina	BR	Leopoldina
LEQ	Lands End	GB	Lands End
LER	Leinster	AU	Leinster
LES	Lesobeng	LS	Lesobeng
LET	Gen. A.V. Cobo	CO	Leticia
LEV	Levuka Airfield	FJ	Bureta
LEW	Auburn	US	Lewiston
LEX	Blue Grass	US	Lexington
LEY	Lelystad	NL	Lelystad
LEZ	La Esperanza	HN	La Esperanza
LFB	Lumbo	MZ	Lumbo
LFI	Langley AFB	US	Hampton, VA
LFK	Lufkin Angelina County	US	Lufkin, TX
LFM	Lamerd	IR	Lamerd
LFN	Franklin	US	Louisburg
LFO	Kelafo	ET	Kelafo/Callaf
LFP	Lakefield	AU	Lakefield
LFR	La Fria	VE	La Fria
LFT	Lafayette Regional	US	Lafayette, LA
LFW	Lome	TG	Lome
LGA	La Guardia	US	New York
LGB	Long Beach Municipal	US	Long Beach
LGC	Calloway	US	La Grange
LGD	La Grande	US	La Grande
LGE	Lake Gregory	AU	Lake Gregory
LGF	Laguna AAF	US	Yuma
LGG	Liege Airport	BE	Liege
LGH	Leigh Creek	AU	Leigh Creek
LGI	Deadmans Cay	BS	Long Island
LGK	Langakawi Intl	MY	Langkawi
LGL	Long Lellang	MY	Long Lellang
LGM	Laiagam	PG	Laiagam
LGN	Linga Linga	PG	Linga Linga
LGO	Langeoog	DE	Langeoog
LGP	Legazpi	PH	Legazpi
LGQ	Lago Agrio	EC	Lago Agrio
LGR	Cochrane	CL	Cochrane
LGS	Malargue	AR	Malargue
LGT	Las Gaviotas	CO	Las Gaviotas
LGU	Cache	US	Logan
LGW	London Gatwick	GB	London
LGX	Lugh Ganane	SO	Lugh Ganane
LGY	Lagunillas	VE	Lagunillas
LGZ	Leguizamo	CO	Leguizamo
LHA	Black Forest	DE	Lahr
LHB	Lost Harbor Sea Port	US	Lost Harbor
LHE	Alama Iqbal International	PK	Lahore
LHG	Lightning Ridge	AU	Lightning Ridge
LHI	Lereh	ID	Lereh
LHK	Guanghua	CN	Guanghua
LHM	Lincoln Regional Airport	US	Lincoln, CA
LHN	Lishan	TW	Lishan
LHP	Lehu	PG	Lehu
LHR	London Heathrow	GB	London
LHS	Las Heras	AR	Las Heras
LHU	Lianshulu	NA	Caprivi
LHV	W T Piper Memorial	US	Lock Haven
LHW	Lanzhou Airport	CN	Lanzhou
LIA	Liangping	CN	Liangping
LIB	Limbunya	AU	Limbunya
LIC	Municipal	US	Limon
LID	Valkenburg	NL	Leiden
LIE	Libenge	ZR	Libenge
LIF	Lifou	NC	Lifou
LIG	Bellegarde	FR	Limoges
LIH	Lihue	US	Kauai Island
LII	Mulia	ID	Mulia
LIJ	Long Island	US	Long Island
LIK	Likiep Island	MH	Likiep Island
LIL	Lesquin	FR	Lille
LIM	Jorge Chavez International	PE	Lima
LIN	Linate	IT	Milan
LIO	Limon International Airport	CR	Limon
LIP	Lins	BR	Lins
LIQ	Lisala	ZR	Lisala
LIR	Daniel Oduber International	CR	Liberia
LIS	Portela	PT	Lisbon
LIT	Adams Field Airport	US	Little Rock, AR
LIU	Linosa Heliport	IT	Linosa
LIV	Livengood	US	Livengood, AK
LIW	Loikaw	MM	Loikaw
LIX	Likoma	MW	Likoma Island
LIY	Wright AAF	US	Hinesville
LIZ	Loring AFB	US	Limestone
LJA	Lodja	CD	Lodja
LJC	Intercontinental	US	Louisville
LJG	Lijiang	CN	Lijiang City
LJN	Brazoria County	US	Lake Jackson
LJU	Brnik	SI	Ljubljana
LKA	Larantuka	ID	Larantuka
LKB	Lakeba	FJ	Lakeba
LKC	Lekana	CG	Lekana
LKD	Lakeland Downs	AU	Lakeland Downs
LKE	Kenmore Air Harbor SPB	US	Seattle, WA
LKG	Lokichoggio	KE	Lokichoggio
LKH	Long Akah	MY	Long Akah
LKI	Lakeside USAF	US	Duluth
LKK	Kulik Lake	US	Kulik Lake
LKL	Banak	NO	Lakselv
LKN	Leknes	NO	Leknes
LKO	Amausi	IN	Lucknow
LKP	Lake Placid	US	Lake Placid
LKR	Las Khoreh	SO	Las Khoreh
LKS	Lakeside	US	Lakeside
LKT	Lakota	CI	Lakota
LKU	Lake Rudolf	KE	Lake Rudolf
LKV	Lake County	US	Lakeview
LKY	Lake Manyara	TZ	Lake Manyara
LKZ	RAF Lakenheath	GB	Brandon
LLA	Kallax	SE	Lulea
LLE	Malelane	ZA	Malelane
LLF	LingLing	CN	LingLing
LLG	Chillagoe	AU	Chillagoe
LLH	Las Limas	HN	Las Limas
LLI	Lalibela	ET	Lalibela
LLL	Lissadell	AU	Lissadell
LLM	Long Lama	MY	Long Lama
LLN	Kelila	ID	Kelila
LLP	Linda Downs	AU	Linda Downs
LLS	Las Lomitas	AR	Las Lomitas
LLT	Lilydale Airport	AU	Lilydale
LLU	Alluitsup Paa	GL	Alluitsup Paa
LLW	Kumuzu International Airport	MW	Lilongwe
LLX	Lyndonville	US	Lyndonville
LLY	Burlington County	US	Mount Holly
LMA	Lake Minchumina	US	Lake Minchumina
LMB	Salima	MW	Salima
LMC	Lamacarena	CO	Lamacarena
LMD	Los Menucos	AR	Los Menucos
LME	Arnage	FR	Le Mans
LMG	Lamassa	PG	Lamassa
LMH	Limon	HN	Limon
LMI	Lumi	PG	Lumi
LML	Lae Island	MH	Lae Island
LMM	Federal (Valle Del Fuerte)	MX	Los Mochis
LMN	Limbang	MY	Limbang
LMO	RAF Station	GB	Lossiemouth
LMP	Lampedusa	IT	Lampedusa
LMQ	Marsa Brega	LY	Marsa Brega
LMR	Lime Acres	ZA	Lime Acres
LMS	Winston County	US	Louisville
LMT	Kingsley Field	US	Klamath Falls
LMX	Lopez De Micay	CO	Lopez De Micay
LMY	Lake Murray	PG	Lake Murray
LMZ	Palma	MZ	Palma
LNA	Palm Beach County Park	US	West Palm Beach
LNB	Lamen Bay	VU	Lamen Bay
LNC	Lengbati	PG	Lengbati
LND	Hunt Field	US	Lander
LNE	Lonorore	VU	Lonorore
LNF	Munbil	PG	Munbil
LNG	Lese	PG	Lese
LNH	Lake Nash	AU	Lake Nash
LNI	Dew Station	US	Lonely
LNJ	Lincang	CN	Lincang
LNK	Lincoln	US	Lincoln, NE
LNM	Langimar	PG	Langimar
LNN	Lost Nation	US	Willoughby
LNO	Leonora	AU	Leonora
LNP	Wise	US	Wise
LNQ	Loani	PG	Loani
LNR	Tri County	US	Lone Rock
LNS	Lancaster	US	Lancaster
LNV	Lihir Island	PN	Lihir Island
LNX	Smolensk	RU	Smolensk
LNY	Lanai City	US	Lanai City
LNZ	Blue Danube	AT	Linz
LOA	Lorraine	AU	Lorraine
LOB	Los Andes	CL	Los Andes
LOC	Lock	AU	Lock
LOD	Longana	VU	Longana
LOE	Loei	TH	Loei
LOF	Loen	MH	Loen
LOG	Longview	US	Longview
LOH	Camilo Ponce Enríquez Airport	EC	Catamayo, Loja
LOI	Helmuth Baungartem	BR	Lontras
LOK	Lodwar	KE	Lodwar
LOL	Derby Field	US	Lovelock
LOM	Francisco P. V. Y R.	MX	Lagos De Moreno
LOO	Laghouat	DZ	Laghouat
LOQ	Lobatse	BW	Lobatse
LOR	Lowe Army Heliport	US	Ozark, AL
LOS	Murtala Muhammed	NG	Lagos
LOT	Lewis Lockport	US	Lockport
LOU	Bowman Field Airport	US	Louisville
LOV	Monclova	MX	Monclova
LOW	Louisa	US	Louisa
LOX	Los Tablones Airport	GT	Los Tablones
LOY	Loyangalani	KE	Loyangalani
LOZ	Corbin-London	US	London
LPA	Gran Canaria	ES	Las Palmas
LPB	El Alto	BO	La Paz
LPC	Lompoc Airport	US	Lompoc
LPD	La Pedrera	CO	La Pedrera
LPE	La Primavera	CO	La Primavera
LPG	La Plata	AR	La Plata
LPH	Heliport	GB	Lochgilphead
LPI	Linkoping	SE	Linkoping
LPJ	Pijiguaos	VE	Pijiguaos
LPK	Lipetsk	RU	Lipetsk
LPL	Liverpool John Lennon	GB	Liverpool
LPM	Lamap	VU	Lamap
LPN	Leron Plains	PG	Leron Plains
LPO	Municipal	US	Laporte
LPP	Lappeenranta	FI	Lappeenranta
LPQ	Luang Prabang	LA	Luang Prabang
LPS	Lopez Island	US	Lopez Island
LPT	Lampang	TH	Lampang
LPU	Long Apung	ID	Long Apung
LPW	Little Port Walter	US	Little Port Walter
LPX	Liepaja	LV	Liepaja
LPY	Loudes	FR	Le Puy
LQK	Pickens	US	Pickens
LQM	Puerto Leguizamo	CO	Puerto Leguizamo
LQN	Qala Nau	AF	Qala Nau
LRA	Larisa	GR	Larisa
LRB	Leribe	LS	Leribe
LRC	R.A.F.	DE	Laarbruch
LRD	International	US	Laredo
LRE	Longreach	AU	Longreach
LRF	Little Rock Afb	US	Jacksonville
LRG	Lora Lai	PK	Lora Lai
LRH	Laleu	FR	La Rochelle
LRI	Lorica	CO	Lorica
LRJ	Municipal	US	Lemars
LRK	Coast Guard	US	Lincoln Rock, AK
LRL	Niamtougou	TG	Niamtougou
LRM	Casa de Campo International	DO	La Romana
LRN	Larson AFB	US	Moses Lake
LRO	Sharpe AAF	US	Lathrop
LRQ	Laurie River	CA	Laurie River
LRR	Lar A/P	IR	Lar
LRS	Leros	GR	Leros
LRT	Lann Bihoue	FR	Lorient
LRU	Municipal	US	Las Cruces, NM
LRV	Los Roques	VE	Los Roques
LSA	Losuia	PG	Losuia
LSB	Lordsburg	US	Lordsburg
LSC	La Florida	CL	La Serena
LSD	Blue Grass Station Army Heliport	US	Lexington, KY
LSE	Municipal	US	La Crosse
LSF	Lawson Aaf	US	Columbus
LSH	Lashio	MM	Lashio
LSI	Sumburgh	GB	Shetland Islands
LSJ	Long Island	PG	Long Island
LSK	Lusk	US	Lusk
LSL	Los Chiles	CR	Los Chiles
LSM	Lawas	MY	Long Semado
LSN	Los Banos	US	Los Banos
LSO	Talmont	FR	Les Sables
LSP	Josefa Camejo	VE	Las Piedras
LSQ	Los Angeles	CL	Los Angeles
LSR	Lost River	US	Lost River
LSS	Terre-de-Haut	GP	Terre-de-Haut
LST	Launceston	AU	Launceston
LSU	Long Sukang	MY	Long Sukang
LSV	Nellis AFB	US	Las Vegas, NV
LSW	Lhoksumawe	ID	Lhoksumawe
LSX	Lhok Sukon	ID	Lhok Sukon
LSY	Lismore	AU	Lismore
LSZ	Losinj Arpt	HR	Mali Losinj
LTA	Letaba	ZA	Tzaneen
LTB	Latrobe	AU	Latrobe
LTC	Lai	TD	Lai
LTD	Ghadames	LY	Ghadames
LTF	Leitre	PG	Leitre
LTG	Langtang	NP	Langtang
LTH	Lathrop Wells	US	Lathrop Wells
LTI	Altai	MN	Altai
LTK	Latakia	SY	Latakia
LTL	Lastourville	GA	Lastourville
LTM	Lethem	GY	Lethem
LTN	London Luton Airport	GB	London/Luton
LTO	Loreto	MX	Loreto
LTP	Lyndhurst	AU	Lyndhurst
LTQ	Le Touquet	FR	Le Touquet
LTR	Letterkenny	IE	Letterkenny
LTS	Altus AFB	US	Altus
LTT	La Mole	FR	Saint Tropez
LTV	Lotusvale	AU	Lotusvale
LTW	St Marys County	US	Leonardtown
LTX	Cotopaxi International	EC	Latacunga
LUA	Lukla	NP	Lukla
LUB	Lumid Pau	GY	Lumid Pau
LUC	Laucala Is	FJ	Laucala Is
LUD	Luderitz	NA	Luderitz
LUE	Lucenec	SK	Lucenec
LUF	Luke Afb	US	Phoenix
LUG	Lugano	CH	Lugano/Agno
LUH	Amritsar	IN	Ludhiana
LUI	La Union	HN	La Union
LUJ	Lusikisiki	ZA	Lusikisiki
LUK	Cincinnati Municipal-Lunken Field	US	Cincinnati, OH
LUL	Hesler-Noble Field	US	Laurel, MS
LUM	Mangshi	CN	Luxi
LUN	Lusaka	ZM	Lusaka
LUO	Luena	AO	Luena
LUP	Kalaupapa	US	Kalaupapa
LUQ	San Luis	AR	San Luis
LUR	Cape Lisburne	US	Cape Lisburne
LUS	Lusanga	ZR	Lusanga
LUT	Laura Station	AU	Laura Station
LUU	Laura	AU	Laura
LUV	Langgur	ID	Langgur
LUW	Luwuk	ID	Luwuk
LUX	Findel	LU	Luxembourg
LUY	Lushoto	TZ	Lushoto
LUZ	Lushan	CN	Lushan
LVA	Entrammes	FR	Laval
LVB	Dos Galpoes	BR	Livramento
LVD	Lime Village	US	Lime Village
LVI	Livingstone	ZM	Livingstone
LVK	Livermore	US	Livermore
LVL	Lawrenceville	US	Lawrenceville
LVM	Mission Field	US	Livingston
LVO	Laverton	AU	Laverton
LVP	Lavan	IR	Lavan
LVS	Las Vegas	US	Las Vegas
LWA	Lwbak	PH	Lwbak
LWB	Greenbrier Valley	US	Lewisburg
LWC	Lawrence	US	Lawrence
LWE	Lewoleba	ID	Lewoleba
LWH	Lawn Hill	AU	Lawn Hill
LWI	Lowai	PG	Lowai
LWK	Lerwick/Tingwall	GB	Shetland Islands
LWL	Harriet Field	US	Wells
LWM	Lawrence	US	Lawrence
LWN	Gyoumri	AM	Gyoumri
LWO	Snilow	UA	Lviv
LWR	Leeuwarden	NL	Leeuwarden
LWS	Nez Perce County Rgnl	US	Lewiston
LWT	Municipal	US	Lewistown
LWV	Municipal	US	Lawrenceville
LWY	Lawas	MY	Lawas
LXA	Gonggar/Lhasa	CN	Gonggar
LXG	Luang Namtha	LA	Luang Namtha
LXI	Linxi	CN	Linxi
LXN	Lexington	US	Lexington
LXR	Luxor	EG	Luxor
LXS	Limnos	GR	Limnos
LXU	Lukulu	ZM	Lukulu
LXV	Leadville	US	Leadville
LYA	Luoyang	CN	Luoyang
LYB	Little Cayman	KY	Little Cayman
LYC	Lycksele	SE	Lycksele
LYE	RAF Station	GB	Lyneham
LYG	Lianyungang	CN	Lianyungang
LYH	Preston-glenn Field	US	Lynchburg, VA
LYI	Linyi	CN	Linyi
LYK	Lunyuk	ID	Lunyuk
LYN	Bron	FR	Lyon
LYO	Rice County Municipal	US	Lyons
LYP	Faisalabad	PK	Faisalabad
LYR	Svalbard	NO	Longyearbyen
LYS	St-Exupéry	FR	Lyon
LYT	Lady Elliot Island	AU	Lady Elliot Island
LYU	Ely	US	Ely
LYX	London Ashford International (Ferryfield)	GB	Lydd
LZA	Luiza	ZR	Luiza
LZC	Lazaro Cardenas	MX	Lazaro Cardenas
LZD	Lanzhoudong	CN	Lanzhou
LZH	Liuzhou	CN	Liuzhou
LZI	Luozi	ZR	Luozi
LZM	Luzamba	AO	Luzamba
LZN	Nangan	TW	Nangan
LZO	Luzhou	CN	Luzhou
LZR	Lizard Island	AU	Lizard Island
LZU	Gwinnett County Airport	US	Lawrenceville
MAA	Madras International (Meenambakkam)	IN	Chennai/Madras
MAB	Maraba	BR	Maraba
MAC	Smart	US	Macon
MAD	Barajas	ES	Madrid
MAE	Madera	US	Madera
MAF	Midland International	US	Midland
MAG	Madang	PG	Madang
MAH	Mahon	ES	Menorca
MAI	Mangochi	MW	Mangochi
MAJ	Amata Kabua Intl	MH	Majuro
MAK	Malakal	SD	Malakal
MAL	Mangole	ID	Mangole
MAM	Matamoros	MX	Matamoros
MAN	Ringway Inernational Airport	GB	Manchester
MAO	Eduardo Gomes Intl	BR	Manaus
MAP	Mamai	PG	Mamai
MAQ	Mae Sot	TH	Mae Sot
MAR	La Chinita	VE	Maracaibo
MAS	Momote	PG	Manus Island
MAT	Matadi	ZR	Matadi
MAU	Maupiti	PF	Maupiti
MAV	Maloelap Island	MH	Maloelap Island
MAW	Malden	US	Malden
MAX	Matam	SN	Matam
MAY	Mangrove Cay	BS	Mangrove Cay
MAZ	Eugenio M De Hostos	PR	Mayaguez
MBA	Moi International	KE	Mombasa
MBB	Marble Bar	AU	Marble Bar
MBC	Mbigou	GA	Mbigou
MBD	Mafikeng International Airport	ZA	Mmabatho
MBE	Monbetsu	JP	Monbetsu
MBF	Mount Buffalo	AU	Mount Buffalo
MBG	Mobridge	US	Mobridge
MBH	Maryborough	AU	Maryborough
MBI	Mbeya	TZ	Mbeya
MBJ	Sangster International	JM	Montego Bay
MBK	Matupa	BR	Matupa
MBL	Blacker	US	Manistee
MBM	Mkambati	ZA	Mkambati
MBN	Mt Barnett	AU	Mt Barnett
MBO	Mamburao	PH	Mamburao
MBP	Moyobamba	PE	Moyobamba
MBQ	Mbarara	UG	Mbarara
MBR	Mbout	MR	Mbout
MBS	MBS International	US	Saginaw
MBT	Masbate	PH	Masbate
MBU	Mbambanakira	SB	Mbambanakira
MBV	Masa	PG	Masa
MBW	Moorabbin	AU	Mentone
MBX	Maribor International Airport	SI	Maribor
MBY	Moberly	US	Moberly
MBZ	Maues	BR	Maues
MCA	Macenta	GN	Macenta
MCB	Pike County	US	Mccomb
MCC	Mcclellan AFB	US	Sacramento, CA
MCD	Mackinac Island	US	Mackinac Island
MCE	Merced Municipal Arpt	US	Merced
MCF	Mac Dill AFB	US	Tampa
MCG	Mcgrath	US	Mcgrath
MCH	Machala	EC	Machala
MCI	Kansas City International Airport	US	Kansas City
MCJ	Maicao	CO	Maicao
MCK	Mccook	US	Mccook
MCL	Mt Mckinley	US	Mt Mckinley
MCM	Fontvieille Heliport	MC	Monte Carlo
MCN	Lewis B Wilson	US	Macon
MCO	Orlando International	US	Orlando
MCP	Internacional	BR	Macapa
MCQ	Miskolc	HU	Miskolc
MCR	Melchor De Menco	GT	Melchor De Menco
MCS	Monte Caseros	AR	Monte Caseros
MCT	Seeb	OM	Muscat
MCU	Gueret (Lepaud)	FR	Montlucon
MCV	Mcarthur River	AU	Mcarthur River
MCW	Mason City Municipal	US	Mason City, IA
MCX	Makhachkala	RU	Makhachkala
MCY	Maroochydore	AU	Sunshine Coast
MCZ	Palmares	BR	Maceio
MDA	Martindale Army Heliport	US	San Antonio, TX
MDB	Melinda	BZ	Melinda
MDC	Samratulangi	ID	Manado
MDD	Airpark	US	Midland
MDE	Jose Maria Cordova	CO	Medellin
MDF	Medford	US	Medford
MDG	Mudanjiang	CN	Mudanjiang
MDH	Southern Illinois	US	Carbondale
MDI	Makurdi	NG	Makurdi
MDJ	City-county	US	Madras
MDK	Mbandaka	ZR	Mbandaka
MDL	Mandalay International	MM	Mandalay
MDM	Munduku	PG	Munduku
MDN	Jefferson Proving Grd	US	Madison
MDO	Intermediate	US	Middleton Island
MDP	Mindiptana	ID	Mindiptana
MDQ	Mar Del Plata	AR	Mar Del Plata
MDR	Medfra	US	Medfra
MDS	Middle Caicos	TC	Middle Caicos
MDT	Harrisburg International	US	Harrisburg, PA
MDU	Mendi	PG	Mendi
MDV	Medouneu	GA	Medouneu
MDW	Midway	US	Chicago
MDX	Mercedes	AR	Mercedes
MDY	Sand Island Field	UM	Midway Island
MDZ	El Plumerillo	AR	Mendoza
MEA	Macae	BR	Macae
MEB	Essendon	AU	Melbourne
MEC	Manta	EC	Manta
MED	Mohammad Bin Abdulaziz	SA	Madinah
MEE	Mare	NC	Mare
MEF	Melfi	TD	Melfi
MEG	Malange	AO	Malange
MEH	Mehamn	NO	Mehamn
MEI	Key Field	US	Meridian
MEJ	Meadville	US	Meadville
MEK	Meknes	MA	Meknes
MEL	Tullamarine	AU	Melbourne
MEM	Memphis International	US	Memphis
MEN	Brenoux	FR	Mende
MEO	Dare County Regional	US	Manteo
MEP	Mersing	MY	Mersing
MEQ	Seunagan	ID	Meulaboh
MER	Castle AFB	US	Atwater, CA
MES	Polonia	ID	Medan
MET	Moreton	AU	Moreton
MEU	Monte Dourado	BR	Monte Dourado
MEV	Douglas County	US	Minden
MEW	Mweka	ZR	Mweka
MEX	Internacional Benito Juarez	MX	Mexico City
MEY	Meghauli	NP	Meghauli
MEZ	Messina	ZA	Messina
MFA	Mafia	TZ	Mafia
MFB	Monfort	CO	Monfort
MFC	Mafeteng	LS	Mafeteng
MFD	Lahm Municipal	US	Mansfield
MFE	Mc Allen Miller International	US	Mc Allen, TX
MFF	Moanda	GA	Moanda
MFG	Muzaffarabad	PK	Muzaffarabad
MFH	Mesquite	US	Mesquite
MFI	Municipal	US	Marshfield
MFJ	Moala	FJ	Moala
MFK	Matsu	TW	Matsu
MFL	Mount Full Stop	AU	Mount Full Stop
MFM	Macau International	MO	Macau
MFN	Milford Sound	NZ	Milford Sound
MFO	Manguna	EG	Manguna
MFP	Manners Creek	AU	Manners Creek
MFQ	Maradi	NE	Maradi
MFR	Rogue Valley International - Medford Airport	US	Medford
MFS	Miraflores	CO	Miraflores
MFT	Machu Picchu	PE	Machu Picchu
MFU	Mfuwe	ZM	Mfuwe
MFV	Accomack County	US	Melfa, VA
MFW	Magaruque	MZ	Magaruque
MFX	Meribel	FR	Meribel
MFZ	Mesalia	PG	Mesalia
MGA	Augusto C Sandino	NI	Managua
MGB	Mount Gambier	AU	Mount Gambier
MGC	Michigan City Arpt	US	Michigan City
MGD	Magdalena	BO	Magdalena
MGE	Dobbins Afb	US	Marietta
MGF	Regional De Maringa SBMG	BR	Maringa
MGG	Margarima	PG	Margarima
MGH	Margate	ZA	Margate
MGI	Aransas National Wildlife Refuge	US	Matagorda Island, TX
MGJ	Orange County	US	Montgomery
MGK	Mong Ton	MM	Mong Ton
MGL	Moenchen-gl. - Dus Exp	DE	Moenchengladbach
MGM	Dannelly Fld	US	Montgomery
MGN	Baracoa	CO	Magangue
MGO	Manega	GA	Manega
MGP	Manga	PG	Manga
MGQ	Mogadishu International Airport	SO	Mogadishu
MGR	Moultrie Municipal	US	Moultrie
MGS	Mangaia Island	CK	Mangaia Island
MGT	Milingimbi	AU	Milingimbi
MGU	Manaung	MM	Manaung
MGV	Margaret River	AU	Margaret River Station
MGW	Morgantown	US	Morgantown
MGX	Moabi	GA	Moabi
MGY	Dayton-Wright Brothers Airport	US	Dayton
MGZ	Myeik	MM	Myeik
MHA	Mahdia	GY	Mahdia
MHB	Mechanics Bay	NZ	Auckland
MHC	Macmahon Camp 4	AU	Macmahon Camp 4
MHD	Mashad	IR	Mashad
MHE	Municipal	US	Mitchell
MHF	Morichal	CO	Morichal
MHG	Mannheim Arpt	DE	Mannheim
MHH	International	BS	Marsh Harbour
MHI	Musha	DJ	Musha
MHJ	Misrak Gashamo	ET	Misrak Gashamo
MHK	Municipal	US	Manhattan
MHL	Memorial Municipal	US	Marshall
MHM	Intermediate	US	Minchumina
MHN	Mullen	US	Mullen
MHO	Mount House	AU	Mount House
MHP	Minsk International 1	BY	Minsk
MHQ	Mariehamn	FI	Mariehamn
MHR	Sacramento Mather Airport	US	Sacramento, CA
MHS	Rep	US	Mount Shasta
MHT	Manchester-boston Regional Airport	US	Manchester, NH
MHU	Mount Hotham	AU	Mount Hotham
MHV	Kern County	US	Mojave
MHW	Monteagudo	BO	Monteagudo
MHX	Manihiki Island	CK	Manihiki Island
MHY	Morehead	PG	Morehead
MHZ	Mildenhall Arpt	GB	Mildenhall
MIA	Miami International Airport	US	Miami
MIB	Minot AFB	US	Minot
MIC	Crystal	US	Minneapolis
MID	Rejon	MX	Merida
MIE	Delaware County	US	Muncie
MIF	Roy Hurd Memorial	US	Monahans
MIG	Mian Yang	CN	Mian Yang
MIH	Mitchell Plateau	AU	Mitchell Plateau
MII	Dr Gastao Vidigal	BR	Marilia
MIJ	Mili Island	MH	Mili Island
MIK	Mikkeli	FI	Mikkeli
MIM	Merimbula	AU	Merimbula
MIN	Minnipa	AU	Minnipa
MIO	Miami	US	Miami
MIP	Mitspeh Ramon	IL	Mitspeh Ramon
MIQ	Simón Bolívar International	VE	Maiquetía
MIR	Habib Bourguiba	TN	Monastir
MIS	Misima Island	PG	Misima Island
MIT	Kern County	US	Shafter
MIU	Maiduguri	NG	Maiduguri
MIV	Millville	US	Millville
MIW	Municipal	US	Marshalltown
MIX	Miriti	CO	Miriti
MIY	Mittiebah	AU	Mittiebah
MIZ	Mainoru	AU	Mainoru
MJA	Manja	MG	Manja
MJB	Mejit Island	MH	Mejit Island
MJC	Man	CI	Man
MJD	Mohenjodaro	PK	Mohenjodaro
MJE	Majkin	MH	Majkin
MJF	Kjaerstad	NO	Mosjoen
MJG	Mayajigua	CU	Mayajigua
MJH	Majma	SA	Majma
MJI	Mitiga	LY	Mitiga
MJJ	Moki	PG	Moki
MJK	Shark Bay	AU	Monkey Mia
MJL	Mouila	GA	Mouila
MJM	Mbuji Mayi	ZR	Mbuji Mayi
MJN	Amborovy	MG	Majunga
MJO	Mount Etjo Lodge	NA	Mount Etjo Lodge
MJP	Manjimup	AU	Manjimup
MJQ	Jackson	US	Jackson
MJR	Miramar	AR	Miramar
MJS	Maganja Da Costa	MZ	Maganja Da Costa
MJT	Mytilene International Airport	GR	Mytilene
MJU	Mamuju	ID	Mamuju
MJV	San Javier	ES	Murcia
MJW	Mahenye	ZW	Mahenye
MJX	Robert J. Miller	US	Toms River
MJY	Mangunjaya	ID	Mangunjaya
MJZ	Mirnyj	RU	Mirnyj
MKA	Marianske Lazne	CZ	Marianske Lazne
MKB	Mekambo	GA	Mekambo
MKC	Downtown	US	Kansas City
MKD	Chagni	ET	Chagni
MKE	General Mitchell International	US	Milwaukee
MKF	Mckenna AAF	US	Columbus
MKG	Muskegon	US	Muskegon
MKH	Mokhotlong	LS	Mokhotlong
MKJ	Makoua	CG	Makoua
MKK	Molokai	US	Hoolehua
MKL	Mc Kellar-Sipes Regional	US	Jackson
MKM	Mukah	MY	Mukah
MKN	Malekolon	PG	Malekolon
MKO	Davis Field	US	Muskogee
MKP	Makemo	PF	Makemo
MKQ	Mopah	ID	Merauke
MKR	Meekatharra	AU	Meekatharra
MKS	Mekane Selam	ET	Mekane Selam
MKT	Municipal	US	Mankato
MKU	Makokou	GA	Makokou
MKV	Mt Cavenagh	AU	Mt Cavenagh
MKW	Rendani	ID	Manokwari
MKX	Mukalla	YE	Mukalla
MKY	Mackay	AU	Mackay
MKZ	Batu Berendam	MY	Malacca
MLA	Malta International	MT	Gudja
MLB	Melbourne International Airport	US	Melbourne
MLC	Mc Alester	US	Mc Alester
MLD	Malad City	US	Malad City
MLE	Male International	MV	Male
MLF	Milford	US	Milford
MLG	Abdul Rahman Saleh	ID	Malang
MLI	Quad-City	US	Moline
MLJ	Baldwin County	US	Milledgeville
MLK	Malta	US	Malta
MLL	Marshall	US	Marshall
MLM	Francisco J. Múgica Internacional	MX	Morelia
MLN	Melilla	ES	Melilla
MLO	Milos	GR	Milos
MLP	Malabang	PH	Malabang
MLQ	Malalaua	PG	Malalaua
MLR	Millicent	AU	Millicent
MLS	Municipal	US	Miles City
MLT	Millinocket	US	Millinocket
MLU	Municipal	US	Monroe
MLV	Merluna	AU	Merluna
MLW	Sprigg Payne	LR	Monrovia
MLX	Malatya	TR	Malatya
MLY	Manley Hot Springs	US	Manley Hot Springs
MLZ	Cerro Largo	UY	Melo
MMB	Memanbetsu	JP	Memanbetsu
MMC	Ciudad Mante	MX	Ciudad Mante
MMD	Maridor	JP	Minami Daito
MME	Durham Tees Valley	GB	Teesside, Durham
MMF	Mamfe	CM	Mamfe
MMG	Mount Magnet	AU	Mount Magnet
MMH	Mammoth Lakes	US	Mammoth Lakes
MMI	McMinn County	US	Athens
MMJ	Matsumoto	JP	Matsumoto
MMK	Murmansk Airport Murmashi	RU	Murmansk
MML	Municipal-Ryan Field	US	Marshall
MMM	Middlemount	AU	Middlemount
MMN	Minute Man Airfield	US	Stow
MMO	Vila Do Maio	CV	Maio
MMP	Mompos	CO	Mompos
MMQ	Mbala	ZM	Mbala
MMR	Camp Maybry AHP	US	Austin
MMS	Selfs	US	Marks
MMT	Mc Entire ANG Base	US	Columbia
MMU	Municipal	US	Morristown
MMV	Mal	PG	Mal
MMW	Moma	MZ	Moma
MMX	Sturup	SE	Malmo
MMY	Hirara	JP	Miyako Jima
MMZ	Maimana	AF	Maimana
MNA	Melangguane	ID	Melangguane
MNB	Moanda	ZR	Moanda
MNC	Nacala	MZ	Nacala
MND	Medina	CO	Medina
MNE	Mungeranie	AU	Mungeranie
MNF	Mana Island Airstrip	FJ	Mana Island
MNG	Maningrida	AU	Maningrida
MNH	Minneriya	LK	Minneriya
MNI	Gerald's Airport	MS	Gerald's Park
MNJ	Mananjary	MG	Mananjary
MNK	Maiana	KI	Maiana
MNL	Ninoy Aquino Intl	PH	Manila
MNM	Menominee	US	Menominee
MNN	Municipal	US	Marion
MNO	Manono	CD	Manono
MNP	Maron	PG	Maron
MNQ	Monto	AU	Monto
MNR	Mongu	ZM	Mongu
MNS	Mansa	ZM	Mansa
MNT	Minto	US	Minto
MNU	Maulmyine	MM	Maulmyine
MNV	Mountain Valley	AU	Mountain Valley
MNW	Macdonald Downs	AU	Macdonald Downs
MNX	Manicore	BR	Manicore
MNY	Mono	SB	Mono
MNZ	Manassas Regional Airport/Harry P. Davis Field	US	Manassas, VA
MOA	Orestes Acosta	CU	Moa
MOB	Mobile Regional Airport	US	Alabama, AL
MOC	Montes Claros	BR	Montes Claros
MOD	Municipal	US	Modesto, CA
MOE	Momeik	MM	Momeik
MOF	Waioti	ID	Maumere
MOG	Mong Hsat	MM	Mong Hsat
MOH	Mohanbari	IN	Mohanbari
MOI	Mitiaro Island	CK	Mitiaro Island
MOJ	Moengo	SR	Moengo
MOK	Mankono	CI	Mankono
MOL	Aro	NO	Molde
MOM	Moudjeria	MR	Moudjeria
MON	Mount Cook Airport	NZ	Mount Cook
MOO	Moomba	AU	Moomba
MOP	Municipal	US	Mount Pleasant
MOQ	Morondava	MG	Morondava
MOR	Moore-Murrell	US	Morristown
MOS	Intermediate	US	Moses Point
MOT	International	US	Minot
MOU	Mountain Village	US	Mountain Village
MOV	Moranbah	AU	Moranbah
MOW	Moscow Metropolitan Area	RU	Moscow
MOX	Municipal	US	Morris
MOY	Monterrey	CO	Monterrey
MOZ	Temae	PF	Moorea
MPA	Mpacha	NA	Mpacha
MPB	SPB	US	Miami
MPC	Muko-Muko	ID	Muko-Muko
MPD	Mirpur Khas	PK	Mirpur Khas
MPE	Griswold	US	Madison
MPF	Mapoda	PG	Mapoda
MPG	Makini	PG	Makini
MPH	Malay	PH	Caticlan
MPI	Mamitupo	PA	Mamitupo
MPJ	Petit Jean Park	US	Morrilton
MPK	Mokpo	KR	Mokpo
MPL	Montpellier Méditerranée	FR	Montpellier
MPM	Maputo International	MZ	Maputo
MPN	Mount Pleasant	FK	Mount Pleasant
MPO	Mt Pocono	US	Mt Pocono
MPP	Mulatupo	PA	Mulatupo
MPQ	Maan	JO	Maan
MPR	Mcpherson	US	Mcpherson
MPS	Mount Pleasant	US	Mount Pleasant
MPT	Maliana	ID	Maliana
MPU	Mapua	PG	Mapua
MPV	Edward F Knapp State	US	Montpelier, VT
MPW	Mariupol	UA	Mariupol, MN
MPX	Miyanmin	PG	Miyanmin
MPY	Maripasoula	GF	Maripasoula
MPZ	Municipal	US	Mt Pleasant
MQA	Mandora	AU	Mandora
MQB	Municipal	US	Macomb
MQC	Miquelon Aprt	PM	Miquelon
MQD	Maquinchao	AR	Maquinchao
MQE	Marqua	AU	Marqua
MQF	Magnitogorsk	RU	Magnitogorsk
MQG	Midgard	NA	Midgard
MQH	Municipal	BR	Minacu
MQI	Quincy	US	Quincy
MQJ	Merkez	TR	Balikesir
MQK	San Matias	BO	San Matias
MQL	Mildura	AU	Mildura
MQM	Mardin	TR	Mardin
MQN	Mo I Rana	NO	Mo I Rana
MQO	Malam	PG	Malam
MQP	Kruger Mpumalanga	ZA	Nelspruit
MQQ	Moundou	TD	Moundou
MQR	Mosquera	CO	Mosquera
MQS	Mustique	VC	Mustique Island
MQT	Sawyer International	US	Marquette
MQU	Mariquita	CO	Mariquita
MQV	Mostaganem	DZ	Mostaganem
MQW	Telfair-Wheeler	US	Mc Rae
MQX	Makale	ET	Makale
MQY	Smyrna	US	Smyrna
MQZ	Margaret River	AU	Margaret River
MRA	Misurata	LY	Misurata
MRB	Eastern Wv Regional Airport/Shepherd Field	US	Martinsburg
MRC	Maury County	US	Columbia
MRD	A Carnevalli	VE	Merida
MRE	Mara Lodges	KE	Mara Lodges
MRF	Municipal	US	Marfa
MRG	Mareeba	AU	Mareeba
MRH	May River	PG	May River
MRI	Merrill Field	US	Anchorage
MRJ	Marcala	HN	Marcala
MRK	Marco Island	US	Marco Island
MRL	Miners Lake	AU	Miners Lake
MRM	Manare	PG	Manare
MRN	Lenoir	US	Morganton
MRO	Masterton/Hood Aerodrome	NZ	Masterton
MRP	Marla	AU	Marla
MRQ	Marinduque	PH	Marinduque
MRR	Macara	EC	Macara
MRS	Marseille Provence Airport	FR	Marseille
MRT	Moroak	AU	Moroak
MRU	Sir Seewoosagur Ramgoolam International	MU	Plaisance
MRV	Mineralnye Vodyj	RU	Mineralnye Vody
MRW	Maribo	DK	Maribo
MRX	Mahshahr	IR	Bandar Mahshahr
MRY	Monterey Peninsula	US	Monterey
MRZ	Moree	AU	Moree
MSA	Muskrat Dam	CA	Muskrat Dam
MSB	Marigot SPB	GP	St Martin
MSC	Falcon Field	US	Mesa
MSD	Mt Pleasant	US	Mt Pleasant
MSE	Kent International	GB	Manston
MSF	Mount Swan	AU	Mount Swan
MSG	Matsaile	LS	Matsaile
MSH	Masirah	OM	Masirah
MSI	Masalembo	ID	Masalembo
MSJ	Misawa	JP	Misawa
MSK	Mastic Point	BS	Mastic Point
MSL	Sheffield	US	Sheffield
MSM	Masi Manimba	ZR	Masi Manimba
MSN	Dane County Regional	US	Madison
MSO	Missoula International	US	Missoula
MSP	Minneapolis - St. Paul Intl	US	Minneapolis
MSQ	Minsk International 2	BY	Minsk
MSR	Mus	TR	Mus
MSS	Richards Field	US	Massena
MST	Maastricht/aachen	NL	Maastricht
MSU	Moshoeshoe Intl	LS	Maseru
MSV	Sullivan County Intl	US	Monticello
MSW	Massawa International	ER	Massawa
MSX	Mossendjo	CG	Mossendjo
MSY	Louis Armstrong New Orléans International Airport	US	New Orleans
MSZ	Namibe	AO	Namibe
MTA	Matamata	NZ	Matamata
MTB	Monte Libano	CO	Monte Libano
MTC	Selfridge ANGB	US	Mt Clemens
MTD	Mt Sandford	AU	Mt Sandford
MTE	Monte Alegre	BR	Monte Alegre
MTF	Mizan Teferi	ET	Mizan Teferi
MTG	Mato Grosso	BR	Mato Grosso
MTH	Marathon Flight Strip	US	Marathon
MTI	Mosteiros	CV	Mosteiros
MTJ	Montrose Regional Airport	US	Montrose
MTK	Makin Island	KI	Makin Island
MTL	Maitland	AU	Maitland
MTM	SPB	US	Metlakatla
MTN	Glenn L Martin	US	Baltimore
MTO	Coles County Memorial	US	Mattoon
MTP	Montauk Airport	US	Montauk
MTQ	Mitchell	AU	Mitchell
MTR	S. Jeronimo	CO	Monteria
MTS	Matsapha Intl	SZ	Manzini
MTT	Minatitlan	MX	Minatitlan
MTU	Montepuez	MZ	Montepuez
MTV	Mota Lava	VU	Mota Lava
MTW	Municipal	US	Manitowoc
MTX	Metro Field	US	Fairbanks
MTY	Gen Mariano Escobedo	MX	Monterrey
MTZ	Masada	IL	Masada
MUA	Munda	SB	Munda
MUB	Maun	BW	Maun
MUC	Franz Josef Strauss	DE	Munich
MUD	Mueda	MZ	Mueda
MUE	Kamuela	US	Kamuela
MUF	Muting	ID	Muting
MUG	Mulege	MX	Mulege
MUH	Mersa Matruh	EG	Mersa Matruh
MUI	Muir AAF	US	Fort Indiantown
MUJ	Mui	ET	Mui
MUK	Mauke Island	CK	Mauke Island
MUL	Spence	US	Moultrie
MUM	Mumias	KE	Mumias
MUN	Quiriquire	VE	Maturin
MUO	AFB	US	Mountain Home
MUP	Mulga Park	AU	Mulga Park
MUQ	Muccan	AU	Muccan
MUR	Marudi	MY	Marudi
MUS	Marcus Island	JP	Marcus Island
MUT	Muscatine	US	Muscatine
MUU	Mount Union	US	Mount Union
MUV	Mustin Alf	US	Philadelphia
MUW	Mascara	DZ	Mascara
MUX	Multan International	PK	Multan
MUY	Mouyondzi	CG	Mouyondzi
MUZ	Musoma	TZ	Musoma
MVA	Reykiahlid	IS	Myvatn
MVB	Franceville/Mvengue	GA	Franceville
MVC	Monroe - Walton County	US	Monroeville
MVD	Carrasco International	UY	Montevideo
MVE	Montevideo-Chippewa	US	Montevideo, MN
MVF	Dixsept Rosado	BR	Mossoro
MVG	Mevang	GA	Mevang
MVH	Macksville	AU	Macksville
MVI	Manetai	PG	Manetai
MVJ	Marlboro	JM	Mandeville
MVK	Mulka	AU	Mulka
MVL	Morrisville-Stowe	US	Stowe
MVM	Monument Valley	US	Kayenta, AZ
MVN	Mt Vernon-Outland	US	Mt Vernon
MVO	Mongo	TD	Mongo
MVP	Mitu	CO	Mitu
MVQ	Mogilev	BY	Mogilev
MVR	Salam	CM	Maroua
MVS	Aeroporto Max Feffer	BR	Mucuri
MVT	Mataiva	PF	Mataiva
MVU	Musgrave	AU	Musgrave
MVV	Megeve	FR	Megeve
MVW	Skagit Regional	US	Mount Vernon
MVX	Minvoul	GA	Minvoul
MVY	Martha's Vineyard	US	Vineyard Haven, MA
MVZ	Masvingo	ZW	Masvingo
MWA	Williamson County	US	Marion
MWB	Morawa	AU	Morawa
MWC	Lawrence J Timmerman	US	Milwaukee
MWD	Mianwali	PK	Mianwali
MWE	Merowe	SD	Merowe
MWF	Maewo	VU	Maewo
MWG	Marawaka	PG	Marawaka
MWH	Grant County	US	Moses Lake
MWI	Maramuni	PG	Maramuni
MWJ	Matthews Ridge	GY	Matthews Ridge
MWK	Matak	ID	Matak
MWL	Mineral Wells Arpt	US	Mineral Wells
MWM	Windom Municipal	US	Windom, MN
MWN	Mwadui	TZ	Mwadui
MWO	Hook Field	US	Middletown, Ohio
MWP	Mountain	NP	Mountain
MWQ	Magwe	MM	Magwe
MWR	Motswari Airfield	ZA	Motswari
MWS	Mount Wilson	US	Mount Wilson
MWT	Moolawatana	AU	Moolawatana
MWU	Mussau	PG	Mussau
MWV	Mundulkiri	KH	Mundulkiri
MWW	Mouscron	BE	Mouscron
MWY	Miranda Downs	AU	Miranda Downs
MWZ	Mwanza	TZ	Mwanza
MXA	Municipal	US	Manila
MXB	Masamba	ID	Masamba
MXC	San Juan County	US	Monticello
MXD	Marion Downs	AU	Marion Downs
MXE	Maxton	US	Maxton
MXF	Maxwell AFB	US	Montgomery
MXG	Marlborough	US	Marlborough
MXH	Moro	PG	Moro
MXI	Imelda Romualdez Marcos	PH	Mati
MXJ	Minna	NG	Minna
MXK	Mindik	PG	Mindik
MXL	Mexicali	MX	Mexicali
MXM	Morombe	MG	Morombe
MXN	Morlaix	FR	Morlaix
MXO	Municipal	US	Monticello
MXP	Malpensa	IT	Milan
MXQ	Mitchell River	AU	Mitchell River
MXR	Mirgorod	UA	Mirgorod
MXS	Maota Savaii Is	WS	Maota Savaii Is
MXT	Maintirano	MG	Maintirano
MXU	Mullewa	AU	Mullewa
MXV	Moron	MN	Moron
MXW	Mandalgobi	MN	Mandalgobi
MXX	Mora	SE	Mora
MXY	Mccarthy	US	Mccarthy
MXZ	Meixian	CN	Meixian
MYA	Moruya	AU	Moruya
MYB	Mayoumba	GA	Mayoumba
MYC	Maracay	VE	Maracay
MYD	Malindi	KE	Malindi
MYE	Miyake Jima	JP	Miyake Jima
MYF	Montgomery Field	US	San Diego
MYG	Mayaguana	BS	Mayaguana
MYH	Marble Canyon	US	Marble Canyon
MYI	Murray Island	AU	Murray Island
MYJ	Matsuyama	JP	Matsuyama
MYK	May Creek	US	May Creek
MYL	Mccall	US	Mccall
MYM	Monkey Mountain	GY	Monkey Mountain
MYN	Mareb	YE	Mareb
MYO	Myroodah	AU	Myroodah
MYP	Mary	TM	Mary
MYQ	Mysore	IN	Mysore
MYR	Myrtle Beach Afb	US	Myrtle Beach
MYS	Moyale	ET	Moyale
MYT	Myitkyina	MM	Myitkyina
MYU	Ellis Field	US	Mekoryuk
MYV	Yuba County	US	Marysville
MYW	Mtwara	TZ	Mtwara
MYX	Menyamya	PG	Menyamya
MYY	Miri	MY	Miri
MYZ	Monkey Bay	MW	Monkey Bay
MZA	Muzaffarnagar	IN	Muzaffarnagar
MZB	Mocimboa Praia	MZ	Mocimboa Praia
MZC	Mitzic	GA	Mitzic
MZD	Mendez	EC	Mendez
MZE	Manatee	BZ	Manatee
MZF	Mzamba(Wild Coast Sun)	ZA	Mzamba(Wild Coast Sun)
MZG	Makung	TW	Makung
MZH	Merzifon	TR	Merzifon
MZI	Mopti	ML	Mopti
MZJ	Marana	US	Marana
MZK	Marakei	KI	Marakei
MZL	Santaguida	CO	Manizales
MZM	Frescaty	FR	Metz
MZN	Minj	PG	Minj
MZO	Sierra Maestra	CU	Manzanillo
MZP	Motueka	NZ	Motueka
MZQ	Mkuze	ZA	Mkuze
MZR	Mazar-i-sharif	AF	Mazar-i-sharif
MZS	Mostyn	MY	Mostyn
MZT	Gen Rafael Buelna	MX	Mazatlan
MZU	Muzaffarpur	IN	Muzaffarpur
MZV	Mulu, Sarawak	MY	Mulu, Sarawak
MZW	Mechria	DZ	Mechria
MZX	Mena	ET	Mena
MZY	Mossel Bay	ZA	Mossel Bay
MZZ	Marion	US	Marion
NAA	Narrabri	AU	Narrabri
NAB	Albany NAS	US	Albany
NAC	Naracoorte	AU	Naracoorte
NAD	Macanal	CO	Macanal
NAE	Natitingou	BJ	Natitingou
NAF	Banaina	ID	Banaina
NAG	Sonegaon	IN	Nagpur
NAH	Naha	ID	Naha
NAI	Annai	GY	Annai
NAJ	Nakhichevan	AZ	Nakhichevan
NAK	Nakhon Ratchasima	TH	Nakhon Ratchasima
NAL	Nalchik	RU	Nalchik
NAM	Namlea	ID	Namlea
NAN	Nadi International	FJ	Nadi
NAO	Nanchong	CN	Nanchong
NAP	Capodichino	IT	Napoli
NAQ	Qaanaaq	GL	Qaanaaq
NAR	Nare	CO	Nare
NAS	Nassau International	BS	Nassau
NAT	Augusto Severo	BR	Natal
NAU	Napuka Island	PF	Napuka Island
NAV	Nevsehir	TR	Nevsehir
NAW	Narathiwat	TH	Narathiwat
NAX	Barbers Point	US	Barbers Point
NAY	Nanyuan Airport	CN	Beijing
NAZ	Nana	SB	Star Habour
NBA	Nambaiyufa	PG	Nambaiyufa
NBB	Barrancominas	CO	Barrancominas
NBC	Naberevnye Chelny	RU	Naberevnye Chelny
NBG	NAS/Alvin Callendar	US	New Orleans
NBH	Nambucca Heads	AU	Nambucca Heads
NBL	San Blas	PA	San Blas
NBO	Jomo Kenyatta International	KE	Nairobi
NBP	Battery Pk City/N. Cov	US	New York
NBR	Nambour	AU	Nambour
NBU	NAS	US	Glenview
NBV	Cana Brava	BR	Cana Brava
NBW	Guantanamo NAS	CU	Guantanamo
NBX	Nabire	ID	Nabire
NCA	North Caicos	TC	North Caicos
NCE	Cote D'azur International Airport	FR	Nice
NCG	Nueva Casas Grandes	MX	Paloma Grande
NCH	Nachingwea	TZ	Nachingwea
NCI	Necocli	CO	Necocli
NCL	Newcastle Airport	GB	Newcastle
NCN	New Chenega	US	New Chenega
NCO	NAS	US	Quonset Point
NCP	Cubi Pt NAS	PH	Luzon Is
NCQ	Atlanta Nas	US	Marietta, GA
NCR	San Carlos	NI	San Carlos
NCS	Newcastle	ZA	Newcastle
NCT	Guanacaste	CR	Nicoya
NCU	Nukus	UZ	Nukus
NCY	Annecy-Meythe	FR	Annecy
NDA	Bandanaira	ID	Bandanaira
NDB	Nouadhibou	MR	Nouadhibou
NDC	Nanded	IN	Nanded
NDD	Sumbe	AO	Sumbe
NDE	Mandera	KE	Mandera
NDF	Ndalatandos	AO	Ndalatandos
NDG	Qiqihar	CN	Qiqihar
NDI	Namudi	PG	Namudi
NDJ	Ndjamena	TD	Ndjamena
NDK	Namdrik Island	MH	Namdrik Island
NDL	Ndele	CF	Ndele
NDM	Mendi	ET	Mendi
NDN	Nadunumu	PG	Nadunumu
NDO	La Palma Del Condado	ES	La Palma Del Condado
NDP	Ellyson NAS	US	Pensacola, FL
NDR	Nador	MA	Nador
NDS	Sandstone	AU	Sandstone
NDU	Rundu	NA	Rundu
NDV	USN Heliport	US	Anacostia, DC
NDY	Sanday	GB	Sanday
NDZ	Cuxhaven	DE	Nordholz-Spieka
NEA	Brunswick Golden Isles	US	Glynco
NEC	Necochea	AR	Necochea
NEF	Neftekamsk	RU	Neftekamsk
NEG	Negril	JM	Negril
NEJ	Nejjo	ET	Nejjo
NEK	Nekemt	ET	Nekemt
NEL	Naec	US	Lakehurst
NEN	Olf Usn	US	Whitehouse
NER	Neryungri	RU	Neryungri
NES	East 34th St Landing	US	New York
NET	New Bight	BS	New Bight
NEU	Sam Neua	LA	Sam Neua
NEV	Vance Winkworth Amory International	KN	Nevis
NEW	Lakefront	US	New Orleans
NFB	Detroit NAF	US	Mt Clemens
NFG	Nefteyugansk	RU	Nefteyugansk
NFL	NAS	US	Fallon
NFR	Nafoora	LY	Nafoora
NGA	Young	AU	Young
NGB	Lishe International Airport	CN	Ningbo
NGC	North Rim	US	Grand Canyon
NGD	Anegada	VG	Anegada
NGE	Ngaoundere	CM	Ngaoundere
NGI	Ngau Island	FJ	Ngau Island
NGL	Ngala Airfield	ZA	Ngala
NGM	Agana NAS	GU	Agana
NGN	Nargana	PA	Nargana
NGO	Chu-Bu Centrair International (Central Japan International)	JP	Tokoname
NGP	NAS	US	Corpus Christi
NGR	Ningerum	PG	Ningerum
NGS	Nagasaki	JP	Nagasaki
NGU	Nas Chambers	US	Norfolk
NGV	Ngiva	AO	Ngiva
NGW	Cabaniss Field	US	Corpus Christi
NGX	Manang	NP	Manang
NGZ	NAS	US	Alameda
NHA	Nha Trang	VN	Nha Trang
NHD	Minhad AB	AE	Minhad AB
NHF	New Halfa	SD	New Halfa
NHK	Patuxent River NAS	US	Patuxent River, MD
NHS	Nushki	PK	Nushki
NHT	Northolt	GB	Northolt
NHV	Nuku Hiva	PF	Nuku Hiva
NHX	Barin Olf Osn	US	Foley
NHZ	NAS	US	Brunswick
NIA	Nimba	LR	Nimba
NIB	Nikolai	US	Nikolai
NIC	Nicosia International	CY	Nicosia
NIE	Niblack	US	Niblack
NIF	Nifty	AU	Nifty
NIG	Nikunau	KI	Nikunau
NIK	Niokolo Koba	SN	Niokolo Koba
NIM	Niamey	NE	Niamey
NIN	Ninilchik	US	Ninilchik
NIO	Nioki	ZR	Nioki
NIP	Jacksonville NAS	US	Jacksonville, FL
NIR	Chase Field NAS	US	Beeville
NIS	Simberi	PG	Simberi Island
NIT	Niort	FR	Niort
NIX	Nioro	ML	Nioro
NJA	Atsugi NAS	JP	Atsugi
NJC	Nizhnevartovsk	RU	Nizhnevartovsk
NJK	El Centro NAF	US	El Centro, CA
NKA	Nkan	GA	Nkan
NKB	Noonkanbah	AU	Noonkanbah
NKC	Nouakchott	MR	Nouakchott
NKD	Sinak	ID	Sinak
NKG	Lukou International Airport	CN	Nanking/nanjing
NKI	Naukiti	US	Naukiti
NKL	Nkolo	ZR	Nkolo
NKM	Komaki AFB	JP	Nagoya
NKN	Nankina	PG	Nankina
NKO	Ankokoambo	MG	Ankokoambo
NKS	Nkongsamba	CM	Nkongsamba
NKU	Nkaus	LS	Nkaus
NKV	Nichen Cove	US	Nichen Cove, AK
NKX	Miramar MCAS	US	San Diego
NKY	Nkayi	CG	Nkayi
NLA	Ndola	ZM	Ndola
NLC	Lemoore NAS (Reeves Field)	US	Lemoore, CA
NLD	Intl Quetzalcoatl	MX	Nuevo Laredo
NLE	Jerry Tyler Memorial	US	Niles
NLF	Darnley Island	AU	Darnley Island
NLG	Nelson Lagoon	US	Nelson Lagoon
NLK	Norfolk Island	NF	Norfolk Island
NLL	Nullagine	AU	Nullagine
NLP	Nelspruit International	ZA	Nelspruit
NLS	Nicholson	AU	Nicholson
NLU	Santa Lucia	MX	Santa Lucia
NLV	Nikolaev	UA	Nikolaev
NMA	Namangan	UZ	Namangan
NMB	Daman	IN	Daman
NME	Nightmute	US	Nightmute
NMG	San Miguel	PA	San Miguel
NMN	Nomane	PG	Nomane
NMP	New Moon	AU	New Moon
NMR	Nappa Merry	AU	Nappa Merry
NMS	Namsang	MM	Namsang
NMT	Namtu	MM	Namtu
NMU	Namu	MH	Namu
NNA	NAF	MA	Kenitra
NNB	Santa Ana	SB	Santa Ana
NND	Nangade	MZ	Nangade
NNG	Nanning	CN	Nanning
NNI	Namutoni	NA	Namutoni
NNK	Naknek	US	Naknek
NNL	Nondalton	US	Nondalton
NNM	Naryan-Mar	RU	Naryan-Mar
NNR	Connemara	IE	Spiddal
NNT	Nan	TH	Nan
NNU	Nanuque	BR	Nanuque
NNX	Nunukan	ID	Nunukan
NNY	Nanyang	CN	Nanyang
NOA	Nowra	AU	Nowra
NOB	Nosara Beach	CR	Nosara Beach
NOC	Ireland West Airport Knock	IE	Knock
NOD	Norden	DE	Norden
NOE	Norddeich	DE	Norddeich
NOG	Nogales	MX	Nogales
NOH	Chicago NAS	US	Chicago
NOI	Novorossijsk	RU	Novorossijsk
NOJ	Nojabrxsk	RU	Nojabrxsk
NOK	Nova Xavantina	BR	Nova Xavantina
NOL	Nakolik River	US	Nakolik River
NOM	Nomad River	PG	Nomad River
NON	Nonouti	KI	Rotima
NOO	Naoro	PG	Naoro
NOR	Nordfjordur	IS	Nordfjordur
NOS	Fascene	MG	Nossi-Be
NOT	Novato	US	Novato
NOU	Tontouta	NC	Noumea
NOV	Huambo	AO	Huambo
NOZ	Novokuznetsk	RU	Novokuznetsk
NPA	Pensacola NAS	US	Pensacola
NPE	Hawkes Bay	NZ	Napier/Hastings
NPG	Nipa	PG	Nipa
NPH	Nephi	US	Nephi
NPL	New Plymouth	NZ	New Plymouth
NPO	Nangapinoh	ID	Nangapinoh
NPP	Napperby	AU	Napperby
NPT	State	US	Newport
NPU	San Pedro Uraba	CO	San Pedro Uraba
NQA	Millington Regional Jetport	US	Millington, TN
NQI	NAS	US	Kingsville
NQL	Niquelandia	BR	Niquelandia
NQN	Neuquen	AR	Neuquen
NQT	Nottingham Airport	GB	Nottingham
NQU	Nuqui	CO	Nuqui
NQX	NAS	US	Key West
NQY	Newquay Cornwall Airport	GB	Newquay
NRA	Narrandera	AU	Narrandera
NRB	Ns	US	Mayport
NRC	Aux Field	US	Crows Landing
NRD	Norderney	DE	Norderney
NRE	Namrole	ID	Namrole
NRG	Narrogin	AU	Narrogin
NRI	Shangri-la	US	Shangri-la
NRK	Kungsangen	SE	Norrkoping
NRL	North Ronaldsay	GB	North Ronaldsay
NRM	Nara	ML	Nara
NRN	Weeze	DE	Dusseldorf
NRR	Roosevelt NAS	PR	Roosevelt Roads
NRS	NAS	US	Imperial Beach
NRT	New Tokyo International Airport	JP	Tokyo
NRV	USCG Shore Station	GU	Guam
NRY	Newry	AU	Newry
NSA	Noosa	AU	Noosa
NSB	North SPB	BS	Bimini
NSE	Whiting Field NAS	US	Milton
NSF	Andrews NAF	US	Camp Springs
NSH	Now Shahr	IR	Now Shahr
NSI	Nsimalen International	CM	Yaounde
NSM	Norseman	AU	Norseman
NSN	Nelson	NZ	Nelson
NSO	Scone	AU	Scone
NSP	NAF	PH	Sangley Point
NST	Nakhon Si Thammarat	TH	Nakhon Si Thammarat
NSV	Noosaville	AU	Noosaville
NSX	Hovercraft/Launch Pt	VG	N. Sound/Virgin Gorda
NSY	Sigonella NAF	IT	Tokat
NTA	Natadola	FJ	Natadola
NTB	Notodden	NO	Notodden
NTC	Santa Carolina	MZ	Santa Carolina
NTD	Point Mugu NAS (Naval Base Ventura County	US	Port Hueneme, CA
NTE	Nantes Atlantique	FR	Nantes
NTG	Nantong	CN	Nantong
NTI	Bintuni	ID	Bintuni
NTJ	Manti-Ephraim	US	Manti
NTL	Williamtown	AU	Newcastle
NTM	Miracema Do Norte	BR	Miracema Do Norte
NTN	Normanton	AU	Normanton
NTO	Santo Antao	CV	Santo Antao
NTQ	Noto Airport	JP	Wajima
NTR	Aeropuerto del Norte International Airport	MX	Monterrey, Nuevo León
NTT	Kuini Lavenia	TO	Niuatoputapu
NTU	NAS	US	Oceana
NTX	Natuna Ranai	ID	Natuna Ranai
NTY	Pilanesberg	ZA	Sun City
NUB	Numbulwar	AU	Numbulwar
NUD	En Nahud	SD	En Nahud
NUE	Nürnberg	DE	Nürnberg
NUF	Castlereigh Reservoir	LK	Hatton
NUG	Nuguria	PG	Nuguria
NUH	Nunchia	CO	Nunchia
NUI	Nuiqsut	US	Nuiqsut
NUJ	Nojeh	IR	Nojeh
NUK	Nukutavake	PF	Nukutavake
NUL	Nulato	US	Nulato
NUN	Saufley NAS	US	Pensacola
NUP	Nunapitchuk	US	Nunapitchuk
NUQ	Moffett Field	US	Mountain View
NUR	Nullarbor	AU	Nullarbor
NUS	Norsup	VU	Norsup
NUT	Nutuve	PG	Nutuve
NUU	Nakuru	KE	Nakuru
NUW	Whidbey Island NAS (Ault Field)	US	Oak Harbor
NUX	Novy Urengoy	RU	Novy Urengoy
NVA	La Marguita	CO	Neiva
NVD	Nevada	US	Nevada
NVG	Nueva Guinea	NI	Nueva Guinea
NVI	Navoi	UZ	Navoi
NVK	Framnes	NO	Narvik
NVP	Novo Aripuana	BR	Aripuana
NVR	Yerievo (Novgorod Southwest)	RU	Velikiy Novgorod
NVS	Nevers	FR	Nevers
NVT	Navegantes	BR	Navegantes
NVY	Neyveli	IN	Neyveli
NWA	Moheli	KM	Moheli
NWH	Parlin Field	US	Newport
NWI	Norwich International Airport	GB	Norwich
NWP	NS	CA	Argentia
NWS	Pier 11/Wall St. SPB	US	New York
NWT	Nowata	PG	Nowata
NWU	NAS	BM	Bermuda
NXX	Willow Grove NAS	US	Willow Grove
NYE	Nyeri	KE	Nyeri
NYG	Quantico Nas	US	Quantico
NYI	Sunyani	GH	Sunyani
NYK	Nanyuki	KE	Nanyuki
NYM	Nadym	RU	Nadym
NYN	Nyngan	AU	Nyngan
NYO	Skavsta	SE	Stockholm
NYU	Nyaung-u	MM	Nyaung-u
NZA	Nzagi	AO	Nzagi
NZE	Nzerekore	GN	Nzerekore
NZH	Manzhouli	CN	Manzhouli
NZO	Nzoia	KE	Nzoia
NZW	South Weymouth	US	South Weymouth
NZY	North Island Nas	US	San Diego
OAG	Springhill	AU	Orange
OAJ	Albert J Ellis	US	Jacksonville
OAK	Oakland International Airport	US	Oakland
OAL	Cacoal	BR	Cacoal
OAM	Oamaru	NZ	Oamaru
OAN	Olanchito	HN	Olanchito
OAR	Marina Municipal	US	Marina, CA
OAX	Xoxocotlan	MX	Oaxaca
OBA	Oban	AU	Oban
OBC	Obock	DJ	Obock
OBD	Obano	ID	Obano
OBE	County	US	Okeechobee
OBF	Oberpfaffenhofen	DE	Oberpfaffenhofen
OBI	Obidos	BR	Obidos
OBL	Zoersel	BE	Zoersel
OBM	Morobe	PG	Morobe
OBN	Oban Airport	GB	Oban
OBO	Obihiro	JP	Obihiro
OBS	Vals-Lanas	FR	Aubenas
OBT	Oakland/Coliseum Stat	US	Oakland, MD
OBU	Kobuk/Wien	US	Kobuk
OBX	Obo	PG	Obo
OBY	Ittoqqortoormiit	GL	Ittoqqortoormiit
OCA	Ocean Reef	US	Ocean Reef
OCC	Coca	EC	Coca
OCE	Municipal	US	Ocean City
OCF	Taylor Field	US	Ocala
OCH	A L Mangham Jr. Regional	US	Nacogdoches, TX
OCI	Oceanic	US	Oceanic
OCJ	Boscobel	JM	Ocho Rios
OCN	Municipal	US	Oceanside
OCV	Aguasclaras	CO	Ocana
OCW	Warren Field	US	Washington
ODA	Ouadda	CF	Ouadda
ODB	Cordoba	ES	Cordoba
ODD	Oodnadatta	AU	Oodnadatta
ODE	Beldringe	DK	Odense
ODH	RAF Station	GB	Odiham
ODJ	Ouanda Djalle	CF	Ouanda Djalle
ODL	Cordillo Downs	AU	Cordillo Downs
ODN	Long Seridan	MY	Long Seridan
ODR	Ord River	AU	Ord River
ODS	Odessa International	UA	Odessa
ODW	Oak Harbor	US	Oak Harbor
ODY	Oudomxai	LA	Oudomxay
OEA	Oneal	US	Vincennes
OEC	Ocussi	ID	Ocussi
OEL	Orel	RU	Orel
OEM	Vincent Fayks	SR	Paloemeu
OEO	Municipal	US	Osceola
OER	Ornskoldsvik	SE	Ornskoldsvik
OES	San Antonio Oeste	AR	San Antonio Oeste
OFI	Ouango Fitini	CI	Ouango Fitini
OFJ	Olafsfjordur	IS	Olafsfjordur
OFK	Stefan Field	US	Norfolk
OFU	Ofu Island Airstrip	AS	Vaoto, Ofu Island
OGA	Searle Field	US	Ogallala
OGB	Municipal	US	Orangeburg
OGD	Municipal	US	Ogden
OGE	Ogeranang	PG	Ogeranang
OGG	Kahului	US	Maui, HI
OGL	Ogle	GY	Ogle
OGN	Yonaguni Jima	JP	Yonaguni Jima
OGO	Abengourou	CI	Abengourou
OGR	Bongor	TD	Bongor
OGS	Ogdensburg	US	Ogdensburg
OGV	Ongava Game Reserve	NA	Ongava Game Reserve
OGX	Ain Beida	DZ	Ouargla
OGZ	Vladikavkaz	RU	Vladikavkaz
OHA	Royal Air Force Base	NZ	Ohakea
OHC	AFS	US	Northeast Cape
OHD	Ohrid	MK	Ohrid
OHI	Oshakati	NA	Oshakati
OHO	Okhotsk	RU	Okhotsk
OHP	Heliport	GB	Oban
OHR	Wyk Auf Foehr	DE	Wyk Auf Foehr
OHT	Kohat	PK	Kohat
OIA	Ourilandia	BR	Ourilandia
OIC	Eaton	US	Norwich
OIL	Splane Memorial	US	Oil City, PA
OIM	Oshima	JP	Oshima
OIR	Okushiri	JP	Okushiri
OIT	Oita	JP	Oita
OJC	Johnson County Executive	US	Olathe, KS
OKA	Naha	JP	Okinawa
OKB	Fraser Island	AU	Orchid Beach
OKC	Will Rogers World Airport	US	Oklahoma City
OKD	Okadama	JP	Sapporo
OKE	Okino Erabu	JP	Okino Erabu
OKF	Okaukuejo	NA	Okaukuejo
OKG	Okoyo	CG	Okoyo
OKH	Cottesmor RAF	GB	Oakham
OKI	Oki Island	JP	Oki Island
OKJ	Okayama	JP	Okayama
OKK	Kokomo	US	Kokomo
OKL	Oksibil	ID	Oksibil
OKM	Okmulgee	US	Okmulgee
OKN	Okondja	GA	Okondja
OKO	Yokota Afb	JP	Tokyo
OKP	Oksapmin	PG	Oksapmin
OKQ	Okaba	ID	Okaba
OKR	Yorke Island	AU	Yorke Island
OKS	Oshkosh	US	Oshkosh
OKT	Oktiabrskij	RU	Oktiabrskij
OKU	Mokuti Lodge	NA	Mokuti Lodge
OKV	Okao	PG	Okao
OKY	Oakey	AU	Oakey
OLA	Orland	NO	Orland
OLB	Costa Smeralda	IT	Olbia
OLD	Old Town	US	Old Town
OLE	Municipal	US	Olean
OLF	International	US	Wolf Point
OLH	Old Harbor SPB	US	Old Harbor
OLI	Rif	IS	Olafsvik
OLJ	Olpoi	VU	Olpoi
OLK	Fuerte Olimpo	PY	Fuerte Olimpo
OLM	Olympia	US	Olympia
OLN	Colonia Sarmiento	AR	Colonia Sarmiento
OLO	Olomouc	CZ	Olomouc
OLP	Olympic Dam	AU	Olympic Dam
OLQ	Olsobip	PG	Olsobip
OLS	International	US	Nogales
OLU	Columbus Municipal	US	Columbus, NE
OLV	Olive Branch Arpt	US	Olive Branch
OLY	Olney-Noble	US	Olney
OMA	Eppley Airfield	US	Omaha
OMB	Omboue	GA	Omboue
OMC	Ormoc	PH	Ormoc
OMD	Oranjemund	NA	Oranjemund
OME	Nome	US	Nome
OMF	King Hussein	JO	Mafraq
OMG	Omega	NA	Omega
OMH	Urmieh	IR	Urmieh
OMI	Omidieh	IR	Omidieh
OMJ	Omura	JP	Omura
OMK	Municipal	US	Omak
OML	Omkalai	PG	Omkalai
OMM	Marmul	OM	Marmul
OMN	Osmanabad	IN	Osmanabad
OMO	Mostar	BA	Mostar
OMR	Oradea	RO	Oradea
OMS	Omsk	RU	Omsk
OMY	Oddor Meanche	KH	Oddor Meanche
ONA	Municipal	US	Winona
ONB	Ononge	PG	Ononge
OND	Ondangwa	NA	Ondangwa
ONE	Onepusu	SB	Onepusu
ONG	Mornington	AU	Mornington
ONH	Municipal	US	Oneonta
ONI	Moanamani	ID	Moanamani
ONJ	Odate Noshiro	JP	Odate Noshiro
ONL	Municipal	US	Oneill
ONM	Socorro	US	Socorro
ONN	Onion Bay	US	Onion Bay
ONO	Ontario Municipal Airport	US	Ontario, OR
ONP	Newport	US	Newport
ONQ	Zonguldak	TR	Zonguldak
ONR	Monkira	AU	Monkira
ONS	Onslow	AU	Onslow
ONT	Ontario International	US	Ontario
ONU	Ono I Lau	FJ	Ono I Lau
ONX	Enrique Adolfo Jimenez	PA	Colon
ONY	Olney	US	Olney
OOA	Municipal	US	Oskaloosa
OOK	Toksook Bay	US	Toksook Bay
OOL	Gold Coast (coolangatta)	AU	Gold Coast
OOM	Cooma	AU	Cooma
OOR	Mooraberree	AU	Mooraberree
OOT	Onotoa	KI	Onotoa
OPA	Kopasker	IS	Kopasker
OPB	Open Bay	PG	Open Bay
OPF	Opa Locka	US	Miami
OPI	Oenpelli	AU	Oenpelli
OPL	St Landry Parish	US	Opelousas
OPO	Francisco Sá Carneiro	PT	Porto
OPS	Sinop	BR	Sinop
OPU	Balimo	PG	Balimo
OPW	Opuwa	NA	Opuwa
ORA	Oran	AR	Oran
ORB	Orebro-bofors	SE	Orebro
ORC	Orocue	CO	Orocue
ORD	Chicago O'hare International	US	Chicago, Il
ORE	Orleans	FR	Orleans
ORF	Norfolk International Airport	US	Norfolk
ORG	Zorg En Hoop	SR	Paramaribo
ORH	Worcester Regional Airport	US	Worcester
ORI	Port Lions SPB	US	Port Lions
ORJ	Orinduik	GY	Orinduik
ORK	Cork	IE	Cork
ORL	Orlando Executive	US	Orlando
ORM	Northampton	GB	Northampton
ORN	Es Senia	DZ	Oran
ORO	Yoro	HN	Yoro
ORP	Orapa	BW	Orapa
ORQ	Heliport	US	Norwalk
ORR	Yorketown	AU	Yorketown
ORS	Waterport	AU	Orpheus Island Resort
ORT	Northway	US	Northway
ORU	Oruro	BO	Oruro
ORV	Curtis Memorial	US	Noorvik
ORW	Ormara	PK	Ormara
ORX	Oriximina	BR	Oriximina
ORY	Orly	FR	Paris
ORZ	Orange Walk	BZ	Orange Walk
OSB	Osage Beach	US	Osage Beach
OSC	Wurtsmith AFB	US	Oscoda
OSD	Åre Östersund Airport	SE	Ostersund
OSE	Omora	PG	Omora
OSG	Ossima	PG	Ossima
OSH	Wittman Field	US	Oshkosh
OSI	Osijek	HR	Osijek
OSK	Oskarshamn	SE	Oskarshamn
OSL	Oslo (Gardermoen)	NO	Oslo
OSM	Mosul	IQ	Mosul
OSN	Osan AB	KR	Osan
OSO	Sulaimaniyah International	IQ	Sulaimaniyah
OSP	Redzikowo	PL	Slupsk
OSR	Mosnov	CZ	Ostrava
OSS	Osh International Airport	KG	Osh
OST	Ostend/Bruges International Airport	BE	Ostend
OSU	Ohio State University	US	Columbus
OSW	Orsk	RU	Orsk
OSX	Attala County	US	Kosciusko
OSY	Namsos	NO	Namsos
OSZ	Koszalin	PL	Koszalin
OTA	Mota	ET	Mota
OTC	Bol	TD	Bol
OTD	Contadora	PA	Contadora
OTG	Worthington	US	Worthington
OTH	North Bend	US	North Bend
OTI	Morotai Island	ID	Pitu, Morotai Island
OTJ	Otjiwarongo	NA	Otjiwarongo
OTL	Boutilimit	MR	Boutilimit
OTM	Industrial	US	Ottumwa
OTN	Green	US	Oaktown
OTO	Vor	US	Otto
OTP	Otopeni	RO	Bucharest
OTR	Coto 47	CR	Coto 47
OTS	Anacortes	US	Anacortes
OTU	Otu	CO	Otu
OTV	Ontong Java	SB	Ontong Java
OTY	Oria	PG	Oria
OTZ	Kotzebue	US	Kotzebue
OUA	Ouagadougou	BF	Ouagadougou
OUD	Les Angades	MA	Oujda
OUE	Ouesso	CG	Ouesso
OUG	Ouahigouya	BF	Ouahigouya
OUH	Oudtshoorn	ZA	Oudtshoorn
OUI	Ban Houei	LA	Ban Houei
OUK	Outer Skerries	GB	Outer Skerries
OUL	Oulu	FI	Oulu
OUM	Oum Hadjer	TD	Oum Hadjer
OUN	Max Westheimer	US	Norman
OUR	Batouri	CM	Batouri
OUS	Ourinhos	BR	Ourinhos
OUT	Bousso	TD	Bousso
OUU	Ouanga	GA	Ouanga
OUZ	Zouerate	MR	Zouerate
OVA	Bekily	MG	Bekily
OVB	Tolmachevo	RU	Novosibirsk
OVD	Asturias	ES	Oviedo/Aviles
OVE	Oroville	US	Oroville
OVG	Overberg (FAOB)	ZA	Overberg
OVL	Ovalle	CL	Ovalle
OVR	Olavarria	AR	Olavarria
OWA	Owatonna	US	Owatonna
OWB	Daviess County	US	Owensboro
OWD	Memorial	US	Norwood
OWE	Owendo	GA	Owendo
OWK	Central Maine Airport of Norridgewock	US	Norridgewock
OXB	Osvaldo Vieira International	GW	Bissau
OXC	Waterbury-oxford	US	Oxford, CT
OXD	Miami University	US	Oxford
OXF	Oxford (Kidlington)	GB	Oxford
OXO	Orientos	AU	Orientos
OXR	Ventura	US	Ventura
OXY	Morney	AU	Morney
OYA	Goya	AR	Goya
OYE	Oyem	GA	Oyem
OYG	Moyo	UG	Moyo
OYK	Oiapoque	BR	Oiapoque
OYL	Moyale	KE	Moyale
OYN	Ouyen	AU	Ouyen
OYO	Tres Arroyos	AR	Tres Arroyos
OYP	St-Georges de lOyapock	GF	St Georges de lOyapock
OYS	Yosemite Ntl Park	US	Yosemite Ntl Park
OZA	Ozona Municipal	US	Ozona
OZC	Labo	PH	Ozamis City
OZH	Zaporozhye	UA	Zaporozhye
OZI	Bobadilla	ES	Bobadilla
OZP	Moron	ES	Moron
OZR	Cairns AAF	US	Ozark
OZU	Montilla	ES	Montilla
OZZ	Ouarzazate	MA	Ouarzazate
PAA	Pa-an	MM	Pa-an
PAB	Bilaspur	IN	Bilaspur
PAC	Paitilla-Marcos A. Gelabert	PA	Panama City
PAD	Paderborn/lippstadt	DE	Paderborn
PAE	Snohomish County - Paine Field	US	Everett, WA
PAF	Pakuba	UG	Pakuba
PAG	Pagadian	PH	Pagadian
PAH	Barkley Regional	US	Paducah, KY
PAI	Pailin	KH	Pailin
PAJ	Para Chinar	PK	Para Chinar
PAK	Port Allen	US	Hanapepe
PAL	Palanquero	CO	Palanquero
PAM	Tyndall AFB	US	Panama City, FL
PAN	Pattani	TH	Pattani
PAO	Palo Alto	US	Palo Alto
PAP	Toussaint Louverture International	HT	Port Au Prince
PAQ	Municipal	US	Palmer
PAS	Paros	GR	Paros
PAT	Patna	IN	Patna
PAU	Pauk	MM	Pauk
PAV	Paulo Afonso	BR	Paulo Afonso
PAW	Pambwa	PG	Pambwa
PAX	Port De Paix	HT	Port De Paix
PAY	Pamol	MY	Pamol
PAZ	Tajin	MX	Poza Rica
PBA	Point Barrow	US	Barrow
PBB	Paranaiba	BR	Paranaiba
PBC	Hermanos Serdan International	MX	Puebla Atlixco
PBD	Porbandar	IN	Porbandar
PBE	Puerto Berrio	CO	Puerto Berrio
PBF	Grider Field	US	Pine Bluff
PBG	Plattsburgh International	US	Plattsburgh
PBH	Paro	BT	Paro
PBI	Palm Beach International	US	West Palm Beach
PBJ	Paama	VU	Paama
PBK	Pack Creek	US	Pack Creek
PBL	Puerto Cabello	VE	Puerto Cabello
PBM	Zanderij Intl	SR	Paramaribo
PBN	Porto Amboim	AO	Porto Amboim
PBO	Paraburdoo	AU	Paraburdoo
PBP	Punta Islita	CR	Punta Islita
PBQ	Pimenta Bueno	BR	Pimenta Bueno
PBR	Puerto Barrios	GT	Puerto Barrios
PBS	Patong Beach	TH	Patong Beach
PBT	Puerto Leda	PY	Puerto Leda
PBU	Putao	MM	Putao
PBV	Porto Dos Gauchos	BR	Porto Dos Gauchos
PBW	Palibelo	ID	Palibelo
PBX	Porto Alegre Do Norte	BR	Porto Alegre Do Norte
PBY	Hamilton/Proserpine	AU	Peppers Palm Bay
PBZ	Plettenberg Bay	ZA	Plettenberg Bay
PCA	Portage Creek	US	Portage Creek
PCB	Pondok Cabe	ID	Jakarta
PCC	Puerto Rico	CO	Puerto Rico
PCD	Municipal	US	Prairie Du Chien
PCE	Painter Creek	US	Painter Creek
PCG	Paso Caballos	GT	Paso Caballos
PCH	Palacios	HN	Palacios
PCJ	Puerto La Victoria	PY	Puerto La Victoria
PCK	Porcupine Creek	US	Porcupine Creek
PCL	Captain Rolden International Airport	PE	Pucallpa
PCM	Playa Del Carmen	MX	Playa Del Carmen
PCN	Koromiko	NZ	Picton
PCO	Punta Colorada	MX	Punta Colorada
PCP	Principe	ST	Principe
PCQ	Bounneua	LA	Phongsaly
PCR	Puerto Carreno	CO	Puerto Carreno
PCS	Picos	BR	Picos
PCT	Princeton	US	Princeton
PCU	Pearl River County	US	Picayune
PCV	Punta Chivato	MX	Punta Chivato
PDA	Puerto Inirida	CO	Puerto Inirida
PDB	Pedro Bay	US	Pedro Bay
PDC	Mueo	NC	Mueo
PDD	Ponta de Ouro	MZ	Ponta de Ouro
PDE	Pandie Pandie	AU	Pandie Pandie
PDF	Prado	BR	Prado
PDG	Minangkabau International Airport	ID	Padang
PDI	Pindiu	PG	Pindiu
PDK	Dekalb-Peachtree	US	Atlanta, GA
PDL	Nordela (São Miguel Island)	PT	Ponta Delgada, Azores
PDN	Parndana	AU	Parndana
PDO	Pendopo	ID	Pendopo
PDP	Capitan Corbeta CA Curbelo International Airport	UY	Maldonado
PDR	Municipal	BR	Presidente Dutra
PDS	Piedras Negras	MX	Piedras Negras
PDT	Pendleton	US	Pendleton
PDU	Paysandu	UY	Paysandu
PDV	Plovdiv	BG	Plovdiv
PDX	Portland International	US	Portland, OR
PDZ	Pedernales	VE	Pedernales
PEA	Penneshaw	AU	Penneshaw
PEB	Pebane	MZ	Pebane
PEC	Pelican SPB	US	Pelican
PED	Pardubice	CZ	Pardubice
PEE	Perm	RU	Perm
PEF	Peenemuende	DE	Peenemuende
PEG	Sant Egidio	IT	Perugia
PEH	Pehuajo	AR	Pehuajo
PEI	Matecana	CO	Pereira
PEJ	Peschiei	IT	Peschiei
PEL	Pelaneng	LS	Pelaneng
PEM	Puerto Maldonado	PE	Puerto Maldonado
PEN	Penang International	MY	Penang
PEP	Peppimenarti	AU	Peppimenarti
PEQ	Pecos City	US	Pecos City
PER	Perth International	AU	Perth
PES	Petrozavodsk	RU	Petrozavodsk
PET	Federal	BR	Pelotas
PEU	Puerto Lempira	HN	Puerto Lempira
PEV	Pecs Pogany	HU	Pecs
PEW	Peshawar	PK	Peshawar
PEX	Pechora	RU	Pechora
PEY	Penong	AU	Penong
PEZ	Penza	RU	Penza
PFA	Paf Warren	US	Paf Warren
PFB	Passo Fundo	BR	Passo Fundo
PFC	Pacific City State	US	Pacific City, OH
PFD	Port Frederick	US	Port Frederick
PFJ	Patreksfjordur	IS	Patreksfjordur
PFN	Bay County	US	Panama City
PFO	International	CY	Paphos
PFQ	Parsabad	IR	Parsabad
PFR	Ilebo	ZR	Ilebo
PGA	Page	US	Page
PGB	Pangoa	PG	Pangoa
PGC	Grant County	US	Petersburg
PGD	Charlotte County	US	Punta Gorda
PGE	Yegepa	PG	Yegepa
PGF	Llabanere	FR	Perpignan
PGG	Progresso	BR	Sao Paulo
PGH	Pantnagar	IN	Pantnagar
PGI	Chitato	AO	Chitato
PGK	Pangkalpinang	ID	Pangkalpinang
PGL	Jackson County	US	Pascagoula
PGM	Port Graham	US	Port Graham
PGN	Pangia	PG	Pangia
PGO	Stevens Field	US	Pagosa Springs
PGP	Porto Alegre	ST	Porto Alegre
PGR	Municipal	US	Paragould
PGS	Peach Springs	US	Peach Springs
PGV	Pitt-Greenville	US	Greenville, NC
PGX	Bassillac	FR	Perigueux
PHA	Phan Rang	VN	Phan Rang
PHB	Santos Dumont	BR	Parnaiba
PHC	Port Harcourt	NG	Port Harcourt
PHD	Harry Clever Field	US	New Philadelphia, OH
PHE	Port Hedland	AU	Port Hedland
PHF	Newport News/williamsb	US	Newport News, VA
PHG	Port Harcourt City	NG	Port Harcourt
PHH	Phan Thiet	VN	Phan Thiet
PHI	Pinheiro	BR	Pinheiro
PHJ	Port Hunter	AU	Port Hunter
PHK	Palm Beach Co Glades	US	Pahokee
PHL	Philadelphia International	US	Philadelphia
PHM	Boeblingen	DE	Boeblingen
PHN	St Clair County Intl	US	Port Huron
PHO	Point Hope	US	Point Hope
PHP	Philip	US	Philip
PHR	Pacific Harbor	FJ	Pacific Harbor
PHS	Phitsanulok	TH	Phitsanulok
PHT	Henry County	US	Paris
PHU	Phu Vinh	VN	Phu Vinh
PHW	Phalaborwa	ZA	Phalaborwa
PHX	Sky Harbor Intl	US	Phoenix
PHY	Phetchabun	TH	Phetchabun
PHZ	Phi Phi Island	TH	Phi Phi Island
PIA	Greater Peoria	US	Peoria, IL
PIB	Hattiesburg-Laurel Regional	US	Hattiesburg/Laurel, MS
PIC	Pine Cay	TC	Pine Cay
PID	Paradise Island	BS	Nassau
PIE	St. Petersburg-Clearwater International	US	Clearwater
PIF	Pingtung	TW	Pingtung
PIG	Pitinga	BR	Pitinga
PIH	Pocatello	US	Pocatello
PII	Phillips Field	US	Fairbanks
PIK	Prestwick	GB	Prestwick, South Ayrshire
PIL	Pilar	PY	Pilar
PIM	Garden Harris County	US	Pine Mountain
PIN	Parintins	BR	Parintins
PIO	Pisco	PE	Pisco
PIP	Pilot Point	US	Pilot Point
PIQ	Pipillipai	GY	Pipillipai
PIR	Pierre	US	Pierre
PIS	Biard	FR	Poitiers
PIT	Pittsburgh International	US	Pittsburgh, PA
PIU	Piura	PE	Piura
PIV	Pirapora	BR	Pirapora
PIW	Pikwitonei	CA	Pikwitonei
PIX	Pico Island	PT	Pico Island
PIZ	Dew Station	US	Point Lay
PJA	Pajala	SE	Pajala
PJB	Payson	US	Payson
PJC	Pedro Juan Caballero	PY	Pedro Juan Caballero
PJG	Panjgur	PK	Panjgur
PJM	Puerto Jimenez	CR	Puerto Jimenez
PJS	Port San Juan	US	Port San Juan
PJZ	Puerto Juarez	MX	Puerto Juarez
PKA	SPB	US	Napaskiak
PKB	Wood County	US	Parkersburg
PKC	Petropavlovsk-Kamchats	RU	Petropavlovsk-Kamchats
PKD	Park Rapids	US	Park Rapids
PKE	Parkes	AU	Parkes
PKF	Park Falls	US	Park Falls
PKG	Pangkor Airport	MY	Pangkor
PKH	Alexion	GR	Porto Kheli
PKJ	Playa Grande	GT	Playa Grande
PKK	Pakokku	MM	Pakokku
PKL	Pakatoa Island	NZ	Pakatoa Island
PKM	Port Kaituma	GY	Port Kaituma
PKN	Pangkalanbuun	ID	Pangkalanbuun
PKO	Parakou	BJ	Parakou
PKP	Puka Puka	PF	Puka Puka
PKR	Pokhara	NP	Pokhara
PKS	Paksane	LA	Paksane
PKT	Port Keats	AU	Port Keats
PKU	Sultan Syarif Kasim Ii	ID	Pekanbaru
PKV	Pskov	RU	Pskov
PKW	Selebi-Phikwe	BW	Selebi-Phikwe
PKY	Palangkaraya	ID	Palangkaraya
PKZ	Pakse	LA	Pakse
PLA	Planadas	CO	Planadas
PLB	Clinton County	US	Plattsburgh
PLC	Planeta Rica	CO	Planeta Rica
PLD	Playa Samara	CR	Playa Samara
PLE	Paiela	PG	Paiela
PLF	Pala	TD	Pala
PLG	La Plagne	FR	La Plagne
PLH	Plymouth	GB	Plymouth
PLI	Palm Island	VC	Palm Island
PLJ	Placencia	BZ	Placencia
PLK	M Graham Clark	US	Branson/point Lookout
PLL	Ponta Pelada	BR	Manaus
PLM	Mahmud Badaruddin Ii	ID	Palembang
PLN	Emmet County	US	Pellston
PLO	Port Lincoln	AU	Port Lincoln
PLP	La Palma	PA	La Palma
PLQ	Palanga International	LT	Klaipeda/Palanga
PLR	St Clair County	US	Pell City
PLS	International	TC	Providenciales
PLT	Plato	CO	Plato
PLU	Pampulha Domestic	BR	Belo Horizonte
PLV	Poltava	UA	Poltava
PLW	Mutiara	ID	Palu
PLX	Semipalatinsk	KZ	Semipalatinsk
PLY	Plymouth	US	Plymouth
PLZ	Port Elizabeth	ZA	Port Elizabeth
PMA	Wawi	TZ	Pemba
PMB	Intermediate	US	Pembina
PMC	Tepual	CL	Puerto Montt
PMD	La Palmdale Regional Airport	US	Palmdale, CA
PME	Portsmouth	GB	Portsmouth
PMF	Giuseppe Verdi	IT	Parma
PMG	International	BR	Ponta Pora
PMH	Greater Portsmouth Regional	US	Portsmouth, OH
PMI	Son Sant Joan Airport	ES	Palma Mallorca
PMK	Palm Island	AU	Palm Island
PML	AFS	US	Port Moller
PMM	Phanom Sarakham	TH	Phanom Sarakham
PMN	Pumani	PG	Pumani
PMO	Punta Raisi	IT	Palermo
PMP	Pimaga	PG	Pimaga
PMQ	Perito Moreno	AR	Perito Moreno
PMR	Palmerston North	NZ	Palmerston North
PMS	Palmyra	SY	Palmyra
PMT	Paramakotoi	GY	Paramakotoi
PMU	SPB	US	Paimiut
PMV	Del Caribe International (Gen. Santiago Marino)	VE	Porlamar
PMW	Palmas	BR	Palmas
PMX	Metropolitan	US	Palmer
PMY	El Tehuelche	AR	Puerto Madryn
PMZ	Palmar Sur	CR	Palmar
PNA	Pamplona	ES	Pamplona
PNB	Porto Nacional	BR	Porto Nacional
PNC	Ponca City	US	Ponca City
PND	Punta Gorda	BZ	Punta Gorda
PNE	North Philadelphia	US	Philadelphia
PNG	Municipal	BR	Paranagua
PNH	Phnom Penh International	KH	Phnom Penh
PNI	Pohnpei	FM	Pohnpei
PNJ	Peng Lai/Sha He Kou	CN	Peng Lai
PNK	Supadio	ID	Pontianak
PNL	Pantelleria	IT	Pantelleria
PNN	Princeton	US	Princeton
PNO	Pinotepa Nacional	MX	Pinotepa Nacional
PNP	Girua	PG	Popondetta
PNQ	Lohegaon	IN	Pune
PNR	Pointe Noire	CG	Pointe Noire
PNS	Regional	US	Pensacola
PNT	Teniente J. Gallardo	CL	Puerto Natales
PNU	Panguitch	US	Panguitch
PNV	Panevezys	LT	Panevezys
PNX	Grayson County	US	Sherman-Denison
PNY	Pondicherry	IN	Pondicherry
PNZ	Internacional	BR	Petrolina
POA	Salgado Filho	BR	Porto Alegre
POB	Pope AFB	US	Fayetteville, NC
POC	Brackett Field	US	La Verne
POD	Podor	SN	Podor
POE	Polk AAF	US	Fort Polk
POF	Earl Fields Memorial	US	Poplar Bluff
POG	Port Gentil	GA	Port Gentil
POH	Municipal	US	Pocahontas
POI	Potosi	BO	Potosi
POJ	Patos De Minas	BR	Patos De Minas
POL	Porto Amelia	MZ	Pemba
POM	Jackson Fld	PG	Port Moresby
PON	Poptun	GT	Poptun
POO	Pocos De Caldas	BR	Pocos De Caldas
POP	La Union	DO	Puerto Plata
POQ	Polk Inlet	US	Polk Inlet
POR	Pori	FI	Pori
POS	Piarco International	TT	Port Of Spain
POT	Ken Jones	JM	Port Antonio
POU	Dutchess County	US	Poughkeepsie
POV	Presov	SK	Presov
POW	Portoroz	SI	Portoroz
POX	Paris Cergy Pontoise	FR	Paris
POY	Powell	US	Powell
POZ	Lawica	PL	Poznan
PPA	Perry Lefors Field	US	Pampa
PPB	Adhemar De Barros	BR	Presidente Prudente
PPC	Prospect Creek	US	Prospect Creek
PPD	Palmas Del Mar	PR	Humacao
PPE	Puerto Penasco	MX	Puerto Penasco
PPF	Tri-City	US	Parsons
PPG	International	AS	Pago Pago
PPH	Peraitepuy	VE	Peraitepuy
PPI	Port Pirie	AU	Port Pirie
PPJ	Pulau Panjang	ID	Pulau Panjang
PPK	Petropavlovsk	KZ	Petropavlovsk
PPL	Phaplu	NP	Phaplu
PPM	Pompano Beach	US	Pompano Beach
PPN	Machangara	CO	Popayan
PPO	Powell Point	BS	Powell Point
PPP	Whitsunday Coast	AU	Proserpine
PPQ	Paraparaumu	NZ	Paraparaumu
PPR	Pasir Pangarayan	ID	Pasir Pangarayan
PPS	Puerto Princesa	PH	Puerto Princesa
PPT	Faa'a	PF	Papeete
PPU	Papun	MM	Papun
PPV	Port Protection	US	Port Protection
PPW	Papa Westray	GB	Papa Westray
PPX	Param	PG	Param
PPY	Pouso Alegre	BR	Pouso Alegre
PPZ	Puerto Paez	VE	Puerto Paez
PQC	Duong Dong	VN	Phu Quoc
PQI	Municipal	US	Presque Isle
PQM	Palenque	MX	Palenque
PQQ	Port Macquarie	AU	Port Macquarie
PQS	Pilot Station	US	Pilot Station
PQT	Heliport	DK	Qeqertaq
PRA	Parana	AR	Parana
PRB	Paso Robles	US	Paso Robles
PRC	Prescott	US	Prescott
PRD	Pardoo	AU	Pardoo
PRE	Pore	CO	Pore
PRF	Port Johnson	US	Port Johnson
PRG	Prague - Ruzyne International	CZ	Prague
PRH	Phrae	TH	Phrae
PRI	Praslin Island	SC	Praslin Island
PRJ	Capri	IT	Capri
PRK	Prieska	ZA	Prieska
PRL	Port Oceanic	US	Port Oceanic
PRM	Portimao	PT	Portimao
PRO	Municipal	US	Perry
PRP	Propriano	FR	Propriano
PRQ	Pres. Roque Saenz Pena	AR	Pres. Roque Saenz Pena
PRR	Paruima	GY	Paruima
PRS	Parasi	SB	Parasi
PRT	Coast Guard Heliport	US	Point Retreat
PRU	Prome	MM	Prome
PRV	Prerov	CZ	Prerov
PRW	Prentice	US	Prentice
PRX	Cox Field	US	Paris
PRY	Wonderboom Apt.	ZA	Pretoria
PRZ	Prineville	US	Prineville
PSA	Galileo Galilei	IT	Pisa
PSB	Bellefonte	US	Bellefonte
PSC	Tri-cities	US	Pasco, WA
PSD	Port Said	EG	Port Said
PSE	Mercedita	PR	Ponce
PSF	Pittsfield	US	Pittsfield
PSG	Petersburg James A Johnson	US	Petersburg, AK
PSH	St Peter	DE	St Peter
PSI	Pasni	PK	Pasni
PSJ	Poso	ID	Poso
PSK	New River Valley	US	Dublin
PSL	Perth	GB	Perth
PSM	Pease International	US	Portsmouth, NH
PSN	Palestine Municipal Airport	US	Palestine, TX
PSO	Cano	CO	Pasto
PSP	Municipal	US	Palm Springs
PSQ	SPB	US	Philadelphia, PA
PSR	Liberi	IT	Pescara
PSS	Posadas	AR	Posadas
PST	Preston	CU	Preston
PSU	Putussibau	ID	Putussibau
PSV	Papa Stour	GB	Papa Stour
PSW	Passos	BR	Passos
PSX	Palacios	US	Palacios
PSY	Port Stanley	FK	Port Stanley
PSZ	Puerto Suarez	BO	Puerto Suarez
PTA	Port Alsworth	US	Port Alsworth
PTB	Dinwiddie County Airport	US	Petersburg, VA
PTC	Port Alice	US	Port Alice
PTD	Port Alexander	US	Port Alexander
PTE	Port Stephens	AU	Port Stephens
PTF	Malololailai	FJ	Malololailai
PTG	Polokwane	ZA	Polokwane
PTH	Port Heiden	US	Port Heiden
PTI	Port Douglas	AU	Port Douglas
PTJ	Portland	AU	Portland
PTK	Pontiac	US	Pontiac
PTL	Port Armstrong	US	Port Armstrong
PTM	Palmarito	VE	Palmarito
PTN	Williams Memorial	US	Patterson
PTO	Municipal	BR	Pato Branco
PTP	Le Raizet	GP	Pointe-a-pitre
PTQ	Porto de Moz	BR	Porto de Moz
PTR	Pleasant Harbour	US	Pleasant Harbour
PTS	Municipal	US	Pittsburg
PTT	Pratt	US	Pratt
PTU	Platinum	US	Platinum
PTV	Porterville	US	Porterville
PTW	Pottstown/Limerick	US	Pottstown
PTX	Pitalito	CO	Pitalito
PTY	Tocumen International	PA	Panama City
PTZ	Pastaza	EC	Pastaza
PUA	Puas	PG	Puas
PUB	Memorial	US	Pueblo
PUC	Carbon County	US	Price
PUD	Puerto Deseado	AR	Puerto Deseado
PUE	Puerto Obaldia	PA	Puerto Obaldia
PUF	Pau-Pyrénées	FR	Pau
PUG	Port Augusta	AU	Port Augusta
PUH	Pochutla	MX	Pochutla
PUI	Pureni	PG	Pureni
PUJ	Punta Cana International	DO	Higuey
PUK	Pukarua	PF	Pukarua
PUL	Poulsbo	US	Poulsbo
PUM	Pomala	ID	Pomala
PUN	Punia	ZR	Punia
PUO	Prudhoe Bay	US	Prudhoe Bay
PUP	Po	BF	Po
PUQ	Pres Ibanez	CL	Punta Arenas
PUR	Puerto Rico	BO	Puerto Rico
PUS	Gimhae	KR	Busan
PUT	Puttaprathe	IN	Puttaparthi
PUU	Puerto Asis	CO	Puerto Asis
PUV	Poum	NC	Poum
PUW	Pullman-Moscow Regional Airport	US	Pullman
PUX	Puerto Varas	CL	Puerto Varas
PUY	Pula	HR	Pula
PUZ	Puerto Cabezas	NI	Puerto Cabezas
PVA	Providencia	CO	Providencia
PVC	Provincetown	US	Provincetown
PVD	T. F. Green Airport	US	Providence
PVE	El Porvenir	PA	El Porvenir
PVF	Placerville	US	Placerville
PVG	Pu Dong	CN	Shanghai
PVH	Governador Jorge Teixeira	BR	Porto Velho
PVI	Edu Chaves	BR	Paranavai
PVJ	Pauls Valley Municipal Airport	US	Pauls Valley, OK
PVK	Aktion	GR	Preveza/Lefkas
PVN	Pleven	BG	Pleven
PVO	Reales Tamarindos	EC	Portoviejo
PVR	Licenciado Gustavo Díaz Ordaz International	MX	Puerto Vallarta
PVS	Provideniya	RU	Provideniya
PVU	Provo	US	Provo
PVW	Hale County	US	Plainview
PVX	Provedenia	RU	Provedenia
PVY	Pope Vanoy	US	Pope Vanoy
PVZ	Casement	US	Painesville
PWA	Wiley Post	US	Oklahoma City
PWD	Sherwood	US	Plentywood
PWE	Pevek	RU	Pevek
PWI	Beles	ET	Pawi
PWK	Pal-Waukee	US	Chicago
PWL	Purwokerto	ID	Purwokerto
PWM	Intl Jetport	US	Portland
PWN	Pitts Town	BS	Pitts Town
PWO	Pweto	ZR	Pweto
PWQ	Pavlodar	KZ	Pavlodar
PWR	Port Walter	US	Port Walter
PWT	Bremerton	US	Bremerton
PXL	Polacca	US	Polacca
PXM	Puerto Escondido	MX	Puerto Escondido
PXO	Porto Santo	PT	Porto Santo
PXR	Surin	TH	Surin
PXS	Puerto De Santa Maria	ES	Puerto De Santa Maria
PXU	Pleiku	VN	Pleiku
PYA	Puerto Boyaca	CO	Puerto Boyaca
PYB	Jeypore	IN	Jeypore
PYC	Playon Chico	PA	Playon Chico
PYE	Penrhyn Island	CK	Penrhyn Island
PYH	Puerto Ayacucho	VE	Puerto Ayacucho
PYJ	Polyarnyj	RU	Polyarnyj
PYL	Perry SPB	US	Perry Island
PYM	Plymouth	US	Plymouth
PYN	Payan	CO	Payan
PYO	Putumayo	EC	Putumayo
PYR	Andravida	GR	Pyrgos
PYV	Yaviza	PA	Yaviza
PYX	Pattaya	TH	Pattaya
PZA	Casanare	CO	Paz De Ariporo
PZB	Pietermaritzburg Oribi	ZA	Pietermaritzburg
PZE	Penzance	GB	Penzance
PZH	Zhob	PK	Zhob
PZI	Pan Zhi Hua Bao An Ying	CN	Pan Zhi Hua
PZK	Puka Puka Is/Attol	CK	Puka Puka Is/Attol
PZL	Zulu Inyala	ZA	Phinda
PZO	Puerto Ordaz	VE	Puerto Ordaz
PZU	Port Sudan	SD	Port Sudan
PZY	Piestany	SK	Piestany
QAW	Ft Mcclellan Bus Trml	US	Anniston
QBC	Bella Coola	CA	Bella Coola, BC
QBF	Vail Van Service	US	Vail/Eagle
QCE	Van Service	US	Copper Mountain
QCU	Heliport	GL	Akunnaaq
QDM	Shek Mum	HK	Shek Mum
QDU	Station	DE	Dusseldorf
QFI	Heliport	GL	Iginniarfik
QFK	Harbour	NO	Selje
QFQ	Harbour	NO	Maloy
QGQ	Heliport	GL	Attu
QGV	Neu Isenburg	DE	Frankfurt
QGY	Gyor-Per	HU	Per
QHA	Kiewit	BE	Hasselt
QHU	Husum	DE	Husum
QJE	Heliport	GL	Kitsissuarsuit
QJI	Heliport	GL	Ikamiut
QJV	Limousine Service	DK	Skagen Z7
QKB	Van Service	US	Breckenridge
QKS	Van Service	US	Keystone
QLX	Lauterach	AT	Lauterach
QMK	Heliport	GL	Niaqornaarsuk
QMM	Marina Di Massa	IT	Marina Di Massa
QMQ	Murzuq	LY	Murzuq
QMV	Montvale	US	Montvale
QNY	Marine Air Terminal	US	New York
QOF	Darnitsa Bus Station	UA	Kiev
QOH	Hotel Rus Bus Station	UA	Kiev
QPG	Paya Lebar	SG	Singapore
QPW	Heliport	GL	Kangaatsiaq
QQS	London St. Pancras	GB	Britrail Rail Zone S
QQW	London-Waterloo	GB	London
QRA	Rand/Germiston	ZA	Johannesburg
QRO	Queretaro	MX	Queretaro
QRW	Warri	NG	Warri
QRY	Heliport	GL	Ikerasaarsuk
QSA	Sabadell	ES	Sabadell
QSF	Setif	DZ	Setif
QSG	Sonderborg	DK	Sonderborg
QUB	Ubari	LY	Ubari
QUF	Pirita Harbour	EE	Tallinn
QUP	Heliport	GL	Saqqaq
QVL	Victoria Island	NG	Victoria Island
QVY	Bus Station	FI	Kouvola
QWF	Fort Collins Bus Servi	US	Fort Collins/Loveland
QWG	Wilgrove Air Park	US	Charlotte, NC
QWP	Van Service	US	Winter Park
QYW	Vieux Port	FR	Cannes
RAA	Rakanda	PG	Rakanda
RAB	Tokua	PG	Rabaul
RAC	Horlick	US	Racine
RAD	Road Town	VG	Tortola
RAE	Arar	SA	Arar
RAG	Raglan	NZ	Raglan
RAH	Rafha	SA	Rafha
RAI	Francisco Mendes	CV	Praia
RAJ	Civil	IN	Rajkot
RAK	Menara	MA	Marrakech
RAL	Riverside Municipal	US	Riverside
RAM	Ramingining	AU	Ramingining
RAN	La Spreta	IT	Ravenna
RAO	Leite Lopes	BR	Ribeirao Preto
RAP	Regional	US	Rapid City
RAQ	Sugimanuru	ID	Raha
RAR	Rarotonga	CK	Rarotonga
RAS	Rasht	IR	Rasht
RAT	Raduzhnyi	RU	Raduzhnyi
RAU	Rangpur	BD	Rangpur
RAV	Cravo Norte	CO	Cravo Norte
RAW	Arawa	PG	Arawa
RAX	Oram	PG	Oram
RAY	Heliport	GB	Rothesay
RAZ	Rawala Kot	PK	Rawala Kot
RBA	Sale	MA	Rabat
RBB	Borba	BR	Borba
RBC	Robinvale	AU	Robinvale
RBD	Redbird	US	Dallas
RBE	Ratanakiri	KH	Ratanakiri
RBF	Big Bear City Arpt	US	Big Bear
RBG	Municipal	US	Roseburg
RBH	Brooks Lodge	US	Brooks Lodge
RBI	Rabi	FJ	Rabi
RBJ	Rebun	JP	Rebun
RBK	French Valley	US	Rancho
RBL	Red Bluff Fss	US	Red Bluff
RBM	Wallmuhle	DE	Straubing
RBN	Fort Jefferson	US	Fort Jefferson
RBO	Robore	BO	Robore
RBP	Rabaraba	PG	Rabaraba
RBQ	Rurrenabaque	BO	Rurrenabaque
RBR	Pres. Medici	BR	Rio Branco
RBS	Orbost	AU	Orbost
RBT	Marsabit	KE	Marsabit
RBU	Roebourne	AU	Roebourne
RBV	Ramata	SB	Ramata
RBW	Municipal	US	Walterboro
RBY	Ruby	US	Ruby
RCA	Ellsworth Afb	US	Rapid City
RCB	Richards Bay	ZA	Richards Bay
RCE	Roche Harbor	US	Roche Harbor
RCH	Riohacha	CO	Riohacha
RCK	Coffield	US	Rockdale
RCL	Redcliffe	VU	Redcliffe
RCM	Richmond	AU	Richmond
RCN	American River	AU	American River
RCO	Saint Agnant	FR	Rochefort
RCP	Cinder River	US	Cinder River
RCQ	Reconquista	AR	Reconquista
RCR	Fulton County	US	Rochester
RCS	Rochester	GB	Rochester
RCT	Miller Field	US	Reed City
RCU	Rio Cuarto	AR	Rio Cuarto
RCY	Rum Cay	BS	Rum Cay
RDA	Rockhampton Downs	AU	Rockhampton Downs
RDB	Red Dog	US	Red Dog
RDC	Redencao	BR	Redencao
RDD	Redding	US	Redding
RDE	Merdey	ID	Merdey
RDG	Municipal/Spaatz Fld	US	Reading
RDM	Roberts Field	US	Redmond
RDN	LTS Pulau Redang	MY	Redang
RDR	Grand Forks AFB	US	Red River
RDS	Rincon de los Sauces	AR	Rincon de los Sauces
RDT	Richard Toll	SN	Richard Toll
RDU	Raleigh-durham International Airport	US	Raleigh/Durham, NC
RDV	Red Devil	US	Red Devil
RDZ	Marcillac	FR	Rodez
REA	Reao	PF	Reao
REB	Rechlin	DE	Rechlin
REC	Guararapes Intl	BR	Recife
RED	Mifflin County	US	Reedsville
REE	Reese AFB	US	Lubbock
REG	Tito Menniti	IT	Reggio Calabria
REH	Rehoboth Beach	US	Rehoboth Beach
REI	Regina	GF	Regina
REL	Almirante Zar	AR	Trelew
REN	Orenburg	RU	Orenburg
REO	State	US	Rome
REP	Siem Reap	KH	Siem Reap
RER	Base Aerea Del Sur	GT	Retalhuleu
RES	Resistencia	AR	Resistencia
RET	Stolport	NO	Rost
REU	Reus	ES	Reus
REW	Rewa	IN	Rewa
REX	Gen Lucio Blanco	MX	Reynosa
REY	Reyes	BO	Reyes
REZ	Resende	BR	Resende
RFA	Rafai	CF	Rafai
RFD	Greater Rockford Airport	US	Rockford, IL
RFG	Rooke Field	US	Refugio
RFK	Rollang Field	US	Anguilla
RFN	Raufarhofn	IS	Raufarhofn
RFP	Raiatea	PF	Raiatea
RFR	Rio Frio	CR	Rio Frio
RFS	Rosita	NI	Rosita
RGA	Rio Grande	AR	Rio Grande
RGE	Porgera	PG	Porgera
RGH	Balurghat	IN	Balurghat
RGI	Rangiroa	PF	Rangiroa
RGL	Internacional	AR	Rio Gallegos
RGN	Mingaladon	MM	Yangon
RGR	Ranger Municipal	US	Ranger
RGT	Japura	ID	Rengat
RHA	Reykholar	IS	Reykholar
RHD	Rio Hondo	AR	Rio Hondo
RHE	Reims	FR	Reims
RHG	Ruhengeri	RW	Ruhengeri
RHI	Oneida County	US	Rhinelander
RHL	Roy Hill	AU	Roy Hill
RHN	Rosh Pina	NA	Rosh Pina
RHO	Diagoras	GR	Rhodes
RHP	Ramechhap	NP	Ramechhap
RHV	Reid-hillview	US	San Jose
RIA	Base Aerea De Santa Maria	BR	Santa Maria, Rs
RIB	Gen Buech	BO	Riberalta
RIC	Richmond International Airport	US	Richmond, VA
RID	Richmond Municipal Airport	US	Richmond, IN
RIE	Rice Lake	US	Rice Lake
RIF	Reynolds	US	Richfield
RIG	Rio Grande	BR	Rio Grande
RIJ	Rioja	PE	Rioja
RIK	Carrillo	CR	Carrillo
RIL	Garfield County	US	Rifle
RIM	Rodriguez De Mendoza	PE	Rodriguez De Mendoza
RIN	Ringi Cove	SB	Ringi Cove
RIR	Riverside Fla-Bob	US	Riverside
RIS	Rishiri	JP	Rishiri
RIT	Rio Tigre	PA	Rio Tigre
RIV	March ARB	US	Riverside
RIW	Riverton Regional	US	Riverton, WY
RIX	Riga International	LV	Riga
RIY	Riyan Mukalla	YE	Riyan Mukalla
RIZ	Rio Alzucar	PA	Rio Alzucar
RJA	Rajahmundry	IN	Rajahmundry
RJB	Rajbiraj	NP	Rajbiraj
RJH	Rajshahi	BD	Rajshahi
RJI	Rajouri	IN	Rajouri
RJK	Rijeka	HR	Rijeka
RJL	Agoncillo	ES	Logrono
RJN	Rafsanjan	IR	Rafsanjan
RKC	Yreka	US	Yreka
RKD	Knox County Regional	US	Rockland
RKE	Roskilde Airport	DK	Copenhagen
RKH	Rock Hill	US	Rock Hill
RKI	Rokot	ID	Rokot
RKO	Sipora	ID	Sipora
RKP	Aransas County	US	Rockport
RKR	Robert S Kerr	US	Poteau
RKS	Sweetwater County	US	Rock Springs
RKT	Ras Al Khaimah	AE	Ras Al Khaimah
RKU	Kairuku	PG	Yule Island
RKV	Reykjavik	IS	Reykjavik
RKW	Municipal	US	Rockwood
RKY	Rokeby	AU	Rokeby
RLA	National	US	Rolla
RLD	Richland	US	Richland
RLG	Laage	DE	Rostock-laage
RLI	Reilly AHP	US	Anniston
RLO	Valle Del Conlara	AR	Merlo
RLP	Rosella Plains	AU	Rosella Plains
RLT	Arlit	NE	Arlit
RLU	Bornite Upper	US	Bornite
RMA	Roma	AU	Roma
RMB	Buraimi	OM	Buraimi
RMC	Machesney	US	Rockford
RMD	Ramagundam	IN	Ramagundam
RME	Griffiss AFB	US	Rome, NY
RMF	Marsa Alam Intl	EG	Marsa Alam
RMG	Richard B Russell	US	Rome
RMI	Miramare	IT	Rimini
RMK	Renmark	AU	Renmark
RMN	Rumginae	PG	Rumginae
RMP	Rampart	US	Rampart
RMQ	Chingchuankang	TW	Taichung
RMS	Ramstein	DE	Ramstein
RNA	Ulawa Airport	SB	Arona
RNB	Kallinge	SE	Ronneby
RNC	Warren County	US	Mcminnville
RND	Randolph AFB	US	San Antonio
RNE	Renaison	FR	Roanne
RNG	Rangely	US	Rangely
RNH	Municipal	US	New Richmond
RNI	Corn Island	NI	Corn Island
RNJ	Yoronjima	JP	Yoronjima
RNL	Rennell	SB	Rennell
RNN	Bornholm	DK	Rønne
RNO	Reno-Tahoe International	US	Reno, NV
RNP	Rongelap Island	MH	Rongelap Island
RNR	Robinson River	PG	Robinson River
RNS	St Jacques	FR	Rennes
RNT	Renton	US	Renton, WA
RNU	Ranau	MY	Ranau
RNZ	Rensselaer	US	Rensselaer
ROA	Roanoke Regional Airport	US	Roanoke
ROB	Roberts Intl	LR	Monrovia
ROC	Greater Rochester International	US	Rochester, NY
ROD	Robertson	ZA	Robertson
ROG	Rogers	US	Rogers
ROH	Robinhood	AU	Robinhood
ROI	Roi Et Airport	TH	Roi Et
ROK	Rockhampton	AU	Rockhampton
ROL	Roosevelt	US	Roosevelt
RON	Rondon	CO	Rondon
ROO	Rondonopolis	BR	Rondonopolis
ROP	Rota	MP	Rota
ROR	Babelthuap/Koror	PW	Koror
ROS	Fisherton	AR	Rosario
ROT	Rotorua	NZ	Rotorua
ROU	Rousse	BG	Rousse
ROV	Rostov	RU	Rostov
ROW	Industrial	US	Roswell
ROX	Municipal	US	Roseau
ROY	Rio Mayo	AR	Rio Mayo
RPA	Rolpa	NP	Rolpa
RPB	Roper Bar	AU	Roper Bar
RPM	Ngukurr	AU	Ngukurr
RPN	Rosh Pina	IL	Rosh Pina
RPR	Raipur	IN	Raipur
RPV	Roper Valley	AU	Roper Valley
RPX	Roundup	US	Roundup
RRA	Ronda	ES	Ronda
RRE	Marree	AU	Marree
RRG	Rodrigues Is	MU	Rodrigues Is
RRI	Barora	SB	Barora
RRK	Rourkela	IN	Rourkela
RRL	Municipal	US	Merrill
RRM	Marromeu	MZ	Marromeu
RRN	Serra Norte	BR	Serra Norte
RRO	Sorrento	IT	Naples
RRS	Roros	NO	Roros
RRT	Warroad	US	Warroad
RRV	Robinson River	AU	Robinson River
RSA	Santa Rosa	AR	Santa Rosa
RSB	Roseberth	AU	Roseberth
RSD	S Eleuthera	BS	Rock Sound
RSE	Rose Bay	AU	Sydney
RSG	Serra Pelada	BR	Serra Pelada
RSH	Russian SPB	US	Russian Mission
RSI	Rio Sidra	PA	Rio Sidra
RSJ	Rosario SPB	US	Rosario
RSK	Ransiki	ID	Ransiki
RSL	Russell	US	Russell
RSN	Ruston	US	Ruston
RSP	Raspberry Strait	US	Raspberry Strait
RSS	Roseires	SD	Roseires
RST	International	US	Rochester
RSU	Yeosu	KR	Yeosu
RSW	Southwest Florida International	US	Fort Myers, FL
RSX	Rouses Point	US	Rouses Point
RTA	Rotuma Island	FJ	Rotuma Island
RTB	Roatan	HN	Roatan
RTC	Ratnagiri	IN	Ratnagiri
RTD	Rotunda	US	Rotunda
RTE	Marguerite Bay	US	Marguerite Bay
RTG	Ruteng	ID	Ruteng
RTI	Roti	ID	Roti
RTL	Spirit Lake	US	Spirit Lake
RTM	Rotterdam Zestienhoven	NL	Rotterdam
RTN	Crews Field	US	Raton
RTP	Rutland Plains	AU	Rutland Plains
RTS	Rottnest Island	AU	Rottnest Island
RTW	Saratov	RU	Saratov
RTY	Merty	AU	Merty
RUA	Arua	UG	Arua
RUF	Yuruf	ID	Yuruf
RUG	Rugao	CN	Rugao
RUH	King Khaled Intl	SA	Riyadh
RUI	Municipal	US	Ruidoso
RUK	Rukumkot	NP	Rukumkot
RUM	Rumjatar	NP	Rumjatar
RUN	Gillot	RE	St Denis de la Reunion
RUP	Rupsi	IN	Rupsi
RUR	Rurutu	PF	Rurutu
RUS	Marau Sound	SB	Marau Sound
RUT	Rutland	US	Rutland
RUU	Ruti	PG	Ruti
RUV	Rubelsanto	GT	Rubelsanto
RUY	Copan	HN	Copan
RVA	Farafangana	MG	Farafangana
RVC	Rivercess	LR	Rivercess
RVD	Rio Verde	BR	Rio Verde
RVE	Los Colonizadores	CO	Saravena
RVH	Rzhevka	RU	St Petersburg
RVK	Ryumsjoen	NO	Roervik
RVN	Rovaniemi	FI	Rovaniemi
RVO	Reivilo	ZA	Reivilo
RVR	Green River	US	Green River
RVS	R.Lloyd Jones	US	Tulsa
RVT	Ravensthorpe	AU	Ravensthorpe
RVV	Raivavae	PF	Rairua
RVY	Rivera	UY	Rivera
RWB	Rowan Bay	US	Rowan Bay
RWF	Redwood Falls Muni	US	Redwood Falls
RWI	Rocky Mount-wilson	US	Rocky Mount,
RWL	Rawlins	US	Rawlins
RWN	Rovno	UA	Rovno
RWS	Sumare	BR	Sumare
RXA	Raudha	YE	Raudha
RXS	Roxas City	PH	Roxas City
RYB	Rybinsk	RU	Rybinsk
RYG	Moss	NO	Rygge
RYK	Rahim Yar Khan	PK	Rahim Yar Khan
RYN	Medis	FR	Royan
RYO	Rio Turbio	AR	Rio Turbio
RZA	Santa Cruz	AR	Santa Cruz
RZE	Jasionka	PL	Rzeszow
RZH	Quartz Hill	US	Lancaster
RZN	Ryazan	RU	Ryazan
RZP	CLR Airport	PH	Taytay Sandoval
RZR	Ramsar	IR	Ramsar
RZS	Sawan	PK	Sawan
RZZ	Halifax County	US	Roanoke Rapids
SAA	Shively Field	US	Saratoga
SAB	J. Yrausquin	AN	Saba Island
SAC	Executive	US	Sacramento
SAD	Safford	US	Safford
SAE	Sangir	ID	Sangir
SAF	Santa Fe	US	Santa Fe
SAG	Sagwon	US	Sagwon
SAH	El Rahaba Airport (Sanaa Intenational)	YE	Sanaa
SAJ	Sirajganj	BD	Sirajganj
SAK	Saudarkrokur	IS	Saudarkrokur
SAL	El Salvador International	SV	San Salvador
SAM	Salamo	PG	Salamo
SAN	San Diego International Airport	US	San Diego
SAP	Ramon Villeda Morales International	HN	San Pedro Sula
SAQ	San Andros	BS	San Andros
SAR	Sparta Community	US	Sparta
SAS	Salton City	US	Salton City
SAT	San Antonio International	US	San Antonio
SAU	Sawu	ID	Sawu
SAV	Savannah/Hilton Head	US	Savannah
SAW	Sabiha Gokcen	TR	Istanbul
SAX	Sambu	PA	Sambu
SAY	Siena	IT	Siena
SAZ	Sasstown	LR	Sasstown
SBA	Municipal	US	Santa Barbara, CA
SBB	Santa Barbara Ba	VE	Santa Barbara de Barinas
SBC	Selbang	PG	Selbang
SBD	Norton Afb	US	San Bernardino
SBE	Suabi	PG	Suabi
SBF	Sardeh Band	AF	Sardeh Band
SBG	Maimun Saleh	ID	Sabang
SBH	St Barthelemy	GP	St Barthelemy
SBI	Sambailo	GN	Koundara
SBJ	Sao Mateus	BR	Sao Mateus
SBK	Saint Brieuc-Armor	FR	Tremuson
SBL	Yacuma	BO	Santa Ana
SBM	Memorial	US	Sheboygan
SBN	South Bend Regional	US	South Bend
SBO	Salina	US	Salina
SBP	San Luis County Regional Airport	US	San Luis Obispo
SBQ	Sibi	PK	Sibi
SBR	Saibai Island	AU	Saibai Island
SBS	Steamboat Springs	US	Steamboat Springs
SBT	Tri-City	US	San Bernardino
SBU	Springbok	ZA	Springbok
SBV	Sabah	PG	Sabah
SBW	Sibu	MY	Sibu
SBX	Shelby	US	Shelby
SBY	Wicomico Regional	US	Salisbury-Ocean City
SBZ	Sibiu	RO	Sibiu
SCA	Santa Catalina	CO	Santa Catalina
SCB	State	US	Scribner
SCC	Prudhoe Bay/Deadhorse	US	Prudhoe Bay/Deadhorse
SCD	Sulaco	HN	Sulaco
SCE	University Park Airport	US	State College, Pennsylvania, PA
SCF	Scottsdale Municipal	US	Phoenix
SCG	Spring Creek	AU	Spring Creek
SCH	Schenectady County	US	Schenectady, NY
SCI	San Cristobal	VE	San Cristobal
SCJ	Smith Cove	US	Smith Cove
SCK	Stockton Metropolitan Airport	US	Stockton
SCL	Arturo Merino Benitez	CL	Santiago
SCM	SPB	US	Scammon Bay
SCN	Ensheim	DE	Saarbruecken
SCO	Shevchenko	KZ	Aktau
SCP	St Crepin	FR	St Crepin
SCQ	Santiago De Compostela	ES	Santiago De Compostela
SCR	Municipal	US	Scranton
SCS	Scatsta	GB	Shetland Islands
SCT	Socotra	YE	Socotra
SCU	Antonio Maceo	CU	Santiago
SCV	Salcea	RO	Suceava
SCW	Syktyvkar	RU	Syktyvkar
SCX	Salina Cruz	MX	Salina Cruz
SCY	San Cristobal	EC	Puerto Baquerizo Moreno, San Cristóbal Island, Galápagos Islands
SCZ	Santa Cruz Is	SB	Santa Cruz Is
SDA	Baghdad International	IQ	Baghdad
SDB	Langebaanweg	ZA	Saldanha Bay
SDC	Sandcreek	GY	Sandcreek
SDD	Lubango	AO	Lubango
SDE	Santiago Del Estero	AR	Santiago Del Estero
SDF	Louisville International (Standiford Field)	US	Louisville, KY
SDG	Sanandaj	IR	Sanandaj
SDH	Santa Rosa Copan	HN	Santa Rosa Copan
SDI	Saidor	PG	Saidor
SDJ	Sendai	JP	Sendai
SDK	Sandakan	MY	Sandakan
SDL	Sundsvall/harnosand	SE	Sundsvall
SDM	Brown Field Municipal	US	San Diego
SDN	Sandane	NO	Sandane
SDO	Ryotsu Sado Is	JP	Ryotsu Sado Is
SDP	Municipal	US	Sand Point
SDQ	Las Americas	DO	Santo Domingo
SDR	Santander	ES	Santander
SDS	Sado Shima	JP	Sado Shima
SDT	Saidu Sharif	PK	Saidu Sharif
SDU	Santos Dumont	BR	Rio De Janeiro
SDV	Sde Dov	IL	Tel Aviv Yafo
SDW	Sandwip	BD	Sandwip
SDX	Sedona	US	Sedona
SDY	Richland Municipal	US	Sidney
SEA	Seattle-Tacoma International	US	Seattle, WA
SEB	Sebha	LY	Sebha
SEC	Serre Chevalier	FR	Serre Chevalier
SEE	Gillespie Field	US	San Diego
SEF	Sebring Regional Airport	US	Sebring, Fl
SEG	Penn Valley	US	Selinsgrove
SEH	Senggeh	ID	Senggeh
SEI	Senhor Do Bonfim	BR	Senhor Do Bonfim
SEJ	Seydisfjordur	IS	Seydisfjordur
SEK	Er Errachidia	MA	Ksar Es Souk
SEM	Craig AFB	US	Selma
SEN	London Southend	GB	Southend
SEO	Seguela	CI	Seguela
SEP	Clark Field	US	Stephenville
SEQ	Sungai Pakning	ID	Sungai Pakning
SER	Freeman Municipal	US	Seymour
SES	Selfield	US	Selma
SET	San Esteban	HN	San Esteban
SEU	Seronera	TZ	Seronera
SEV	Severodoneck	UA	Severodoneck
SEW	Siwa	EG	Siwa
SEX	Sembach	DE	Sembach
SEY	Selibaby	MR	Selibaby
SEZ	Seychelles International Airport	SC	Mahe Island
SFA	Sfax Thyna	TN	Sfax
SFB	Orlando Sanford Intl	US	Sanford
SFC	St Francois	GP	St Francois
SFD	Las Flecheras	VE	San Fernando De Apure
SFE	San Fernando	PH	San Fernando
SFF	Felts Field	US	Spokane
SFG	Esperance	GP	St Martin
SFH	San Felipe	MX	San Felipe
SFI	Safi	MA	Safi
SFJ	Kangerlussuaq	GL	Kangerlussuaq
SFK	Soure	BR	Soure
SFL	Sao Filipe	CV	Sao Filipe
SFM	Sanford	US	Sanford
SFN	Santa Fe	AR	Santa Fe
SFO	San Francisco International	US	San Francisco, CA
SFP	Surfers Paradise	AU	Surfers Paradise
SFQ	Sanliurfa	TR	Sanliurfa
SFR	San Fernando	US	San Fernando, CA
SFT	Skelleftea	SE	Skelleftea
SFU	Safia	PG	Safia
SFV	Santa Fe Do Sul	BR	Santa Fe Do Sul
SFW	Santa Fe	PA	Santa Fe
SFX	San Felix	VE	San Felix
SFZ	North Central	US	Pawtucket, RI
SGA	Sheghnan	AF	Sheghnan
SGB	Singaua	PG	Singaua
SGC	Surgut	RU	Surgut
SGD	Sonderborg	DK	Sonderborg
SGE	Siegerland Airport	DE	Siegen
SGF	Springfield-Branson Rg	US	Springfield
SGG	Simanggang	MY	Simanggang
SGH	Springfield	US	Springfield
SGI	Sargodha Apt	PK	Sargodha
SGJ	Sagarai	PG	Sagarai
SGK	Sangapi	PG	Sangapi
SGL	Sangley Point NAS	PH	Cavite City
SGM	San Ignacio	MX	San Ignacio, Baja California Sur
SGN	Tan Son Nhat International	VN	Ho Chi Minh City
SGO	St George	AU	St George
SGP	Shay Gap	AU	Shay Gap
SGQ	Sanggata	ID	Sanggata
SGR	Sugar Land Regional	US	Houston, TX
SGS	Sanga Sanga	PH	Sanga Sanga
SGT	Stuttgart Municipal	US	Stuttgart, AR
SGU	Municipal	US	Saint George
SGV	Sierra Grande	AR	Sierra Grande
SGW	Saginaw Bay	US	Saginaw Bay
SGX	Songea	TZ	Songea
SGY	Municipal	US	Skagway
SGZ	Songkhla	TH	Songkhla
SHA	Hongqiao	CN	Shanghai
SHB	Nakashibetsu	JP	Nakashibetsu
SHC	Indaselassie	ET	Indaselassie
SHD	Shenandoah Valley	US	Staunton
SHE	Shenyang	CN	Shenyang
SHF	Shanhaiguan	CN	Shanhaiguan
SHG	Shungnak	US	Shungnak
SHH	Shishmaref	US	Shishmaref
SHI	Shimojishima	JP	Shimojishima
SHJ	Sharjah	AE	Sharjah
SHK	Sehonghong	LS	Sehonghong
SHL	Barapani	IN	Shillong
SHM	Shirahama	JP	Shirahama
SHN	Sanderson Field	US	Shelton
SHO	Seolak	KR	Sokcho
SHP	Qinhuangdao	CN	Qinhuangdao
SHQ	Southport	AU	Southport
SHR	Sheridan	US	Sheridan
SHS	Shashi	CN	Shashi
SHT	Shepparton	AU	Shepparton
SHU	Smith Point	AU	Smith Point
SHV	Regional	US	Shreveport
SHW	Sharurah	SA	Sharurah
SHX	Shageluk	US	Shageluk
SHY	Shinyanga	TZ	Shinyanga
SHZ	Seshutes	LS	Seshutes
SIA	Xiguan	CN	Xi An
SIB	Sibiti	CG	Sibiti
SIC	Sinop Airport	TR	Sinop
SID	Amilcar Cabral Intl	CV	Sal
SIE	Sines	PT	Sines
SIF	Simara	NP	Simara
SIG	Isla Grande	PR	San Juan
SIH	Silgadi Doti	NP	Silgadi Doti
SII	Sidi Ifni	MA	Sidi Ifni
SIJ	Siglufjordur	IS	Siglufjordur
SIK	Memorial	US	Sikeston
SIL	Sila	PG	Sila
SIM	Simbai	PG	Simbai
SIN	Changi	SG	Singapore
SIO	Smithton	AU	Smithton
SIP	Simferopol	UA	Simferopol
SIQ	Dabo	ID	Singkep
SIR	Sion	CH	Sion
SIS	Sishen	ZA	Sishen
SIT	Sitka	US	Sitka
SIU	Siuna	NI	Siuna
SIV	County	US	Sullivan
SIW	Sibisa	ID	Sibisa
SIX	Singleton	AU	Singleton
SIY	Siskiyou County	US	Montague
SIZ	Sissano	PG	Sissano
SJA	San Juan	PE	San Juan
SJB	San Joaquin	BO	San Joaquin
SJC	Mineta San Jose International Airport	US	San Jose
SJD	Los Cabos	MX	San Jose Del Cabo
SJE	San Jose Del Gua	CO	San Jose Del Gua
SJF	St John Island	VI	St John Island
SJG	San Pedro Jagua	CO	San Pedro Jagua
SJH	San Juan Del Cesar	CO	San Juan Del Cesar
SJI	Mcguire Fld	PH	San Jose
SJJ	Sarajevo	BA	Sarajevo
SJK	Sao Jose Dos Campos	BR	Sao Jose Dos Campos
SJL	Da Cachoeira	BR	Sao Gabriel
SJM	San Juan	DO	San Juan
SJN	St. Johns Industrial Air Park	US	St Johns, AZ
SJO	Juan Santamaría International	CR	San José
SJP	Sao Jose Do Rio Preto	BR	Sao Jose Do Rio Preto
SJQ	Sesheke	ZM	Sesheke
SJR	San Juan D Ur	CO	San Juan D Ur
SJS	San Jose	BO	San Jose
SJT	Mathis Fld	US	San Angelo
SJU	Luis Munoz Marin Intl	PR	San Juan
SJV	San Javier	BO	San Javier
SJW	Daguocun	CN	Shijiazhuang
SJX	Sartaneja	BZ	Sartaneja
SJY	Ilmajoki	FI	Seinajoki
SJZ	Sao Jorge Island	PT	Sao Jorge Island
SKA	Fairchild AFB	US	Spokane
SKB	Robert L Bradshaw International	KN	Basseterre, St. Kitts Island
SKC	Suki	PG	Suki
SKD	Samarkand	UZ	Samarkand
SKE	Skien	NO	Skien
SKF	Kelly AFB	US	San Antonio
SKG	Macedonia International	GR	Thessaloniki
SKH	Kadmandu	NP	Surkhet
SKI	Skikda	DZ	Skikda
SKJ	Sitkinak Cgs	US	Sitkinak Island
SKK	Shaktoolik	US	Shaktoolik
SKL	Broadford	GB	Isle Of Skye
SKM	Skeldon	GY	Skeldon
SKN	Skagen	NO	Stokmarknes
SKO	Sokoto	NG	Sokoto
SKP	Alexander The Great Airport	MK	Skopje
SKQ	Sekakes	LS	Sekakes
SKR	Shakiso	ET	Shakiso
SKS	Vojens	DK	Vojens
SKT	Sialkot International	PK	Sialkot
SKU	Skiros	GR	Skiros
SKV	Mount Sinai	EG	Santa Katarina
SKW	Intermediate	US	Skwentna
SKX	Saransk	RU	Saransk
SKY	Griffing Sandusky	US	Sandusky
SKZ	Sukkur	PK	Sukkur
SLA	Gen Belgrano	AR	Salta
SLB	Municipal	US	Storm Lake
SLC	Salt Lake City International	US	Salt Lake City, UT
SLD	Sliac	SK	Sliac
SLE	Mcnary Field	US	Salem
SLF	Sulayel	SA	Sulayel
SLG	Smith Field	US	Siloam Springs
SLH	Sola	VU	Sola
SLI	Solwezi	ZM	Solwezi
SLJ	Stellar Air Park	US	Chandler
SLK	Adirondack	US	Saranac Lake
SLL	Salalah	OM	Salalah
SLM	Matacan	ES	Salamanca
SLN	Salina	US	Salina
SLO	Leckrone	US	Salem
SLP	San Luis Potosi	MX	San Luis Potosi
SLQ	Sleetmute	US	Sleetmute
SLR	Sulphur Springs	US	Sulphur Springs
SLS	Silistra	BG	Silistra
SLT	Salida	US	Salida
SLU	George F L Charles	LC	Castries
SLV	Simla	IN	Simla
SLW	Saltillo	MX	Saltillo
SLX	Salt Cay	TC	Salt Cay
SLY	Salekhard	RU	Salekhard
SLZ	Marechal Cunha Machado	BR	São Luis
SMA	Vila Do Porto	PT	Santa Maria
SMB	Cerro Sombrero	CL	Cerro Sombrero
SMC	Santa Maria	CO	Santa Maria
SMD	Smith Field	US	Fort Wayne, IN
SME	Pulaski County	US	Somerset
SMF	Sacramento International	US	Sacramento, CA
SMG	Santa Maria	PE	Santa Maria
SMH	Sapmanga	PG	Sapmanga
SMI	Samos	GR	Samos
SMJ	Sim	PG	Sim
SMK	St Michael	US	St Michael
SML	Estate Airstrip	BS	Stella Maris
SMM	Semporna	MY	Semporna
SMN	Salmon	US	Salmon
SMO	Santa Monica	US	Santa Monica
SMP	Stockholm	PG	Stockholm
SMQ	Sampit	ID	Sampit
SMR	Simon Bolivar	CO	Santa Marta
SMS	Sainte Marie	MG	Sainte Marie
SMT	Sun Moon Lake	TW	Sun Moon Lake
SMU	Sheep Mountain	US	Sheep Mountain
SMV	Samedan	CH	St Moritz
SMW	Smara	MA	Smara
SMX	Public	US	Santa Maria
SMY	Simenti	SN	Simenti
SMZ	Stoelmans Eiland	SR	Stoelmans Eiland
SNA	John Wayne	US	Santa Ana, CA
SNB	Snake Bay	AU	Snake Bay
SNC	Salinas	EC	Salinas
SND	Seno	LA	Seno
SNE	Preguica	CV	Sao Nicolau
SNF	San Felipe	VE	San Felipe
SNG	San Ignacio De Velasco	BO	San Ignacio De Velasco
SNH	Stanthorpe	AU	Stanthorpe
SNI	R.E. Murray	LR	Sinoe
SNJ	San Julian	CU	San Julian
SNK	Winston Field	US	Snyder
SNL	Municipal	US	Shawnee
SNM	San Ignacio De M	BO	San Ignacio De M
SNN	Shannon	IE	Shannon
SNO	Sakon Nakhon	TH	Sakon Nakhon
SNP	Saint Paul Island	US	Saint Paul Island
SNQ	San Quintin	MX	San Quintin
SNR	Montoir	FR	St Nazaire
SNS	Salinas	US	Salinas
SNT	Sabana De Torres	CO	Sabana De Torres
SNU	Abel Santa Maria	CU	Santa Clara
SNV	Santa Elena	VE	Santa Elena
SNW	Thandwe	MM	Thandwe
SNX	Sabana De Mar	DO	Sabana De Mar
SNY	Sidney	US	Sidney
SNZ	Santa Cruz	BR	Santa Cruz
SOA	Soc Trang	VN	Soc Trang
SOB	Saarmelleek/balaton	HU	Saarmelleek
SOC	Adi Sumarmo	ID	Solo City
SOD	Sorocaba	BR	Sorocaba
SOE	Souanke	CG	Souanke
SOF	Sofia	BG	Sofia
SOG	Haukasen	NO	Sogndal
SOH	Solita	CO	Solita
SOI	South Molle Island	AU	South Molle Island
SOJ	Sorkjosen	NO	Sorkjosen
SOK	Semongkong	LS	Semongkong
SOL	Solomon	US	Solomon
SOM	Edmundo Barrios	VE	San Tome
SON	Pekoa	VU	Espiritu Santo
SOO	Soderhamn	SE	Soderhamn
SOP	Pinehurst-S. Pines	US	Southern Pines
SOQ	Jefman	ID	Sorong
SOR	Al Thaurah	SY	Al Thaurah
SOT	Sodankyla	FI	Sodankyla
SOU	Southampton Airport	GB	Eastleigh near Southampton
SOV	Seldovia	US	Seldovia
SOW	Show Low	US	Show Low, AZ
SOX	Alberto Lleras Camargo	CO	Sogamoso
SOY	Stronsay	GB	Stronsay
SOZ	Solenzara	FR	Solenzara
SPA	Spartanburg, Downtown Memorial	US	Spartanburg, SC
SPB	SPB	VI	St Thomas Island
SPC	La Palma	ES	Santa Cruz De La Palma
SPD	Saidpur	BD	Saidpur
SPE	Sepulot	MY	Sepulot
SPF	Black Hills	US	Spearfish
SPG	Whitted	US	St Petersburg
SPH	Sopu	PG	Sopu
SPI	Capital	US	Springfield
SPJ	Eleftherios Venizelos	GR	Athens
SPM	Spangdahlem	DE	Spangdahlem
SPN	Saipan International	MP	Obyan
SPO	San Pablo	ES	Sevilla
SPP	Menongue	AO	Menongue
SPQ	Catalina SPB	US	San Pedro
SPR	San Pedro	BZ	San Pedro
SPS	Sheppard AFB	US	Wichita Falls
SPT	Sipitang	MY	Sipitang
SPU	Split	HR	Split
SPV	Sepik Plains	PG	Sepik Plains
SPW	Municipal	US	Spencer
SPX	Spaceland	US	Houston
SPY	San Pedro	CI	San Pedro
SPZ	Springdale Muni	US	Springdale
SQA	Santa Ynez	US	Santa Ynez
SQB	Santa Ana	CO	Santa Ana
SQC	Southern Cross	AU	Southern Cross
SQD	Sinop	TR	Sinop
SQE	San Luis De Pale	CO	San Luis De Pale
SQF	Solano	CO	Solano
SQG	Sintang	ID	Sintang
SQH	Na-San	VN	Son-La
SQI	Whiteside County	US	Sterling Rockfalls
SQJ	Shehdi	ET	Shehdi
SQK	Sidi Barani	EG	Sidi Barani
SQL	San Carlos	US	San Carlos
SQM	São Miguel de Aragao	BR	São Miguel de Aragao
SQN	Sanana	ID	Sanana
SQO	Gunnarn	SE	Storuman
SQP	Starcke	AU	Starcke
SQQ	Siauliai International	LT	Siauliai
SQR	Inco Soroako Waws	ID	Soroako
SQS	Matthew Spain	BZ	San Ignacio
SQT	China Straits Airstrip	PG	Samarai Island
SQU	Saposoa	PE	Saposoa
SQV	Sequim Valley Arpt	US	Sequim
SQW	Skive Airport	DK	Skive
SQX	Sao Miguel do Oeste	BR	Sao Miguel do Oeste
SQY	Sao Lourenco Do Sul	BR	Sao Lourenco Do Sul
SQZ	RAF Station	GB	Scampton
SRA	Santa Rosa	BR	Santa Rosa
SRB	Santa Rosa	BO	Santa Rosa
SRC	Searcy	US	Searcy
SRD	San Ramon	BO	San Ramon
SRE	Juana Azurduy de Padilla	BO	Sucre
SRF	Hamilton Field	US	San Rafael
SRG	Achmad Yani	ID	Semarang
SRH	Sarh	TD	Sarh
SRI	Samarinda	ID	Samarinda
SRJ	Capitan G Q Guardia	BO	San Borja
SRK	Sierra Leone	SL	Sierra Leone
SRL	Santa Rosalia	MX	Santa Rosalia
SRM	Sandringham	AU	Sandringham
SRN	Strahan	AU	Strahan
SRO	Santana Ramos	CO	Santana Ramos
SRP	Stord Airport	NO	Stord
SRQ	Sarasota-Bradenton International Airport	US	Sarasota, FL
SRR	Dunwich	AU	Stradbroke Island
SRS	Cartagena	CO	San Marcos
SRT	Soroti	UG	Soroti
SRU	Skypark	US	Santa Cruz
SRV	Stony River	US	Stony River
SRW	Rowan County	US	Salisbury
SRX	Sert	LY	Sert
SRY	Dashte Naz	IR	Sary
SRZ	El Trompillo	BO	Santa Cruz
SSA	Luis Eduardo Magalhaes	BR	Salvador, Bahia
SSB	SPB	VI	St Croix Island
SSC	Shaw AFB	US	Sumter
SSD	San Felipe	CO	San Felipe
SSE	Sholapur	IN	Sholapur
SSF	Stinson Municipal	US	San Antonio
SSG	Malbo	GQ	Malabo
SSH	Ophira International	EG	Sharm El Sheikh
SSI	Malcolm Mckinnon	US	Brunswick, GA
SSJ	Stokka	NO	Sandnessjoen
SSK	Sturt Creek	AU	Sturt Creek
SSL	Santa Rosalia	CO	Santa Rosalia
SSO	Sao Lourenco	BR	Sao Lourenco
SSP	Silver Plains	AU	Silver Plains
SSQ	La Sarre	CA	La Sarre
SSR	Sara	VU	Sara
SSS	Siassi	PG	Siassi
SST	Santa Teresita	AR	Santa Teresita
SSU	Greenbrier	US	White Sulphur Springs
SSV	Siasi	PH	Siasi
SSW	Stuart Island	US	Stuart Island
SSX	Samsun	TR	Samsun/carsamba
SSZ	Santos	BR	Santos
STA	Stauning Vestjyllands Airport	DK	Skjern
STB	L Delicias	VE	Santa Barbara Ed
STC	Municipal	US	Saint Cloud
STD	Mayo Guerrero	VE	Santo Domingo
STE	Stevens Point	US	Stevens Point
STF	Stephen Island	AU	Stephen Island
STG	St George Island	US	St George Island
STH	Strathmore	AU	Strathmore
STI	Cibao International Airport	DO	Santiago
STJ	Rosecrans Memorial	US	St Joseph
STK	Crosson Field	US	Sterling
STL	Lambert-St. Louis International	US	St Louis
STM	Eduardo Gomes	BR	Santarem
STN	Stansted	GB	London
STP	Downtown	US	St Paul
STQ	St Marys	US	St Marys
STR	Stuttgart Echterdingen	DE	Stuttgart
STS	Sonoma County	US	Santa Rosa
STT	Cyril E King Airport	VI	Charlotte Amalie, St Thomas
STU	Santa Cruz	BZ	Santa Cruz
STV	Surat	IN	Surat
STW	Stavropol	RU	Stavropol
STX	Henry E Rohlsen	VI	St Croix Island
STY	Salto	UY	Salto
STZ	Confresa	BR	Santa Terezinha
SUA	Witham Field	US	Stuart
SUB	Juanda	ID	Surabaya
SUC	Schloredt	US	Sundance
SUD	Stroud	US	Stroud
SUE	Door County	US	Sturgeon Bay
SUF	S Eufemia	IT	Lamezia-terme
SUG	Surigao	PH	Surigao
SUH	Sur	OM	Sur
SUI	Babusheri	GE	Sukhumi
SUJ	Satu Mare	RO	Satu Mare
SUK	Samcheok	KR	Samcheok
SUL	Sui	PK	Sui
SUM	Municipal	US	Sumter
SUN	Sun Valley	US	Sun Valley
SUO	Sun River	US	Sun River
SUP	Trunojoyo	ID	Sumenep
SUQ	Sucua	EC	Sucua
SUR	Summer Beaver	CA	Summer Beaver
SUS	Spirit Of St Louis	US	St Louis
SUT	Sumbawanga	TZ	Sumbawanga
SUU	Travis AFB	US	Fairfield, CA
SUV	Nausori	FJ	Suva
SUW	Richard I Bong Arpt	US	Superior
SUX	Sioux Gateway	US	Sioux City
SUY	Sudureyri	IS	Sudureyri
SUZ	Suria	PG	Suria
SVA	Savoonga	US	Savoonga
SVB	Sambava	MG	Sambava
SVC	Grant County	US	Silver City
SVD	E. T. Joshua	VC	St Vincent
SVE	Susanville	US	Susanville
SVF	Save	BJ	Save
SVG	Sola	NO	Stavanger
SVH	Municipal	US	Statesville
SVI	San Vicente	CO	San Vicente
SVJ	Helle	NO	Svolvaer
SVK	Silver Creek	BZ	Silver Creek
SVL	Savonlinna	FI	Savonlinna
SVN	Hunter AAF	US	Savannah, GA
SVO	Sheremetyevo	RU	Moscow
SVP	Kuito (Silva Porto)	AO	Kuito
SVQ	San Pablo	ES	Sevilla
SVR	Svay Rieng	KH	Svay Rieng
SVS	Stevens Village	US	Stevens Village
SVT	Savuti	BW	Savuti
SVU	Savusavu	FJ	Savusavu
SVV	San Salvador De	VE	San Salvador De
SVW	Sparrevohn AFS	US	Sparrevohn
SVX	Koltsovo International Airport	RU	Ekaterinburg
SVY	Savo	SB	Savo
SVZ	San Antonio	VE	San Antonio
SWA	Shantou	CN	Shantou
SWB	Shaw River	AU	Shaw River
SWC	Stawell	AU	Stawell
SWD	Seward	US	Seward
SWE	Siwea	PG	Siwea
SWF	Stewart	US	Newburgh
SWG	Satwag	PG	Satwag
SWH	Swan Hill	AU	Swan Hill
SWI	Gypsy	GB	Swindon
SWJ	South West Bay	VU	South West Bay
SWK	Segrate	IT	Milan
SWL	Spanish Wells	BS	Spanish Wells
SWM	Suia-Missu	BR	Suia-Missu
SWN	Sahiwal	PK	Sahiwal
SWO	Searcy Fld	US	Stillwater
SWP	Swakopmund	NA	Swakopmund
SWQ	Brang Bidji	ID	Sumbawa
SWR	Silur	PG	Silur
SWS	Fairwood Comm	GB	Swansea
SWT	Strzhewoi	RU	Strzhewoi
SWU	Suwon	KR	Suwon
SWV	Shikarpur	PK	Shikarpur
SWW	Sweetwater	US	Sweetwater
SWX	Shakawe	BW	Shakawe
SWY	Sitiawan	MY	Sitiawan
SWZ	Sydney West	AU	Sydney
SXA	Sialum	PG	Sialum
SXB	Entzheim	FR	Strasbourg
SXC	Avalo Vor/WP	US	Catalina Island
SXD	Sophia Antipolis	FR	Sophia Antipolis
SXE	Sale	AU	Sale
SXF	Berlin-Schoenefeld	DE	Berlin
SXG	Senanga	ZM	Senanga
SXH	Sehulea	PG	Sehulea
SXI	Sirri Island	IR	Sirri Island
SXJ	Shanshan	CN	Shanshan
SXK	Saumlaki	ID	Saumlaki
SXL	Sligo	IE	Sligo
SXM	Princess Juliana International	AN	Philipsburg, St. Maarten
SXN	Suapan	BW	Suapan
SXO	Sao Felix Do Araguaia	BR	Sao Felix Do Araguaia
SXP	Sheldon SPB	US	Sheldon Point
SXQ	Soldotna	US	Soldotna
SXR	Srinagar	IN	Srinagar
SXS	Sahabat 16	MY	Sahabat 16
SXT	Taman Negara	MY	Taman Negara
SXU	Soddu	ET	Soddu
SXV	Salem	IN	Salem
SXW	Sauren	PG	Sauren
SXX	Sao Felix Do Xingu	BR	Sao Felix Do Xingu
SXY	Sidney	US	Sidney
SXZ	Siirt	TR	Siirt
SYA	Shemya AFB	US	Shemya
SYB	Seal Bay	US	Seal Bay
SYC	Shiringayoc	PE	Shiringayoc
SYD	Kingsford Smith	AU	Sydney
SYE	Sadah	YE	Sadah
SYF	Silva Bay	CA	Silva Bay
SYG	Spitsberg	NO	Svalbard
SYH	Syangboche	NP	Syangboche
SYI	Bomar Field	US	Shelbyville
SYJ	Sirjan	IR	Sirjan
SYK	Stykkisholmur	IS	Stykkisholmur
SYL	Roberts AAF	US	San Miguel
SYM	Simao	CN	Simao
SYN	Carleton	US	Stanton
SYO	Shonai	JP	Shonai
SYP	Santiago	PA	Santiago
SYQ	Tobias Bolaños International	CR	San José
SYR	Syracuse Hancock International Airport	US	Syracuse
SYS	Yeosu	KR	Suncheon
SYT	Charolais Bourgogne S.	FR	Saint Yan
SYU	Warraber Island	AU	Sue Island
SYV	Sylvester	US	Sylvester
SYW	Sehwen Sharif	PK	Sehwen Sharif
SYX	Fenghuang International (Phoenix International)	CN	Sanya
SYY	Stornoway	GB	Stornoway
SYZ	Shahid Dastghaib International	IR	Shiraz
SZA	Soyo	AO	Soyo
SZB	Sultan Abdul Aziz Shah	MY	Kuala Lumpur
SZC	Guanacaste	CR	Santa Cruz
SZD	Sheffield City	GB	Sheffield
SZE	Semera Airport	ET	Semera
SZF	Carsamba	TR	Samsun
SZG	W. A. Mozart	AT	Salzburg
SZH	Senipah	ID	Senipah
SZI	Zaisan	KZ	Zaisan
SZJ	Siguanea	CU	Siguanea
SZK	Skukuza	ZA	Skukuza
SZL	Whiteman AFB	US	Kansas
SZM	Sesriem	NA	Sesriem
SZN	Santa Cruz Island	US	Santa Barbara
SZO	Shanzhou	CN	Shanzhou
SZP	Oxnard	US	Santa Paula
SZQ	Saenz Pena	AR	Saenz Pena
SZR	Stara Zagora	BG	Stara Zagora
SZS	Stewart Island	NZ	Stewart Island
SZT	San Cristobal Airport	MX	S.Cristobal deL Casas
SZU	Segou	ML	Segou
SZV	Suzhou	CN	Suzhou
SZW	Parchim Airport	DE	Schwerin
SZX	Shenzhen	CN	Shenzhen
SZY	Mazury	PL	Szymany
SZZ	Goleniow	PL	Szczecin
TAA	Tarapaina	SB	Tarapaina
TAB	Crown Point Airport	TT	Tobago
TAC	D.Z. Romualdez	PH	Tacloban
TAD	Las Animas	US	Trinidad
TAE	Daegu	KR	Daegu
TAF	Tafaraoui	DZ	Oran
TAG	Tagbilaran	PH	Tagbilaran
TAH	Tanna	VU	Tanna
TAI	Al Janad	YE	Taiz
TAJ	Tadji	PG	Aitape
TAK	Takamatsu	JP	Takamatsu
TAL	Ralph Calhoun	US	Tanana
TAM	Gen F Javier Mina	MX	Tampico
TAN	Tangalooma	AU	Tangalooma
TAO	Qingdao	CN	Qingdao
TAP	Tapachula International	MX	Tapachula
TAQ	Tarcoola	AU	Tarcoola
TAR	M. A. Grottag	IT	Taranto
TAS	Yuzhny	UZ	Tashkent
TAT	Poprad/tatry	SK	Poprad
TAU	Tauramena	CO	Tauramena
TAV	Tau Island Airport	AS	Fiti'Uta Village
TAW	Tacuarembo	UY	Tacuarembo
TAX	Taliabu	ID	Taliabu
TAY	Tartu	EE	Tartu
TAZ	Dashoguz	TM	Dashoguz
TBA	Tabibuga	PG	Tabibuga
TBB	Tuy Hoa	VN	Tuy Hoa
TBC	Tuba City	US	Tuba City
TBD	Timbiqui	CO	Timbiqui
TBE	Timbunke	PG	Timbunke
TBF	Tabiteuea North	KI	Tabiteuea North
TBG	Tabubil	PG	Tabubil
TBH	Romblon	PH	Tablas
TBI	New Bright	BS	The Bight
TBJ	Tabarka	TN	Tabarka
TBK	Timber Creek	AU	Timber Creek
TBL	Tableland	AU	Tableland
TBM	Tumbang Samba	ID	Tumbang Samba
TBN	Forney AAF	US	Fort Leonard Wood
TBO	Tabora	TZ	Tabora
TBP	Tumbes	PE	Tumbes
TBQ	Tarabo	PG	Tarabo
TBR	Statesboro-Bulloch County Airport	US	Statesboro, GA
TBS	Lochini (Novo Alexeyevka)	GE	Tbilisi
TBT	Internacional	BR	Tabatinga
TBU	Fua'amotu International	TO	Nuku'alofa
TBV	Tabal	MH	Tabal
TBW	Tambov	RU	Tambov
TBX	Taabo	CI	Taabo
TBY	Tsabong	BW	Tsabong
TBZ	Tabriz	IR	Tabriz
TCA	Tennant Creek	AU	Tennant Creek
TCB	Treasure Cay	BS	Treasure Cay, Ibaco Islands
TCC	Tucumcari	US	Tucumcari
TCD	Tarapaca	CO	Tarapaca
TCE	Tulcea	RO	Tulcea
TCF	Tocoa	HN	Tocoa
TCG	Tacheng	CN	Tacheng
TCH	Tchibanga	GA	Tchibanga
TCJ	Torembi Airport	PG	Torembi
TCK	Tinboli Airport	PG	Tinboli
TCL	Van De Graaf	US	Tuscaloosa, AL
TCM	McChord AFB	US	Tacoma, WA
TCN	Tehuacan	MX	Tehuacan
TCO	La Florida	CO	Tumaco
TCP	Taba International	EG	Taba
TCQ	Tacna	PE	Tacna
TCR	Tuticorin	IN	Tuticorin
TCS	Municipal	US	Truth Or Consequences
TCT	Takotna	US	Takotna
TCU	Thaba Nchu	ZA	Thaba Nchu
TCV	Tete	MZ	Tete
TCW	Tocumwal	AU	Tocumwal
TCX	Tabas	IR	Tabas
TCY	Terrace Bay	NA	Terrace Bay
TDA	Trinidad	CO	Trinidad
TDB	Tetabedi	PG	Tetabedi
TDD	Trinidad	BO	Trinidad
TDG	Tandag	PH	Tandag
TDJ	Tadjoura	DJ	Tadjoura
TDK	Taldy-Kurgan	KZ	Taldy-Kurgan
TDL	Tandil	AR	Tandil
TDN	Theda Station	AU	Theda
TDO	Winlock	US	Toledo
TDR	Theodore	AU	Theodore
TDS	Sasereme	PG	Sasereme
TDT	Tanda Tula	ZA	Tanda Tula
TDV	Tanandava	MG	Tanandava
TDW	Tradewind	US	Amarillo
TDX	Trat	TH	Trat
TDZ	Toledo	US	Toledo
TEA	Tela	HN	Tela
TEB	Teterboro	US	Teterboro
TEC	Telemaco Borba	BR	Telemaco Borba
TED	Thisted	DK	Thisted
TEE	Tbessa	DZ	Tbessa
TEF	Telfer	AU	Telfer
TEG	Tenkodogo	BF	Tenkodogo
TEH	Tetlin	US	Tetlin
TEI	Tezu	IN	Tezu
TEK	Tatitlek	US	Tatitlek
TEL	Telupid	MY	Telupid
TEM	Temora	AU	Temora
TEN	Tongren	CN	Tongren
TEO	Terapo	PG	Terapo
TEP	Teptep	PG	Teptep
TEQ	Corlu	TR	Tekirdag
TER	Lajes Ab	PT	Terceira Island
TES	Tessenei	ER	Tessenei
TET	Matundo	MZ	Tete
TEU	Manapouri	NZ	Te Anau
TEW	Tohid	IR	Tohid
TEX	Telluride	US	Telluride
TEY	Thingeyri	IS	Thingeyri
TEZ	Salonibari	IN	Tezpur
TFB	Tifalmin	PG	Tifalmin
TFC	Taormina Harbour	IT	Taormina
TFF	Tefe	BR	Tefe
TFI	Tufi	PG	Tufi
TFL	Teofilo Otoni	BR	Teofilo Otoni
TFM	Telefomin	PG	Telefomin
TFN	Tenerife Norte (Los Rodeos)	ES	Tenerife
TFR	Ramadan	EG	Ramadan
TFS	Sur Reina Sofia	ES	Tenerife
TFT	Taftan	PK	Taftan
TFY	Tarfaya	MA	Tarfaya
TGB	Tagbita	PH	Tagbita
TGD	Golubovci	ME	Podgorica
TGE	Sharpe Field	US	Tuskegee
TGF	Tignes	FR	Tignes
TGG	Sultan Mahmood	MY	Kuala Terengganu
TGH	Tongoa	VU	Tongoa
TGI	Tingo Maria	PE	Tingo Maria
TGJ	Tiga	NC	Tiga
TGL	Tagula	PG	Tagula
TGM	Transilvania	RO	Tirgu Mures
TGN	La Trobe Regional	AU	Traralgon
TGO	Tongliao	CN	Tongliao
TGQ	Tangara da Serra	BR	Tangara da Serra
TGR	Touggourt	DZ	Touggourt
TGS	Chokwe	MZ	Chokwe
TGT	Tanga	TZ	Tanga
TGU	Toncontin	HN	Tegucigalpa
TGV	Targovishte	BG	Targovishte
TGX	Tingrela	CI	Tingrela
TGZ	Llano San Juan	MX	Tuxtla Gutierrez
THA	Tullahoma/William Northern Field	US	Tullahoma, TN
THB	Thaba-Tseka	LS	Thaba-Tseka
THC	Tchien	LR	Tchien
THE	Senador Petrônio Portella	BR	Teresina
THF	Tempelhof	DE	Berlin
THG	Thangool	AU	Thangool
THH	Taharoa	NZ	Taharoa
THI	Tichitt	MR	Tichitt
THK	Thakhek	LA	Thakhek
THL	Tachilek	MM	Tachilek
THM	Thompsonfield	US	Thompsonfield
THN	Trollhattan	SE	Trollhattan
THO	Thorshofn	IS	Thorshofn
THP	Hot Springs	US	Thermopolis
THR	Mehrabad (Qualeh Morgeh)	IR	Tehran
THS	Sukhothai	TH	Sukhothai (sawankolok)
THT	Tamchakett	MR	Tamchakett
THU	Pituffik	GL	Pituffik
THV	York Airport	US	York
THY	Thohoyandou	ZA	Thohoyandou
THZ	Tahoua	NE	Tahoua
TIA	Rinas Mother Teresa	AL	Tirana
TIB	Tibu	CO	Tibu
TIC	Tinak Island	MH	Tinak Island
TID	Bouchekif Abde Al-hafidh Boussof	DZ	Tiaret
TIE	Tippi	ET	Tippi
TIF	Taif	SA	Taif
TIG	Tingwon	PG	Tingwon
TIH	Tikehau Atoll	PF	Tikehau Atoll
TII	Tirinkot	AF	Tirinkot
TIJ	General A. L. Rodriguez Intl	MX	Tijuana
TIK	Tinker AFB	US	Oklahoma City
TIL	Inverlake	CA	Inverlake
TIM	Timika	ID	Tembagapura
TIN	Tindouf	DZ	Tindouf
TIO	Tilin	MM	Tilin
TIP	International	LY	Tripoli
TIQ	Tinian International	MP	Tinian
TIR	Tirupati	IN	Tirupati
TIS	Thursday Island	AU	Thursday Island
TIU	Timaru	NZ	Timaru
TIV	Tivat	ME	Tivat
TIW	Industrial	US	Tacoma
TIX	Space Coast Regional	US	Titusville, FL
TIY	Tidjikja	MR	Tidjikja
TIZ	Tari	PG	Tari
TJA	Tarija	BO	Tarija
TJB	Tanjung Balai	ID	Tanjung Balai
TJC	Ticantiki	PA	Ticantiki
TJG	Tanjung Warukin	ID	Tanjung Warukin
TJH	Tajima	JP	Toyooka
TJI	Capiro	HN	Trujillo
TJK	Tokat	TR	Tokat
TJM	Roschino	RU	Tyumen
TJN	Takume	PF	Takume
TJQ	Bulutumbang	ID	Tanjung Pandan
TJS	Tanjung Selor	ID	Tanjung Selor
TJV	Thanjavur	IN	Thanjavur
TKA	Talkeetna	US	Talkeetna
TKB	Tekadu	PG	Tekadu
TKC	Tiko	CM	Tiko
TKD	Takoradi	GH	Takoradi
TKE	Tenakee SPB	US	Tenakee Springs
TKF	Truckee-Tahoe	US	Truckee, CA
TKG	Branti	ID	Bandar Lampung
TKH	Nakhon Sawan	TH	Takhli
TKI	Tokeen	US	Tokeen
TKJ	Tok	US	Tok
TKK	Truk	FM	Truk
TKL	Taku SPB	US	Taku Lodge
TKM	El Peten	GT	Tikal
TKN	Tokunoshima	JP	Tokunoshima
TKO	Tlokoeng	LS	Tlokoeng
TKP	Takapoto	PF	Takapoto
TKQ	Kigoma	TZ	Kigoma
TKR	Thakurgaon	BD	Thakurgaon
TKS	Tokushima	JP	Tokushima
TKT	Tak	TH	Tak
TKU	Turku	FI	Turku
TKV	Tatakoto	PF	Tatakoto
TKW	Tekin	PG	Tekin
TKX	Takaroa	PF	Takaroa
TKY	Turkey Creek	AU	Turkey Creek
TKZ	Tokoroa	NZ	Tokoroa
TLA	Teller	US	Teller
TLB	Tarbela	PK	Tarbela
TLC	Licenciado Adolfo Lopez Mateos International	MX	Toluca
TLD	Limpopo Valley	BW	Tuli Block
TLE	Tulear	MG	Tulear
TLF	Telida	US	Telida
TLG	Tulagi Island	SB	Tulagi Island
TLH	Tallahassee Regional Airport	US	Tallahassee
TLI	Tolitoli	ID	Tolitoli
TLJ	Tatalina AFS	US	Tatalina
TLK	Talknafjordur	IS	Talknafjordur
TLL	Ulemiste	EE	Tallinn
TLM	Zenata	DZ	Tlemcen
TLN	Le Palyvestre	FR	Hyeres
TLO	Tol	PG	Tol
TLP	Tumolbil	PG	Tumolbil
TLR	Mefford Field	US	Tulare, CA
TLS	Blagnac	FR	Toulouse
TLT	Tuluksak	US	Tuluksak
TLU	Tolu	CO	Tolu
TLV	Ben Gurion Intl	IL	Tel Aviv Yafo
TLW	Talasea	PG	Talasea
TLX	Talca	CL	Talca
TLZ	Catalao	BR	Catalao
TMA	Henry Tift Myers	US	Tifton, GA
TMB	Tamiami	US	Miami
TMC	Tjilik Riwut	ID	Tambolaka
TMD	Timbedra	MR	Timbedra
TME	Tame	CO	Tame
TMG	Tomanggong	MY	Tomanggong
TMH	Tanahmerah	ID	Tanahmerah
TMI	Tumling Tar	NP	Tumling Tar
TMJ	Termez	UZ	Termez
TMK	Tamky	VN	Tamky
TML	Tamale	GH	Tamale
TMM	Tamatave	MG	Tamatave
TMN	Tamana Island	KI	Tamana Island
TMO	Tumeremo	VE	Tumeremo
TMP	Tampere-pirkkala	FI	Tampere
TMQ	Tambao	BF	Tambao
TMR	Aguemar	DZ	Tamanrasset
TMS	Sao Tome Is	ST	Sao Tome Is
TMT	Trombetas	BR	Trombetas
TMU	Tambor	CR	Tambor
TMW	Tamworth Regional Airport	AU	Tamworth
TMX	Timimoun	DZ	Timimoun
TMY	Tiom	ID	Tiom
TMZ	Thames	NZ	Thames
TNA	Jinan	CN	Jinan
TNB	Tanah Grogot	ID	Tanah Grogot
TNC	Tin City Afs	US	Tin City, AK
TND	Trinidad	CU	Trinidad
TNE	Tanegashima	JP	Tanegashima
TNF	Toussus-le-noble	FR	Toussus-Le-Noble
TNG	Boukhalef	MA	Tangier
TNH	Tonghua Liuhe	CN	Tonghua
TNI	Satna	IN	Satna
TNJ	Kidjang	ID	Tanjung Pinang
TNK	Tununak	US	Tununak
TNL	Ternopol	UA	Ternopol
TNM	Teniente R. Marsh Martin	AQ	Teniente R. Marsh Martin
TNN	Tainan	TW	Tainan
TNO	Tamarindo	CR	Tamarindo
TNP	Twentynine Palms	US	Twentynine Palms
TNQ	Teraina	KI	Teraina
TNR	Antananarivo	MG	Antananarivo
TNS	Tungsten	CA	Tungsten
TNT	Dade Collier	US	Miami
TNU	Municipal	US	Newton
TNV	Tabuaeran	KI	Tabuaeran
TNX	Stung Treng	KH	Stung Treng
TNZ	Tosontsengel	MN	Tosontsengel
TOA	Torrance Airport	US	Torrance
TOB	Tobruk	LY	Tobruk
TOC	Toccoa	US	Toccoa
TOD	Tioman	MY	Tioman
TOE	Tozeur	TN	Tozeur
TOF	Tomsk	RU	Tomsk
TOG	Togiak Village	US	Togiak Village
TOH	Torres Airstrip	VU	Torres
TOI	Municipal	US	Troy
TOJ	Torrejon Afb	ES	Madrid
TOK	Torokina	PG	Torokina
TOL	Toledo Express	US	Toledo, OH
TOM	Tombouctou	ML	Tombouctou
TON	Tonu	PG	Tonu
TOO	San Vito	CR	San Vito
TOP	Philip Billard	US	Topeka
TOQ	Barriles	CL	Tocopilla
TOR	Municipal	US	Torrington
TOS	Tromso/langnes	NO	Tromso
TOT	Coronie	SR	Totness
TOU	Touho	NC	Touho
TOV	West End SPB	VG	Tortola
TOW	Toledo	BR	Toledo
TOX	Tobolsk	RU	Tobolsk
TOY	Toyama	JP	Toyama
TOZ	Touba	CI	Touba
TPA	Tampa International	US	Tampa
TPC	Tarapoa	EC	Tarapoa
TPE	Taiwan Taoyuan International (Chiang Kai Shek International)	TW	Taipei
TPG	Taiping	MY	Taiping
TPH	Tonopah Arpt	US	Tonopah
TPI	Tapini	PG	Tapini
TPJ	Taplejung Suketar	NP	Taplejung
TPK	Tapaktuan	ID	Tapaktuan
TPL	Draughon-miller Central Texas Regional	US	Temple, TX
TPN	Tiputini	EC	Tiputini
TPO	Tanalian Point	US	Tanalian Point
TPP	Tarapoto	PE	Tarapoto
TPQ	Tepic	MX	Tepic
TPR	Tom Price	AU	Tom Price
TPS	Birgi	IT	Trapani
TPT	Tapeta	LR	Tapeta
TPU	Tikapur	NP	Tikapur
TPX	Tupai	PF	Tupai
TQN	Taluqan	AF	Taluqan
TQR	San Domino Island	IT	San Domino Island
TQS	Tres Esquinas	CO	Tres Esquinas
TRA	Tarama	JP	Taramajima
TRB	Gonzalo	CO	Turbo
TRC	Francisco Sarabia	MX	Torreon
TRD	Værnes	NO	Trondheim
TRE	Tiree	GB	Tiree
TRF	Sandefjord	NO	Torp
TRG	Tauranga	NZ	Tauranga
TRH	Trona	US	Trona
TRI	Tri-cities Regional	US	Blountville
TRJ	Tarakbits	PG	Tarakbits
TRK	Juwata	ID	Tarakan
TRL	Terrell Field	US	Terrell
TRM	Thermal	US	Thermal
TRN	Sandro Pertini (caselle)	IT	Turin
TRO	Taree	AU	Taree
TRP	Coast Guard Heliport	US	Tree Point
TRQ	Tarauaca	BR	Tarauaca
TRR	China Bay	LK	Trincomalee
TRS	Ronchi Dei Legionari	IT	Trieste
TRT	Tremonton	US	Tremonton
TRU	Trujillo	PE	Trujillo
TRV	Thiruvananthapuram International	IN	Trivandrum
TRW	Bonriki	KI	Tarawa
TRX	Memorial	US	Trenton
TRY	Tororo	UG	Tororo
TRZ	Civil	IN	Tiruchirapally
TSA	Taipei Songshan (Sung Shan)	TW	Taipei
TSB	Tsumeb	NA	Tsumeb
TSC	Taisha	EC	Taisha
TSD	Tshipise	ZA	Tshipise
TSE	Astana	KZ	Astana
TSF	S. Angelo	IT	Treviso
TSG	Intermediate	US	Tanacross
TSH	Tshikapa	CD	Tshikapa
TSI	Tsili Tsili	PG	Tsili Tsili
TSJ	Tsushima	JP	Tsushima
TSK	Taskul	PG	Taskul
TSL	Tamuin	MX	Tamuin
TSM	Taos	US	Taos
TSN	Tianjin Binhai International	CN	Tianjin
TSO	Tresco	GB	Isles Of Scilly
TSP	Kern County	US	Tehachapi, CA
TSQ	Torres	BR	Torres
TSR	Timisoara (traian Vuia) International	RO	Timisoara
TSS	East 34th St Heliport	US	New York
TST	Trang	TH	Trang
TSU	Tabiteuea South	KI	Tabiteuea South
TSV	Townsville International	AU	Townsville
TSW	Tsewi	PG	Tsewi
TSX	Tanjung Santan	ID	Tanjung Santan
TSY	Tasikmalaya	ID	Tasikmalaya
TSZ	Tsetserleg	MN	Tsetserleg
TTA	Tan Tan	MA	Tan Tan
TTB	Arbatax	IT	Tortoli
TTC	Taltal	CL	Taltal
TTD	Troutdale	US	Troutdale
TTE	Babullah	ID	Ternate
TTG	Tartagal	AR	Tartagal
TTH	Thumrait	OM	Thumrait
TTI	Tetiaroa Is	PF	Tetiaroa Is
TTJ	Tottori	JP	Tottori
TTL	Turtle Island	FJ	Turtle Island
TTM	Tablon De Tamara	CO	Tablon De Tamara
TTN	Trenton Mercer Airport	US	Trenton, NJ
TTO	Municipal	US	Britton
TTQ	Tortuquero	CR	Tortuquero
TTR	Tana Toraja	ID	Tana Toraja
TTS	Tsaratanana	MG	Tsaratanana
TTT	Taitung	TW	Taitung
TTU	Sania Ramel	MA	Tetuan
TUA	Tulcan	EC	Tulcan
TUB	Tubuai	PF	Tubuai
TUC	Benj Matienzo	AR	Tucuman
TUD	Tambacounda	SN	Tambacounda
TUE	Tupile	PA	Tupile
TUF	St Symphorien	FR	Tours
TUG	Tuguegarao	PH	Tuguegarao
TUH	Arnold AFS	US	Tullahoma
TUI	Turaif	SA	Turaif
TUJ	Tum	ET	Tum
TUK	Turbat International Airport	PK	Turbat
TUL	Tulsa International	US	Tulsa
TUM	Tumut	AU	Tumut
TUN	Carthage	TN	Tunis
TUO	Taupo	NZ	Taupo
TUP	Lemons Municipal	US	Tupelo
TUQ	Tougan	BF	Tougan
TUR	Tucurui	BR	Tucurui
TUS	Tucson International Airport	US	Tucson, AZ
TUT	Tauta	PG	Tauta
TUU	Tabuk	SA	Tabuk
TUV	Tucupita	VE	Tucupita
TUW	Tubala	PA	Tubala
TUX	Tumbler Ridge	CA	Tumbler Ridge
TUY	Tulum	MX	Tulum
TUZ	Tucuma	BR	Tucuma
TVA	Morafenobe	MG	Morafenobe
TVC	Cherry Capital Airport	US	Traverse City
TVF	Regional	US	Thief River Falls
TVI	Municipal	US	Thomasville
TVL	South Lake Tahoe	US	South Lake Tahoe
TVU	Matei	FJ	Taveuni
TVY	Dawe	MM	Dawe
TWA	Twin Hills	US	Twin Hills
TWB	Toowoomba	AU	Toowoomba
TWD	Port Townsend	US	Port Townsend
TWE	Taylor	US	Taylor
TWF	Joslin Field - Magic Valley Regional	US	Twin Falls, ID
TWH	Two Harbors	US	Catalina Island
TWN	Tewantin	AU	Tewantin
TWP	Torwood	AU	Torwood
TWT	Tawitawi	PH	Tawitawi
TWU	Tawau	MY	Tawau
TWY	Tawa	PG	Tawa
TWZ	Pukaki/Twizel	NZ	Mount Cook
TXF	Teixeira de Freitas	BR	Teixeira de Freitas
TXG	Taichung	TW	Taichung
TXK	Municipal	US	Texarkana
TXL	Berlin-tegel / Otto Lilienthal	DE	Berlin
TXM	Teminabuan	ID	Teminabuan
TXN	Tunxi	CN	Tunxi
TXR	Tanbar	AU	Tanbar
TXU	Tabou	CI	Tabou
TYA	Tula	RU	Tula
TYB	Tibooburra	AU	Tibooburra
TYD	Tynda	RU	Tynda
TYE	Tyonek	US	Tyonek
TYF	Torsby Airport	SE	Torsby
TYG	Thylungra	AU	Thylungra
TYL	Talara	PE	Talara
TYM	Staniel Cay	BS	Staniel Cay
TYN	Taiyuan	CN	Taiyuan
TYP	Tobermorey	AU	Tobermorey
TYR	Tyler Pounds Regional Airport	US	Tyler
TYS	Mc Ghee Tyson	US	Knoxville
TYT	Treinta-y-Tres	UY	Treinta-y-Tres
TYZ	Taylor	US	Taylor
TZA	Municipal	BZ	Belize City
TZL	Tuzla International	BA	Tuzla
TZM	Tizimin	MX	Tizimin
TZN	South Andros	BS	South Andros
TZX	Trabzon	TR	Trabzon
UAB	Adana-Incirlik Airbase	TR	Adana
UAC	San Luis Rio Colorado	MX	San Luis Rio Colorado
UAE	Mount Aue	PG	Mount Aue
UAH	Ua Huka	PF	Ua Huka
UAI	Suai	ID	Suai
UAK	Narsarsuaq	GL	Narsarsuaq
UAL	Luau	AO	Luau
UAM	Andersen AFB	GU	Andersen, Mariana Island
UAP	Ua Pou	PF	Ua Pou
UAQ	San Juan	AR	San Juan
UAS	Samburu	KE	Samburu
UAX	Uaxactun	GT	Uaxactun
UBA	Uberaba	BR	Uberaba
UBB	Mabuiag Island	AU	Mabuiag Island
UBI	Buin	PG	Buin
UBJ	Ube	JP	Ube
UBP	Muang Ubon	TH	Ubon Ratchathni
UBR	Ubrub	ID	Ubrub
UBS	Lowndes County	US	Columbus
UBT	Ubatuba	BR	Ubatuba
UBU	Kalumburu	AU	Kalumburu
UCA	Oneida County	US	Utica
UCC	Yucca Flat	US	Yucca Flat
UCE	Eunice	US	Eunice
UCK	Lutsk	UA	Lutsk
UCN	Buchanan	LR	Buchanan
UCT	Ukhta	RU	Ukhta
UCY	Everett-Stewart	US	Union City
UDA	Undarra	AU	Undarra
UDD	Bermuda Dunes	US	Palm Springs
UDE	Volkel	NL	Uden
UDI	Eduardo Gomes	BR	Uberlandia
UDJ	Uzhgorod	UA	Uzhgorod
UDN	Airfield	IT	Udine
UDO	Udomxay	LA	Udomxay
UDR	Dabok	IN	Udaipur
UEE	Queenstown	AU	Queenstown
UEL	Quelimane	MZ	Quelimane
UEO	Kumejima	JP	Kumejima
UER	Puertollano	ES	Puertollano
UES	Waukesha	US	Waukesha
UET	Quetta	PK	Quetta
UFA	Ufa	RU	Ufa
UGA	Bulgan	MN	Bulgan
UGB	Ugashik Bay	US	Pilot Point
UGC	Urgench	UZ	Urgench
UGI	Uganik	US	Uganik
UGN	Memorial	US	Waukegan
UGO	Uige	AO	Uige
UGS	Ugashik	US	Ugashik
UGT	Umnugobitour	MN	Umnugobitour
UGU	Zugapa	ID	Zugapa
UHE	Kunovice	CZ	Uherske Hradiste
UHF	RAF Station	GB	Upper Heyford
UIB	Quibdo	CO	Quibdo
UIH	Qui Nhon	VN	Qui Nhon
UII	Utila	HN	Utila
UIK	Ust-Ilimsk	RU	Ust-Ilimsk
UIL	Quillayute State	US	Quillayute
UIN	Municipal	US	Quincy
UIO	Mariscal Sucre	EC	Quito
UIP	Pluguffan	FR	Quimper
UIQ	Quine Hill	VU	Quine Hill
UIR	Quirindi	AU	Quirindi
UIT	Jaluit Island	MH	Jaluit Island
UJE	Ujae Island	MH	Ujae Island
UKA	Ukunda	KE	Ukunda
UKB	Kobe	JP	Kobe
UKI	Ukiah	US	Ukiah
UKK	Ust-kamenogorsk	KZ	Ust-kamenogorsk
UKN	Municipal	US	Waukon
UKR	Mukeiras	YE	Mukeiras
UKS	Belbek	UA	Sevastopol
UKT	Upper Bucks	US	Quakertown
UKU	Nuku	PG	Nuku
UKX	Ust-Kut	RU	Ust-Kut
UKY	Kansai	JP	Kyoto
ULA	San Julian	AR	San Julian
ULB	Ulei	VU	Ulei
ULC	Los Cerrillos	CL	Santiago
ULD	Ulundi	ZA	Ulundi
ULE	Sule	PG	Sule
ULG	Ulgit	MN	Ulgit
ULI	Ulithi	FM	Ulithi
ULL	Mull	GB	Mull
ULM	New Ulm	US	New Ulm
ULN	Chinggis Khaan International	MN	Ulaanbaatar
ULO	Ulaangom	MN	Ulaangom
ULP	Quilpie	AU	Quilpie
ULQ	Farfan	CO	Tulua
ULS	Mulatos	CO	Mulatos
ULU	Gulu	UG	Gulu
ULX	Ulusaba	ZA	Ulusaba
ULY	Vostochny	RU	Ulyanovsk
ULZ	Uliastai	MN	Uliastai
UMA	Punta De Maisi	CU	Punta De Maisi
UMB	North Shore	US	Umnak Island
UMC	Umba	PG	Umba
UMD	Uummannaq	GL	Uummannaq
UME	Umea	SE	Umea
UMI	Quincemil	PE	Quincemil
UMM	Summit	US	Summit
UMR	Woomera	AU	Woomera
UMT	Umiat	US	Umiat
UMU	Ernesto Geisel	BR	Umuarama
UMY	Sumy	UA	Sumy
UNA	Una	BR	Una
UNC	Unguia	CO	Unguia
UND	Kunduz	AF	Kunduz
UNE	Qachas Nek	LS	Qachas Nek
UNG	Kiunga	PG	Kiunga
UNI	Union Island	VC	Union Island
UNK	Unalakleet	US	Unalakleet
UNN	Ranong	TH	Ranong
UNR	Underkhaan	MN	Underkhaan
UNS	Umnak	US	Umnak Island
UNT	Baltasound	GB	Unst Shetland Is
UNU	Dodge County	US	Juneau, WI
UOL	Buol	ID	Buol
UON	Muong Sai	LA	Muong Sai
UOS	Franklin County	US	Sewanee
UOX	University-Oxford	US	Oxford
UPA	Punta Alegre	CU	Punta Alegre
UPB	Playa Baracoa	CU	Havana
UPC	Puerto La Cruz	VE	Puerto La Cruz
UPF	Pforheim	DE	Pforheim
UPG	Hasanudin	ID	Ujung Pandang
UPL	Upala	CR	Upala
UPN	Uruapan	MX	Uruapan
UPP	Upolu Point	US	Upolu Point
UPR	Upiara	PG	Upiara
UPV	Upavon	GB	Upavon
UQE	Queen	US	Queen
URA	Uralsk / Podstepnyy	KZ	Uralsk
URB	Ernesto Pochler	BR	Urubupunga
URC	Urumqi	CN	Urumqi
URD	Burg Feuerstein	DE	Burg Feuerstein
URE	Kuressaare	EE	Kuressaare
URG	Ruben Berta	BR	Uruguaiana
URI	Uribe	CO	Uribe
URJ	Uraj	RU	Uraj
URM	Uriman	VE	Uriman
URN	Urgoon	AF	Urgoon
URO	Boos	FR	Rouen
URR	Urrao	CO	Urrao
URS	Kursk	RU	Kursk
URT	Surat Thani	TH	Surat Thani
URU	Uroubi	PG	Uroubi
URY	Gurayat	SA	Gurayat
URZ	Uruzgan	AF	Uruzgan
USH	Islas Malvinas Argentinas International	AR	Ushuaia, Tierra del Fuego
USI	Mabaruma	GY	Mabaruma
USK	Usinsk	RU	Usinsk
USL	Useless Loop	AU	Useless Loop
USM	Koh Samui	TH	Koh Samui
USN	Ulsan	KR	Ulsan
USO	Usino	PG	Usino
USQ	Usak	TR	Usak
USS	Sancti Spiritus	CU	Sancti Spiritus
UST	St Augustine	US	St Augustine
USU	Puerto Princessa	PH	Busuanga
UTA	Mutare	ZW	Mutare
UTB	Muttaburra	AU	Muttaburra
UTC	Soesterberg	NL	Utrecht
UTD	Nutwood Downs	AU	Nutwood Downs
UTE	Butterworth	ZA	Butterworth
UTG	Quthing	LS	Quthing
UTH	Udon Thani	TH	Udon Thani
UTI	Utti	FI	Valkeala
UTK	Utirik Island	MH	Utirik Island
UTL	Torremolinos	ES	Torremolinos
UTM	Tunica Municipal Airport	US	Tunica, MS
UTN	Upington	ZA	Upington
UTO	Indian Mountain AFS	US	Utopia Creek
UTP	Utapao	TH	Utapao
UTR	Uttaradit	TH	Uttaradit
UTT	Umtata	ZA	Umtata
UTU	Ustupo	PA	Ustupo
UTW	Queenstown	ZA	Queenstown
UUA	Bugulma	RU	Bugulma
UUD	Ulan-ude, Mukhino	RU	Ulan-ude
UUK	Kuparuk	US	Kuparuk
UUN	Baruun-Urt	MN	Baruun-Urt
UUS	Yuzhno-Sakhalinsk	RU	Yuzhno-Sakhalinsk
UUU	Manumu	PG	Manumu
UVA	Garner Fld	US	Uvalde
UVE	Ouvea	NC	Ouvea
UVF	Hewanorra	LC	St Lucia
UVL	Kharga	EG	Kharga
UVO	Uvol	PG	Uvol
UWA	Ware	US	Ware
UYL	Nyala	SD	Nyala
UYN	Yulin	CN	Yulin
UZC	Ponikve	CS	Uzice
UZH	Unayzah	SA	Unayzah
UZU	Curuzu Cuatia	AR	Curuzu Cuatia
VAA	Vaasa	FI	Vaasa
VAB	Yavarate	CO	Yavarate
VAC	Varrelbusch	DE	Varrelbusch
VAD	Moody AFB	US	Valdosta
VAF	Chabeuil	FR	Valence
VAG	Maj. Brig. Trompowsky	BR	Varginha
VAH	Vallegrande	BO	Vallegrande
VAI	Vanimo	PG	Vanimo
VAK	Chevak	US	Chevak
VAL	Valenca	BR	Valenca
VAN	Ferit Melen Airport	TR	Van
VAO	Suavanao Airstrip	SB	Suavanao
VAP	Valparaiso	CL	Valparaiso
VAR	Varna	BG	Varna
VAS	Sivas	TR	Sivas
VAT	Vatomandry	MG	Vatomandry
VAU	Vatukoula	FJ	Vatukoula
VAW	Vardoe	NO	Vardoe
VBG	Vandenberg AFB	US	Lompoc
VBS	Brescia Montichiari	IT	Brescia
VBV	Vanuabalavu	FJ	Vanuabalavu
VBY	Visby	SE	Visby
VCA	Can Tho	VN	Can Tho
VCB	View Cove	US	View Cove
VCC	Limbe	CM	Limbe
VCD	Victoria River Downs	AU	Victoria River Downs
VCE	Marco Polo	IT	Venice
VCF	Valcheta	AR	Valcheta
VCH	Vichadero	UY	Vichadero
VCL	Chulai	VN	Tamky
VCP	Viracopos (Campinas International)	BR	Campinas, Sao Paulo
VCR	Carora	VE	Carora
VCS	Coong	VN	Con Dao
VCT	County-Foster	US	Victoria
VCV	Southern California Logistics	US	Victorville, CA
VDA	Ovda	IL	Eilat
VDB	Valdres Lufthavn Leirin	NO	Fagernes
VDC	Vitoria Da Conquista	BR	Vitoria Da Conquista
VDD	Vienna Danubepier Hov	AT	Vienna
VDE	Hierro	ES	Valverde
VDI	Municipal	US	Vidalia
VDM	Viedma	AR	Viedma
VDP	Valle De Pascua	VE	Valle De Pascua
VDR	Villa Dolores	AR	Villa Dolores
VDS	Vadso	NO	Vadso
VDZ	Municipal	US	Valdez
VEE	Venetie	US	Venetie
VEG	Maikwak	GY	Maikwak
VEJ	Vejle	DK	Vejle
VEL	Vernal	US	Vernal, UT
VER	Las Bajadas	MX	Veracruz
VEV	Barakoma	SB	Barakoma
VEX	Municipal	US	Tioga
VEY	Vestmannaeyjar	IS	Vestmannaeyjar
VFA	Victoria Falls	ZW	Victoria Falls
VGA	Vijayawada	IN	Vijayawada
VGD	Vologda	RU	Vologda
VGG	Vangrieng	LA	Vangrieng
VGO	Vigo	ES	Vigo
VGS	General Villegas	AR	General Villegas
VGT	North Air Terminal	US	Las Vegas
VGZ	Villagarzon	CO	Villagarzon
VHC	Saurimo	AO	Saurimo
VHM	Vilhelmina	SE	Vilhelmina
VHN	Culberson County	US	Van Horn
VHY	Charmeil	FR	Vichy
VHZ	Vahitahi	PF	Vahitahi
VIA	Vienna	BR	Videira
VIB	Villa Constitucion	MX	Villa Constitucion
VIC	Vicenza	IT	Vicenza
VID	Vidin	BG	Vidin
VIE	Schwechat International	AT	Vienna
VIF	Vieste	IT	Vieste
VIG	El Vigia	VE	El Vigia
VIH	Rolla National	US	Vichy
VII	Vinh City	VN	Vinh City
VIJ	Virgin Gorda	VG	Spanish Town/Virgin Gorda
VIK	Airstrip	US	Kavik
VIL	Dakhla	MA	Dakhla
VIN	Vinnica	UA	Vinnica
VIQ	Viqueque	ID	Viqueque
VIR	Virginia	ZA	Durban
VIS	Visalia	US	Visalia
VIT	Vitoria.	ES	Vitoria.
VIU	Viru Harbour Airstrip	SB	Viru
VIV	Vivigani	PG	Vivigani
VIX	Eurico Sales	BR	Vitoria
VIY	Villa Coublay	FR	Paris
VJB	Xai Xai	MZ	Xai Xai
VJI	Virginia Highlands	US	Abingdon
VJQ	Gurue	MZ	Gurue
VKG	Rach Gia	VN	Rach Gia
VKO	Vnukovo	RU	Moscow
VKS	Vicksburg	US	Vicksburg
VKT	Vorkuta	RU	Vorkuta
VKW	West Kavik	US	West Kavik
VLA	Vandalia	US	Vandalia
VLC	Valencia	ES	Manises
VLD	Regional	US	Valdosta
VLE	J t Robidoux	US	Valle
VLG	Villa Gesell	AR	Villa Gesell
VLI	Bauerfield	VU	Port Vila
VLK	Volgodonsk	RU	Volgodonsk
VLL	Valladolid	ES	Valladolid
VLM	Villamontes	BO	Villamontes
VLN	Valencia	VE	Valencia
VLO	Stolport	US	Vallejo
VLP	Municipal	BR	Vila Rica
VLR	Vallenar	CL	Vallenar
VLS	Valesdir	VU	Valesdir
VLU	Velikiye Luki	RU	Velikiye Luki
VLV	Carvajal	VE	Valera
VME	Villa Mercedes	AR	Villa Mercedes
VMI	INC	PY	Vallemi
VMU	Baimuru	PG	Baimuru
VNA	Saravane	LA	Saravane
VNC	Venice Municipal	US	Venice, FL
VND	Vangaindrano	MG	Vangaindrano
VNE	Meucon	FR	Vannes
VNG	Viengxay	LA	Viengxay
VNO	Vilnius	LT	Vilnius
VNR	Vanrook	AU	Vanrook
VNS	Varanasi	IN	Varanasi
VNX	Vilanculos	MZ	Vilanculos
VNY	Van Nuys	US	Los Angeles, CA
VOG	Volgograd	RU	Volgograd
VOH	Vohemar	MG	Vohemar
VOI	Voinjama	LR	Voinjama
VOK	Volk Field	US	Camp Douglas
VOL	Nea Anchialos	GR	Volos
VOT	Votuporanga	BR	Votuporanga
VOZ	Chertovitskoye	RU	Voronezh
VPE	Ongiva	AO	Ongiva
VPN	Vopnafjordur	IS	Vopnafjordur
VPS	Eglin AFB	US	Valparaiso, FL
VPY	Chimoio	MZ	Chimoio
VPZ	Porter County	US	Valparaiso
VQQ	Cecil Field	US	Jacksonville
VQS	Vieques	PR	Vieques
VRA	Juan Gualberto Gomez	CU	Varadero
VRB	Municipal	US	Vero Beach
VRC	Virac	PH	Virac
VRE	Vredendal	ZA	Vredendal
VRK	Varkaus	FI	Joroinen
VRL	Vila Real	PT	Vila Real
VRN	Valerio Catullo	IT	Verona
VRO	Kawama	CU	Matanzas
VRS	Versailles	US	Versailles
VRU	Vryburg	ZA	Vryburg
VRY	Stolport	NO	Vaeroy
VSA	Capitan Carlos Rovirosa	MX	Villahermosa
VSE	Viseu	PT	Viseu
VSF	State	US	Springfield
VSG	Lugansk	UA	Lugansk
VSO	Phuoclong	VN	Phuoclong
VST	Vasteras/Hasslo	SE	Stockholm
VTA	Victoria	HN	Victoria
VTB	Vitebsk	BY	Vitebsk
VTE	Wattay	LA	Vientiane
VTF	Vatulele	FJ	Vatulele
VTG	Vung Tau	VN	Vung Tau
VTL	Vittel	FR	Vittel
VTN	Miller Field	US	Valentine
VTS	Ventspils International Airport	LV	Ventspils
VTU	Las Tunas	CU	Las Tunas
VTZ	Vishakhapatnam	IN	Vishakhapatnam
VUP	Valledupar	CO	Valledupar
VUS	Velikij Ustyug	RU	Velikij Ustyug
VUU	Mvuu Camp	MW	Mvuu Camp
VVB	Mahanoro	MG	Mahanoro
VVC	La Vanguardia	CO	Villavicencio
VVI	Viru Viru Intl	BO	Santa Cruz
VVK	Vastervik	SE	Vastervik
VVO	Vladivostok	RU	Vladivostok
VVZ	Illizi	DZ	Illizi
VXC	Lichinga	MZ	Lichinga
VXE	San Pedro	CV	Sao Vicente
VXO	Smaland Airport	SE	Växjö
VYD	Vryheid	ZA	Vryheid
VYS	Illinois Valley Regnl	US	Peru
WAA	Wales	US	Wales
WAB	Wabag	PN	Wabag
WAC	Waca	ET	Waca
WAD	Andriamena	MG	Andriamena
WAE	Wadi Ad Dawasir	SA	Wadi Ad Dawasir
WAF	Wana	PK	Wana
WAG	Wanganui	NZ	Wanganui
WAH	Wahpeton	US	Wahpeton
WAI	Antsohihy	MG	Antsohihy
WAJ	Wawoi Falls	PG	Wawoi Falls
WAK	Ankazoabo	MG	Ankazoabo
WAL	Wallops Flight Center	US	Chincoteague
WAM	Ambatondrazaka	MG	Ambatondrazaka
WAN	Waverney	AU	Waverney
WAO	Wabo	PG	Wabo
WAP	Alto Palena	CL	Alto Palena
WAQ	Antsalova	MG	Antsalova
WAR	Waris	ID	Waris
WAT	Waterford	IE	Waterford
WAU	Wauchope	AU	Wauchope
WAV	Kalkgurung	AU	Wave Hill
WAW	Frederic Chopin	PL	Warsaw
WAX	Zwara	US	Zwara
WAY	Greene County	US	Waynesburg
WAZ	Warwick	AU	Warwick
WBA	Wahai	AU	Wahai
WBB	Stebbins	US	Stebbins
WBC	Wapolu	PG	Wapolu
WBD	Befandriana	MG	Befandriana
WBE	Bealanana	MG	Bealanana
WBG	Schleswig-jagel	DE	Schleswig-jagel
WBI	Broker Inn	US	Boulder
WBM	Wapenamanda	PG	Wapenamanda
WBN	Cummings Park	US	Woburn
WBO	Beroroha	MG	Beroroha
WBQ	Beaver	US	Beaver
WBR	Big Rapids	US	Big Rapids
WBU	Municipal	US	Boulder
WBW	Wilkes-Barre/Wyoming Valley	US	Wilkes-Barre, PA
WCA	Gamboa	CL	Castro
WCH	Chaiten	CL	Chaiten
WCR	Chandalar	US	Chandalar
WDA	Wadi Ain	YE	Wadi Ain
WDB	Deep Bay	US	Deep Bay
WDG	Enid Woodring Mun.	US	Enid
WDH	Hosea Kutako International (J. G. Strijdom)	NA	Windhoek
WDI	Wondai	AU	Wondai
WDN	Waldron Island	US	Waldron Island
WDR	Winder	US	Winder
WDY	Kodiak Fss	US	Kodiak
WEA	Parker County	US	Weatherford
WED	Wedau	PG	Wedau
WEF	Weifang	CN	Weifang
WEH	Weihai	CN	Weihai
WEI	Weipa	AU	Weipa
WEL	Welkom	ZA	Welkom
WEM	West Malling	GB	West Malling
WEP	Weam	PG	Weam
WES	Weasua	LR	Weasua
WET	Wagethe	ID	Wagethe
WEW	Wee Waa	AU	Wee Waa
WEX	Castlebridge	IE	Wexford
WFB	Waterfront SPB	US	Ketchikan
WFD	Woodford	GB	Woodford
WFI	Fianarantsoa	MG	Fianarantsoa
WFK	Frenchville	US	Frenchville
WGA	Forrest Hill	AU	Wagga Wagga
WGB	Bahawalnagar	PK	Bahawalnagar
WGC	Warangal	IN	Warangal
WGE	Walgett	AU	Walgett
WGF	Off Line Point	BH	Manama
WGN	Waitangi	NZ	Waitangi
WGO	Municipal	US	Winchester
WGP	Waingapu	ID	Waingapu
WGT	Wangaratta	AU	Wangaratta
WGU	Wagau	PG	Wagau
WGY	Wagny	GA	Wagny
WGZ	Off Line Point	AU	Manly
WHD	SPB	US	Hyder
WHF	Wadi Halfa	SD	Wadi Halfa
WHH	Hiltons Har H	US	Boulder
WHK	Whakatane	NZ	Whakatane
WHL	Welshpool	AU	Welshpool
WHO	Franz Josef	NZ	Franz Josef
WHP	Whiteman	US	Los Angeles
WHS	Whalsay	GB	Whalsay
WHT	Wharton	US	Wharton
WHU	Wuhu	CN	Wuhu
WIC	Wick	GB	Wick
WID	Wildenrath	DE	Wildenrath
WIE	Air Base	DE	Wiesbaden
WIK	Surfdale	NZ	Surfdale
WIL	Wilson	KE	Nairobi
WIN	Winton	AU	Winton
WIO	Wilcannia	AU	Wilcannia
WIR	Wairoa	NZ	Wairoa
WIU	Witu	PG	Witu
WJA	Woja	MH	Woja
WJF	William J Fox	US	Lancaster
WJR	Wajir	KE	Wajir
WJU	WonJu	KR	WonJu
WKA	Wanaka	NZ	Wanaka
WKB	Warracknabeal	AU	Warracknabeal
WKF	Waterkloof AFB	ZA	Waterkloof
WKI	Hwange	ZW	Hwange
WKJ	Hokkaido	JP	Wakkanai
WKK	Aleknagik	US	Aleknagik
WKL	Waikoloa Airport	US	Waikoloa
WKN	Wakunai	PG	Wakunai
WLA	Wallal	AU	Wallal
WLB	Labouchere Bay	US	Labouchere Bay
WLC	Walcha	AU	Walcha
WLD	Arkansas City	US	Winfield
WLG	Wellington International	NZ	Wellington
WLH	Walaha	VU	Walaha
WLK	Selawik	US	Selawik
WLL	Wollogorang	AU	Wollogorang
WLM	Waltham	US	Waltham
WLN	Little Naukati	US	Little Naukati
WLO	Waterloo	AU	Waterloo
WLR	Loring	US	Loring
WLS	Wallis Island	WF	Wallis Island
WLW	Glenn County	US	Willows
WMA	Mandritsara	MG	Mandritsara
WMB	Warrnambool	AU	Warrnambool
WMC	Winnemucca	US	Winnemucca
WMD	Mandabe	MG	Mandabe
WME	Mount Keith	AU	Mount Keith
WMH	Mountain Home	US	Mountain Home
WMK	SPB	US	Meyers Chuck
WML	Malaimbandy	MG	Malaimbandy
WMN	Maroantsetra	MG	Maroantsetra
WMO	White Mountain	US	White Mountain
WMP	Mampikony	MG	Mampikony
WMR	Mananara	MG	Mananara
WMV	Madirovalo	MG	Madirovalo
WMX	Wamena	ID	Wamena
WNA	Napakiak SPB	US	Napakiak
WNC	Naukati Bay SPB	US	Tuxekan Island, AK
WND	Windarra	AU	Windarra
WNE	Wora Na Ye	GA	Wora Na Ye
WNN	Wunnummin Lake	CA	Wunnummin Lake
WNP	Naga	PH	Naga
WNR	Windorah	AU	Windorah
WNS	Nawabshah	PK	Nawabshah
WNU	Wanuma	PG	Wanuma
WNZ	Wenzhou	CN	Wenzhou
WOA	Wonenara	PG	Wonenara
WOB	Woodbridge RAF	GB	Suttonheath
WOD	Wood River	US	Wood River
WOE	Woensdrecht	NL	Woensdrecht
WOG	Woodgreen	AU	Woodgreen
WOI	Wologissi	LR	Wologissi
WOK	Wonken	VE	Wonken
WOL	Wollongong	AU	Wollongong
WON	Wondoola	AU	Wondoola
WOO	Woodchopper	US	Woodchopper
WOR	Moramba	MG	Ankorefo
WOT	Wonan	TW	Wonan
WOW	Willow	US	Willow
WPA	Puerto Aisen	CL	Puerto Aisen
WPB	Port Berge	MG	Port Berge
WPC	Pincher Creek	CA	Pincher Creek
WPK	Wrotham Park	AU	Wrotham Park
WPL	Powell Lake	CA	Powell Lake
WPM	Wipim	PG	Wipim
WPO	North Fork Valley	US	Paonia
WPR	Porvenir	CL	Porvenir
WPU	Puerto Williams	CL	Puerto Williams
WRA	Warder	ET	Warder
WRB	Robins AFB	US	Macon
WRE	Whangarei	NZ	Whangarei
WRG	Wrangell SPB	US	Wrangell
WRH	Wrench Creek	US	Wrench Creek
WRI	Mc Guire Afb	US	Wrightstown, New Jersey
WRL	Worland	US	Worland, WY
WRO	Copernicus Airport	PL	Wroclaw
WRW	Warrawagine	AU	Warrawagine
WRY	Westray	GB	Westray, Orkney Isles
WRZ	Wirawila	LK	Wirawila
WSA	Wasua	PG	Wasua
WSB	SPB	US	Steamboat Bay
WSD	Condron AAF	US	White Sands
WSF	Sarichef	US	Sarichef
WSG	County	US	Washington
WSH	Brookhaven	US	Shirley
WSJ	San Juan SPB	US	San Juan
WSM	Wiseman	US	Wiseman
WSN	South Naknek	US	South Naknek
WSO	Washabo	SR	Washabo
WSP	Waspam	NI	Waspam
WSR	Wasior	ID	Wasior
WST	Westerly State	US	Westerly, RI
WSU	Wasu	PG	Wasu
WSX	Westsound	US	Westsound
WSY	Whitsunday Airstrip	AU	Airlie Beach
WSZ	Westport	NZ	Westport
WTA	Tambohorano	MG	Tambohorano
WTD	West End	BS	West End
WTE	Wotje Island	MH	Wotje Island
WTK	Noatak	US	Noatak
WTL	Tuntutuliak	US	Tuntutuliak
WTN	RAF Station	GB	Waddington
WTO	Wotho Island	MH	Wotho Island
WTP	Woitape	PG	Woitape
WTR	White River	US	White River
WTS	Tsiroanomandidy	MG	Tsiroanomandidy
WTT	Wantoat	PG	Wantoat
WTZ	Whitianga	NZ	Whitianga
WUA	Wu Hai	CN	Wu Hai
WUD	Wudinna	AU	Wudinna
WUG	Wau	PG	Wau
WUH	Tianhe International	CN	Wuhan
WUK	Off Line Point	GB	Hammersmith
WUM	Wasum	PG	Wasum
WUN	Wiluna	AU	Wiluna
WUS	Wuyishan	CN	Wuyishan
WUU	Wau	SD	Wau
WUV	Wuvulu Is	PG	Wuvulu Is
WUX	Wuxi	CN	Wuxi
WUZ	Changzhoudao	CN	Wuzhou
WVB	Rooikop	NA	Walvis Bay
WVI	Watsonville	US	Watsonville
WVK	Manakara	MG	Manakara
WVL	Robert Lafleur	US	Waterville
WVN	Wilhelmshaven	DE	Wilhelmshaven
WWA	Wasilla	US	Wasilla
WWD	Cape May County	US	Wildwood
WWG	Al Koude	OM	Al Koude
WWI	Woodie Woodie	AU	Woodie Woodie
WWK	Boram	PG	Wewak
WWP	Whale Pass	US	Whale Pass
WWR	West Woodward	US	Woodward
WWS	USAF Heliport	US	Wildwood
WWT	Newtok	US	Newtok
WWY	West Wyalong	AU	West Wyalong
WXF	Weathersfield Raf	GB	Braintree
WXN	Wanxian	CN	Wanxian
WYA	Whyalla	AU	Whyalla
WYB	SPB	US	Yes Bay
WYE	Yengema	SL	Yengema
WYN	Wyndham	AU	Wyndham
WYS	Yellowstone	US	West Yellowstone
WZY	Paradise Island Seaplane Base	BS	Nassau
XAL	Alamos	MX	Alamos
XAP	Aeroporto Municipal Chapeco	BR	Chapeco
XAR	Aribinda	BF	Aribinda
XAU	Saul	GF	Saul
XAY	Xayabury	LA	Xayabury
XBB	Blubber Bay	CA	Blubber Bay
XBE	Bearskin Lake	CA	Bearskin Lake
XBG	Bogande	BF	Bogande
XBJ	Birjand	IR	Birjand
XBL	Buno Bedelle	ET	Buno Bedelle
XBN	Biniguni	PG	Biniguni
XBO	Boulsa	BF	Boulsa
XBR	Brockville	CA	Brockville
XBW	Killineq	CA	Killineq
XCH	Christmas Island	CX	Christmas Island
XCL	Cluff Lake	CA	Cluff Lake
XCM	Chatham	CA	Chatham
XCN	Coron Airport	PH	Coron
XCO	Colac	AU	Colac
XCR	Vatry International	FR	Chalons-en-Champagne
XDB	Lille Europe Rail Svc	FR	Lille
XDE	Diebougou	BF	Diebougou
XDJ	Djibo	BF	Djibo
XDT	C.de G. /TGV Rail Svc	FR	Paris
XDV	Pr. George Rail Stn	CA	Prince George
XDW	Pr. Rupert Rail Stn	CA	Prince Rupert
XDY	Sudbury Jct Rail Stn	CA	Sudbury
XEA	Vancouver Rail Stn.	CA	Vancouver
XEN	Xingcheng	CN	Xingcheng
XEO	Harbour	GL	Oqatsut
XEQ	Harbour	GL	Tasiuasaq
XES	Municipal	US	Lake Geneva
XEX	Aerogare	FR	Paris
XEZ	Sodertalje S Railway	SE	Sodertalje
XFA	Lille Flanders Rail Sv	FR	Lille
XFN	Xiangfan	CN	Xiangfan
XFR	Malmo South Railway	SE	Malmo
XFW	Finkenwerder	DE	Hamburg
XFY	Sainte-Foy Rail Svce.	CA	Quebec
XFZ	Charny	CA	Quebec
XGA	Gaoua	BF	Gaoua
XGB	Gare Montparnasse	FR	Paris
XGG	Gorom-Gorom	BF	Gorom-Gorom
XGL	Granville Lake	CA	Granville Lake
XGN	Xangongo	AO	Xangongo
XGR	Kangiqsualujjuaq	CA	Kangiqsualujjuaq
XGZ	Railway Station	AT	Bregenz
XHJ	Railway Station	DE	Aix La Chapelle
XHN	Guillemins, Raiway Stn	BE	Liege
XHW	Alice Springs Railway	AU	Alice Springs
XHX	Adelaide Keswick Rail	AU	Adelaide
XIC	Xichang	CN	Xichang
XIE	Xienglom	LA	Xienglom
XIG	Municipal	BR	Xinguara
XIH	Khan Al Baghdadi	IQ	Khan Al Baghdadi
XIJ	Ahmed Al Jaber	KW	Ahmed Al Jaber
XIK	Central Station	IT	Milan
XIL	Xilinhot	CN	Xilinhot
XIN	Xingning	CN	Xingning
XIQ	Harbour	GL	Ilimanaq
XIX	Porta Nuova Rail	IT	Verona
XIY	Xianyang	CN	Xi An
XJD	Al Udeid AB	QA	Al Udeid
XJE	Rialway Service	DK	Vojens
XJG	Darwin Railway	AU	Darwin
XJM	Mangla	PK	Mangla
XJS	Kitzbuehl Railway	AT	Kitzbuehl
XKA	Kantchari	BF	Kantchari
XKC	Sandnes Rail St.	NO	Sandnes
XKH	Xieng Khouang	LA	Xieng Khouang
XKO	Kemano	CA	Kemano
XKS	Kasabonika	CA	Kasabonika
XKY	Kaya	BF	Kaya
XLB	Lac Brochet	CA	Lac Brochet
XLF	Leaf Bay	CA	Leaf Bay
XLJ	Quebec Stn. Rail Svce.	CA	Quebec
XLM	St Lambert Rail Svce.	CA	Montreal
XLO	Long Xuyen	VN	Long Xuyen
XLS	St Louis	SN	St Louis
XLU	Leo	BF	Leo
XLW	Lemwerder	DE	Lemwerder
XMA	Maramag	PH	Maramag
XMC	Mallacoota	AU	Mallacoota
XMD	Madison	US	Madison
XMG	Mahendranagar	NP	Mahendranagar
XMH	Manihi	PF	Manihi
XMI	Masasi	TZ	Masasi
XML	Minlaton	AU	Minlaton
XMN	Xiamen	CN	Xiamen
XMP	Macmillan Pass	CA	Macmillan Pass
XMS	Macas	EC	Macas
XMY	Yam Island	AU	Yam Island
XNA	Northwest Arkansas Regional	US	Fayetteville, AR
XNG	Quang Ngai	VN	Quang Ngai
XNH	Nasiriyah	IQ	Nasiriyah
XNN	Xining	CN	Xining
XNT	Xingtai	CN	Xingtai
XNU	Nouna	BF	Nouna
XOZ	Doha Free Zone	QA	Doha
XPA	Pama	BF	Pama
XPG	Gare du Nord Rail Stn	FR	Paris
XPJ	Montpellier Railway	FR	Montpellier
XPK	Pukatawagan	CA	Pukatawagan
XPL	Coronel Enrique Soto Cano AB	HN	Comayagua
XPP	Poplar River	CA	Poplar River
XPQ	Ferry	MY	Port Klang
XPR	Pine Ridge	US	Pine Ridge
XPU	West Kuparuk	US	West Kuparuk
XPZ	Harbour	FR	Saint Tropez
XQC	Balad	IQ	Balad
XQH	Railway Station	GB	Nottingham
XQI	Railway Station	GB	Nottingham
XQP	Quepos	CR	Pavones
XQU	Qualicum	CA	Qualicum
XQV	Baqubah	IQ	Baqubah
XRF	Marseille Railway	FR	Marseille
XRH	Richmond AFB	AU	Richmond
XRJ	Termini Rail Stn.	IT	Rome
XRK	Paveletskiy Rail Stn.	RU	Moscow
XRR	Ross River	CA	Ross River
XRY	Jerez De La Frontera	ES	Jerez De La Frontera
XSA	AFC	LR	Sinoe
XSC	International	TC	South Caicos
XSD	Test Range	US	Tonopah
XSE	Sebba	BF	Sebba
XSI	South Indian Lake	CA	South Indian Lake
XSM	St Marys	US	St Marys
XSO	Siocon	PH	Siocon
XSP	Seletar	SG	Singapore
XTA	Econ/Tech Dev. Area	CN	Tianjin
XTF	Port Free Trade Zone	CN	Tianjin
XTG	Thargomindah	AU	Thargomindah
XTL	Tadoule Lake	CA	Tadoule Lake, MB
XTM	Ramadi	IQ	Ramadi
XTO	Taroom	AU	Taroom
XTR	Tara	AU	Tara
XTT	Etoile	FR	Paris
XTV	Tikrit	IQ	Tikrit
XUV	Storekvina Railway	NO	Storekvina
XUW	Storen Railway	NO	Storen
XUZ	Xuzhou	CN	Xuzhou
XVL	Vinh Long	VN	Vinh Long
XVQ	Santa Lucia Rail	IT	Venice
XVY	Mestre Rail Stn.	IT	Rome
XWC	Suedbahnhof Rail	AT	Vienna
XWK	Karlskrona Rail Svc.	SE	Ronneby
XWL	Gothenburg Rail	SE	Gothenburg
XWP	Hassleholm	SE	Hassleholm
XWQ	Enkoping	SE	Enkoping
XWS	Railway Station	GB	Swindon
XWW	Westbahnhof Rail	AT	Vienna
XWZ	Nykoping	SE	Nykoping
XXA	Alvesta	SE	Alvesta
XXJ	Deli Railway	HU	Budapest
XXK	Katrineholm	SE	Katrineholm
XXU	Hedemora	SE	Hedemora
XYA	Yandina	SB	Yandina
XYB	Borlange Railway Svc.	SE	Borlange/Falun
XYC	Herrljunga	SE	Herrljunga
XYD	Lyon Part-dieu Rail Sv	FR	Lyon
XYE	Ye	MM	Ye
XYH	Helsingborg Railway	SE	Angelholm/Helsingborg
XYI	Flen	SE	Flen
XYL	Lyon Perrache Rail Svc	FR	Lyon
XYM	Falkenberg Rail	SE	Falkenberg
XYN	Kristinehamn Rail	SE	Kristinehamn
XYO	Karlshamn	SE	Karlshamn
XYP	Avesta Krylbo	SE	Avesta Krylbo
XYQ	Angelholm Railway Svc.	SE	Angelholm/Helsingborg
XYR	Yellow River	PG	Yellow River
XYT	Montaudran	FR	Toulouse
XYU	Solvesborg	SE	Solvesborg
XYV	Lyon Satolas Rail Svc	FR	Lyon
XYX	Sala	SE	Sala
XZA	Zabre	BF	Zabre
XZE	Off line Point	DE	Rail (Generic)
XZF	Dammam Port	SA	Dammam
XZJ	Off line Point	JP	Rail (Generic)
XZN	Avignon Railway	FR	Avignon
XZQ	Pass Rail	SE	Rail (Generic)
XZU	Off line Point	US	Rail (Generic)
XZX	Off line Point	AU	Rail (Generic)
YAA	Anahim Lake	CA	Anahim Lake
YAB	Arctic Bay	CA	Arctic Bay
YAC	Cat Lake	CA	Cat Lake
YAD	Moose Lake	CA	Moose Lake
YAE	Alta Lake	CA	Alta Lake
YAF	Asbestos Hill	CA	Asbestos Hill
YAG	Municipal	CA	Fort Frances
YAH	Lagrande 4	CA	Lagrande 4
YAI	Chillan	CL	Chillan
YAJ	Lyall Harbour	CA	Lyall Harbour
YAK	Yakutat	US	Yakutat
YAL	Alert Bay	CA	Alert Bay
YAM	Sault Ste Marie	CA	Sault Ste Marie
YAN	Yangambi	ZR	Yangambi
YAO	Yaounde Airport	CM	Yaounde
YAP	Yap International	FM	Yap, Caroline Islands
YAQ	Maple Bay	CA	Maple Bay
YAR	Lagrande 3	CA	Lagrande 3
YAS	Yasawa Island	FJ	Yasawa Island
YAT	Attawapiskat	CA	Attawapiskat
YAU	Kattiniq/Donaldson	CA	Kattiniq
YAV	Miners Bay	CA	Miners Bay
YAW	Shearwater	CA	Halifax
YAX	Angling Lake	CA	Angling Lake
YAY	St Anthony	CA	St Anthony
YAZ	Tofino Airport	CA	Tofino, BC
YBA	Banff	CA	Banff
YBB	Kugaaruk	CA	Kugaaruk
YBC	Baie Comeau	CA	Baie Comeau
YBD	New Westminster	CA	New Westminster
YBE	Uranium City	CA	Uranium City
YBF	Bamfield	CA	Bamfield
YBG	Bagotville	CA	Bagotville
YBH	Bull Harbour	CA	Bull Harbour
YBI	Black Tickle	CA	Black Tickle
YBJ	Baie Johan Beetz	CA	Baie Johan Beetz
YBK	Baker Lake	CA	Baker Lake
YBL	Campbell River	CA	Campbell River
YBM	Bronson Creek	CA	Bronson Creek
YBN	Borden	CA	Borden
YBO	Bob Quinn Lake	CA	Bobquinn Lake, BC
YBP	Yibin	CN	Yibin
YBQ	Telegraph Harbour	CA	Telegraph Harbour
YBR	Brandon	CA	Brandon
YBS	Musselwhite	CA	Opapamiska Lake
YBT	Brochet	CA	Brochet
YBV	Berens River	CA	Berens River
YBW	Springbank	CA	Calgary
YBX	Blanc Sablon	CA	Blanc Sablon
YBY	Bonnyville	CA	Bonnyville, AB
YCA	Courtenay	CA	Courtenay
YCB	Cambridge Bay	CA	Cambridge Bay
YCC	Regional	CA	Cornwall
YCD	Nanaimo Arpt	CA	Nanaimo
YCE	Centralia	CA	Centralia
YCF	Cortes Bay	CA	Cortes Bay
YCG	Castlegar	CA	Castlegar
YCH	Miramichi	CA	Miramichi
YCI	Caribou Island	CA	Caribou Island
YCJ	Cape St James	CA	Cape St James
YCK	Colville Lake	CA	Colville Lake
YCL	Charlo	CA	Charlo
YCM	St Catharines	CA	St Catharines
YCN	Cochrane	CA	Cochrane
YCO	Kugluktuk	CA	Kugluktuk/Coppermine
YCP	Co-op Point	CA	Co-op Point
YCQ	Chetwynd	CA	Chetwynd
YCR	Cross Lake	CA	Cross Lake
YCS	Chesterfield Inlet	CA	Chesterfield Inlet
YCT	Coronation	CA	Coronation
YCU	Yun Cheng	CH	Yun Cheng
YCV	Cartierville	CA	Cartierville
YCW	Chilliwack Municipal Airport	CA	Chilliwack
YCX	Gagetown	CA	Gagetown
YCY	Clyde River	CA	Clyde River
YCZ	Fairmont Hot Springs	CA	Fairmont Hot Springs
YDA	Dawson City	CA	Dawson City
YDB	Burwash Landings	CA	Burwash Landings
YDC	Industrial Airport	CA	Drayton Valley
YDE	Paradise River	CA	Paradise River
YDF	Deer Lake	CA	Deer Lake
YDG	Digby	CA	Digby
YDH	Daniels Harbour	CA	Daniels Harbour
YDI	Davis Inlet	CA	Davis Inlet
YDJ	Hatchet Lake	CA	Hatchet Lake
YDK	Main Duck Island	CA	Main Duck Island
YDL	Dease Lake	CA	Dease Lake
YDN	Dauphin	CA	Dauphin
YDO	St Methode	CA	Dolbeau
YDP	Nain	CA	Nain
YDQ	Dawson Creek	CA	Dawson Creek
YDR	Broadview	CA	Broadview
YDS	Desolation Sound	CA	Desolation Sound
YDT	Boundary Bay	CA	Vancouver
YDU	Kasba Lake	CA	Kasba Lake
YDV	Bloodvein	CA	Bloodvein
YDW	Obre Lake	CA	Obre Lake
YDX	Doc Creek	CA	Doc Creek
YEC	Yecheon	KR	Yecheon
YED	Namao Fld	CA	Edmonton
YEG	Edmonton International	CA	Edmonton, AB
YEH	Persian Gulf International	IR	Assaluyeh
YEI	Yenisehir	TR	Bursa
YEK	Arviat	CA	Arviat
YEL	Elliot Lake	CA	Elliot Lake
YEM	East Manitoulin	CA	Manitowaning
YEN	Estevan	CA	Estevan
YEO	Yeovilton	GB	Yeovilton
YEP	Estevan Point	CA	Estevan Point
YEQ	Yenkis	PG	Yenkis
YER	Fort Severn	CA	Fort Severn
YES	Yasouj	IR	Yasouj
YET	Edson	CA	Edson
YEU	Eureka	CA	Eureka
YEV	Inuvik/mike Zubko	CA	Inuvik
YEY	Amos	CA	Amos
YFA	Fort Albany	CA	Fort Albany
YFB	Iqaluit	CA	Iqaluit
YFC	Fredericton	CA	Fredericton
YFE	Forestville	CA	Forestville
YFG	Fontanges	CA	Fontanges
YFH	Fort Hope	CA	Fort Hope
YFJ	Snare Lake	CA	Snare Lake
YFL	Fort Reliance	CA	Fort Reliance
YFO	Flin Flon	CA	Flin Flon
YFR	Fort Resolution	CA	Fort Resolution
YFS	Fort Simpson	CA	Fort Simpson
YFX	Fox Harbour (St Lewis)	CA	Fox Harbour (St Lewis)
YGA	Gagnon	CA	Gagnon
YGB	Gillies Bay	CA	Gillies Bay
YGC	Grande Cache	CA	Grande Cache
YGE	Gorge Harbor	CA	Gorge Harbor
YGG	Ganges Harbor	CA	Ganges Harbor
YGH	Fort Good Hope	CA	Fort Good Hope
YGJ	Miho	JP	Yonago
YGK	Kingston	CA	Kingston
YGL	La Grande	CA	La Grande
YGM	Gimli	CA	Gimli
YGN	Greenway Sound	CA	Greenway Sound
YGO	Gods Narrows	CA	Gods Narrows
YGQ	Geraldton	CA	Geraldton
YGR	Iles De La Madeleine	CA	Iles De La Madeleine
YGS	Germansen	CA	Germansen
YGT	Igloolik	CA	Igloolik
YGV	Havre St Pierre	CA	Havre St Pierre
YGW	Kuujjuarapik	CA	Kuujjuarapik
YGX	Gillam	CA	Gillam
YGY	Deception	CA	Deception
YGZ	Grise Fiord	CA	Grise Fiord
YHA	Port Hope Simpson	CA	Port Hope Simpson
YHB	Hudson Bay	CA	Hudson Bay
YHC	Hakai Pass	CA	Hakai Pass
YHD	Municipal	CA	Dryden
YHE	Hope	CA	Hope
YHF	Hearst	CA	Hearst
YHG	Charlottetown	CA	Charlottetown
YHH	Harbor SPB	CA	Campbell River
YHI	Holman	CA	Holman
YHK	Gjoa Haven	CA	Gjoa Haven
YHM	Hamilton	CA	Hamilton
YHN	Hornepayne	CA	Hornepayne
YHO	Hopedale	CA	Hopedale
YHP	Poplar Hill	CA	Poplar Hill
YHR	Chevery	CA	Chevery
YHS	Sechelt	CA	Sechelt
YHT	Haines Junction	CA	Haines Junction
YHU	St Hubert	CA	Montreal, QC
YHY	Hay River	CA	Hay River
YHZ	Halifax International	CA	Halifax, NS
YIB	Atikokan	CA	Atikokan
YIF	Pakuashipi	CA	Pakuashipi
YIG	Big Bay Marina	CA	Big Bay Marina
YIH	Yichang	CN	Yichang
YIK	Ivujivik	CA	Ivujivik
YIN	Yining	CN	Yining
YIO	Pond Inlet	CA	Pond Inlet
YIP	Willow Run	US	Detroit, MI
YIV	Island Lk/Garden Hill	CA	Island Lk/Garden Hill
YIW	Yiwu	CN	Yiwu
YJF	Fort Liard	CA	Fort Liard
YJN	St Jean	CA	St Jean
YJO	Johnny Mountain	CA	Johnny Mountain
YJP	Jasper-hinton	CA	Jasper-hinton
YJT	Stephenville	CA	Stephenville
YKA	Kamloops	CA	Kamloops
YKC	Collins Bay	CA	Collins Bay
YKD	Township Airport	CA	Kincardine
YKE	Knee Lake	CA	Knee Lake
YKF	Kitchener-Waterloo Regional	CA	Kitchener/Waterloo
YKG	Kangirsuk	CA	Kangirsuk
YKI	Kennosao Lake	CA	Kennosao Lake
YKJ	Key Lake	CA	Key Lake
YKK	Kitkatla	CA	Kitkatla
YKL	Schefferville	CA	Schefferville
YKM	Yakima Air Terminal	US	Yakima
YKN	Chan Gurney	US	Yankton
YKQ	Waskaganish	CA	Waskaganish
YKS	Yakutsk	RU	Yakutsk
YKT	Klemtu	CA	Klemtu
YKU	Chisasibi	CA	Chisasibi
YKX	Kirkland Lake	CA	Kirkland Lake
YKY	Kindersley	CA	Kindersley
YKZ	Buttonville Municipal	CA	Toronto
YLA	Langara	CA	Langara
YLB	Lac Biche	CA	Lac Biche
YLC	Kimmirut	CA	Kimmirut/Lake Harbour
YLD	Chapleau	CA	Chapleau
YLE	Wha Ti	CA	Wha Ti/Lac La Martre
YLF	LaForges	CA	LaForges
YLG	Yalgoo	AU	Yalgoo
YLH	Lansdowne House	CA	Lansdowne House
YLI	Ylivieska	FI	Ylivieska
YLJ	Meadow Lake	CA	Meadow Lake
YLL	Lloydminster	CA	Lloydminster, AB
YLM	Clinton Creek	CA	Clinton Creek
YLN	Yilan	CN	Yilan
YLO	Shilo	CA	Shilo
YLP	Mingan	CA	Mingan
YLQ	La Tuque	CA	La Tuque
YLR	Leaf Rapids	CA	Leaf Rapids
YLS	Lebel-Sur-Quevillon	CA	Lebel-Sur-Quevillon
YLT	Alert	CA	Alert
YLW	Kelowna Airport	CA	Kelowna, BC
YLX	Long Point	CA	Long Point
YLY	Langley Regional	CA	Langley
YMA	Mayo	CA	Mayo
YMB	Merritt	CA	Merritt
YMC	Maricourt Airstrip	CA	Maricourt Airstrip
YMD	Mould Bay	CA	Mould Bay
YME	Matane	CA	Matane
YMF	Montagne Harbor	CA	Montagne Harbor
YMG	Manitouwadge	CA	Manitouwadge
YMI	Minaki	CA	Minaki
YMJ	Moose Jaw / Air Vice Marshal C. M. Mcewen Airport	CA	Moose Jaw
YML	Charlevoix	CA	Murray Bay, NT
YMM	Fort Mcmurray	CA	Fort Mcmurray
YMN	Makkovik	CA	Makkovik
YMO	Moosonee	CA	Moosonee, ON
YMP	Port McNeil	CA	Port McNeil
YMR	Merry Island	CA	Merry Island
YMS	Yurimaguas	PE	Yurimaguas
YMT	Chibougamau	CA	Chibougamau
YMW	Maniwaki	CA	Maniwaki
YMX	Mirabel	CA	Montreal
YNA	Natashquan	CA	Natashquan
YNB	Yanbu	SA	Yanbu
YNC	Wemindji	CA	Wemindji
YND	Executive Gatineau-Ottawa	CA	Ottawa
YNE	Norway House	CA	Norway House
YNF	Deer Lake/Stephenville	CA	Corner Brook
YNG	Youngstown	US	Youngstown
YNI	Nitchequon	CA	Nitchequon
YNJ	Yanji	CN	Yanji
YNK	Nootka Sound	CA	Nootka Sound
YNL	Points North Landing	CA	Points North Landing, Saskatchewan
YNM	Matagami	CA	Matagami
YNN	Yandi	AU	Yandicoogina
YNO	North Spirit Lake	CA	North Spirit Lake, ON
YNP	Natuashish	CA	Natuashish
YNR	Arnes	CA	Arnes, MB
YNS	Nemiscau	CA	Nemiscau
YNT	Yantai	CN	Yantai
YNY	Yangyang	KR	Yangyang
YNZ	Yancheng	CN	Yancheng
YOA	Ekati	CA	Ekati
YOC	Old Crow	CA	Old Crow
YOD	Cold Lake	CA	Cold Lake
YOE	Falher	CA	Falher
YOG	Ogoki	CA	Ogoki
YOH	Oxford House	CA	Oxford House
YOJ	Footner Lake	CA	High Level
YOK	Yokohama	JP	Yokohama
YOL	Yola	NG	Yola
YOO	Oshawa	CA	Oshawa
YOP	Rainbow Lake	CA	Rainbow Lake
YOS	Billy Bishop Regional	CA	Owen Sound
YOT	Yotvata	IL	Yotvata
YOW	Ottawa Macdonald-Cartier International	CA	Ottawa
YOY	Valcartier	CA	Valcartier
YPA	Glass Field	CA	Prince Albert, SK
YPB	Port Alberni	CA	Port Alberni
YPC	Paulatuk	CA	Paulatuk
YPD	Parry Sound	CA	Parry Sound
YPE	Peace River	CA	Peace River
YPF	Esquimalt	CA	Esquimalt
YPG	Portage La Prairie	CA	Portage La Prairie
YPH	Inukjuak	CA	Inukjuak
YPI	Port Simpson	CA	Port Simpson
YPJ	Aupaluk	CA	Aupaluk
YPL	Pickle Lake	CA	Pickle Lake
YPM	Pikangikum	CA	Pikangikum
YPN	Port Menier	CA	Port Menier
YPO	Peawanuck	CA	Peawanuck
YPP	Pine Point	CA	Pine Point
YPQ	Peterborough	CA	Peterborough
YPR	Digby Island	CA	Prince Rupert
YPS	Port Hawkesbury	CA	Port Hawkesbury
YPT	Pender Harbor	CA	Pender Harbor
YPW	Powell River	CA	Powell River
YPX	Puvirnituq	CA	Povungnituk
YPY	Fort Chipewyan	CA	Fort Chipewyan
YPZ	Burns Lake	CA	Burns Lake
YQA	Muskoka	CA	Muskoka
YQB	Québec	CA	Québec City
YQC	Quaqtaq	CA	Quaqtaq
YQD	The Pas	CA	The Pas
YQE	Kimberley	CA	Kimberley
YQF	Red Deer	CA	Red Deer
YQG	Windsor	CA	Windsor
YQH	Watson Lake	CA	Watson Lake
YQI	Yarmouth	CA	Yarmouth, NS
YQK	Kenora	CA	Kenora
YQL	Lethbridge	CA	Lethbridge
YQM	Greater Moncton International Airport	CA	Moncton
YQN	Nakina	CA	Nakina
YQQ	Comox	CA	Comox
YQR	Regina	CA	Regina, Saskatchewan
YQS	Pembroke Area Mncpl	CA	St Thomas
YQT	Thunder Bay	CA	Thunder Bay
YQU	Grande Prairie	CA	Grande Prairie
YQV	Yorkton	CA	Yorkton
YQW	North Battleford	CA	North Battleford
YQX	Gander International	CA	Gander
YQY	Sydney	CA	Sydney, NS
YQZ	Quesnel	CA	Quesnel
YRA	Rae Lakes	CA	Rae Lakes
YRB	Resolute	CA	Resolute
YRD	Dean River	CA	Dean River
YRE	Resolution Island	CA	Resolution Island
YRF	Cartwright	CA	Cartwright
YRG	Rigolet	CA	Rigolet
YRI	Riviere Du Loup	CA	Riviere Du Loup
YRJ	Roberval	CA	Roberval
YRL	Red Lake	CA	Red Lake
YRM	Rocky Mountain House	CA	Rocky Mountain House
YRN	Rivers Inlet	CA	Owekeno Village
YRO	Rockcliffe St	CA	Ottawa
YRQ	Trois-Rivieres	CA	Trois-Rivieres
YRR	Stuart Island	CA	Stuart Island
YRS	Red Sucker Lake	CA	Red Sucker Lake
YRT	Nuuk	CA	Rankin Inlet, NT
YRV	Revelstoke	CA	Revelstoke
YSA	Sable Island	CA	Sable Island
YSB	Sudbury	CA	Sudbury
YSC	Sherbrooke	CA	Sherbrooke
YSD	Suffield	CA	Suffield
YSE	Squamish	CA	Squamish
YSF	Stony Rapids	CA	Stony Rapids
YSG	Lutselke	CA	Lutselke/Snowdrift
YSH	Smith Falls	CA	Smith Falls
YSI	Sans Souci	CA	Sans Souci
YSJ	Saint John	CA	Saint John
YSK	Sanikiluaq	CA	Sanikiluaq
YSL	St Leonard	CA	St Leonard
YSM	Fort Smith	CA	Fort Smith
YSN	Salmon Arm	CA	Salmon Arm
YSO	Postville	CA	Postville
YSP	Marathon	CA	Marathon
YSQ	Spring Island	CA	Spring Island
YSR	Nanisivik	CA	Nanisivik
YSS	Slate Island	CA	Slate Island
YST	Ste Therese Point	CA	Ste Therese Point
YSU	Summerside	CA	Summerside
YSV	Saglek	CA	Saglek
YSX	Shearwater	CA	Shearwater
YSY	Sachs Harbour	CA	Sachs Harbour
YSZ	Squirrel Cove	CA	Squirrel Cove
YTA	Pembroke And Area Apt	CA	Pembroke
YTB	Hartley Bay	CA	Hartley Bay
YTC	Sturdee	CA	Sturdee
YTD	Thicket Portage	CA	Thicket Portage
YTE	Cape Dorset	CA	Cape Dorset
YTF	Alma	CA	Alma
YTG	Sullivan Bay	CA	Sullivan Bay
YTH	Thompson	CA	Thompson
YTI	Triple Island	CA	Triple Island
YTJ	Terrace Bay	CA	Terrace Bay
YTK	Tulugak	CA	Tulugak
YTL	Big Trout	CA	Big Trout
YTM	La Macaza	CA	Mont Tremblant
YTN	Riviere Au Tonnerre	CA	Riviere Au Tonnerre
YTO	Metropolitan Area	CA	Toronto, ON
YTP	Seaplane Base	CA	Tofino
YTQ	Tasiujuaq	CA	Tasiujuaq
YTR	Trenton	CA	Trenton
YTS	Timmins	CA	Timmins, ON
YTT	Tisdale	CA	Tisdale, sk
YTU	Tasu	CA	Tasu
YTX	Telegraph Creek	CA	Telegraph Creek
YTZ	Toronto City Centre Airport	CA	Toronto
YUA	Yuanmou	CN	Yuanmou
YUB	Tuktoyaktuk	CA	Tuktoyaktuk
YUD	Umiujaq	CA	Umiujaq
YUE	Yuendumu	AU	Yuendumu
YUL	Montréal-pierre Elliott Trudeau International Airport	CA	Montreal
YUM	International	US	Yuma
YUT	Repulse Bay	CA	Repulse Bay
YUX	Hall Beach	CA	Hall Beach
YUY	Rouyn-Noranda	CA	Rouyn-Noranda, Québec
YVA	Iconi	KM	Moroni
YVB	Bonaventure	CA	Bonaventure
YVC	La Ronge	CA	La Ronge
YVD	Yeva	PG	Yeva
YVE	Vernon Regional Airport	CA	Vernon B. C.
YVG	Vermilion	CA	Vermilion
YVM	Qikiqtarjuaq	CA	Qikiqtarjuaq
YVO	Aéroport Régional De Val-d'or	CA	Val-d'or
YVP	Kuujjuaq	CA	Kuujjuaq
YVQ	Norman Wells	CA	Norman Wells
YVR	Vancouver Intl	CA	Richmond
YVT	Buffalo Narrows	CA	Buffalo Narrows
YVV	Wiarton/Keppel Airport	CA	Wiarton, ON
YVZ	Deer Lake	CA	Deer Lake
YWA	Petawawa	CA	Petawawa
YWB	Kangiqsujuaq	CA	Kangiqsujuaq
YWF	Dwtown Waterfront H/P	CA	Halifax
YWG	Winnipeg	CA	Winnipeg
YWH	Victoria Inner Harbor	CA	Victoria
YWJ	Deline	CA	Deline
YWK	Wabush	CA	Wabush
YWL	Williams Lake	CA	Williams Lake
YWM	Williams Harbour	CA	Williams Harbour
YWN	Winisk	CA	Winisk
YWO	Lupin	CA	Lupin
YWP	Webequie	CA	Webequie
YWQ	Chute-Des-Passes	CA	Chute-Des-Passes
YWR	White River	CA	White River
YWS	Whistler	CA	Whistler
YWY	Wrigley	CA	Wrigley
YXC	Cranbrook	CA	Cranbrook, BC
YXD	Edmonton City Center Airport	CA	Edmonton
YXE	J.G. Diefenbaker International Airport	CA	Saskatoon
YXF	Snake River	CA	Snake River
YXH	Medicine Hat	CA	Medicine Hat
YXI	Killaloe	CA	Killaloe
YXJ	Fort St John	CA	Fort St John
YXK	Rimouski	CA	Rimouski
YXL	Sioux Lookout	CA	Sioux Lookout
YXN	Whale Cove	CA	Whale Cove
YXP	Pangnirtung	CA	Pangnirtung
YXQ	Beaver Creek	CA	Beaver Creek
YXR	Earlton	CA	Earlton
YXS	Prince George	CA	Prince George
YXT	Terrace	CA	Terrace, BC
YXU	London International	CA	London
YXX	Abbotsford	CA	Abbotsford
YXY	Whitehorse International	CA	Whitehorse, Yukon
YXZ	Wawa Airport	CA	Wawa
YYA	Big Bay Yacht Club	CA	Big Bay Yacht Club
YYB	North Bay	CA	North Bay
YYC	Calgary International Airport	CA	Calgary, AB
YYD	Smithers	CA	Smithers
YYE	Fort Nelson	CA	Fort Nelson
YYF	Penticton	CA	Penticton
YYG	Charlottetown	CA	Charlottetown
YYH	Taloyoak	CA	Taloyoak
YYI	Rivers	CA	Rivers
YYJ	Victoria International	CA	Victoria
YYL	Lynn Lake	CA	Lynn Lake
YYM	Cowley	CA	Cowley
YYN	Swift Current	CA	Swift Current
YYQ	Metropolitan Area	CA	Churchill, Manitoba
YYR	Goose Bay	CA	Goose Bay
YYT	St. John´s International	CA	St. John's, NL
YYU	Kapuskasing	CA	Kapuskasing
YYW	Armstrong	CA	Armstrong
YYY	Mont Joli	CA	Mont Joli
YYZ	Lester B. Pearson International	CA	Toronto, ON
YZA	Ashcroft	CA	Ashcroft
YZC	Beatton River	CA	Beatton River
YZD	Downsview Airport	CA	Toronto
YZE	Gore Bay	CA	Gore Bay
YZF	Yellowknife	CA	Yellowknife
YZG	Salluit	CA	Salluit
YZH	Slave Lake	CA	Slave Lake
YZM	Buchans	CA	Buchans
YZP	Sandspit	CA	Sandspit
YZR	Sarnia	CA	Sarnia
YZS	Coral Harbour	CA	Coral Harbour
YZT	Port Hardy	CA	Port Hardy
YZU	Whitecourt	CA	Whitecourt
YZV	Sept-Iles	CA	Sept-Iles
YZW	Teslin	CA	Teslin
YZX	Greenwood	CA	Greenwood
ZAA	Alice Arm	CA	Alice Arm
ZAC	York Landing	CA	York Landing
ZAD	Zadar	HR	Zadar
ZAG	Pleso	HR	Zagreb
ZAH	Zahedan	IR	Zahedan
ZAJ	Zaranj	AF	Zaranj
ZAK	Bus Station	IT	Chiusa/Klausen
ZAL	Pichoy	CL	Valdivia
ZAM	Zamboanga International	PH	Zamboanga
ZAO	Laberandie	FR	Cahors
ZAR	Zaria	NG	Zaria
ZAS	Shunde Ferry	CN	Shunde
ZAT	Zhaotong	CN	Zhaotong
ZAU	Sachsen Railway Stn.	DE	Aue
ZAX	Pan Yu Ferry	CN	Pan Yu
ZAY	De Keyserlei Bus Stn.	BE	Antwerp
ZAZ	Zaragoza	ES	Zaragoza
ZBD	Jiang Men Ferry	CN	Jiang Men
ZBE	Dolni Benesov	CZ	Zabreh
ZBF	Bathurst	CA	Bathurst, NB
ZBK	Zabljak	YU	Zabljak
ZBL	Biloela	AU	Biloela
ZBM	Bromont	CA	Bromont
ZBN	Bus Station	IT	Bozen
ZBO	Bowen	AU	Bowen
ZBP	Baltimore Rail	US	Baltimore
ZBR	Chah-Bahar	IR	Chah-Bahar
ZBU	Aarhus Limo	DK	Aarhus Limo
ZBV	Beaver Creek Van Svce.	US	Vail/Eagle
ZBY	Sayaboury	LA	Sayaboury
ZBZ	Xin Hui Ferry	CN	Xin Hui
ZCA	Tai Shan	CN	Tai Shan
ZCD	Breitenau AAF	DE	Bamberg
ZCL	La Calera	MX	Zacatecas
ZCO	Maquehue	CL	Temuco
ZCP	Foshan Ferry	CN	Foshan
ZCU	She Kou Ferry	CN	She Kou
ZDM	Ramallah Heliport	PS	Ramallah
ZDU	ScotRail	GB	Dundee
ZEC	Secunda	ZA	Secunda
ZEF	Nanhai Ferry	CN	Nanhai
ZEG	Senggo	ID	Senggo
ZEL	Bella Bella	CA	Bella Bella
ZEM	East Main	CA	East Main
ZEN	Zenag	PG	Zenag
ZEP	Victoria Railway Stn.	GB	London
ZEQ	Bus Station	GB	Dewsbury
ZER	Zero	IN	Zero
ZFA	Faro	CA	Faro
ZFB	Old Fort Bay	CA	Old Fort Bay
ZFC	Bus Station	GB	Bradford
ZFD	Fond Du Lac	CA	Fond Du Lac
ZFJ	Rennes	FR	Rennes
ZFL	South Trout Lake	CA	South Trout Lake
ZFM	Fort Mcpherson	CA	Fort Mcpherson
ZFN	Tulita	CA	Tulita/Fort Norman
ZFQ	Gare de Bordeaux	FR	Bordeaux
ZFR	Frankfurt/Oder Railway	DE	Frankfurt/Oder
ZFU	Aruja	BR	Aruja
ZFW	Fairview	CA	Fairview
ZFZ	Buffalo Depew Rr	US	Buffalo
ZGA	Gera Railway	DE	Gera
ZGC	Zhongchuan	CN	Lanzhou
ZGD	New London Rail	US	Groton
ZGE	Goerlitz Railway	DE	Goerlitz
ZGF	Grand Forks	CA	Grand Forks
ZGG	ScotRail	GB	Glasgow
ZGI	Gods River	CA	Gods River
ZGL	South Galway	AU	South Galway
ZGM	Ngoma	ZM	Ngoma
ZGN	Zhongshan Ferry Port	CN	Zhongshan
ZGO	Gotha Railway	DE	Gotha
ZGR	Little Grand Rapids	CA	Little Grand Rapids
ZGS	Gethsemani	CA	Gethsemani
ZGU	Gaua	VU	Gaua
ZGW	Greifswald Railway	DE	Greifswald
ZGY	Kuching Port	MY	Kuching
ZGZ	GermanRail Pass	DE	Fictitious Point/AA2
ZHA	Zhanjiang	CN	Zhanjiang
ZHC	N Philadelphia Rail St	US	Philadelphia
ZHM	Shamshernagar	BD	Shamshernagar
ZHO	Bus Station	CA	Houston
ZHP	High Prairie	CA	High Prairie
ZHZ	Halle Railway	DE	Halle
ZIC	Victoria	CL	Victoria
ZIE	Harbour (Eolie Island)	IT	Vulcano
ZIF	Fallowfield Railway	CA	Ottawa
ZIG	Ziguinchor	SN	Ziguinchor
ZIH	Internacional	MX	Ixtapa/Zihuatanejo
ZIP	Harbour (Eolie Island)	IT	Lipari
ZIQ	Harbour (Eolie Island)	IT	Salina
ZIU	Railway	DE	Aachen
ZIV	ScotRail	GB	Inverness
ZIY	Lianhuashan Port	CN	Lianhuashan
ZJB	Kuantan Port	MY	Kuantan
ZJE	Harbour (Eolie Island)	IT	Panarea
ZJG	Jenpeg	CA	Jenpeg
ZJJ	Harbour	IT	Procida
ZJK	Off Line Point	HK	Chek Lap Kok
ZJN	Swan River	CA	Swan River
ZJR	Penang Port	MY	Penang
ZJS	Jena Railway	DE	Jena
ZJT	Tanjung Pelepas Port	MY	Tanjung Pelepas
ZJX	Harbour (Eolie Island)	IT	Stromboli
ZJY	Harbour	IT	Ponza
ZKB	Kasaba Bay	ZM	Kasaba Bay
ZKD	Leningradskiy Rail Stn	RU	Moscow
ZKE	Kaschechewan	CA	Kaschechewan
ZKG	Kegaska	CA	Kegaska
ZKL	Steenkool	ID	Steenkool
ZKM	Sette Cama	GA	Sette Cama
ZKP	Kasompe	ZM	Kasompe
ZLG	El Gouera	MR	El Gouera
ZLK	Moscovskiy Railway Stn	RU	St Petersburg
ZLO	Manzanillo	MX	Manzanillo
ZLT	La Tabatiere	CA	La Tabatiere
ZLW	Pasir Gudang Port	MY	Pasir Gudang
ZLX	British Rail Terminal	GB	London
ZMD	Sena Madureira	BR	Sena Madureira
ZME	Metropark Rail	US	Newark
ZMF	Beverello Harbor	IT	Naples
ZMI	Mergellina Railway Svc	IT	Naples
ZMJ	Mergellina Harbour	IT	Naples
ZMK	Bintulu Port	MY	Bintulu
ZML	Milwaukee General Mitchell	US	Milwaukee,
ZMM	Zamora	MX	Zamora
ZMO	Bus Station	IT	Modena
ZMR	Bus Station	IT	Meran
ZMS	S.M. Novella Rail.Svc	IT	Florence
ZMT	Masset	CA	Masset
ZMY	Harbour	CN	Huangpu
ZNA	Harbour	CA	Nanaimo
ZNC	Nyac	US	Nyac
ZND	Zinder	NE	Zinder
ZNE	Newman	AU	Newman
ZNG	Negginan	CA	Negginan
ZNU	Namu	CA	Namu, BC
ZNZ	Kisauni	TZ	Zanzibar
ZOF	Ocean Falls	CA	Ocean Falls
ZOS	Canal Balo	CL	Osorno
ZPB	Sachigo Lake	CA	Sachigo Lake
ZPC	Pucon	CL	Pucon
ZPH	Zephyrhills	US	Zephyrhills
ZPO	Pine House	CA	Pine House
ZQN	Queenstown	NZ	Queenstown
ZQS	Queen Charlotte Is	CA	Queen Charlotte Is
ZQW	Zweibruecken Airport	DE	Zweibrücken
ZRC	Bus Station	ES	San Pedro de Alcantara
ZRD	Richmond VA Rail	US	Richmond
ZRF	Park & Ride Bus Svc	US	Rockford
ZRH	Zürich-Kloten	CH	Zurich
ZRI	Serui	ID	Serui
ZRJ	Round Lake	CA	Round Lake
ZRK	VanGalder Bus Termina	US	Rockford
ZRL	Lancaster PA Rail	US	Lancaster
ZRM	Sarmi	ID	Sarmi
ZRP	Pennsylvania Railroad Station	US	Newark
ZRR	Harbour	CA	Fiumicino
ZRS	Flexenpass Heliport	AT	Zurs/Lech
ZRT	Hartford CT Rail	US	Hartford
ZRU	Boston RT128 Rail	US	Boston
ZRV	Providence Rail	US	Providence
ZRZ	New Carrolton RR	US	Washington
ZSA	San Salvador	BS	San Salvador
ZSE	St Pierre dela Reunion	RE	St Pierre dela Reunion
ZSH	Bus Station	US	Santa Fe
ZSJ	Sandy Lake	CA	Sandy Lake
ZSP	St Paul	CA	St Paul
ZSS	Sassandra	CI	Sassandra
ZST	Stewart	CA	Stewart
ZSU	Dessau Railway Stn.	DE	Dessau
ZSW	Seal Cove	CA	Prince Rupert
ZSZ	Railway Station	NA	Swakopmund
ZTA	Tureira	PF	Tureira
ZTB	Tete-a-La Baleine	CA	Tete-a-La Baleine
ZTD	Schenectady Rail	US	Schenectady
ZTE	Rochester NY Rail	US	Rochester
ZTF	Stamford Rail STN	US	Westchester County
ZTH	Zakinthos International Airport	GR	Zakinthos
ZTI	Humen Port	CN	Humen
ZTJ	Princeton JT Rail	US	Princeton
ZTL	Bus Station	US	Telluride
ZTM	Shamattawa	CA	Shamattawa
ZTN	Trenton Rail STN	US	Philadelphia
ZTO	Boston South Rail	US	Boston
ZTR	Zhitomir Airport	UA	Zhitomir
ZTS	Tahsis	CA	Tahsis
ZTT	Cottbus Railway Stn.	DE	Cottbus
ZTY	Boston BKBAY Rail	US	Boston
ZTZ	Chemnitz Railway Stn.	DE	Chemnitz
ZUA	Utica NNY Rail	US	Utica
ZUC	Ignace	CA	Ignace
ZUD	Ancud	CL	Ancud
ZUE	Zuenoula	CI	Zuenoula
ZUG	Harrisburg Rail	US	Harrisburg
ZUH	Zhuhai Airport	CN	Zhuhai
ZUL	Zilfi	SA	Zilfi
ZUM	Churchill Falls	CA	Churchill Falls
ZVA	Miandrivazo	MG	Miandrivazo
ZVE	New Haven Rail	US	New Haven
ZVG	Springvale	AU	Springvale
ZVK	Savannakhet	LA	Savannakhet
ZVM	Messe-BF Railway Servi	DE	Hanover
ZVR	Hanover Railway	DE	Hanover
ZWA	Andapa	MG	Andapa
ZWB	Williamsburg Rail	US	Hampton
ZWH	Railway Station	NA	Windhoek
ZWI	Wilmington Rail	US	Wilmington
ZWL	Wollaston Lake	CA	Wollaston Lake
ZWR	Kota Kinabalu Port	MY	Kota Kinabalu
ZWW	Newport News Rail	US	Hampton
ZXP	ScotRail	GB	Perth
ZXS	Exchangest Railway Svc	US	Buffalo
ZXT	Heydar Aliyev	AZ	Baku
ZYB	SNCB Rail Network	BE	SNCB Rail Network
ZYD	Lisbon TP	PT	Lisbon
ZYF	Faro TP	PT	Faro
ZYH	Holland Spoor Rail Station	NL	The Hague
ZYI	Zunyi	CN	Zunyi
ZYL	Osmani International	BD	Sylhet
ZYN	Railway	FR	Nimes
ZYQ	Syracuse NY Rail	US	Syracuse
ZYR	Midi Railway Station	BE	Brussels
ZYZ	Berchem Railway Stn.	BE	Antwerp
ZZU	Mzuzu	MW	Mzuzu
ZZV	Zanesville	US	Zanesville
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countries (code, name) FROM stdin;
AD	Andorra
AE	United Arab Emirates
AF	Afghanistan
AG	Antigua And Barbuda
AI	Anguilla
AL	Albania
AM	Armenia
AN	Netherlands Antilles
AO	Angola
AQ	Antarctica
AR	Argentina
AS	American Samoa
AT	Austria
AU	Australia
AW	Aruba
AZ	Azerbaijan
BA	Bosnia And Herzegovina
BB	Barbados
BD	Bangladesh
BE	Belgium
BF	Burkina Faso
BG	Bulgaria
BH	Bahrain
BI	Burundi
BJ	Benin
BM	Bermuda
BN	Brunei Darussalam
BO	Bolivia
BR	Brazil
BS	Bahamas
BT	Bhutan
BW	Botswana
BY	Belarus
BZ	Belize
CA	Canada
CC	Cocos (Keeling) Islands
CD	Democratic Republic of Congo (Zaire)
CF	Central African Republic
CG	Congo
CH	Switzerland
CI	Cote D'Ivoire (Ivory Coast)
CK	Cook Islands
CL	Chile
CM	Cameroon
CN	China
CO	Colombia
CR	Costa Rica
CS	Serbia
CU	Cuba
CV	Cape Verde
CX	Christmas Island
CY	Cyprus
CZ	Czech Republic
DE	Germany
DJ	Djibouti
DK	Denmark
DM	Dominica
DO	Dominican Republic
DZ	Algeria
EC	Ecuador
EE	Estonia
EG	Egypt
ER	Eritrea
ES	Spain
ET	Ethiopia
FI	Finland
FJ	Fiji
FK	Falkland Islands
FM	Micronesia
FO	Faroe Islands
FR	France
GA	Gabon
GB	United Kingdom
GD	Grenada
GE	Georgia
GF	French Guiana
GH	Ghana
GI	Gibraltar
GL	Greenland
GM	Gambia
GN	Guinea
GO	Nikita
GP	Guadeloupe
GQ	Equatorial Guinea
GR	Greece
GT	Guatemala
GU	Guam (USA)
GW	Guinea-Bissau
GY	Guyana
HK	Hong Kong
HN	Honduras
HR	Croatia (Hrvatska)
HT	Haiti
HU	Hungary
ID	Indonesia
IE	Ireland
IL	Israel
IN	India
IQ	Iraq
IR	Iran
IS	Iceland
IT	Italy
JM	Jamaica
JO	Jordan
JP	Japan
KE	Kenya
KG	Kyrgyzstan
KH	Cambodia
KI	Kiribati
KM	Comoros
KN	Saint Kitts And Nevis
KP	Korea (North)
KR	Korea (South)
KW	Kuwait
KY	Cayman Islands
KZ	Kazakhstan
LA	Laos
LB	Lebanon
LC	Saint Lucia
LK	Sri Lanka
LR	Liberia
LS	Lesotho
LT	Lithuania
LU	Luxembourg
LV	Latvia
LY	Libya
MA	Morocco
MC	Monaco
MD	Moldova
ME	Montenegro
MG	Madagascar
MH	Marshall Islands
MK	Macedonia
ML	Mali
MM	Myanmar
MN	Mongolia
MO	Macau
MP	Northern Mariana Islands
MQ	Martinique
MR	Mauritania
MS	Montserrat
MT	Malta
MU	Mauritius
MV	Maldives
MW	Malawi
MX	Mexico
MY	Malaysia
MZ	Mozambique
NA	Namibia
NC	New Caledonia
NE	Niger
NF	Norfolk Island
NG	Nigeria
NI	Nicaragua
NL	Netherlands
NO	Norway
NP	Nepal
NR	Nauru
NU	Niue
NZ	New Zealand (aotearoa)
OM	Oman
PA	Panama
PE	Peru
PF	French Polynesia
PG	Papua New Guinea
PH	Philippines
PK	Pakistan
PL	Poland
PM	St. Pierre And Miquelon
PN	Papua New Guinea
PR	Puerto Rico
PS	Palestine
PT	Portugal
PW	Palau
PY	Paraguay
QA	Qatar
RE	Reunion
RO	Romania
RS	Serbia
RU	Russian Federation
RW	Rwanda
SA	Saudi Arabia
SB	Solomon Islands
SC	Seychelles
SD	Sudan
SE	Sweden
SG	Singapore
SH	St. Helena
SI	Slovenia
SK	Slovakia
SL	Sierra Leone
SN	Senegal
SO	Somalia
SR	Suriname
ST	Sao Tome and Principe
SV	El Salvador
SY	Syria
SZ	Swaziland
TC	Turks and Caicos Islands
TD	Chad
TG	Togo
TH	Thailand
TJ	Tajikistan
TM	Turkmenistan
TN	Tunisia
TO	Tonga
TP	East Timor-Indonesia
TR	Turkey
TT	Trinidad And Tobago
TV	Tuvalu
TW	Taiwan
TZ	Tanzania
UA	Ukraine
UG	Uganda
UM	US Minor Outlying Islands
US	United States
UY	Uruguay
UZ	Uzbekistan
VC	Saint Vincent And The Grenadines
VE	Venezuela
VG	British Virgin Islands
VI	Virgin Islands(U.S.)
VN	Viet Nam
VU	Vanuatu
WF	Wallis and Futuna Islands
WS	Samoa
YE	Yemen
YU	Yugoslavia
ZA	South Africa
ZM	Zambia
ZR	Zaire
ZW	Zimbabwe
\.


--
-- Data for Name: countriesfull; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countriesfull (code2, code3, name, continentcode, continentname) FROM stdin;
AD	AND	Andorra, Principality of	EU	Europe
AE	ARE	United Arab Emirates	AS	Asia
AF	AFG	Afghanistan, Islamic Republic of	AS	Asia
AG	ATG	Antigua and Barbuda	NA	North America
AI	AIA	Anguilla	NA	North America
AL	ALB	Albania, Republic of	EU	Europe
AM	ARM	Armenia, Republic of	AS	Asia
AM	ARM	Armenia, Republic of	EU	Europe
AN	ANT	Netherlands Antilles	NA	North America
AO	AGO	Angola, Republic of	AF	Africa
AQ	ATA	Antarctica (the territory South of 60 deg S)	AN	Antarctica
AR	ARG	Argentina, Argentine Republic	SA	South America
AS	ASM	American Samoa	OC	Oceania
AT	AUT	Austria, Republic of	EU	Europe
AU	AUS	Australia, Commonwealth of	OC	Oceania
AW	ABW	Aruba	NA	North America
AX	ALA	Ãƒâ€¦land Islands	EU	Europe
AZ	AZE	Azerbaijan, Republic of	AS	Asia
AZ	AZE	Azerbaijan, Republic of	EU	Europe
BA	BIH	Bosnia and Herzegovina	EU	Europe
BB	BRB	Barbados	NA	North America
BD	BGD	Bangladesh, People's Republic of	AS	Asia
BE	BEL	Belgium, Kingdom of	EU	Europe
BF	BFA	Burkina Faso	AF	Africa
BG	BGR	Bulgaria, Republic of	EU	Europe
BH	BHR	Bahrain, Kingdom of	AS	Asia
BI	BDI	Burundi, Republic of	AF	Africa
BJ	BEN	Benin, Republic of	AF	Africa
BL	BLM	Saint Barthelemy	NA	North America
BM	BMU	Bermuda	NA	North America
BN	BRN	Brunei Darussalam	AS	Asia
BO	BOL	Bolivia, Republic of	SA	South America
BQ	BES	Bonaire, Sint Eustatius and Saba	NA	North America
BR	BRA	Brazil, Federative Republic of	SA	South America
BS	BHS	Bahamas, Commonwealth of the	NA	North America
BT	BTN	Bhutan, Kingdom of	AS	Asia
BV	BVT	Bouvet Island (Bouvetoya)	AN	Antarctica
BW	BWA	Botswana, Republic of	AF	Africa
BY	BLR	Belarus, Republic of	EU	Europe
BZ	BLZ	Belize	NA	North America
CA	CAN	Canada	NA	North America
CC	CCK	Cocos (Keeling) Islands	AS	Asia
CD	COD	Congo, Democratic Republic of the	AF	Africa
CF	CAF	Central African Republic	AF	Africa
CG	COG	Congo, Republic of the	AF	Africa
CH	CHE	Switzerland, Swiss Confederation	EU	Europe
CI	CIV	Cote d'Ivoire, Republic of	AF	Africa
CK	COK	Cook Islands	OC	Oceania
CL	CHL	Chile, Republic of	SA	South America
CM	CMR	Cameroon, Republic of	AF	Africa
CN	CHN	China, People's Republic of	AS	Asia
CO	COL	Colombia, Republic of	SA	South America
CR	CRI	Costa Rica, Republic of	NA	North America
CU	CUB	Cuba, Republic of	NA	North America
CV	CPV	Cape Verde, Republic of	AF	Africa
CW	CUW	CuraÃƒÂ§ao	NA	North America
CX	CXR	Christmas Island	AS	Asia
CY	CYP	Cyprus, Republic of	AS	Asia
CY	CYP	Cyprus, Republic of	EU	Europe
CZ	CZE	Czech Republic	EU	Europe
DE	DEU	Germany, Federal Republic of	EU	Europe
DJ	DJI	Djibouti, Republic of	AF	Africa
DK	DNK	Denmark, Kingdom of	EU	Europe
DM	DMA	Dominica, Commonwealth of	NA	North America
DO	DOM	Dominican Republic	NA	North America
DZ	DZA	Algeria, People's Democratic Republic of	AF	Africa
EC	ECU	Ecuador, Republic of	SA	South America
EE	EST	Estonia, Republic of	EU	Europe
EG	EGY	Egypt, Arab Republic of	AF	Africa
EH	ESH	Western Sahara	AF	Africa
ER	ERI	Eritrea, State of	AF	Africa
ES	ESP	Spain, Kingdom of	EU	Europe
ET	ETH	Ethiopia, Federal Democratic Republic of	AF	Africa
FI	FIN	Finland, Republic of	EU	Europe
FJ	FJI	Fiji, Republic of the Fiji Islands	OC	Oceania
FK	FLK	Falkland Islands (Malvinas)	SA	South America
FM	FSM	Micronesia, Federated States of	OC	Oceania
FO	FRO	Faroe Islands	EU	Europe
FR	FRA	France, French Republic	EU	Europe
GA	GAB	Gabon, Gabonese Republic	AF	Africa
GB	GBR	United Kingdom of Great Britain & Northern Ireland	EU	Europe
GD	GRD	Grenada	NA	North America
GE	GEO	Georgia	AS	Asia
GE	GEO	Georgia	EU	Europe
GF	GUF	French Guiana	SA	South America
GG	GGY	Guernsey, Bailiwick of	EU	Europe
GH	GHA	Ghana, Republic of	AF	Africa
GI	GIB	Gibraltar	EU	Europe
GL	GRL	Greenland	NA	North America
GM	GMB	Gambia, Republic of the	AF	Africa
GN	GIN	Guinea, Republic of	AF	Africa
GP	GLP	Guadeloupe	NA	North America
GQ	GNQ	Equatorial Guinea, Republic of	AF	Africa
GR	GRC	Greece, Hellenic Republic	EU	Europe
GS	SGS	South Georgia and the South Sandwich Islands	AN	Antarctica
GT	GTM	Guatemala, Republic of	NA	North America
GU	GUM	Guam	OC	Oceania
GW	GNB	Guinea-Bissau, Republic of	AF	Africa
GY	GUY	Guyana, Co-operative Republic of	SA	South America
HK	HKG	Hong Kong, Special Administrative Region of China	AS	Asia
HM	HMD	Heard Island and McDonald Islands	AN	Antarctica
HN	HND	Honduras, Republic of	NA	North America
HR	HRV	Croatia, Republic of	EU	Europe
HT	HTI	Haiti, Republic of	NA	North America
HU	HUN	Hungary, Republic of	EU	Europe
ID	IDN	Indonesia, Republic of	AS	Asia
IE	IRL	Ireland	EU	Europe
IL	ISR	Israel, State of	AS	Asia
IM	IMN	Isle of Man	EU	Europe
IN	IND	India, Republic of	AS	Asia
IO	IOT	British Indian Ocean Territory (Chagos Archipelago)	AS	Asia
IQ	IRQ	Iraq, Republic of	AS	Asia
IR	IRN	Iran, Islamic Republic of	AS	Asia
IS	ISL	Iceland, Republic of	EU	Europe
IT	ITA	Italy, Italian Republic	EU	Europe
JE	JEY	Jersey, Bailiwick of	EU	Europe
JM	JAM	Jamaica	NA	North America
JO	JOR	Jordan, Hashemite Kingdom of	AS	Asia
JP	JPN	Japan	AS	Asia
KE	KEN	Kenya, Republic of	AF	Africa
KG	KGZ	Kyrgyz Republic	AS	Asia
KH	KHM	Cambodia, Kingdom of	AS	Asia
KI	KIR	Kiribati, Republic of	OC	Oceania
KM	COM	Comoros, Union of the	AF	Africa
KN	KNA	Saint Kitts and Nevis, Federation of	NA	North America
KP	PRK	Korea, Democratic People's Republic of	AS	Asia
KR	KOR	Korea, Republic of	AS	Asia
KW	KWT	Kuwait, State of	AS	Asia
KY	CYM	Cayman Islands	NA	North America
KZ	KAZ	Kazakhstan, Republic of	AS	Asia
KZ	KAZ	Kazakhstan, Republic of	EU	Europe
LA	LAO	Lao People's Democratic Republic	AS	Asia
LB	LBN	Lebanon, Lebanese Republic	AS	Asia
LC	LCA	Saint Lucia	NA	North America
LI	LIE	Liechtenstein, Principality of	EU	Europe
LK	LKA	Sri Lanka, Democratic Socialist Republic of	AS	Asia
LR	LBR	Liberia, Republic of	AF	Africa
LS	LSO	Lesotho, Kingdom of	AF	Africa
LT	LTU	Lithuania, Republic of	EU	Europe
LU	LUX	Luxembourg, Grand Duchy of	EU	Europe
LV	LVA	Latvia, Republic of	EU	Europe
LY	LBY	Libyan Arab Jamahiriya	AF	Africa
MA	MAR	Morocco, Kingdom of	AF	Africa
MC	MCO	Monaco, Principality of	EU	Europe
MD	MDA	Moldova, Republic of	EU	Europe
ME	MNE	Montenegro, Republic of	EU	Europe
MF	MAF	Saint Martin	NA	North America
MG	MDG	Madagascar, Republic of	AF	Africa
MH	MHL	Marshall Islands, Republic of the	OC	Oceania
MK	MKD	Macedonia, The Former Yugoslav Republic of	EU	Europe
ML	MLI	Mali, Republic of	AF	Africa
MM	MMR	Myanmar, Union of	AS	Asia
MN	MNG	Mongolia	AS	Asia
MO	MAC	Macao, Special Administrative Region of China	AS	Asia
MP	MNP	Northern Mariana Islands, Commonwealth of the	OC	Oceania
MQ	MTQ	Martinique	NA	North America
MR	MRT	Mauritania, Islamic Republic of	AF	Africa
MS	MSR	Montserrat	NA	North America
MT	MLT	Malta, Republic of	EU	Europe
MU	MUS	Mauritius, Republic of	AF	Africa
MV	MDV	Maldives, Republic of	AS	Asia
MW	MWI	Malawi, Republic of	AF	Africa
MX	MEX	Mexico, United Mexican States	NA	North America
MY	MYS	Malaysia	AS	Asia
MZ	MOZ	Mozambique, Republic of	AF	Africa
NA	NAM	Namibia, Republic of	AF	Africa
NC	NCL	New Caledonia	OC	Oceania
NE	NER	Niger, Republic of	AF	Africa
NF	NFK	Norfolk Island	OC	Oceania
NG	NGA	Nigeria, Federal Republic of	AF	Africa
NI	NIC	Nicaragua, Republic of	NA	North America
NL	NLD	Netherlands, Kingdom of the	EU	Europe
NO	NOR	Norway, Kingdom of	EU	Europe
NP	NPL	Nepal, State of	AS	Asia
NR	NRU	Nauru, Republic of	OC	Oceania
NU	NIU	Niue	OC	Oceania
NZ	NZL	New Zealand	OC	Oceania
OM	OMN	Oman, Sultanate of	AS	Asia
PA	PAN	Panama, Republic of	NA	North America
PE	PER	Peru, Republic of	SA	South America
PF	PYF	French Polynesia	OC	Oceania
PG	PNG	Papua New Guinea, Independent State of	OC	Oceania
PH	PHL	Philippines, Republic of the	AS	Asia
PK	PAK	Pakistan, Islamic Republic of	AS	Asia
PL	POL	Poland, Republic of	EU	Europe
PM	SPM	Saint Pierre and Miquelon	NA	North America
PN	PCN	Pitcairn Islands	OC	Oceania
PR	PRI	Puerto Rico, Commonwealth of	NA	North America
PS	PSE	Palestinian Territory, Occupied	AS	Asia
PT	PRT	Portugal, Portuguese Republic	EU	Europe
PW	PLW	Palau, Republic of	OC	Oceania
PY	PRY	Paraguay, Republic of	SA	South America
QA	QAT	Qatar, State of	AS	Asia
RE	REU	Reunion	AF	Africa
RO	ROU	Romania	EU	Europe
RS	SRB	Serbia, Republic of	EU	Europe
RU	RUS	Russian Federation	AS	Asia
RU	RUS	Russian Federation	EU	Europe
RW	RWA	Rwanda, Republic of	AF	Africa
SA	SAU	Saudi Arabia, Kingdom of	AS	Asia
SB	SLB	Solomon Islands	OC	Oceania
SC	SYC	Seychelles, Republic of	AF	Africa
SD	SDN	Sudan, Republic of	AF	Africa
SE	SWE	Sweden, Kingdom of	EU	Europe
SG	SGP	Singapore, Republic of	AS	Asia
SH	SHN	Saint Helena	AF	Africa
SI	SVN	Slovenia, Republic of	EU	Europe
SJ	SJM	Svalbard & Jan Mayen Islands	EU	Europe
SK	SVK	Slovakia (Slovak Republic)	EU	Europe
SL	SLE	Sierra Leone, Republic of	AF	Africa
SM	SMR	San Marino, Republic of	EU	Europe
SN	SEN	Senegal, Republic of	AF	Africa
SO	SOM	Somalia, Somali Republic	AF	Africa
SR	SUR	Suriname, Republic of	SA	South America
SS	SSD	South Sudan	AF	Africa
ST	STP	Sao Tome and Principe, Democratic Republic of	AF	Africa
SV	SLV	El Salvador, Republic of	NA	North America
SX	SXM	Sint Maarten (Netherlands)	NA	North America
SY	SYR	Syrian Arab Republic	AS	Asia
SZ	SWZ	Swaziland, Kingdom of	AF	Africa
TC	TCA	Turks and Caicos Islands	NA	North America
TD	TCD	Chad, Republic of	AF	Africa
TF	ATF	French Southern Territories	AN	Antarctica
TG	TGO	Togo, Togolese Republic	AF	Africa
TH	THA	Thailand, Kingdom of	AS	Asia
TJ	TJK	Tajikistan, Republic of	AS	Asia
TK	TKL	Tokelau	OC	Oceania
TL	TLS	Timor-Leste, Democratic Republic of	AS	Asia
TM	TKM	Turkmenistan	AS	Asia
TN	TUN	Tunisia, Tunisian Republic	AF	Africa
TO	TON	Tonga, Kingdom of	OC	Oceania
TR	TUR	Turkey, Republic of	AS	Asia
TR	TUR	Turkey, Republic of	EU	Europe
TT	TTO	Trinidad and Tobago, Republic of	NA	North America
TV	TUV	Tuvalu	OC	Oceania
TW	TWN	Taiwan	AS	Asia
TZ	TZA	Tanzania, United Republic of	AF	Africa
UA	UKR	Ukraine	EU	Europe
UG	UGA	Uganda, Republic of	AF	Africa
UM	UMI	United States Minor Outlying Islands	NA	North America
UM	UMI	United States Minor Outlying Islands	OC	Oceania
US	USA	United States of America	NA	North America
UY	URY	Uruguay, Eastern Republic of	SA	South America
UZ	UZB	Uzbekistan, Republic of	AS	Asia
VA	VAT	Holy See (Vatican City State)	EU	Europe
VC	VCT	Saint Vincent and the Grenadines	NA	North America
VE	VEN	Venezuela, Bolivarian Republic of	SA	South America
VG	VGB	British Virgin Islands	NA	North America
VI	VIR	United States Virgin Islands	NA	North America
VN	VNM	Vietnam, Socialist Republic of	AS	Asia
VU	VUT	Vanuatu, Republic of	OC	Oceania
WF	WLF	Wallis and Futuna	OC	Oceania
WS	WSM	Samoa, Independent State of	OC	Oceania
XD	   	United Nations Neutral Zone	AS	Asia
XE	   	Iraq-Saudi Arabia Neutral Zone	AS	Asia
XS	   	Spratly Islands	AS	Asia
XX	   	Disputed Territory	OC	Oceania
YE	YEM	Yemen	AS	Asia
YT	MYT	Mayotte	AF	Africa
ZA	ZAF	South Africa, Republic of	AF	Africa
ZM	ZMB	Zambia, Republic of	AF	Africa
ZW	ZWE	Zimbabwe, Republic of	AF	Africa
\.


--
-- Data for Name: flights; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.flights (airline, flightnr, departure_time, departure_airport, destination_time, destination_airport, planetype) FROM stdin;
AA	000	2009-10-20 10:57:27	CMA	2009-10-20 13:09:27	IZT	63
AC	703	2012-02-29 16:53:21	PTQ	2012-02-29 21:57:21	MLU	28
AG	190	2010-06-07 20:37:59	VCP	2010-06-07 21:09:59	HYV	27
AG	730	2010-05-13 22:28:05	WAC	2010-05-13 23:00:05	OYN	64
AI	049	2010-05-14 01:06:14	OYN	2010-05-14 04:30:14	IGM	31
AJ	504	2011-01-17 07:23:31	CVH	2011-01-17 15:15:31	PKZ	46
AL	253	2009-12-28 06:48:56	HWK	2009-12-28 08:28:56	YBR	26
AP	510	2011-04-22 17:33:37	BDS	2011-04-22 23:45:37	MCC	45
AR	948	2010-04-12 17:31:39	YXD	2010-04-12 18:03:39	BKB	57
AY	270	2010-09-30 12:44:52	WAC	2010-09-30 20:00:52	KIZ	50
AZ	330	2009-07-08 00:22:14	KIZ	2009-07-08 18:22:14	IGM	41
BD	914	2010-11-09 05:04:40	ZYR	2010-11-09 07:20:40	DGB	60
BH	798	2009-10-04 05:48:36	BZE	2009-10-04 07:28:36	BAG	44
BI	595	2009-10-16 20:30:03	TUI	2009-10-16 22:46:03	BOV	61
BO	396	2012-03-04 03:01:12	HJJ	2012-03-04 08:05:12	SZF	64
BO	711	2010-10-29 11:23:58	GRE	2010-10-29 14:11:58	PLL	66
BP	603	2010-03-16 19:26:23	RBB	2010-03-16 22:14:23	FIZ	60
BQ	963	2011-06-18 09:57:30	VIE	2011-06-18 17:13:30	CJH	23
BS	047	2011-08-04 09:07:51	MNT	2011-08-04 11:23:51	CUV	67
BT	177	2011-05-09 21:16:11	WGE	2011-05-09 23:32:11	CNI	51
BW	093	2011-03-24 15:58:06	DTN	2011-03-24 23:14:06	TIW	59
CK	148	2009-06-24 09:09:03	LSK	2009-06-24 11:25:03	CDA	31
CM	505	2010-11-19 07:57:21	ESF	2010-11-19 10:09:21	XYV	63
CO	489	2011-03-10 01:37:55	YYU	2011-03-10 04:25:55	SSS	63
CR	451	2009-06-08 22:23:31	GYR	2009-06-09 04:23:31	TKH	65
CS	927	2010-07-31 09:05:28	FNK	2010-07-31 13:01:28	QHA	61
CU	936	2011-12-07 16:48:33	MWY	2011-12-07 17:20:33	HNA	59
CW	360	2010-08-23 20:20:00	OGO	2010-08-23 22:00:00	XYP	46
CX	042	2010-10-05 06:03:15	AYW	2010-10-05 13:23:15	GMS	35
DH	815	2009-08-31 11:26:06	AIC	2009-08-31 18:46:06	DHM	52
DU	320	2011-04-13 15:44:59	LRM	2011-04-13 18:32:59	PAL	42
DW	464	2010-03-31 06:47:48	LFT	2010-03-31 07:19:48	YAF	60
ED	170	2012-04-06 16:51:42	TLB	2012-04-06 21:55:42	TMY	46
EI	833	2010-01-24 21:35:31	BTA	2010-01-24 22:07:31	BTA	31
EJ	348	2012-03-19 00:36:20	SLT	2012-03-19 05:04:20	TCV	53
EK	316	2010-09-08 07:05:43	KDF	2010-09-08 12:45:43	MVV	64
ER	756	2012-04-15 06:00:43	CGE	2012-04-15 08:52:43	SXE	56
FC	549	2009-11-05 06:13:42	EVV	2009-11-05 11:53:42	HAY	35
FD	003	2010-09-10 12:40:03	JEF	2010-09-10 16:00:03	LOX	40
FE	776	2010-02-19 09:18:42	KAG	2010-02-19 16:38:42	MBB	46
FF	496	2009-07-11 10:10:19	CNX	2009-07-11 14:06:19	BFW	23
FG	352	2010-08-17 19:24:43	BMC	2010-08-17 22:48:43	VOZ	45
FG	910	2010-09-16 08:16:45	MVW	2010-09-16 15:00:45	HSZ	56
FL	875	2011-11-17 16:59:01	UGB	2011-11-17 17:31:01	MEC	54
FM	538	2012-04-20 15:56:47	IRO	2012-04-20 22:40:47	ASH	50
GA	435	2011-03-04 08:36:39	SBZ	2011-03-04 10:52:39	RYO	50
GK	472	2010-08-29 10:50:26	AUU	2010-08-29 14:46:26	YTO	42
GT	289	2009-10-31 11:46:18	ABJ	2009-10-31 18:30:18	MUK	51
GX	618	2011-09-16 13:55:38	CSB	2011-09-16 19:31:38	BFU	49
GY	199	2010-09-30 17:07:46	RNG	2010-09-30 19:59:46	CKM	68
GY	698	2010-07-19 21:08:27	BMN	2010-07-19 22:08:27	YMG	43
GZ	498	2011-11-09 00:10:32	CAK	2011-11-09 03:34:32	ASY	34
HG	034	2009-10-23 13:30:20	ARV	2009-10-23 19:06:20	JCN	37
HH	762	2010-06-23 08:03:28	VIF	2010-06-23 15:23:28	HSI	27
HJ	543	2010-03-01 19:55:31	NIS	2010-03-01 22:43:31	NCU	38
HM	100	2009-12-15 15:33:15	TIO	2009-12-15 18:57:15	CIO	61
HM	740	2011-01-29 02:05:41	VDB	2011-01-29 20:05:41	YAE	34
HT	131	2011-01-07 05:09:31	IMT	2011-01-07 10:49:31	LPO	34
HW	661	2010-05-31 13:32:27	EBR	2010-05-31 19:44:27	BJB	27
HX	552	2010-06-27 16:42:37	PAO	2010-06-27 22:54:37	VYD	24
HZ	845	2011-05-11 12:57:42	GOA	2011-05-11 18:33:42	NCA	24
IB	848	2012-01-25 15:50:48	VIE	2012-01-25 23:06:48	POQ	44
ID	590	2009-07-06 07:22:09	XZA	2009-07-06 10:46:09	RHE	57
IE	831	2011-09-13 03:48:15	TRZ	2011-09-13 11:40:15	CUC	41
IH	874	2009-10-24 18:13:36	TEF	2009-10-24 23:53:36	MDF	41
IH	960	2011-09-11 12:34:18	ILF	2011-09-11 17:38:18	LTB	38
II	736	2009-09-23 12:22:41	YRI	2009-09-23 14:38:41	VEV	28
II	787	2011-06-10 05:12:38	RES	2011-06-10 09:08:38	CGU	44
IJ	984	2011-01-21 08:48:25	DJM	2011-01-21 12:08:25	YDX	59
IM	310	2011-09-18 11:59:01	XTL	2011-09-18 14:11:01	GBL	60
IT	126	2010-07-18 02:29:13	STR	2010-07-18 08:05:13	PEL	46
IV	845	2009-07-04 07:55:05	DAU	2009-07-04 13:31:05	CLU	60
JE	967	2010-07-17 14:27:35	BFI	2010-07-17 18:23:35	DPE	43
JG	442	2009-12-11 09:32:49	LCH	2009-12-11 16:16:49	CVR	62
JG	970	2010-11-01 08:18:12	WUA	2010-11-01 15:02:12	OZP	63
JM	165	2010-04-10 02:11:38	CGZ	2010-04-10 07:15:38	TCF	46
JP	194	2011-10-05 18:39:35	BHH	2011-10-05 19:11:35	OUU	61
JR	359	2012-01-21 07:04:33	BYQ	2012-01-21 14:24:33	GLT	53
JU	300	2010-11-21 03:50:15	EAB	2010-11-21 21:50:15	EYP	41
JX	493	2011-07-18 09:50:39	MXM	2011-07-18 13:46:39	FEJ	25
JX	858	2011-07-13 21:15:06	CIX	2011-07-14 07:10:06	ANY	37
JY	579	2011-10-04 11:28:48	BKN	2011-10-04 17:40:48	GOS	26
KB	848	2011-11-15 22:34:41	HRE	2011-11-15 23:06:41	RFR	37
KE	346	2010-12-31 20:39:19	BLK	2010-12-31 21:11:19	CCK	33
KJ	099	2010-08-25 11:31:06	SDK	2010-08-25 18:15:06	AQS	34
KQ	514	2010-04-10 09:26:29	FIN	2010-04-10 13:22:29	SVO	60
KR	834	2011-09-25 18:49:22	KHL	2011-09-25 22:09:22	MZZ	69
KS	670	2010-06-05 19:14:53	PSO	2010-06-05 22:02:53	ENE	26
KV	480	2009-10-08 22:22:03	MNV	2009-10-09 02:01:03	SZX	55
LH	594	2010-02-18 09:08:55	MZX	2010-02-18 13:40:55	RHA	63
LH	999	2010-04-17 15:37:05	VIT	2010-04-17 22:57:05	DGU	30
LI	770	2009-09-02 01:19:12	DRB	2009-09-02 19:19:12	AEX	64
LK	123	2012-02-09 01:12:37	CRA	2012-02-09 19:12:37	RLI	39
LL	033	2009-08-09 09:27:33	GTB	2009-08-09 11:43:33	CNU	60
LM	265	2011-11-06 12:05:46	DNF	2011-11-06 18:17:46	KQL	30
LN	368	2011-12-11 09:08:45	MDE	2011-12-11 16:28:45	LSW	61
LO	429	2011-01-24 11:58:57	HBO	2011-01-24 19:14:57	KBU	46
LQ	277	2009-08-08 18:32:32	XZN	2009-08-08 23:00:32	VGT	35
LY	192	2009-06-21 13:56:02	KLT	2009-06-21 15:36:02	AJR	31
LZ	819	2010-03-16 18:47:36	ZGU	2010-03-16 23:15:36	VAN	46
MA	031	2009-12-18 01:17:22	SDP	2009-12-18 09:09:22	BGN	42
MA	054	2011-10-15 20:53:17	MUZ	2011-10-15 22:33:17	LIL	36
ME	314	2009-08-12 14:15:09	SNL	2009-08-12 21:35:09	NVI	32
MH	777	2010-09-15 12:18:02	HJJ	2010-09-15 19:38:02	KSV	26
MJ	157	2010-05-31 01:58:18	MNK	2010-05-31 07:34:18	OPB	28
MR	502	2011-11-21 02:09:57	MFE	2011-11-21 20:09:57	BKZ	37
MS	156	2011-05-11 17:14:57	NTX	2011-05-11 21:10:57	MCJ	43
MW	301	2011-11-11 03:58:24	QAW	2011-11-11 06:46:24	YCX	41
MY	406	2011-12-03 12:33:15	SDK	2011-12-03 16:29:15	BUS	54
MY	683	2009-08-23 00:14:29	JCM	2009-08-23 04:10:29	ILH	43
NC	353	2012-03-31 10:20:51	GOG	2012-03-31 12:00:51	KDA	27
NM	827	2011-06-08 04:30:30	BZE	2011-06-08 06:10:30	OHA	64
NQ	464	2011-11-05 02:54:44	SGP	2011-11-05 09:38:44	MPO	39
NY	455	2010-08-02 21:47:05	DEI	2010-08-02 22:19:05	POM	68
OE	850	2011-10-24 17:13:31	CSI	2011-10-24 20:37:31	TMJ	35
OE	961	2011-06-06 02:42:11	EPH	2011-06-06 07:46:11	CTP	55
OM	653	2009-08-12 17:06:05	ZMD	2009-08-12 22:10:05	PET	51
ON	006	2010-08-24 08:14:29	ELO	2010-08-24 14:26:29	CME	47
OT	902	2009-08-24 15:41:37	UKT	2009-08-24 16:13:37	CPV	33
OX	194	2012-01-28 01:22:01	BIZ	2012-01-28 06:26:01	LSH	64
OZ	540	2011-06-10 09:57:48	AKG	2011-06-10 11:37:48	QUB	55
PA	925	2010-12-24 03:52:55	SSQ	2010-12-24 07:12:55	MIN	64
PC	347	2011-08-11 15:59:50	LMS	2011-08-11 23:51:50	AGD	57
PF	280	2011-09-04 02:46:16	IRG	2011-09-04 08:22:16	KEQ	52
PG	519	2010-12-29 17:12:34	DSM	2010-12-29 23:12:34	CDN	27
PG	707	2012-02-06 00:58:51	KNV	2012-02-06 07:42:51	TAT	32
PL	732	2010-11-14 16:21:54	ABO	2010-11-14 18:01:54	MGS	68
PN	034	2011-09-29 14:32:24	JCD	2011-09-29 20:08:24	SAN	54
PN	676	2009-05-26 01:01:07	FHZ	2009-05-26 06:05:07	OVL	69
PV	638	2011-10-21 19:01:03	EAL	2011-10-22 07:31:03	ESD	56
PW	078	2011-07-26 17:46:39	LWA	2011-07-26 18:18:39	MDN	65
QC	028	2009-05-25 12:19:16	ZBU	2009-05-25 15:07:16	YMC	26
QH	303	2012-02-01 21:33:50	DMA	2012-02-01 22:05:50	EMG	60
QI	552	2012-01-10 17:02:08	ORQ	2012-01-10 19:18:08	KCR	60
QJ	126	2012-05-13 05:05:21	EAR	2012-05-13 10:09:21	FCT	54
QL	170	2012-05-11 06:44:12	JHB	2012-05-11 14:36:12	RCL	29
QS	265	2011-11-19 16:38:39	CUD	2011-11-19 21:06:39	CMN	50
QT	439	2011-05-03 17:38:29	CQF	2011-05-03 19:54:29	PYE	29
QT	668	2009-12-23 08:41:52	BXU	2009-12-23 14:53:52	MGA	33
RJ	342	2009-06-28 13:57:47	AIR	2009-06-28 20:41:47	TTO	53
RK	238	2011-11-27 10:37:50	OZH	2011-11-27 12:53:50	ILP	30
RK	576	2011-03-25 12:51:48	CSH	2011-03-25 13:23:48	VIY	66
RO	333	2011-12-03 17:33:25	YQK	2011-12-03 23:45:25	FCH	34
RQ	132	2010-02-01 13:03:27	MDP	2010-02-01 20:23:27	STE	46
RQ	584	2011-08-13 02:51:23	KOL	2011-08-13 06:47:23	OSZ	66
RR	464	2011-04-16 19:23:26	CHM	2011-04-16 23:55:26	SKR	38
RW	070	2011-06-22 03:55:06	PTB	2011-06-22 06:43:06	GDA	27
SA	023	2011-02-21 20:56:23	LUI	2011-02-21 21:28:23	PKN	34
SE	783	2010-09-16 18:08:33	BIT	2010-09-16 23:48:33	TLN	36
SH	007	2010-09-24 01:45:06	OMO	2010-09-24 09:01:06	EVA	41
SL	779	2009-09-20 19:40:59	PBK	2009-09-20 23:36:59	SFF	46
SO	298	2009-10-19 18:02:58	BCU	2009-10-19 21:26:58	BUM	24
SP	590	2010-04-25 19:34:25	KEB	2010-04-25 23:30:25	NCI	25
ST	115	2009-09-11 10:52:37	LOT	2009-09-11 13:40:37	CVI	35
SV	458	2010-09-22 06:28:09	RFD	2010-09-22 13:48:09	DGF	24
TF	518	2009-07-07 17:25:10	BVI	2009-07-07 19:41:10	PCR	28
TH	035	2011-07-23 20:00:55	LMQ	2011-07-23 22:16:55	YCX	48
TI	643	2009-06-22 00:47:57	NBR	2009-06-22 08:03:57	TKK	69
TK	728	2011-07-15 20:50:49	PAD	2011-07-15 23:38:49	UCT	60
TV	077	2011-01-30 16:13:21	JEM	2011-01-30 21:17:21	NKI	42
TX	227	2010-08-03 18:45:28	TEX	2010-08-03 19:17:28	LBW	46
TZ	551	2011-07-12 19:00:06	UKK	2011-07-13 03:50:06	GUB	48
UB	871	2009-08-18 08:07:30	NAM	2009-08-18 11:31:30	LLY	59
UL	324	2011-12-04 03:11:09	VGD	2011-12-04 10:31:09	FAZ	53
UP	288	2010-10-13 02:13:50	AFZ	2010-10-13 07:17:50	CDG	60
UP	766	2009-10-16 20:55:10	FSN	2009-10-16 22:35:10	RUN	53
UP	872	2010-05-03 03:25:38	VIE	2010-05-03 05:05:38	FTE	61
UY	613	2010-04-14 07:13:32	TUW	2010-04-14 11:45:32	DSD	34
VF	979	2009-06-24 21:29:57	NCU	2009-06-24 22:01:57	KIA	52
VJ	110	2010-02-28 12:09:08	MDE	2010-02-28 14:25:08	INV	37
VN	563	2012-03-31 05:11:09	TUJ	2012-03-31 11:23:09	SIW	65
VP	343	2012-03-16 22:18:24	TLR	2012-03-17 19:00:24	ECS	35
VP	373	2011-01-12 06:39:50	PXS	2011-01-12 10:35:50	YTN	48
VS	414	2011-02-01 01:39:27	ARH	2011-02-01 03:55:27	WYA	65
VV	284	2009-11-29 11:44:30	HUE	2009-11-29 18:28:30	RCO	49
VW	526	2011-05-20 20:54:22	PSP	2011-05-20 23:06:22	BJN	40
WA	456	2010-04-02 12:12:49	XCO	2010-04-02 18:24:49	BGN	47
WA	868	2010-07-25 20:52:37	LKD	2010-07-25 23:40:37	IAR	23
WE	454	2011-09-03 16:13:43	MCZ	2011-09-03 19:01:43	LBT	38
WK	404	2012-03-18 23:17:45	HBI	2012-03-19 14:21:45	AHE	38
WN	540	2011-08-20 02:44:29	BAQ	2011-08-20 20:44:29	AQB	42
WO	636	2010-02-20 13:26:06	TWB	2010-02-20 17:58:06	KLG	44
XG	233	2011-02-02 00:39:27	PSL	2011-02-02 03:27:27	PTM	32
XM	543	2011-03-14 05:20:45	AXN	2011-03-14 07:00:45	LUG	51
XO	285	2010-03-31 05:15:12	CPM	2010-03-31 23:15:12	IRB	35
XP	397	2011-04-23 09:44:29	XYA	2011-04-23 15:20:29	DAI	23
YV	570	2009-11-14 03:18:16	BSK	2009-11-14 11:10:16	IPE	62
ZH	274	2012-04-06 06:59:56	EUX	2012-04-06 11:27:56	YKC	25
ZI	167	2009-09-23 17:00:56	MYI	2009-09-23 23:12:56	YTR	57
ZW	994	2009-10-08 05:41:26	ENO	2009-10-08 13:33:26	FBY	48
\.


--
-- Data for Name: passengers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.passengers (id, firstname, lastname, airline, flightnr, rownr, seatposition) FROM stdin;
1	Gage	Vargas	UP	872 	21	F
2	Charles	Macdonald	TK	728 	43	C
3	Chanda	Carr	CW	360 	23	D
4	Karina	Carney	QC	028 	15	C
5	Ray	Leach	GY	698 	35	F
6	Jocelyn	Donaldson	GK	472 	28	A
7	Brielle	Bell	PV	638 	21	B
8	Regan	Guerra	QT	668 	13	F
9	Tad	Carrillo	ZH	274 	23	C
10	Autumn	Spears	YV	570 	8	A
11	Rooney	Richardson	UP	766 	18	E
12	Rhona	Sharp	LH	594 	33	B
13	Demetrius	Koch	LM	265 	5	D
14	Deborah	Beasley	AZ	330 	3	C
15	Carlos	Herman	BD	914 	3	A
16	Jeanette	Howell	KE	346 	34	A
17	Deacon	Scott	VP	343 	8	E
18	Bree	Blackwell	CX	042 	28	A
19	Alvin	Medina	KV	480 	11	A
20	Ivy	Craig	SH	007 	19	B
21	William	Wise	VN	563 	39	C
22	Tanek	Cote	PA	925 	5	A
23	Deanna	Cote	JX	493 	37	F
24	Jolene	Mckinney	IH	960 	33	A
25	Jeanette	Hill	PG	519 	43	F
26	Nichole	Reyes	TH	035 	25	A
27	Naomi	Cervantes	FD	003 	8	A
28	Xena	Cross	SE	783 	18	C
29	Idola	Dominguez	AG	190 	34	E
30	Brendan	Ferguson	EJ	348 	49	E
31	Kimberly	Fuentes	WN	540 	18	A
32	Bradley	Finley	ZH	274 	18	A
33	Zachary	Noel	ZH	274 	18	C
34	Indigo	Chaney	FG	910 	33	E
35	Camden	Albert	PW	078 	5	C
36	Evangeline	Sims	JM	165 	41	E
37	Jordan	Mullins	MA	031 	16	F
38	Martina	Gillespie	MR	502 	22	F
39	Bernard	Hendrix	VJ	110 	9	D
40	Justine	Spears	QJ	126 	17	B
41	Driscoll	Wilson	JM	165 	35	D
42	Nyssa	Reed	GZ	498 	16	D
43	Allen	Hardin	HZ	845 	47	F
44	Shana	Leonard	JX	493 	32	F
45	Emerald	Herring	BO	711 	26	A
46	Leonard	Collins	JU	300 	20	A
47	Addison	Gilliam	IB	848 	16	D
48	Amy	Dodson	KV	480 	35	A
49	Savannah	Carson	LL	033 	31	C
50	Mohammad	Lloyd	FM	538 	1	F
51	Pandora	Nguyen	LI	770 	11	B
52	Armand	Waters	IJ	984 	22	C
53	Cynthia	Brennan	WK	404 	41	F
54	Julian	Ruiz	WN	540 	38	F
55	Rafael	Becker	JP	194 	1	C
56	Ciara	Mooney	TV	077 	29	E
57	Cameran	Mcfadden	AZ	330 	8	B
58	Pascale	Richmond	MH	777 	36	A
59	Lunea	Thornton	PL	732 	31	F
60	Ivy	Alexander	AR	948 	45	B
61	Drew	Dunn	XO	285 	47	F
62	Orla	Mcmahon	PG	519 	44	C
63	Mira	Stout	EJ	348 	13	B
64	Noble	Bray	CK	148 	16	F
65	Merritt	Watkins	AZ	330 	44	A
66	Hasad	Page	WA	456 	13	B
67	Herman	Mccoy	BO	396 	48	C
68	Debra	Logan	II	736 	38	C
69	Noelani	Wood	FD	003 	25	E
70	Abdul	Le	QI	552 	35	F
71	Lisandra	Mclaughlin	ZW	994 	27	B
72	Ezra	Newman	HX	552 	3	F
73	Britanni	Hall	XM	543 	38	C
74	Kyle	Preston	RQ	584 	8	B
75	Heather	Mccullough	ST	115 	13	C
76	Robin	Cummings	HJ	543 	46	C
77	Ciara	Cardenas	LQ	277 	19	E
78	Cara	Phillips	MJ	157 	17	E
79	Zachary	Lindsey	IH	874 	3	B
80	Iris	Webster	LK	123 	36	C
81	Debra	Neal	DH	815 	43	D
82	Callie	Lambert	ME	314 	8	A
83	Yasir	Miles	SA	023 	12	F
84	Colorado	Sutton	WK	404 	5	D
85	Alisa	Sellers	NY	455 	34	C
86	Gregory	Lamb	BW	093 	4	D
87	Denton	Hewitt	JX	858 	29	F
88	Maia	Kelly	PV	638 	44	A
89	Nash	Maddox	FG	352 	1	A
90	Sydney	Henson	PF	280 	3	B
91	Mariam	Gonzalez	BW	093 	21	C
92	Evelyn	Brown	PG	519 	17	C
93	Raja	Bowen	CU	936 	30	F
94	Grace	Adams	RQ	584 	9	A
95	Edward	Burt	VW	526 	10	D
96	Kameko	Horn	MW	301 	21	B
97	Len	Pratt	BO	396 	31	E
98	Leila	Mack	CS	927 	23	D
99	Eagan	Stanley	SL	779 	8	A
100	Nayda	Todd	II	787 	13	A
101	Buckminster	Hodges	AZ	330 	2	F
102	Xavier	Fulton	AJ	504 	20	E
103	Whoopi	Harper	AL	253 	49	E
104	Glenna	Estes	KQ	514 	35	A
105	Ursula	Robinson	ZI	167 	31	D
106	Russell	Walsh	CR	451 	31	C
107	Dawn	Barr	IE	831 	11	E
108	John	Vega	JG	970 	31	D
109	Caldwell	Mcintyre	ED	170 	14	E
110	Phillip	Cain	JE	967 	11	D
111	Felix	Whitley	JY	579 	7	F
112	Eagan	Figueroa	KJ	099 	41	C
113	Heidi	Gibbs	BO	711 	7	E
114	Raja	Moon	RQ	132 	34	D
115	Holmes	Caldwell	RK	576 	3	F
116	Abigail	Bradford	AG	190 	24	F
117	Simone	Mcdowell	WE	454 	39	E
118	Selma	Mckee	MY	406 	39	B
119	Ulysses	Ballard	ME	314 	3	F
120	Helen	Moss	MY	683 	21	C
121	Jada	Gregory	IV	845 	3	B
122	Lacy	Kelley	ED	170 	8	E
123	Chandler	Bruce	QT	668 	30	A
124	Iola	Bray	WK	404 	5	F
125	Amber	Park	RK	576 	6	B
126	Ethan	Clarke	VJ	110 	42	A
127	Akeem	Harper	TV	077 	22	F
128	Constance	Golden	QH	303 	12	C
129	Latifah	Page	FF	496 	34	A
130	Stacy	Gardner	SP	590 	20	E
131	Larissa	Calderon	GY	199 	34	C
132	Ebony	Mccoy	UP	872 	33	E
133	Warren	Bell	MR	502 	14	F
134	Basil	Oneal	OX	194 	40	D
135	Mark	Everett	ME	314 	10	D
136	Calista	Baker	RK	238 	40	C
137	Daquan	Waller	RW	070 	34	A
138	Meghan	Holcomb	FD	003 	7	A
139	Yuri	Cline	NQ	464 	24	A
140	Tallulah	Kelley	HT	131 	25	E
141	Basia	Bowman	II	736 	45	F
142	Whoopi	Patterson	JX	493 	13	E
143	Ignatius	Whitaker	UL	324 	30	C
144	Rae	Malone	DW	464 	43	A
145	Gisela	Evans	BS	047 	30	F
146	Tanner	Hays	FG	352 	32	F
147	Barbara	Franco	IB	848 	12	E
148	Shaeleigh	Johnston	MW	301 	40	C
149	Jael	Wells	DU	320 	26	F
150	Ashely	Mullins	SV	458 	17	F
151	Grant	Aguirre	OX	194 	38	D
152	Skyler	Camacho	PC	347 	35	F
153	Aidan	Deleon	AJ	504 	2	C
154	Myra	Lindsay	AG	190 	34	A
155	Jarrod	Bryant	AR	948 	45	B
156	Gray	Mcdowell	WK	404 	48	A
157	Tobias	Johnston	HJ	543 	41	B
158	Kibo	Irwin	CX	042 	33	B
159	Brandon	Adams	JU	300 	8	F
160	Mari	Vincent	WK	404 	14	A
161	Cleo	Riley	BQ	963 	17	B
162	Lavinia	Mccray	IB	848 	23	A
163	Lacota	Baxter	JP	194 	16	F
164	Cody	Nielsen	LZ	819 	2	C
165	Perry	Nelson	ZH	274 	16	B
166	Sara	Garza	IB	848 	43	B
167	Rogan	Howard	WO	636 	13	A
168	Ferdinand	Norton	ID	590 	38	B
169	Phoebe	Morris	AA	000 	46	A
170	Britanni	Ramirez	BW	093 	8	E
171	Odysseus	Preston	MY	406 	12	A
172	Kitra	Cash	NY	455 	21	D
173	Hayden	Lyons	HM	740 	27	D
174	Carolyn	Cannon	KR	834 	25	B
175	Octavius	Daniel	HH	762 	30	E
176	Cain	Dodson	FE	776 	43	F
177	Aline	Vincent	TI	643 	33	A
178	Reece	Graves	LH	594 	10	C
179	Heidi	Wallace	MW	301 	9	B
180	Dalton	Ashley	ME	314 	23	A
181	Raymond	Doyle	EK	316 	45	F
182	Brynn	Shaw	JX	493 	45	F
183	Chaim	Pate	IJ	984 	45	C
184	Avram	Molina	TX	227 	8	B
185	Aaron	Barker	RJ	342 	21	D
186	Tatiana	Key	SP	590 	21	C
187	Mercedes	Dejesus	GY	199 	1	E
188	Ruth	Horn	ON	006 	48	C
189	Breanna	Zamora	JX	493 	5	E
190	Chava	Fowler	CS	927 	43	D
191	Imani	Stafford	ON	006 	15	D
192	Alfreda	Becker	SP	590 	10	C
193	Quyn	Knapp	LO	429 	9	B
194	Griffin	Nielsen	QH	303 	16	C
195	Alisa	Smith	PF	280 	1	B
196	Casey	Casey	NM	827 	34	D
197	Lucy	Pruitt	PC	347 	27	D
198	Zia	Langley	CU	936 	40	C
199	Colleen	Chavez	LK	123 	40	E
200	Vaughan	Santiago	BO	396 	37	A
201	Joelle	Bailey	OE	961 	40	A
202	Noelle	Hopkins	XP	397 	2	F
203	Cody	Martinez	LI	770 	44	A
204	Quintessa	Howe	TI	643 	24	B
205	Orson	Cameron	ZI	167 	1	E
206	Audra	Nicholson	CX	042 	48	C
207	Jasmine	Kaufman	HX	552 	35	D
208	Meredith	Foreman	WE	454 	32	C
209	Blake	Barton	JU	300 	43	F
210	Catherine	Wood	IT	126 	4	D
211	Carissa	Fitzpatrick	RJ	342 	20	B
212	Kathleen	Hartman	JG	970 	39	E
213	Shelley	Cameron	PW	078 	9	C
214	Chester	Greene	AY	270 	5	D
215	Yoshi	Sharpe	ST	115 	13	D
216	Hu	Horton	NQ	464 	6	D
217	Kaseem	Hooper	WA	868 	32	F
218	Ella	Berger	AA	000 	46	A
219	Chase	Robles	ID	590 	12	F
220	Gail	Wagner	SA	023 	49	A
221	Natalie	Gibbs	CX	042 	49	F
222	Aline	Brennan	LQ	277 	44	A
223	Channing	Rasmussen	IJ	984 	44	E
224	Mariam	Conway	LK	123 	28	D
225	Lilah	Roberts	IT	126 	24	A
226	Preston	Foster	GY	199 	28	E
227	Shaeleigh	Potts	AA	000 	43	E
228	Dexter	Banks	IH	874 	2	A
229	Logan	Gilmore	RR	464 	38	F
230	Joelle	Padilla	SA	023 	48	C
231	Lacey	Walters	PV	638 	7	B
232	Madonna	Calderon	HH	762 	49	A
233	Cheryl	Mcconnell	GY	698 	45	F
234	Pascale	Walton	SL	779 	22	B
235	Jameson	Flowers	QC	028 	17	A
236	Lamar	Pope	QL	170 	22	E
237	September	Acosta	IJ	984 	48	E
238	Summer	Frost	GY	199 	16	F
239	Rebecca	Gates	WO	636 	38	B
240	Daquan	Merritt	RK	576 	43	A
241	Wilma	Matthews	WN	540 	17	B
242	Kareem	Burgess	AP	510 	2	F
243	Gillian	Hendrix	JX	493 	4	C
244	Tad	Gates	FL	875 	49	D
245	Callum	Sanders	LH	999 	13	C
246	Carl	Bond	KJ	099 	43	B
247	Uriah	Doyle	AG	190 	29	B
248	Harding	Willis	QC	028 	9	A
249	James	Chapman	CU	936 	18	D
250	Jolie	Spence	SA	023 	8	F
251	Laith	Moore	LL	033 	7	C
252	Brandon	Moss	PG	519 	37	A
253	Russell	Price	KV	480 	12	D
254	Barclay	Love	UP	872 	12	D
255	Ursula	Tyson	VS	414 	26	B
256	Matthew	Hinton	II	736 	41	D
257	Whoopi	Walters	IE	831 	46	D
258	Stewart	Williams	RQ	132 	36	D
259	Herrod	Olsen	UP	288 	40	F
260	Trevor	Hudson	LQ	277 	15	E
261	Walker	Savage	LK	123 	36	C
262	Isabella	Bonner	ED	170 	38	A
263	Lysandra	Page	ST	115 	21	C
264	Jorden	Waller	AZ	330 	5	F
265	Rina	Knapp	SO	298 	49	D
266	Iris	Pugh	DU	320 	6	B
267	Nolan	Hensley	UP	766 	30	E
268	Cedric	Brennan	VW	526 	6	C
269	Henry	Young	RR	464 	42	A
270	Lani	Tucker	SL	779 	40	A
271	Clark	Camacho	HJ	543 	27	A
272	Marsden	Paul	HZ	845 	33	F
273	Melodie	Hyde	ER	756 	19	D
274	Ashely	Merritt	GZ	498 	6	A
275	Reed	Church	IB	848 	14	B
276	Lenore	Hampton	TZ	551 	5	D
277	Cecilia	Martin	EK	316 	36	E
278	Carson	Howard	YV	570 	39	C
279	Lev	Jennings	MA	054 	4	A
280	Cara	Riley	PC	347 	7	A
281	Tamara	Morse	RJ	342 	7	C
282	Teegan	Cook	OE	850 	47	B
283	Lynn	Whitney	LN	368 	26	E
284	Yoko	Barnes	BT	177 	6	E
285	Mira	Dickerson	BI	595 	43	C
286	Jenna	Chapman	LM	265 	30	D
287	Jennifer	Sharpe	DH	815 	44	F
288	Sasha	Deleon	ST	115 	24	A
289	Scarlett	Frederick	RW	070 	40	B
290	Chloe	Porter	UP	766 	8	A
291	Emily	Franks	FM	538 	47	D
292	Emily	Simmons	JX	858 	7	F
293	Tana	Fowler	RQ	584 	40	A
294	Michelle	Owens	WO	636 	2	C
295	Quail	May	CX	042 	40	E
296	Addison	Walls	NQ	464 	25	B
297	Emma	Love	IE	831 	44	F
298	Brenda	Conner	QS	265 	4	F
299	Duncan	Levy	JX	493 	14	E
300	Alana	Gonzalez	JX	858 	8	A
301	Ingrid	Scott	CU	936 	14	D
302	Marcia	Carney	LH	999 	32	D
303	Travis	Williamson	GA	435 	3	B
304	Davis	Jefferson	LL	033 	31	F
305	Heather	Larsen	SH	007 	36	C
306	Virginia	Myers	EJ	348 	44	F
307	Kylynn	Whitley	NM	827 	28	B
308	Genevieve	Gardner	ME	314 	35	C
309	Jasper	Decker	CM	505 	46	F
310	Liberty	Velazquez	HZ	845 	38	F
311	Mark	Carpenter	JR	359 	35	C
312	Orlando	Gaines	NM	827 	4	A
313	Russell	Sharpe	QC	028 	9	B
314	Bryar	Massey	QH	303 	1	A
315	Pamela	Hinton	VJ	110 	20	C
316	Fredericka	Cotton	TI	643 	10	E
317	Velma	Klein	PV	638 	23	C
318	Serena	Bowers	QT	668 	25	B
319	Marny	Guthrie	PG	707 	9	F
320	Karly	Davis	TK	728 	16	E
321	Callie	Harmon	LN	368 	48	E
322	Brock	Cotton	OE	961 	29	B
323	Victor	Hewitt	FL	875 	27	F
324	Roanna	Gibbs	GZ	498 	28	C
325	Stephen	Good	FM	538 	49	F
326	Theodore	Middleton	JP	194 	17	D
327	Zane	Ware	MJ	157 	22	D
328	Risa	Lawrence	ME	314 	23	F
329	Clementine	Torres	GA	435 	21	C
330	Aurora	Hunter	JY	579 	42	C
331	Chantale	Simon	IM	310 	37	F
332	Curran	Knapp	VW	526 	45	C
333	Oprah	Lindsay	AL	253 	9	D
334	Phoebe	Obrien	FC	549 	17	B
335	Leila	Love	GX	618 	40	E
336	Glenna	Warren	CW	360 	35	C
337	Gray	Hunt	HZ	845 	41	A
338	Geraldine	Reilly	JY	579 	15	E
339	Marshall	Clayton	JR	359 	49	C
340	Xandra	Blanchard	PF	280 	6	D
341	Shelly	Best	FG	352 	31	B
342	Richard	Herman	HM	100 	18	D
343	Thane	Haley	HH	762 	3	D
344	Josiah	Hines	SE	783 	5	A
345	Holmes	Foley	EJ	348 	14	D
346	Rosalyn	Mckee	AJ	504 	22	C
347	Cody	Livingston	RO	333 	9	F
348	Thomas	Blackburn	EK	316 	43	A
349	Sawyer	Olson	FF	496 	48	C
350	Rose	Rios	CM	505 	12	F
351	Deirdre	Lopez	OX	194 	21	E
352	Jemima	Leonard	ID	590 	33	D
353	Patricia	Ochoa	TF	518 	4	A
354	Cecilia	Whitaker	AR	948 	42	F
355	Quintessa	Ayala	QS	265 	8	A
356	Gary	Harding	ER	756 	39	D
357	Casey	Harper	OE	961 	2	F
358	Nolan	Meyers	OM	653 	37	F
359	Haley	Jackson	BS	047 	21	D
360	Kelly	Jones	PN	676 	2	D
361	Orli	Colon	AR	948 	10	A
362	Levi	Dickerson	WN	540 	3	E
363	Sebastian	Kelley	TZ	551 	38	E
364	Vielka	Roberts	IM	310 	8	C
365	Karleigh	Dorsey	LI	770 	19	F
366	Brandon	Charles	GZ	498 	13	F
367	Sage	Higgins	CU	936 	25	D
368	Alana	Ross	QJ	126 	36	C
369	Aimee	Harrington	LM	265 	5	E
370	Hannah	Frost	AY	270 	5	B
371	Caryn	Rosales	FE	776 	47	B
372	Hanae	Mccoy	WA	456 	11	E
373	Linus	Dennis	SA	023 	30	D
374	Yasir	Gill	AR	948 	37	B
375	Serena	Barrera	IH	960 	15	B
376	Paula	Cantu	HM	100 	25	F
377	Sybill	Bowers	LH	999 	41	C
378	Ignacia	Valenzuela	HW	661 	18	A
379	Jolie	Bender	AG	730 	34	D
380	Priscilla	Meyers	EJ	348 	4	E
381	Mara	Thornton	AL	253 	24	B
382	Kylynn	Hunt	BO	396 	45	F
383	Ora	Anthony	OT	902 	26	B
384	Delilah	Workman	II	787 	26	B
385	Joel	Castaneda	KB	848 	28	B
386	Brooke	Roberts	ON	006 	44	E
387	Darryl	Webster	BT	177 	7	E
388	Alyssa	Rowland	PL	732 	18	F
389	Christian	Frye	CU	936 	17	C
390	Zelenia	Dyer	TH	035 	8	A
391	Kitra	Randolph	MA	054 	31	F
392	Nerea	Good	EJ	348 	21	D
393	Jolie	Forbes	UL	324 	29	A
394	Conan	Reilly	SV	458 	47	A
395	Ezra	Bell	MR	502 	3	D
396	Hedwig	Guerra	VV	284 	37	D
397	Abbot	Wiggins	GZ	498 	25	B
398	Sopoline	Weber	XP	397 	42	E
399	Germaine	Cote	JM	165 	46	A
400	Delilah	Patton	TF	518 	22	B
401	Serena	Short	SP	590 	12	E
402	Jaden	Frank	QH	303 	49	D
403	Elmo	Wheeler	WA	456 	31	B
404	Hu	Owens	PN	034 	2	F
405	Caldwell	Dawson	UP	872 	9	A
406	Summer	Rosales	II	736 	22	D
407	Griffith	Roman	FD	003 	21	A
408	Erasmus	Hunt	FD	003 	39	A
409	Acton	Parsons	SA	023 	28	D
410	Camden	Kemp	HJ	543 	8	D
411	Blair	Cook	CS	927 	34	B
412	Lance	Tanner	GY	698 	6	E
413	Gay	Rosales	OT	902 	49	B
414	Kelly	Vaughan	ST	115 	31	D
415	Lucian	Hancock	LH	594 	37	E
416	Palmer	Meyers	BP	603 	20	D
417	Indira	Bird	LQ	277 	12	F
418	Valentine	Langley	HW	661 	4	F
419	Carlos	Downs	PW	078 	47	E
420	Beck	Burgess	OX	194 	13	E
421	Hillary	Conway	MH	777 	39	E
422	Charlotte	Dickson	NM	827 	15	C
423	Anika	Mcleod	TI	643 	42	B
424	Mira	Diaz	HW	661 	26	A
425	Nayda	Hawkins	IT	126 	25	B
426	Tanner	Gamble	MW	301 	19	B
427	Maite	Wall	TF	518 	17	D
428	Kyra	Hensley	SH	007 	30	C
429	Macey	Mcmillan	TZ	551 	25	F
430	Shellie	Frank	VW	526 	4	C
431	Berk	Kline	II	736 	33	B
432	Wylie	Grant	AZ	330 	27	D
433	Dennis	Wilkins	WN	540 	44	B
434	Britanni	Pugh	LO	429 	17	D
435	Aimee	Bradley	PG	707 	30	C
436	Nolan	Rodriguez	JX	858 	24	A
437	Unity	Guzman	TX	227 	11	B
438	Mara	Burt	BI	595 	39	E
439	Erasmus	Case	RQ	132 	25	E
440	Kennan	Baird	KR	834 	26	D
441	Harper	Summers	AL	253 	16	B
442	Cynthia	Olson	LH	594 	47	D
443	Melyssa	Anderson	ZI	167 	7	E
444	Odysseus	Vaughn	HM	740 	14	C
445	Sawyer	Vasquez	VP	343 	44	B
446	Jessamine	Witt	KR	834 	6	D
447	Mariam	Patrick	EI	833 	17	B
448	Melissa	Yang	QS	265 	41	A
449	Gary	Russo	QH	303 	20	F
450	Hedwig	Poole	BT	177 	23	C
451	Ora	Harding	JP	194 	20	C
452	Branden	Bonner	PV	638 	19	F
453	Bertha	Day	DU	320 	11	B
454	Lacy	Dennis	IB	848 	46	A
455	Gregory	Garcia	VP	373 	6	E
456	James	Nicholson	SP	590 	31	D
457	Myles	Baldwin	CR	451 	38	D
458	Ray	Floyd	VP	373 	18	C
459	Linda	Carver	DW	464 	7	F
460	Ava	Davidson	RK	238 	47	B
461	Ria	Stout	JG	970 	35	B
462	Grant	Hurley	TX	227 	13	E
463	Isadora	Hendrix	UP	288 	20	A
464	Connor	Vargas	HZ	845 	47	B
465	Violet	Wilder	AG	730 	8	F
466	Omar	Silva	GY	698 	2	E
467	Odysseus	Conrad	AP	510 	28	F
468	Iona	Hatfield	CX	042 	16	D
469	Kirsten	Robinson	BD	914 	38	E
470	Chloe	Ayers	EJ	348 	12	E
471	David	Ingram	PW	078 	30	B
472	Jade	Chambers	WE	454 	27	B
473	Wang	Blake	KQ	514 	44	A
474	Tiger	Anderson	HX	552 	47	F
475	Fuller	Vazquez	KE	346 	37	F
476	Porter	Fields	DU	320 	18	B
477	Orson	Owen	BD	914 	20	B
478	Charde	Pugh	QC	028 	37	E
479	Xyla	French	NC	353 	13	A
480	Ebony	Preston	ZH	274 	9	F
481	Micah	Leon	JU	300 	15	E
482	Samuel	Irwin	NY	455 	7	D
483	Addison	Morse	VV	284 	22	A
484	Larissa	Reynolds	SE	783 	33	B
485	Flynn	Heath	WO	636 	33	D
486	Shelby	Barnes	UP	872 	38	E
487	Remedios	Foster	SV	458 	33	E
488	Adrian	Ball	XM	543 	34	B
489	Christine	Sanders	CK	148 	9	B
490	Briar	Richmond	BQ	963 	21	A
491	Lee	Ellis	SH	007 	8	A
492	Kitra	Burns	PC	347 	14	F
493	Dean	Petersen	JR	359 	40	A
494	Latifah	Vazquez	QI	552 	39	F
495	Melinda	Graves	MY	406 	25	F
496	Ariel	Woods	OE	961 	41	E
497	Axel	Tate	HJ	543 	7	B
498	Kimberly	Meyer	VF	979 	38	F
499	Gannon	Bates	CX	042 	43	D
500	Kyla	Jones	OZ	540 	2	D
501	Aladdin	Rodgers	CW	360 	41	D
502	Dominique	Roach	SA	023 	36	E
503	Erin	Sharpe	BT	177 	16	A
504	Jade	Hanson	ER	756 	47	D
505	Hedda	Barton	VW	526 	13	A
506	Alisa	Joyce	HX	552 	13	B
507	Aretha	Cooper	HZ	845 	17	E
508	August	Hansen	XP	397 	46	B
509	Ciara	Hahn	PC	347 	10	A
510	Irma	Buckley	BO	396 	23	D
511	Kermit	Martinez	WA	868 	43	C
512	Naomi	Ewing	IH	960 	46	F
513	Ian	Dunn	JX	858 	26	F
514	Joshua	Charles	SE	783 	41	B
515	Maia	Buckley	TK	728 	38	B
516	Hayfa	Carpenter	PA	925 	39	F
517	Brendan	Williamson	GY	698 	33	A
518	Kelly	Scott	JG	442 	35	C
519	Anastasia	Small	VS	414 	20	D
520	Quyn	Hahn	MW	301 	9	D
521	Louis	Davidson	WN	540 	34	B
522	Justine	Larsen	DW	464 	9	A
523	Bo	Frye	ZI	167 	49	F
524	Vielka	Melendez	VS	414 	34	D
525	Jenette	Cruz	AC	703 	41	B
526	Carter	Griffin	BT	177 	39	E
527	Aladdin	Burke	WK	404 	40	E
528	Sloane	Gray	LH	594 	39	E
529	Kelly	Roberts	KV	480 	8	A
530	Noah	Mejia	TV	077 	11	D
531	Jelani	Stout	QJ	126 	15	E
532	Garrett	Massey	MR	502 	5	B
533	September	Cleveland	FE	776 	42	F
534	Eaton	Blackwell	UL	324 	28	A
535	Kane	Dickson	QS	265 	3	A
536	Hedley	Potter	ZI	167 	26	A
537	Odysseus	Lynch	DU	320 	45	A
538	Sarah	Bauer	MW	301 	5	F
539	Driscoll	Crawford	EJ	348 	42	D
540	Clarke	May	UP	766 	35	E
541	Xandra	Lindsey	AA	000 	5	E
542	Macy	Rodriguez	QI	552 	19	D
543	Piper	Gilbert	LL	033 	30	B
544	Damon	Walls	JP	194 	1	E
545	Charissa	Farley	PN	676 	25	F
546	Yasir	Yates	JX	858 	38	D
547	Luke	Kinney	RQ	132 	5	F
548	Deanna	Horne	SL	779 	37	B
549	Colton	Hogan	UB	871 	38	F
550	Grady	Franks	BW	093 	20	D
551	Renee	Fisher	IJ	984 	31	E
552	Jonah	Bryan	ED	170 	23	F
553	Ross	Mercado	ST	115 	17	B
554	Chandler	Hines	EI	833 	13	A
555	Orson	Maxwell	PF	280 	24	B
556	Wallace	Murphy	EJ	348 	34	D
557	Castor	Mckee	TI	643 	15	F
558	Paula	Puckett	LY	192 	21	E
559	Wanda	Hull	PV	638 	13	F
560	Branden	Guerra	TF	518 	12	B
561	Bertha	Frederick	KR	834 	13	B
562	Jolie	Morris	AC	703 	42	F
563	Elaine	Spencer	FC	549 	27	E
564	Lars	Beck	EI	833 	30	A
565	Ursula	Shepherd	JM	165 	12	F
566	Bevis	Romero	LQ	277 	37	C
567	Cora	Michael	KS	670 	24	F
568	Gretchen	Mccarthy	JG	442 	45	C
569	Galena	Santana	OM	653 	34	E
570	Hyacinth	Raymond	RQ	584 	25	B
571	Constance	Holland	PL	732 	44	C
572	Isadora	Guthrie	PN	034 	2	B
573	Imani	Hoover	IE	831 	7	B
574	Sylvia	Mccullough	XP	397 	26	D
575	Tate	Crane	FD	003 	23	E
576	Elton	Robertson	XM	543 	8	F
577	Gisela	Kirby	RK	238 	26	A
578	Christopher	Hines	ER	756 	26	A
579	Andrew	Douglas	ED	170 	21	C
580	Willow	Rowland	GT	289 	31	B
581	Juliet	Padilla	XP	397 	25	F
582	Rudyard	Chapman	QT	668 	44	D
583	Vaughan	Vance	CS	927 	10	C
584	Maia	Conway	FG	910 	20	E
585	Donna	Trevino	QJ	126 	41	F
586	Matthew	Wilson	LL	033 	41	A
587	Danielle	Tucker	VW	526 	34	C
588	Jamal	Robinson	HM	740 	35	F
589	Ali	Conley	PV	638 	11	C
590	Donovan	Fields	DU	320 	49	A
591	Madonna	Cruz	BD	914 	9	A
592	Galvin	Hoover	PN	676 	29	F
593	Cade	Lawson	SA	023 	46	D
594	Mercedes	Carson	BO	711 	1	F
595	Phoebe	Fisher	CO	489 	42	F
596	Alexandra	Ray	UP	872 	43	C
597	Octavia	Buck	SO	298 	33	E
598	Xerxes	Morrison	MH	777 	22	D
599	Sean	Coleman	RR	464 	9	A
600	Barclay	Pugh	IH	960 	20	A
601	Joy	Duncan	TK	728 	44	D
602	Robin	Mclean	PC	347 	10	C
603	Baker	Pratt	AJ	504 	40	F
604	Beatrice	Gaines	CK	148 	45	E
605	Shaeleigh	Glenn	GK	472 	14	C
606	Wayne	Cook	DW	464 	8	C
607	Kaseem	Greene	II	736 	41	C
608	Jessamine	Bean	KQ	514 	17	B
609	Buckminster	Larson	NQ	464 	37	D
610	Walker	Estes	ED	170 	6	E
611	Aiko	Dean	BQ	963 	23	A
612	Medge	Shaw	CU	936 	49	E
613	Quentin	Lee	MA	054 	49	C
614	Hedda	Malone	SE	783 	18	E
615	Yasir	Jackson	XO	285 	47	F
616	Elliott	Davidson	DH	815 	2	B
617	George	Oconnor	AR	948 	43	F
618	Suki	Compton	II	736 	32	D
619	Brielle	Emerson	JR	359 	14	F
620	Pamela	Whitney	LQ	277 	46	E
621	Ethan	Franks	WK	404 	38	E
622	Remedios	Warren	QL	170 	30	A
623	Charles	Velasquez	JE	967 	46	B
624	Sara	Soto	OZ	540 	20	A
625	Cailin	Kramer	NY	455 	45	C
626	Callum	Stewart	HT	131 	32	A
627	Colton	Hewitt	UB	871 	44	E
628	Moana	Delacruz	LH	594 	36	D
629	Zoe	Snyder	LQ	277 	49	D
630	Burke	Nixon	DW	464 	48	D
631	Stella	Salazar	OE	850 	42	B
632	Trevor	Adams	IE	831 	23	D
633	Eagan	Christian	PA	925 	30	A
634	Emerald	Lang	QT	439 	25	A
635	Dakota	Farley	IB	848 	49	C
636	Donovan	Middleton	IH	874 	42	B
637	Colin	Sims	ED	170 	33	E
638	Patience	Pierce	RK	238 	2	C
639	Patricia	Mack	LM	265 	12	C
640	Alana	Hodges	RK	238 	42	D
641	Wesley	Blackburn	WA	868 	17	E
642	Dylan	David	LI	770 	38	E
643	Sopoline	Baxter	HH	762 	7	B
644	Byron	Morales	FE	776 	27	C
645	Aiko	Middleton	PA	925 	6	C
646	Kermit	Buckley	FL	875 	44	F
647	Phoebe	Russo	HH	762 	49	A
648	Hop	Cross	OE	850 	14	B
649	Chastity	Wilder	RK	238 	24	A
650	Whoopi	Peck	PN	676 	3	B
651	Keith	Newton	BT	177 	19	D
652	Denton	Wilson	ID	590 	1	A
653	Rowan	Berry	UL	324 	5	F
654	Marah	Wynn	WN	540 	13	B
655	Len	Mckee	QT	439 	15	E
656	Zena	Steele	SV	458 	16	C
657	Yael	Gray	HX	552 	32	A
658	Lael	Wyatt	NQ	464 	48	D
659	Rhoda	Silva	JG	442 	26	A
660	Diana	Norman	PG	519 	19	A
661	Abigail	Chapman	CM	505 	22	F
662	Chaim	Clements	HZ	845 	30	C
663	Yuri	Burns	TK	728 	31	A
664	Maxine	Bishop	KQ	514 	38	A
665	Jakeem	Davidson	OZ	540 	1	D
666	Hayes	Britt	DW	464 	34	D
667	Henry	Maxwell	RQ	584 	4	B
668	Samuel	Jacobs	RK	238 	22	B
669	Jada	Erickson	FC	549 	21	A
670	Alexander	Calderon	BO	396 	32	A
671	Candice	Marks	UP	766 	36	D
672	Tanner	Grant	WE	454 	35	B
673	Dahlia	Fischer	LN	368 	45	C
674	Jin	Daniels	PG	707 	25	A
675	Kyla	Hodge	DH	815 	34	D
676	Wayne	Petersen	DH	815 	20	A
677	Kuame	Jennings	EK	316 	31	B
678	Imani	Knowles	JE	967 	11	F
679	Fuller	Stevenson	FG	352 	47	F
680	Nathaniel	Gardner	WO	636 	47	B
681	Abdul	Turner	AL	253 	46	C
682	Iris	Glover	ON	006 	39	C
683	Shelley	Wells	RO	333 	38	A
684	Alec	Osborne	JM	165 	49	F
685	Chloe	Park	BP	603 	3	F
686	Kennan	Monroe	FC	549 	1	C
687	Zenaida	Carney	VS	414 	39	A
688	Conan	Lucas	LH	594 	24	F
689	Xanthus	Pearson	PN	676 	17	B
690	Samson	Ortiz	WK	404 	12	A
691	Phoebe	Oneil	DH	815 	32	C
692	Orlando	Weeks	GK	472 	43	F
693	Daryl	Walls	WN	540 	39	E
694	Cameron	Sears	LZ	819 	20	E
695	Zena	Delaney	IJ	984 	39	E
696	Cole	Knapp	VJ	110 	36	F
697	Delilah	Hernandez	UP	288 	22	F
698	Simone	Ratliff	PC	347 	45	D
699	Orson	Fernandez	BH	798 	13	E
700	Hedwig	Bailey	AI	049 	10	A
701	Cruz	Chambers	BT	177 	49	D
702	Beau	Barker	IT	126 	18	B
703	Britanni	Hubbard	PV	638 	21	A
704	Quamar	Mcmahon	LH	999 	9	F
705	Anika	Palmer	EK	316 	37	F
706	Timon	Navarro	CX	042 	15	A
707	Vincent	Carrillo	PW	078 	15	D
708	Fritz	Cole	KJ	099 	38	C
709	Casey	Campbell	SH	007 	19	E
710	Geraldine	Moody	IB	848 	18	C
711	Damon	Roth	KE	346 	17	F
712	Kevin	Leach	CX	042 	30	B
713	Buffy	Carlson	XP	397 	19	B
714	Glenna	Holden	GK	472 	3	A
715	Fritz	Sutton	ON	006 	43	A
716	Casey	Frost	ID	590 	21	E
717	Felicia	Parker	AA	000 	30	F
718	Belle	Hamilton	JG	970 	13	C
719	Nehru	Dixon	IE	831 	5	B
720	Brian	Cannon	UP	766 	11	A
721	David	Keller	AI	049 	39	C
722	Jordan	Perkins	CK	148 	43	E
723	Jerry	Ray	FC	549 	8	A
724	Ali	Montgomery	QT	439 	7	B
725	Kaden	Randall	JM	165 	5	B
726	Dominique	Rodriguez	FM	538 	38	C
727	Castor	Coffey	EI	833 	43	C
728	Tucker	Lowery	CO	489 	22	E
729	Carter	Mendez	LI	770 	36	D
730	Ingrid	Castaneda	QI	552 	12	A
731	Irma	Schneider	HT	131 	24	C
732	Ivory	Berger	NY	455 	6	D
733	Dean	Santana	HW	661 	34	D
734	Dahlia	Boyle	LQ	277 	18	A
735	Cadman	Banks	ZH	274 	15	F
736	Zelenia	Hansen	ED	170 	20	D
737	Elvis	Salazar	KB	848 	34	D
738	Malcolm	Atkins	UP	766 	45	D
739	Justine	Bishop	BO	711 	36	A
740	Hannah	Davidson	HW	661 	23	A
741	Hector	Goodman	SE	783 	38	A
742	Isabelle	Francis	BP	603 	25	F
743	Geoffrey	Yang	PG	707 	36	B
744	Rahim	Rodriguez	LN	368 	38	A
745	Rebecca	Dickson	IT	126 	2	F
746	Ori	Perry	ZI	167 	44	B
747	Caldwell	Lambert	WA	456 	34	D
748	Renee	Ferrell	BO	396 	16	F
749	Amber	Whitney	WE	454 	10	D
750	Brielle	Osborne	IH	960 	31	F
751	Veronica	Carson	FF	496 	7	E
752	Ursula	Chavez	UP	288 	7	B
753	Aladdin	Gordon	RQ	132 	36	A
754	Cora	Charles	GZ	498 	1	E
755	Maia	Collins	ME	314 	26	A
756	Kennedy	Stephenson	GA	435 	20	A
757	Ulysses	Douglas	WN	540 	18	A
758	Aquila	Mcclure	TF	518 	4	C
759	Fay	Padilla	VW	526 	24	D
760	Beverly	Frederick	PA	925 	6	F
761	Tatiana	Gilbert	OZ	540 	24	F
762	Malcolm	Puckett	OE	961 	47	C
763	Ronan	Spencer	LM	265 	17	C
764	Kiona	Mcpherson	GZ	498 	12	E
765	Kiara	Park	MW	301 	41	B
766	Demetria	Alford	BW	093 	4	C
767	Francesca	Morrison	ED	170 	41	F
768	Alisa	Smith	KS	670 	43	D
769	Rebecca	Clark	PG	707 	19	A
770	Jane	Abbott	BQ	963 	4	A
771	Alexandra	Gilliam	BD	914 	11	A
772	Nathaniel	Cummings	JG	442 	37	C
773	Desirae	Randolph	UB	871 	31	A
774	Kirsten	White	OM	653 	13	E
775	Brenda	Avila	SH	007 	14	A
776	Shana	Booth	UB	871 	16	B
777	India	Stevens	LO	429 	19	E
778	Daphne	Madden	TI	643 	1	E
779	Scarlet	Dickson	PF	280 	11	D
780	Maris	Mayo	LM	265 	43	C
781	Zachery	Montgomery	KE	346 	16	D
782	Chanda	Hayes	AJ	504 	37	E
783	Vaughan	Cline	IT	126 	37	C
784	Lee	Harris	AI	049 	10	E
785	Aurora	Sloan	PF	280 	45	E
786	Nigel	Stewart	LH	999 	9	B
787	Faith	Patton	BI	595 	15	C
788	Colin	Miller	SO	298 	7	B
789	Kato	Burgess	HM	740 	7	E
790	Cara	Schultz	BI	595 	3	B
791	Octavia	Lawrence	HW	661 	16	A
792	Hammett	Strickland	IB	848 	14	E
793	Lucas	Puckett	SP	590 	4	B
794	Knox	Craft	NY	455 	45	F
795	Megan	Britt	LO	429 	19	C
796	Zenaida	Simmons	HZ	845 	34	A
797	Ali	Osborn	FG	910 	48	E
798	Gavin	Casey	BH	798 	25	A
799	Hannah	Stephens	VF	979 	47	A
800	Griffith	Carver	SL	779 	26	F
801	Blair	Mullins	XG	233 	28	D
802	Audra	Dickerson	LH	594 	39	E
803	Damian	Sutton	JU	300 	13	E
804	Hayfa	Bush	CM	505 	49	A
805	Aaron	Vincent	RO	333 	44	F
806	Claudia	Jarvis	BI	595 	14	A
807	Ivory	Randall	PA	925 	47	A
808	Jamalia	Kaufman	JX	858 	24	A
809	Price	Grant	IB	848 	44	D
810	Amal	Hewitt	SE	783 	47	C
811	Christian	Foster	MR	502 	33	B
812	Melyssa	Morin	AZ	330 	1	D
813	Shaeleigh	Cunningham	UL	324 	32	A
814	Colby	Morris	AL	253 	20	C
815	Anne	Flowers	PV	638 	39	B
816	Lev	Rowland	ID	590 	32	E
817	Charles	Webster	KB	848 	15	E
818	Martin	Cooley	CW	360 	8	B
819	Ashton	Sanchez	MY	406 	35	E
820	Emerald	Gaines	KV	480 	21	E
821	Montana	Armstrong	UP	872 	23	D
822	Ishmael	Lopez	TZ	551 	21	F
823	Debra	Burns	JU	300 	46	F
824	Victor	Rose	TV	077 	25	F
825	Dacey	Cash	RJ	342 	32	D
826	Lael	Gates	QS	265 	13	B
827	Raven	Crane	JE	967 	3	F
828	Cleo	Sanchez	LQ	277 	49	B
829	Sheila	May	UY	613 	25	D
830	Phillip	Gonzalez	HM	100 	3	E
831	Kennedy	Mcintosh	ON	006 	10	B
832	Francis	Bullock	JG	970 	47	A
833	James	Britt	XG	233 	46	B
834	Gwendolyn	Farrell	MH	777 	40	E
835	Winter	Harding	RR	464 	26	B
836	Phelan	Campos	QH	303 	29	B
837	Elizabeth	Carr	TI	643 	27	C
838	Amy	Tran	SL	779 	46	E
839	Jordan	Fuentes	EK	316 	10	A
840	Keaton	Curry	MY	406 	14	F
841	Martin	Mcconnell	JU	300 	26	D
842	Kamal	Everett	BW	093 	4	C
843	Chava	Cotton	MH	777 	14	B
844	Brenden	Burnett	CR	451 	33	B
845	Emerald	Pittman	MW	301 	5	C
846	Noelle	Burton	ST	115 	31	B
847	Scarlett	Dillard	VW	526 	17	F
848	Emma	Davenport	ED	170 	39	B
849	Orlando	Espinoza	QC	028 	44	B
850	Armand	Lloyd	ED	170 	26	D
851	Olga	Mccall	AA	000 	22	B
852	Colby	Vang	HJ	543 	48	D
853	Ira	Eaton	NQ	464 	36	D
854	Channing	Booker	FM	538 	17	D
855	Carly	Rowland	SL	779 	8	E
856	Colby	West	CK	148 	8	E
857	Rebekah	Lara	AZ	330 	35	D
858	Graiden	Mckay	FF	496 	35	B
859	Sigourney	Hanson	OM	653 	14	E
860	Clinton	Ross	LQ	277 	2	E
861	Garrison	Mcmahon	VN	563 	6	F
862	Yardley	Lucas	JM	165 	9	C
863	Raya	Rios	WK	404 	6	F
864	Knox	Hancock	LQ	277 	28	A
865	Asher	Brooks	QL	170 	3	B
866	Ivan	Haney	ER	756 	31	E
867	Tanek	Montgomery	SV	458 	2	C
868	Quyn	Patterson	OT	902 	41	C
869	Vernon	Massey	PA	925 	10	A
870	Rashad	Justice	OZ	540 	48	E
871	Brenna	Clarke	PV	638 	21	F
872	Devin	Forbes	DW	464 	16	B
873	Hilary	Stokes	LN	368 	24	D
874	Scott	Rasmussen	TK	728 	31	E
875	Walter	Golden	LO	429 	43	F
876	Mariko	Chapman	MR	502 	30	D
877	Cara	Frederick	JX	858 	14	E
878	Risa	Camacho	VN	563 	47	F
879	Dacey	Ferrell	PL	732 	18	B
880	Harlan	Thornton	PW	078 	2	B
881	Channing	Beck	PC	347 	39	E
882	Hyatt	Fitzgerald	HJ	543 	48	D
883	Megan	Lott	SH	007 	27	C
884	Omar	Mcdowell	IM	310 	26	E
885	Griffin	Baird	JM	165 	24	A
886	Briar	Guerrero	RJ	342 	3	F
887	Quyn	Decker	KR	834 	34	F
888	Sean	Cooper	HM	740 	35	A
889	Yardley	Holloway	LH	999 	18	E
890	Britanney	Berger	TK	728 	34	D
891	Madeline	Wiley	LZ	819 	30	C
892	Jermaine	Chaney	FC	549 	18	D
893	Orson	David	MW	301 	19	C
894	Ivory	Bradshaw	AA	000 	49	D
895	Dalton	Hernandez	RQ	132 	36	A
896	Ignacia	Sparks	PN	676 	8	F
897	Davis	Wolf	JG	970 	45	A
898	Herman	Gardner	IE	831 	28	A
899	Raya	Rodriguez	SH	007 	14	F
900	Mark	Roy	AP	510 	49	B
901	Leo	Mcneil	ST	115 	15	B
902	Xena	Gates	YV	570 	10	C
903	Yoshi	Munoz	LQ	277 	48	D
904	Hoyt	Jones	KS	670 	44	D
905	Claire	Medina	PF	280 	31	C
906	Orlando	Mills	IM	310 	39	D
907	Sage	Thompson	RK	238 	41	A
908	Remedios	Day	KJ	099 	8	C
909	Avye	Combs	EI	833 	7	D
910	Chiquita	Graham	FG	352 	38	B
911	Leslie	Moss	HG	034 	31	C
912	Charity	Colon	CO	489 	32	C
913	Helen	Chang	JY	579 	5	E
914	Adena	Booth	IV	845 	47	B
915	Ignacia	Klein	BO	711 	24	D
916	Nayda	Roth	JR	359 	33	B
917	Shaine	Cohen	HM	100 	20	A
918	Rhoda	Howe	II	736 	19	A
919	Rana	Hoffman	RQ	132 	2	D
920	Yen	Lowery	LH	999 	49	C
921	Donna	Roberts	KJ	099 	33	B
922	Lois	Golden	PC	347 	43	C
923	Demetria	Kelley	WK	404 	32	A
924	Basil	Rush	PG	519 	31	C
925	Reed	Bates	JE	967 	14	D
926	Latifah	Huffman	IH	960 	32	D
927	Leslie	Durham	JR	359 	36	A
928	Georgia	Livingston	LH	999 	11	D
929	Meghan	Newton	ZH	274 	31	B
930	Meredith	Fry	DW	464 	33	E
931	Kessie	Dale	II	787 	14	B
932	Odessa	Hurst	XP	397 	18	E
933	Honorato	Donovan	OE	850 	30	D
934	Lewis	Howard	RW	070 	4	B
935	Raphael	Flowers	VN	563 	31	E
936	Francis	Alvarez	MA	054 	24	B
937	Gage	Price	HJ	543 	24	F
938	Nero	Yates	SE	783 	31	B
939	Walter	Garner	ON	006 	44	E
940	Lane	Brennan	IM	310 	46	D
941	Roary	Wilson	QT	439 	16	D
942	Dakota	Blackwell	UP	872 	18	C
943	Hedda	Baldwin	HG	034 	5	B
944	Ryan	Barron	RQ	132 	25	E
945	Yasir	Skinner	HM	740 	37	F
946	Donna	Kent	UP	288 	6	D
947	Duncan	Riddle	TH	035 	27	B
948	Neve	Larson	MA	031 	16	B
949	Noah	Juarez	HT	131 	35	C
950	Freya	Davenport	VV	284 	47	A
951	Hayes	Harris	KJ	099 	31	D
952	Carter	Lawrence	AJ	504 	28	D
953	Raya	Strong	HX	552 	44	F
954	Cruz	Guthrie	CU	936 	47	C
955	Chantale	Benjamin	ZW	994 	13	A
956	Yvonne	Madden	LY	192 	28	A
957	Madaline	Golden	MA	054 	6	A
958	Thane	Garrison	TX	227 	14	B
959	Rachel	Logan	PA	925 	27	E
960	Ava	Tyson	KR	834 	18	C
961	Carlos	Pace	UB	871 	31	E
962	Francis	Gordon	QT	439 	2	E
963	Shannon	Fisher	DH	815 	16	A
964	Len	Compton	JX	493 	41	C
965	Brandon	Burton	WN	540 	34	F
966	Brendan	Lambert	KB	848 	45	D
967	Walter	Good	AC	703 	26	F
968	Kirby	Kennedy	GZ	498 	42	F
969	Jolie	Henry	IM	310 	19	B
970	Haley	William	LO	429 	24	A
971	Simone	Harris	VP	373 	17	C
972	Jordan	Gould	MY	683 	43	E
973	Abel	Sanders	IT	126 	41	C
974	Stephanie	Webb	VP	343 	12	B
975	Justine	Hill	TV	077 	11	A
976	Arthur	Hodges	QH	303 	16	B
977	Lane	Scott	UP	288 	10	E
978	Maggie	Levy	NC	353 	5	C
979	Lois	Merritt	MA	054 	21	E
980	Hermione	England	EI	833 	10	D
981	Alan	Mosley	RK	576 	42	D
982	Meredith	Horne	UL	324 	2	C
983	Ashton	Stewart	MJ	157 	13	B
984	Jerome	Acosta	HW	661 	34	B
985	Quon	Weaver	MH	777 	48	C
986	Petra	Booth	HG	034 	4	A
987	Howard	Stout	KE	346 	1	E
988	Sage	Coleman	IE	831 	4	E
989	Brooke	Cortez	IM	310 	9	F
990	Evangeline	Barr	QT	668 	32	A
991	Brynn	Hyde	SP	590 	13	E
992	Wesley	Spears	OX	194 	7	C
993	Lawrence	Landry	CS	927 	20	C
994	Hiroko	Wyatt	YV	570 	44	D
995	Rina	Daugherty	GK	472 	30	C
996	Desirae	Golden	OE	850 	10	E
997	Anika	Stevens	UL	324 	20	A
998	Palmer	Pope	UP	872 	31	E
999	Ryan	Wilson	KB	848 	48	D
1000	Keiko	Washington	BO	396 	47	A
1001	Carissa	Rojas	UP	872 	22	E
1002	Carissa	Levine	WE	454 	28	A
1003	Amos	Houston	BI	595 	11	A
1004	Heather	Wilkins	QJ	126 	10	A
1005	Orli	Riddle	BP	603 	38	F
1006	Adena	Travis	VS	414 	1	C
1007	Hoyt	Keith	NY	455 	24	B
1008	Rinah	Lamb	VW	526 	31	E
1009	Olympia	Burnett	UP	872 	13	D
1010	Joseph	Cox	UP	288 	46	C
1011	Morgan	Lott	JX	493 	48	F
1012	Risa	Juarez	BT	177 	34	E
1013	Camilla	Parsons	AL	253 	28	A
1014	Wesley	Fitzgerald	XG	233 	3	B
1015	Megan	Odonnell	FG	910 	37	D
1016	Beatrice	Tucker	WK	404 	3	B
1017	Colin	Durham	BH	798 	42	C
1018	Kamal	Golden	IT	126 	5	B
1019	Jenna	Turner	KS	670 	8	E
1020	Elvis	Figueroa	JE	967 	8	C
1021	Breanna	Conley	LZ	819 	26	E
1022	Carter	Chandler	BT	177 	46	B
1023	Zephania	Valenzuela	BH	798 	44	C
1024	Herrod	Erickson	EJ	348 	41	F
1025	Guy	Pierce	NC	353 	18	A
1026	Lucas	Miller	LN	368 	17	E
1027	Aiko	Stein	LN	368 	11	D
1028	Lunea	Rasmussen	SA	023 	29	B
1029	Kaseem	Glover	FL	875 	4	B
1030	Howard	Burton	II	736 	48	E
1031	Rylee	Bauer	CO	489 	28	D
1032	Cruz	Robles	OM	653 	37	D
1033	Arthur	Lawson	LK	123 	8	C
1034	Arden	Dalton	QT	439 	42	E
1035	Ora	Bonner	GY	698 	40	E
1036	Raya	Stanton	MA	054 	46	A
1037	Thaddeus	Mcneil	KR	834 	26	A
1038	Zoe	Rocha	QT	668 	44	D
1039	Julie	Wilkinson	MR	502 	16	F
1040	Eve	Riggs	ID	590 	7	D
1041	Charles	Blevins	RW	070 	14	D
1042	Zane	Delgado	XG	233 	2	F
1043	Carson	Welch	ID	590 	11	D
1044	Sade	Ballard	IT	126 	30	C
1045	Dawn	Flynn	GT	289 	27	B
1046	Blaze	Woodard	MA	054 	47	B
1047	Kerry	Campbell	NQ	464 	24	C
1048	Imogene	Dunlap	GX	618 	49	D
1049	Fiona	Guerrero	JR	359 	39	F
1050	Omar	Duke	BD	914 	6	B
1051	Cedric	Powers	BQ	963 	16	E
1052	Dahlia	Hampton	LN	368 	30	E
1053	Ronan	Buck	BW	093 	27	F
1054	Brendan	Larson	RR	464 	24	A
1055	Jennifer	Newton	AI	049 	6	C
1056	Steel	Robbins	QT	668 	26	E
1057	Xanthus	Lynn	ZI	167 	5	A
1058	Aileen	Talley	NQ	464 	25	B
1059	Joshua	Herrera	KV	480 	36	C
1060	Melodie	Lawson	KR	834 	3	E
1061	Linus	Adkins	II	736 	9	F
1062	Jaquelyn	Barrett	SO	298 	5	D
1063	Roth	Valdez	TV	077 	25	D
1064	Ali	Lucas	LH	999 	18	E
1065	Dominique	Velasquez	NY	455 	11	F
1066	Rooney	Hale	AZ	330 	3	C
1067	Cassidy	Martin	II	787 	16	C
1068	Grace	Rodriguez	ER	756 	26	D
1069	Chiquita	Hansen	BW	093 	5	F
1070	Petra	Pearson	UY	613 	33	B
1071	Dylan	Holt	ID	590 	6	A
1072	Gage	Whitley	II	736 	28	E
1073	Brandon	Roy	FD	003 	7	C
1074	Jorden	Tate	AI	049 	23	A
1075	Aidan	Perry	AL	253 	12	A
1076	Megan	Hopper	AG	190 	49	B
1077	Julie	Howe	OZ	540 	28	A
1078	Natalie	Benjamin	TK	728 	10	C
1079	Karyn	Holcomb	UP	288 	45	F
1080	Damian	Hardin	HW	661 	34	D
1081	Jade	Durham	KJ	099 	14	F
1082	Velma	Mckee	LO	429 	3	C
1083	Michael	Cannon	HG	034 	35	C
1084	Jescie	Duran	PA	925 	29	C
1085	Kelly	Hill	TH	035 	20	C
1086	Hyacinth	Hartman	FD	003 	40	B
1087	Cara	Holder	AY	270 	6	B
1088	Walker	Sellers	HM	740 	29	E
1089	Cameran	George	LK	123 	12	E
1090	Xavier	Jarvis	KJ	099 	19	F
1091	Kenyon	Arnold	FM	538 	37	C
1092	Rylee	Moses	FM	538 	43	A
1093	Brian	Rosa	PC	347 	49	E
1094	Britanni	Dale	OX	194 	47	C
1095	Stewart	Alford	KQ	514 	46	C
1096	Melanie	Bowman	EK	316 	38	C
1097	Bo	Malone	LH	594 	14	E
1098	Gabriel	Ratliff	JR	359 	48	C
1099	Dara	Irwin	JP	194 	4	D
1100	Hanna	Serrano	SA	023 	9	F
1101	Fatima	Livingston	FE	776 	37	A
1102	Eric	Shepard	QI	552 	33	C
1103	Mary	Huffman	MY	406 	28	B
1104	Jared	Howard	QJ	126 	19	A
1105	Charlotte	Medina	LY	192 	3	B
1106	Quemby	Justice	MY	406 	19	B
1107	Courtney	Patel	AY	270 	22	D
1108	Carolyn	Joyce	MR	502 	21	D
1109	Timon	Warner	NC	353 	8	F
1110	Jesse	Tucker	JX	493 	24	F
1111	Flynn	Vasquez	KE	346 	43	A
1112	Ivory	Thomas	YV	570 	9	B
1113	Adele	Bentley	DU	320 	9	E
1114	MacKensie	Woods	HJ	543 	34	C
1115	Avram	Bender	OT	902 	30	C
1116	Yasir	Osborne	HW	661 	3	C
1117	Alan	Houston	BS	047 	32	D
1118	Cameron	Franks	UP	872 	4	A
1119	Fay	Flores	SH	007 	14	E
1120	Joelle	Stephenson	VJ	110 	26	C
1121	Daphne	Nguyen	OX	194 	46	D
1122	Simon	Delaney	XO	285 	37	A
1123	Orli	Chambers	KV	480 	8	C
1124	Sean	Williams	AA	000 	34	F
1125	Hadley	Huff	SP	590 	20	D
1126	Rina	Wallace	BQ	963 	10	E
1127	Darryl	Dotson	KV	480 	11	D
1128	Martha	Gay	TZ	551 	36	F
1129	Nell	Serrano	KV	480 	31	F
1130	Owen	Richmond	EK	316 	25	B
1131	Shellie	Holloway	IV	845 	15	C
1132	Dorian	Shelton	IB	848 	9	E
1133	Illana	Gentry	JG	970 	24	C
1134	Russell	Love	PG	519 	49	B
1135	Margaret	Bishop	SL	779 	4	C
1136	Alexis	Nguyen	FC	549 	30	F
1137	Marvin	Guthrie	JY	579 	26	D
1138	Benedict	Morris	EK	316 	45	F
1139	Prescott	Gardner	QC	028 	12	D
1140	Hedwig	Mullen	AR	948 	33	A
1141	Todd	Snider	FG	352 	20	D
1142	Noble	Kemp	OE	850 	37	C
1143	Gabriel	Farrell	VP	373 	35	C
1144	Illana	Bauer	KJ	099 	3	E
1145	Demetrius	Hines	UL	324 	42	F
1146	Tiger	Velasquez	UP	288 	38	B
1147	Azalia	Quinn	GY	698 	6	F
1148	Lacy	Manning	PG	519 	17	C
1149	Rajah	Kinney	AA	000 	44	D
1150	Yuli	Dawson	TV	077 	45	B
1151	Natalie	Francis	IV	845 	11	F
1152	Dorothy	Keith	QI	552 	27	D
1153	Nolan	Gilmore	TI	643 	44	C
1154	Leilani	Guerrero	QS	265 	15	F
1155	Reagan	Webster	OX	194 	11	C
1156	Silas	Lyons	TV	077 	9	B
1157	Yuri	Dale	IB	848 	6	B
1158	Venus	Bennett	LH	999 	39	F
1159	Jescie	Jensen	CM	505 	47	C
1160	Joy	Farmer	GX	618 	21	A
1161	Whoopi	Skinner	LO	429 	14	B
1162	Blossom	Joseph	WA	456 	30	B
1163	Fredericka	Wagner	QT	668 	32	F
1164	Adria	Fisher	ON	006 	32	E
1165	Dalton	Burke	FD	003 	26	B
1166	Natalie	Mcfadden	KR	834 	46	F
1167	Shea	Schroeder	JG	970 	47	F
1168	Briar	Randall	JX	493 	25	D
1169	Jacob	Morris	BQ	963 	1	F
1170	Linda	Schwartz	BQ	963 	13	F
1171	Derek	Rocha	TX	227 	16	A
1172	Charissa	Swanson	ZI	167 	44	D
1173	Michelle	Owens	OM	653 	15	B
1174	Aiko	Galloway	QI	552 	18	C
1175	Xanthus	Odonnell	IM	310 	42	C
1176	Boris	Decker	JG	970 	31	C
1177	Zia	Forbes	RR	464 	23	D
1178	Sigourney	Gregory	MY	406 	13	A
1179	Erasmus	Jensen	QL	170 	6	A
1180	Merritt	Gillespie	LO	429 	8	E
1181	Jackson	Gallagher	FM	538 	17	A
1182	Noelle	Pate	AL	253 	17	A
1183	Ivana	Stuart	OM	653 	3	F
1184	Blake	Browning	QT	439 	46	A
1185	Bethany	Pitts	ZH	274 	32	D
1186	Rhoda	Alford	EI	833 	3	B
1187	Noelle	Roy	PW	078 	29	D
1188	Martena	Waters	ZI	167 	21	A
1189	Kiara	England	OE	850 	39	C
1190	Jermaine	Jackson	WK	404 	15	E
1191	September	Ingram	BH	798 	3	F
1192	Aladdin	Lamb	BS	047 	28	D
1193	Irma	Hahn	ER	756 	25	B
1194	Hanna	Downs	GX	618 	39	F
1195	Brooke	Pope	FD	003 	27	F
1196	Cade	Gillespie	MY	683 	29	D
1197	Keely	Shields	BS	047 	38	B
1198	Xena	Jefferson	JP	194 	40	C
1199	Dakota	Walker	CX	042 	20	D
1200	Kellie	Holmes	QS	265 	9	B
1201	Nelle	Paul	ME	314 	10	D
1202	Doris	Erickson	HT	131 	39	B
1203	Jana	Bullock	VN	563 	13	D
1204	Rudyard	Reed	EJ	348 	40	E
1205	Charlotte	Riley	PC	347 	48	D
1206	Ila	Reid	LK	123 	15	F
1207	Kirk	Sanchez	IV	845 	28	E
1208	Constance	Henson	ED	170 	38	D
1209	Bianca	Vang	GZ	498 	5	B
1210	Russell	Fox	GY	199 	45	F
1211	Diana	Romero	SA	023 	36	D
1212	Patricia	Alexander	CX	042 	11	E
1213	Aurora	Roth	VV	284 	43	F
1214	Chaim	Lucas	RQ	132 	24	B
1215	John	Walters	OZ	540 	31	F
1216	Stacy	Holland	ON	006 	32	A
1217	Cameron	Leblanc	HJ	543 	41	F
1218	Akeem	Charles	OX	194 	25	B
1219	Mechelle	Travis	PV	638 	5	A
1220	Phelan	Mckinney	HM	740 	42	B
1221	Alma	Silva	LH	999 	7	E
1222	Zelda	Lane	UY	613 	18	D
1223	Kiona	Foreman	PG	519 	41	F
1224	Hannah	Russell	JY	579 	36	D
1225	Lee	Mcconnell	BD	914 	39	B
1226	Fletcher	Mccullough	HM	100 	13	A
1227	Porter	Faulkner	FL	875 	6	B
1228	Slade	Jacobson	CS	927 	39	D
1229	Russell	Fry	MY	406 	34	C
1230	Kamal	Stokes	IB	848 	1	C
1231	Paki	Moon	RQ	132 	24	C
1232	Naomi	Anthony	LH	594 	36	D
1233	Lars	Hamilton	LY	192 	15	C
1234	Rinah	Carrillo	MY	683 	28	B
1235	Oleg	Parker	UP	872 	7	A
1236	Heidi	Patton	TV	077 	26	F
1237	Laura	Avila	OM	653 	12	A
1238	Kelsey	Dominguez	CX	042 	45	C
1239	Scarlet	Miranda	RQ	132 	24	C
1240	Carlos	Stuart	AP	510 	3	E
1241	Rina	Vega	MJ	157 	27	D
1242	Jemima	Hill	GZ	498 	49	D
1243	Blake	Gibson	CO	489 	8	F
1244	Hiram	Mckarty	ZH	274 	5	E
1245	Naida	Oneil	JM	165 	46	D
1246	Stephanie	Sherman	BW	093 	10	E
1247	Hayes	Wilkerson	HH	762 	27	E
1248	Mary	Cross	HX	552 	20	D
1249	Craig	Bruce	UY	613 	33	D
1250	Grace	Perry	HX	552 	43	B
1251	Maryam	Moss	MY	406 	17	E
1252	Mona	Holland	PV	638 	19	B
1253	Michelle	Wynn	UL	324 	17	A
1254	Lavinia	Langley	PV	638 	27	E
1255	Eve	Snider	CS	927 	49	C
1256	Jenna	Rodriquez	ST	115 	33	F
1257	Yuli	Wilkinson	HZ	845 	13	F
1258	Iola	Valenzuela	FD	003 	38	A
1259	Buffy	Jones	RK	576 	45	A
1260	Bethany	Caldwell	RK	576 	22	F
1261	Ann	Porter	ER	756 	30	B
1262	Sybill	Blackburn	BO	711 	36	F
1263	Myles	Drake	ME	314 	47	E
1264	Kirsten	Morton	BS	047 	7	A
1265	Gail	Hammond	UP	872 	34	E
1266	Anne	Rosario	LO	429 	34	D
1267	Donna	Sosa	PN	034 	44	D
1268	Perry	Montoya	RW	070 	26	F
1269	Miriam	Waters	BH	798 	28	D
1270	Imani	Velez	HX	552 	20	D
1271	Casey	Allen	FL	875 	3	D
1272	Ciaran	Rutledge	IH	960 	17	D
1273	Kristen	Matthews	LM	265 	40	D
1274	Yasir	Strickland	SV	458 	4	B
1275	Charles	Contreras	JX	493 	40	C
1276	Thaddeus	Kinney	SO	298 	20	E
1277	Yvonne	Mccray	LQ	277 	8	A
1278	Kaseem	Summers	CW	360 	27	B
1279	Sopoline	Steele	TZ	551 	27	A
1280	Clementine	York	GY	698 	44	F
1281	Debra	Carrillo	PC	347 	29	C
1282	Elton	Ballard	JG	442 	1	E
1283	Walker	Carson	IE	831 	11	B
1284	Rhea	Newton	IV	845 	19	A
1285	Kasper	Coleman	PV	638 	24	A
1286	Adam	Merritt	VW	526 	13	C
1287	Aaron	Kennedy	IT	126 	28	D
1288	Abigail	Foster	WE	454 	15	B
1289	Basia	Harrell	OZ	540 	25	C
1290	Orla	Schmidt	ZH	274 	5	F
1291	Sopoline	Merritt	IB	848 	26	C
1292	Petra	Mann	OZ	540 	15	D
1293	Lucian	Burnett	GX	618 	12	A
1294	Mariam	Holcomb	AR	948 	20	A
1295	Autumn	Lamb	IE	831 	41	C
1296	Mason	Franco	UP	288 	7	B
1297	Sybil	Tyson	PW	078 	6	E
1298	Sydnee	Irwin	HG	034 	34	D
1299	Chandler	Conner	XP	397 	3	D
1300	Graiden	Yang	CK	148 	3	E
1301	Marah	Bush	KQ	514 	37	B
1302	Edward	Hickman	RO	333 	8	F
1303	Neil	Ellison	FG	352 	21	A
1304	Dennis	Witt	SO	298 	29	E
1305	Norman	Harper	OE	850 	35	D
1306	Sonya	Terry	BP	603 	35	E
1307	Cherokee	Mitchell	PN	676 	4	B
1308	Zane	Riley	NC	353 	9	F
1309	Ciaran	Rasmussen	EJ	348 	19	B
1310	Alea	Mcpherson	CU	936 	1	D
1311	Steel	Mckay	LZ	819 	12	A
1312	Coby	Booth	JG	442 	15	C
1313	Axel	Ayers	WO	636 	25	C
1314	Alana	Guerrero	XG	233 	30	B
1315	Norman	Lawrence	HG	034 	13	F
1316	Deborah	Crawford	TZ	551 	37	E
1317	Ima	Raymond	ID	590 	45	F
1318	Maggy	Graham	NY	455 	37	F
1319	Kim	Whitehead	BH	798 	26	F
1320	Marshall	Holden	JE	967 	27	F
1321	Kelly	Petersen	OE	850 	42	A
1322	Wesley	Mitchell	SO	298 	42	E
1323	Keane	Callahan	TK	728 	36	F
1324	Sawyer	Mathis	KV	480 	20	F
1325	Victoria	Reyes	CO	489 	29	C
1326	Bertha	Guerrero	QJ	126 	36	D
1327	Joel	Olson	KJ	099 	6	C
1328	Oleg	Nolan	MH	777 	29	F
1329	Donna	Lopez	RO	333 	37	F
1330	Mara	Nicholson	MR	502 	43	C
1331	Keane	Cantrell	LO	429 	28	C
1332	Kaden	Byers	FE	776 	5	F
1333	Leslie	White	FD	003 	27	A
1334	Buffy	Mcgowan	VJ	110 	22	F
1335	Lilah	Davidson	JY	579 	29	D
1336	Daria	Acosta	ZI	167 	48	D
1337	Cairo	Garner	GA	435 	13	F
1338	Lamar	Norman	KE	346 	5	E
1339	Yoshio	Lowery	MA	031 	31	F
1340	Kennedy	Mathews	VF	979 	39	E
1341	Theodore	Keller	VS	414 	14	D
1342	Chase	Pollard	WN	540 	2	F
1343	Kirk	Ochoa	UY	613 	25	C
1344	Murphy	Tucker	MH	777 	17	D
1345	Audra	Mcneil	IM	310 	5	F
1346	Jana	Mejia	RQ	132 	31	E
1347	Gretchen	Vazquez	VJ	110 	20	E
1348	Igor	Odom	MR	502 	9	E
1349	Blossom	Hartman	ZW	994 	44	E
1350	Arthur	Clarke	TX	227 	27	B
1351	Stone	Dunn	SP	590 	40	C
1352	Rylee	Russo	XG	233 	6	C
1353	Rhoda	Frost	MJ	157 	32	E
1354	Gretchen	Beasley	SL	779 	26	E
1355	Maxwell	Dyer	KJ	099 	40	E
1356	Darius	Pierce	VN	563 	16	E
1357	Ariel	Mcmillan	BO	711 	43	E
1358	Indira	Copeland	ON	006 	20	B
1359	Bevis	Burton	ER	756 	34	A
1360	Ali	Bean	OX	194 	18	C
1361	Ursula	Welch	QJ	126 	35	A
1362	Latifah	Farley	TI	643 	11	D
1363	Megan	Browning	IH	874 	36	D
1364	Kato	Harmon	SE	783 	30	E
1365	Medge	Terry	TH	035 	18	D
1366	Kasimir	Wilkins	LL	033 	2	F
1367	Kylan	Mckee	HX	552 	20	E
1368	Rogan	Anthony	IB	848 	46	B
1369	Adrian	Kline	AC	703 	19	F
1370	Blair	Castillo	GX	618 	45	B
1371	Hall	Church	GA	435 	7	B
1372	Lance	West	AG	730 	46	F
1373	Lee	Barrera	LL	033 	19	D
1374	Melinda	Knowles	ST	115 	45	A
1375	Shelley	Mcclain	GZ	498 	6	D
1376	Beverly	Rogers	ZW	994 	49	F
1377	Nissim	Moore	RK	576 	39	C
1378	Tanisha	Berger	MW	301 	4	A
1379	Bethany	Walters	FF	496 	3	F
1380	Nelle	Ware	MH	777 	19	B
1381	Dorian	Rosales	RO	333 	10	D
1382	Iona	Foster	EK	316 	12	D
1383	Alan	Sharpe	PN	034 	9	B
1384	Angelica	Neal	XO	285 	1	F
1385	Rooney	Cole	FD	003 	49	E
1386	Kareem	Foreman	CW	360 	9	E
1387	Rhoda	Hobbs	LZ	819 	25	A
1388	Jaquelyn	Young	UY	613 	13	C
1389	Ima	Fuentes	ST	115 	41	B
1390	Chanda	Cervantes	SL	779 	19	E
1391	Armand	Jennings	RQ	132 	23	C
1392	Jakeem	Howell	KS	670 	25	B
1393	Callum	Bush	VS	414 	6	B
1394	Daria	Bridges	HX	552 	37	E
1395	Chantale	Reilly	QL	170 	21	D
1396	Angelica	Parks	MH	777 	8	A
1397	Leah	Whitehead	CU	936 	18	B
1398	Chase	Knox	IE	831 	33	E
1399	Nichole	Carney	MJ	157 	43	E
1400	Quinn	Randolph	BS	047 	27	A
1401	Ulric	Castaneda	KJ	099 	17	B
1402	Amity	Gray	TX	227 	3	E
1403	Jamalia	Sloan	UY	613 	32	E
1404	Cruz	Jacobs	FC	549 	28	C
1405	Connor	Mullen	LI	770 	42	C
1406	Hillary	Nunez	KV	480 	38	B
1407	Keane	Harmon	TX	227 	29	E
1408	Kaseem	Norris	SL	779 	21	A
1409	Heather	Holden	QC	028 	12	F
1410	Kelsey	Shaffer	PN	676 	29	E
1411	Octavius	Winters	WE	454 	49	D
1412	Rae	Shaffer	TZ	551 	7	A
1413	Camilla	Park	QC	028 	33	F
1414	Lamar	Bradshaw	NM	827 	17	B
1415	Nayda	Bowers	IJ	984 	5	D
1416	Garrison	Hendrix	IE	831 	24	B
1417	Matthew	Love	GZ	498 	46	C
1418	Keely	Montoya	HM	740 	46	E
1419	Brent	Copeland	RQ	584 	38	F
1420	Ishmael	Rasmussen	CW	360 	48	B
1421	Harrison	Rodriquez	FF	496 	28	A
1422	Kamal	Horne	UP	288 	35	A
1423	Adrienne	Noel	BO	711 	45	B
1424	Victoria	Prince	MR	502 	37	A
1425	Hashim	Marshall	PV	638 	32	F
1426	Libby	Bishop	XO	285 	40	F
1427	Hayes	Mcdonald	QI	552 	31	C
1428	Burton	Wright	XG	233 	18	A
1429	Tyler	Gamble	FG	910 	29	B
1430	Alden	Burns	HX	552 	8	B
1431	Idona	Hill	LY	192 	17	A
1432	Lars	Elliott	WK	404 	34	C
1433	Nehru	Powers	TF	518 	44	C
1434	Ferdinand	Harvey	VN	563 	31	F
1435	Serina	Payne	JP	194 	42	A
1436	Aidan	Fowler	ST	115 	3	B
1437	Vanna	Baxter	DW	464 	27	C
1438	Charde	Watts	ST	115 	36	E
1439	Ryan	Tate	BQ	963 	43	F
1440	Rhonda	Barker	MY	683 	15	D
1441	Justin	Hardy	SV	458 	39	B
1442	Anthony	Barron	TV	077 	38	E
1443	Nomlanga	Lang	PN	034 	5	F
1444	Brian	Frank	AI	049 	15	F
1445	Keaton	Figueroa	RW	070 	1	D
1446	Hanae	Sellers	II	736 	44	E
1447	Amber	Mckay	ZH	274 	36	F
1448	Anastasia	Christensen	GA	435 	8	D
1449	Wing	Boyle	LQ	277 	27	A
1450	India	Oneil	IH	960 	17	C
1451	Isaac	Clark	JX	858 	16	D
1452	Gray	Bright	QS	265 	39	A
1453	Wang	Bean	FL	875 	5	B
1454	Lawrence	Lang	BH	798 	9	D
1455	Reese	Greer	HM	100 	46	A
1456	Yael	Hutchinson	AG	190 	30	C
1457	Carl	Matthews	GK	472 	32	B
1458	Gavin	Black	GA	435 	42	C
1459	David	Hood	GA	435 	10	F
1460	Garrett	Frost	IH	960 	2	A
1461	Barclay	Mayo	WE	454 	20	A
1462	Halee	Holloway	UL	324 	23	F
1463	Henry	Puckett	PA	925 	19	F
1464	Herrod	Avery	IH	960 	31	A
1465	Brooke	Russell	LO	429 	9	B
1466	Colby	Potter	SA	023 	27	B
1467	Sara	Hyde	RQ	132 	40	A
1468	Rowan	Barlow	BQ	963 	39	D
1469	Yvonne	Chavez	VS	414 	13	D
1470	Doris	Browning	VS	414 	34	B
1471	Deanna	Spears	PN	034 	24	B
1472	Velma	Levy	TK	728 	41	C
1473	Zelda	Kline	LY	192 	39	D
1474	Jaquelyn	Rocha	MA	031 	15	A
1475	Colleen	Cherry	BQ	963 	31	E
1476	Tucker	Clayton	AC	703 	26	C
1477	Driscoll	Burks	ZH	274 	46	D
1478	Rhona	Wallace	SA	023 	30	F
1479	Jane	Santos	LY	192 	19	F
1480	Tashya	Bates	AY	270 	37	B
1481	Chester	Rutledge	FC	549 	21	D
1482	Abel	Cummings	LY	192 	49	D
1483	Abra	Charles	BQ	963 	25	C
1484	Astra	Bender	LQ	277 	34	B
1485	Griffin	Hernandez	BI	595 	49	F
1486	Ruth	Ryan	II	736 	39	D
1487	Oscar	Rose	AJ	504 	10	A
1488	Lars	Boone	TK	728 	39	B
1489	Cheryl	Baird	CS	927 	10	B
1490	Rudyard	Wallace	SE	783 	39	B
1491	Summer	Allen	KJ	099 	43	F
1492	Germane	Hamilton	NM	827 	40	B
1493	Steven	Crosby	AL	253 	2	E
1494	Brendan	Rasmussen	GY	698 	42	A
1495	Miriam	Phillips	BW	093 	21	F
1496	Harlan	Burke	ID	590 	17	A
1497	Kylynn	Valdez	PG	707 	18	D
1498	Armand	Orr	HT	131 	42	D
1499	Imelda	Avila	XP	397 	12	B
1500	Melinda	Browning	KE	346 	47	E
1501	Phillip	Sampson	SL	779 	40	B
1502	Gage	Trujillo	SL	779 	5	B
1503	Ori	White	AL	253 	23	B
1504	Gage	Burris	HM	740 	39	A
1505	Arthur	Montgomery	AY	270 	28	A
1506	Kevin	Johnston	GA	435 	15	C
1507	Zeph	Myers	IB	848 	34	B
1508	Yael	Hutchinson	LQ	277 	1	A
1509	Jemima	Daugherty	UL	324 	49	C
1510	Shea	Noble	HW	661 	28	F
1511	Hu	Moon	GY	698 	10	E
1512	Frances	Logan	KR	834 	20	D
1513	Drake	Schroeder	PV	638 	30	C
1514	Mari	Bray	LO	429 	5	B
1515	Moana	Delacruz	VJ	110 	28	C
1516	Maite	Avery	XM	543 	24	D
1517	Buckminster	Hutchinson	MA	031 	24	E
1518	Brian	Ingram	WE	454 	21	D
1519	Montana	Sanders	WE	454 	18	C
1520	Abel	Nunez	FG	910 	27	C
1521	Sophia	Vaughan	LZ	819 	23	C
1522	Eugenia	Robertson	OE	961 	3	C
1523	Bianca	Goodman	MH	777 	34	C
1524	Lane	Bonner	LL	033 	21	B
1525	Quin	Carter	HH	762 	32	B
1526	Ria	Shannon	LH	999 	6	B
1527	Jason	Montoya	AG	190 	12	B
1528	Simone	Lott	AL	253 	33	D
1529	Kadeem	Gould	JP	194 	43	E
1530	Jolie	Valentine	TX	227 	11	B
1531	Rebecca	Bowers	IB	848 	15	A
1532	Xenos	Boone	ER	756 	4	A
1533	Bruno	Hardy	AL	253 	22	F
1534	Carla	Thornton	BP	603 	8	E
1535	Azalia	Workman	HX	552 	8	B
1536	Mercedes	Reed	CS	927 	37	E
1537	Maya	Kerr	HH	762 	9	C
1538	Quentin	Hardin	IH	960 	5	C
1539	Rama	Scott	LH	999 	21	E
1540	Sigourney	Gillespie	KV	480 	9	B
1541	Ora	Dennis	QL	170 	48	D
1542	Len	Jensen	XM	543 	34	C
1543	Chandler	Spencer	JX	493 	12	A
1544	Cathleen	Singleton	EI	833 	11	C
1545	Karleigh	Anthony	OE	850 	15	A
1546	Burton	Clarke	TI	643 	39	D
1547	Baker	Osborne	BD	914 	15	F
1548	Ross	Brewer	GX	618 	24	A
1549	Kimberly	Zamora	FM	538 	26	A
1550	Cathleen	Gould	FE	776 	11	A
1551	George	Paul	HT	131 	36	E
1552	Nelle	Bender	MH	777 	20	B
1553	Bethany	Jordan	BT	177 	45	A
1554	Shafira	Rios	ER	756 	18	E
1555	Jerry	Russell	RQ	132 	32	E
1556	Eleanor	Barron	FL	875 	9	B
1557	Maia	Walsh	LI	770 	1	B
1558	Giselle	Burke	II	787 	35	C
1559	Leila	Cummings	LK	123 	26	E
1560	Colorado	Edwards	EJ	348 	30	D
1561	Larissa	Monroe	KE	346 	8	C
1562	Alexis	Williams	HT	131 	18	B
1563	Bryar	Ruiz	PC	347 	17	F
1564	Connor	Vargas	CW	360 	28	B
1565	Ria	Ewing	VF	979 	7	C
1566	Heather	Weaver	AI	049 	7	C
1567	Clementine	Schwartz	BQ	963 	29	A
1568	Roary	Vazquez	LQ	277 	2	D
1569	Illiana	Moon	MR	502 	45	B
1570	Jamal	Watts	RQ	584 	30	D
1571	Ulla	Valenzuela	NY	455 	37	C
1572	Alma	Buck	TX	227 	49	C
1573	Breanna	Walton	PL	732 	15	D
1574	Aubrey	Crane	IE	831 	12	E
1575	Jolene	Powell	PC	347 	19	A
1576	Leigh	Talley	ID	590 	1	C
1577	Yvonne	Shepherd	CK	148 	33	F
1578	Jescie	Mccall	KQ	514 	24	F
1579	Ciara	Haley	IM	310 	46	B
1580	Paki	Webster	SA	023 	14	F
1581	Mechelle	Duncan	VP	373 	21	E
1582	Gareth	Calderon	LI	770 	39	E
1583	Carissa	Bird	QT	439 	42	F
1584	Otto	Peterson	IB	848 	38	D
1585	Macy	Campbell	ON	006 	41	D
1586	MacKensie	Ware	IH	874 	36	C
1587	Vernon	Skinner	DH	815 	44	C
1588	April	Estes	BT	177 	6	B
1589	Wylie	Miles	OX	194 	20	D
1590	Kadeem	Sellers	QT	668 	47	C
1591	Regina	Anderson	QT	668 	24	E
1592	Denton	Todd	DU	320 	1	C
1593	Ishmael	Marquez	NC	353 	27	F
1594	Jermaine	David	EI	833 	43	E
1595	Aaron	Faulkner	DU	320 	20	D
1596	Barrett	Rocha	NY	455 	21	F
1597	Caesar	Baxter	CK	148 	30	F
1598	Breanna	Rice	GK	472 	18	C
1599	Imani	Moreno	UP	288 	6	C
1600	Matthew	Morse	PA	925 	36	E
1601	Colton	Bond	LH	999 	4	C
1602	Cadman	Howe	BW	093 	44	F
1603	Tanek	Wilcox	ZW	994 	31	A
1604	Melinda	Buck	TH	035 	14	F
1605	Jorden	Walker	YV	570 	27	E
1606	Cadman	Short	QC	028 	12	C
1607	Isabella	Charles	KE	346 	26	A
1608	Kelsey	Reeves	PN	676 	8	F
1609	Wanda	Lester	LH	999 	4	E
1610	Sophia	Vincent	IE	831 	6	D
1611	Ross	Mullen	VN	563 	35	C
1612	Valentine	Gibson	VP	343 	13	E
1613	Quynn	Shaw	VF	979 	27	D
1614	Cassady	Jackson	DH	815 	39	E
1615	Knox	Bullock	PV	638 	30	E
1616	Brent	Knapp	UP	872 	16	E
1617	Timon	Fuller	HZ	845 	26	A
1618	Germane	Farley	XG	233 	15	E
1619	Sawyer	Acosta	WE	454 	19	F
1620	Brian	Morris	HH	762 	19	E
1621	Jenette	Vance	SA	023 	20	B
1622	Castor	Benjamin	HG	034 	31	F
1623	Alec	Hurley	PW	078 	36	B
1624	Noelle	Bruce	QH	303 	4	F
1625	Hayden	Hudson	SA	023 	38	A
1626	Leonard	Whitley	KS	670 	43	B
1627	Illana	Perez	ZW	994 	41	B
1628	Maya	Robinson	RO	333 	46	A
1629	Ira	Hoffman	BQ	963 	41	C
1630	Cadman	Clemons	ME	314 	45	C
1631	MacKenzie	Wiggins	VJ	110 	4	B
1632	Kuame	Sellers	OT	902 	5	C
1633	Chandler	Finch	FG	910 	2	F
1634	Kaye	Mckenzie	LZ	819 	37	B
1635	Shaine	Frank	GY	199 	26	E
1636	Deborah	Mitchell	CU	936 	23	C
1637	Chloe	Grant	PA	925 	35	E
1638	Zachery	Acosta	AP	510 	44	D
1639	Iris	Byers	AC	703 	5	F
1640	Dennis	Meyer	VN	563 	43	E
1641	Kevin	Travis	PN	676 	19	D
1642	Maxine	Guy	SO	298 	38	E
1643	Judah	Gould	BT	177 	24	B
1644	Dennis	Perez	RJ	342 	44	C
1645	Zeus	Torres	TZ	551 	35	E
1646	Kevin	Garza	LH	999 	37	B
1647	Grant	Hyde	JP	194 	13	F
1648	Ruth	Johns	KB	848 	8	D
1649	Laith	Stark	QS	265 	42	C
1650	Paul	Blackburn	NY	455 	32	D
1651	Baxter	Travis	AJ	504 	39	E
1652	Simone	Parsons	QS	265 	28	A
1653	Lilah	Short	IV	845 	4	F
1654	Jason	Solis	IB	848 	23	F
1655	Aidan	Rodriguez	FM	538 	38	D
1656	Aline	Hensley	UP	766 	23	E
1657	Emerald	Hensley	BT	177 	19	F
1658	Jane	Andrews	IT	126 	41	C
1659	Lilah	Foreman	DH	815 	9	F
1660	Imogene	Dunn	AI	049 	4	E
1661	Rylee	Oneill	KR	834 	28	F
1662	Burke	Petersen	GY	199 	35	E
1663	Kelsey	Mathis	UY	613 	45	B
1664	Winter	Taylor	GA	435 	29	F
1665	Len	Dickerson	KV	480 	38	A
1666	Harper	Gillespie	FG	352 	38	B
1667	Pamela	Welch	OZ	540 	14	E
1668	Zephr	Walters	CK	148 	15	C
1669	Clinton	Conway	PG	707 	16	B
1670	Ebony	Sharp	FE	776 	8	D
1671	Cathleen	Dillard	BD	914 	4	C
1672	Griffin	Ramos	BI	595 	32	E
1673	Doris	Walters	VF	979 	25	D
1674	Helen	Livingston	UP	872 	2	F
1675	Dacey	Davenport	QJ	126 	38	B
1676	Wyoming	Lowery	LH	594 	11	A
1677	Regina	Bright	KV	480 	2	F
1678	Wanda	Stafford	CS	927 	23	D
1679	Selma	Harrell	ZH	274 	33	A
1680	Blair	Pierce	BO	396 	13	F
1681	Wyoming	Navarro	CU	936 	3	B
1682	Quail	Chapman	QC	028 	36	A
1683	Otto	Graham	LZ	819 	6	B
1684	Gavin	Cherry	ZI	167 	37	C
1685	Amela	Graham	TI	643 	31	D
1686	Jordan	Simpson	GA	435 	32	E
1687	Nathan	Alexander	LK	123 	14	E
1688	Grady	Harrell	SE	783 	44	E
1689	Knox	Arnold	AL	253 	46	D
1690	Timon	Hurley	MJ	157 	6	B
1691	Ainsley	Frank	BO	711 	6	A
1692	Britanney	Knox	XP	397 	13	B
1693	Melanie	Mosley	II	736 	4	F
1694	Gregory	West	HW	661 	36	F
1695	Armand	Reese	KB	848 	31	F
1696	Phoebe	Norman	MJ	157 	26	D
1697	Tanek	Salinas	LH	594 	49	B
1698	Reece	Watson	BW	093 	12	A
1699	Marvin	Hall	LZ	819 	17	B
1700	Inez	Figueroa	LZ	819 	42	B
1701	Harlan	Peck	QH	303 	2	B
1702	Christen	Herman	XO	285 	5	A
1703	Cooper	Alvarez	KR	834 	5	B
1704	Caleb	Benjamin	IH	874 	47	B
1705	Hilary	Buckner	VP	343 	6	C
1706	Neil	Hansen	FE	776 	23	E
1707	Camden	Beck	LL	033 	15	B
1708	Lana	Bradley	IH	960 	37	F
1709	Wallace	Gentry	AG	190 	7	E
1710	Rhoda	Garcia	QC	028 	16	F
1711	Fritz	Richardson	MA	031 	27	D
1712	Quinn	Beard	JP	194 	3	A
1713	Louis	Spence	PL	732 	7	C
1714	Francesca	Snyder	JX	493 	6	D
1715	Germane	Watts	VF	979 	36	C
1716	Azalia	Leonard	CS	927 	47	B
1717	Kiayada	Warner	ID	590 	32	B
1718	Aline	Armstrong	GX	618 	4	A
1719	Imogene	Gonzales	FG	910 	29	C
1720	Leslie	Hays	SH	007 	22	D
1721	Chastity	Hopkins	MY	683 	23	F
1722	Carolyn	Joyce	JU	300 	41	D
1723	Rhoda	Lester	GX	618 	22	E
1724	Erin	Bowers	PG	519 	29	F
1725	Samson	Jones	QC	028 	33	B
1726	Kirk	Underwood	OE	961 	12	E
1727	Nissim	Gould	JX	493 	17	A
1728	August	Bernard	IH	960 	47	B
1729	Jacob	Mccormick	UY	613 	36	C
1730	Paki	Rios	KB	848 	36	D
1731	Zelda	Mcleod	GY	199 	47	A
1732	Kane	Rhodes	PV	638 	5	B
1733	Lila	Wolf	OZ	540 	25	D
1734	Riley	Compton	TX	227 	32	A
1735	Karyn	Guerrero	RR	464 	4	B
1736	Marah	Stephenson	LL	033 	15	D
1737	Keaton	Bauer	AC	703 	37	D
1738	Henry	Lee	UL	324 	32	E
1739	Iliana	Brooks	SE	783 	4	A
1740	Orson	Snow	WA	456 	49	F
1741	Lilah	Simon	EJ	348 	13	C
1742	Mikayla	Curry	PF	280 	34	D
1743	Sacha	Cantu	RO	333 	46	F
1744	Giacomo	Henry	II	736 	18	A
1745	Ezra	Waters	MY	683 	12	E
1746	Alfreda	Kemp	OZ	540 	44	E
1747	Barrett	Velez	VN	563 	42	F
1748	Michelle	Collier	DW	464 	26	C
1749	Carl	Hoffman	BT	177 	17	E
1750	Mariam	Thomas	MH	777 	28	A
1751	Jorden	Pollard	OZ	540 	2	A
1752	Amery	Davidson	JP	194 	15	A
1753	Troy	Yates	FM	538 	42	E
1754	Quinn	Young	ON	006 	32	F
1755	Delilah	Maynard	VP	343 	48	F
1756	Tasha	Cross	OT	902 	9	A
1757	September	Rojas	LL	033 	38	B
1758	Cheryl	Hayes	UB	871 	3	B
1759	Caryn	Rosa	CS	927 	22	F
1760	Knox	Duran	FF	496 	35	E
1761	Idona	Montgomery	RK	576 	46	D
1762	Beck	Lynn	RQ	584 	39	B
1763	Harrison	Miranda	RQ	132 	45	C
1764	Deacon	Tran	GY	698 	39	D
1765	Ebony	Decker	KB	848 	2	B
1766	Basia	Turner	VF	979 	3	D
1767	Stacy	Howell	AI	049 	37	A
1768	Shannon	Castaneda	PV	638 	3	F
1769	Larissa	Guy	SE	783 	10	C
1770	Dara	Marquez	KS	670 	12	A
1771	Dahlia	Grimes	AZ	330 	26	C
1772	Amena	Head	VF	979 	27	B
1773	Declan	Cannon	HJ	543 	41	E
1774	Tiger	Henry	AZ	330 	23	C
1775	Jaden	Todd	BP	603 	5	A
1776	Sharon	Jacobs	AR	948 	34	A
1777	Quincy	Pugh	GA	435 	38	E
1778	Germane	Hensley	AI	049 	35	F
1779	Zeus	Bartlett	UP	288 	36	D
1780	Branden	Frazier	MY	406 	47	F
1781	Logan	Shaw	CR	451 	47	B
1782	Eugenia	Head	QT	668 	33	B
1783	Minerva	Joseph	RQ	132 	14	C
1784	Colleen	Howard	NY	455 	35	F
1785	Lucy	Ruiz	ED	170 	30	F
1786	Nina	Collins	VN	563 	40	F
1787	Anjolie	Witt	BD	914 	33	C
1788	MacKensie	Callahan	KR	834 	13	D
1789	Troy	Howard	CX	042 	45	C
1790	MacKensie	Holcomb	QT	668 	33	D
1791	Gemma	Mccoy	VS	414 	12	E
1792	Rina	Mccray	HH	762 	15	C
1793	Lee	Cannon	VJ	110 	12	B
1794	Drake	Hunt	PA	925 	31	D
1795	Brody	Mcclain	HZ	845 	20	E
1796	Flavia	Lyons	QL	170 	38	C
1797	Cairo	Spencer	HZ	845 	30	A
1798	Silas	Knox	HZ	845 	14	B
1799	Charlotte	Duffy	WO	636 	4	F
1800	Susan	Estrada	II	736 	17	E
1801	Tanisha	Guerra	FG	352 	19	C
1802	Haviva	Holcomb	GY	199 	40	F
1803	Ira	Valenzuela	SV	458 	11	E
1804	Stacey	Peters	UP	288 	6	A
1805	Yoshio	Booker	UP	766 	42	A
1806	Teegan	Davidson	CO	489 	9	A
1807	Hedley	Yang	PV	638 	39	E
1808	Ila	Thompson	PV	638 	25	B
1809	Edward	Bartlett	LZ	819 	24	E
1810	Byron	Mccullough	BS	047 	30	C
1811	Hannah	Dickson	GK	472 	29	F
1812	Debra	Spears	JU	300 	36	B
1813	Wynter	Quinn	WK	404 	1	A
1814	Adele	Kinney	GT	289 	19	C
1815	Ashton	Bryan	FD	003 	35	D
1816	Vincent	Bryant	IH	874 	24	E
1817	Jocelyn	Grimes	PL	732 	24	F
1818	Stuart	Garcia	QC	028 	43	D
1819	Katelyn	Pruitt	KE	346 	12	A
1820	Oscar	Cochran	WE	454 	38	B
1821	Joel	Decker	RW	070 	28	F
1822	Samuel	Washington	GZ	498 	13	C
1823	Alea	Hull	OM	653 	43	E
1824	Perry	Green	GX	618 	29	F
1825	Lana	Moreno	BO	396 	12	E
1826	Denton	Trevino	XP	397 	48	C
1827	Mannix	Greene	KV	480 	3	A
1828	Adria	Burgess	GY	199 	18	E
1829	Aurora	Park	BT	177 	11	F
1830	Quinn	Chang	QS	265 	44	C
1831	Phelan	Daugherty	CO	489 	35	D
1832	George	Patton	II	736 	19	B
1833	Kenyon	Barlow	LQ	277 	23	A
1834	Rowan	Phillips	GX	618 	31	C
1835	Alden	Shannon	AZ	330 	27	B
1836	MacKenzie	Chandler	JG	442 	11	D
1837	Basil	Hopkins	BI	595 	5	E
1838	May	Fletcher	EI	833 	4	C
1839	Amela	Collier	SP	590 	1	E
1840	Wilma	Prince	JY	579 	24	A
1841	Tiger	Mckay	FG	352 	44	B
1842	Scott	Woodard	GT	289 	47	B
1843	Raven	Bender	BD	914 	18	A
1844	Lunea	Berry	FL	875 	38	D
1845	Stella	Christian	HG	034 	22	A
1846	Gemma	Love	JM	165 	24	E
1847	Leroy	Cain	FM	538 	40	F
1848	Jasmine	Baird	PN	676 	1	C
1849	Jocelyn	Sykes	XO	285 	29	D
1850	Nina	Dickson	HZ	845 	7	B
1851	Amy	Mccarty	HX	552 	40	C
1852	Beau	Olsen	RW	070 	23	F
1853	Raven	Carlson	CM	505 	34	C
1854	Mohammad	Richmond	QT	439 	43	A
1855	Connor	Mendoza	UP	872 	39	A
1856	Byron	Branch	RK	238 	9	F
1857	Tallulah	Francis	AI	049 	40	E
1858	Colby	Black	II	787 	43	A
1859	Erica	Holder	FF	496 	7	B
1860	Stephen	Wallace	NQ	464 	9	A
1861	Beau	Huff	XP	397 	38	B
1862	Amal	Campos	MA	054 	1	B
1863	Ayanna	Sampson	UP	872 	6	B
1864	Robin	Cherry	WK	404 	16	B
1865	Ignacia	Sampson	EJ	348 	44	E
1866	Elvis	Hooper	RJ	342 	28	D
1867	Aquila	Graves	TI	643 	8	E
1868	Fletcher	Holder	CU	936 	27	A
1869	Hedy	Dawson	TH	035 	7	A
1870	Abraham	Marshall	TX	227 	40	C
1871	Herrod	Hodge	GA	435 	26	A
1872	Ariana	Cunningham	JX	858 	10	B
1873	Pearl	Hickman	SP	590 	19	F
1874	Vaughan	Mcmahon	FD	003 	5	C
1875	Reed	Carpenter	LH	594 	34	F
1876	Leila	Hurley	NC	353 	15	A
1877	Abra	Weiss	AY	270 	43	E
1878	Dylan	Bishop	TK	728 	49	B
1879	Quincy	Noble	BQ	963 	30	E
1880	Galena	Ortega	EK	316 	1	E
1881	Kirsten	Underwood	IT	126 	14	E
1882	Florence	Calderon	RK	576 	39	A
1883	Ivor	Mcfadden	VP	373 	4	E
1884	Cadman	Caldwell	RQ	132 	7	B
1885	Barrett	Wilder	HH	762 	9	A
1886	Imani	Gay	TI	643 	16	E
1887	Tanya	Richardson	PA	925 	3	E
1888	Emily	Flynn	QJ	126 	39	E
1889	Carolyn	Joyce	HH	762 	12	B
1890	Blake	Le	MJ	157 	20	D
1891	Silas	Schroeder	RK	576 	5	C
1892	Kirby	Dalton	MJ	157 	16	E
1893	Brent	Schwartz	VP	343 	40	C
1894	Kiona	Kirby	GX	618 	46	B
1895	Keegan	Cochran	VV	284 	27	A
1896	Cherokee	Byrd	ED	170 	1	E
1897	Inga	Sherman	MA	031 	39	B
1898	Hollee	Norris	PW	078 	40	F
1899	Autumn	Woods	ZH	274 	21	C
1900	Gretchen	Leblanc	FG	352 	2	C
1901	Todd	Sanford	BP	603 	30	F
1902	Alfonso	York	WK	404 	7	D
1903	Lance	Quinn	AP	510 	25	B
1904	Keelie	Petty	XG	233 	24	E
1905	Ferdinand	Sherman	KE	346 	24	B
1906	Molly	Fleming	QI	552 	31	C
1907	Nathaniel	Barnett	VP	373 	48	D
1908	Harrison	Klein	LQ	277 	12	D
1909	Ezra	Gutierrez	NQ	464 	18	E
1910	Ruth	Greene	CR	451 	16	F
1911	Tasha	Burns	JR	359 	34	E
1912	Clio	Pugh	RO	333 	18	D
1913	Logan	Tyson	SL	779 	2	E
1914	Brian	Pate	QH	303 	48	E
1915	Cruz	Burke	KQ	514 	20	B
1916	Mary	Le	GK	472 	13	C
1917	Nissim	Hodge	AZ	330 	2	C
1918	Brittany	Gutierrez	FF	496 	37	F
1919	Erich	Lynch	BP	603 	35	B
1920	Holmes	Hendricks	ER	756 	48	A
1921	Reed	Malone	PC	347 	3	D
1922	Seth	Barrera	ZH	274 	40	C
1923	Justine	Petty	QJ	126 	33	B
1924	Courtney	Barrera	MH	777 	10	D
1925	Driscoll	Hayes	SA	023 	9	A
1926	Karly	Christensen	XO	285 	2	C
1927	Rae	Walker	JX	493 	30	A
1928	Nicholas	Mccoy	XO	285 	20	D
1929	Buffy	Kelley	JE	967 	42	B
1930	Harlan	Reynolds	OM	653 	12	F
1931	Iona	Powell	KQ	514 	48	D
1932	Wilma	Madden	SH	007 	11	E
1933	Aileen	Oneill	MH	777 	22	C
1934	Vanna	Osborne	MW	301 	39	C
1935	Michael	Ford	IM	310 	41	C
1936	Kelly	Harmon	FE	776 	44	D
1937	Imelda	Pacheco	MH	777 	45	A
1938	Ashton	Head	II	736 	27	E
1939	Casey	Petty	EK	316 	4	C
1940	Marsden	Griffin	AA	000 	4	E
1941	Aileen	Haynes	LH	999 	43	A
1942	Steven	Cunningham	MA	054 	6	F
1943	Paul	Fox	ID	590 	5	B
1944	Vance	Pugh	BP	603 	38	C
1945	Matthew	Hobbs	AC	703 	48	D
1946	Shelly	Hays	GY	698 	49	B
1947	Kamal	Figueroa	MY	683 	31	C
1948	Amelia	Barr	RK	238 	40	C
1949	Rhonda	Carpenter	ST	115 	19	A
1950	Ariel	Huber	ZH	274 	29	F
1951	Anne	Ewing	WK	404 	12	A
1952	Kristen	Kidd	AG	730 	36	A
1953	Aquila	Clark	TH	035 	19	A
1954	Emerson	Berry	HM	100 	20	C
1955	Fleur	Griffith	FD	003 	40	C
1956	Zenaida	Drake	QT	439 	15	C
1957	Derek	Vargas	AY	270 	4	B
1958	Maite	Harding	QT	668 	1	D
1959	Kadeem	Clark	VJ	110 	33	E
1960	Iola	Burke	MH	777 	26	E
1961	Zelenia	Trujillo	NY	455 	28	B
1962	Wade	Serrano	PN	676 	29	B
1963	Brandon	Roth	VP	373 	43	D
1964	Ronan	Wilcox	ED	170 	2	C
1965	Price	Barrett	AG	730 	39	E
1966	Imani	Travis	BP	603 	46	D
1967	Sierra	Pruitt	CM	505 	37	B
1968	Candice	Farmer	LZ	819 	14	D
1969	Rebecca	Alford	HW	661 	7	E
1970	Gray	Snyder	JG	442 	22	C
1971	Angela	Vasquez	LL	033 	30	B
1972	Caldwell	Aguilar	UP	766 	23	E
1973	Neve	Flynn	ON	006 	46	C
1974	Odysseus	Robertson	TF	518 	17	F
1975	Ima	Ayala	KR	834 	32	F
1976	Hanna	English	RJ	342 	16	F
1977	Rebecca	Mclean	PV	638 	48	E
1978	Benjamin	York	HX	552 	41	D
1979	Drake	Wilkerson	UY	613 	23	C
1980	Kenyon	Lester	KE	346 	43	F
1981	Buckminster	Campos	HZ	845 	18	F
1982	Aladdin	Moore	IH	960 	37	C
1983	Amy	Valenzuela	EI	833 	17	D
1984	Austin	Wise	BO	711 	12	F
1985	Kelly	Everett	AJ	504 	13	C
1986	Nevada	Fischer	MW	301 	42	F
1987	Clinton	Boyle	LZ	819 	41	F
1988	Unity	Goodwin	CK	148 	41	B
1989	Aimee	Gilmore	LQ	277 	14	E
1990	Blair	Jimenez	QI	552 	35	A
1991	Kessie	Payne	ON	006 	19	A
1992	Shannon	Phillips	UB	871 	1	B
1993	Indigo	Case	UY	613 	40	D
1994	Travis	Moore	IJ	984 	28	F
1995	Carlos	Bailey	FG	352 	40	D
1996	Isabelle	Hart	OT	902 	48	A
1997	Abra	Conrad	II	787 	37	E
1998	Gage	Mcmillan	GY	698 	12	B
1999	Todd	Stevens	JX	493 	2	D
2000	Ruby	Robbins	RQ	584 	47	C
\.


--
-- Data for Name: planes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.planes (id, manufacturer, type, lengthoverall, span, maxspeed, initialserviceyear, maxseats, seatsperrow) FROM stdin;
23	Airbus	A300-600R	54.08	44.84	480	1974	345	9
24	Airbus	A310-300	46.66	43.89	484	1983	265	9
25	Airbus	A319-100	33.84	33.91	487	1995	153	6
26	Airbus	A320-200	37.57	33.91	487	1988	179	6
27	Airbus	A321-100	44.51	33.91	487	1993	220	6
28	Airbus	A330-200	58.372	58	\N	1998	380	9
29	Airbus	A330-300	63.689	58	500	1994	440	9
30	Airbus	A340-200	59.422	58	500	1993	440	9
31	Airbus	A340-500	67.929	61.2	\N	2002	440	9
32	Airbus	A340-600	75.362	61.2	\N	2002	475	9
33	Airbus	A380-800	72.727	79.8	507	2004	850	10
34	Boeing	B707-320C	46.66	44.42	521	1962	219	6
35	Boeing	B717-200	37.8	28.4	\N	1999	110	5
36	Boeing	B727-200Adv	46.68	32.92	530	1970	189	6
37	Boeing	B737-200	30.53	28.35	488	1967	130	6
38	Boeing	B737-400	36.4	28.9	492	1967	170	6
39	Boeing	B737-500	31.01	28.9	492	1967	130	6
40	Boeing	B737-700	33.63	34.3	\N	1997	149	6
41	Boeing	B737-800	39.47	34.3	\N	1998	189	6
42	Boeing	B747-400N	70.67	62.3	507	1988	660	10
43	Boeing	B757-200	47.32	38.05	513	1982	239	6
44	Boeing	B757-300	54.43	38.05	505	1999	289	6
45	Boeing	B767-200	48.51	47.57	488	1982	255	8
46	Boeing	B767-300	54.94	47.57	489	1982	290	8
47	Boeing	777-200ER	63.73	60.9	499	1995	440	10
48	McDonald Douglas	DC 9-30	36.36	28.47	503	1967	119	5
49	McDonald Douglas	DC 8-63	57.12	54.24	\N	1967	259	6
50	McDonald Douglas	DC 10-10	55.55	47.35	\N	1971	399	9
51	Tupolev	Tu-134	37.05	29	458	1967	84	4
52	Tupolev	TU-204-300	40.19	40.88	\N	1996	162	6
53	Embraer	EMB-145	29.87	20.04	410	1997	50	3
54	IAI	1124A Westwind 2	15.93	13.65	\N	1963	10	2
55	Sud Aviation	Caravelle	\N	34.3	\N	1959	89	5
56	VRW-Fokker	614	20.6	21.5	\N	1975	44	4
57	HFB	320	16.61	14.5	\N	1964	12	2
58	Gates	Lear Jet Model 23	\N	10.84	\N	1963	7	2
59	Lockheed	Jetstar II	18.42	16.59	\N	1976	10	2
60	Dassault	Falcon 20	17.15	15.4	\N	1965	14	2
61	BAC	One-Eleven Series 500	32.61	28.5	\N	1965	119	5
62	Vickers	Super VC-10	\N	44.55	\N	1964	174	6
63	Raytheon	Hawker 800XP	\N	15.66	\N	1995	17	2
64	Beechcraft	Beechje 400A	\N	13.25	\N	1993	9	2
65	Beriev	Be-200	32.05	32.78	\N	1997	68	4
66	Bombardier	Global Express	30.3	28.6	\N	1999	30	3
67	Bombardier	Challenger CRJ 200 LR	26.77	21.21	\N	1996	50	4
68	BAE	146 RJ85	28.55	26.34	\N	1993	100	6
69	Beriev	Be-40	43.84	\N	\N	\N	\N	\N
\.


--
-- Name: passengers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.passengers_id_seq', 1, false);


--
-- Name: planes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planes_id_seq', 1, false);


--
-- Name: airlines airlines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airlines
    ADD CONSTRAINT airlines_pkey PRIMARY KEY (id);


--
-- Name: airports airports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airports
    ADD CONSTRAINT airports_pkey PRIMARY KEY (airportcode);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (code);


--
-- Name: countriesfull countriesfull_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countriesfull
    ADD CONSTRAINT countriesfull_pkey PRIMARY KEY (code2, continentcode);


--
-- Name: flights flights_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_pkey PRIMARY KEY (airline, flightnr);


--
-- Name: passengers passengers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passengers
    ADD CONSTRAINT passengers_pkey PRIMARY KEY (id);


--
-- Name: planes planes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planes
    ADD CONSTRAINT planes_pkey PRIMARY KEY (id);


--
-- Name: airlines airlines_country_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airlines
    ADD CONSTRAINT airlines_country_fkey FOREIGN KEY (country) REFERENCES public.countries(code);


--
-- Name: airports airports_country_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airports
    ADD CONSTRAINT airports_country_fkey FOREIGN KEY (country) REFERENCES public.countries(code);


--
-- Name: flights flights_airline_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_airline_fkey FOREIGN KEY (airline) REFERENCES public.airlines(id);


--
-- Name: flights flights_departure_airport_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_departure_airport_fkey FOREIGN KEY (departure_airport) REFERENCES public.airports(airportcode);


--
-- Name: flights flights_destination_airport_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_destination_airport_fkey FOREIGN KEY (destination_airport) REFERENCES public.airports(airportcode);


--
-- Name: flights flights_planetype_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_planetype_fkey FOREIGN KEY (planetype) REFERENCES public.planes(id);


--
-- Name: passengers passengers_airline_flightnr_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passengers
    ADD CONSTRAINT passengers_airline_flightnr_fkey FOREIGN KEY (airline, flightnr) REFERENCES public.flights(airline, flightnr);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

