require File.join(File.dirname(__FILE__), 'table')
class ViewAllRequests < Table

  def filter_by
    true
  end
  
  def page_name
    "Request History"
  end

  def tables
    [
    { 
      :class => "default-table",
      :name => "ViewAllRequests",
      :headerText => "Request History",
      :noDataAction => "ShowMessageRow",
      :noDataMessage => "No Requests",
      :columns => ["TransactionNumber:Transaction Number (TN)", "DocumentType:Format Type", "Title", "Author", "TransactionStatus:Status"],
      :orderBy => "RequestType,DocumentType,TransactionNumber DESC"
    }
    ]
  end
  
  def document_class
    super() + " view_requests"
  end
  
end