import React,{useState} from 'react';
import "./HisApp.css";
import data from "./mock-data.json";

const History = ()=> {
  const[contacts]= useState(data);

  return <div className='app-container'>
    <table>
      <thead>
        <tr>
          <th>RID</th>
          <th>Test-Type</th>
          <th>Result</th>
          <th>Date</th>
        </tr>
      </thead>
      
      <tbody>
        {contacts.map((contact)=>(
         <tr>
          <td>{contact.RID}</td>
          <td>{contact.Test}</td>
          <td><a href={contact.link}>{contact.Result}</a></td>
          <td>{contact.Date}</td>
          </tr>
          ))}
         
      </tbody>
    
    </table>
  </div>
};


export default History;