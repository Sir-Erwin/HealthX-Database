import React,{useState} from 'react';
import "./BloodTest.css";

function App(){
    const contacts =
    [
        {
           "TestType": "RBC Count",
           "Result":    10.56,
           "Units":   "10^3/ul",
           "Reference": "3.5 - 10.5"
        },
        {
           "TestType": "WBC Count",
           "Result":   4.65,
           "Units":   "10^6/ul",
           "Reference": "3.93 - 5.22"
            
        },
        {
           "TestType": "Platelet Count",
           "Result":    201,
           "Units":    "10^3/ul",
           "Reference":  "140 - 450"  
        },
        {
            "TestType": "MCV (Mean Corpuscular Volume)",
            "Result":    81.7,
            "Units":    "fL",
            "Reference": "81.6 - 98.3" 
        },
        {
            "TestType": "Hemoglobin",
            "Result":   12.9,
            "Units":    "g/dL",
            "Reference": "12.0 - 15.5"
        },
        {
            "TestType": "Hematocrit",
            "Result":   38.0,
            "Units":    "%",
            "Reference": "34.9 - 44.5"
        },
        {
            "TestType": "Ammonia Test",
            "Result":   55,
            "Units":    "ug/dL",
            "Reference": "39 - 90"
        }
      ]
  //const[contacts]= useState(data);

  return (
  <div className='app-container'>
  <h1>RID: 17830</h1>
     <h2>Blood-Test Result</h2>        
     <table>
      <thead>
        <tr>
          <th>Test Type</th>
          <th>Result</th>
          <th>Units</th>
          <th>Reference</th>
        </tr>
      </thead>
      <tbody>
        {contacts.map((contact)=>(
         <tr>
          <td>{contact.TestType}</td>
          <td>{contact.Result}</td>
          <td>{contact.Units}</td>
          <td>{contact.Reference}</td>
          </tr>
          ))}
         
      </tbody>
    
    </table>
    
  </div>
  )
};


export default App;