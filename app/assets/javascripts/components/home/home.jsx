var Home = React.createClass({

  // componentDidMount(){
  //    this.searchthis("https://itunes.apple.com/search?term=fun");
  // },

  getInitialState: function(){
    return{
      searchResults: [],
      query_array: []
    }
  },

  showResults: function(response){
    this.setState({
      searchResults: response.results
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
        this.showResults(response);
      }.bind(this)
    });
  },

  render: function(){
    return (
      <div>
        <SearchForm getQuery={this.getQuery} searchthis={this.searchthis} />
        <Results query_array={this.state.query_array} searchResults={this.state.searchResults}/>
      </div>
    )
  }


})
