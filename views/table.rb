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
      :filter_action => "illiad.dll",
      :filter_method => "get",
      :id => "service_action",
      :name => "service[action]",
      :title => "Actions",
      :optgroups => [
        {
          :name => "filter_by",
          :title => "View",
          :options => [
            {:value => "Action%3D10%26Form%3D60", :title => "Request History"},
            {:value => "Action%3D10%26Form%3D62", :title => "Requests in Processing"},
            {:value => "Action%3D10%26Form%3D66", :title => "Items Available to Check Out"},
            {:value => "Action%3D10%26Form%3D70", :title => "Requests Cancelled"},
            {:value => "Action%3D10%26Form%3D68", :title => "Requests Completed"}
          ]
        }
      ]
    }
  end
  
  def filter_by
    false
  end
  
  def table_code
    mustache = Kernel.const_get(self.class.name).new
    mustache.template = '
    {{#tables}}
    {{#text_above}}
    <div class="pre_table_text">
      {{{text_above}}}
    </div>
    {{/text_above}}
    <div class="{{class}}" id="{{name}}Table">			
      <#TABLE{{#name}} name="{{name}}"{{/name}}{{#headerText}} headerText="{{headerText}}"{{/headerText}}{{#hideColumnHeaders}} hideColumnHeaders="{{hideColumnHeaders}}"{{/hideColumnHeaders}}{{#maxRows}} maxRows="{{maxRows}}"{{/maxRows}}{{#noDataAction}} noDataAction="{{noDataAction}}"{{/noDataAction}}{{#noDataMessage}} noDataMessage="{{noDataMessage}}"{{/noDataMessage}}{{#columns}} column="{{.}}"{{/columns}}{{#orderBy}} orderBy="{{orderBy}}"{{/orderBy}}>
    </div>
    {{#text_below}}
    <div class="post_table_text">
      {{{text_below}}}
    </div>
    {{/text_below}}
    {{/tables}}
    '
    mustache.render
  end
  
end