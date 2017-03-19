var ResultItems = React.createClass({
  
  render: function(){

    var game = this.props.gameResult;
    var data_target_name = "#gameid" + game.id
    var data_target_classname = ".gameid" + game.id //for if you want to trigger addGame form in a modal

    return(
      <div className="game_record_container row row-eq-height">

        <div className='col-md-2 col-sm-2 image-col'>
          <img className="api-image=" src={game.image.icon_url}/>
        </div>

        <div className='col-md-10 col-sm-10 para-col'>
          <h4>{game.name}</h4>
          {game.deck}

          <a className="game_status_title_last" data-toggle="collapse" data-target={data_target_name}>Add</a>
          <AddGameForm2 gameResult={game} />

        </div>

      </div>
    )
  }
})
