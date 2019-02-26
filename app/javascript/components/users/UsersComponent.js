import React from "react"
import PropTypes from "prop-types"
import UserListRow from './UserListRow';
import UserForm from './UserForm'
import UsereditForm from './UsereditForm'
import axios from 'axios'

class UsersComponent extends React.Component {
	constructor(props) {
    super(props);    
	}

  render () {
  	const users = this.props.users;
    return (
      <div>
      <UserForm />
      
      <table className="table">
		    <thead>
		      <tr>
            <th>ID</th>
		        <th>Email</th>
            <th>First Name</th>
            <th>Second Name</th>
            <th>Label Name</th>
            <th>Country</th>
            <th>State</th>
            <th>City</th>
            <th>Facebook URL</th>
            <th>Instagram URL</th>
            <th>Twitter URL</th>
            <th>Club Name</th>
            <th>Role</th>
          

		      </tr>
		    </thead>
		    <tbody>
		      {users.map((user, index) => (
            <UserListRow
              key={index}
              id={user.id}
              email={user.email}
              first_name={user.first_name}
              second_name={user.second_name} 
              name_label={user.name_label} 
              country={user.country}
              state={user.state} 
              city={user.city}
              facebook_url={user.facebook_url}
              instagram_url={user.instagram_url}
              twitter_url={user.twitter_url}
              name_club={user.name_club} 
              role={user.role}   
            />
          ))}
		    </tbody>
		  </table>
      </div>

      
    );
  }
}

UsersComponent.propTypes = {
  users: PropTypes.array,
  tableTitle: PropTypes.string
};
export default UsersComponent
