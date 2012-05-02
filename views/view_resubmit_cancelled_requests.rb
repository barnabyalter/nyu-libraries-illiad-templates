require File.join(File.dirname(__FILE__), 'table')
class ViewResubmitCancelledRequests < Table

  def tables
    [
    { 
      :class => "default-table",
      :name => "ViewResubmitCancelledItems",
      :headerText => "Cancelled Requests",
      :noDataAction => "ShowMessageRow",
      :noDataMessage => "No Cancelled Requests"
    }
    ]
  end
  
end

