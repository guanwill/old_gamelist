# @AddGameForm = React.createClass
#
#   getInitialState: ->
#     title: ''
#     genre: ''
#     platform: ''
#     progress: ''
#     release_date: ''
#
#   handleChange: (e) ->
#     name = e.target.name
#     this.setState "#{ name }": e.target.value
#     console.log(name)
#     console.log(e.target)
#     console.log(e.target.value)
#
#   handleSubmit: (e) ->
#     e.preventDefault()
#     $.ajax
#       url: window.location.origin + '/api/gamesapi/'
#       type: 'POST'
#       dataType: 'JSON'
#       data: {
#         game: this.state
#       }
#       success: (data) =>
#         this.props.addNewGame(data) #this submit button will trigger addRecord method in records
#         this.setState (this.getInitialState()) #after submitting data and adding record, return state to initial, which mean all fields emptied
#
#   valid: ->
#       @state.title && @state.progress
#
#   render: ->
#     React.DOM.div
#       className: 'add-game-container'
#       React.DOM.form
#         className: 'form-group collapse'
#         onSubmit: @handleSubmit
#         id: 'add_game'
#
#         React.DOM.div
#           className: 'form-group'
#           React.DOM.input
#             type: 'text'
#             className: 'form-control add-game-field'
#             placeholder: 'Title'
#             name: 'title'
#             value: @state.title
#             onChange: @handleChange
#
#         React.DOM.div
#           className: 'form-group'
#           React.DOM.select
#             type: 'select'
#             className: 'form-control add-game-field'
#             placeholder: 'Genre'
#             name: 'genre'
#             # value: 'select' #this sets the default option selected
#             value: @state.genre
#             onChange: @handleChange
#             React.DOM.option
#               value: 'select'
#               'Select Genre'
#             React.DOM.option
#               value: 'Action'
#               'Action'
#             React.DOM.option
#               value: 'Adventure'
#               'Adventure'
#             React.DOM.option
#               value: 'Fighting'
#               'Fighting'
#             React.DOM.option
#               value: 'FPS'
#               'FPS'
#             React.DOM.option
#               value: 'Sports'
#               'Sports'
#             React.DOM.option
#               value: 'RPG'
#               'RPG'
#             React.DOM.option
#               value: 'Strategy'
#               'Strategy'
#             React.DOM.option
#               value: 'Simulation'
#               'Simulation'
#             React.DOM.option
#               value: 'Novel'
#               'Novel'
#             React.DOM.option
#               value: 'Other'
#               'Other'
#
#         React.DOM.div
#           className: 'form-group'
#           React.DOM.select
#             type: 'select'
#             className: 'form-control add-game-field'
#             placeholder: 'Platform'
#             name: 'platform'
#             value: @state.platform
#             onChange: @handleChange
#             React.DOM.option
#               value: 'select'
#               'Select Platform'
#             React.DOM.option
#               value: 'PS4'
#               'PS4'
#             React.DOM.option
#               value: 'PS Vita'
#               'PS Vita'
#             React.DOM.option
#               value: 'Nintendo 3DS'
#               'Nintendo 3DS'
#             React.DOM.option
#               value: 'Nintendo Switch'
#               'Nintendo Switch'
#             React.DOM.option
#               value: 'XBOX One'
#               'XBOX One'
#             React.DOM.option
#               value: 'Mobile'
#               'Mobile'
#             React.DOM.option
#               value: 'Other'
#               'Other'
#
#         React.DOM.div
#           className: 'form-group'
#           React.DOM.input
#             type: 'number'
#             className: 'form-control add-game-field'
#             placeholder: 'Progress'
#             name: 'progress'
#             max: 200
#             maxLength: 3
#             value: @state.progress
#             onChange: @handleChange
#
#         React.DOM.div
#           className: 'form-group'
#           React.DOM.input
#             type: 'date'
#             className: 'form-control add-game-field'
#             placeholder: 'Release Date'
#             name: 'release_date'
#             value: @state.release_date
#             onChange: @handleChange
#
#         React.DOM.button
#           type: 'submit'
#           className: 'btn btn-primary add-game-button'
#           disabled: !@valid()
#           'Add Game'
