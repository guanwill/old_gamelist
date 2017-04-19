var Footer = React.createClass({

  getInitialState: function(){
    return{
      latestGames: []
    }
  },

  showLatestGames: function(response){
    this.setState({
      latestGames: response.results
    })
  },

  getLatestGames: function(){

    $.ajax({
      method: 'get',
      // dataType: 'jsonp',
      crossDomain: true,
      // jsonp: 'json_callback',
      // url: URL,
      url: '/getnewgames',
      success: function(response){
        this.showLatestGames(response);
        // console.log(response)
        $("#lightSlider").lightSlider({
          item: 5,
          autoWidth: false,
          enableDrag:true,
          loop: true,
          mode: "slide",
          useCSS: true,
          cssEasing: 'ease',
          easing: 'linear',
          auto: true,
          speed: 1000,
        });

      }.bind(this)
    });
  },

  componentDidMount() {
    this.getLatestGames();
  },


  render: function(){

    return (
      <div>
        <div className="home-divider">
          <p className="latest-games-heading">Latest Games</p>
          <FooterGamesList latestGames={this.state.latestGames}/>
        </div>
      </div>
    )
  }


})
