import React, { Component } from 'react'
import PropTypes from "prop-types";

import axios from 'axios'

class SongeditForm extends Component {
  constructor(props) {
    super(props)
    this.state = {
      title: this.props.song.name_song,
      description: this.props.song.beats,
      genre: this.props.song.genre,
      version: this.props.song.version,
      artist: this.props.song.name_artist,
      date: this.props.song.date_uploaded,      
    };
    
    this.handleTitleChange = this.handleTitleChange.bind(this);
    this.handleDescriptionChange = this.handleDescriptionChange.bind(this);
    this.handleGenreChange = this.handleGenreChange.bind(this);
    this.handleVersionChange = this.handleVersionChange.bind(this);
    this.handleArtistChange = this.handleArtistChange.bind(this);
    this.handleDateChange = this.handleDateChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }


    handleSubmit = () => {

            // evt.preventDefault()

        var headers = {
            'Content-Type': 'application/json',
            'User-Token': this.props.current_user.authentication_token
        };

        var putData = { admin_song: {
                name_song: this.state.title,
                beats: this.state.description,
                genre: this.state.genre,
                version: this.state.version,
                name_artist: this.state.artist,
                date_uploaded: this.state.date
              }
            };
            
        axios.put(`http://localhost:3000/songs/${this.props.song.id}`, putData, {headers: headers})

            .then(response => {
                console.log(response)
              })
              .catch(error => console.log(error))
    }

    handleTitleChange(e) {
      this.setState({ title: e.target.value });
    }

    handleDescriptionChange(e) {
      this.setState({ description: e.target.value });
    }

    handleGenreChange(e) {
      this.setState({ genre: e.target.value });
    }

    handleVersionChange(e) {
      this.setState({ version: e.target.value });
    }

    handleArtistChange(e) {
      this.setState({ artist: e.target.value });
    }

    handleDateChange(e) {
      this.setState({ date: e.target.value });
    }


  render() {
      const song = this.props.song.id;
      const current_user = this.props.current_user;

    return (
      <div className="tile">
        <form onSubmit={this.handleSubmit} >
          <input className='input' type="text"
            name="title" placeholder='Enter a Song Name'
            value={this.state.title} onChange={this.handleTitleChange} />

          <input className='input' name="body"
            placeholder='Beats'
            value={this.state.description} onChange={this.handleDescriptionChange} />  
          

          <input className='input' type="text"
            name="genre" placeholder='Enter a genre'
            value={this.state.genre} onChange={this.handleGenreChange} />

          <input className='input' type="text"
            name="version" placeholder='Enter a version'
            value={this.state.version} onChange={this.handleVersionChange} />

          <input className='input' type="text"
            name="artist" placeholder='Enter a artist'
            value={this.state.artist} onChange={this.handleArtistChange} />

          <input className='input' type="date"
            name="date" placeholder='Enter a date'
            value={this.state.date} onChange={this.handleDateChange} /> 

          <input className="save" type="submit" name="SAVE" />
        </form>
      </div>
    );
  }
}

SongeditForm.propTypes = {
  title: PropTypes.string,
  authenticity_token: PropTypes.string
};
export default SongeditForm;

