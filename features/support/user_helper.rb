module UserHelper
  def fill_sign_up_form(user_attr)
    [:full_name, :email, :username, :password, :password_confirmation].each do |attr|
      fill_in "user_#{attr}", :with => user_attr[attr]
    end
  end
end

World(UserHelper)