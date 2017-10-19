class CharactersController < ApplicationController
  before_action :authenticate_user!

  def new
    @character = Character.new
  end

  def index
    @characters = Character.where(user_id: current_user.id) if current_user
  end

  def create
    @character = Character.new(user_params)
    if @character.save
      flash[:success] = "You created a new character."
      redirect_to characters_url
    else
      render 'new'
    end
  end

  def show
  end

  private 
    def user_params
      params.require(:character).permit(:name, :avatar, :user_id)
    end
end