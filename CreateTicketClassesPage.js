import React, { useState } from 'react';
import { API_URL } from '../API';
import { useNavigate } from 'react-router-dom';

function CreateTicketClassesPage() {

    const [class_name, setClass_name] = useState('')
    const [upgrade_charge, setUpgrade_charge] = useState('')

    const navigate = useNavigate()

    const addClass = async () => {
        const newClass = { class_name, upgrade_charge }
        const response = await fetch(`${API_URL}/ticket-classes/add`, {
            method: 'post',
            body: JSON.stringify(newClass),
            headers: {
                'Content-Type': 'application/json',
            }
        });
        if(response.status === 201){
            alert("Successfully added the Class!")

        } else {
            alert(`Failed to add the class, status code = ${response.status}`)
        };
        navigate('../ticket-classes')

    }

  return (
    <>
    <form onSubmit={(e) => { e.preventDefault();}}>
        <legend><strong>Add New Class to The Table</strong></legend>
            <fieldset class="fields">
                <label for ="class_name">Class Name </label> 
                <input 
                    type="text" 
                    name="class_name"
                    value={class_name}
                    onChange={e => setClass_name(e.target.value)} 
                    id="class_name" />

                <label> Upgrade Charge </label> 
                <input 
                    type="text" 
                    name="upgrade_charge"
                    value={upgrade_charge}
                    onChange={e => setUpgrade_charge(e.target.value)}
                    id="upgrade_charge" />

                <label for="submit">
                    <button
                        type="submit"
                        onClick={addClass}
                        id="submit"
                    >Add</button>
                </label>     
            </fieldset>
	</form> 
    </>
  );
}

export default CreateTicketClassesPage;
