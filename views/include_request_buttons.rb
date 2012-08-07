require 'mustache'
require File.join(File.dirname(__FILE__), 'helper')
class IncludeRequestButtons < Mustache
	include Helper  
  def request_buttons
    [
      {:type => "submit", :name => "SubmitButton", :value => "Submit Request", :class => "f-submit", :tabindex => "60"},
      {:type => "reset", :name => "ResetButton", :value => "Clear Form", :class => "f-submit", :tabindex => "61"},
      {:type => "submit", :name => "SubmitButton", :value => "Cancel - Return to Main Menu", :class => "f-submit", :tabindex => "62"} 
    ]
  end

  def class_name
    "request_buttons"
  end

end
