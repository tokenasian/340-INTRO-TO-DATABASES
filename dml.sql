-- Query for add a new character functionality with colon : character being used to 
-- denote the variables that will have data from the backend programming language

-- Select all the passengers in the Passengers table
SELECT * FROM Passengers;

-- Add a passenger in the Passengers table
INSERT INTO Passengers (first_name, last_name, passport, email, phone_number) VALUES (:first_nameInput,:last_nameInput, :passportInput, :emailInput, :phone_numberInput);

-- Search for passengers with last name
SELECT * FROM Passengers WHERE last_name LIKE :last_nameInput;

-- Delete a passenger 
DELETE FROM Passengers WHERE passenger_id = :idInput;

-- Delete a passenger from Itineraries
DELETE FROM Itineraries WHERE passenger_id = :idInput;

-- Update Passenger Information 
UPDATE Passenger SET first_nameInput = :first_nameInput, last_name = :last_nameInput, passport = passportInput email = :emailInput, phone_number = :phone_numberInput WHERE id = :idInput;

-- Add data into Flights table
INSERT INTO Flights (departure_airport, arrival_airport, departure_time, arrival_time, air_fare, capacity) VALUES (:departure_airportInput, :arrival_airportInput, :departure_timeInput, 
:arrival_timeInput, :air_fareInput, :capacityInput);

-- Delete data from Flights 
DELETE FROM Flights WHERE id = :flight_idInput;

-- Update Flights data
UPDATE Flights SET departure_airport = :departure_airportInput, arrival_airport = :arrival_airportInput, departure_time = :departure_airportInput, 
arrival_time = :arrival_timeInput, air_fare = :air_fareInput WHERE id = flight_idInput;

-- Delete an itinerary by trip_name
DELETE FROM Itineraries WHERE trip_name = :trip_nameInput;

