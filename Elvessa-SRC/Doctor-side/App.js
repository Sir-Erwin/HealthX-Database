import React from "react";
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import LoginForm from './Components/Login_Page/DoctorLoginForm.jsx';
import PatientInformation from './Components/PatientInformation/DoctorPatientInformation.jsx';
import DoctorCalendar from './Components/Calendar/DoctorCalendar.jsx';
import AccountInformation from './Components/AccountInformation/DoctorAccountInformation.jsx'
import DoctorWelcomePage from './Components/WelcomePage/DoctorWelcomePage.jsx'

function App(){

    return (
        <Router>
            <div>
                <Switch>
                    <Route exact path="/" render={() => <LoginForm />} />
                    <Route exact path="/welcome" render={() => <DoctorWelcomePage />} />
                    <Route path="/calendar" render={() => <DoctorCalendar />} />
                    <Route path="/account" render={() => <AccountInformation />} />
                    <Route path="/patient-info" render={() => <PatientInformation />} />
                </Switch>
            </div>
        </Router>
    );
}

export default App;
