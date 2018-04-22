class Grower < ApplicationRecord
    has_many :farms
    
    validates :email, uniqueness: true, email: true, allow_blank: true
    validates :phone_number, length: { is:9 }, numericality: { only_integer: true }, phone_number: true
    validates :first_name, :last_name, :email, :phone_number, presence: true
    validates :preferred_shipping, inclusion: { in: %w(2DAY 1WEEK 1MONTH) }
end
