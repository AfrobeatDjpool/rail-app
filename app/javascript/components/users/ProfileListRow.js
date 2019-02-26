import React from 'react';
import PropTypes from 'prop-types';

class ProfileListRow extends React.Component {
  constructor(props) {
    super(props); 
  }

  render() {
    
    return (
      <tr>
        <td>{this.props.id}</td>
        <td>{this.props.email}</td>
        <td>{this.props.first_name}</td>
        <td>{this.props.second_name}</td>
        <td>{this.props.name_label}</td>
        <td>{this.props.country}</td>
        <td>{this.props.state}</td>
        <td>{this.props.city}</td>
        <td>{this.props.facebook_url}</td>
        <td>{this.props.instagram_url}</td>
        <td>{this.props.twitter_url}</td>
        <td>{this.props.name_club}</td>
        <td>{this.props.role}</td>

      </tr>
    );
  }
}

ProfileListRow.propTypes = {
  brand: PropTypes.string,  
  id: PropTypes.number,
  email: PropTypes.string,
  first_name: PropTypes.string,
  second_name: PropTypes.string,
  name_label: PropTypes.string,
  country: PropTypes.string,
  state: PropTypes.string,
  city: PropTypes.string,
  facebook_url: PropTypes.string,
  instagram_url: PropTypes.string,
  twitter_url: PropTypes.string,
  name_club: PropTypes.string,
  role: PropTypes.string,

};
export default ProfileListRow;
