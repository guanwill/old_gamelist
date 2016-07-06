class GamesController < ApplicationController
# make sure user is logged in order to view their games list
before_action :authenticate_user!

def index
  @games = Game.average(:rating)
end

def plan
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
  if @game.valid?
    redirect_to games_path
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
