import React, { useState } from "react";


export const Register = () => {
  const [email, setEmail] = useState('');
  const [pass, setPass] = useState('');
  const [name, setName] = useState('');

  const handleSubmit = (e) => {
    e.preventDefault();
    console.log(email);
  }

  const handleClick = () => {
    console.log('Login');
  }

  return (
    <>
      <form onSubmit={handleSubmit}>
      <li>
        <label htmlFor="name"> Full Name</label>
        <input value={name} onChange={(e) => setName(e.target.value)} placeholder= "Full Name" id="name" name= "name" />
        </li>

        <li>
        {/* Username*/}
        <label htmlFor="email"> Email </label>
        <input value={email} onChange={(e) => setEmail(e.target.value)} type= "email" placeholder= "Email" id= "email" name= "email" />
        </li>

        <li>
        {/* Password*/}
        <label htmlFor="password"> Password</label>
        <input value={pass} onChange={(e) => setPass(e.target.value)} type= "password" placeholder= "**********" id= "password" name= "password" />
        </li>
      </form>
      <button onClick={handleClick}>Login</button>
    </>
  )
}

export default Register;