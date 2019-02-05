import React, { Component } from 'react'
import PropTypes from "prop-types";

import axios from 'axios'

class UserForm extends Component {
  constructor(props) {
    super(props)
    this.state = {
      email: "",     
    };
    this.handleEmailChange = this.handleEmailChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

    handleSubmit = () => {
      
        var headers = {
            'Content-Type': 'application/json',
            'User-Token': this.props.current_user.authentication_token
        };

        var postData = { admin_song: {
                email: this.state.email
              }
            };

        axios.post('http://localhost:3000/api/v1/users', postData, {headers: headers})

            .then(response => {
                console.log(response)
              })
              .catch(error => console.log(error))
    }

    handleEmailChange(e) {
      this.setState({ title: e.target.value });
    }


  render() {
    // debugger
      const current_user = this.props.current_user;

    return (
      <div className="tile">
        <form onSubmit={this.handleSubmit} >
          <input className='input' type="text"
            name="email" placeholder='Enter a email'
            value={this.state.email} onChange={this.handleEmailChange} />      
           <input className="save" type="submit" name="SAVE" />
        </form>
      </div>
    );
  }
}

SongForm.propTypes = {
  title: PropTypes.string,
  authenticity_token: PropTypes.string
};
export default UserForm;

