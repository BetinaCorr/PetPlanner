class ServicesController < ApplicationController
  before_action :set_pets, only: %i[index]
  before_action :set_professional, only: %i[new create]
  before_action :set_service, only: %i[edit update destroy]

  def index
    @services = @pet.services
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    @service.professional = @professional
    # Redirect to the services page if it saves
    if @service.save
      redirect_to pet_services_path(@professional.pet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @service.update(service_params)
    redirect_to pet_services_path(@service.professional.pet)
  end

  def destroy
    @service.destroy
    redirect_to pet_services_path(@service.professional.pet)
  end

  private

  def service_params
    params.require(:service).permit(:name_service, :price, :frequency, :starts_at, :ends_at)
  end

  def set_service
    @service = Service.find(params[:id])
  end

  def set_pets
    @pet = Pet.find(params[:pet_id])
  end

  def set_professional
    @professional = Professional.find(params[:professional_id])
  end
end
