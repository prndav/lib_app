module ApplicationHelper
  def top_menu
    content_tag(:div, id: 'top_menu') do
      if current_user
        "Welcome, #{current_user.email}"
      else
        link_to 'Register', register_url
      end
    end
  end
end
