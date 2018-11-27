ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
permit_params :department_id, :school_id,:name,:role,  :email, :password, :password_confirmation

index do
    column :name
    column :email
    column :role
    column :department
    column :school
    actions
end
 form do |f|
    inputs 'Details' do

        f.input :school
        f.input :department
        f.input :name
        f.input :role 
        f.input :email
        f.input :password
        f.input :password_confirmation
        actions
    end
 end

end
