var SearchForm = React.createClass({
  render: function(){
    return (
      <div className="search-div">

          <div className="welcome-div">
            <h1 className="welcome-title"> MGL </h1>

            <div className="api_form">
              <input type="text" ref="query" className="ui-autocomplete-input gamename-input" placeholder="Search for a game"/>
              <button type="submit" className="search-game-button btn-primary" onClick={this.createAjax}><i className="fa fa-search" aria-hidden="true"></i></button>
            </div>

          </div>

      </div>
    )
  },

  createAjax: function() {
    var query = ReactDOM.findDOMNode(this.refs.query).value;
    this.props.getQuery(query)
    this.props.searchthis(query)
    $('.divider-second-top p').text("Searching...")
  }
});
