class CriteriaController < ApplicationController

  def index
    @c = Criterium.all
  end

  def create
    Criterium.create!(name: params[:criterium_name])

      respond_to do |format|
          format.js {render inline: "location.reload();" }
        end
  end

  private


end
