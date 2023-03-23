class HousesController < ApplicationController
  def show
    @house = House.find(params[:id])
    authorize @house
  end
end
