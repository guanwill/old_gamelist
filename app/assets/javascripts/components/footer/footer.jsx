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
    var timeNow = moment().format();
    console.log(timeNow);

    var URL = 'https://www.giantbomb.com/api/games/?api_key=cf71909f53e1497132eb781d7aab4d0936bfb352&&sort=original_release_date:desc&format=jsonp&filter=original_release_date:2016-03-14|' + timeNow + '&limit=10'


    $.ajax({
      method: 'get',
      dataType: 'jsonp',
      crossDomain: true,
      jsonp: 'json_callback',
      url: URL,
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
