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
       :sub_header => "Describe the item you want",
       :count => lambda { return count += 1 },
       :hidden_fields => [
         {:name => "ILLiadForm", :value => self.class.name},
         {:name => "Username", :value => '<#PARAM name="Username">'},
         {:name => "SessionID", :value => '<#PARAM name="SessionID">'}
       ],
       :footer => '<b>By submitting this request, you agree to adhere to all restrictions regarding this material expressed in <a href="http://library.nyu.edu/copyright/" target="_blank">U.S. Copyright Law</a>.</b>'
     }
  end
end