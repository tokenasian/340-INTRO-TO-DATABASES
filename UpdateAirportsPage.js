import {React, useState} from "react";
import { API_URL } from "../API";
import { useNavigate } from 'react-router-dom';

function UpdateAirportsPage({ airport }){
    const [airport_id, setAirport_id] = useState(airport.airport_id)
    const [airport_name, setAirport_name] = useState(airport.airport_name)
    const [airport_location, setAirport_location] = useState(airport.airport_location)

    const navigate = useNavigate()

    const editAirport = async () => {
        const response = await fetch(`${API_URL}/airports/${airport.airport_id}`, {
            method: 'PUT',
            body: JSON.stringify({ 
                airport_id: airport_id,
                airport_name: airport_name,
                airport_location: airport_location
            }),
            headers: {'Content-Type': 'application/json',},
        });
        if (response.status === 200) {
            alert("Successfully edited the airport!");
        } else {
            const errMessage = await response.json();
            alert(`Failed to update exercise. Status ${response.status}. ${errMessage.Error}`);
        }
        navigate('../airports')
    }

    return (
        <>
        <h1>Edit an Airports Information</h1>
        <form onSubmit={(e) => { e.preventDefault();}}>
                <fieldset>
                    <legend>Airport ID: {airport.airport}</legend>
                    <label for="airport_id">Airport ID</label>
                    <input
                        type="text"
                        value={airport_id}
                        onChange={e => setAirport_id(e.target.value)} 
                        id="airport_id" />
                    
                    <label for="airport_name">Airport Name</label>
                    <input
                        type="text"
                        value={airport_name}
                        onChange={e => setAirport_name(e.target.value)} 
                        id="airport_name" />

                    <label for="airport_location">Location</label>
                    <input
                        type="text"
                        value={airport_location}
                        onChange={e => setAirport_location(e.target.value)} 
                        id="airport_location" />

                    <label for="submit">
                    <button
                        onClick={editAirport}
                        id="submit"
                    >Save</button></label>
                </fieldset>
            </form>
        </>
    )
}

export default UpdateAirportsPage;