import './App.css';
import './index.css';
import "./HisApp.css";
import "./ToDoApp.css"
import "./Kidney_Func.css"
import "./PathologicalTest.css"
import "./LiverEny.css"
import History from './History'
import ToDo from './ToDoApp'
import BloodTest from './BloodTest'
import  Kidney_Func from './Kidney_Func'
import PathologicalTest from './PathologicalTest'
import LiverEny from './LiverEny'
import XRay from './XRay'
import CompleteBloodTest from './CompleteBloodTest'
import CompletePathoTest from './CompletePathoTest'

import {BrowserRouter, Routes, Route, useNavigate  } from 'react-router-dom';
import Lab from './Lab';



function Router(){
  return(
    <BrowserRouter>
          <Routes> 
            <Route path="/" element={<Lab/>}></Route>
            <Route path="/hist" element={<History/>}></Route>
            <Route path="/todo" element={<ToDo/>}></Route>
            <Route path="/bloodtest" element={<BloodTest/>}></Route>
            <Route path="/Kidney_Func" element={<Kidney_Func/>}></Route>
            <Route path="/pathologitest" element={<PathologicalTest/>}></Route>
            <Route path="/livereny" element={<LiverEny/>}></Route>
            <Route path="/xray" element={<XRay/>}></Route>
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

       </ul>
      </div>
  


const App=()=> {
  return (
    <Router></Router>
  );
}

export default App;
