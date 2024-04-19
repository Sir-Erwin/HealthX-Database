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
              <li className="sidebar-list-item">
                <a href="dashboardP.html">
                  <i className="fa fa-dashboard"></i>
                  <span>Dashboard</span>
                </a>
              </li>
              <li className="sidebar-list-item">
                <a href="appointmentP.html">
                  <i className="fa fa-calendar"></i>
                  <span>Appointments</span>
                </a>
              </li>
              <li className="sidebar-list-item">
                <a href="paymentP.html">
                  <i className="fa fa-credit-card"></i>
                  <span>Payment</span>
                </a>
              </li>
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
          <p className="font-weight-bold">PAYMENT</p>
        </div>
      </main>
      {/* End Main */}
    </div>
  );
};

export default AdminDashboard;