import React from 'react';
import { MdDeleteForever, MdEdit } from 'react-icons/md';
// Needs to receive a JSON from a fetch in classes page
function TicketClassesTable({ ticket_classes, onEdit, onDelete }) {
    return (
        <table id="ticket_classes">
            <caption>Current Classes</caption>
            <thead>
                <tr>
                    <th>Class ID</th>
                    <th>Class Name</th>
                    <th>Upgrade Charge</th>
                    <th>edit</th>
                    <th>delete</th>
                </tr>
            </thead>
            <tbody>
                {ticket_classes.map((ticket_class, i) => 
                    <tr>
                        <td>{ticket_class.class_id}</td>
                        <td>{ticket_class.class_name}</td>
                        <td>{ticket_class.upgrade_charge}</td>
                        <td><MdEdit onClick={() => onEdit(ticket_class)} /></td>
                        <td><MdDeleteForever onClick={() => onDelete(ticket_class.class_id)} /></td>
                    </tr>
                )}
            </tbody>
        </table>
    );
}

export default TicketClassesTable;
