import React from 'react';
import '../css/dashboard1.css'; // Import the CSS file

const AdminDashboard = () => {
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
          <a href="../home/home.html">
            <i className="fa fa-search"></i>
          </a>
        </div>
        <div className="header-right">
          <a href="../home/home.html">
            <i className="fa fa-home"></i>
          </a>
        </div>
      </header>
      {/* End Header */}

      {/* Sidebar */}
      <aside id="sidebar">
        <div>
          <div className="sidebar-title">
            <div className="sidebar-brand">
              <i className="fa fa-heartbeat"></i>
              <span>HealthX</span>
            </div>
            <span className="material-icons-outlined" onClick={closeSidebar}>close</span>
          </div>
  
          <div className="side-link">
            <ul className="sidebar-list">
              <a href="dashboardP.html">
                <li className="sidebar-list-item">
                  <i className="fa fa-dashboard"></i>
                  <span>Dashboard</span>
                </li>
              </a>
              <a href="appointmentP.html">
                <li className="sidebar-list-item">
                  <i className="fa fa-calendar"></i>
                  <span>Appointments</span>
                </li>
              </a>
              <a href="paymentP.html">
                <li className="sidebar-list-item">
                  <i className="fa fa-credit-card"></i>
                  <span>Payment</span>
                </li>
              </a>
            </ul>
          </div>
        </div>
        <a href="../home/loginP.html" className="sidebar-list-item">
          <i className="fa fa-sign-out"></i>
          <span>Logout</span>
        </a>
      </aside>
      {/* End Sidebar */}

      {/* Main */}
      <main className="main-container">
        <div className="main-title">
          <p className="font-weight-bold">APPOINTMENT</p>
          <a href="add-appointmentP.html">Add Appointment</a>
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

export default AdminDashboard;