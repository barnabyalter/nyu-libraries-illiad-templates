require File.join(File.dirname(__FILE__), 'layout')
class Table < Layout
  def content
    mustache = Kernel.const_get(self.class.name).new
    mustache.template_file = File.join(File.dirname(__FILE__), "table.html.mustache")
    mustache.render
  end
  
  def tables 
  end
  
  def actions
    {
      :id => "service_action",
      :name => "service[action]",
      :title => "Actions",
      :optgroups => [
        {
          :name => "filter_by",
          :title => "Filter by",
          :options => [
            {:value => "Action%3D10%26Form%3D60", :title => "All Requests"},
            {:value => "Action%3D10%26Form%3D62", :title => "Outstanding Requests"},
            {:value => "Action%3D10%26Form%3D66", :title => "Checked Out Items"},
            {:value => "Action%3D10%26Form%3D70", :title => "Cancelled Requests"},
            {:value => "Action%3D10%26Form%3D68", :title => "Request History"}
          ]
        }
      ]
    }
  end
  
  def filter_by
    false
  end
end