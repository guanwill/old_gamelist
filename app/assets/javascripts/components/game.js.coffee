@Game = React.createClass

  handleDelete: (e) ->
    e.preventDefault()
    if confirm('Are you sure?')
      $.ajax
        url: window.location.origin + "/api/gamesapi/#{this.props.games.id}"
        method: 'DELETE'
        dataType: 'JSON'
        success: () =>
          this.props.handleDeleteGame(this.props.games)

  handleEdit: (e) ->
      e.preventDefault()
      data =
        title: (this.refs.title).value
        genre: (this.refs.genre).value
        platform: (this.refs.platform).value
        progress: (this.refs.progress).value
        release_date: (this.refs.release_date).value
      $.ajax
        method: 'PUT'
        url: window.location.origin + "/api/gamesapi/#{this.props.games.id }"
        dataType: 'JSON'
        data: {
          game: data
        }
        success: (data) =>
          console.log(data)
          this.setState edit: false
          this.props.handleEditGame this.props.games, data

  getInitialState: ->
    edit: false

  handleToggle: (e) ->
    e.preventDefault()
    this.setState edit: !@state.edit
    # The edit flag will default to false, and handleToggle will change edit from false to true and vice versa, we just need to trigger handleToggle from a user onClick event.

  render: ->
    if @state.edit
      @updateGameForm()
    else
      @showGameData()

  showGameData: ->
    React.DOM.tr null,
      React.DOM.td null, this.props.games.title
      React.DOM.td null, this.props.games.genre
      React.DOM.td null, this.props.games.platform
      React.DOM.td null, this.props.games.progress + "%"
      React.DOM.td null, this.props.games.release_date
      React.DOM.td null,
        React.DOM.a
          className: ''
          onClick: @handleToggle
          # 'data-toggle': 'modal'
          # 'data-target': '#update_game'
          React.DOM.i
            className: 'fa fa-pencil-square-o'
            'aria-hidden': true
      React.DOM.td null,
        React.DOM.a
          className: ''
          onClick: @handleDelete
          React.DOM.i
            className: 'fa fa-trash-o'
            'aria-hidden': true


  updateGameForm: ->
    React.DOM.tr null,
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'title'
          defaultValue: this.props.games.title
          ref: 'title'
      React.DOM.td null,
        React.DOM.select
          type: 'select'
          className: 'form-control'
          ref: 'genre'
          # value: 'select' #this sets the default option selected
          defaultValue: this.props.games.genre
          onChange: @handleChange
          React.DOM.option
            value: 'select'
            'Select Genre'
          React.DOM.option
            value: 'Action'
            'Action'
          React.DOM.option
            value: 'Adventure'
            'Adventure'
          React.DOM.option
            value: 'Fighting'
            'Fighting'
          React.DOM.option
            value: 'FPS'
            'FPS'
          React.DOM.option
            value: 'Sports'
            'Sports'
          React.DOM.option
            value: 'RPG'
            'RPG'
          React.DOM.option
            value: 'Strategy'
            'Strategy'
          React.DOM.option
            value: 'Simulation'
            'Simulation'
          React.DOM.option
            value: 'Novel'
            'Novel'
          React.DOM.option
            value: 'Other'
            'Other'
      React.DOM.td null,
        React.DOM.select
          type: 'select'
          className: 'form-control'
          ref: 'platform'
          defaultValue: this.props.games.platform
          onChange: @handleChange
          React.DOM.option
            value: 'select'
            'Select Platform'
          React.DOM.option
            value: 'PS4'
            'PS4'
          React.DOM.option
            value: 'PS Vita'
            'PS Vita'
          React.DOM.option
            value: 'Nintendo 3DS'
            'Nintendo 3DS'
          React.DOM.option
            value: 'Nintendo Switch'
            'Nintendo Switch'
          React.DOM.option
            value: 'XBOX One'
            'XBOX One'
          React.DOM.option
            value: 'Mobile'
            'Mobile'
          React.DOM.option
            value: 'Other'
            'Other'

      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'number'
          max: 200
          maxLength: 3
          defaultValue: this.props.games.progress
          ref: 'progress'

      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'date'
          defaultValue: this.props.games.release_date
          ref: 'release_date'

      React.DOM.td null,
        React.DOM.a
          className: 'btn'
          onClick: @handleEdit
          'U'

      React.DOM.td null,
        React.DOM.a
          className: 'btn'
          onClick: @handleToggle
          'X'
