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
        text "Schoolbinary #{@application.school.name}", size: 24
        text "Department: #{@application.department.name}", size: 24
        basics_info
        line_applications
       # line_items
    end
    def basics_info
        move_down 10
        text"Student name: #{@application.first_name}"
        text"Student name: #{@application.first_name}"
        text"Student name: #{@application.first_name}"

    end
    def line_applications
        move_down 20        
        #table [[1,2],[3,4]]
        table application_rows
    end
    def application_rows
        [["Reg Number", "First Name", "Last Name", "Department", "School"]]+
        @applications.map do |applicant|
            [applicant.reg_number, applicant.first_name, applicant.last_name, applicant.department.name, applicant.school.name]
        end
    end
    
end