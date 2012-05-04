require File.join(File.dirname(__FILE__), 'table')
class ViewRequestHistory < Table

  def filter_by
    true
  end

  def tables
    [
    { 
      :class => "default-table",
      :name => "ViewRequestHistory",
      :headerText => "Request History",
      :noDataAction => "ShowMessageRow",
      :noDataMessage => "No Requests"
    }
    ]
  end
  
  def document_class
    super() + " view_requests"
  end
  
end

