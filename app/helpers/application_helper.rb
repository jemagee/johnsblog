module ApplicationHelper

  def admins_only(&block)
    block.call if current_user.try(:admin?)
  end

  def redcarpet_process(input)
    renderer = Redcarpet::Render::HTML.new(filter_html: true, link_attributes: {target: "_blank"})
    markdown = Redcarpet::Markdown.new(renderer, {fenced_code_blocks: true, disable_indented_code_blocks: true})
    markdown.render(input).html_safe
  end
end
