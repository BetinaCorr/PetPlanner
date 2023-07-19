class FoodsController < ApplicationController
  before_action :set_pets, only: %i[index new create]
  before_action :set_food, only: %i[edit update destroy]

  def index
    @foods = @pet.foods
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    # Give the pet to the food
    @food.pet = @pet
    # Redirect to the Foods page if it saves
    if @food.save
      redirect_to pet_foods_path(@pet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @food.update(food_params)
    redirect_to pet_foods_path(@food.pet)
  end

  def destroy
    @food.destroy
    redirect_to pet_foods_path(@food.pet)
  end

  private

  def food_params
    params.require(:food).permit(:name, :category, :price, :purchase_date)
  end

  def set_food
    @food = Food.find(params[:id])
  end

  def set_pets
    @pet = Pet.find(params[:pet_id])
  end
end
