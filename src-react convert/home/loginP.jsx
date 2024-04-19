import React, { useState } from 'react';
import '../css/login.css'; // Import the CSS file

const LoginP = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [isFormValid, setIsFormValid] = useState(false);

  const handleEmailChange = (event) => {
    setEmail(event.target.value);
    validateForm();
  };

  const handlePasswordChange = (event) => {
    setPassword(event.target.value);
    validateForm();
  };

  const validateForm = () => {
    if (email.trim() !== '' && password.trim() !== '') {
      setIsFormValid(true);
    } else {
      setIsFormValid(false);
    }
  };

  return (
    <div>
      <header>
        <nav>
          <div id="main-logo">
            <h1>HealthX</h1>
            <ul id="categories">
              <li><a href="./home">Home</a></li>
              <li><a href="./loginP">Log in</a></li>
              <li><a href="./entryP">Sign Up</a></li>
            </ul>
          </div>
        </nav>
      </header>

      <div id="login">
        <h1>Login</h1>
        <hr />
        <form action="">
          <div className="inputbox">
            <input type="email" placeholder="Email" id="emailInput" value={email} onChange={handleEmailChange} required />
          </div>

          <div className="inputbox">
            <input type="password" placeholder="Password" minLength="8" id="passwordInput" value={password} onChange={handlePasswordChange} required />
          </div>
          <a href="../dashboard/dashboardP"><button type="button" id="loginButton" disabled={!isFormValid}>Log in</button></a>

          <div className="register">
            <p>Don't have an account? <a href="./entryP">Register</a></p>
          </div>
        </form>
      </div>
    </div>
  );
};

export default LoginP;