-- Tworzenie bazy danych
CREATE DATABASE HotelDB;
USE HotelDB;

-- Tworzenie tabeli Goscie
CREATE TABLE Goscie (
    gosc_id INT PRIMARY KEY AUTO_INCREMENT,
    imie VARCHAR(50) NOT NULL,
    nazwisko VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefon VARCHAR(20),
    data_rejestracji DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Tworzenie tabeli Pokoje
CREATE TABLE Pokoje (
    pokoj_id INT PRIMARY KEY AUTO_INCREMENT,
    numer_pokoju VARCHAR(10) UNIQUE NOT NULL,
    typ_pokoju ENUM('jednoosobowy', 'dwuosobowy', 'apartament') NOT NULL,
    cena_za_noc DECIMAL(10,2) NOT NULL,
    status ENUM('wolny', 'zajety', 'sprzatanie') DEFAULT 'wolny'
);

-- Tworzenie tabeli Rezerwacje
CREATE TABLE Rezerwacje (
    rezerwacja_id INT PRIMARY KEY AUTO_INCREMENT,
    gosc_id INT,
    pokoj_id INT,
    data_przyjazdu DATE NOT NULL,
    data_wyjazdu DATE NOT NULL,
    status_rezerwacji ENUM('potwierdzona', 'oczekujaca', 'anulowana') DEFAULT 'oczekujaca',
    kwota_calkowita DECIMAL(10,2),
    FOREIGN KEY (gosc_id) REFERENCES Goscie(gosc_id),
    FOREIGN KEY (pokoj_id) REFERENCES Pokoje(pokoj_id)
);

-- Tworzenie tabeli Platnosci
CREATE TABLE Platnosci (
    platnosc_id INT PRIMARY KEY AUTO_INCREMENT,
    rezerwacja_id INT,
    kwota DECIMAL(10,2) NOT NULL,
    data_platnosci DATETIME DEFAULT CURRENT_TIMESTAMP,
    metoda_platnosci ENUM('karta', 'gotowka', 'przelew') NOT NULL,
    FOREIGN KEY (rezerwacja_id) REFERENCES Rezerwacje(rezerwacja_id)
);

-- Wstawianie danych do tabeli Goscie
INSERT INTO Goscie (imie, nazwisko, email, telefon) VALUES
('Jan', 'Kowalski', 'jan.kowalski@email.com', '123456789'),
('Anna', 'Nowak', 'anna.nowak@email.com', '987654321'),
('Piotr', 'Wiśniewski', 'piotr.w@email.com', '555444333'),
('Maria', 'Zielińska', 'maria.z@email.com', '666777888'),
('Tomasz', 'Lewandowski', 'tomasz.l@email.com', '222333444'),
('Katarzyna', 'Wójcik', 'katarzyna.w@email.com', '111222333'),
('Michał', 'Szymański', 'michal.s@email.com', '444555666'),
('Ewa', 'Dąbrowska', 'ewa.d@email.com', '777888999'),
('Jakub', 'Piotrowski', 'jakub.p@email.com', '999000111'),
('Alicja', 'Grabowska', 'alicja.g@email.com', '333444555');

-- Wstawianie danych do tabeli Pokoje
INSERT INTO Pokoje (numer_pokoju, typ_pokoju, cena_za_noc) VALUES
('101', 'jednoosobowy', 150.00),
('102', 'dwuosobowy', 250.00),
('103', 'jednoosobowy', 150.00),
('104', 'dwuosobowy', 250.00),
('201', 'apartament', 400.00),
('202', 'apartament', 400.00),
('203', 'dwuosobowy', 250.00),
('204', 'jednoosobowy', 150.00),
('301', 'apartament', 450.00),
('302', 'dwuosobowy', 270.00);

-- Wstawianie danych do tabeli Rezerwacje
INSERT INTO Rezerwacje (gosc_id, pokoj_id, data_przyjazdu, data_wyjazdu, status_rezerwacji, kwota_calkowita) VALUES
(1, 1, '2025-04-10', '2025-04-12', 'potwierdzona', 300.00),
(2, 2, '2025-04-15', '2025-04-18', 'oczekujaca', 750.00),
(3, 3, '2025-04-20', '2025-04-22', 'potwierdzona', 300.00),
(4, 5, '2025-04-25', '2025-04-27', 'potwierdzona', 800.00),
(5, 4, '2025-05-01', '2025-05-03', 'oczekujaca', 500.00),
(6, 6, '2025-05-05', '2025-05-07', 'potwierdzona', 800.00),
(7, 7, '2025-05-10', '2025-05-12', 'anulowana', 500.00),
(8, 8, '2025-05-15', '2025-05-16', 'potwierdzona', 150.00),
(9, 9, '2025-05-20', '2025-05-23', 'oczekujaca', 1350.00),
(10, 10, '2025-05-25', '2025-05-27', 'potwierdzona', 540.00);

-- Wstawianie danych do tabeli Platnosci
INSERT INTO Platnosci (rezerwacja_id, kwota, metoda_platnosci) VALUES
(1, 300.00, 'karta'),
(2, 250.00, 'przelew'),
(3, 300.00, 'gotowka'),
(4, 400.00, 'karta'),
(4, 400.00, 'przelew'),
(6, 800.00, 'karta'),
(8, 150.00, 'gotowka'),
(9, 450.00, 'przelew'),
(10, 540.00, 'karta'),
(5, 500.00, 'przelew');