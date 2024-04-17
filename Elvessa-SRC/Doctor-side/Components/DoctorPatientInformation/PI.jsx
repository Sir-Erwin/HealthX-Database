import React from 'react';
import { Link } from 'react-router-dom';
import './PI.css';

function Patient() {
  const contacts = [
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
      PatietntGender: "Male",
      PatientInformation: "View",
      link: "/DoctorPatientInformation",
    },
  ];

  return (
    <div className='app-container'>
      <table>
        <thead>
          <tr>
            <th>PatientID</th>
            <th>PatientName</th>
            <th>PatientInformation</th>
          </tr>
        </thead>

        <tbody>
          {contacts.map((contact) => (
            <tr key={contact.PatientID}>
              <td>{contact.PatientID}</td>
              <td>{contact.PatientName}</td>
              {/* Use Link component from react-router-dom to navigate */}
              <td><Link to={{ pathname: contact.link, state: { patientData: contact } }}>{contact.PatientInformation}</Link></td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}

export default Patient;
