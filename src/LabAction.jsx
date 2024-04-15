import React from 'react';
import './LabAction.css';
import './Lab.css'
//import './Phone.css'
import'./App.js'
import "./HisApp.css";
import "./index.css";
import "./ToDoApp.css"

const LabAction = () => {
    return (
        <div className='wrapper'>
        <h1>LabAction</h1>
            <div>
                <p>
                  <a href='./home'> *Home </a>
                 <br/> <a href='./lab'> *Lab-Assignments</a>
                 <br/> <a href='./Calender'> *Calender </a>
                </p>
            </div>
            
        </div>
            
    );
};
export default LabAction;