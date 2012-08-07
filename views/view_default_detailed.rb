require File.join(File.dirname(__FILE__), 'table')
class ViewDefaultDetailed < Table

  def tables
    [
    { 
      :class => "default-table",
      :name => "DetailedInformation",
      :headerText => "Request Information",
      :hideColumnHeaders => "true"
    }
    ]
  end
  
  def menu
    nil
  end
  
end