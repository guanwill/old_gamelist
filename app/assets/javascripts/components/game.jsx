var Game = React.createClass({

  getInitialState() {
    return {
      game: this.props.game,
      edit: false
    }
  },

  handleDelete: function(e) {
    e.preventDefault();
    if (confirm('Are you sure?')) {
      $.ajax({
        url: window.location.origin + "/api/gamesapi/" + this.props.game.id,
        method: 'DELETE',
        dataType: 'JSON',
        success: function(){
          this.props.deleteGame(this.props.game)
        }.bind(this)
      })
    }
  },

  handleEdit: function(e){
    e.preventDefault()
    var data = {
      title: (this.refs.title).value,
      genre: (this.refs.genre).value,
      platform: (this.refs.platform).value,
      progress: (this.refs.progress).value,
      release_date: (this.refs.release_date).value
    }

    $.ajax({
      method: 'PUT',
      url:  window.location.origin + "/api/gamesapi/" + this.props.game.id,
      dataType: 'JSON',
      data: {
        game: data
      },
      success: (data) => {
        this.setState({ edit: false })
        this.props.handleEditGame(this.props.game, data)
      }
    })
  },


  handleToggle: function(e) {
    e.preventDefault
    this.setState({
      edit: !this.state.edit
    })
  },

  render: function() {
    return(
      this.state.edit ? this.updateGameForm() : this.showGameRecords()
    )
  },

  showGameRecords: function(){
    return (
      <tr>
        <td>{this.props.game.title}</td>
        <td>{this.props.game.genre}</td>
        <td>{this.props.game.platform}</td>
        <td>{this.props.game.progress}</td>
        <td>{this.props.game.release_date}</td>
        <td><a onClick={this.handleToggle}> <i className="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>
        <td><a onClick={this.handleDelete}> <i className="fa fa-trash-o" aria-hidden="true"></i></a></td>
      </tr>
    );
  },

  updateGameForm: function(){
    return (
      <tr>
        <td className="col-md-4 col-sm-4 playing-th"><input type="text" className="form-control edit-field" defaultValue={this.props.game.title} ref="title" onChange={this.handleChange}/></td>
        <td className="col-md-2 col-sm-2">
          <select className="form-control edit-field" placeholder="Genre" ref="genre" defaultValue={this.props.game.genre} onChange={this.handleChange}>
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
        </td>
        <td className="col-md-2 col-sm-2">
          <select className="form-control edit-field" placeholder="Platform" ref="platform" defaultValue={this.props.game.platform} onChange={this.handleChange}>
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
        </td>
        <td className="col-md-2 col-sm-2">
          <select className="form-control edit-field" placeholder="progress" ref="progress" defaultValue={this.props.game.progress} onChange={this.handleChange}>
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
        </td>
        <td className="col-md-2 col-sm-2"><input type="date" className="form-control edit-field" defaultValue={this.props.game.release_date} ref="release_date" onChange={this.handleChange}/></td>
        <td><a onClick={this.handleEdit}><i className="fa fa-check" aria-hidden="true"></i></a></td>
        <td><a onClick={this.handleToggle}><i className="fa fa-times" aria-hidden="true"></i></a></td>

      </tr>
    )
  }

  // render: function() {
  //   return (
  //     <tr>
  //       <td>{this.props.game.title}</td>
  //       <td>{this.props.game.genre}</td>
  //       <td>{this.props.game.platform}</td>
  //       <td>{this.props.game.progress}</td>
  //       <td>{this.props.game.release_date}</td>
  //       <td><a onClick={this.handleToggle}> <i className="fa fa-trash-pencil-square-o" aria-hidden="true"></i></a></td>
  //       <td><a onClick={this.handleDelete}> <i className="fa fa-trash-o" aria-hidden="true"></i></a></td>
  //     </tr>
  //
  //   );
  // }
});
