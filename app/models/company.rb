class Company < ApplicationRecord
    has_many :offices
    has_many :buildings, through: :offices
    has_many :employees

    validates :name, presence: true

    accepts_nested_attributes_for :offices
    #accepts_nested_attributes_for :employees

    # def buildings_attributes=(building_attributes)
    #     building_attributes.values.each do |attribute|
    #         Building.find(attribute[:id])
    #     end
    # end

end
