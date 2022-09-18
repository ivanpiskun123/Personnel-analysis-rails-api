class VacanciesController < ApplicationController

  def index
      @v = Vacancy.order(:status)
      @p = Position.all
  end

  def new

  end

  def create
    Vacancy.create!(position: Position.find_by_name(params[:position_name]),
      opening_date: Date.today )

      respond_to do |format|
          format.js {render inline: "location.reload();" }
        end

  end


  private



end
