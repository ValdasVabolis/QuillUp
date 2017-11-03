module ApplicationHelper
  def body_tag(&block)
    cls = params[:controller].gsub(/\//, '-')
    content_tag :body, capture(&block), class: cls, id: 'popover-parent'
  end

  def markdown(text)
    options = {
      filter_html:     true,
      hard_wrap:       true,
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true,
      fenced_code_blocks: true
    }

    extensions = {
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
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
end
