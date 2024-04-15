// account information of the Doctor
import React, { useState } from 'react';
import './DoctorAccountInformation.css';

const AccountInformation = () =>{
    const [DoctorFName, DoctorMInitial, DoctorLName, DoctorDOB,
    DoctorContact] = useState('');
    const [EID, DoctorGender, DoctorSSN, DoctorType, DoctorSalary,
    DoctorMedicalLicenceNumber] = useState(null);
    return (
        <>
            <h1>Doctor Account Information</h1>
            <li className="list-group-item"> Doctor's First Name: {DoctorFName}</li>
            <li className="list-group-item"> Doctor's Middle Initial: {DoctorMInitial}</li>
            <li className="list-group-item"> Doctor's Last Name: {DoctorLName}</li>
            <li className="list-group-item"> Doctor's ID: {EID}</li>
            <li className="list-group-item"> Doctor's DOB: {DoctorDOB}</li>
            <li className="list-group-item"> Doctor's Contact: {DoctorContact}</li>
            <li className="list-group-item"> Doctor's SSN: {DoctorSSN}</li>
            <li className="list-group-item"> Doctor's Salery: {DoctorSalary}</li>
            <li className="list-group-item"> Doctor's Type: {DoctorType}</li>
            <li className="list-group-item"> Doctor's Gender: {DoctorGender}</li>
            <li className="list-group-item"> Doctor's Medical Licence Number: {DoctorMedicalLicenceNumber}</li>   
        </>
    );
};

export default AccountInformation;