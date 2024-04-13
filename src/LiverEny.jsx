import React,{useState} from 'react';
import "./LiverEny.css";
import data from "./mock-LiverEny.json";

const App = ()=> {
  const[contacts]= useState(data);
  
  const handleClick = () => {
    console.log('save');
}
  const handleClickAgain = () => {
   console.log('complete');
}
  return <div className='app-container'>
  <h1>RID: 19473</h1>
     <h2>Liver Enzyme Level</h2>        
     <table>
      <thead>
        <tr>
          <th>Enzyme Type</th>
          <th>Elevated Liver Enzyme Level</th>
          <th>Normal Liver Enzyme Level</th>
          <th>P</th>
        </tr>
      </thead>
      <tbody>
        {contacts.map((contact)=>(
         <tr>
          <td>{contact.EnzymeType}</td>
          <td>{contact.ElevatedLiverEnzymeLevel}</td>
          <td>{contact.NormalLiverEnzymeLevel}</td>
          <td>{contact.P}</td>
          </tr>
          ))}
         
      </tbody>
    
    </table>
    
    <button onClick={handleClick}>SAVE</button>
    <button onClick={()=>handleClickAgain()}>COMPLETE</button>
 
  </div>
};


export default App;