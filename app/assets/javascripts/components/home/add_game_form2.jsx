var AddGameForm2 = React.createClass({

  getInitialState() {
    return {
      title: this.props.gameResult.name,
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
        console.log(data);
        alert('Success')
        var formid = '#gameid' + this.props.gameResult.id
        $(formid).removeClass('in')
        // this.setState (this.getInitialState())
      },
      error: () => {
        alert('Cannot add a game that already exists')
        var formid = '#gameid' + this.props.gameResult.id
        $(formid).removeClass('in')
      }
    })
  },


  render: function() {

    var game = this.props.gameResult;
    var form_target_id = "gameid" + game.id
    var form_target_classname = "modal fade form-group gameid" + game.id //for if you want form to be a modal

    if (this.state.title != "" && this.state.progress != "") {
      var disabled = false
    }
    else {
      var disabled = true
    }

    return (
      <div className="add-game-container">
        <form id={form_target_id} className="form-group collapse" onSubmit={this.handleSubmit}>

          <input readOnly="readOnly"   type="text" className="form-control add-game-field" placeholder="Title" name="title" value={this.state.title} onChange={this.handleChange}/>

          <select className="form-control add-game-field" placeholder="Genre" name="genre" value={this.state.genre} onChange={this.handleChange}>
            <option value="Select"> Select Genre </option>
            <option value="Action"> Action </option>
            <option value="Adventure"> Adventure </option>
            <option value="Fighting"> Fighting </option>
            <option value="Fps"> FPS </option>
            <option value="Sports"> Sports </option>
            <option value="Strategy"> Strategy </option>
            <option value="Simulation"> Simulation </option>
            <option value="Novel"> Novel </option>
            <option value="Other"> Other </option>
          </select>

          <select className="form-control add-game-field" placeholder="Platform" name="platform" value={this.state.platform} onChange={this.handleChange}>
            <option value="Select"> Select Platform </option>
            <option value="PS4"> PS4 </option>
            <option value="PS Vita "> PS Vita </option>
            <option value="Nin 3DS "> Nin 3DS </option>
            <option value="Nin Switch"> Nin Switch </option>
            <option value="XBOX One"> XBOX One </option>
            <option value="PC"> PC </option>
            <option value="Mobile"> Mobile </option>
            <option value="Other"> Other </option>
          </select>

          <select className="form-control add-game-field" placeholder="progress" name="progress" value={this.state.progress} onChange={this.handleChange}>
            <option value="Select"> Select Progress </option>
            <option value="0%"> 0% </option>
            <option value="25% "> 25% </option>
            <option value="50% "> 50% </option>
            <option value="75%"> 75% </option>
            <option value="100% Storyline"> 100% Storyline </option>
            <option value="100% Completion"> 100% Completion </option>
            <option value="Wish"> Wish </option>
            <option value="Contemplating"> Contemplating </option>
            <option value="On hold"> On Hold </option>
          </select>

          <input type="date" className="form-control add-game-field" placeholder="Release Date" name="release_date" value={this.state.release_date} onChange={this.handleChange}/>

          <button disabled={disabled} type="submit" className="btn btn-primary add-game-button" >Add Game </button>



        </form>
      </div>
    );
  }
});
