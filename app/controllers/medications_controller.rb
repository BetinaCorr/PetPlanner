class MedicationsController < ApplicationController
  before_action :set_pets, only: %i[index new create]
  before_action :set_medication, only: %i[edit update destroy]

  def index
    @medications = @pet.medications
  end

  def new
    @medication = Medication.new
  end

  def create
    @medication = Medication.new(medication_params)

    # give the pet to the medication
    @medication.pet = @pet

    # redirect to the medications page if it saves
    if @medication.save
      redirect_to pet_medications_path(@pet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @medication.update(medication_params)
    redirect_to pet_medications_path(@medication.pet)
  end

  def destroy
    @medication.destroy
    redirect_to pet_medications_path(@medication.pet)
  end

  private

  def medication_params
    params.require(:medication).permit(:name, :purpose_medications, :administration_date, :frequency, :expiration_date, :comment)
  end

  def set_medication
    @medication = Medication.find(params[:id])
  end

  def set_pets
    @pet = Pet.find(params[:pet_id])
  end

end
