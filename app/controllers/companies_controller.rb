class CompaniesController < ApplicationController

    def show
        @company = Company.find(params[:id])
    end

    def new
        @company = Company.new
    end


    def create
        byebug
        company = Company.new(company_params)

        if company.save
            params[:company][:offices_attributes].each do |key, building_data|
                building = Building.find(building_data[:id])

                if building
                    floors = building_data[:offices]

                    floors.each do |floor|
                        if !floor.empty?
                            Office.create!(building: building, company: company, floor: floor)
                        end
                    end
                end

            end
            redirect_to company_path(company)
        else
            flash[:my_errors] = company.errors.full_messages
            redirect_to new_company_path
        end
    end


    private

    def company_params
        params.require(:company).permit(:name)
    end
end