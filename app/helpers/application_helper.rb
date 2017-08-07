module ApplicationHelper
  def body_tag(&block)
    ctrl = params[:controller].gsub(/\//, '-')
    content_tag :body, capture(&block), class: ctrl, id: 'popover-parent'
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
