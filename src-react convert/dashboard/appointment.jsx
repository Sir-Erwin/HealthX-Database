import React from 'react';
import '../css/dashboard1.css'; // Import the CSS file

const Appointment = () => {
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
          <a href="report.html">
            <li className="sidebar-list-item">
              <i className="fa fa-file"></i>
              <span>Reports</span>
            </li>
          </a>
          <a href="../home/login.html">
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
        <div className="main-title">
          <p className="font-weight-bold">APPOINTMENT</p>
          <a href="./add-appointment">Add Appointment</a>
        </div>
        <div className="data">
          <div className="table-info">
            <table>
              <thead>
                <tr>
                  <th>Patient's Name</th>
                  <th>Patient's Email</th>
                  <th>Gender</th>
                  <th>Department</th>
                  <th>Appointment Date</th>
                  <th>Appointment Time</th>
                  <th>Patient's Phone</th>
                </tr>
              </thead>
              {/* Add table body content here */}
            </table>
          </div>
        </div>
      </main>
      {/* End Main */}
    </div>
  );
};

export default Appointment;