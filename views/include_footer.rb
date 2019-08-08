require 'mustache'
require File.join(File.dirname(__FILE__), 'helper')
class IncludeFooter < Mustache
	include Helper  
  def footer
    app_tag "COPYRIGHT"
  end


end
