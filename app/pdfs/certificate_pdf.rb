class CertificatePdf < Prawn::Document
    #require "prawn/table"
    def initialize(application)
        super(top_margin: 190)
        @applications = Application.where("id = 3")
        @application = application
        #image "../urlogo.png", width:'40%'
        image "#{Rails.root}/app/assets/images/ulogo.jpg", :at => [0,680], :width => 250, :opacity => 0.7 
        
        #text 'UNIVERSITY OF RWANDA', size: 24
        #move_down 5
        text 'College of science and technology', size: 20
        move_down 5
        text "#{@application.school.name}", size: 20
        text "Department of #{@application.department.name}", size: 20
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
        table application_rows do
            row(0).font_style = :bold
            
        end

        move_down 50
        text "Done by UR-CST Registrar"
        move_down 10
        text "Registrar Office"
        
        draw_text "Done on: " +  Time.now.strftime('%d-%m-%Y'), at:[400,80]
    end
    def application_rows
        [
            ["Department", "Decision", "Telephone", "E-mail"], 
            ["Dean"]+[if @application.is_dean_approve== 1 then 'Approved' else 'Rejected' end]+['0784658988']+['dean@gmail.com'],
            ["Finance"]+[if @application.is_finance_approve== 1 then 'Approved' else 'Rejected' end]+['0784526396']+['finance@gmail.com'],
            ["HOD"]+[if @application.is_hod_approve== 1 then 'Approved' else 'Rejected' end]+['0784558098']+['nhod@gmail.com'],
            ["Library"]+[if @application.is_librarian_approve== 1 then 'Approved' else 'Rejected' end]+['0788963245']+['librarian@gmail.com'],
            ["Student welfare"]+[if @application.is_warden_approve== 1 then 'Approved' else 'Rejected' end]+['0788473632']+['welfare@gmail.com']
         ]
       
       
    end
    
end