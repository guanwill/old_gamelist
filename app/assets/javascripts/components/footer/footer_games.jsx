var FooterGames = React.createClass({
  render: function(){

    var game = this.props.footerGames;

    if (game.original_release_date != null){
      var release_date = moment(game.original_release_date).format('MMMM Do YYYY');
    }
    else {
      var release_date = "TBA"
    }

    if (game.image != null){
      var game_image_url = game.image.small_url
    }

    return(
      // <div className="col-md-2 col-sm-2">
      <li>
        <a target="_blank" href={game.site_detail_url}><img className="api-image=" src={game_image_url}/></a>
        <p><a target="_blank" href={game.site_detail_url}>{game.name}</a></p>
        <p> {release_date} </p>
      </li>
      // </div>
    )
  }
})
