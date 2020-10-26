class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
    json_response(@reviews)
  end

  def create
    @review = Review.create!(review_params)
    json_response(@review, :created)
  end

  def show
    @review = Review.find(params[:id])
    json_response(@review)
  end

  def update
    @review = Review.find(params[:id])
    if @review.update!(review_params)
      render status: 200, json: {
        message: "Review updated successfully"
      }
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy!
      render status: 200, json: {
        message: "Review deleted"
      }
    end
  end

  private
  def review_params
    params.permit(:country, :city, :rating, :user_name, :content)
  end
end