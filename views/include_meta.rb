require 'mustache'
require File.join(File.dirname(__FILE__), 'helper')
class IncludeMeta < Mustache
	include Helper  
  def meta
    '<meta charset="utf-8" /><meta name="viewport" content="width=device-width; initial-scale=1; maximum-scale=1" />'
  end

end
