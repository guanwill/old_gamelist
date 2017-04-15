class GamesController < ApplicationController
autocomplete :gamesapi, :name, :full => true
helper_method :sort_column, :sort_direction
skip_before_action :verify_authenticity_token

# make sure user is logged in order to view their games list
# before_action :authenticate_user!

def newindex
  # if user_signed_in?
    @current_user_id = current_user.id
    @games = Game.where(:user_id => @current_user_id)
    # use gon to display and watch for user's name
    @watch_user_name = current_user.name + " 's Games List "
    gon.watch.username = @watch_user_name

    @currentUser = current_user
  # else
  #   redirect_to new_user_session_path
  # end

end

private

def game_params
  params.required(:game).permit(:title, :genre, :platform, :release_date, :progress, :rating)
end



end
