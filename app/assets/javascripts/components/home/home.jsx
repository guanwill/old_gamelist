var Home = React.createClass({

  // componentDidMount(){
  //    this.searchthis("https://itunes.apple.com/search?term=fun");
  // },

  getInitialState: function(){
    return{
      searchResults: [],
      query_array: [],
      currentUser: this.props.currentUser,
      gb_search_api_url: this.props.gb_search_api_url
    }
  },

  showResults: function(response){
    this.setState({
      searchResults: response.results,
    })
  },

  getQuery: function(query){
    this.setState({
      query_array: query
    })
  },

  searchthis: function(URL, query){
    $.ajax({
      method: 'get',
      dataType: 'jsonp',
      crossDomain: true,
      jsonp: 'json_callback',
      url: URL,
      success: function(response){
        var results_count = response.results.length
        this.showResults(response);
        if (response.error == "OK"){
          if (results_count == 0){
            $('.divider-second-top p').text("No results")
          }
          else {
            $('.divider-second-top p').text("Search Results for: " + this.state.query_array)
          }
        }
        else {
          $('.divider-second-top p').text("")
        }
      }.bind(this),
    });
  },

  render: function(){
    return (
      <div>
        <SearchForm gb_search_api_url={this.state.gb_search_api_url} getQuery={this.getQuery} searchthis={this.searchthis} />
        <Results currentUser={this.state.currentUser} searchResults={this.state.searchResults}/>
      </div>
    )
  }


})
