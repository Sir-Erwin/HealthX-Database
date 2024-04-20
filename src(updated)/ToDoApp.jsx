import React,{useState} from 'react';
import "./ToDoApp.css";

function App(){
const contacts =
  [
    {
      "RID": 17830,
      "Type": "Blood-Test",
      "Result": "view",
      "link": "./bloodtest",
      "Date": "07-20-2021"
    },
    {
        "RID": 19372,
        "Type": "Kidney_Func-Test_",
        "Result": "view",
        "link": "./Kidney_Func",
        "Date": "01-30-2020"
    },
    {
        "RID": 12943,
        "Type": "Pathological-Test",
        "Result": "view",
        "link": "./pathologitest",
        "Date": "05-30-2019"
    },
    {
        "RID": 19473,
        "Type": "Liver Enzyme-Test",
        "Result": "view",
        "link": "./livereny",
        "Date": "08-09-2023"
    },
    {
      "RID": 169483,
      "Type": "X-ray",
      "Result": "view",
      "link": "./xray",
      "Date": "08-09-2023"
  }
  ]
  
  
 // const[contacts]= useState(data);

  return (
  <div className='app-container'>
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
          <td>{contact.Type}</td>
          <td><a href={contact.link}>{contact.Result}</a></td>
          <td>{contact.Date}</td>
          </tr>
          ))}
         
      </tbody>
    
    </table>
  </div>

  )
  }
export default App;