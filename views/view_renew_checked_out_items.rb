require File.join(File.dirname(__FILE__), 'table')
class ViewRenewCheckedOutItems < Table

  def filter_by
    true
  end

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
  
  def document_class
    super() + " view_requests"
  end
  
end

