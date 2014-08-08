class ConferencesController < ApplicationController
  def index
    @conferences = Conference.all
  end

  def new
    @conference = Conference.new
  end

  def create
    @conference = Conference.new conference_params

    if @conference.save
      redirect_to @conference, notice: 'Conference was successfully created.'
    else
      render :new
    end
  end

  private
  def conference_params
    params.permit %i(name location code_of_conduct childcare
                    last_years_attendance)
  end
end
