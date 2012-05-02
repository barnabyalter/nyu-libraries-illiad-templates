require File.join(File.dirname(__FILE__), 'table')
class ViewRequestHistory < Table

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
  
end

