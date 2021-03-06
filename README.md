_**[Personal Project - Not Maintained]**_

# MY GAMES LIST

## Website
Heroku: https://stark-retreat-73573.herokuapp.com/

## Purpose
* Tracks the status of all your video games
* Search for information on any game that you want

## Inspiration
There are indeed a lot of websites out there that provide similar features, however, I still end up using Ms Excel at the end of the day to track my games. Why? Because Excel is simple and very easy on the eyes. That was all I needed and thus this app was created to solve this problem.

## Features
* Users are required to create an account in order to view and create their own list
* Users are also able to edit and delete their individual game entries
* Users can specify a progress percentage for each game that they have on their list
* Users can also specify a game's release date and platform if they choose to
* Games are categorized into: Planning to play, Currently playing, Finished playing, Wishlist
* Users can search for information on a particular game and add to their list if desired

## Technologies Used
* Ruby on Rails
* Postgresql
* HTML5/CSS3/Bootstrap
* jQuery/Ajax
* Google Fonts
* [React-rails](https://github.com/reactjs/react-rails)
* [Devise Gem](https://github.com/plataformatec/devise)
* [Moment.js](https://momentjs.com/)
* [Rest-client](https://github.com/rest-client/rest-client)
* [GiantBomb's API](http://www.giantbomb.com/api/)
* ~[RatyRate Gem](https://github.com/wazery/ratyrate)~ No longer used
* ~[Rails4-autocomplete Gem](https://github.com/peterwillcn/rails4-autocomplete)~ No longer used
* ~HTTParty~ No longer used

## Future Considerations
* Integrate autofill feature so that users don't have to type the whole name of the game
* Implement notes section for each game on the user's list

## Update 1.4 3/2017 - 4/2017
* Re-designed whole website with React. Ruby on Rails now mainly used to serve RESTful API.
* User can search for a game and add desired game to their list
* User can search for a game and click on an external link for more info about that game
* Added a footer plus slider on home page to display upcoming games

## Update 1.3 23/12/2016 - 2/1/2017
* Re-designed website layout
* Added sortable columns

## Update 1.2 29/7/2016
* Incorporated GiantBomb's API so users can search for information on any game
* Users can search for games by clicking on the search icon in the nav bar or joystick icon on the home page

## Update 1.1 27/7/2016
* Seeded a csv file with a massive list of games into postgreSQL
* Implemented an autofill feature when users try to add a game
