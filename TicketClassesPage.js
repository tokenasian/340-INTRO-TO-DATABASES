import React from 'react';
import TicketClassesTable from '../components/tables/TicketClassesTable';
import { useState, useEffect } from 'react';
import { API_URL } from '../API';
import { useNavigate } from 'react-router-dom';

function TicketClassesPage({ setTicketClassesToUpdate }) {
    // Use navigate for updating
    const navigate = useNavigate()
    // Use state to bring in the data
    const [ticket_classes, setTicket_Classes] = useState([]);
    // RETRIEVE the list of 
    const loadClasses = async () => {
        const response = await fetch(`${API_URL}/ticket-classes`);
        const ticket_classes = await response.json();
        setTicket_Classes(ticket_classes);
    } 

    // UPDATE 
    const onEditTicketClasses = async ticket_class => {
        setTicketClassesToUpdate(ticket_class)
        navigate('../ticket-classes-edit')
    }

    // CREATE 
    const navigateToCreate = () => {
        navigate('../ticket-classes-add')
    }

    // DELETE 
    const onDeleteTicketClasses = async id => {
        const response = await fetch(`${API_URL}/ticket-classes/${id}`, { method: 'DELETE' });
        if (response.status === 204) {
            const getResponse = await fetch(`${API_URL}/ticket-classes`);
            const ticket_classes = await getResponse.json();
            setTicket_Classes(ticket_classes);
        } else {
            console.error(`Failed to delete ticket class with id = ${id}, status code = ${response.status}`)
        }
    }

    // LOAD 
    useEffect(() => {
        loadClasses();
    }, []);

    return(
        <>
        <h1>Ticket Classes</h1>
            <TicketClassesTable
                    ticket_classes ={ticket_classes} 
                    onEdit={onEditTicketClasses} 
                    onDelete={onDeleteTicketClasses} 
                />
            <button onClick={navigateToCreate}>Create New Ticket Class</button>
        </>
    )
};

export default TicketClassesPage;
