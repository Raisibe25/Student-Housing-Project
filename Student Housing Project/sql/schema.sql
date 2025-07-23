USE student_housing;
CREATE TABLE Students (
student_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
phone VARCHAR(20),
course VARCHAR(100),
max_budget DECIMAL(8,2) NOT NULL
);
CREATE TABLE Buildings (
building_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) UNIQUE NOT NULL,
address VARCHAR(255),
manager VARCHAR(100)
);
CREATE TABLE Rooms (
room_id INT AUTO_INCREMENT PRIMARY KEY,
room_number VARCHAR(10) NOT NULL,
capacity INT NOT NULL,
is_available BOOLEAN DEFAULT TRUE,
rent DECIMAL(8,2) NOT NULL,
building_id INT NOT NULL,
FOREIGN KEY (building_id)
REFERENCES Buildings(building_id)
);
CREATE TABLE Contracts (
contract_id INT AUTO_INCREMENT PRIMARY KEY,
student_id INT NOT NULL,
room_id INT NOT NULL,
start_date DATE NOT NULL,
end_date DATE NOT NULL,
monthly_rent DECIMAL(8,2) NOT NULL,
FOREIGN KEY (student_id)
REFERENCES Students(Student_id),
FOREIGN KEY (room_id)
REFERENCES Rooms(room_id),
CHECK (end_date > start_date)
);
DELIMITER $$
CREATE TRIGGER contracts_no_overbook_insert
BEFORE INSERT ON Contracts
FOR EACH ROW
BEGIN
DECLARE current_count INT;
DECLARE room_cap INT;
SELECT capacity
INTO room_cap
FROM Rooms
WHERE room_id = NEW.room_id;
SELECT COUNT(*)
INTO current_count
FROM Contracts c
WHERE c.room_id = NEW.room_id
AND NOT (NEW.end_date <= c.start_date
     OR NEW.start_date >= c.end_date);
IF current_count >= room_cap THEN
SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = 'Room over capacity for those dates';
  END IF;
  END $$
  DELIMITER ;
  
INSERT INTO Buildings (name, address, manager) VALUES
('Sophia Town' , '292 Richmond Avenue' , 'Tebatso Maake'),
('Kilimanjaro' , '310 Kingsway Avenue' , 'Thulani Mabazo'),
('Moshate Heights' ,'320 Kingsway Avenue' , 'Tebogo Mogale'),
('Karibu-Jamii' , '330 Kinsway Avenue' , 'Molefe Mafokeng'),
('Magnolia' , '101 Kingsway Avenue' , 'Lerato Mofokeng'),
('Maqhawe' , '203 Akademie Road' , 'Nhlamulo Nkuna'),
('Oppierief' ,'210 Akademie Road' , 'Kabelo Lemekoana'),
('Thomas Sankara House' , '230 Akademie Road' , 'Salome Malgas'),
('Akanani Residence' , '280 Richmond Avenue' , 'Keneilwe Mathabe'),
('Gauta Residence' , '262 Ditton Avenue' , 'Zukiswa Booi'),
('Kopano House' , '254 Ditton Avenue' , 'Amanda Mphahlele'),
('Cornerstone' , '232 Akademie Road' , 'Martin Matjeke'),
('Robin Crest' , '260 Richmond Avenue' , 'Nobuntu Nxumalo'),
('Horizon' , '250 Ditton Avenue' , 'Lovedelia Kgopa'),
('Afslaan' , '224 Ditton Avenue' , 'Gladys Leeuw');
INSERT INTO Students (name, email, phone, course, max_budget) VALUES
('Lebo Masetla' ,'lmasetla@yahoo.com','0784567839','Law',5600.00),
('Thabo Maputla','thabomaputla@yahoo.com','0678345263','Accounting',6000.00),
('Lesego Manamela','lesego@gmail.com','0845679123','Humanities',7000.00),
('Thato Maruma' , 'thatomaruma@gmail.com','0623415268','Law',3700.00),
('Sisanda Ncube','sisanda23@yahoo.com','0725673212','Accounting',8000.00),
('Mogau Raphesu','mogauraphesu@icloud.com','0763245436','Engineering',6000.00),
('Thembi Ndou', 'thembisile@yahoo.com','0679090908','Humanities',4000.00),
('Precious Magoro','preciousm@gmail.com','0794327890','Law',5000.00),
('Timothy Mostert','timothymos@yahoo.com','0643267423','Accounting',5000.00),
('Mojela Mogale','mojelamogale@icloud.com','07267238790','Engineering',7500.00),
('Nkateko Baloyi','nkatekosam@gmail.com','0824513765','Law',8000.00),
('Tokollo Ramathuba','tuksramathuba@yahoo.com','067851234','Accounting',6000.00),
('Mpho Mudau','mphomudau@gmail.com','0791236780','Engineering',5500.00),
('Hlengiwe Sembani', 'sembanih@icloud.com','06453546234','Law',6000.00),
('Andiswa Buthelezi','andiswabut@gmail.com','0790890989','Engineering',7500.00),
('Lucy Modiba','lucymodiba45@gmail.com','0834567836','Accounting','5000.00');
INSERT INTO Rooms (room_number, capacity, is_available, rent, building_id) VALUES
('H101',1, FALSE, 5000.00, 1),
('H102',1, TRUE, 5000.00, 1),
('H103',1, FALSE, 5000.00, 1),
('H104',2, FALSE, 3500.00, 1),
('H105',2, TRUE, 3500.00, 1),
('K101',2, TRUE, 3500.00, 2),
('K102',2, TRUE, 3500.00, 2),
('K103',1, FALSE, 5000.00, 2),
('K104',1, TRUE, 5000.00, 2),
('K105',1, FALSE, 5000.00, 2),
('L101',2, FALSE, 4500.00, 3),
('L102',2, FALSE, 4500.00, 3),
('L103',1, FALSE, 6000.00, 3),
('L104',1, FALSE, 6000.00, 3),
('L105',1, FALSE, 6000.00, 3);
INSERT INTO Contracts (student_id, room_id, start_date, end_date, monthly_rent) VALUES
(1, 1, '2025-01-01', '2025-11-30', 5000.00),
(2, 3, '2025-01-01', '2025-11-30', 5000.00),
(3, 8, '2025-02-01', '2026-01-20', 5000.00),
(4, 4, '2025-01-01', '2025-11-30', 3500.00),
(5, 13, '2025-01-01', '2025-12-15', 6000.00), 
(6, 10, '2025-02-01', '2026-01-20', 5000.00),
(7, 4, '2025-01-01', '2025-11-20', 3500.00),
(8, 12, '2025-01-01', '2025-12-15', 4500.00),
(9, 12, '2025-01-01', '2025-12-15', 4500.00),
(10, 15, '2025-01-01', '2025-12-15', 6000.00),
(11, 14, '2025-01-01', '2025-12-15', 6000.00),
(12, 11, '2025-01-01', '2025-12-15', 4500.00),
(13, 11, '2025-01-01', '2025-12-15', 4500.00),
(14, 8, '2025-02-01', '2026-01-20', 5000.00),
(15, 2, '2025-01-01', '2025-11-30', 3500.00);