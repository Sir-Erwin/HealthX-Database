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
              <a href="dashboard.html">
                <li className="sidebar-list-item">
                  <i className="fa fa-dashboard"></i>
                  <span>Dashboard</span>
                </li>
              </a>
              <a href="doctor.html">
                <li className="sidebar-list-item">
                  <i className="fa fa-user-md"></i>
                  <span>Doctors</span>
                </li>
              </a>
              <a href="appointment.html">
                <li className="sidebar-list-item">
                  <i className="fa fa-calendar"></i>
                  <span>Appointments</span>
                </li>
              </a>
              <a href="department.html">
                <li className="sidebar-list-item">
                  <i className="fa fa-building"></i>
                  <span>Department</span>
                </li>
              </a>
              <a href="employee.html">
                <li className="sidebar-list-item">
                  <i className="fa fa-users"></i>
                  <span>Employees</span>
                </li>
              </a>
              <a href="payment.html">
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
            </ul>
          </div>
        </div>
        
        <a href="../home/login.html" className="sidebar-list-item">
          <i className="fa fa-sign-out"></i>
          <span>Logout</span>
        </a>
      </aside>
      {/* End Sidebar */}

      {/* Main */}
      <main className="main-container">
        <div className="main-title">
          <p className="font-weight-bold">DASHBOARD</p>
        </div>

        <div className="main-cards">

          <div className="card">
            <div className="card-inner">
              <p className="text-primary">DOCTORS</p>
              <i className="fa fa-user-md"></i>
            </div>
            <span className="text-primary font-weight-bold">-</span>
          </div>

          <div className="card">
            <div className="card-inner">
              <p className="text-primary">APPOINTMENTS</p>
              <i className="fa fa-calendar"></i>
            </div>
            <span className="text-primary font-weight-bold">-</span>
          </div>

          <div className="card">
            <div className="card-inner">
              <p className="text-primary">EMPLOYEES</p>
              <i className="fa fa-users"></i>
            </div>
            <span className="text-primary font-weight-bold">-</span>
          </div>

          <div className="card">
            <div className="card-inner">
              <p className="text-primary">TREATED</p>
              <i className="fa fa-stethoscope"></i>
            </div>
            <span className="text-primary font-weight-bold">-</span>
          </div>

        </div>
      </main>
      {/* End Main */}
    </div>
  );
};

export default AdminDashboard;