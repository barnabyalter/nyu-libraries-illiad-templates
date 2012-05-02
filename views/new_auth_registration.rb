require File.join(File.dirname(__FILE__), 'text_page')
class NewAuthRegistration < TextPage
  
  def page_header
    "Welcome to Bobst Library's Interlibrary Loan Request System!"
  end
  
  def text_sections
    [
    {
      :text_class => "text_section", 
      :text_id => "status",
      :paragraphs => []
    }
    ]
  end
  
end