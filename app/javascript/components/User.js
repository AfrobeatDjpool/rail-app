import React from "react"
import PropTypes from "prop-types"
class User extends React.Component {
  render () {
    return (
      <React.Fragment>
        Email: {this.props.email}
      </React.Fragment>
    );
  }
}

User.propTypes = {
  email: PropTypes.string
};
export default User
