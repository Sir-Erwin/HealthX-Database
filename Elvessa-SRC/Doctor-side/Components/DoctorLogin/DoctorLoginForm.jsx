// Basic login form, will make visually appealing later 
import React from 'react';
import './DoctorLoginForm.css';

const LoginForm = ({ handleLogin }) => {
    const handleSubmit = (e) => {
        e.preventDefault();
        // Call handleLogin function passed from parent component
        handleLogin();
    };

    return (
        <div className='wrapper'>
            <form onSubmit={handleSubmit}>
                <h1>Doctor Login</h1>
                <div className="input-box">
                    <input type="text" placeholder='EID' required />
                </div>
                <div className="input-box">
                    <input type="password" placeholder='Password' required />
                </div>

                <div className="remember-forgot">
                    <label><input type="checkbox" />Remember me</label>
                    <a href="#">Forgot Password?</a>
                </div>

                <button type="submit">Login</button>
                <div className="register-link">
                    <p>Don't already have an account? <a href="#">Resister</a></p>
                </div>
            </form>
        </div>
    );
};

export default LoginForm;
