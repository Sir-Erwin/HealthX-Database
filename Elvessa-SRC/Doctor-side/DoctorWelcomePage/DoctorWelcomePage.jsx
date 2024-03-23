// page doctor will see when they log in
import React from 'react';

const DoctorWelcomePage = () =>{
    const [doctorName, setDoctorName] = useState('');

    return (
       <div>
        <h1>Welcome {doctorName}!</h1>
        
       </div>
    )
}


export default DoctorWelcomePage;