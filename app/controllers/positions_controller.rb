class PositionsController < ApplicationController

  def index
    @p = Position.all
    @pc = PositionCriteriumScore.all
    @c = Criterium.all
  end

  def create
    Position.create!(name: params[:position_name])

    Criterium.all.each_with_index do |c, idx|
      PositionCriteriumScore.create(
        score: params["criterium_#{idx+1}"],
        position: Position.last,
        criterium: c
      )
    end

    respond_to do |format|
        format.js {render inline: "location.reload();" }
      end

  end

  private

end
