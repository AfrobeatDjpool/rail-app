import React from "react"
import PropTypes from "prop-types"
import SongListRow from './SongListRow';
import SongForm from './SongForm'
import axios from 'axios'

class SongsComponent extends React.Component {
	constructor(props) {
    super(props);    
	}

  render () {
  	const songs = this.props.songs;
    const current_user = this.props.current_user;
    return (
      <div>
      <SongForm current_user={current_user}/>

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
            <SongListRow
              key={index}
              index={index}
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
      </div>
    );
  }
}

SongsComponent.propTypes = {
  songs: PropTypes.array,
  tableTitle: PropTypes.string
};
export default SongsComponent
