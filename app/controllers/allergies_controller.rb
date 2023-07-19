class AllergiesController < ApplicationController
  before_action :set_allergy, only: [:show]

  def show
  end

  def new
    @allergy = Allergy.new
  end

  def create
    @allergy = Allergy.new(allergy_params)

    if @allergy.save
      redirect_to pet_allergy_path(@allergy)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def allergy_params
    params.require(:allergy).permit(:name, :comment)
  end

  def set_allergy
    @allergy = Allergy.find(params[:id])
  end

end
