var Results = React.createClass({

  render: function(){

    var resultItems = this.props.searchResults.map(function(result){
      return (
        <ResultItems key={result.id} gameResult={result}/>
      );
    });

    if (this.props.query_array == ""){
      var query_array = ""
    }
    else {
      var query_array = "Search results for: " + this.props.query_array
    }

    return (
      <div className="search-container">

        <div className="divider-second-top">
          <p>{query_array}</p>
        </div>

        <div className="search-container2">
        <div className="search-container2-overlay">
          <div className="search-results-container">
            {resultItems}
          </div>
        </div>
        </div>

        <div className="divider-top">
          <p><span> Create your own game list <a href="/games_index">here</a> </span></p>
        </div>

      </div>
    );
  }
})
