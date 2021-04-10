class FavoritesController < ApplicationController
  before_action :set_variables

  def create
    favorite = current_user.favorites.new(book_id: @book.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    favorite = current_user.favorites.find_by(book_id: @book.id)
    favorite.destroy
    redirect_to request.referer
  end

  private

  def set_variables
    @book = Book.find(params[:book_id])
    @id_name = "#favorite-link-#{@book.id}"
  end
end
