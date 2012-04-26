require 'mustache'
class IncludeJavascripts < Mustache
  
  def initialize
    @type = "text/javascript"
    @folder = "javascripts"
  end
  
  def javascripts
   #[
   #  {:type => @type, :src => "#{@folder}/illiad.js"}
   # ]
  end

end
