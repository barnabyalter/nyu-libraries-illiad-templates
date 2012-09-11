require File.join(File.dirname(__FILE__), 'table')
class ViewRenewCheckedOutItems < Table

  def filter_by
    true
  end
  
  def page_name
    "Items Available to Check Out"
  end

  def tables
    [
    { 
      :class => "default-table",
      :name => "ViewRenewCheckedOutItems",
      :headerText => "Items Available to Check Out",
      :noDataAction => "ShowMessageRow",
      :noDataMessage => "No Requests",
      :columns => ["TransactionNumber:Transaction Number (TN)", "DocumentType:Format Type", "Title", "Author", "DueDate:Due Date", "RenewalsAl:Can I renew?"],
      :orderBy => "TransactionNumber DESC"
    }
    ]
  end
  
  def document_class
    super() + " view_requests"
  end
  
end

