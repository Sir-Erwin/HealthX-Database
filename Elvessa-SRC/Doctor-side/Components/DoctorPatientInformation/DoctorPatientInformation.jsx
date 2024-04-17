import React, { useState } from "react";
import { Link } from "react-router-dom";
import './DoctorPatientInformation.css';

const DoctorPatientInformation = ({ location }) => {
  // Fake patient data for demonstration
  const fakePatientData = [
    {
      PatientID: 1000,
      PatientName: "Joe",
      PatientDOB: "1990-01-01",
      PatientPhoneNum: "123-456-7890",
      PatientHaircolor: "Brown",
      PatientEyeColor: "Blue",
      PatientEmail: "joe@example.com",
      PatientMailingAddress: "123 Main St, City, Country",
      PatientWeight: "180 lbs",
      PatientHeight: "6'0\"",
      PCP_EID: "pcp123",
      PatientBloodType: "O+",
      PatietntGender: "Male"
    }
  ];

  // Extract patient data from location state
  const selectedPatient = location.state ? location.state.patientData : null;

  // State to hold the selected patient data
  const [patientData, setPatientData] = useState(selectedPatient);

  return (
    <>
      <h1>Patient Information</h1>
      {/* Display patient information if available */}
      {patientData ? (
        <div>
          <ul className="list-group">
            {/* Display patient information */}
            <li className="list-group-item">Patient's Name: {patientData.PatientName}</li>
            <li className="list-group-item">Patient's ID: {patientData.PatientID}</li>
            <li className="list-group-item">Patient's DOB: {patientData.PatientDOB}</li>
            <li className="list-group-item">Patient's Phone Number: {patientData.PatientPhoneNum}</li>
            <li className="list-group-item">Patient's Hair color: {patientData.PatientHaircolor}</li>
            <li className="list-group-item">Patient's Eye Color: {patientData.PatientEyeColor}</li>
            <li className="list-group-item">Patient's Email: {patientData.PatientEmail}</li>
            <li className="list-group-item">Patient's Mailing address: {patientData.PatientMailingAddress}</li>
            <li className="list-group-item">Patient's Weight: {patientData.PatientWeight}</li>
            <li className="list-group-item">Patient's Height: {patientData.PatientHeight}</li>
            <li className="list-group-item">Patient's PCP_EID: {patientData.PCP_EID}</li>
            <li className="list-group-item">Patient's Blood Type: {patientData.PatientBloodType}</li>
            <li className="list-group-item">Patient's Gender: {patientData.PatietntGender}</li>
          </ul>
        </div>
      ) : (
        <>
          {/* Display patient list */}
          <h3>Patient List</h3>
          <ul>
            {fakePatientData.map(patient => (
              <li key={patient.PatientID}>
                <Link to={{ pathname: "/Patientlist", state: { patientData: patient } }}>
                  {patient.PatientName}
                </Link>
              </li>
            ))}
          </ul>
          <p>Please select a patient from the list to view their information.</p>
        </>
      )}

      {/* Back link to go back to the patient list */}
      <Link to="/Patientlist">Back to Patient List</Link>
    </>
  );
};

export default DoctorPatientInformation;
