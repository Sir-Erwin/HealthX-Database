
import {BrowserRouter, Routes, Route, useNavigate  } from 'react-router-dom';
import Login from "./Login";
import Register from './Register';

function Router(){
  return(
    <BrowserRouter>
    <Routes> 
     <Route path="/" element={<Login/>}></Route>
     <Route path="/Register" element={<Register/>}></Route>
      </Routes> 
    </BrowserRouter>
    )
}

function App() {
  return (
    <div>
      <Login/>
    </div>
  );
}

export default App;