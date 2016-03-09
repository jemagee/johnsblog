module ApplicationHelper

  def admins_only(&block)
    block.call if current_user.try(:admin?)
  end

  def redcarpet_process(input)
    renderer = Redcarpet::Render::HTML.new(filter_html: true)
    markdown = Redcarpet::Markdown.new(renderer)
    markdown.render(input).html_safe
  end
end
