require File.join(File.dirname(__FILE__), 'layout')
class TextPage < Layout
  def content
    mustache = Kernel.const_get(self.class.name).new
    mustache.template_file = File.join(File.dirname(__FILE__), "text_page.html.mustache")
    mustache.render
  end
end