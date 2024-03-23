import React from 'react';
import './MyLab.css';


const MyLab = () => {
    return (
            <section className='lab-action container section'>
            
            <div className='action__container grid'>
                <div className='item'>
                  <h3 className='action__tittle'>HISTORY</h3>
                </div>
            
                <div className='item'>
                  <h3 className='action__tittle'>TO DO</h3>
                </div>

                <div className='item'>
                  <h3 className='action__tittle'>TEST RESULT</h3>
                </div>
                <div className='item'>
                  <h3 className='action__tittle'>SCHEDUAL</h3>
                </div>
            </div>
            
        </section>
            
    );
};
export default MyLab;