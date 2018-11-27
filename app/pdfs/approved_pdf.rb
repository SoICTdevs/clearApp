class ApprovedPdf < Prawn::Document
    #require "prawn/table"
    def initialize(application)
        super(top_margin: 50)
      @application = Application.where('is_dean_approve = ? AND is_hod_approve = ? AND is_warden_approve = ? AND is_finance_approve = ? AND is_librarian_approve = ?', 1, 1, 1, 1, 1).order('updated_at DESC').all
        text 'Approved Application'
        
        line_applications
       # line_items
    end
    def line_applications
        move_down 20        
        #table [[1,2],[3,4]]
        table application_rows
    end
    def application_rows
        [["Reg Number", "First Name", "Last Name", "Department", "School"]]+
        @application.map do |applicant|
            [applicant.reg_number, applicant.first_name, applicant.last_name, applicant.department.name, applicant.school.name]
        end
    end
    
end