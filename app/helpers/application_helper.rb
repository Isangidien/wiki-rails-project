module ApplicationHelper
  def markdown(text)
    options = {
      filter_html: true,
      link_attributes: {rel: 'nofollow', target: "_blank"},
      hard_wrap: true,
      fenced_code_blocks: true,
      space_after_headers: true,
      quote: true,
      highlight: true,
      underline: true
    }

    extensions = {
      autolink: true,
      superscript: true,
      disable_indented_code_blocks: true
    }

    render = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(render, extensions)
    markdown.render(text).html_safe
  end
end
