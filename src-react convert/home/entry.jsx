import React from 'react';
import '../css/entry.css'; // Import the CSS file

const Entry = () => {
  return (
    <div>
      <header>
        <nav>
          <div id="main-logo">
            <h1>HealthX</h1>
            <ul id="categories">
              <li><a href="./home">Home</a></li>
              <li><a href="./login">Log in</a></li>
              <li><a href="./entry">Sign Up</a></li>
            </ul>
          </div>
        </nav>
      </header>

      <div id="sign-up">
        <h1>Registration</h1>
        <hr />
        <form action="" className="info" id="emailFrom">
          <div className="input-box">
            <input type="text" name="First Name" id="fname" placeholder="First Name" required />
            <br />
            <input type="text" name="Middle Name" id="mname" placeholder="Middle Initial" maxLength="1" required />
            <br />
          </div>

          <div className="input-box">
            <input type="text" name="Last Name" id="lname" placeholder="Last Name" required />
            <br />
            <input type="email" id="email" name="email" placeholder="Email" required />
            <br />
          </div>

          <div className="input-box">
            <input type="password" placeholder="Password" required />
            <br />
            <input type="tel" id="number" placeholder="Phone Number" pattern="[0-9]{3}[0-9]{3}[0-9]{4}" required />
            <br />
          </div>

          <div className="input-box">
            <select name="" id="">
              <option value="" disabled selected hidden>Job Role</option>
              <option value="Male">Nurse</option>
              <option value="Female">Doctor</option>
              <option value="Female">Front Desk</option>
              <option value="Female">Lab Tech</option>
            </select>
            <br />
            <input type="password" id="social" placeholder="Social Security Number" pattern="[0-9]{3}[0-9]{2}[0-9]{4}" required />
            <br />
          </div>

          <div className="input-box" id="gender">
            <select name="" id="">
              <option value="" disabled selected hidden>Gender</option>
              <option value="Male">Male</option>
              <option value="Female">Female</option>
            </select>
          </div>
          <a href="./login"><button type="button">Sign Up</button></a>
        </form>
        <p id="message"></p>
      </div>
    </div>
  );
};

export default Entry;