class CallsController < ApplicationController
  def new
    @call = Call.new conference: Conference.find(params[:conference_id])
  end
end
