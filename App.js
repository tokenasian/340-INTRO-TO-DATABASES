// Import dependencies
import React, { useState } from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';

// Import Components, styles, media
import Navigation from './components/Navigation';
import './App.css';

// Import Pages

import HomePage from './pages/HomePage';
import PassengersPage from './pages/PassengersPage';
import AirportsPage from './pages/AirportsPage';
import FlightsPage from './pages/FlightsPage';
import ItinerariesPage from './pages/ItinerariesPage';
import CreateBookingPage from './pages/CreateBookingPage';
import TicketsPage from './pages/TicketsPage';
import TicketClassesPage from './pages/TicketClassesPage';

import CreatePassengerPage from './pages/CreatePassengerPage';
import UpdatePassengerPage from './pages/UpdatePassengerPage';

import CreateAirportsPage from './pages/CreateAirportsPage';
import UpdateAirportsPage from './pages/UpdateAirportsPage';

import CreateTicketClassesPage from './pages/CreateTicketClassesPage';
import UpdateTicketClassesPage from './pages/UpdateTicketClassesPage'; 


function App() {
  const [passengerToUpdate, setPassengerToUpdate] = useState([])
  const [airportToUpdate, setAirportToUpdate] = useState([])
  const [ticketclassToUpdate, setTicketClassesToUpdate] = useState([])

  return (
    <Router>

          <header>
            <h1>Airline Travel Management System</h1>
            <p>Normandy Airlines</p>
          </header>

          <Navigation />

          <main>
          <Routes>
            <Route path="/" element={<HomePage />} />

            <Route path="airports" element={<AirportsPage setAirportToUpdate={setAirportToUpdate} />} />
            <Route path="airports-add" element={<CreateAirportsPage />} />
            <Route path="airports-edit" element={<UpdateAirportsPage airport={airportToUpdate} />} />
            
            <Route path="passengers" element={<PassengersPage setPassengerToUpdate={setPassengerToUpdate} />} />
            <Route path="passengers-add" element={<CreatePassengerPage />} />
            <Route path="passengers-edit" element={<UpdatePassengerPage passenger={passengerToUpdate} />} />
  
            <Route path="flights" element={<FlightsPage />} />
            <Route path="itineraries" element={<ItinerariesPage />} />
            <Route path="create-booking" element={<CreateBookingPage/>} />
            <Route path="tickets" element={<TicketsPage />} />
            <Route path="ticket-classes" element={<TicketClassesPage />} />

            <Route path="ticket-classes" element={<TicketClassesPage setTicketClassesToUpdate={setTicketClassesToUpdate} />} />
            <Route path="ticket-classes-add" element={<CreateTicketClassesPage />} />
            <Route path="ticket-classes-edit" element={<UpdateTicketClassesPage ticket-class={ticketclassToUpdate} />} />
          </Routes>
          </main>

          <footer>
            <p>&copy; 2022 Chance Back & Matthew Armstrong</p>
          </footer>

      </Router>
  );
}

export default App;
