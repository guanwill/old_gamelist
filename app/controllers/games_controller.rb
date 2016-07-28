class GamesController < ApplicationController
# make sure user is logged in order to view their games list
before_action :authenticate_user!
autocomplete :gamesapi, :name, :full => true

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
  game = Game.new(game_params)
  game.user_id = current_user.id
  game.save
    if game.progress != 100 && game.progress != 200 && game.progress != 0
      render 'index'
    elsif game.progress == 100 || game.progress == 200
      render 'completed'
    elsif game.progress == 0
      render 'plan'
    else
      redirect_to edit_game_path
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
  # if game progress is above 0% and below 100%, direct to current playing. If it is 100, direct to complete. if its 0, direct to planning to play
  if @game.valid? && @game.progress != 100 && @game.progress != 200 && @game.progress != 0
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
  if @game.progress != 100 && @game.progress != 200 && @game.progress != 0
    redirect_to games_path
  elsif @game.valid? && @game.progress == 100 || @game.progress == 200
    redirect_to completed_path
  elsif @game.valid? && @game.progress == 0
    redirect_to plan_path
  else
    redirect_to edit_game_path
  end
  # render 'back'
end

def show
end

def game_params
  params.required(:game).permit(:title, :genre, :platform, :release_date, :progress, :rating)
end



end
