module TabHelper
  def private_tab(name)
    path = "/account/#{name}"
    link = link_to(t(name), path)
    cls = request.path == path ? 'selected' : ''
    content_tag :li, link, class: cls
  end

  def public_tab(name, username)
    path = "/users/#{username}/#{name}"
    link = link_to(t(name), path)
    cls = request.path == path ? 'selected' : ''
    content_tag :li, link, class: cls
  end
end
