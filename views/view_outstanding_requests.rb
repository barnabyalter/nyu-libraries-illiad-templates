require File.join(File.dirname(__FILE__), 'table')
class ViewOutstandingRequests < Table

  def filter_by
    true
  end

  def tables
    [
    { 
      :class => "default-table",
      :name => "ViewOutstandingRequests",
      :headerText => "Outstanding Requests",
      :noDataAction => "ShowMessageRow",
      :noDataMessage => "No Requests",
      :columns => ["TransactionNumber:Transaction","DocumentType:Type","Title","Author","TransactionStatus:Status"]
    }
    ]
  end
  
  def document_class
    super() + " view_requests"
  end
  
end