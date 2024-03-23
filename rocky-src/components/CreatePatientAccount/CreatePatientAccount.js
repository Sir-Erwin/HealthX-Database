import React from 'react';
import './CreatePatientAccount.css';

const CreatePatientAccount = () => {
    return (
        <>
        <h1>Create an Account</h1>

        <form>
            <label for="fname">First Name</label>
            <input type="text" id="fname" name="First Name" required></input>

            <label for="mname">Middle Name</label>
            <input type="text" id="mname" name="Middle Name"></input>

            <label for="lname">Last Name</label>
            <input type="text" id="lname" name="Last Name" required></input>
            <br /><br />


            <label for="addy">Address</label>
            <input type="text" id="fname" name="addy" required></input>

            <label for="pnum">Phone Number</label>
            <input type="text" id="pnum" name="Phone Number" required></input>
            <br /><br />

            <label for="email">Email Adress</label>
            <input type="text" id="email" required></input>
            <br /><br />

            <label for="dob">Date of Birth</label>
            <input type="text" id="dob" name="Date of Birth" required></input>

            <label for="ssn">Social Security Number</label>
            <input type="input" id="ssn" required></input>
            <br /><br />

            <input type="submit" value="Create Account"></input>
        </form>
        </>
    );
}

export default CreatePatientAccount;