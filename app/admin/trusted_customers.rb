ActiveAdmin.register TrustedCustomer do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  filter :created_at

  permit_params :title, :display, :photo
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :display]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do  |f|
    f.inputs do
      f.input :title
      f.input :display
    end
    f.actions
  end
  
end
