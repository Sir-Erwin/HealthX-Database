import React from 'react';
import './App.css';
import Home from './components/Home/Home';
import Sidebar from './components/Sidebar/Sidebar';
import Note from './components/Note/Note';
import LabAction from './components/LabAction/LabAction';
import MyLab from './MyLab/MyLab';
import Message from './components/Message/Message';



const App = () => {
  return(
    <>
    < LabAction />
    <main className = "main">
      < MyLab/>
      < Sidebar />
      < Home />
      < Note />
      < Message />
    </main>
    </>
    );
}

export default App;
