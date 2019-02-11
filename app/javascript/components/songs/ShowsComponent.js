import React from "react"
import PropTypes from "prop-types"
import ShowListRow from './ShowListRow';
import axios from 'axios'
class ShowsComponent extends React.Component {
constructor(props) {
super(props);    
}
render () {
// debugger
const song = this.props.song;
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
               {song.name_song}
            </h4>
            <i className=" glyphicon glyphicon-music"></i>{song.beats}
            <br /><br />
            <i className=" glyphicon glyphicon-music"></i>
            {song.genre}
           <br /><br />
            <i className="glyphicon glyphicon-music"></i>{song.version}
            <br /><br />
            <i className="glyphicon glyphicon-music"></i>{song.name_artist}
            <br /><br />
            <i className="glyphicon glyphicon-gift"></i>{song.date_uploaded}
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
);
}
}
ShowsComponent.propTypes = {
tableTitle: PropTypes.string
};
export default ShowsComponent