require "mustache"
require File.join(File.dirname(__FILE__), 'helper')
class Layout < Mustache
	include Helper
  
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
  
end