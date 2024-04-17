// page doctor will see when they log in
import React, { useState } from "react";
import { Link } from 'react-router-dom';
import './DoctorWelcomePage.css';


const DoctorWelcomePage = () =>{
    const [doctorName, setDoctorName] = useState('John');

    return (
        <>
            <h1>Welcome {doctorName}!</h1>
            <ul>
                <li><Link to="/DoctorCalendar">See your Calander</Link></li>
                <li><Link to="/DoctorAccountInformation">Account Info</Link></li>
                <li><Link to="/Patientlist">Patient information</Link></li>
                <li><Link to="/DoctorRequests">Current Requests</Link></li>
            </ul>
        </>
    );
};


export default DoctorWelcomePage;
