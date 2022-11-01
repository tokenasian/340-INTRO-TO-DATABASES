SET FOREIGN_KEY_CHECKS = 0;
SET AUTOCOMMIT = 0;

DROP TABLE IF EXISTS Passengers;
DROP TABLE IF EXISTS Flights;
DROP TABLE IF EXISTS Airports;
DROP TABLE IF EXISTS Tickets;
DROP TABLE IF EXISTS Ticket_Classes;
DROP TABLE IF EXISTS Itineraries;


-- -----------------------------------------------------
-- Passengers Table
-- -----------------------------------------------------
CREATE TABLE Passengers(
    passenger_id int AUTO_INCREMENT NOT NULL,
    first_name varchar(255) NOT NULL,
    last_name varchar(255) NOT NULL,
    passport varchar(10) NOT NULL unique,
    email varchar(255) NOT NULL,
    phone_number varchar(15) NOT NULL,
    UNIQUE (passport),
    PRIMARY KEY (passenger_id)
);

-- -----------------------------------------------------
-- Flights Table 
-- -----------------------------------------------------
CREATE TABLE Flights(
    flight_id int AUTO_INCREMENT NOT NULL,
    departure_airport int NOT NULL,
    arrival_airport int NOT NULL,
    departure_time timestamp NOT NULL,
    arrival_time timestamp NOT NULL,
    air_fare int NOT NULL,
    capacity int NOT NULL,
    PRIMARY KEY (flight_id),
    FOREIGN KEY (departure_airport) REFERENCES Airports(airport_id) ON DELETE CASCADE,
    FOREIGN KEY (arrival_airport) REFERENCES Airports(airport_id) ON DELETE CASCADE
);

-- -----------------------------------------------------
-- Airports Table 
-- -----------------------------------------------------
CREATE TABLE Airports(
    airport_id int AUTO_INCREMENT NOT NULL,
    airport_name varchar(255) NOT NULL,
    airport_location varchar(255) NOT NULL,
    description varchar(1000) NOT NULL,
    PRIMARY KEY (airport_id)
);

-- -----------------------------------------------------
-- Tickets Table 
-- -----------------------------------------------------
CREATE TABLE Tickets(
    ticket_id int AUTO_INCREMENT NOT NULL,
    itinerary_id int NOT NULL,
    flight_id int NOT NULL,
    ticket_class int NOT NULL,
    PRIMARY KEY (ticket_id), 
    FOREIGN KEY (itinerary_id) REFERENCES Itineraries(itinerary_id) ON DELETE CASCADE,
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id) ON DELETE CASCADE,
    FOREIGN KEY (ticket_class) REFERENCES Ticket_Classes(class_id)
);

-- -----------------------------------------------------
-- Ticket_Classes Table 
-- -----------------------------------------------------
CREATE TABLE Ticket_Classes(
    class_id int AUTO_INCREMENT NOT NULL,
    class_name varchar(25) NOT NULL,
    upgrade_charge int NOT NULL,
    PRIMARY KEY (class_id)
);

-- -----------------------------------------------------
-- Itineraries Table 
-- -----------------------------------------------------
CREATE TABLE Itineraries(
    itinerary_id int AUTO_INCREMENT NOT NULL,
    passenger_id int NOT NULL,
    trip_name varchar(255) UNIQUE NOT NULL,
    PRIMARY KEY (itinerary_id),
    FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id) ON DELETE CASCADE
);


-- -----------------------------------------------------
-- Sample Data  
-- -----------------------------------------------------
INSERT INTO Passengers (first_name, last_name, passport, email, phone_number)
VALUES('Sterling', 'Archer', '542637785', 'archer@hello.com', '814-825-5951'),
('Stede', 'Bonnet', '919608451', 'bonnet@hello.com', '919-252-6000'),
('Steve', 'Harrington', '135516591', 'harrington@hello.com', '505-820-2961'),
('Mabel', 'Mora', '637071702', 'mora@hello.com', '315-794-6533'),
('Michael', 'Scott', '571921982', 'scott@hello.com', '716-475-1975'),
('Buffy', 'Summers', '678996728', 'summers@hello.com', '813-273-1085'),
('Jeff', 'Winger', '218571886', 'winger@hello.com', '408-558-2426');

INSERT INTO Airports (airport_name, airport_location)
VALUES ('LaGuardia Airport', 'New York'),
('Sydney Airport', 'Australia'),
('Dublin Airport', 'Ireland'),
('Malpensa Airport', 'Milan'),
('Incheon Airport', 'Seoul'),
('Seville Airport', 'Spain'),
('Narita Airport', 'Tokyo');

INSERT INTO Ticket_Classes(class_name, upgrade_charge)
VALUES
('First Class', 5000),
('Business', 1000), 
('Premium Economy', 500),
('Economy', 0);

INSERT INTO Flights (departure_airport, arrival_airport, departure_time, arrival_time, air_fare, capacity)
VALUES
(
    (SELECT Airports.airport_id FROM Airports WHERE Airports.airport_name = 'LaGuardia Airport'),
    (SELECT Airports.airport_id FROM Airports WHERE Airports.airport_name = 'Sydney Airport'),
    '2022-10-30 08:00:00',
    '2022-10-30 14:00:00',
    5000,
    70
),
(
    (SELECT Airports.airport_id FROM Airports WHERE Airports.airport_name = 'Sydney Airport'),
    (SELECT Airports.airport_id FROM Airports WHERE Airports.airport_name = 'Incheon Airport'),
    '2022-11-01 07:00:00',
    '2022-11-01 15:00:00',
    5000,
    70
),
(
    (SELECT Airports.airport_id FROM Airports WHERE Airports.airport_name = 'LaGuardia Airport'),
    (SELECT Airports.airport_id FROM Airports WHERE Airports.airport_name = 'Narita Airport'),
    '2023-02-20 08:00:00',
    '2023-02-21 20:00:00',
    5000,
    70
);


INSERT INTO Itineraries (passenger_id, trip_name)
VALUES
(
    (SELECT Passengers.passenger_id FROM Passengers WHERE Passengers.passport = '542637785'),
    "Archer Vacation 2022"
),
(
    (SELECT Passengers.passenger_id FROM Passengers WHERE Passengers.passport = '919608451'),
    "Bonnet Business Trip"
),
(
    (SELECT Passengers.passenger_id FROM Passengers WHERE Passengers.passport = '678996728'),
    "Buffy Family Trip"
);


INSERT INTO Tickets (itinerary_id, flight_id, ticket_class)
VALUES
(
    (SELECT Itineraries.itinerary_id FROM Itineraries WHERE Itineraries.trip_name = 'Archer Vacation 2022'),
    (SELECT Flights.flight_id FROM Flights WHERE Flights.flight_id = 1),
    (SELECT Ticket_Classes.class_id FROM Ticket_Classes WHERE Ticket_Classes.class_name = 'First Class')
),
(
    (SELECT Itineraries.itinerary_id FROM Itineraries WHERE Itineraries.trip_name = 'Bonnet Business Trip'),
    (SELECT Flights.flight_id FROM Flights WHERE Flights.flight_id = 1),
    (SELECT Ticket_Classes.class_id FROM Ticket_Classes WHERE Ticket_Classes.class_name = 'Business')
),
(
    (SELECT Itineraries.itinerary_id FROM Itineraries WHERE Itineraries.trip_name = 'Bonnet Business Trip'),
    (SELECT Flights.flight_id FROM Flights WHERE Flights.flight_id = 2),
    (SELECT Ticket_Classes.class_id FROM Ticket_Classes WHERE Ticket_Classes.class_name = 'Business')
),
(
    (SELECT Itineraries.itinerary_id FROM Itineraries WHERE Itineraries.trip_name = 'Buffy Family Trip'),
    (SELECT Flights.flight_id FROM Flights WHERE Flights.flight_id = 3),
    (SELECT Ticket_Classes.class_id FROM Ticket_Classes WHERE Ticket_Classes.class_name = 'Economy')
);


SET FOREIGN_KEY_CHECKS=1;
SET AUTOCOMMIT = 1;
