-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 21, 2020 at 03:15 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `etrdb`
--
CREATE DATABASE IF NOT EXISTS `etrdb` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `etrdb`;

-- --------------------------------------------------------

--
-- Table structure for table `felvetel`
--

CREATE TABLE `felvetel` (
  `etr_id` varchar(6) COLLATE utf8_hungarian_ci NOT NULL,
  `kurzus_id` varchar(6) COLLATE utf8_hungarian_ci NOT NULL,
  `fevetelek_szama` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `idopont` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gepterem`
--

CREATE TABLE `gepterem`
(
    `teremszam`   varchar(6) COLLATE utf8_hungarian_ci NOT NULL,
    `ferohel`     int(10) UNSIGNED                       DEFAULT NULL,
    `cim`         varchar(100) COLLATE utf8_hungarian_ci DEFAULT NULL,
    `gepek_szama` int(10) UNSIGNED                       DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_hungarian_ci;

--
-- Dumping data for table `gepterem`
--

INSERT INTO `gepterem` (`teremszam`, `ferohel`, `cim`, `gepek_szama`)
VALUES ('1AZ5O9', 206, '274 Gomez Lodge Suite 736 New Charlesmouth, KS 10165', 206),
       ('1DwHv6', 80, '254 David Crossroad Suite 989 East Breannafurt, VA 66610', 80),
       ('1MaLZ1', 136, '6873 Erica Turnpike Juantown, AK 61431', 136),
       ('2A0IqS', 24, '11023 Mcgee Stravenue Apt. 618 Curtisbury, AL 82729', 24),
       ('2m6DBN', 186, '023 Sharon Mountain Apt. 958 Bryantview, IL 09030', 186),
       ('380joW', 17, 'Unit 6365 Box 4215 DPO AE 56524', 17),
       ('7b6xE6', 59, 'Unit 2910 Box 4159 DPO AE 47125', 59),
       ('c9HS6p', 12, '0109 Taylor Plaza Suite 681 Lindsaymouth, NV 90650', 12),
       ('CK2Xz0', 264, '3103 Young Knolls Suite 611 Dayport, IL 50842', 264),
       ('d4XzbS', 50, '111 Marsh Mission Robinsonport, AK 61122', 50),
       ('D7EobO', 19, 'Unit 5332 Box 4450 DPO AP 39018', 19),
       ('DXqFCl', 22, '026 Eric Club Greenberg, AR 74747', 22),
       ('edrmhP', 170, '68682 Wright Mountains Richardchester, MD 41966', 170),
       ('F2owkT', 220, '69401 Garcia Points North Shannonhaven, VT 28491', 220),
       ('fDYupA', 93, '787 Kennedy Points Apt. 445 Sarahside, SD 22306', 93),
       ('GeruVR', 203, '2910 Christensen Lane Tiffanyfurt, DC 75058', 203),
       ('GMnKpn', 35, '284 Murphy Stream Wileyton, VA 06741', 35),
       ('GxJIwV', 21, '48590 Vincent Corner Suite 837 Beckerbury, KY 68613', 21),
       ('HJebNv', 97, '6073 John Mount Apt. 465 East Deniseberg, IL 25765', 97),
       ('HlLINw', 113, '79895 Thomas Dale Apt. 492 Sellersshire, OR 96660', 113),
       ('ibihUI', 297, '964 Diaz Gardens East Julie, WA 40706', 297),
       ('ioVtgC', 96, '0070 Alexander Views Apt. 308 Matthewtown, TN 77839', 96),
       ('IuOabs', 12, '7581 Katie Points Suite 366 Hughesfurt, AL 94205', 12),
       ('IXMeva', 142, '290 Tiffany Place New Ryan, RI 10553', 142),
       ('JoGnaw', 14, '5262 Sylvia Via Suite 358 South John, MT 45470', 14),
       ('KilOkU', 78, '30580 Rita Neck East Laura, AZ 94255', 78),
       ('kmUyPT', 333, '45441 Smith Wall New Stephanie, AL 21835', 333),
       ('LMJNYn', 250, '861 Monroe Pike Apt. 403 North Allison, PA 69837', 250),
       ('m3SX4j', 67, '3407 Rojas Mount North Christophershire, AZ 95641', 67),
       ('maauVt', 138, '04864 Arnold Vista Suite 155 East Monicatown, LA 86089', 138),
       ('ML4N11', 21, '68175 Michael Inlet Apt. 467 Mitchellborough, CA 01431', 21),
       ('mm1oJv', 51, '863 Jennifer Island Richardview, WV 28477', 51),
       ('NED4LA', 115, '1162 Jimenez Brook Apt. 611 Lake Michelle, OR 06695', 115),
       ('nq3j2h', 115, '215 Barry Knolls Duncanstad, CO 58104', 115),
       ('o0tY5E', 27, '046 Diana Square Johnport, LA 64723', 27),
       ('Px6u8M', 316, '19316 Jennifer Throughway Butlerville, PA 03658', 316),
       ('QdqNXK', 161, '864 Smith Path Suite 068 Carrollfort, OK 09134', 161),
       ('qo1Kgc', 191, '8082 Barker Forges East Richardshire, AZ 94984', 191),
       ('QXH2Oe', 103, '10487 James Square Bellville, AK 96019', 103),
       ('RNLPWP', 147, '24375 Robert Hill Apt. 232 Wisemouth, MA 85018', 147),
       ('UTkfGW', 88, '61119 Julian Park New Jimmychester, IN 06626', 88),
       ('UU0Hak', 297, '2181 Austin Court Olsonmouth, DE 67738', 297),
       ('V06SV9', 17, '757 Johnson Garden Jessicamouth, AZ 07647', 17),
       ('wo16YI', 41, '98523 Patricia Well Barrview, MO 60286', 41),
       ('WyywQf', 227, '5133 Perez Lane Apt. 405 West Teresahaven, TX 17757', 227),
       ('WziTGl', 78, '0260 Flores Street New Dannyview, GA 56301', 78),
       ('yoUgas', 57, '119 Todd Canyon Apt. 207 Stevenville, OH 88425', 57),
       ('ZalAPG', 200, '32748 Evans Keys North Christopherview, SC 59607', 200),
       ('ZHtl35', 126, '34680 Jason Islands South Aprilberg, CO 85534', 126),
       ('ZIa7yA', 11, '60237 Wall Extension East Tiffanyshire, MA 18094', 11);

-- --------------------------------------------------------

--
-- Table structure for table `hallgato`
--

CREATE TABLE `hallgato`
(
    `hallgato_etr_id`       varchar(6) COLLATE utf8_hungarian_ci  NOT NULL,
    `lakhely`               varchar(100) COLLATE utf8_hungarian_ci DEFAULT NULL,
    `tagozat_forma`         char(20) COLLATE utf8_hungarian_ci    NOT NULL,
    `koltsegteritesi_forma` char(20) COLLATE utf8_hungarian_ci    NOT NULL,
    `vezeteknev`            varchar(30) COLLATE utf8_hungarian_ci NOT NULL,
    `keresztnev`            varchar(30) COLLATE utf8_hungarian_ci NOT NULL,
    `titulus`               varchar(5) COLLATE utf8_hungarian_ci   DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_hungarian_ci;

--
-- Dumping data for table `hallgato`
--

INSERT INTO `hallgato` (`hallgato_etr_id`, `lakhely`, `tagozat_forma`, `koltsegteritesi_forma`, `vezeteknev`,
                        `keresztnev`, `titulus`)
VALUES ('0EXSDF', '47518 Douglas Ridge Apt. 494 Erinburgh, WA 70965', 'levelező', 'önköltséges', 'Lemon', 'Mark', NULL),
       ('17Hcft', '359 Williams Expressway Leslieberg, WY 21294', 'normál', 'önköltséges', 'Beavers', 'Anthony', 'Dr.'),
       ('1f9Wr7', '23645 Cummings Turnpike West Brian, AK 51740', 'normál', 'állami', 'Braswell', 'Cynthia', NULL),
       ('2jZOzU', '48195 Greene Run West Jenniferfurt, NJ 66278', 'normál', 'állami', 'Arciba', 'Fred', NULL),
       ('3HdKSp', '365 Jessica Cliffs Port Paul, ME 88027', 'normál', 'állami', 'Aguiniga', 'Randall', NULL),
       ('3kI6ls', '523 Barbara Way Suite 829 South Brianton, OK 33733', 'normál', 'állami', 'Williams', 'Christopher',
        NULL),
       ('3RmUMc', '8672 Sexton Vista West Kelly, OR 25707', 'normál', 'állami', 'Beale', 'Christian', NULL),
       ('4M7R0C', '259 Jimenez Inlet Apt. 760 Port Victoriahaven, NY 30894', 'normál', 'önköltséges', 'Virgil',
        'Margaret', NULL),
       ('4vrYmo', '976 Kevin Parks Lake Nathaniel, PA 61559', 'levelező', 'állami', 'Loya', 'Albert', NULL),
       ('4YNtJp', '6164 Justin Knoll South Frederickview, VT 87778', 'normál', 'önköltséges', 'Monson', 'Kent', NULL),
       ('51lhkO', '34185 Donald Pine Suite 061 Port Patrick, IN 12513', 'levelező', 'állami', 'Haug', 'Dawn', 'Dr.'),
       ('5A3Flq', '69719 Perry Haven Apt. 985 Odomland, CO 75212', 'levelező', 'állami', 'Soos', 'Margaret', NULL),
       ('5N5Dxv', '495 John Street Suite 762 Kristenberg, AZ 06094', 'levelező', 'állami', 'Odonnell', 'Russell',
        'Dr.'),
       ('5qqQXi', '994 Jesus Causeway New Coryton, DE 36416', 'normál', 'állami', 'Doyel', 'Sherice', NULL),
       ('5wXsAG', '59015 Green Pike Tanyafurt, ID 82948', 'normál', 'állami', 'Beaudoin', 'Edna', 'Dr.'),
       ('6uRj2S', '3269 Fisher Shoal Suite 957 West Bethanyville, KS 06404', 'normál', 'állami', 'Smith', 'Gerald',
        NULL),
       ('6XyGPN', '270 Tiffany Keys New Megan, NV 17933', 'normál', 'állami', 'Williams', 'Derek', NULL),
       ('7YB1fj', '146 Helen Inlet Suite 783 Christophertown, KS 42719', 'normál', 'önköltséges', 'Bernier', 'Daniel',
        NULL),
       ('81KlKA', '519 Travis Ridge West Matthewhaven, WI 25005', 'normál', 'önköltséges', 'Lightfoot', 'Aaron', NULL),
       ('8D6m6a', '0840 Schwartz Via Lake Amanda, MS 49091', 'normál', 'állami', 'Inman', 'Tina', 'Dr.'),
       ('9OntCT', '9513 Kimberly Oval Thomasstad, TX 76568', 'normál', 'állami', 'Brow', 'Sandra', NULL),
       ('9RLQkd', '7258 Carpenter Tunnel Petersonhaven, MO 41544', 'normál', 'önköltséges', 'Bischoff', 'Kevin', NULL),
       ('a0yMjS', '902 Cruz Stravenue West Felicia, ME 52470', 'levelező', 'állami', 'Latouf', 'Debra', 'Dr.'),
       ('ABBxgz', '5137 Chad Spring North Michael, NH 90053', 'normál', 'önköltséges', 'Shearin', 'Ellen', NULL),
       ('aFxG00', '8055 Campbell Junction Suite 293 South Brett, ND 40667', 'normál', 'önköltséges', 'Johnson',
        'Curtis', NULL),
       ('B6ErUB', '0048 Sanchez Summit Apt. 035 Robertsonport, GA 52224', 'normál', 'állami', 'Hall', 'Gladys', 'Dr.'),
       ('bGXQnu', '21705 Thomas Squares Apt. 480 Port Christopher, MN 49496', 'levelező', 'önköltséges', 'Howard',
        'Jack', NULL),
       ('ByCi2J', '1541 Juan Oval Apt. 651 North Benjaminside, FL 51712', 'normál', 'állami', 'Santistevan', 'Michael',
        'Dr.'),
       ('c8HWOu', '52195 Christopher Pass West Stephanie, NV 99619', 'normál', 'állami', 'Zenon', 'Theodore', NULL),
       ('cLzKLF', '253 Christopher Trace South Stephen, FL 21486', 'normál', 'önköltséges', 'Rivers', 'Kathy', NULL),
       ('cz6u6D', '516 Eric Village Lake Miguel, IA 06976', 'normál', 'állami', 'Elliott', 'Charlene', NULL),
       ('dJAooQ', '401 Juarez Club Ortizbury, NC 33922', 'normál', 'önköltséges', 'Fox', 'Thomas', 'Dr.'),
       ('DKZida', '542 Wallace Garden Apt. 637 Jeffreyberg, RI 19218', 'normál', 'állami', 'Goldsmith', 'Betty', NULL),
       ('DNnjd3', '24484 Justin Ford South Jeffreyburgh, MT 86116', 'normál', 'önköltséges', 'Smith', 'James', 'Dr.'),
       ('dsUN8j', 'PSC 6993, Box 0976 APO AP 67755', 'normál', 'állami', 'Arden', 'Janet', NULL),
       ('edNPq1', '008 Elizabeth Bridge Suite 747 Jacksonborough, CO 81816', 'normál', 'állami', 'Bailey', 'Marion',
        NULL),
       ('F1h74S', '1384 Faulkner Plains Apt. 878 Port Emilyhaven, ME 11052', 'normál', 'állami', 'Delay', 'Mary', NULL),
       ('FhpNzS', '6165 William Mission Apt. 223 South Jeffreyshire, NE 73334', 'normál', 'állami', 'Henderson',
        'Jesus', NULL),
       ('HaY9YI', 'Unit 8222 Box 4730 DPO AP 60175', 'levelező', 'állami', 'Shiels', 'Cynthia', NULL),
       ('HB4WMC', '912 Marshall Unions Josephfurt, IL 47948', 'normál', 'állami', 'Thomas', 'Kim', NULL),
       ('IfNh1c', '696 Jonathan Terrace Apt. 947 Butlerburgh, KS 28933', 'normál', 'állami', 'Benson', 'Earl', NULL),
       ('IYBt2B', '2770 Lisa Isle Allenport, IA 02031', 'normál', 'állami', 'Sale', 'Socorro', NULL),
       ('jghffu', '270 Brad Forge Apt. 245 Oscarmouth, VA 98931', 'levelező', 'állami', 'Sims', 'Crystal', 'Dr.'),
       ('JS1aNa', '139 Cameron Vista Suite 394 New Brandonville, WY 61929', 'levelező', 'állami', 'Carbo', 'Roy', NULL),
       ('JxYaUe', '6460 Taylor Crossing Apt. 318 Martinbury, AZ 34721', 'normál', 'állami', 'Burlison', 'Sandra', NULL),
       ('k1ct7I', 'Unit 3533 Box 6298 DPO AA 35026', 'normál', 'önköltséges', 'Hahn', 'Alma', 'Dr.'),
       ('ktTbdX', '8238 Amanda Fork Suite 723 Matthewhaven, WA 45068', 'normál', 'állami', 'Jackson', 'Caitlyn', NULL),
       ('KU1UYy', 'Unit 5101 Box 3747 DPO AP 42640', 'normál', 'állami', 'Ruybal', 'Dave', NULL),
       ('lEqa42', '21344 Glenn Ways North Amanda, CO 27034', 'normál', 'önköltséges', 'Bracco', 'Lauri', NULL),
       ('LjBFAM', '7282 Zachary Forge Apt. 297 Cummingsburgh, NJ 16711', 'levelező', 'állami', 'Rick', 'Steven', 'Dr.'),
       ('MfCsvE', '67674 Andrea Drives South Glennview, AL 06572', 'normál', 'állami', 'Burrell', 'Laurie', NULL),
       ('mhF7ST', '92568 Stephanie Stream Yvonnestad, MA 27472', 'normál', 'állami', 'Pouncey', 'Jon', NULL),
       ('mr3F4G', '10528 Sanchez Mountains Apt. 352 Port Andrea, WA 44996', 'normál', 'önköltséges', 'Landaverde',
        'Thomas', NULL),
       ('mSCCE8', '3908 Patrick Causeway Ericksonhaven, KY 10816', 'levelező', 'állami', 'Maddox', 'Robert', NULL),
       ('MziBzG', '4331 Laura Corner Kaylafurt, PA 85769', 'normál', 'állami', 'Hendon', 'Ted', NULL),
       ('N1TOxt', 'PSC 6621, Box 0492 APO AE 79115', 'levelező', 'önköltséges', 'Dade', 'Kevin', NULL),
       ('nhtLtM', '764 Beasley Greens Mcmahonview, DE 94966', 'normál', 'állami', 'White', 'Casey', NULL),
       ('nTAenI', '98459 Smith Mount Apt. 708 Richardsonville, OK 31680', 'normál', 'állami', 'Frederick', 'James',
        NULL),
       ('NtJ5uN', '388 Daniels Drives Apt. 943 South Amy, IL 66697', 'levelező', 'állami', 'Peterson', 'Morton', 'Dr.'),
       ('oHFejp', '216 Gallagher Meadow Apt. 995 New Raymond, OR 18474', 'normál', 'önköltséges', 'Drake', 'Donald',
        NULL),
       ('OkTo9m', '6350 Carson Circles Apt. 361 Stacyfort, MI 70439', 'normál', 'állami', 'Mahurin', 'Tami', NULL),
       ('OTiVbV', '127 Anthony Passage Lake Christopherborough, WY 53163', 'normál', 'önköltséges', 'Roberts',
        'Annette', NULL),
       ('OZmn9B', '085 Stephenson Station North Jamie, MI 36587', 'normál', 'önköltséges', 'Yeager', 'Philip', NULL),
       ('PE8qie', '72863 Garrett Parks Apt. 087 West Seanburgh, NE 85015', 'normál', 'önköltséges', 'Romero', 'Richard',
        'Dr.'),
       ('Pfe0cu', '318 Oliver Inlet Suite 483 Robertsville, VT 03797', 'normál', 'állami', 'Stahl', 'Andrew', NULL),
       ('PRDXpW', '96243 Jacobs Parkways Apt. 748 Amyton, IN 92757', 'normál', 'állami', 'Wentzel', 'Patricia', NULL),
       ('QH6Q90', '40490 Steven Plaza Suite 721 Richardchester, MA 35817', 'levelező', 'állami', 'Parson', 'Gloria',
        NULL),
       ('QRL7HO', '53789 Juan Creek Kellychester, WV 33954', 'normál', 'állami', 'Tronaas', 'Evelyn', NULL),
       ('QZaJF8', '403 Kelsey Squares Martinton, OR 38861', 'normál', 'állami', 'Roy', 'Lorraine', NULL),
       ('rlGyoq', '6814 Thompson Motorway Apt. 002 Lake Johnview, MA 58301', 'levelező', 'állami', 'Reed', 'Wilbert',
        NULL),
       ('sETaOd', '7784 Kim Avenue Suite 748 West Susan, IA 95891', 'normál', 'állami', 'Miller', 'Raymond', NULL),
       ('SzPNFm', 'USCGC Reed FPO AE 27894', 'levelező', 'önköltséges', 'Filipponi', 'Jay', NULL),
       ('tB3PwV', '7501 Jordan Overpass Jameschester, NH 02761', 'normál', 'állami', 'Jones', 'Keith', NULL),
       ('tIxDff', '268 Lutz Plaza New Williamland, NY 86894', 'normál', 'állami', 'Siebenaler', 'Sterling', NULL),
       ('tkEVsi', '0892 Donald Crossroad Apt. 006 Stephanieland, UT 77961', 'normál', 'önköltséges', 'Carter', 'David',
        'Dr.'),
       ('TM6pHi', 'PSC 0906, Box 0067 APO AP 32159', 'normál', 'állami', 'Stribling', 'Latisha', NULL),
       ('U59IEx', '8239 Brooke Forge North Tracystad, ME 04207', 'normál', 'állami', 'Smith', 'Shelton', 'Dr.'),
       ('uDzTeI', '4588 Nathan Rue Suite 094 West Willie, AZ 35069', 'normál', 'állami', 'Trotter', 'Benjamin', NULL),
       ('uSCB9W', '5170 Amanda Pass Apt. 988 Gabriellashire, LA 97433', 'normál', 'állami', 'Bleau', 'Ellen', NULL),
       ('V1bsjp', '487 Brandi Key Tiffanyborough, CT 08937', 'normál', 'önköltséges', 'Pedley', 'Michael', NULL),
       ('v2LxD4', '2588 Jones Shoal Edwardmouth, IL 96945', 'normál', 'állami', 'Graham', 'Jerry', NULL),
       ('vifeEo', '20693 Nelson Key Apt. 797 Port Lindsey, NM 46260', 'normál', 'állami', 'Conklin', 'Dennis', 'Dr.'),
       ('VMLZtD', '02226 Vargas Extensions Garyville, VA 00882', 'levelező', 'állami', 'Mcdowell', 'Richard', NULL),
       ('w6cEId', '800 Robert Road Cindyburgh, AR 10704', 'normál', 'önköltséges', 'Bier', 'Bianca', 'Dr.'),
       ('w6JgYc', '35775 Eric Village South William, NC 70295', 'normál', 'állami', 'Serrato', 'Mae', NULL),
       ('wflt2o', '662 Cantu Flat West Keith, MS 92189', 'normál', 'állami', 'Pena', 'Carl', NULL),
       ('WIbZrH', 'PSC 0829, Box 2584 APO AP 18011', 'normál', 'állami', 'Johnson', 'Elvia', NULL),
       ('WOUQuc', '3560 Franco Drive Suite 659 Tammyville, IL 18885', 'normál', 'állami', 'Brown', 'Michele', NULL),
       ('x0BHPt', '82304 Logan Road Codyborough, AK 93936', 'normál', 'önköltséges', 'Miller', 'Murray', NULL),
       ('xB10Wz', '54329 Thomas Centers Grossburgh, GA 76107', 'normál', 'állami', 'Altman', 'Larry', NULL),
       ('XUv7uA', '441 Burnett Crossing Angelaside, MT 75928', 'normál', 'önköltséges', 'Bogdon', 'Rachel', NULL),
       ('y1JgOg', '234 Stephanie Spring Apt. 424 East Lorimouth, WV 68057', 'normál', 'állami', 'Hawkins', 'Tara',
        NULL),
       ('y1X672', '0601 Flores Row Zhangbury, GA 27731', 'levelező', 'önköltséges', 'Call', 'Christi', NULL),
       ('yVPspe', '6339 Carmen Inlet Christopherport, TN 67140', 'normál', 'önköltséges', 'Trim', 'Faye', NULL),
       ('ywdXjK', '16388 Faith Locks Apt. 260 North Angela, TX 06601', 'normál', 'állami', 'Brooks', 'Sheila', NULL),
       ('ZecQQT', '1869 Love Turnpike East Kimshire, MT 78645', 'normál', 'önköltséges', 'Aguilar', 'Gail', 'Dr.'),
       ('ZjGhvZ', '613 Carrillo Prairie Shorttown, KS 33106', 'normál', 'önköltséges', 'Burks', 'Charles', 'Dr.'),
       ('zn2YC4', '335 Jessica Meadow South Georgemouth, MA 47973', 'normál', 'állami', 'Sprinkle', 'Rita', NULL),
       ('Znp8fJ', '15243 Nathan Mills Apt. 742 Danielleville, HI 68441', 'normál', 'állami', 'Martinez', 'Patricia',
        NULL),
       ('zrcQwW', '26053 Pratt Land North Kathy, KY 56489', 'normál', 'állami', 'Graves', 'Angelina', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kurzus`
--

CREATE TABLE `kurzus`
(
    `kurzus_id`       varchar(6) COLLATE utf8_hungarian_ci NOT NULL,
    `kreditszam`      int(10) UNSIGNED DEFAULT NULL,
    `maximum_letszam` int(10) UNSIGNED DEFAULT NULL,
    `letszam`         int(10) UNSIGNED DEFAULT NULL,
    `teremszam`       varchar(6) COLLATE utf8_hungarian_ci NOT NULL,
    `targykod`        varchar(6) COLLATE utf8_hungarian_ci NOT NULL,
    `oktato_etr_id`   varchar(6) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_hungarian_ci;

--
-- Dumping data for table `kurzus`
--

INSERT INTO `kurzus` (`kurzus_id`, `kreditszam`, `maximum_letszam`, `letszam`, `teremszam`, `targykod`, `oktato_etr_id`)
VALUES ('0HS4Vs', 1, 30, 185, 'd4XzbS', 'ihmDHc', 'Ra0Qs8'),
       ('0N6ni8', 1, 158, 228, 'ioVtgC', 'hVxBVa', 'lcTssb'),
       ('0t1wKQ', 1, 34, 139, 'GeruVR', 'vkLKgC', '3lJEqa'),
       ('107oVP', 1, 64, 108, 'RNLPWP', 'JKoKO0', 'H2s9nn'),
       ('1lCrvz', 2, 36, 220, 'ZHtl35', 'pbq5MZ', '3eKWJf'),
       ('3VlWDu', 2, 201, 330, 'LMJNYn', '9OTa6X', 'OaEpdo'),
       ('5G6rns', 2, 69, 303, 'GMnKpn', 'ZydtLp', 'PDwUL2'),
       ('6Lk2aY', 3, 58, 117, 'wo16YI', 'tipMGw', 'w9lQ3g'),
       ('80X2S6', 2, 131, 151, 'yoUgas', '1LB6CF', 'EfKrF8'),
       ('8lnw1P', 1, 77, 105, 'ZIa7yA', 'PHMVjC', '16kHgB'),
       ('ajVwTW', 2, 30, 133, 'WziTGl', 'mXKyyH', 'q9p1vT'),
       ('b7day2', 1, 107, 196, 'mm1oJv', 'Uyu6ge', '29h3uO'),
       ('EBRy2S', 1, 29, 35, 'ZalAPG', 'QzN9Hi', 'BgboxV'),
       ('FkgATI', 1, 233, 253, 'Px6u8M', 'lsADy6', 'iHmv6N'),
       ('gWnkLS', 3, 20, 145, 'kmUyPT', 'eHVMRu', 'r3D8bA'),
       ('HJMLoV', 3, 62, 88, 'DXqFCl', 'WEOc86', '9pkup7'),
       ('HSFtVD', 1, 76, 113, 'KilOkU', 'US6oaf', 'AITvsZ'),
       ('i6SR2I', 1, 35, 38, 'IuOabs', 'aKRvTL', 'ODPqqv'),
       ('JCew1X', 2, 46, 121, 'maauVt', 'Ytq0Z1', 'OYD8h0'),
       ('kgMITY', 1, 222, 322, 'QdqNXK', 'GOHCeP', 'tevJhB'),
       ('knOPpt', 3, 25, 242, 'edrmhP', '7gXbY1', 'h4DU4L'),
       ('kO7iv1', 1, 161, 170, 'GxJIwV', 'r0ThTx', 'tHV3L5'),
       ('KU7DwF', 1, 250, 315, 'UTkfGW', 'DNOenP', 'JbCICN'),
       ('kUAMF6', 1, 61, 92, 'c9HS6p', 'VTAFGD', '844RDt'),
       ('mTgh0i', 1, 22, 112, 'QXH2Oe', '4YPSBr', 'POoBTp'),
       ('n96hhw', 4, 28, 73, 'WyywQf', '4PR05s', 'jYpY2Q'),
       ('nf6kbw', 3, 49, 58, '1MaLZ1', 'ZDfvni', '5XNMyA'),
       ('NV8DNE', 1, 97, 100, '2m6DBN', 'WGkTs3', 'ZpJHqw'),
       ('OSwIA8', 1, 280, 333, '1DwHv6', 'dzCa3R', 'ZmOWvv'),
       ('p18RL6', 1, 36, 286, '7b6xE6', 'm6bZ6H', 'HpYUmL'),
       ('PoF9Hz', 2, 74, 218, 'IXMeva', 'UkyLEq', 'orqgmP'),
       ('q4eLsA', 1, 150, 221, 'nq3j2h', '4BKEby', 'cp0Js2'),
       ('Qfj7LX', 4, 63, 117, 'fDYupA', 'ZeyrBI', 'wTgpnC'),
       ('quVEUo', 3, 59, 167, '1AZ5O9', 'NkdcIV', 'cW8xQT'),
       ('sM0uzH', 2, 44, 225, 'JoGnaw', 'Mn3PGX', '4ihqvh'),
       ('sr4buG', 2, 32, 249, 'V06SV9', 'pAWABW', 'VX3YuG'),
       ('ub4XxW', 1, 31, 167, 'HlLINw', 'WRXPRY', 'rsAD31'),
       ('VKz1XZ', 4, 23, 157, 'D7EobO', 'eJ2gYT', 'YSS4B9'),
       ('vnCuYn', 1, 157, 197, 'qo1Kgc', 'YO2ecX', 'MGKO8S'),
       ('Vqxrey', 4, 178, 195, 'CK2Xz0', 'PQ08YI', 'WYlkta'),
       ('WOTx6z', 1, 38, 47, 'HJebNv', 'zTeah2', 'YNkVrj'),
       ('WtvFHA', 1, 48, 124, 'F2owkT', 'P0LY7v', 'pY7WxD'),
       ('Y6b3fI', 3, 267, 285, 'ibihUI', '0JBkDT', 'WF6b1I'),
       ('ygALBl', 3, 52, 59, 'o0tY5E', 'R1nVkp', 'DZl0lK'),
       ('yqlEXL', 1, 120, 176, 'm3SX4j', 'DuiPUk', '57CeHO'),
       ('yqY8ZO', 1, 80, 205, '2A0IqS', 'AAOgzY', '36XIbx'),
       ('YWhMwk', 1, 44, 54, 'UU0Hak', 'G6gcvp', 'BScOSk'),
       ('ZFxJYr', 2, 101, 122, '380joW', 'h66Sdm', '2Oup3M'),
       ('zX9zPL', 3, 21, 160, 'NED4LA', 'rUwh5L', 'jzfOfp'),
       ('ZYeaw0', 2, 191, 192, 'ML4N11', 'heEWuJ', 'VtljXN');

-- --------------------------------------------------------

--
-- Table structure for table `leadas`
--

CREATE TABLE `leadas`
(
    `etr_id`    varchar(6) COLLATE utf8_hungarian_ci NOT NULL,
    `kurzus_id` varchar(6) COLLATE utf8_hungarian_ci NOT NULL,
  `idopont` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oktato`
--

CREATE TABLE `oktato`
(
    `oktato_etr_id` varchar(6) COLLATE utf8_hungarian_ci  NOT NULL,
    `vezeteknev`    varchar(30) COLLATE utf8_hungarian_ci NOT NULL,
    `keresztnev`    varchar(30) COLLATE utf8_hungarian_ci NOT NULL,
    `titulus`       varchar(5) COLLATE utf8_hungarian_ci DEFAULT NULL,
    `beosztas`      varchar(20) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_hungarian_ci;

--
-- Dumping data for table `oktato`
--

INSERT INTO `oktato` (`oktato_etr_id`, `vezeteknev`, `keresztnev`, `titulus`, `beosztas`)
VALUES ('0JLNCI', 'Shaw', 'Joshua', NULL, 'gyakorlatvezető'),
       ('16kHgB', 'Holt', 'Lorraine', NULL, 'gyakorlatvezető'),
       ('1wfXNv', 'Fleagle', 'Wayne', NULL, 'előadó'),
       ('29h3uO', 'Ortega', 'Joyce', NULL, 'gyakorlatvezető'),
       ('2FJSJ5', 'Griswell', 'Alfred', NULL, 'előadó'),
       ('2iSSoW', 'Kelly', 'Modesto', 'Dr.', 'gyakorlatvezető'),
       ('2Oup3M', 'Wise', 'Pamela', NULL, 'gyakorlatvezető'),
       ('36XIbx', 'Jencks', 'Joanne', NULL, 'gyakorlatvezető'),
       ('3eKWJf', 'Scrivens', 'Albert', NULL, 'gyakorlatvezető'),
       ('3lJEqa', 'Gonzalez', 'Tricia', NULL, 'gyakorlatvezető'),
       ('4ihqvh', 'Scott', 'Marc', 'Dr.', 'gyakorlatvezető'),
       ('4RENWF', 'Mills', 'Sandra', NULL, 'gyakorlatvezető'),
       ('57CeHO', 'Johnson', 'Claire', NULL, 'gyakorlatvezető'),
       ('5wySPa', 'Saville', 'Ian', NULL, 'gyakorlatvezető'),
       ('5XNMyA', 'Munari', 'Kelly', NULL, 'gyakorlatvezető'),
       ('6iiZX9', 'Warren', 'Paula', 'Dr.', 'gyakorlatvezető'),
       ('7Djdqi', 'Thurlow', 'Gordon', NULL, 'gyakorlatvezető'),
       ('844RDt', 'Alexander', 'Kenneth', NULL, 'gyakorlatvezető'),
       ('9pkup7', 'Wheeler', 'Vincent', NULL, 'gyakorlatvezető'),
       ('a9BBH3', 'Kelley', 'Geraldine', NULL, 'gyakorlatvezető'),
       ('AITvsZ', 'Walter', 'Kathy', 'Dr.', 'előadó'),
       ('BgboxV', 'Higgins', 'Mark', NULL, 'gyakorlatvezető'),
       ('BScOSk', 'Davis', 'Janetta', NULL, 'gyakorlatvezető'),
       ('CBnxz0', 'Bourdon', 'Scott', 'Dr.', 'gyakorlatvezető'),
       ('cp0Js2', 'Mapp', 'William', NULL, 'gyakorlatvezető'),
       ('Cw830V', 'Kellstrom', 'Orval', NULL, 'gyakorlatvezető'),
       ('cW8xQT', 'Oswald', 'Bonnie', NULL, 'gyakorlatvezető'),
       ('d7aCQi', 'Scholl', 'Brandi', NULL, 'gyakorlatvezető'),
       ('De6T6K', 'Herman', 'Teresa', 'Dr.', 'gyakorlatvezető'),
       ('DIhyra', 'Young', 'Alex', NULL, 'gyakorlatvezető'),
       ('DJPkjJ', 'Mcguire', 'Wade', 'Dr.', 'előadó'),
       ('DZl0lK', 'Noble', 'Lisbeth', NULL, 'gyakorlatvezető'),
       ('EfKrF8', 'Cooper', 'Martha', 'Dr.', 'előadó'),
       ('FI0Qch', 'Lambrecht', 'Walter', 'Dr.', 'gyakorlatvezető'),
       ('GFj05Z', 'Micklos', 'Louis', NULL, 'gyakorlatvezető'),
       ('gtlwWo', 'Huber', 'Ronald', NULL, 'gyakorlatvezető'),
       ('H2s9nn', 'Dammann', 'Ricardo', 'Dr.', 'gyakorlatvezető'),
       ('h4DU4L', 'Winnike', 'Josie', NULL, 'gyakorlatvezető'),
       ('H8ODvl', 'Thompson', 'Marco', NULL, 'gyakorlatvezető'),
       ('hGkT9x', 'Olivia', 'Lola', NULL, 'gyakorlatvezető'),
       ('hkJr5r', 'Perkins', 'Winter', NULL, 'gyakorlatvezető'),
       ('HpYUmL', 'Collins', 'Reed', NULL, 'előadó'),
       ('hqA459', 'Mccoy', 'Julia', 'Dr.', 'gyakorlatvezető'),
       ('iHmv6N', 'Ortiz', 'Michael', NULL, 'gyakorlatvezető'),
       ('ikBDTL', 'Temple', 'Digna', 'Dr.', 'gyakorlatvezető'),
       ('JbCICN', 'Geoghegan', 'Michael', NULL, 'előadó'),
       ('JY0sm0', 'Williams', 'Katie', 'Dr.', 'gyakorlatvezető'),
       ('jYpY2Q', 'Knepp', 'Craig', NULL, 'gyakorlatvezető'),
       ('jzfOfp', 'Smith', 'Ray', NULL, 'gyakorlatvezető'),
       ('LCElQt', 'Beatty', 'Shawna', NULL, 'gyakorlatvezető'),
       ('lcTssb', 'Boswell', 'Dorothy', NULL, 'gyakorlatvezető'),
       ('M5syqO', 'Mathews', 'Adam', NULL, 'előadó'),
       ('MGKO8S', 'Sisto', 'Edward', 'Dr.', 'gyakorlatvezető'),
       ('n0rYCh', 'Eddy', 'Oscar', NULL, 'gyakorlatvezető'),
       ('n5gDxO', 'Petitti', 'Guy', NULL, 'gyakorlatvezető'),
       ('nNBY87', 'Bowles', 'Herbert', NULL, 'gyakorlatvezető'),
       ('NYpVQz', 'Gallian', 'Edgar', 'Dr.', 'gyakorlatvezető'),
       ('o7LB2p', 'Moyer', 'John', NULL, 'gyakorlatvezető'),
       ('OaEpdo', 'Thompson', 'Thomas', NULL, 'gyakorlatvezető'),
       ('ODPqqv', 'Morton', 'Rachelle', NULL, 'gyakorlatvezető'),
       ('orqgmP', 'White', 'Ramona', NULL, 'előadó'),
       ('OYD8h0', 'Morris', 'Marjorie', NULL, 'gyakorlatvezető'),
       ('P3cDhy', 'Larson', 'Wanda', NULL, 'gyakorlatvezető'),
       ('PDwUL2', 'Bunn', 'Darryl', NULL, 'gyakorlatvezető'),
       ('PHEec8', 'Bechtol', 'Sherry', 'Dr.', 'gyakorlatvezető'),
       ('POoBTp', 'May', 'David', NULL, 'gyakorlatvezető'),
       ('pY7WxD', 'Fisher', 'Gregory', NULL, 'gyakorlatvezető'),
       ('q9p1vT', 'Horn', 'Evelyn', NULL, 'gyakorlatvezető'),
       ('QcZJ4Q', 'Swartz', 'William', 'Dr.', 'gyakorlatvezető'),
       ('r3D8bA', 'Bain', 'Gene', NULL, 'gyakorlatvezető'),
       ('R3MdDY', 'Froehlich', 'Emerson', NULL, 'gyakorlatvezető'),
       ('R3oXXX', 'Russo', 'Margaret', 'Dr.', 'gyakorlatvezető'),
       ('Ra0Qs8', 'Miller', 'Arthur', NULL, 'előadó'),
       ('riBTz0', 'Aguiniga', 'Lois', NULL, 'gyakorlatvezető'),
       ('rsAD31', 'Aivao', 'Jerry', NULL, 'gyakorlatvezető'),
       ('rZgG19', 'Cornish', 'Joan', NULL, 'gyakorlatvezető'),
       ('s8RmLm', 'Venema', 'Sheldon', NULL, 'előadó'),
       ('sFqEuH', 'Collison', 'Mitchell', NULL, 'gyakorlatvezető'),
       ('smXJ2o', 'Gonzales', 'Joyce', NULL, 'gyakorlatvezető'),
       ('srC4OS', 'Hangartner', 'Demetrius', NULL, 'gyakorlatvezető'),
       ('sXs9i4', 'Horton', 'Vance', NULL, 'előadó'),
       ('tevJhB', 'Burch', 'Robert', NULL, 'gyakorlatvezető'),
       ('tHV3L5', 'Reyes', 'David', NULL, 'gyakorlatvezető'),
       ('Ua3eKJ', 'Holloway', 'Nicholas', NULL, 'gyakorlatvezető'),
       ('V5IhSf', 'Brown', 'Terence', 'Dr.', 'gyakorlatvezető'),
       ('VIA7y1', 'Powell', 'Cindy', 'Dr.', 'gyakorlatvezető'),
       ('VtljXN', 'Reid', 'Bruce', NULL, 'előadó'),
       ('VX3YuG', 'Byars', 'Derek', NULL, 'gyakorlatvezető'),
       ('w9lQ3g', 'Giampietro', 'Debra', NULL, 'előadó'),
       ('wds2Rx', 'Connors', 'Chanel', NULL, 'gyakorlatvezető'),
       ('WF6b1I', 'Fitzgerald', 'Michael', NULL, 'gyakorlatvezető'),
       ('wTgpnC', 'Pitchford', 'Jerome', NULL, 'gyakorlatvezető'),
       ('WYlkta', 'Tebow', 'Sue', NULL, 'előadó'),
       ('xllyaf', 'Scherzer', 'Martin', 'Dr.', 'gyakorlatvezető'),
       ('XRYceE', 'Miller', 'Myrna', 'Dr.', 'gyakorlatvezető'),
       ('YNkVrj', 'Ivory', 'Gloria', NULL, 'gyakorlatvezető'),
       ('YSS4B9', 'Gottfried', 'Leticia', NULL, 'gyakorlatvezető'),
       ('Z3rwAD', 'Lybert', 'Rhonda', NULL, 'gyakorlatvezető'),
       ('ZmOWvv', 'Gaskin', 'Vivien', NULL, 'gyakorlatvezető'),
       ('ZpJHqw', 'Plourde', 'Elizabeth', NULL, 'gyakorlatvezető');

-- --------------------------------------------------------

--
-- Table structure for table `targy`
--

CREATE TABLE `targy`
(
    `targykod`       varchar(6) COLLATE utf8_hungarian_ci NOT NULL,
    `ajanlott_felev` int(10) UNSIGNED                      DEFAULT NULL,
    `nev`            varchar(30) COLLATE utf8_hungarian_ci DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_hungarian_ci;

--
-- Dumping data for table `targy`
--

INSERT INTO `targy` (`targykod`, `ajanlott_felev`, `nev`)
VALUES ('0JBkDT', 1, 'FqF1zt5Xp0'),
       ('1LB6CF', 1, 'qdm2dHErvu'),
       ('1suw5r', 1, 'GjeQI9wc4g'),
       ('44EDqS', 1, 'OZ8xDi8vES'),
       ('4BKEby', 3, 'PHlwiL0tq0'),
       ('4POtGC', 2, 'tq0HreDXsK'),
       ('4PR05s', 1, 'X6OHa3GNdk'),
       ('4YPSBr', 2, '851fazDc3K'),
       ('6wMLvV', 6, 'bTeEzoTPjG'),
       ('7gXbY1', 2, 'HnpdqEUrh7'),
       ('7NEwDK', 6, 'KvYJlaTGei'),
       ('85o3cO', 2, '78sUxRVNIn'),
       ('8EYGvH', 1, 's9FDxXYDqI'),
       ('8GE0hK', 1, 'aJHkCO58nJ'),
       ('9jdvbG', 1, '9tvlLj7U3f'),
       ('9OTa6X', 1, 'kWpxSqyisP'),
       ('AAOgzY', 1, 'rG0jdEvJQR'),
       ('aKRvTL', 2, 'XUi0YtfsMh'),
       ('aRzNM2', 4, 'fPwowiNiJA'),
       ('bDtk17', 4, 'ptG6Dwg4Mf'),
       ('DNOenP', 3, 'uVj0ku8Wn1'),
       ('DuiPUk', 3, 'pvYOBsnwDl'),
       ('DWAfP3', 2, 'X3nXc9fb4Z'),
       ('dzCa3R', 3, 'dg5Jk70kYN'),
       ('e8hfQp', 2, 'lHLAU8KP1F'),
       ('EEbEWy', 3, 'raiZeqHe18'),
       ('eHVMRu', 1, 'oXPR6kHj49'),
       ('eJ2gYT', 4, 'YSNXTtpfFr'),
       ('f4XGRF', 2, 'Ej56etwqYt'),
       ('FdkH6b', 3, 'NeAQAL3QIy'),
       ('fGSqre', 6, 'AszQUH4Ule'),
       ('FJPQbB', 2, 'XV27H3EQIU'),
       ('G6gcvp', 6, 'CNXLHvuhah'),
       ('GOHCeP', 5, 'g1QMAH5a3Q'),
       ('GQ20nS', 1, 'LrVY91tzhF'),
       ('h66Sdm', 3, 'jOl4h7zPBe'),
       ('H7DAFU', 2, 'tRJrBXzhIK'),
       ('heEWuJ', 3, 'P8oI9f30OU'),
       ('HOF9MM', 1, 'ONWZH4qCte'),
       ('HSzfp3', 4, 'p2ReqKuQef'),
       ('hVxBVa', 1, 'kKaaii3ELf'),
       ('ihmDHc', 5, 'YVQEZ08ePE'),
       ('iNIa25', 1, 'l7RXod207d'),
       ('JKoKO0', 3, 'Fu9UFmy2rJ'),
       ('jOaVyU', 5, 'Omj1Ffh6zc'),
       ('JYbAAT', 1, 'r1kLZbudbg'),
       ('kdDKst', 3, 'ge1Njoti0u'),
       ('Kht7Uk', 4, 'QQAvehxEYN'),
       ('KzrjOg', 1, 'jlLXaqA1tU'),
       ('liMFV9', 2, 'wjf5SQilQU'),
       ('lsADy6', 3, 'wfFXtOBv5p'),
       ('m6bZ6H', 3, 'qtnkzdEIvE'),
       ('MgZ1FF', 1, 'VnRHnYZYr3'),
       ('Mn3PGX', 2, '80pV7S2hKi'),
       ('mXKyyH', 1, 'a0OkQgaBDR'),
       ('NkdcIV', 2, 'CfaOKgBysv'),
       ('NVEu9h', 2, 'za58bhrJos'),
       ('OT62WW', 2, 'RZbtpzrwyR'),
       ('P0LY7v', 2, '8rEFZ8mXRM'),
       ('p1iFjk', 2, 'Vk8UhI9F4I'),
       ('pAWABW', 5, '9SQEJcvY9L'),
       ('pbq5MZ', 1, '9K5zNf614C'),
       ('PBTQRO', 2, 'dhhadeSSIu'),
       ('PHMVjC', 2, '4NqEnnuOC9'),
       ('PkHrTx', 7, '0JQummkE97'),
       ('PQ08YI', 5, 'Zux7kimWYU'),
       ('PsSMvV', 5, 'KadJTfzJsd'),
       ('QzN9Hi', 1, 'vyweyUvFCG'),
       ('r0ThTx', 2, '7UBcuJhGYx'),
       ('R1nVkp', 2, 'cFYULqNk9K'),
       ('rUwh5L', 1, '5e7RjtrG0H'),
       ('Sr26uN', 1, 'yZV4rQuzlZ'),
       ('stKp9i', 3, 'nl8aVyi0C9'),
       ('szIBJz', 1, 'G0pToc1liZ'),
       ('tipMGw', 3, 'yGgx6aILIR'),
       ('Tt6gUg', 5, 'w3piPvLtB3'),
       ('UkyLEq', 1, 'cTlYDjiyVo'),
       ('UMnEk3', 4, 'TAxERwTUjx'),
       ('UnbyJZ', 1, 'tjCBpfpoyp'),
       ('US6oaf', 4, 'IKfogcADMA'),
       ('Uyu6ge', 1, 'oVWiI6Fisl'),
       ('V4uAXw', 2, 'HSmngmvRl1'),
       ('vkLKgC', 3, 'V8RSw3rvPi'),
       ('vpIN0B', 1, 'iUBvgeFftR'),
       ('VTAFGD', 1, 'fwP9UTGypa'),
       ('W3WUiE', 5, 'MXNQOfNuaB'),
       ('WEOc86', 4, 'veFZVQOjsI'),
       ('WGkTs3', 1, 'Z9RXgzPMZq'),
       ('WRXPRY', 1, 'xTV13KhjtX'),
       ('xfw7fw', 2, 'fjaKZsKA61'),
       ('XzMGZZ', 1, 'drjYP69OSg'),
       ('YO2ecX', 3, 'NfYAzW3HgB'),
       ('Ytq0Z1', 1, 'EOo6vPRN8G'),
       ('ZDfvni', 2, 'ikdPEi7OgZ'),
       ('zdTbRg', 1, 'lOzFfn9OKU'),
       ('ZeyrBI', 1, 'm6NfDAOqtr'),
       ('zkxcAK', 3, 'SYB7li6fgH'),
       ('ZN7esJ', 4, 'FwZvaHLIZa'),
       ('zTeah2', 1, 'mQlFrEhtoo'),
       ('ZydtLp', 1, 'uGEkWVwRw5');

-- --------------------------------------------------------

--
-- Table structure for table `terem`
--

CREATE TABLE `terem`
(
    `teremszam` varchar(6) COLLATE utf8_hungarian_ci NOT NULL,
    `ferohely`  int(10) UNSIGNED                       DEFAULT NULL,
    `cim`       varchar(100) COLLATE utf8_hungarian_ci DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_hungarian_ci;

--
-- Dumping data for table `terem`
--

INSERT INTO `terem` (`teremszam`, `ferohely`, `cim`)
VALUES ('0gi9kT', 21, '10243 Griffin Union Suite 518 Port Brittany, NJ 97257'),
       ('1AZ5O9', 206, '274 Gomez Lodge Suite 736 New Charlesmouth, KS 10165'),
       ('1DwHv6', 80, '254 David Crossroad Suite 989 East Breannafurt, VA 66610'),
       ('1MaLZ1', 136, '6873 Erica Turnpike Juantown, AK 61431'),
       ('1ToQso', 186, '47178 Brenda Cliffs Lake Jacquelinetown, VT 73245'),
       ('2A0IqS', 24, '11023 Mcgee Stravenue Apt. 618 Curtisbury, AL 82729'),
       ('2m6DBN', 186, '023 Sharon Mountain Apt. 958 Bryantview, IL 09030'),
       ('2MT4Tt', 10, '57043 Jennifer Circles Amyshire, CO 16728'),
       ('2wmqb4', 307, '2527 Karen Station Suite 417 East Larryburgh, IN 92966'),
       ('380joW', 17, 'Unit 6365 Box 4215 DPO AE 56524'),
       ('6PvzFH', 11, '30288 Wallace Stravenue South Robertberg, RI 45091'),
       ('7b6xE6', 59, 'Unit 2910 Box 4159 DPO AE 47125'),
       ('7ZRtU1', 45, '5598 Craig Village Suite 996 North Eugeneberg, PA 77337'),
       ('9hPg5W', 13, '256 Jennifer Ports Apt. 723 Grimesborough, IA 17018'),
       ('9oKqkD', 79, 'PSC 2438, Box 0878 APO AA 81411'),
       ('9UIETR', 129, '012 Alan Shoal Apt. 035 East Dominicborough, IL 76414'),
       ('AZ29GD', 36, '6999 Garcia Glens Suite 682 Alexismouth, MN 03332'),
       ('bj2WyG', 33, '726 Harris Lodge West Ronniefurt, DE 73098'),
       ('C7dcbw', 72, 'USNV Lee FPO AP 48848'),
       ('c9HS6p', 12, '0109 Taylor Plaza Suite 681 Lindsaymouth, NV 90650'),
       ('CK2Xz0', 264, '3103 Young Knolls Suite 611 Dayport, IL 50842'),
       ('d4XzbS', 50, '111 Marsh Mission Robinsonport, AK 61122'),
       ('D7EobO', 19, 'Unit 5332 Box 4450 DPO AP 39018'),
       ('dF9URy', 17, 'PSC 0239, Box 1624 APO AA 13384'),
       ('DXqFCl', 22, '026 Eric Club Greenberg, AR 74747'),
       ('edrmhP', 170, '68682 Wright Mountains Richardchester, MD 41966'),
       ('ewm1iP', 338, '914 Darlene Shores North Mariabury, AR 08049'),
       ('F2owkT', 220, '69401 Garcia Points North Shannonhaven, VT 28491'),
       ('fDYupA', 93, '787 Kennedy Points Apt. 445 Sarahside, SD 22306'),
       ('fnc5BB', 62, 'USNV Fuller FPO AP 87025'),
       ('GeruVR', 203, '2910 Christensen Lane Tiffanyfurt, DC 75058'),
       ('GMnKpn', 35, '284 Murphy Stream Wileyton, VA 06741'),
       ('GxJIwV', 21, '48590 Vincent Corner Suite 837 Beckerbury, KY 68613'),
       ('gzmkaK', 202, '02174 Carter Causeway Georgechester, MA 49077'),
       ('H9yWiH', 142, '179 David Expressway Lake Nicoletown, ND 58481'),
       ('HJebNv', 97, '6073 John Mount Apt. 465 East Deniseberg, IL 25765'),
       ('HlLINw', 113, '79895 Thomas Dale Apt. 492 Sellersshire, OR 96660'),
       ('ibihUI', 297, '964 Diaz Gardens East Julie, WA 40706'),
       ('ioVtgC', 96, '0070 Alexander Views Apt. 308 Matthewtown, TN 77839'),
       ('IuOabs', 12, '7581 Katie Points Suite 366 Hughesfurt, AL 94205'),
       ('iw0PlH', 24, '48558 Kathryn Glens South Dustinberg, SD 80483'),
       ('IXMeva', 142, '290 Tiffany Place New Ryan, RI 10553'),
       ('JaAf7N', 16, '83187 Spence Throughway Apt. 145 Johnstonmouth, OH 79424'),
       ('JoGnaw', 14, '5262 Sylvia Via Suite 358 South John, MT 45470'),
       ('JrDSfQ', 195, 'PSC 1878, Box 1725 APO AE 48698'),
       ('k553w3', 315, '897 Alexis Stravenue Apt. 627 Williamston, NJ 77174'),
       ('KilOkU', 78, '30580 Rita Neck East Laura, AZ 94255'),
       ('kmUyPT', 333, '45441 Smith Wall New Stephanie, AL 21835'),
       ('KSuDjM', 174, '29306 Cline Loop Owensview, TN 02152'),
       ('LMJNYn', 250, '861 Monroe Pike Apt. 403 North Allison, PA 69837'),
       ('lZeoTN', 99, '59514 Gilmore Common New Edward, VA 36149'),
       ('m2YUzg', 32, '21441 Patton Station West Janet, DE 56657'),
       ('m3SX4j', 67, '3407 Rojas Mount North Christophershire, AZ 95641'),
       ('maauVt', 138, '04864 Arnold Vista Suite 155 East Monicatown, LA 86089'),
       ('Mic56e', 129, '63922 Casey Turnpike Suite 141 Lopezville, IA 21356'),
       ('ML4N11', 21, '68175 Michael Inlet Apt. 467 Mitchellborough, CA 01431'),
       ('mm1oJv', 51, '863 Jennifer Island Richardview, WV 28477'),
       ('NED4LA', 115, '1162 Jimenez Brook Apt. 611 Lake Michelle, OR 06695'),
       ('nIo2Jg', 35, '472 King Valleys Port Laurieland, TN 97248'),
       ('nq3j2h', 115, '215 Barry Knolls Duncanstad, CO 58104'),
       ('Nr0Q7D', 213, 'Unit 5051 Box 5410 DPO AA 11781'),
       ('o0tY5E', 27, '046 Diana Square Johnport, LA 64723'),
       ('p6jbvS', 11, '6273 Vaughn Greens Suite 853 New Carol, CA 32229'),
       ('p6P073', 97, '3849 Robinson Port Apt. 100 Keithstad, KY 34103'),
       ('Px6u8M', 316, '19316 Jennifer Throughway Butlerville, PA 03658'),
       ('QAxEia', 304, '0962 Parker Village Timothyburgh, AL 00868'),
       ('qCdU5w', 294, '40270 Simmons Squares Suite 962 West Amber, NJ 92859'),
       ('QdqNXK', 161, '864 Smith Path Suite 068 Carrollfort, OK 09134'),
       ('qEri7F', 31, 'USS Adkins FPO AA 45888'),
       ('qo1Kgc', 191, '8082 Barker Forges East Richardshire, AZ 94984'),
       ('QXH2Oe', 103, '10487 James Square Bellville, AK 96019'),
       ('R1xcZz', 169, '8228 Jillian Garden Suite 457 Aprilfurt, NM 67679'),
       ('RNLPWP', 147, '24375 Robert Hill Apt. 232 Wisemouth, MA 85018'),
       ('Rv4Sty', 55, '45994 Rhonda Camp Port Jill, NM 12416'),
       ('RZWX7d', 43, '865 Garrett Vista Rodrigueztown, MO 68990'),
       ('sGP68V', 13, '3753 Pearson Highway Martinezchester, NY 23692'),
       ('tE1yL6', 51, '2168 Joel Isle Cherylton, NY 13657'),
       ('TFi9q4', 94, '386 Johns Circle New Madelineton, OK 30933'),
       ('TNzBlN', 69, '429 Christian Ports Stephensonport, ID 53709'),
       ('uCIE8u', 65, '3313 Conrad Extension Walkerview, IL 24985'),
       ('UTkfGW', 88, '61119 Julian Park New Jimmychester, IN 06626'),
       ('UU0Hak', 297, '2181 Austin Court Olsonmouth, DE 67738'),
       ('uWea3h', 151, '4072 Cabrera Burgs East Jessicaville, WI 11420'),
       ('V06SV9', 17, '757 Johnson Garden Jessicamouth, AZ 07647'),
       ('vs2NPD', 106, '4937 Eric Knoll Cindyburgh, OK 79458'),
       ('vshStV', 15, '6545 Jacobs Pass South Amy, MA 95395'),
       ('wo16YI', 41, '98523 Patricia Well Barrview, MO 60286'),
       ('WyywQf', 227, '5133 Perez Lane Apt. 405 West Teresahaven, TX 17757'),
       ('WziTGl', 78, '0260 Flores Street New Dannyview, GA 56301'),
       ('XPzUub', 346, '427 Jason Islands Brendabury, MO 67471'),
       ('YcXgNU', 49, '00511 Daisy Inlet New Monicaberg, IL 18989'),
       ('yjeK5H', 194, '06112 Cross Highway Suite 093 North Dennis, LA 63220'),
       ('YMai4K', 23, '6510 Debra Prairie East Karenburgh, NY 83435'),
       ('yoUgas', 57, '119 Todd Canyon Apt. 207 Stevenville, OH 88425'),
       ('ZalAPG', 200, '32748 Evans Keys North Christopherview, SC 59607'),
       ('ZGMB3g', 250, 'Unit 1014 Box 0402 DPO AA 99702'),
       ('ZHtl35', 126, '34680 Jason Islands South Aprilberg, CO 85534'),
       ('ZIa7yA', 11, '60237 Wall Extension East Tiffanyshire, MA 18094'),
       ('zXrLd9', 65, '20466 Swanson Overpass North Kennethbury, RI 26281'),
       ('zyYvHJ', 73, '59856 Elizabeth Circles Suite 312 Herbertmouth, NC 92458');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `felvetel`
--
ALTER TABLE `felvetel`
    ADD PRIMARY KEY (`etr_id`, `kurzus_id`),
  ADD UNIQUE KEY `etr_id` (`etr_id`,`kurzus_id`),
  ADD KEY `felvett_kurzus` (`kurzus_id`);

--
-- Indexes for table `gepterem`
--
ALTER TABLE `gepterem`
  ADD PRIMARY KEY (`teremszam`);

--
-- Indexes for table `hallgato`
--
ALTER TABLE `hallgato`
  ADD PRIMARY KEY (`hallgato_etr_id`);

--
-- Indexes for table `kurzus`
--
ALTER TABLE `kurzus`
  ADD PRIMARY KEY (`kurzus_id`),
  ADD KEY `tanitja` (`oktato_etr_id`),
  ADD KEY `kurzusa` (`targykod`),
  ADD KEY `helyszine` (`teremszam`);

--
-- Indexes for table `leadas`
--
ALTER TABLE `leadas`
  ADD PRIMARY KEY (`etr_id`,`kurzus_id`),
  ADD UNIQUE KEY `etr_id` (`etr_id`,`kurzus_id`),
  ADD KEY `leadott_kurzus` (`kurzus_id`);

--
-- Indexes for table `oktato`
--
ALTER TABLE `oktato`
  ADD PRIMARY KEY (`oktato_etr_id`);

--
-- Indexes for table `targy`
--
ALTER TABLE `targy`
  ADD PRIMARY KEY (`targykod`);

--
-- Indexes for table `terem`
--
ALTER TABLE `terem`
  ADD PRIMARY KEY (`teremszam`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `felvetel`
--
ALTER TABLE `felvetel`
  ADD CONSTRAINT `felvett_kurzus` FOREIGN KEY (`kurzus_id`) REFERENCES `kurzus` (`kurzus_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `felvevo_hallgato` FOREIGN KEY (`etr_id`) REFERENCES `hallgato` (`hallgato_etr_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `gepterem`
--
ALTER TABLE `gepterem`
  ADD CONSTRAINT `parent` FOREIGN KEY (`teremszam`) REFERENCES `terem` (`teremszam`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kurzus`
--
ALTER TABLE `kurzus`
  ADD CONSTRAINT `helyszine` FOREIGN KEY (`teremszam`) REFERENCES `terem` (`teremszam`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kurzusa` FOREIGN KEY (`targykod`) REFERENCES `targy` (`targykod`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tanitja` FOREIGN KEY (`oktato_etr_id`) REFERENCES `oktato` (`oktato_etr_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `leadas`
--
ALTER TABLE `leadas`
  ADD CONSTRAINT `leado_hallgato` FOREIGN KEY (`etr_id`) REFERENCES `hallgato` (`hallgato_etr_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `leadott_kurzus` FOREIGN KEY (`kurzus_id`) REFERENCES `kurzus` (`kurzus_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
