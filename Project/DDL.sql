SET FOREIGN_KEY_CHECKS=0;
SET AUTOCOMMIT = 0;

CREATE OR REPLACE TABLE Passengers(
    passenger_id int AUTO_INCREMENT NOT NULL,
    first_name varchar(255) NOT NULL,
    last_name varchar(255) NOT NULL,
    passport varchar(10) unique NOT NULL,
    email varchar(255) NOT NULL,
    phone_number varchar(15) NOT NULL,
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
    PRIMARY KEY (airport_id)
);

CREATE OR REPLACE TABLE Tickets(
    ticket_id int AUTO_INCREMENT NOT NULL,
    passenger_id int NOT NULL,
    flight_id int NOT NULL,
    ticket_class varchar(10) NOT NULL,
    PRIMARY KEY (ticket_id), 
    FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id),
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id)

);

CREATE OR REPLACE TABLE Ticket_Classes(
    class_id int AUTO_INCREMENT NOT NULL,
    upgrade_charge int NOT NULL,
    PRIMARY KEY (class_id)
);
