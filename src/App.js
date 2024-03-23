import React,{useState} from 'react';
import "./App.css";
import data from "./mock-data.json";

const App = ()=> {
  const[contacts]= useState(data);

  return <div className='app-container'>
    <table>
      <thead>
        <tr>
          <th>ID</th>
          <th>First_Name</th>
          <th>Last_Name</th>
          <th>Date</th>
        </tr>
      </thead>
      
      <tbody>
        {contacts.map((contact)=>(
         <tr>
          <td>{contact.ID}</td>
          <td>{contact.First_Name}</td>
          <td>{contact.Last_Name}</td>
          <td>{contact.Date}</td>
          </tr>
          ))}
         
      </tbody>
    
    </table>
  </div>
};


export default App;
