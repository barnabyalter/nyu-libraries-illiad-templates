require File.join(File.dirname(__FILE__), 'table')
class ViewRequestHistory < Table

  def filter_by
    true
  end
  
  def page_name
    "Requests Completed"
  end

  def tables
    [
    { 
      :class => "default-table",
      :name => "ViewRequestHistory",
      :headerText => "Requests Completed",
      :noDataAction => "ShowMessageRow",
      :noDataMessage => "No Requests",
      :columns => ["TransactionNumber:Transaction Number (TN)", "DocumentType:Format Type", "Title", "Author", "DueDate: Due Date"],
      :orderBy => "RequestType,DocumentType,TransactionNumber DESC"
    }
    ]
  end
  
  def document_class
    super() + " view_requests"
  end
  
end

