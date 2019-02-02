import React from "react"
import PropTypes from "prop-types"
import MysongListRow from './MysongListRow';

class MysongsComponent extends React.Component {
	constructor(props) {
    super(props);    
	}

  render () {
  	const songs = this.props.songs;
    return (

      <table className="table">
		    <thead>
		      <tr>
            <th>ID</th>
            <th>Song Name</th>
            <th>Beats</th>
            <th>Genre</th>
            <th>Version</th>
            <th>Artist Name</th>
            <th>Upload date</th>
          

		      </tr>
		    </thead>
		    <tbody>
		      {songs.map((song, index) => (
            <MysongListRow
              key={index}
              id={song.id}
              name_song={song.name_song}
              beats={song.beats} 
              genre={song.genre}
              version={song.version} 
              name_artist={song.name_artist}
              date_uploaded={song.date_uploaded}
            />
          ))}
		    </tbody>
		  </table>
    );
  }
}

MysongsComponent.propTypes = {
  songs: PropTypes.array,
  tableTitle: PropTypes.string
};
export default MysongsComponent
