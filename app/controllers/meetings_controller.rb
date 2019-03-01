class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update, :destory]
  def index
    @meetings = Meeting.all
  end

  def new
    binding.pry
    @meeting = Meeting.new(meeting_params)
  end

  def create
    @meeting = Meeting.new(meeting_params)
    if @meeting.save
      binding.pry
      redirect_to club_path, notice: "Meeting was succesfully created."
    else
      render :new
    end
  end

  private
    def meeting_params
      params.require(:meeting).permit(
        :name,
        :description,
        :count,
        :meeting_datetime,
        :club_id,
        :user_id
      )
    end

    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

end
