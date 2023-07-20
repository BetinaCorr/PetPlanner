class VaccinesController < ApplicationController
  before_action :set_pet, only: %i[index new create]
  before_action :set_vaccine, only: %i[edit update destroy]

  def index
    @vaccines = @pet.vaccines
  end

  def new
    @vaccine = Vaccine.new
  end

  def create
    @vaccine = Vaccine.new(vaccine_params)

    # give the pet to the vaccine
    @vaccine.pet = @pet

    # redirect to the vaccines page if it saves
    if @vaccine.save
      redirect_to pet_vaccines_path(@pet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @vaccine.update(vaccine_params)
    redirect_to pet_vaccines_path(@vaccine.pet)
  end

  def destroy
    @vaccine.destroy
    redirect_to pet_vaccines_path(@vaccine.pet)
  end

  private

  def vaccine_params
    params.require(:vaccine).permit(:name, :purpose_vaccine, :administration_date, :frequency, :comment)
  end

  def set_vaccine
    @vaccine = Vaccine.find(params[:id])
  end

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

end
