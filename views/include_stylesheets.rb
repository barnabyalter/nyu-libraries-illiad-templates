require 'mustache'
require File.join(File.dirname(__FILE__), 'helper')
class IncludeStylesheets < Mustache
	include Helper  
  def initialize
    @type = "text/css"
    @rel = "stylesheet"
    @folder = "https://cdn-dev.library.nyu.edu/illiad/stylesheets"
  end
  
  def stylesheets
    [
      {:type => @type, :rel => @rel, :href => "#{@folder}/illiad.css", :media => "screen,projector"},
    ]
  end

end
