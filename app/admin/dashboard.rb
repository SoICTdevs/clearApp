ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
  section "School", :priority => 1 do
    table_for School.order("name asc").limit(15) do
      column "Name", :name do |school|
        link_to school.name, [:admin, school]
      end
      column "Added On", :created_at
    end
    section "Departments", :priority => 2 do
      table_for Department.order("name asc").limit(15) do
        column "Name", :name do |department|
          link_to department.name, [:admin, department]
        end
        column "Added On", :created_at
    end
  end
  end
    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
