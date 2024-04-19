import React, { useState } from 'react';
import '../css/login.css'; // Import the CSS file

const Login = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [eid, setEid] = useState('');
  const [isFormValid, setIsFormValid] = useState(false);

  const handleEmailChange = (event) => {
    setEmail(event.target.value);
    validateForm();
  };

  const handlePasswordChange = (event) => {
    setPassword(event.target.value);
    validateForm();
  };

  const handleEidChange = (event) => {
    setEid(event.target.value);
    validateForm();
  };

  const validateForm = () => {
    if (email.trim() !== '' && password.trim() !== '' && eid.trim() !== '') {
      setIsFormValid(true);
    } else {
      setIsFormValid(false);
    }
  };

  return (
    <html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>Your Career in Web Development</title>
    <link rel="stylesheet" href="../css/login.css" />
  </head>


<body>
  <header>
    <nav>
      <div id="main-logo">
        
        <h1>HealthX</h1>

        <ul id="categories">
          <li><a href="home.html">Home</a></li>
          <li><a href="login.html">Log in</a></li>
          <li><a href="entry.html">Sign Up</a></li>
        </ul>
      </div>
    </nav>

  </header>
  <div id="login">
    <h1>Login</h1>
    <hr>
      <form action="">
        <div class="inputbox">
          <input type="number" placeholder="EID" maxlength="10" id="eidInput" required/>       
        </div>
        <div class="inputbox">
          <input type="password" placeholder="Password" minlength="8" id="passwordInput" required/>
        </div>
        <div class="inputbox">
        </div>
        <a href="../html-dashboard/dashboard.html"><button type="button" id="loginButton" disabled>Log in</button></a>
        
        <div class="register">
          <p>Don't have an account? <a href="entry.html"> Register</a></p>
        </div>
      </form> 
    </hr>
  </div>
  <script src="./submit.js"></script>
</body>

</html>
  );
};

export default Login;