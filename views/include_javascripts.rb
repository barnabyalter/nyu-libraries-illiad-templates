require 'mustache'
class IncludeJavascripts < Mustache
  
  def initialize
    @type = "text/javascript"
    @folder = "javascripts"
  end
  
  def javascripts
   [
     {:type => @type, :src => "https://library.nyu.edu/scripts/load_js.js?load_with_dependencies=jquery.nyulibrary.bobcat,jquery.url,jquery.query,jquery.nyulibrary.popuptip,jquery.form,jquery.validate"},
     {:type => @type, :src => "#{@folder}/illiad.js"}
    ]
  end

end
