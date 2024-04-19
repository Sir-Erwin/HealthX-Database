import React from 'react';
import '../css/dashboard1.css'; // Import the CSS file

const AddAppointment = () => {
  const openSidebar = () => {
    // Your logic for opening the sidebar
  };

  const closeSidebar = () => {
    // Your logic for closing the sidebar
  };

  return (
    <div className="grid-container">
      {/* Header */}
      <header className="header">
        <div className="menu-icon" onClick={openSidebar}>
          <span className="material-icons-outlined">menu</span>
        </div>
        <div className="header-left">
          <a href="../home/home">
            <i className="fa fa-search"></i>
          </a>
        </div>
        <div className="header-right">
          <a href="../home/home">
            <i className="fa fa-home"></i>
          </a>
        </div>
      </header>
      {/* End Header */}

      {/* Sidebar */}
      <aside id="sidebar">
        <div className="sidebar-title">
          <div className="sidebar-brand">
            <i className="fa fa-heartbeat"></i>
            <span>HealthX</span>
          </div>
          <span className="material-icons-outlined" onClick={closeSidebar}>close</span>
        </div>

        <ul className="sidebar-list">
          <a href="./dashboard">
            <li className="sidebar-list-item">
              <i className="fa fa-dashboard"></i>
              <span>Dashboard</span>
            </li>
          </a>
          <a href="./doctor">
            <li className="sidebar-list-item">
              <i className="fa fa-user-md"></i>
              <span>Doctors</span>
            </li>
          </a>
          <a href="./appointment">
            <li className="sidebar-list-item">
              <i className="fa fa-calendar"></i>
              <span>Appointments</span>
            </li>
          </a>
          <a href="./department">
            <li className="sidebar-list-item">
              <i className="fa fa-building"></i>
              <span>Department</span>
            </li>
          </a>
          <a href="./employee">
            <li className="sidebar-list-item">
              <i className="fa fa-users"></i>
              <span>Employees</span>
            </li>
          </a>
          <a href="./payment">
            <li className="sidebar-list-item">
              <i className="fa fa-credit-card"></i>
              <span>Payment</span>
            </li>
          </a>
          <a href="./report">
            <li className="sidebar-list-item">
              <i className="fa fa-file"></i>
              <span>Reports</span>
            </li>
          </a>
          <a href="../home/login">
            <li className="sidebar-list-item" id="logout">
              <i className="fa fa-sign-out"></i>
              <span>Logout</span>
            </li>
          </a>
        </ul>
      </aside>
      {/* End Sidebar */}

      {/* Main */}
      <main className="main-container">
        <h2>Add Appointment</h2>
        <form action="" className="info" id="emailFrom">
          <div className="input-box">
            <input type="text" name="First Name" id="fname" placeholder="Patient's Name" required />
            <br />
          </div>

          <div className="input-box">
            <input type="date" name="Date" placeholder="YYYY-MM-DD" required />
            <br />
            <input type="email" id="email" name="email" placeholder="Patient's Email" required />
            <br />
          </div>

          <div className="input-box">
            <input type="time" placeholder="Time" required />
            <br />
            <input type="tel" id="number" placeholder="Patient's Phone Number" pattern="[0-9]{3}[0-9]{3}[0-9]{4}" required />
            <br />
          </div>

          <div className="dropdown">
            <div className="input-box">
              <select name="" id="">
                <option value="" disabled selected hidden>Department</option>
                <option>Dermatologist</option>
                <option>Neurologist</option>
                <option>Cardiologist</option>
                <option>Ophthalmologist</option>
                <option>Orthopedic Surgery</option>
                <option>Dentist</option>
              </select>
              <select name="" id="">
                <option value="" disabled selected hidden>Gender</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
              </select>
              <br />
            </div>
          </div>

          <a href="./login"><button type="button">CREATE APPOINTMENT</button></a>
        </form>
      </main>
      {/* End Main */}
    </div>
  );
};

export default AddAppointment;