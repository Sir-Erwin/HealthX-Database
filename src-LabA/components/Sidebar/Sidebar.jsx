import React from 'react';
import "./Sidebar.css";

const Sidebar = () => {
    return (
        <div className='nav__menu'>
         <ul className='nav__list'>
            <li className='nav__item'>
              <a href='#Sidebar'className='nav__link'>
                <i className="icon-menu"></i>
              </a>
            </li>
            <li className='nav__item'>
              <a href='#Home'className='nav__link'>
              <i className="icon-home"></i>
              </a>
            </li>
            <li className='nav__item'>
              <a href='#Note'className='nav__link'>
              <i className="icon-note"></i>
              </a>
            </li>
            <li className='nav__item'>
              <a href='#Message'className='nav__link'>
              <i className="icon-bubbles"></i>
              </a>
            </li>
         </ul>
        </div>
    )
  }
  
  export default Sidebar;