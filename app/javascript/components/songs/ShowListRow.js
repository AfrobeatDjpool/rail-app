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
        

      </tr>
    );
  }
}

ShowListRow.propTypes = {
  brand: PropTypes.string,  
  id: PropTypes.number,
  name_song: PropTypes.string,
  

};
export default ShowListRow;
