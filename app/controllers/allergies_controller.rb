class AllergiesController < ApplicationController
  before_action :set_allergy, only: [:show, :edit, :update, :destroy]
  before_action :set_pet, only: [:new, :create]

  def show
  end

  def new
    @allergy = Allergy.new
  end

  def create
    @allergy = Allergy.new(allergy_params)
    @allergy.pet = @pet

    if @allergy.save
      redirect_to pet_allergy_path(@pet, @allergy)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @allergy.update(allergy_params)
    redirect_to pet_allergy_path(@allergy)
  end

  def destroy
    @allergy.destroy

    # arrumar o path que ta sendo redirecionado
    redirect_to pet_path(@allergy.pet)
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
