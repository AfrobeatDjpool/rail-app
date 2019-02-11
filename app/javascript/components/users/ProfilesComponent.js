import React from "react"
import PropTypes from "prop-types"
import ProfileListRow from './ProfileListRow';
import axios from 'axios'
class ProfilesComponent extends React.Component {
constructor(props) {
super(props);    
}
render () {
// debugger
const user = this.props.user;
return (
<div className="container">
   <div className="row">
      <div className="col-xs-12 col-sm-6 col-md-6">
         <div className="well well-sm">
            <div className="row">
               <div className="col-sm-6 col-md-4">
                  <img src="http://placehold.it/380x500" alt="" className="img-rounded img-responsive" />
               </div>
               <div className="col-sm-6 col-md-8">
                  <h4>
                     {user.first_name}&nbsp;{user.second_name}
                  </h4>
                  <h4>
                     {user.name_label}
                  </h4>
                  <small><cite title="">{user.city}&nbsp;{user.state}&nbsp;{user.country} <i className="glyphicon glyphicon-map-marker">
                  </i></cite></small>
                  <h4>
                     {user.name_club}
                  </h4>
                  <p>
                     <i className="glyphicon glyphicon-envelope"></i>{user.email}
                     <br />
                     <i className="glyphicon glyphicon-gift"></i>June 02, 1988
                  </p>
                  <div className="btn-group">
                     <button type="button" className="btn btn-primary">
                     Social</button>
                     <button type="button" className="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                     <span className="caret"></span><span className="sr-only">Social</span>
                     </button>
                     <ul className="dropdown-menu" role="menu">
                        <li><a href="#">{user.facebook_url}</a></li>
                        <li><a href="#">{user.twitter_url} </a></li>
                        <li><a href="#">{user.instagram_url}</a></li>
                     </ul>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
);
}
}
ProfilesComponent.propTypes = {
tableTitle: PropTypes.string
};
export default ProfilesComponent
