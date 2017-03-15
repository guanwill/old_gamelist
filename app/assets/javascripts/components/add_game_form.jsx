var AddGameForm = React.createClass({

  getInitialState() {
    return {
      title: '',
      genre: '',
      platform: '',
      progress: '',
      release_date: '',
    }
  },

  handleChange: function(e){
    var name = e.target.name;
    obj = {};
    obj[name] = e.target.value;
    this.setState(obj)
  },

  handleSubmit: function(e) {
    e.preventDefault();
    $.ajax({
      url: window.location.origin + '/api/gamesapi/',
      type: 'POST',
      dataType: 'JSON',
      data: {
        game: this.state
      },
      success: (data) => {
        this.props.addNewGame(data);
        this.setState (this.getInitialState())
      }
    })
  },

  valid: function(){
    this.state.title && this.state.progress
  },

  render: function() {
    return (
      <div className="add-game-container">
        <form id="add_game" className="form-group collapse" onSubmit={this.handleSubmit}>

          <input type="text" className="form-control add-game-field" placeholder="Title" name="title" value={this.state.title} onChange={this.handleChange}/>

          <select className="form-control add-game-field" placeholder="Genre" name="genre" value={this.state.genre} onChange={this.handleChange}>
            <option value="select"> Select Genre </option>
            <option value="action"> Action </option>
            <option value="adventure"> Adventure </option>
            <option value="fighting"> Fighting </option>
            <option value="fps"> FPS </option>
            <option value="sports"> Sports </option>
            <option value="strategy"> Strategy </option>
            <option value="simulation"> Simulation </option>
            <option value="novel"> Novel </option>
            <option value="other"> Other </option>
          </select>

          <select className="form-control add-game-field" placeholder="Platform" name="platform" value={this.state.platform} onChange={this.handleChange}>
            <option value="select"> Select Platform </option>
            <option value="PS4"> PS4 </option>
            <option value="PS Vita "> PS Vita </option>
            <option value="Nin 3DS "> Nin 3DS </option>
            <option value="Nin Switch"> Nin Switch </option>
            <option value="XBOX One"> XBOX One </option>
            <option value="PC"> PC </option>
            <option value="Mobile"> Mobile </option>
            <option value="other"> Other </option>
          </select>

          <select className="form-control add-game-field" placeholder="progress" name="progress" value={this.state.progress} onChange={this.handleChange}>
            <option value="select"> Select Progress </option>
            <option value="0"> 0 </option>
            <option value="25 "> 25 </option>
            <option value="50 "> 50 </option>
            <option value="75"> 75 </option>
            <option value="100_Storyline"> 100% Storyline </option>
            <option value="100_Completion"> 100% Completion </option>
            <option value="wish"> Wish </option>
            <option value="contemplating"> Contemplating </option>
            <option value="on_hold"> On Hold </option>
          </select>

          <input type="date" className="form-control add-game-field" placeholder="Release Date" name="release_date" value={this.state.release_date} onChange={this.handleChange}/>

          <button type="submit" className="btn btn-primary add-game-button" >Add Game </button>



        </form>
      </div>
    );
  }
});
