class PetsController < ApplicationController
  before_action :set_pets, only: %i[edit update show destroy]

  def index
    #  show only the pets from the current user
    @pets = current_user.pets
  end

  def show
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    # Give a user for the pet
    @pet.user = current_user
    # redirect to the show page of the pet if it is saved
    if @pet.save
      redirect_to pet_path(@pet), notice: 'Pet was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @pet.update(pet_params)
    redirect_to pet_path(@pet)
  end

  def destroy
    @pet.destroy
    redirect_to pets_path
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :species, :age, :breed, :gender, :clothes_size, :walk, :adopted, :arrival_date, :weight, :sterilized)
  end

  def set_pets
    @pet = Pet.find(params[:id])
  end

end
