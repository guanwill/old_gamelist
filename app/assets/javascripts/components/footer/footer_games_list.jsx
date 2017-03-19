var FooterGamesList = React.createClass({
  render: function(){

    var footergames = this.props.latestGames.map(function(result){
      return (
        <FooterGames key={result.id} footerGames={result}/>
      );
    });

    return (
      // <div className="row footer-row">
      <ul className="footer-row" id="lightSlider">
        {footergames}
      </ul>
      // </div>
    );
  }
})
