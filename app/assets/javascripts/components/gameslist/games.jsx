var Gameslist = React.createClass({

  // componentDidMount(){
  //    gon.username
  // },

  getInitialState: function() {
    return {
      game_data: this.props.games,
    }
  },

  getDefaultProps: function() {
    return {
      game_data: []
    }
  },

  addGame: function(game) {
    var game_data = React.addons.update(this.state.game_data, {$push: [game]});
    this.setState({
      game_data: game_data
    })
  },

  updateGame: function(game,data) {
    var index = this.state.game_data.indexOf(game)
    var game_data = React.addons.update(this.state.game_data, { $splice: [[index, 1, data]] })
    this.replaceState({
      game_data: game_data
    })
  },

  deleteGame: function(game) {
    var index = this.state.game_data.indexOf(game)
    var game_data = React.addons.update(this.state.game_data, { $splice: [[index, 1]] })
    this.replaceState({
      game_data: game_data
    })
  },

  render: function() {

    return (
      <div>
        <div className="gameslist container">

          <div className="title_container">
            <h2 className="title"> {gon.username} </h2>
          </div>

          <div className="game_status_title_container">
            <a className="game_status_title" data-toggle="tab" href="#game_playing">Playing</a>
            <a className="game_status_title" data-toggle="tab" href="#game_start">Planning</a>
            <a className="game_status_title" data-toggle="tab" href="#game_completed">Completed</a>
            <a className="game_status_title" data-toggle="tab" href="#game_wish">Wishlist</a>
            <a className="game_status_title_last" data-toggle="collapse" data-target="#add_game">Add</a>
          </div>

          <AddGameForm addNewGame={this.addGame}/>
          <GamesList game_data={this.state.game_data} deleteGame={this.deleteGame} handleEditGame={this.updateGame} />

        </div>
      </div>
    )
  }

})
