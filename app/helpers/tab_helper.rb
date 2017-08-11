module TabHelper
  def private_tab(name)
    path = "/account/#{name}"
    text = name.to_s.capitalize
    link = link_to(text, path)
    cls = request.path == path ? 'selected' : ''
    content_tag :li, link, class: cls
  end

  def public_tab(name, username)
  	path = "/users/#{username}/#{name}"
  	text = name.to_s.capitalize
  	link = link_to(text, path)
  	cls = request.path == path ? 'selected' : ''
  	content_tag :li, link, class: cls
  end
end
