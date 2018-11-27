class Department < ApplicationRecord
    belongs_to :school
    has_many :students
    has_many :users
end
