class BuildingsController < ApplicationController

    def index
        @buildings = Building.all
    end

    def show
        @building = Building.find(params[:id])
    end

    def edit
        @building = Building.find(params[:id])
    end

    def update
        building = Building.find(params[:id])
        building.update(building_params)

        if building.valid?
            redirect_to building_path(building)
        else
            flash[:my_errors] = building.errors.full_messages
            redirect_to edit_building_path(building)
        end
    end

    private

    def building_params
        params.require(:building).permit(:name, :address, :country, :rent_per_floor, :number_of_floors)
    end
end