require File.join(File.dirname(__FILE__), 'table')
class ViewResubmitCancelledRequests < Table

  def filter_by
    true
  end
  
  def page_name
    "Requests Cancelled"
  end

  def tables
    [
    { 
      :class => "default-table",
      :name => "ViewResubmitCancelledItems",
      :headerText => "Requests Cancelled",
      :noDataAction => "ShowMessageRow",
      :noDataMessage => "No Requests",
      :columns => ["TransactionNumber:Transaction Number (TN)", "DocumentType:Format Type", "Title", "Author", "ReasonForCancellation: Reason Cancelled"],
      :orderBy => "TransactionNumber DESC"
    }
    ]
  end
  
  def document_class
    super() + " view_requests"
  end
  
end

