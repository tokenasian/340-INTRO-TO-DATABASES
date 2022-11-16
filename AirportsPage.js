import React from 'react';
import AirportsTable from '../components/tables/AirportsTable';
import { useState, useEffect } from 'react';
import { API_URL } from '../API';
import { useNavigate } from 'react-router-dom';

function AirportsPage({ setAirportToUpdate }) {
    // Use navigate for updating
    const navigate = useNavigate()

    // Use state to bring in the data
    const [airports, setAirports] = useState([]);
    
    // RETRIEVE the list of airports
    const loadAirports = async () => {
        const response = await fetch(`${API_URL}/airports`);
        const airports = await response.json();
        setAirports(airports);
    } 

    // UPDATE Airport
    const onEditAirport = async airport => {
        setAirportToUpdate(airport)
        navigate('../airports-edit')
    }

    // CREATE Airport
    const navigateToCreate = () => {
        navigate('../airports-add')
    }

    // DELETE Airport
    const onDeleteAirport = async id => {
        const response = await fetch(`${API_URL}/airports/${id}`, { method: 'DELETE' });
        if (response.status === 204) {
            const getResponse = await fetch(`${API_URL}/airports`);
            const airports = await getResponse.json();
            setAirports(airports);
        } else {
            console.error(`Failed to delete airport with id = ${id}, status code = ${response.status}`)
        }
    }

    // LOAD Airports
    useEffect(() => {
        loadAirports();
    }, []);

    return(
        <>
        <h1>Airports</h1>
            <AirportsTable
                    airports={airports} 
                    onEdit={onEditAirport} 
                    onDelete={onDeleteAirport} 
                />
            <button onClick={navigateToCreate}>Create New Airport</button>
        </>
    )
};

export default AirportsPage;