class ReviewsController < ApplicationController
  class ReviewsController < ApplicationController
    before_action :set_review, only: [:show, :edit, :update, :destroy]

    def index
      @reviews = Review.all
    end

    def show
      # Code pour afficher une critique spécifique
    end

    def new
      @review = Review.new
    end

    def create
      @review = Review.new(review_params)
      @review.restaurant = @restaurant
      if @review.save
        redirect_to restaurant_path(@restaurant)
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      # Code pour éditer une critique existante
    end

    def update
      if @review.update(review_params)
        redirect_to @review, notice: 'La critique a été mise à jour avec succès.'
      else
        render :edit
      end
    end

    def destroy
      @review = Review.find(params[:id])
      @review.destroy
      redirect_to restaurant_path(@review.restaurant), status: :see_other
    end

    private

    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:rating, :content, :restaurant_id)
    end
  end

end
