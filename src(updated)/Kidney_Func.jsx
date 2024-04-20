import React,{useState} from 'react';
import "./Kidney_Func.css";


function App(){
    const data =
    [
      {
        "TestName":"Sodium",
        "Result": "142",
        "Unit": "mmol/L",
        "Reference": "135-145"
      },
      {
          "TestName":"Potassium",
          "Result": "4.4",
          "Unit": "mmol/L",
          "Reference": "3.5-5.5"
          
          
      },
      {
          "TestName":"Chloride",
          "Result": "80",
          "Unit": "mmol/L",
          "Reference": "95-110"
          
      },
      {
          "TestName":"Bicarbonate",
          "Result": "28",
          "Unit": "mmol/L",
          "Reference": "20-32"
          
      },
      {
          "TestName": "Urea",
          "Result": "5.8",
          "Unit": "mmol/L",
          "Reference": "3.0-8.0"
          
      },
      {
       "TestName": "Creatinine",
        "Result": "85",
        "Unit": "umol/L",
        "Reference": "60-110"
      },
      {
        "TestName": "eGFR",
        "Result": ">90",
        "Unit": "",
        "Reference": ""
      },
      {
        "TestName": "Anion Gap",
        "Result": "18",
        "Unit": "mmol/L",
        "Reference": "10-20"
      },
      {
        "TestName": "Bilirubin",
        "Result": "17",
        "Unit": "umol/L",
        "Reference": "4-20"
      }
    ]
  //const[contacts]= useState(data);
  const handleClick = () => {
    console.log('save');
}
  const handleClickAgain = () => {
   console.log('complete');
}

  return (
  <div className='app-container'>
  <h1>RID: 19372</h1>
     <h2>Kidney_Func-Test</h2>        
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
        {data.map((contact)=>(
         <tr>
          <td>{contact.TestName}</td>
          <td>{contact.Result}</td>
          <td>{contact.Unit}</td>
          <td>{contact.Reference}</td>
          </tr>
        ))}
      </tbody>
      </table>
    <button onClick={handleClick}>SAVE</button>
    <button onClick={()=>handleClickAgain()}>COMPLETE</button>

  </div>
  )
};


export default App;