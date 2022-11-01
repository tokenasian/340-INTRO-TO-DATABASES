-- Query for add a new character functionality with colon : character being used to 
-- denote the variables that will have data from the backend programming language

-- -----------------------------------------------------
-- Passengers
-- -----------------------------------------------------

-- SELECT all the passengers in the Passengers table
SELECT * FROM Passengers;

-- ADD passengers to the Passengers table
INSERT INTO Passengers (first_name, last_name, passport, email, phone_number) VALUES (:first_nameInput,:last_nameInput, :passportInput, :emailInput, :phone_numberInput);

-- SEARCH for passengers by last name
SELECT * FROM Passengers WHERE last_name LIKE :last_nameInput;

-- DELETE passengers from the Passengers table
DELETE FROM Passengers WHERE passenger_id = :idInput;

-- DELETE passengers from the Itineraries
DELETE FROM Itineraries WHERE passenger_id = :idInput;

-- UPDATE passengers Information 
UPDATE Passenger SET first_nameInput = :first_nameInput, last_name = :last_nameInput, passport = passportInput, email = :emailInput, phone_number = :phone_numberInput WHERE id = :idInput;

-- -----------------------------------------------------
-- Airports
-- -----------------------------------------------------

-- ADD data to Airports table
INSERT INTO Airports (airport_name, airport_location) VALUES (:airport_nameInput, :airport_locationInput);

-- DELETE data from the Airports table
DELETE FROM Airports WHERE id = :airport_idInput;

-- SEARCH for Airports by airport name
SELECT * FROM Airports WHERE airport_name LIKE :airport_nameInput;

-- UPDATE data in the Airports table
UPDATE Airports SET airport_name = :airport_nameInput, airport_location = :airport_locationInput where id = :airport_idInput

-- -----------------------------------------------------
-- Flights
-- -----------------------------------------------------

-- ADD data into Flights table
INSERT INTO Flights (departure_airport, arrival_airport, departure_time, arrival_time, air_fare, capacity) VALUES (:departure_airportInput, :arrival_airportInput, :departure_timeInput, 
:arrival_timeInput, :air_fareInput, :capacityInput);

-- DELETE data from Flights table
DELETE FROM Flights WHERE id = :flight_idInput;

-- UPDATE Flights data
UPDATE Flights SET departure_airport = :departure_airportInput, arrival_airport = :arrival_airportInput, departure_time = :departure_airportInput, 
arrival_time = :arrival_timeInput, air_fare = :air_fareInput, capacity = :capacityInput WHERE id = flight_idInput;

-- -----------------------------------------------------
-- Itinerary
-- -----------------------------------------------------

-- DELETE an itinerary by trip_name
DELETE FROM Itineraries WHERE trip_name = :trip_nameInput;
