class School < ApplicationRecord
    has_many :departments, foreign_key: "school_id"
    has_one :user
end
