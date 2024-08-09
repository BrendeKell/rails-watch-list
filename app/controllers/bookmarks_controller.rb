class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(params_bookmark)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    @bookmark.save
    redirect_to list_path(@list), notice: "bookmark successfully generated!"
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    @list = List.find(params[:list_id])

    redirect_to list_path(@list), notice: "bookmark successfully deleted!"
  end

  private

  def params_bookmark
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
