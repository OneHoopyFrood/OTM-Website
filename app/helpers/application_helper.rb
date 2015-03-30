module ApplicationHelper
	def nav_link(link_text, link_path, options = {})
	  class_name = current_page?(link_path) ? 'active' : nil

	  content_tag(:li, :class => class_name) do
    	link_to link_text, link_path, options
	  end
	end

  def markdown(text)
    options = { hard_wrap: true, autolink: true, no_intraemphasis: true }
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
    sanitize markdown.render(text)
  end
end
