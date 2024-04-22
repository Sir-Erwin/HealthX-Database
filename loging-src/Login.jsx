import React,{useState} from 'react';
import "./Login.css";

const Login =() =>{
    return(
        <form action="" className="wrapper">
          <h1>Login</h1>
          
          {/* Username*/}
         <div className='inputBox'>
            <input type="text" placeholder='EID' required />
          </div>
          
          {/* Password*/}
          <div className='inputBox'>
            <input type="text" placeholder='Password' required />
          </div>
          
          {/* Remember Me & Forgot Password*/}
          <div className="remember-forgot">
            <label> <input type="checkbox"/> Remember Me </label>
            <a href='#'> Forgot Password </a>
          </div>
          
          {/* Login Button*/}
          <button type='submit'>Login</button>

          {/* Sign Up*/}
         <div>
            <a href='./Register'> Register An Account</a>
          </div>

        </form>

    )
}
export default Login;
