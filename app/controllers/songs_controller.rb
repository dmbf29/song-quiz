class SongsController < ApplicationController
  # /search?query=thriller
  # params[:query]
  def search
    # @songs = Song.where(title: params[:query])
    @songs = Song.where('title ILIKE ?', "%#{params[:query]}%")
  end

  # /songs/named/thriller
  # params[:name]
  def search_two
    # @songs = Song.where(title: params[:name])
    @songs = Song.where('title ILIKE ?', "%#{params[:name]}%")
  end

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def song_params
    # Why do we have to filter parameters using “strong params” in the controller?
    # To keep the bad guys out of our DB
    # Restrict user from giving us params we don't want
    params.require(:song).permit(:title, :year, :category)
  end
end
