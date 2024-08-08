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
    if @bookmark.save
      redirect_to list_path(@list), notice: "bookmark successfully generated!"
    else
      render :new, notice: "error: list was not successfully generated..."
    end
  end

  def destroy
    @bookmark = @list.Bookmark.find(params[:id])
    if @bookmark.destroy
      redirect_to bookmarks_path, notice: "bookmark successfully deleted!"
    else
      render :destroy, notice: "error: bookmark was not deleted..."
    end
  end

  private

  def params_bookmark
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
