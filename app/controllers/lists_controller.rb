class ListsController < ApplicationController
  before_action :set_movie, only: %i[new create destroy]
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.movie = @movie
    if @list.save
      redirect_to list_path(@list)
    else
      render 'lists/new', status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
end
