import React from 'react';
import PropTypes from 'prop-types';

class ShowListRow extends React.Component {
  constructor(props) {
    super(props); 
  }

  render() {
    
    return (
      <tr>
        <td>{this.props.id}</td>
        <td>{this.props.name_song}</td>
        <td>{this.props.beats}</td>
        <td>{this.props.genre}</td>
        <td>{this.props.version}</td>
        <td>{this.props.name_artist}</td>
        <td>{this.props.date_uploaded}</td>

      </tr>
    );
  }
}

ShowListRow.propTypes = {
  brand: PropTypes.string,  
  id: PropTypes.number,
  name_song: PropTypes.string,
  beats: PropTypes.string,
  genre: PropTypes.string,
  version: PropTypes.string,
  name_artist: PropTypes.string,
  date_uploaded: PropTypes.string,

};
export default ShowListRow;
