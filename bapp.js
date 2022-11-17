// App.js

/*
    SETUP
*/
const express = require('express');   // We are using the express library for the web server
const bodyParser = require('body-parser')
const cors = require('cors')
const app     = express();            // We need to instantiate an express object to interact with the server in our code
PORT        =  11785;                 // Set a port number at the top so it's easy to change in the future

// Database
const db = require('./database/db-connector').pool

app.use(cors())
app.use(express.json())
app.use(bodyParser.urlencoded({extended: true}))

/*
    ROUTES
*/
// CREATE controller *********************************************************
// Add New Passenger
app.post('/passengers/add', (req, res) => {
    const firstName = req.body.firstName
    const lastName = req.body.lastName
    const passport = req.body.passport
    const email = req.body.email
    const phoneNumber = req.body.phoneNumber

    const sql_insert = 
        'INSERT INTO Passengers (first_name, last_name, passport, email, phone_number) VALUES (?,?,?,?,?)'

    db.query(sql_insert, [firstName, lastName, passport, email, phoneNumber], (err, result) => {
        if (err) {
            console.log(err)
            res.sendStatus(400)
        } else{
            res.sendStatus(201)
        }
    })
})

// Add New Passenger
app.post('/airports/add', (req, res) => {
    const airport_id = req.body.airport_id
    const airport_name = req.body.airport_name
    const airport_location = req.body.airport_location

    const sql_insert = 
        'INSERT INTO Airports (airport_id, airport_name, airport_location) VALUES (?,?,?)'

    db.query(sql_insert, [airport_id, airport_name, airport_location], (err, result) => {
        if (err) {
            console.log(err)
            res.sendStatus(400)
        } else{
            res.sendStatus(201)
        }
    })
})

// Add New Class
app.post('/ticket-classes/add', (req, res) => {
    const class_name = req.body.class_name
    const upgrade_charge = req.body.upgrade_charge

    const sql_insert = 
        'INSERT INTO Ticket_Classes (class_name, upgrade_charge) VALUES (?,?)'

    db.query(sql_insert, [class_name, upgrade_charge], (err, result) => {
        if (err) {
            console.log(err)
            res.sendStatus(400)
        } else{
            res.sendStatus(201)
        }
    })
})
// RETRIEVE controller *******************************************************
// Get Passengers
app.get('/passengers', (req, res) => {
    const sqlSelect = "SELECT * FROM Passengers";
    db.query(sqlSelect, (err, result) => {
        res.send(result);
    });
});

// Get Airports
app.get('/airports', (req, res) => {
    const sqlSelect = "SELECT * FROM Airports";
    db.query(sqlSelect, (err, result) => {
        res.send(result);
    });
});

// Get Flights
app.get('/flights', (req, res) => {
    const sqlSelect = "SELECT * FROM Flights";
    db.query(sqlSelect, (err, result) => {
        res.send(result);
    });
});

// Get Itineraries
app.get('/itineraries', (req, res) => {
    const sqlSelect = "SELECT * FROM Itineraries";
    db.query(sqlSelect, (err, result) => {
        res.send(result);
    });
});

// Get Ticket Classes
app.get('/ticket-classes', (req, res) => {
    const sqlSelect = "SELECT * FROM Ticket_Classes";
    db.query(sqlSelect, (err, result) => {
        res.send(result);
    });
});

// Get Tickets
app.get('/tickets', (req, res) => {
    const sqlSelect = "SELECT * FROM Tickets";
    db.query(sqlSelect, (err, result) => {
        res.send(result);
    });
});


// UPDATE controller *********************************************************
// UPDATE Passenger
app.put('/passengers/:id', (req, res) => {
    const id = req.params.id
    const firstName = req.body.firstName
    const lastName = req.body.lastName
    const passport = req.body.passport
    const email = req.body.email
    const phoneNumber = req.body.phoneNumber
    const sqlUpdate = 
        "UPDATE Passengers SET first_name = ?, last_name = ?, passport = ?, email = ?, phone_number = ? WHERE passenger_id = ?"
    
    db.query(sqlUpdate, [firstName, lastName, passport, email, phoneNumber, id], (err, result) => {
        if (result.affectedRows === 0) {
            console.log(err)
            res.sendStatus(404)
        } else{
            console.log(result)
            res.sendStatus(200)
        }
    })
})

// UPDATE Airport
app.put('/airports/:id', (req, res) => {
    const id = req.params.id
    const airport_name = req.body.airport_name
    const airport_location = req.body.airport_location
    const sqlUpdate = 
        "UPDATE Airports SET airport_name = ?, airport_location = ? WHERE airport_id = ?"
    
    db.query(sqlUpdate, [airport_name, airport_location, id], (err, result) => {
        if (result.affectedRows === 0) {
            console.log(err)
            res.sendStatus(404)
        } else{
            console.log(result)
            res.sendStatus(200)
        }
    })
})


// UPDATE Airport
app.put('/ticket-classes/:id', (req, res) => {
    const class_name = req.body.class_name
    const upgrade_charge = req.body.upgrade_charge
    const sqlUpdate = 
        "UPDATE Airports SET class_name = ?, upgrade_charge = ? WHERE class_id = ?"
    
    db.query(sqlUpdate, [class_name, upgrade_charge, id], (err, result) => {
        if (result.affectedRows === 0) {
            console.log(err)
            res.sendStatus(404)
        } else{
            console.log(result)
            res.sendStatus(200)
        }
    })
})

// DELETE controller *********************************************************
// DELETE Passenger
app.delete('/passengers/:id', (req, res) => {
    const id = req.params.id
    const sqlDelete = "DELETE FROM Passengers WHERE passenger_id = ?"
    db.query(sqlDelete, id, (err, result) => {

        if (result.affectedRows === 0) {
            console.log(err)
            res.sendStatus(404)
        } else{
            console.log(result)
            res.sendStatus(204)
        }
    })
})


/*
    LISTENER
*/
app.listen(PORT, () => {            // This is the basic syntax for what is called the 'listener' which receives incoming requests on the specified PORT.
    console.log('Express started on http://flip3.engr.oregonstate.edu:' + PORT + '; press Ctrl-C to terminate.')
});
