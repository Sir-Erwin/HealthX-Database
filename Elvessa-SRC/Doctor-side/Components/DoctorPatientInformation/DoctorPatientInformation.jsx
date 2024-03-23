// file to see the patient information

import React, { useState } from "react";
import './PatientInformation.css';

const PatientInformation = () =>{

    const [PatientName, PatientID, PatientDOB, PatientPhoneNum, PatientEyeColor, 
    PatientHaircolor,PatientEmail, PatientMailingAddress, PatientBloodType] = useState('');
    const [PatientWeight, PatientHeight, PCP_EID] = useState(int);
    return (
        <>
            <h1>Patient Information</h1>
            <li className="list-group-item">Patient Name: {PatientName}</li>
            <li className="list-group-item">Patient ID: {PatientID}</li>
            <li className="list-group-item">Patient DOB: {PatientDOB}</li>
            <li className="list-group-item">Patient Phone Number: {PatientPhoneNum}</li>
            <li className="list-group-item">Patient Hair color: {PatientHaircolorHaircolor}</li>
            <li className="list-group-item">Patient Eye Color: {PatientEyeColor}</li>
            <li className="list-group-item">Patient Email: {PatientEmail}</li>
            <li className="list-group-item">Patient Mailing address: {PatientMailingAddress}</li>
            <li className="list-group-item">Patient Weight: {PatientWeight}</li>
            <li className="list-group-item">Patient Height: {PatientHeight}</li>
            <li className="list-group-item">Patient PCP_EID: {PCP_EID}</li>
            <li className="list-group-item">Patient Blood Type: {PatientBloodType}</li> 
        </>
    )
}


export default PatientInformation;