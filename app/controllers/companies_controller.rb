class CompaniesController < ApplicationController

    def show
        @company = Company.find(params[:id])
    end

    def new
        @company = Company.new
    end

    def new_employee
        @company = Company.find(params[:id])
        employee = @company.employees.build(name: params[:company][:employee][:name], title: params[:company][:employee][:title], company_id: params[:company][:employee][:company_id])

        if employee.save
            redirect_to company_path(@company)
        else
            flash[:my_employee_errors] = employee.errors.full_messages
            redirect_to company_path(@company)
        end
    end

    def delete_employee
        employee = Employee.find(params[:company][:employee_ids])
        company = employee.company
        flash[:delete_message] = "#{employee.name} successfully deleted!"
        employee.delete
        redirect_to company_path(company)
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

    # def employee_params
    #     params.require(:company).permit(employees:[:name, :title, :company_id])
    # end
end