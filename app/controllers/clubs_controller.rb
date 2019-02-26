class ClubsController < ApplicationController

  def index
    @clubs = Club.all
  end

  def show
    @ride = Ride.new
  end

  def create
    @club = Club.new(club_params)
    if @club.save
      redirect_to @club, notice: 'Club was successfully created.'
    else
      render :new
    end
  end


  private
    def set_club
      @club = Club.find(params[:id])
    end
end
