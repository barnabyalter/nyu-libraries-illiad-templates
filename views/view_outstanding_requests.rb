require File.join(File.dirname(__FILE__), 'table')
class ViewOutstandingRequests < Table

  def filter_by
    true
  end
  
  def page_name
    "Requests in Processing"
  end

  def tables
    [
    { 
      :class => "default-table",
      :name => "ViewOutstandingRequests",
      :headerText => "Requests in Processing",
      :noDataAction => "ShowMessageRow",
      :noDataMessage => "No Requests",
      :columns => ["ransactionNumber:Transaction Number (TN)","DocumentType:Format Type","Title","Author","CreationDate:Request Submitted"],
      :orderBy => "RequestType,DocumentType,TransactionNumber ASC"
    }
    ]
  end
  
end