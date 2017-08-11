module AccountHelper
  def account_tab(name)
    path = "/account/#{name}"
    text = name.to_s.capitalize
    link = link_to text, path
    content_tag :li, link
  end
end
