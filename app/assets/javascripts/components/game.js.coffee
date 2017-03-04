@Game = React.createClass
  render: ->
    React.DOM.tr null,
      React.DOM.td null, this.props.games.title 
      React.DOM.td null, this.props.games.genre
      React.DOM.td null, this.props.games.platform
      React.DOM.td null, this.props.games.progress + "%"
      React.DOM.td null, this.props.games.release_date
