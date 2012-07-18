require File.join(File.dirname(__FILE__), 'text_page')
class Error < TextPage
  
  def page_header
    "Oops! We've encountered a problem."
  end
  
  def text_sections
    [
    {
      :text_class => "text_section", 
      :text_id => "status",
      :text => app_tag("STATUS")
    }
    ]
  end
  
end