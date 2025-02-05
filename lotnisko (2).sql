CREATE DATABASE IF NOT EXISTS linialotnicza;
USE linialotnicza;

-- Tabela adres
CREATE TABLE adres (
    id INT AUTO_INCREMENT PRIMARY KEY,
    wojewodztwo VARCHAR(45),
    powiat VARCHAR(45),
    miejscowosc VARCHAR(45),
    ulica VARCHAR(45),
    numer_domu VARCHAR(45),
    numer_lokalu VARCHAR(45)
);

-- Tabela pasazer
CREATE TABLE pasazer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    imie VARCHAR(45),
    nazwisko VARCHAR(45),
    pesel VARCHAR(45),
    telefon VARCHAR(15),
    mail VARCHAR(45),
    adres_id INT,
    FOREIGN KEY (adres_id) REFERENCES adres(id)
);

-- Tabela status_rezerwacji
CREATE TABLE status_rezerwacji (
    id INT AUTO_INCREMENT PRIMARY KEY,
    status VARCHAR(45)
);

-- Tabela samolot
CREATE TABLE samolot (
    id INT AUTO_INCREMENT PRIMARY KEY,
    producent VARCHAR(45),
    typ VARCHAR(45)
);

-- Tabela lot
CREATE TABLE lot (
    numer_lotu INT AUTO_INCREMENT PRIMARY KEY,
    data_wylotu DATETIME,
    samolot_id INT,
    FOREIGN KEY (samolot_id) REFERENCES samolot(id)
);

-- Tabela rezerwacja (poprawiona)
CREATE TABLE rezerwacja (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numer_siedzenia INT NOT NULL,
    bagaz VARCHAR(45) NOT NULL,
    pasazer_id INT NOT NULL,
    pasazer_adres_id INT,
    lot_numer_lotu INT,
    status_rezerwacji_id INT,
    FOREIGN KEY (pasazer_id) REFERENCES pasazer(id) ON DELETE CASCADE,
    FOREIGN KEY (pasazer_adres_id) REFERENCES adres(id),
    FOREIGN KEY (lot_numer_lotu) REFERENCES lot(numer_lotu),
    FOREIGN KEY (status_rezerwacji_id) REFERENCES status_rezerwacji(id)
);

-- Dodanie rekordów do tabeli adres
INSERT INTO adres (wojewodztwo, powiat, miejscowosc, ulica, numer_domu, numer_lokalu) VALUES
('Mazowieckie', 'Warszawa', 'Warszawa', 'Marszałkowska', '10', '1'),
('Małopolskie', 'Kraków', 'Kraków', 'Floriańska', '15', '2'),
('Wielkopolskie', 'Poznań', 'Poznań', 'Piekary', '25', '3'),
('Dolnośląskie', 'Wrocław', 'Wrocław', 'Świdnicka', '30', '4'),
('Pomorskie', 'Gdańsk', 'Gdańsk', 'Długa', '5', '5');

-- Dodanie rekordów do tabeli pasazer
INSERT INTO pasazer (imie, nazwisko, pesel, telefon, mail, adres_id) VALUES
('Jan', 'Kowalski', '12345678901', '500100100', 'jan.kowalski@example.com', 1),
('Anna', 'Nowak', '23456789012', '500200200', 'anna.nowak@example.com', 2),
('Piotr', 'Zieliński', '34567890123', '500300300', 'piotr.zielinski@example.com', 3),
('Katarzyna', 'Mazur', '45678901234', '500400400', 'katarzyna.mazur@example.com', 4),
('Marek', 'Lewandowski', '56789012345', '500500500', 'marek.lewandowski@example.com', 5);

-- Dodanie rekordów do tabeli status_rezerwacji
INSERT INTO status_rezerwacji (status) VALUES
('Potwierdzona'),
('Anulowana'),
('Oczekująca'),
('Zrealizowana'),
('Zmodyfikowana');

-- Dodanie rekordów do tabeli samolot
INSERT INTO samolot (producent, typ) VALUES
('Boeing', '737'),
('Airbus', 'A320'),
('Embraer', 'E195'),
('Bombardier', 'CRJ900'),
('Cessna', 'Citation X');

-- Dodanie rekordów do tabeli lot
INSERT INTO lot (data_wylotu, samolot_id) VALUES
('2025-03-01 12:00:00', 1),
('2025-04-15 14:30:00', 2),
('2025-05-10 09:00:00', 3),
('2025-06-20 16:45:00', 4),
('2025-07-05 07:15:00', 5);

-- Dodanie rekordów do tabeli rezerwacja
INSERT INTO rezerwacja (numer_siedzenia, bagaz, pasazer_id, pasazer_adres_id, lot_numer_lotu, status_rezerwacji_id) VALUES
(12, 'Podręczny', 1, 1, 1, 1),
(15, 'Rejestrowany', 2, 2, 2, 2),
(8, 'Podręczny', 3, 3, 3, 3),
(20, 'Brak', 4, 4, 4, 4),
(5, 'Podręczny', 5, 5, 5, 5);
