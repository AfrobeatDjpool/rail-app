import React, { Component } from 'react'
import PropTypes from "prop-types";

import axios from 'axios'

class UserForm extends Component {
  constructor(props) {
    super(props)
    this.state = {
      email: "",
      password: "",
      firstname: "",
      Secondname: "", 
      role: "",    
    };
    this.handleEmailChange = this.handleEmailChange.bind(this);
    this.handlePasswordChange = this.handlePasswordChange.bind(this);
    this.handleFirstnameChange = this.handleFirstnameChange.bind(this);
    this.handleSecondnameChange = this.handleSecondnameChange.bind(this);
    this.handleRoleChange = this.handleRoleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

    handleSubmit = () => {
      
        var headers = {
            'Content-Type': 'application/json'
        };
        var postData = { user: {
                email: this.state.email,
                password: this.state.password,
                first_name: this.state.firstname,
                second_name: this.state.secondname,
                role: this.state.role
              }
            };

        axios.post('http://localhost:3000/api/v1/sign_up', postData, {headers: headers})

            .then(response => {
                console.log(response)
              })
              .catch(error =>{ 
                console.log("Error",error)
              })
    }

    handleEmailChange(e) {
      this.setState({ email: e.target.value });
    }
    handlePasswordChange(e) {
      this.setState({ password: e.target.value });
    }

    handleFirstnameChange(e) {
      this.setState({ firstname: e.target.value });
    }

    handleSecondnameChange(e) {
      this.setState({ secondname: e.target.value });
    }

    handleRoleChange(e) {
      this.setState({ role: e.target.value });
    }

  render() {

    return (
      <div className="tile">
        <form onSubmit={this.handleSubmit} >
          <input className='input' type="text"
            name="email" placeholder='Enter a email'
            value={this.state.email} onChange={this.handleEmailChange} /> 
          <input className='input' type="password"
            name="password" placeholder='Enter a password'
            value={this.state.password} onChange={this.handlePasswordChange} /> 
          <input className='input' type="text"
            name="firstname" placeholder='Enter a firstname'
            value={this.state.firstname} onChange={this.handleFirstnameChange} />
          <input className='input' type="text"
            name="secondname" placeholder='Enter a secondname'
            value={this.state.secondname} onChange={this.handleSecondnameChange} />  
          <p>Select Role
          <label>
            <input type="radio" value="admin" 
              checked={this.state.role === 'admin'} 
              onChange={this.handleRoleChange} />
            admin
          </label>
        
          <label>
            <input type="radio" value="user" 
              checked={this.state.role === 'user'} 
              onChange={this.handleRoleChange} />
            user
          </label>
          </p>
   
          <input className="save" type="submit" name="SAVE" />
        </form>
      </div>
    );
  }
}

UserForm.propTypes = {
  title: PropTypes.string,
  authenticity_token: PropTypes.string
};
export default UserForm;

