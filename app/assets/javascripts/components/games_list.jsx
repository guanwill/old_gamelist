var GamesList = React.createClass({

  render: function() {

    var deleteGame = this.props.deleteGame;
    console.log(deleteGame);
    var handleEditGame = this.props.handleEditGame;
    console.log(handleEditGame);

    return (
      <div className="tab-content">

        <div id="game_playing" className="tab-pane fade in active">
          <table className="table table-bordered">
            <thead>
              <tr>
                <th className="col-md-4 col-sm-4 playing-th"> Currently Playing </th>
                <th className="col-md-2 col-sm-2">Genre</th>
                <th className="col-md-2 col-sm-2">Platform</th>
                <th className="col-md-2 col-sm-2">Progress (%)</th>
                <th className="col-md-2 col-sm-2">Release Date</th>
                <th></th>
                <th></th>
              </tr>
            </thead>

            <tbody>
              {this.props.game_data.map(function(game){   // console.log(game);
                if (game.progress != '0' && game.progress != '100') {
                  return (
                    <Game game={game} key={game.id} deleteGame={deleteGame} handleEditGame={handleEditGame}/>
                  )
                }
              })}
            </tbody>
          </table>
        </div>

        <div id="game_start" className="tab-pane fade in ">
          <table className="table table-bordered">
            <thead>
              <tr>
                <th className="col-md-4 col-sm-4 playing-th"> Currently Playing </th>
                <th className="col-md-2 col-sm-2">Genre</th>
                <th className="col-md-2 col-sm-2">Platform</th>
                <th className="col-md-2 col-sm-2">Progress (%)</th>
                <th className="col-md-2 col-sm-2">Release Date</th>
                <th></th>
                <th></th>
              </tr>
            </thead>

            <tbody>
              {this.props.game_data.map(function(game){   // console.log(game);
                if (game.progress == '0') {
                  return (
                    <Game game={game} key={game.id} deleteGame={deleteGame} handleEditGame={handleEditGame}/>
                  )
                }
              })}
            </tbody>
          </table>
        </div>

        <div id="game_completed" className="tab-pane fade in ">
          <table className="table table-bordered">
            <thead>
              <tr>
                <th className="col-md-4 col-sm-4 playing-th"> Currently Playing </th>
                <th className="col-md-2 col-sm-2">Genre</th>
                <th className="col-md-2 col-sm-2">Platform</th>
                <th className="col-md-2 col-sm-2">Progress (%)</th>
                <th className="col-md-2 col-sm-2">Release Date</th>
                <th></th>
                <th></th>
              </tr>
            </thead>

            <tbody>
              {this.props.game_data.map(function(game){   // console.log(game);
                if (game.progress == '100') {
                  return (
                    <Game game={game} key={game.id} deleteGame={deleteGame} handleEditGame={handleEditGame}/>
                  )
                }
              })}
            </tbody>
          </table>
        </div>

      </div>

    )
  }
});
