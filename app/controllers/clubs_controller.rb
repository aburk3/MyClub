class ClubsController < ApplicationController

  def index
    @clubs = Club.all
  end

  def show
    @ride = Ride.new
  end
end
