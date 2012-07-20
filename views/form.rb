require File.join(File.dirname(__FILE__), 'layout')
class Form < Layout
  def content
    mustache = Kernel.const_get(self.class.name).new
    mustache.template_file = File.join(File.dirname(__FILE__), "form.html.mustache")
    mustache.render
  end
  
  def form 
    count = 0
    {
       :form_header => page_name,
       :form_name => self.class.name,
       :form_id => "IlliadForm",
       :form_action => app_tag("DLL"),
       :form_method => "post",
       #:sub_header => "Describe the item you want",
       :count => lambda { return count += 1 },
       :param_tag => lambda { |field| param_tag field },
       :error_tag => lambda { |field| error_tag field },
       :hidden_fields => [
         {:name => "ILLiadForm", :value => self.class.name},
         {:name => "Username", :value => param_tag("Username") },
         {:name => "SessionID", :value => param_tag("SessionID") }
       ],
       :footer => '<b>By submitting this request you agree to adhere to all restrictions regarding this material expressed in <a href="http://library.nyu.edu/copyright/" target="_blank">U.S. Copyright Law</a>.</b>',
       :required_text => "Indicates required field",
       :required_class => "req",
       :required_indicator => "*"
     }
  end
 
  def request_buttons 
    include_tag "include_request_buttons.html"
  end
  
  def oclc_popup
    icon_link "https://library.nyu.edu/info/illiad/oclc.html"
  end
  
  def isbn_popup
    icon_link "https://library.nyu.edu/info/illiad/isbn.html"
  end
  
  def issn_popup
    icon_link "https://library.nyu.edu/info/illiad/issn.html"
  end
end