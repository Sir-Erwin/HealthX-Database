import React, {useState} from "react";
import { BrowserRouter as Router, Route, Switch, Redirect } from 'react-router-dom';
import LoginForm from './Components/Login_Page/DoctorLoginForm.jsx';
import PatientInformation from './Components/PatientInformation/DoctorPatientInformation.jsx';
import DoctorCalendar from './Components/Calendar/DoctorCalendar.jsx';
import AccountInformation from './Components/AccountInformation/DoctorAccountInformation.jsx'
import DoctorWelcomePage from './Components/WelcomePage/DoctorWelcomePage.jsx'
import Requests from './Components/Requests/DoctorRequests.jsx';
import Patient from "./Components/PatientInformation/PI.jsx";

function App(){

    const [isLoggedIn, setIsLoggedIn] = useState(false);

    // Function to handle login
    const handleLogin = () => {
        // Perform login logic here
        // For simplicity, just setting isLoggedIn to true
        setIsLoggedIn(true);
    };


    return (
        <Router>
            <div>
                <Switch>
                <Route exact path="/">
                        {isLoggedIn ? <Redirect to="/DoctorWelcome" /> : <LoginForm handleLogin={handleLogin} />}
                    </Route>
                    <Route path="/DoctorWelcome" exact component={DoctorWelcomePage} />
                    <Route path="/DoctorCalendar" component={DoctorCalendar} />
                    <Route path="/DoctorAccountInformation" component={AccountInformation} />
                    <Route path="/Patientlist" component={Patient} />
                    <Route path="/DoctorRequests" component={Requests} />
                    <Route path="/DoctorPatientInformation" component={PatientInformation} />
                </Switch>
            </div>
        </Router>
    );
}

export default App;
