class ClubsController < ApplicationController
  before_action :set_club, only: [:show, :edit, :update, :destory]

  def index
    @clubs = Club.all
  end

  def new
    @club = Club.new
  end

  def show
  end

  def create
    binding.pry
    @club = Club.new(club_params)
    if @club.save
      @club.users << current_user
      @club.save # unsure of how to get rid of this, since `@club.users << current_user needs to be saved`
      redirect_to @club, notice: "Club was successfully created."
    else
      render :new
    end
  end


  private
    def set_club
      @club = Club.find(params[:id])
    end

    def club_params
      params.require(:club).permit(
        :name,
        :members
      )
    end
end
