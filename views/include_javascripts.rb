require 'mustache'
require File.join(File.dirname(__FILE__), 'helper')
class IncludeJavascripts < Mustache
	include Helper
  def initialize
    @type = "text/javascript"
    @folder = (ENV['ILLIAD_ENV'] == "production") ? "https://cdn.library.nyu.edu/illiad/javascripts" : "https://cdn-dev.library.nyu.edu/illiad/javascripts"
  end

  def javascripts
   [
			{:type => @type, src: "//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" },
			{:type => @type, src: "//ajax.googleapis.com/ajax/libs/jqueryui/1.8.19/jquery-ui.min.js" },
			{:type => @type, :src => "#{@folder}/illiad.js"}
    ]
  end

end
