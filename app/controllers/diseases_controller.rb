class DiseasesController < ApplicationController
  before_action :set_pet, only: %i[index new create]
  before_action :set_disease, only: %i[edit update destroy]

  def index
    @diseases = @pet.diseases
  end

  def new
    @disease = Disease.new
  end

  def create
    @disease = Disease.new(disease_params)

    # give the pet to the disease
    @disease.pet = @pet

    # redirect to the diseases page if it saves
    if @disease.save
      redirect_to pet_diseases_path(@pet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @disease.update(disease_params)
    redirect_to pet_diseases_path(@disease.pet)
  end

  def destroy
    @disease.destroy
    redirect_to pet_diseases_path(@disease.pet)
  end

  private

  def disease_params
    params.require(:disease).permit(:name, :comment, :category, :started_at)
  end

  def set_disease
    @disease = Disease.find(params[:id])
  end

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

end
