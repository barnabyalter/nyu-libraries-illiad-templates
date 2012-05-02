require File.join(File.dirname(__FILE__), 'table')
class ViewRenewCheckedOutItems < Table

  def tables
    [
    { 
      :class => "default-table",
      :name => "ViewRenewCheckedOutItems",
      :headerText => "Checked Out Items",
      :noDataAction => "ShowMessageRow",
      :noDataMessage => "No Items"
    }
    ]
  end
  
end

