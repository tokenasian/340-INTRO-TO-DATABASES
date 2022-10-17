SET FOREIGN_KEY_CHECKS=0;
SET AUTOCOMMIT = 0;

CREATE OR REPLACE TABLE Passengers(
    passenger_id int AUTO_INCREMENT NOT NULL,
    first_name varchar(255) NOT NULL,
    last_name varchar(255) NOT NULL,
    passport varchar(10) NOT NULL unique,
    email varchar(255) NOT NULL,
    phone_number varchar(15) NOT NULL,
    UNIQUE (passport),
    PRIMARY KEY (passenger_id)
);

CREATE OR REPLACE TABLE Flights(
    flight_id int AUTO_INCREMENT NOT NULL,
    departing_airport int NOT NULL,
    arrival_airport int NOT NULL,
    departure_time timestamp NOT NULL,
    arrival_time timestamp NOT NULL,
    air_fare int NOT NULL,
    capacity int NOT NULL,
    PRIMARY KEY (flight_id),
    FOREIGN KEY (departing_airport) REFERENCES Airports(airport_id),
    FOREIGN KEY (arrival_airport) REFERENCES Airports(airport_id)
);

CREATE OR REPLACE TABLE Airports(
    airport_id int AUTO_INCREMENT NOT NULL,
    airport_name varchar(255) NOT NULL,
    airport_location varchar(255) NOT NULL,
    description varchar(1000) NOT NULL,
    PRIMARY KEY (airport_id)
);

CREATE OR REPLACE TABLE Tickets(
    ticket_id int AUTO_INCREMENT NOT NULL,
    passenger_id int NOT NULL,
    flight_id int NOT NULL,
    ticket_class varchar(10) NOT NULL,
    PRIMARY KEY (ticket_id), 
    FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id),
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id),
    FOREIGN KEY (ticket_class) REFERENCES Ticket_Classes(class_id)
);

CREATE OR REPLACE TABLE Ticket_Classes(
    class_id int AUTO_INCREMENT NOT NULL,
    class_name varchar(10) NOT NULL,
    upgrade_charge int NOT NULL,
    PRIMARY KEY (class_id)
);

INSERT INTO Passengers (first_name, last_name, passport, email, phone_number)
VALUES('Sterling', 'Archer', '652190223', 'archer@hello.com', '814-825-5951'),
('Stede', 'Bonnet', '141011810', 'bonnet@hello.com', '919-252-6000'),
('Michael', 'Scott', '498726075', 'scott@hello.com', '716-475-1975'),
('Mabel', 'Mora', '637071702', 'mora@hello.com', '315-794-6533'),
('Jeff', 'Winger', '576803679', 'winger@hello.com', '408-558-2426');

INSERT INTO Airports (airport_name, airport_location)
VALUES ('LaGuardia Airport', 'New York'),
('Incheon Airport', 'Seoul'),
('Malpensa Airport', 'Milan'),
('Narita Airport', 'Tokyo'),
('Seville Airport', 'Spain');

INSERT INTO Ticket_Classes(class_name, upgrade_charge)
VALUES
('First', '5000'),
('Business', '1000'), 
('Premium Economy', '500'),
('Economy', '0');

SET FOREIGN_KEY_CHECKS=1;
SET AUTOCOMMIT = 1;
