class ProfessionalsController < ApplicationController
  before_action :set_pets, only: %i[index new create]
  before_action :set_professional, only: %i[edit update destroy]

  def index
    @professionals = @pet.professionals
  end

  def new
    @professional = Professional.new
  end

  def create
    @professional = Professional.new(professional_params)
    # Give the pet to the professional
    @professional.pet = @pet
    # Redirect to the Professionals page if it saves
    if @professional.save
      redirect_to pet_professionals_path(@pet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @professional.update(professional_params)
    redirect_to pet_professionals_path(@professional.pet)
  end

  def destroy
    @professional.destroy
    redirect_to pet_professionals_path(@professional.pet)
  end

  private

  def professional_params
    params.require(:professional).permit(:name, :address, :phone_number)
  end

  def set_professional
    @professional = Professional.find(params[:id])
  end

  def set_pets
    @pet = Pet.find(params[:pet_id])
  end

end
