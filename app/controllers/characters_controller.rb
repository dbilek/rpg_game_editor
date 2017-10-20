class CharactersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_character, only: [:show, :edit, :update, :destroy, :is_current_user_owner?]
  before_action :is_current_user_owner?, except: [:new]

  def new
    @character = Character.new
  end

  def index
    @characters = Character.where(user_id: current_user.id) if current_user
    if @characters.empty?
      flash[:warning] = "You dont have created any characters"
      redirect_to new_character_path
    end
  end

  def create
    @character = Character.new(character_params)
    if @character.save
      flash[:success] = "You created a new character."
      redirect_to characters_url
    else
      render 'new'
    end
  end

  def show
    @character_attribute = @character.character_attribute
  end

  def edit
  end

  def update
    if @character.update_attributes(character_params)
      flash[:success] = "You successfuly updated character parameters"
      redirect_to character_url(@character)
    else
      flash.now[:success] = "You doesn't update parameters, please try again."
      render 'edit'
    end
  end

  def destroy
    if @character.destroy
      flash[:success] = "Character is removed successfuly."
      redirect_to characters_path
    else
      flash[:success] = "Character doesn't removed, try again."
      reder 'edit'
    end
  end

  private 

    def is_current_user_owner?
      if @character
        redirect_to root_path unless @character.user_id == current_user.id
      end
    end

    def find_character
      @character = Character.find(params[:id])
    end

    def character_params
      params.require(:character).permit(:name, :avatar, :user_id)
    end
end