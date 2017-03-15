var Results = React.createClass({
  render: function(){

    var resultItems = this.props.searchResults.map(function(result){
      return (
        <ResultItems key={result.id} trackName={result.name}/>
      );
    });

    return (
      <ul>
        {resultItems}
      </ul>
    );
  }
})
