import React, { useState } from 'react';
import './DoctorRequests.css';

const DoctorRequests = () => {
    // State to hold prescription requests
    const [requests, setRequests] = useState([
        { id: 1, patientName: 'John Doe', medication: 'Aspirin', status: 'Pending', date: new Date() },
        { id: 2, patientName: 'Jane Smith', medication: 'Antibiotics', status: 'Pending', date: new Date() },
        { id: 3, patientName: 'Michael Johnson', medication: 'Painkillers', status: 'Pending', date: new Date() }
    ]);

    // Function to handle allowing a prescription request
    const handleAllow = (id) => {
        setRequests(prevRequests => {
            return prevRequests.map(request => {
                if (request.id === id) {
                    return { ...request, status: 'Allowed' };
                }
                return request;
            });
        });
    };

    // Function to handle denying a prescription request
    const handleDeny = (id) => {
        setRequests(prevRequests => {
            return prevRequests.map(request => {
                if (request.id === id) {
                    return { ...request, status: 'Denied' };
                }
                return request;
            });
        });
    };

    // Function to handle removing a prescription request
    const handleRemove = (id) => {
        setRequests(prevRequests => prevRequests.filter(request => request.id !== id));
    };

    return (
        <div className="doctor-requests">
            <h2>Prescription Requests</h2>
            <ul>
                {requests.map(request => (
                    <li key={request.id}>
                        <div>
                            <strong>Patient:</strong> {request.patientName}
                        </div>
                        <div>
                            <strong>Medication:</strong> {request.medication}
                        </div>
                        <div>
                            <strong>Date:</strong> {request.date.toLocaleDateString()} {/* Display date when the request was made */}
                        </div>
                        <div>
                            <strong>Status:</strong> {request.status}
                        </div>
                        <div>
                            {request.status === 'Pending' && (
                                <>
                                    <button onClick={() => handleAllow(request.id)}>Allow</button>
                                    <button onClick={() => handleDeny(request.id)}>Deny</button>
                                </>
                            )}
                            {/* Display remove button for allowed or denied requests */}
                            {(request.status === 'Allowed' || request.status === 'Denied') && (
                                <button onClick={() => handleRemove(request.id)}>Remove</button>
                            )}
                        </div>
                    </li>
                ))}
            </ul>
        </div>
    );
};

export default DoctorRequests;
