var Home = React.createClass({

  getInitialState: function(){
    return{
      searchResults: [],
      query_array: [],
      currentUser: this.props.currentUser
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

  // searchthis: function(URL, query){
  searchthis: function(query){
    $.ajax({
      method: 'get',
      // dataType: 'jsonp',
      crossDomain: true,
      // jsonp: 'json_callback',
      // url: URL,
      url: '/getsearchresults/' + query,
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
        <SearchForm getQuery={this.getQuery} searchthis={this.searchthis} />
        <Results currentUser={this.state.currentUser} searchResults={this.state.searchResults}/>
      </div>
    )
  }


})
