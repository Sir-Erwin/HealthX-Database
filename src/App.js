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
          <th>Test_Name</th>
          <th>Ordered_BY</th>
          <th>Result</th>
        </tr>
      </thead>
      
      <tbody>
        {contacts.map((contact)=>(
         <tr>
          <td>{contact.ID}</td>
          <td>{contact.Test_Name}</td>
          <td>{contact.Ordered_BY}</td>
          <td>{contact.Result}</td>
          </tr>
          ))}
         
      </tbody>
    
    </table>
  </div>
};


export default App;
