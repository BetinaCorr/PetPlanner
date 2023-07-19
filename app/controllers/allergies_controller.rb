class AllergiesController < ApplicationController
  before_action :set_allergy, only: [:show]

  def show
  end


  private

  def set_allergy
    @allergy = Allergy.find(params[:id])
  end

end
