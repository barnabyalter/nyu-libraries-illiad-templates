require 'mustache'
class IncludeStylesheets < Mustache
  
  def initialize
    @type = "text/css"
    @rel = "stylesheet"
    @folder = "stylesheets"
  end
  
  def stylesheets
    [
      {:type => @type, :rel => @rel, :href => "#{@folder}/illiad.css", :media => "screen,projector"},
      {:type => @type, :rel => @rel, :href => "#{@folder}/print.css", :media => "print"},
      {:ie => true, :type => @type, :rel => @rel, :href => "#{@folder}/ie.css", :media => "screen,projector"}
    ]
  end

end
