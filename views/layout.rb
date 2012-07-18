require "mustache"
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
    include_tag "include_header.html"
  end
  
  def meta
    include_tag "include_meta.html"
  end
  
  def javascripts
    include_tag "include_javascripts.html"
  end
  
  def stylesheets
    include_tag "include_stylesheets.html"
  end
  
  def sidebar
    include_tag "include_menu.html"
  end
  
  def content
  end
  
  def status
    app_tag "STATUS"
  end
  
  def footer
    include_tag "include_footer.html"
  end
  
  def app_tag tag_name, params = nil
    "<##{tag_name}#{' ' + params unless params.nil?}>"
  end
  
  def include_tag filename
    app_tag "INCLUDE", "filename=\"#{filename}\""
  end
  
end