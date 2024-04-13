import React,{useState} from 'react';
import "./PathologicalTest.css";
import data from "./mock-patho.json";
import note from "./mock-path.json";

const App = ()=> {
  const[contacts]= useState(data,note);

  const handleClick = () => {
    console.log('save');
}
  const handleClickAgain = () => {
   console.log('complete');
}

  return <div className='app-container'>
  <h1>RID:17830</h1>
     
     <h2> Kidney Funtion</h2>        
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
      <h2> Liver Funtion</h2> 
      <table>
      <tr>
          <th>Test Type</th>
          <th>Result</th>
          <th>Units</th>
          <th>Reference</th>
        </tr>
        <tbody>
        {note.map((con)=>(
         <tr>
          <td>{con.Testname}</td>
          <td>{con.Report}</td>
          <td>{con.Units}</td>
          <td>{con.Ref}</td>
          </tr>
        ))}
      </tbody>
    </table>
    
        <button onClick={handleClick}>SAVE</button>
        <button onClick={()=>handleClickAgain()}>COMPLETE</button>
  </div>

};


export default App;