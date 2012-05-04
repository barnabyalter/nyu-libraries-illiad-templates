require File.join(File.dirname(__FILE__), 'table')
class ViewResubmitCancelledRequests < Table

  def filter_by
    true
  end

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
  
  def document_class
    super() + " view_requests"
  end
  
end

