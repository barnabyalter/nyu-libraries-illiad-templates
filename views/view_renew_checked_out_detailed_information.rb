require File.join(File.dirname(__FILE__), 'table')
class ViewRenewCheckedOutDetailedInformation < Table

  def tables
    [
    { 
      :class => "default-table",
      :name => "DetailedInformation",
      :headerText => "Transaction Information",
      :hideColumnHeaders => "true"
    }
    ]
  end
  
  def menu
    menu_tag
  end
  
end