class Application < ApplicationRecord
    

        validates :is_dean_approve, presence: true
        validates :is_hod_approve, presence: true
        validates :is_finance_approve, presence: true
        validates :is_warden_approve, presence: true
        validates :is_librarian_approve, presence: true
 

    
    
end
