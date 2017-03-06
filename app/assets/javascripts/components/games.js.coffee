@Gameslist = React.createClass

  getInitialState: ->
    game_data: this.props.games

  getDefaultProps: ->
    game_data: []

  addGame: (game) ->
    game_data = React.addons.update(this.state.game_data, { $push: [game] })
    this.setState game_data: game_data

  deleteGame: (game) ->
    index = this.state.game_data.indexOf(game)
    game_data = React.addons.update(this.state.game_data, { $splice: [[index, 1]] })
    this.replaceState game_data: game_data

  updateGame: (game, data) ->
    index = this.state.game_data.indexOf(game)
    game_data = React.addons.update(this.state.game_data, { $splice: [[index, 1, data]] })
    this.replaceState game_data: game_data

  render: ->
    React.DOM.div
      className: 'gameslist container'
      React.DOM.div
        className: 'title_container'
        React.DOM.h2
          className: 'title'
          gon.username

      React.DOM.div
        className: 'game_status_title_container'
        React.DOM.a
          className: 'game_status_title'
          # 'data-toggle': 'collapse'
          'data-toggle': 'tab'
          # 'data-target': '#game_playing'
          href: '#game_playing'
          'Playing'

        React.DOM.a
          className: 'game_status_title'
          # 'data-toggle': 'collapse'
          'data-toggle': 'tab'
          # 'data-target': '#game_start'
          href: '#game_start'
          'Planning'

        React.DOM.a
          className: 'game_status_title'
          # 'data-toggle': 'collapse'
          'data-toggle': 'tab'
          # 'data-target': '#game_completed'
          href: '#game_completed'
          'Completed'

        # React.DOM.a
        #   className: 'game_status_title'
        #   # 'data-toggle': 'collapse'
        #   'data-toggle': 'tab'
        #   # 'data-target': '#game_completed'
        #   href: '#game_wish'
        #   'Wishlist'

        React.DOM.a
          className: 'game_status_title_last'
          'data-toggle': 'collapse'
          'data-target': '#add_game'
          'Add'


      React.createElement(AddGameForm, addNewGame: @addGame)

      React.DOM.div
        className: 'tab-content'
        React.DOM.div
          id: 'game_playing'
          # className: 'collapse in'
          className: 'tab-pane fade in active'
          React.DOM.table
            className: 'table table-bordered'
            React.DOM.thead null,
              React.DOM.tr null,
                React.DOM.th
                  className: 'col-md-4 col-sm-4 playing-th'
                  'Currently Playing'
                React.DOM.th
                  className: 'col-md-2 col-sm-2'
                  'Genre'
                React.DOM.th
                  className: 'col-md-2 col-sm-2'
                  'Platform'
                React.DOM.th
                  className: 'col-md-2 col-sm-2'
                  'Progress'
                React.DOM.th
                  className: 'col-md-2 col-sm-2'
                  'Release Date'
                React.DOM.th null
                React.DOM.th null

            React.DOM.tbody null,
              for games in this.state.game_data
                # Render individual records
                if games.progress != '0' and games.progress != '100'
                  React.createElement Game, key: games.id, games: games, handleDeleteGame: @deleteGame, handleEditGame: @updateGame

        React.DOM.div
          id: 'game_start'
          # className: 'collapse'
          className: 'tab-pane fade'
          React.DOM.table
            className: 'table table-bordered'
            React.DOM.thead null,
              React.DOM.tr null,
                React.DOM.th
                  className: 'col-md-4 col-sm-4'
                  'Planning to Play'
                React.DOM.th
                  className: 'col-md-2 col-sm-2'
                  'Genre'
                React.DOM.th
                  className: 'col-md-2 col-sm-2'
                  'Platform'
                React.DOM.th
                  className: 'col-md-2 col-sm-2'
                  'Progress'
                React.DOM.th
                  className: 'col-md-2 col-sm-2'
                  'Release Date'
                React.DOM.th null

            React.DOM.tbody null,
              for games in this.state.game_data
                # Render individual records
                if games.progress == '0'
                  React.createElement Game, key: games.id, games: games


        React.DOM.div
          # className: 'collapse'
          className: 'tab-pane fade'
          id: 'game_completed'
          React.DOM.table
            className: 'table table-bordered'
            React.DOM.thead null,
              React.DOM.tr null,
                React.DOM.th
                  className: 'col-md-4 col-sm-4'
                  'Finished playing'
                React.DOM.th
                  className: 'col-md-2 col-sm-2'
                  'Genre'
                React.DOM.th
                  className: 'col-md-2 col-sm-2'
                  'Platform'
                React.DOM.th
                  className: 'col-md-2 col-sm-2'
                  'Progress'
                React.DOM.th
                  className: 'col-md-2 col-sm-2'
                  'Release Date'
                React.DOM.th null

            React.DOM.tbody null,
              for games in this.state.game_data
                # Render individual records
                if games.progress == '100'
                  React.createElement Game, key: games.id, games: games


  renewUsers = (name="") ->
    $('.title').text(name)
    console.log(name)
  console.log(gon.watch('username', interval: 10000, renewUsers))
  gon.username
