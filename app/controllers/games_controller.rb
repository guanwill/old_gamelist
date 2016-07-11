class GamesController < ApplicationController
# make sure user is logged in order to view their games list
before_action :authenticate_user!

def index
  @games = Game.average(:rating)
  # @gamelist = HTTParty.get "http://www.giantbomb.com/api/games/?api_key=cf71909f53e1497132eb781d7aab4d0936bfb352&format=json&field_list=name&offset=100"
end

def plan
  @games = Game.average(:rating)
end

def completed
  @games = Game.average(:rating)
end

def create
  @games = Game.new(game_params)
  @games.user_id = current_user.id
  if @games.save
    redirect_to games_path, :flash => {:errors => @games.errors.full_messages.join(', ')}
  else
    redirect_to new_game_path
  end
end

def new
  @games = Game.new
end

def edit
  @game = Game.find(params[:id])
end

def update
  @game = Game.find(params[:id])
  @game.update(game_params)
  # if game progress is above 0% and below 100%, direct to current playing. If it is 100% or 200%, direct to finsihed playing. If 0%, direct to planning to play
  if @game.valid? && @game.progress != 100 && @game.progress != 0
    redirect_to games_path
  elsif @game.valid? && @game.progress == 100 || @game.progress == 200
    redirect_to completed_path
  elsif @game.valid? && @game.progress == 0
    redirect_to plan_path
  else
    redirect_to edit_game_path
  end
end

def destroy
  @game = Game.find(params[:id])
  @game.destroy
  redirect_to games_path
end

def show
end

def game_params
  params.required(:game).permit(:title, :genre, :platform, :release_date, :progress, :rating)
end



end
