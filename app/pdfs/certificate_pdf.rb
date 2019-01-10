class CertificatePdf < Prawn::Document
    #require "prawn/table"
    def initialize(application)
        super(top_margin: 50)
        @applications = Application.where("id = 3")
        @application = application
        text 'UNIVERSITY OF RWANDA', size: 24
        move_down 5
        text 'COLLEGE OF SCIENCE AND TECHNOLOGY', size: 24
        move_down 5
        text "School: #{@application.school.name}", size: 24
        text "Department: #{@application.department.name}", size: 24
        basics_info
        line_applications
       # line_items
    end
    def basics_info
        move_down 10
        text"Student name: #{@application.first_name} #{@application.last_name}"
        text"Level of Study: #{@application.level}"
        text"Academic Year: #{@application.academic_year}"

    end
    def line_applications
        move_down 20        
        #table [[1,2],[3,4]]
        table application_rows
    end
    def application_rows
        [["Dean", "Head of department", "Student welfare", "Librarian", "Finance"]]+
        @applications.map do |applicant|
            [if applicant.is_dean_approve== 1 then 'Approve' else 'Reject' end, if applicant.is_hod_approve== 1 then 'Approve' else 'Reject' end, if applicant.is_warden_approve== 1 then 'Approve' else 'Reject' end, if applicant.is_librarian_approve== 1 then 'Approve' else 'Reject' end, if applicant.is_finance_approve== 1 then 'Approve' else 'Reject' end]
        end
    end
    
end