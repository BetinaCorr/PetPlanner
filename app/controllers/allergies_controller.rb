class AllergiesController < ApplicationController
  before_action :set_pet, only: %i[index new create]
  before_action :set_allergy, only: %i[edit update destroy]

  def index
    @allergies = @pet.allergies
  end

  def new
    @allergy = Allergy.new
  end

  def create
    @allergy = Allergy.new(allergy_params)

    # give the pet to the allergy
    @allergy.pet = @pet

    # redirect to the allergies page if it saves
    if @allergy.save
      redirect_to pet_allergies_path(@pet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @allergy.update(allergy_params)
    redirect_to pet_allergies_path(@allergy.pet)
  end

  def destroy
    @allergy.destroy

    redirect_to pet_allergies_path(@allergy.pet)
  end

  private

  def allergy_params
    params.require(:allergy).permit(:name, :comment)
  end

  def set_allergy
    @allergy = Allergy.find(params[:id])
  end

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

end
