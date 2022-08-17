class Api::V1::BookmarksController <  Api::V1::BaseController
  def create
    # @bookmark = Bookmark.new(bookmark_params)
    p "======== bookmark create"
    @bookmark = Bookmark.new(user: @current_user, trip: Trip.find(params[:trip_id]))
    if @bookmark.save
      render json: @bookmark, status: :created
    else
      render json: @bookmark.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    render json: {message: "Bookmark deleted"}
  end

  private

  # def bookmar_params
  #   params.require(:bookmark).permit(:user_id, :trip_id)
  # end
end
