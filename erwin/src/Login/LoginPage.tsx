import React from "react";
import "./LoginPage.css";

const LoginPage = () => {
    return (
        <form action="" className="wrapper">
          <h1>Admin Login</h1>
          
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
            <a href='#'> Request Credentials</a>
          </div>

        </form>
    );
}

export default LoginPage 