import React from 'react';
import logo from './img/question_1_big.jpg';

function App(){

  const handleClick = () => {
    console.log('save');
}
  const handleClickAgain = () => {
   console.log('complete');
}

  return (
  <div className='app-container'>
   
    <img src={logo}  height={500} width={500}/>
      
    <button onClick={handleClick}>SAVE</button>
    <button onClick={()=>handleClickAgain()}>COMPLETE</button>
  </div>

  )
  }
export default App;