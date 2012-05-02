require File.join(File.dirname(__FILE__), 'table')
class ViewSearchResults < Table

  def tables
    [
    { 
      :class => "default-table",
      :name => "ViewSearchResults",
      :headerText => "Search Results",
      :noDataAction => "ShowMessageRow",
      :noDataMessage => "No Results", 
      :columns => ["TransactionNumber:Transaction","DocumentType:Type","Title","Author","TransactionStatus:Status"]
    }
    ]
  end
  
end