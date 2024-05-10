-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: d129441.mysql.zonevs.eu
-- Loomise aeg: Aprill 30, 2024 kell 05:49 PL
-- Serveri versioon: 10.6.17-MariaDB-log
-- PHP versioon: 8.2.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Andmebaas: `d129441sd557155`
--

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `content` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Andmete tõmmistamine tabelile `contact`
--

INSERT INTO `contact` (`id`, `title`, `content`) VALUES
(0, 'Tutvustus', 'Minu nimi on Galina. Pakun raamatupidamisteenuseid mikro- ja väikeettevõtetele. Professionaalne, usaldusväärne ja kliendikeskne raamatupidamine aitab teie ettevõttel jälgida finantsolukorda ja seekaudu teha teadlike äriotsuseid, mis aitavad tagada ettevõtte majandusliku jätkusuutlikkuse. Olen pühendunud oma iga kliendi edule ning usun, et professionaalne lähenemine ja individuaalne teenindus aitavad minu koostööpartneritel keskenduda oma äritegevuse olulistele aspektidele ning saavutada pikaajaline edu ja kasv.\\n\\nOlen finantsarvestuse valdkonnas töötanud 28 aastat. Oman Tallinna Tehnikakõrgkooli kõrgharidust majandusarvestuse alal ning raamatupidaja tase 5 kutsetunnistust. Suhtlen teiega eesti ja vene keeles.');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `contactadmin`
--

CREATE TABLE `contactadmin` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `content` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Andmete tõmmistamine tabelile `contactadmin`
--

INSERT INTO `contactadmin` (`id`, `title`, `content`) VALUES
(0, 'Tutvustus', 'Minu nimi on Galina. Pakun raamatupidamisteenuseid mikro- ja väikeettevõtetele. Professionaalne, usaldusväärne ja kliendikeskne raamatupidamine aitab teie ettevõttel jälgida finantsolukorda ja seekaudu teha teadlike äriotsuseid, mis aitavad tagada ettevõtte majandusliku jätkusuutlikkuse. Olen pühendunud oma iga kliendi edule ning usun, et professionaalne lähenemine ja individuaalne teenindus aitavad minu koostööpartneritel keskenduda oma äritegevuse olulistele aspektidele ning saavutada pikaajaline edu ja kasv.\\n\\nOlen finantsarvestuse valdkonnas töötanud 28 aastat. Oman Tallinna Tehnikakõrgkooli kõrgharidust majandusarvestuse alal ning raamatupidaja tase 5 kutsetunnistust. Suhtlen teiega eesti ja vene keeles.');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Andmete tõmmistamine tabelile `login`
--

INSERT INTO `login` (`id`, `email`, `password`) VALUES
(3, 'galina', '$2b$10$20p4R.wPz842G5OQ0SmuHu6FiEtEuRw7wn7bEZNulusLaQoiDf0oq');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `pricingbase`
--

CREATE TABLE `pricingbase` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `content` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Andmete tõmmistamine tabelile `pricingbase`
--

INSERT INTO `pricingbase` (`id`, `title`, `content`) VALUES
(0, '1-10', '45'),
(1, '11-20', '55'),
(2, '21-30', '65'),
(3, '31-40', '75'),
(4, '41-50', '85'),
(5, '51-60', '95'),
(6, '61-70', '105'),
(7, '71-80', '115'),
(8, '81-90', '125'),
(9, '91-100', '135'),
(10, 'al. 100', 'kokkuleppel');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `pricingbaseadmin`
--

CREATE TABLE `pricingbaseadmin` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `content` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Andmete tõmmistamine tabelile `pricingbaseadmin`
--

INSERT INTO `pricingbaseadmin` (`id`, `title`, `content`) VALUES
(0, '1-10', '45'),
(1, '11-20', '55'),
(2, '21-30', '65'),
(3, '31-40', '75'),
(4, '41-50', '85'),
(5, '51-60', '95'),
(6, '61-70', '105'),
(7, '71-80', '115'),
(8, '81-90', '125'),
(9, '91-100', '135'),
(10, 'al. 100', 'kokkuleppel');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `pricingother`
--

CREATE TABLE `pricingother` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `content` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Andmete tõmmistamine tabelile `pricingother`
--

INSERT INTO `pricingother` (`id`, `title`, `content`) VALUES
(0, 'Programmi lisakasutaja tasu kuus (kliendi võimalus sisestada müügiarveid raamatupidamise programmi)', '0 €/tk'),
(1, 'Müügiarve koostamine ja edastamine', '5 €/tk'),
(2, 'Koondarve koostamine', '10 €/tk'),
(3, 'Deklaratsiooni, INF jne esitamine Maksu- ja Tolliametile', '5 €/tk'),
(4, 'Töötaja registreerimine või kande muutmine TÖR-s', '5 €/tk'),
(5, 'Palgaarvestus töötaja kohta koos TSD esitamisega', '10 €/tk'),
(6, 'Palgaarvestus töötaja kohta koos TSD esitamisega', '7 €/tk'),
(7, 'Töövõimetuslehe esitamine Eesti Haigekassale', '5 €/tk'),
(8, 'Kuluaruande koostamine', 'al 10 €/tk'),
(9, 'Ettevõtte lisa pangakonto lisatasu', '10 €/tk'),
(10, 'Kassaorderi koostamine', '1 €/tk'),
(11, 'Lähetusaruande koostamine', '10 €/tk'),
(12, 'Dokumendi digitaliseerimine', '0.48 €/tk'),
(13, 'Maksekorralduse ettevalmistamine', '1 €/tk'),
(14, 'Pangaülekande sooritamne', '1 €/tk'),
(15, 'Töölepingu koostamine', 'al 10 €/tk'),
(16, 'Hinnapakkumise koostamine', 'al 10 €/tk'),
(17, 'Statistikaaruande koostamine', 'al 10 €/tk'),
(18, 'Kirja, tõendi jms koostamine', '7 €/tk'),
(19, 'Põhivara arvelevõtmine või eemaldamine põhivara nimekirjast', '2 €/tk'),
(20, 'Raamatupidamise aastaaruande koostamine mikroettevõttele', 'al 50 €/tk'),
(21, 'Raamatupidamise aastaaruande koostamine väikeettevõttele', 'al 100 €/tk'),
(22, 'Kasumiaruande koostamine ja väljastamine kuu lõikes', '2 €/tk'),
(23, 'Bilansi koostamine ja väljastamine kuu lõikes', '2 €/tk'),
(24, 'Eelmise perioodi korrastamine', '35 €/tund'),
(25, 'Raamatupidamise konsultatsioon', '35 €/tund');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `pricingotheradmin`
--

CREATE TABLE `pricingotheradmin` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `content` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Andmete tõmmistamine tabelile `pricingotheradmin`
--

INSERT INTO `pricingotheradmin` (`id`, `title`, `content`) VALUES
(0, 'Programmi lisakasutaja tasu kuus (kliendi võimalus sisestada müügiarveid raamatupidamise programmi)', '0 €/tk'),
(1, 'Müügiarve koostamine ja edastamine', '5 €/tk'),
(2, 'Koondarve koostamine', '10 €/tk'),
(3, 'Deklaratsiooni, INF jne esitamine Maksu- ja Tolliametile', '5 €/tk'),
(4, 'Töötaja registreerimine või kande muutmine TÖR-s', '5 €/tk'),
(5, 'Palgaarvestus töötaja kohta koos TSD esitamisega', '10 €/tk'),
(6, 'Palgaarvestus töötaja kohta koos TSD esitamisega', '7 €/tk'),
(7, 'Töövõimetuslehe esitamine Eesti Haigekassale', '5 €/tk'),
(8, 'Kuluaruande koostamine', 'al 10 €/tk'),
(9, 'Ettevõtte lisa pangakonto lisatasu', '10 €/tk'),
(10, 'Kassaorderi koostamine', '1 €/tk'),
(11, 'Lähetusaruande koostamine', '10 €/tk'),
(12, 'Dokumendi digitaliseerimine', '0.48 €/tk'),
(13, 'Maksekorralduse ettevalmistamine', '1 €/tk'),
(14, 'Pangaülekande sooritamne', '1 €/tk'),
(15, 'Töölepingu koostamine', 'al 10 €/tk'),
(16, 'Hinnapakkumise koostamine', 'al 10 €/tk'),
(17, 'Statistikaaruande koostamine', 'al 10 €/tk'),
(18, 'Kirja, tõendi jms koostamine', '7 €/tk'),
(19, 'Põhivara arvelevõtmine või eemaldamine põhivara nimekirjast', '2 €/tk'),
(20, 'Raamatupidamise aastaaruande koostamine mikroettevõttele', 'al 50 €/tk'),
(21, 'Raamatupidamise aastaaruande koostamine väikeettevõttele', 'al 100 €/tk'),
(22, 'Kasumiaruande koostamine ja väljastamine kuu lõikes', '2 €/tk'),
(23, 'Bilansi koostamine ja väljastamine kuu lõikes', '2 €/tk'),
(24, 'Eelmise perioodi korrastamine', '35 €/tund'),
(25, 'Raamatupidamise konsultatsioon', '35 €/tund');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `content` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Andmete tõmmistamine tabelile `services`
--

INSERT INTO `services` (`id`, `title`, `content`) VALUES
(0, 'Raamatupidamine', 'Osutan raamatupidamise teenust mikro- ja väikeettevõtetele.\\n\\nMikroettevõte on osaühing, mille näitajad vastavad aruandeaasta bilansipäeval kõikidele järgmistele tingimustele: varad kokku kuni 175 000 eurot, kohustised ei ole suuremad kui omakapital, üks osanik, kes on ka juhatuse liige ja mille müügitulu on aruandeaastal kuni 50 000 eurot.\\nVäikeettevõte on äriühing, mille müügitulu on üle 8 miljoni euro, aruande aasta bilansipäeval on varasid kokku üle 4 miljoni euro või keskmine töötajate arv 50 inimest.\\nKoostöös minuga on raamatupidamine internetipõhine ja paberivaba. Ettevõtte Gala RMP OÜ kasutab raamatupidamisprogramme MeritAktiva ja MeritPalk https://www.merit.ee/ ning teeb koostööd CostPocketiga https://costpocket.com/et. MeritAktiva võimaldab müügiarve koostamist ja edastamist e-arvena ja/või meili teel, liidesed pankadega võimaldavad maksekorralduse saatmist ja pangaväljavõte importi (Swedbank, LHV, SEB). Töötades CostPocketiga ei pea varundama tšekke/ ostuarveid eraldi kaustade vahel, vaid pildistades on need aktsepteeritavad kuludokumendid, mida saab edastada otse raamatupidamisprogrammi ning seal säilitada.'),
(1, 'Majandusaasta aruanne', 'Aitan teid majandusaasta aruande koostamisel ja esitamisel. Ettevõtte majandusaasta aruanne on oluline dokument, mis annab ülevaate ettevõtte finantsseisust ja käekäigust kindlal perioodil. Aruandes esitatakse üksikasjalikult ettevõtte finantstulemused, sealhulgas müügitulu, kulud, kasum või kahjum, varad, kohustused jne. Majandusaastaaruande peab esitama äriregistrile, kes kontrollib majandustegevuse vastavust seaduses määratletule. Aruanded on avalikult kättesaadav konkurentidele, partneritele ning kõigile huvilistele.'),
(2, 'Maksualane nõustamine ja konsultatsioon', 'Nõustan ja konsulteerin maksudega seotud küsimustes. Nõustamine enne tehingute tegemist aitab ettevõtjal vältida võimalikke maksuriske ja tagada, et nad kasutavad ära võimalikud maksusoodustused ning optimeerivad oma maksukohustusi seaduslikult. Saan teid aidata raamatupidamisega seotud küsimustes, töötasude arvestamisel ja maksude teemadel. Püsikliendile on konsultatsioonid tasuta ühe tunni ulatuses kuus.');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `servicesadmin`
--

CREATE TABLE `servicesadmin` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `content` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Andmete tõmmistamine tabelile `servicesadmin`
--

INSERT INTO `servicesadmin` (`id`, `title`, `content`) VALUES
(0, 'Raamatupidamine', 'Osutan raamatupidamise teenust mikro- ja väikeettevõtetele.\\n\\nMikroettevõte on osaühing, mille näitajad vastavad aruandeaasta bilansipäeval kõikidele järgmistele tingimustele: varad kokku kuni 175 000 eurot, kohustised ei ole suuremad kui omakapital, üks osanik, kes on ka juhatuse liige ja mille müügitulu on aruandeaastal kuni 50 000 eurot.\\nVäikeettevõte on äriühing, mille müügitulu on üle 8 miljoni euro, aruande aasta bilansipäeval on varasid kokku üle 4 miljoni euro või keskmine töötajate arv 50 inimest.\\nKoostöös minuga on raamatupidamine internetipõhine ja paberivaba. Ettevõtte Gala RMP OÜ kasutab raamatupidamisprogramme MeritAktiva ja MeritPalk https://www.merit.ee/ ning teeb koostööd CostPocketiga https://costpocket.com/et. MeritAktiva võimaldab müügiarve koostamist ja edastamist e-arvena ja/või meili teel, liidesed pankadega võimaldavad maksekorralduse saatmist ja pangaväljavõte importi (Swedbank, LHV, SEB). Töötades CostPocketiga ei pea varundama tšekke/ ostuarveid eraldi kaustade vahel, vaid pildistades on need aktsepteeritavad kuludokumendid, mida saab edastada otse raamatupidamisprogrammi ning seal säilitada.'),
(1, 'Majandusaasta aruanne', 'Aitan teid majandusaasta aruande koostamisel ja esitamisel. Ettevõtte majandusaasta aruanne on oluline dokument, mis annab ülevaate ettevõtte finantsseisust ja käekäigust kindlal perioodil. Aruandes esitatakse üksikasjalikult ettevõtte finantstulemused, sealhulgas müügitulu, kulud, kasum või kahjum, varad, kohustused jne. Majandusaastaaruande peab esitama äriregistrile, kes kontrollib majandustegevuse vastavust seaduses määratletule. Aruanded on avalikult kättesaadav konkurentidele, partneritele ning kõigile huvilistele.'),
(2, 'Maksualane nõustamine ja konsultatsioon', 'Nõustan ja konsulteerin maksudega seotud küsimustes. Nõustamine enne tehingute tegemist aitab ettevõtjal vältida võimalikke maksuriske ja tagada, et nad kasutavad ära võimalikud maksusoodustused ning optimeerivad oma maksukohustusi seaduslikult. Saan teid aidata raamatupidamisega seotud küsimustes, töötasude arvestamisel ja maksude teemadel. Püsikliendile on konsultatsioonid tasuta ühe tunni ulatuses kuus.');

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indeksid tabelile `contactadmin`
--
ALTER TABLE `contactadmin`
  ADD PRIMARY KEY (`id`);

--
-- Indeksid tabelile `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indeksid tabelile `pricingbase`
--
ALTER TABLE `pricingbase`
  ADD PRIMARY KEY (`id`);

--
-- Indeksid tabelile `pricingbaseadmin`
--
ALTER TABLE `pricingbaseadmin`
  ADD PRIMARY KEY (`id`);

--
-- Indeksid tabelile `pricingother`
--
ALTER TABLE `pricingother`
  ADD PRIMARY KEY (`id`);

--
-- Indeksid tabelile `pricingotheradmin`
--
ALTER TABLE `pricingotheradmin`
  ADD PRIMARY KEY (`id`);

--
-- Indeksid tabelile `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indeksid tabelile `servicesadmin`
--
ALTER TABLE `servicesadmin`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
