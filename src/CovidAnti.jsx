import React,{useState} from 'react';
import "./CovidAnti.css";


function App(){
    const contacts =
    [
        {
           "Antibody": "S-IgG",
           "BAUCon":  "Conc BAU/ml= 0.080429+0.018729*Conc ng/ml",
           "LinerRange":  "100-1.0",
           "CVRange": "14.38% - 7.26%",
           "AdjustedR": "1.00"
        },
        {
            "Antibody": "S-IgM",
            "BAUCon":   "Conc BAU/ml= 0.465119+0.036897*Conc ng/ml",
            "LinerRange":  "1000-0.320",
            "CVRange": "16.40% - 0.17%",
            "AdjustedR": "0.9964"
            
        },
        {
            "Antibody": "S-IgA",
            "BAUCon":  "Conc BAU/ml= -0.035959+0.190851*Conc ng/ml",
            "LinerRange":  "1000-8.0",
            "CVRange": "18.82% - 0.08%",
            "AdjustedR": "0.9944"  
        },
        {
            "Antibody": "N-IgG",
            "BAUCon":  "Conc BAU/ml= 0.252450+0.615273*Conc ng/ml",
            "LinerRange":  "100-1.0",
            "CVRange": "21.33% - 0.33%",
            "AdjustedR": "0.9999"
        },
        {
            "Antibody": "N-IgM",
            "BAUCon":  "Conc BAU/ml= -1.808749+0.622280*Conc ng/ml",
            "LinerRange":  "1000-1.6",
            "CVRange": "8.22% - 0.42%",
            "AdjustedR": "0.9998"
        },
        {
            "Antibody": "N-IgA",
            "BAUCon":   "Conc BAU/ml= 0.378230+0.025888*Conc ng/ml",
            "LinerRange":  "1000-8.0",
            "CVRange": "17.39% - 0.09%",
            "AdjustedR": "0.9953"
        },
        {
            "Antibody": "RBD-IgG",
            "BAUCon":  "Conc BAU/ml= 0.834818+0.031529*Conc ng/ml",
            "LinerRange":  "1000-10.0",
            "CVRange": "6.13% - 0.37%",
            "AdjustedR": "0.9999"
        },
        {
            "Antibody": "RBD-IgM",
            "BAUCon":   "Conc BAU/ml= 0.539426+0.018729*Conc ng/ml",
            "LinerRange":  "1000-1.6",
            "CVRange": "12.32% - 0.04%",
            "AdjustedR": "0.9980"
        },
        {
            "Antibody": "RBD-IgA",
            "BAUCon":   "Conc BAU/ml= 0.053400+0.491130*Conc ng/ml",
            "LinerRange":  "1000-10.0",
            "CVRange": "6.22% - 0.13%",
            "AdjustedR": "0.9999"
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
     <h2>Covid-19 Antibody Testing</h2>        
     <table>
      <thead>
        <tr>
          <th>Antibody</th>
          <th>BAU Conversion Model</th>
          <th>Liner Range(ng/ml)</th>
          <th>CV% Range</th>
          <th>Adjusted RA² </th>
        </tr>
      </thead>
      <tbody>
        {contacts.map((contact)=>(
         <tr>
          <td>{contact.Antibody}</td>
          <td>{contact.BAUCon}</td>
          <td>{contact.LinerRange}</td>
          <td>{contact.CVRange}</td>
          <td>{contact.AdjustedR}</td>
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