//import logo from './logo.svg';
import './App.css';
import Home from './home/home';
import Entry from './home/entry';
import EntryP from './home/entryP';
import Login from './home/login';
import LoginP from './home/loginP';
import PoE from './home/PoE';
import AddApp from './dashboard/addApp';
import AddAppP from './dashboard/addAppP';
import Employees from './dashboard/employee';
import AddDoc from './dashboard/addDoc';
import AddEmp from './dashboard/addEmp';
import Appointments from './dashboard/appointment';

import {BrowserRouter, Routes, Route, useNavigate  } from 'react-router-dom';
const App=()=> {
  return (
    <BrowserRouter>
    <Routes> 
      <Route path="/" element={<Home/>}></Route>
      <Route path="./home" element={<Home/>}></Route>
      <Route path="./entry" element={<Entry/>}></Route>
      <Route path="./entryP" element={<EntryP/>}></Route>
      <Route path="./login" element={<h1> You're Me </h1>}></Route>
      <Route path="./loginP" element={<LoginP/>}></Route>
      <Route path="./PoE" element={<PoE/>}></Route>
      <Route path="./add-appointment" element={<AddApp/>}></Route>
      <Route path="./add-appointmentP" element={<AddAppP/>}></Route>
      <Route path="./employee" element={<Employees/>}></Route>
      <Route path="./addDoc" element={<AddDoc/>}></Route>
      <Route path="./addEmp" element={<AddEmp/>}></Route>
      <Route path="./appointment" element={<Appointments/>}></Route>
     
    </Routes>
</BrowserRouter>
  );
}

export default App;
