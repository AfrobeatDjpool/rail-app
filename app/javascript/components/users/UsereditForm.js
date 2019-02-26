import React, { Component } from 'react'
import PropTypes from "prop-types";

import axios from 'axios'

class UsereditForm extends Component {
  constructor(props) {
    super(props)
    this.state = {
      email: this.props.user.email,
      firstname: this.props.user.first_name,
      secondname: this.props.user.second_name,
      labelname: this.props.user.name_label,
      country: this.props.user.country,
      state: this.props.user.state,
      facebookurl: this.props.user.facebook_url,
      instagramurl: this.props.user.instagram_url, 
      twitterurl: this.props.user.twitter_url,
      nameclub: this.props.user.name_club,
      city: this.props.user.city,
      role: this.props.user.role,     
    };
    
    this.handleEmailChange = this.handleEmailChange.bind(this);
    this.handleFirstnameChange = this.handleFirstnameChange.bind(this);
    this.handleSecondnameChange = this.handleSecondnameChange.bind(this);
    this.handleLabelnameChange = this.handleLabelnameChange.bind(this);
    this.handleCountryChange = this.handleCountryChange.bind(this);
    this.handleStateChange = this.handleStateChange.bind(this);
    this.handleFacebookurlChange = this.handleFacebookurlChange.bind(this);
    this.handleInstagramurlChange = this.handleInstagramurlChange.bind(this);
    this.handleTwitterurlChange = this.handleTwitterurlChange.bind(this);
    this.handleNameclubChange = this.handleNameclubChange.bind(this);
    this.handleCityChange = this.handleCityChange.bind(this);
    this.handleRoleChange = this.handleRoleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }


    handleSubmit = () => {

            // evt.preventDefault()

        var headers = {
            'Content-Type': 'application/json',
            'User-Token': this.props.current_user.authentication_token
        };

        var putData = { user: {
                email: this.state.email,
                first_name: this.state.firstname,
                second_name: this.state.secondname,
                name_label: this.state.labelname,
                country: this.state.country,
                state: this.state.state,
                facebook_url: this.state.facebookurl,
                instagram_url: this.state.instagramurl,
                twitter_url: this.state.twitterurl,
                name_club: this.state.nameclub,
                city: this.state.city,
                role: this.state.role
              }
            };
            
        axios.put(`http://localhost:3000/users/${this.props.user.id}`, putData, {headers: headers})

            .then(response => {
                console.log(response)
              })
              .catch(error => console.log(error))
    }

    handleEmailChange(e) {
      this.setState({ email: e.target.value });
    }

    handleFirstnameChange(e) {
      this.setState({ firstname: e.target.value });
    }

    handleSecondnameChange(e) {
      this.setState({ secondname: e.target.value });
    }

    handleLabelnameChange(e) {
      this.setState({ labelname: e.target.value });
    }

    handleCountryChange(e) {
      this.setState({ country: e.target.value });
    }

    handleStateChange(e) {
      this.setState({ state: e.target.value });
    }

    handleFacebookurlChange(e) {
      this.setState({ facebookurl: e.target.value });
    }

    handleInstagramurlChange(e) {
      this.setState({ instagramurl: e.target.value });
    }

    handleTwitterurlChange(e) {
      this.setState({ twitterurl: e.target.value });
    }

    handleNameclubChange(e) {
      this.setState({ nameclub: e.target.value });
    }


    handleCityChange(e) {
      this.setState({ city: e.target.value });
    }
    
    handleRoleChange(e) {
      this.setState({ role: e.target.value });
    }


  render() {
      const song = this.props.user.id;
      const current_user = this.props.current_user;

    return (
      <div className="tile">
        <form onSubmit={this.handleSubmit} >
          <input className='input' type="text"
            name="email" placeholder='Enter a email'
            value={this.state.email} onChange={this.handleEmailChange} />

          <input className='input' type="text"
            name="firstname" placeholder='Enter a firstname'
            value={this.state.firstname} onChange={this.handleFirstnameChange} />

          <input className='input' type="text"
            name="secondname" placeholder='Enter a secondname'
            value={this.state.secondname} onChange={this.handleSecondnameChange} />

          <input className='input' type="text"
            name="labelname" placeholder='Enter a labelname'
            value={this.state.labelname} onChange={this.handleLabelnameChange} />

          <input className='input' type="text"
            name="country" placeholder='Enter a country'
            value={this.state.country} onChange={this.handleCountryChange} />

          <input className='input' type="text"
            name="state" placeholder='Enter a state'
            value={this.state.state} onChange={this.handleStateChange} />

          <input className='input' type="text"
            name="country" placeholder='Enter a country'
            value={this.state.country} onChange={this.handleCountryChange} /> 

          <input className='input' type="text"
            name="facebookurl" placeholder='Enter a facebookurl'
            value={this.state.facebookurl} onChange={this.handleFacebookurlChange} /> 

          <input className='input' type="text"
            name="instagramurl" placeholder='Enter a instagramurl'
            value={this.state.instagramurl} onChange={this.handleInstagramurlChange} />

          <input className='input' type="text"
            name="twitterurl" placeholder='Enter a twitter'
            value={this.state.twitterurl} onChange={this.handleTwitterurlChange} />  

          <input className='input' type="text"
            name="nameclub" placeholder='Enter a nameclub'
            value={this.state.nameclub} onChange={this.handleNameclubChange} />

          <input className='input' type="text"
            name="city" placeholder='Enter a city'
            value={this.state.city} onChange={this.handleCityChange} />      

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

UsereditForm.propTypes = {
  title: PropTypes.string,
  authenticity_token: PropTypes.string
};
export default UsereditForm;

