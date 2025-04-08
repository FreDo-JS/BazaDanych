-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2025 at 01:05 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zadania`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zadanie`
--

CREATE TABLE `zadanie` (
  `id` int(11) NOT NULL,
  `dataZadania` date DEFAULT NULL,
  `wpis` varchar(30) DEFAULT NULL,
  `miesiac` varchar(15) DEFAULT NULL,
  `rok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `zadanie`
--

INSERT INTO `zadanie` (`id`, `dataZadania`, `wpis`, `miesiac`, `rok`) VALUES
(1, '2020-07-01', 'Spotkanie', 'Lipiec', 2020),
(2, '2020-07-02', 'Praca zdalna', 'Lipiec', 2020),
(3, '2020-07-03', 'Spotkanie', 'Lipiec', 2020),
(4, '2020-07-04', '', 'Lipiec', 2020),
(5, '2020-07-15', 'Szkolenie', 'Lipiec', 2020),
(6, '2020-07-18', 'Spotkanie z klientem', 'Lipiec', 2020),
(7, '2020-07-20', 'Przegląd', 'Lipiec', 2020),
(8, '2020-06-30', 'Seminarium', 'Czerwiec', 2020);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `zadanie`
--
ALTER TABLE `zadanie`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `zadanie`
--
ALTER TABLE `zadanie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
