import React from 'react';
import './PatientLogin.css';
const PatientLogin = () => {
    return (
        <>
        <form action="" className="wrapper">
            <h1>Patient Login</h1>

            {/* Username */}
            <div className="inputBox">
                <input type="text" placeholder='Patient ID' required />
            </div>

            {/* Password */}
            <div className="inputBox">
                <input type="text" placeholder='Password' required />
            </div>

            {/* Remember Me and Forget Me*/}
            <div className="remember-forget">
                <label> <input type="checkbox" /> Remember Me </label>
                <a href='#'> Forgot Password? </a>
            </div>

            {/* Login Button */}
            <button type="submit">Login</button>

            {/* Sign Up */}
            <div>
                <a href='#'>New User? Sign Up</a>
            </div>

        </form>
        </>
    );
}

export default PatientLogin;