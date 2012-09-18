require 'mustache'
require File.join(File.dirname(__FILE__), 'helper')
class IncludeMeta < Mustache
	include Helper 
	 
  def meta
    out = ""
    out << shortcut_icon
    out << charset
    out << viewport
  end
  
  def shortcut_icon
    '<link rel="SHORTCUT ICON" href="https://library.nyu.edu/favicon.ico" />'
  end
  
  def charset
    '<meta charset="utf-8" />'
  end
  
  def viewport
    '<meta name="viewport" content="width=device-width; initial-scale=1; maximum-scale=1" />'
  end

end
