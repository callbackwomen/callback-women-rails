class CallsController < ApplicationController
  def new
    @call = Call.new conference: Conference.find(params[:conference_id])
  end

  def create
    @call = Call.new  conference_id: params[:conference_id],
                      due_date: params[:call][:due_date]

    if @call.save
      redirect_to @call.conference, notice: 'Call for Papers was successfully created.'
    else
      render :new
    end
  end
end
