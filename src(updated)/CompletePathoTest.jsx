import React,{useState} from 'react';
import "./PathologicalTest.css";


const App = ()=> {
  const contacts = 
  [
    {
      "Variables":"Temperature",
      "Range": "38.3(36.1-40.6)",
      "PValue": "0.050",
    },
    {
      "Variables":"Systolic Blood Pressure",
      "Range": "112(76-146)",
      "PValue": "0.11",
        
        
    },
    {
      "Variables":"Pulse/Mins",
      "Range": "91(60-133)",
      "PValue": "0.30",
        
    },
    {
      "Variables":"Hematocrite",
      "Range": "43.8(8-383)",
      "PValue": "0.34",
        
    },
    {
      "Variables":"Platelet Count",
      "Range": "128(1-15.3)",
      "PValue": "0.046",
        
    },
    {
      "Variables":"Total Leukocyte Count",
      "Range": "3.2",
      "PValue": "0.55",
    }
  ]

  return <div className='app-container'>
  <h1>RID:17830</h1>
     
     <h2>Dengue Pathological-Test</h2>        
     <table>
      <thead>
        <tr>
          <th>Variables</th>
          <th>Median(Range)</th>
          <th>P-Value</th>
        </tr>
      </thead>
      <tbody>
        {contacts.map((contact)=>(
         <tr>
          <td>{contact.Variables}</td>
          <td>{contact.Range}</td>
          <td>{contact.PValue}</td>
          </tr>
        ))}
      </tbody>
      </table>
      
  </div>

};


export default App;
