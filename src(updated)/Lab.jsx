import React from 'react';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faClipboardList } from '@fortawesome/free-solid-svg-icons';
import { faBookMedical } from '@fortawesome/free-solid-svg-icons';
import './Lab.css';
import "./HisApp.css";
import "./ToDoApp.css"

const Lab = () => {
    return (
            
      <section className ='lab-action container section'>
      <div className ='action__container grid'>
         <h2>Lab-Work</h2>
         <ul>
         <div className='item'>
         <FontAwesomeIcon icon={faClipboardList} />
           <li ><a href='./todo'>TO-DO </a></li>
          </div>
         
          <div className ='item'>
          <FontAwesomeIcon icon={faBookMedical} />
           <li ><a href='./hist'>HISTORY </a></li>
          </div>
          </ul>
      </div>
      
  </section>
      
            
    );
};
export default Lab;