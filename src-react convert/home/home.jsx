import React from 'react';
import '../css/home.css'; // Import the CSS file

const Home = () => {
  return (
    <div>
      <header>
        <nav>
          <div id="main-logo">
            <h1>HealthX</h1>
            <ul id="categories">
              <li><a href="./">Home</a></li>
              <li><a href="./PoE">Log in</a></li>
              <li><a href="./PoEl">Sign Up</a></li>
            </ul>
          </div>
        </nav>

        <div className="content">
          <h1>Your Wellness Journey Starts Here</h1>
          <p>Being at the clinic feels reassuring, knowing that expert care is just around the corner.<br />The welcoming atmosphere and attentive staff make every visit a positive experience.</p>
          <div>
            <a href="./loginP"><button type="button">PATIENT</button></a>
            <a href="./login"><button type="button">EMPLOYEE</button></a>
          </div>
        </div>
      </header>

      <main id="main">
        <div className="section">
          <img src="../images/doctor.webp" alt="" />
          <div className="con">
            <h1>About Us</h1>
            <hr />
            <br />
            <p>Welcome to HealthX, where compassionate care meets medical excellence. At HealthX, we are dedicated to providing comprehensive healthcare services to our community with a focus on personalized treatment and patient satisfaction.
              With a team of experienced healthcare professionals, including doctors, nurses, and support staff, we strive to create a warm and welcoming environment for all our patients. Our state-of-the-art facilities are equipped with the latest technology to ensure accurate diagnoses and effective treatments across a wide range of medical specialties.
              At HealthX, we understand that each patient is unique, which is why we take the time to listen to your concerns, answer your questions, and develop personalized treatment plans tailored to your individual needs. Whether you're visiting us for a routine check-up, managing a chronic condition, or seeking specialized care, you can trust our team to provide you with the highest quality of care every step of the way.
              Thank you for choosing HealthX for your healthcare needs. We look forward to serving you and your family with compassion, integrity, and excellence.</p>
            <a href="#"><button type="button">Learn More</button></a>
          </div>
        </div>
      </main>

      <div className="bottom">
        <div className="health">
          <div className="appoint">
            <h1>HealthX</h1>
            <h3>24/7</h3>
            <a href="#"><button type="button" className="call">Call Us</button></a>
            <a href="./loginP"><button type="button" className="set">Set Appointment</button></a>
          </div>
          <div className="help">
            <img src="../images/help.webp" alt="" />
          </div>
        </div>
        <footer className="footer">
          <div>
            <h3>About us</h3>
            <ul>
              <li>About</li>
              <li>Blog</li>
              <li>Success Stories</li>
            </ul>
          </div>

          <div>
            <h3>Support</h3>
            <ul>
              <li>FAQ</li>
              <li>Contribute</li>
              <li>Contact us</li>
            </ul>
          </div>

          <div>
            <h3>Guides</h3>
            <ul>
              <li>Community guides</li>
              <li>Installation guides</li>
            </ul>
          </div>

          <div>
            <h3>Legal</h3>
            <ul>
              <li>terms</li>
              <li>Privacy</li>
            </ul>
          </div>
        </footer>
        <hr />
        <small>2024 Done by Dimi</small>
      </div>
    </div>
  );
};

export default Home;