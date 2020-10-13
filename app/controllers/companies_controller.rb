class CompaniesController < ApplicationController

    def show
        @company = Company.find(params[:id])
    end

    def new
        @company = Company.new
    end

    def create
        byebug
        company = Company.create(company_params)

        if company.valid?
            redirect_to company_path(company)
        else
            flash[:my_errors] = company.errors.full_messages
            redirect_to new_company_path
        end
    end

    private

    def company_params
        params.require(:company).permit(:name, offices_attributes: [:id, offices: []])
    end
end