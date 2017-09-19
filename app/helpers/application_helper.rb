module ApplicationHelper
  def body_tag(&block)
    cls = params[:controller].gsub(/\//, '-')
    content_tag :body, capture(&block), class: cls, id: 'popover-parent'
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

  def livereload_tag
    # get your ip on your local network
    local_ip = Socket.ip_address_list.detect(&:ipv4_private?).ip_address
    # livereload listen port
    port = '35729'
    javascript_include_tag "http://#{local_ip}:#{port}/livereload.js?snipver=1"
  end

  def zero_width_space_interleave(string)
    string.split.map { |s| s.split(/(#{'.' * 1})/).reject(&:empty?).join('&#8203;') }.join(' ')
  end
end
