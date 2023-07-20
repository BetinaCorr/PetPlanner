class ProfessionalsController < ApplicationController
  before_action :set_pets, only: %i[index new create]

  def index
    @professionals = []
    @pet.services.each do |service|
      @professionals << service.professional
    end
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def professional_params
    params.require(:food).permit(:name, :category, :price, :purchase_date)
  end

  def set_professional
    @food = Food.find(params[:id])
  end

  def set_pets
    @pet = Pet.find(params[:pet_id])
  end

end
