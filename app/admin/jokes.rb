ActiveAdmin.register Joke do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :body
  #
  # or
  #
  # permit_params do
  #   permitted = [:body]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  #

  show title: proc {"Шутки"} do
    attributes_table do
      row "Текст шутки" do
        resource.body
      end
    end
    active_admin_comments
  end
end
