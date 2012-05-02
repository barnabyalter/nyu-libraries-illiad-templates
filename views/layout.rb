require 'mustache'
class Layout < Mustache
  
  def page_title
    "BobCat - ILL - #{page_name}"
  end
  
  def page_name
    self.class.name.gsub(/(.)([A-Z])/,'\1 \2')
  end
  
  def document_id
    self.class.name
  end
  
  def document_class
    "eshelf illiad"
  end
  
  def header
    '<#INCLUDE filename="include_header.html">'
  end
  
  def meta
    '<#INCLUDE filename="include_meta.html">'
  end
  
  def javascripts
    '<#INCLUDE filename="include_javascripts.html">'    
  end
  
  def stylesheets
    '<#INCLUDE filename="include_stylesheets.html">'    
  end
  
  def sidebar
    '<#INCLUDE filename="include_menu.html">'
  end
  
  def content
  end
  
  def footer
    '<#INCLUDE filename="include_footer.html">'
  end
  
end