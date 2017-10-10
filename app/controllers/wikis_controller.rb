class WikisController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_wiki, except: [:new, :create, :index]

  def index
    @wikis = Wiki.all
  end

  def show
    authorize @wiki
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def create
    @wiki = current_user.wikis.new(wiki_params)
    authorize @wiki

    if @wiki.save
      flash[:notice] = "wiki was saved."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki. Please Try again."
      render :new
    end
  end

  def edit
    authorize @wiki
  end

  def update
    @wiki.assign_attributes(wiki_params)
    authorize @wiki
    if @wiki.save
      flash[:notice] = "wiki was updated."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :edit
    end
  end

  def destroy
    authorize @wiki
    if @wiki.destroy
      flash[:notice] = "'#{@wiki.title}' was deleted successfully."
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error deleting the wiki."
      render :show
    end
  end

  private
  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end

  def set_wiki
    @wiki = Wiki.find(params[:id])
  end

end
