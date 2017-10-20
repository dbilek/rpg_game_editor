class CharacterAttributesController < ApplicationController
  def create
    @character_attribute = CharacterAttribute.new(param_attribute)

    respond_to do |format|  
      if @character_attribute.save!
          format.js
          format.html { redirect_to character_path(@character_attribute.character.id) }
      end
    end 
  end

  def destroy
    @character_attribute = CharacterAttribute.find(params[:id])
    @character = @character_attribute.character_id

    respond_to do |format|
      if @character_attribute.destroy
        format.js
        format.html { redirect_to character_path(@character) }
      end
    end
  end

  private

    def param_attribute
      params.require(:character_attribute).permit(:name, :intensity, :icon, :character_id )
    end
end