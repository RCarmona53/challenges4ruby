class Hospital < ApplicationRecord
    validates :name, presence: true
    validates :address, presence: true
    validates :city, presence: true
    validates :state, presence: true
    validates :zipcode, presence: true
end
