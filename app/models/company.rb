class Company < ApplicationRecord
    has_many :offices
    has_many :buildings, through: :offices
    has_many :employees

    validates :name, presence: true

    accepts_nested_attributes_for :offices

    # def offices_attributes=(office_attributes)
    #     byebug
    #     office_attributes.values.each do |attribute|
    #         Building.find(attribute[:id])
    #     end
    # end

end
