var Home = React.createClass({

  // componentDidMount(){
  //    this.searchthis("https://itunes.apple.com/search?term=fun");
  // },

  getInitialState: function(){
    return{
      searchResults: []
    }
  },

  showResults: function(response){
    this.setState({
      searchResults: response.results
    })
  },

  searchthis: function(URL){
    $.ajax({
      method: 'get',
      dataType: 'jsonp',
      // url: 'https://itunes.apple.com/search?term=fun',
      url: URL,
      success: function(response){
        this.showResults(response);
      }.bind(this)
    });
  },

  render: function(){
    return (
      <div>
        <SearchForm searchthis={this.searchthis} />
        <Results searchResults={this.state.searchResults}/>
      </div>
    )
  }


})
