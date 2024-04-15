import './App.css';
import './index.css';
import "./HisApp.css";
import "./ToDoApp.css"
import "./CovidAnti.css"
import "./PathologicalTest.css"
import "./LiverEny.css"
import Home from './Home'; 
import LabAction from './LabAction';
import History from './History'
import Calender from './Calender';
import ToDo from './ToDoApp'
import BloodTest from './BloodTest'
import CovidAnti from './CovidAnti'
import PathologicalTest from './PathologicalTest'
import LiverEny from './LiverEny'
import CompleteBloodTest from './CompleteBloodTest'
import CompletePathoTest from './CompletePathoTest'

import {BrowserRouter, Routes, Route, useNavigate  } from 'react-router-dom';
import Lab from './Lab';



function Router(){
  return(
    <BrowserRouter>
          <Routes> 
            <Route path="/" element={<LabAction/>}></Route> 
            <Route path="/lab" element={<Lab/>}></Route>
            <Route path="/home" element={<Home/>}></Route>
            <Route path="/calender" element={<Calender/>}></Route>
            <Route path="/hist" element={<History/>}></Route>
            <Route path="/todo" element={<ToDo/>}></Route>
            <Route path="/bloodtest" element={<BloodTest/>}></Route>
            <Route path="/covidanti" element={<CovidAnti/>}></Route>
            <Route path="/pathologitest" element={<PathologicalTest/>}></Route>
            <Route path="/livereny" element={<LiverEny/>}></Route>
            <Route path="/completebloodtest" element={<CompleteBloodTest/>}></Route>
            <Route path="/completepathotest" element={<CompletePathoTest/>}></Route>
          </Routes>
      </BrowserRouter>
  );
}

      <div className='nav__menu'>
       <ul className='nav__list'>
       <li className='nav__item'>
          </li>
          <li className='nav__item'>
            <a href='./Home'className='nav__link'>Home 
            </a>
          </li>
          <li className='nav__item'>
            <a href='./Calender'className='nav__link'>Calender
            </a>
          </li>
       </ul>
      </div>
  


const App=()=> {
  return (
    <Router></Router>
  );
}

export default App;
