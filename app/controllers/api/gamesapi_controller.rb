class Api::GamesapiController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_filter :set_all_cors

  def index
    @games = Game.all
    # @gamelist = HTTParty.get "http://www.giantbomb.com/api/games/?api_key=cf71909f53e1497132eb781d7aab4d0936bfb352&format=json&field_list=name&offset=100"
    if user_signed_in?
      render json: @games, status: 200
    else
      redirect_to new_user_session_path
    end
  end

  def show
    @games = Game.find(params[:id])
    render json: @games, status: 200
  end

  def create
    game = Game.new(game_params)
    game.user_id = current_user.id
    game.save
      if game.save
        render json: game, status: 200
      else
        render json: game.errors, status: :unprocessable_entity
      end
  end

  def new
    @games = Game.new
    render json: @games, status: 200
  end

  def edit
    @game = Game.find(params[:id])
    render json: @game, status: 200
  end

  def update
    @game = Game.find(params[:id])
    @game.update(game_params)
    if @game.valid?
      render json: @game, status: 200
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    if @game.destroy
      respond_to do |format|
        # format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private

  def game_params
    params.required(:game).permit(:title, :genre, :platform, :release_date, :progress, :rating)
  end

  def set_all_cors
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end


end
