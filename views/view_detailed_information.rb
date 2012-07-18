require File.join(File.dirname(__FILE__), 'table')
class ViewDetailedInformation < Table

  def tables
    [
    { 
      :class => "default-table",
      :name => "DetailedInformation",
      :headerText => "Transaction Information",
      :hideColumnHeaders => "true"
    },
    { 
      :class => "default-table",
      :name => "NotesInformation",
      :headerText => "Notes",
      :noDataAction => "ShowMessageRow",
      :noDataMessage => "No Notes",
      :columns => ["NoteDate:Date/Time","AddedBy:Added By","Note"]
    },
    { 
      :class => "default-table",
      :name => "TrackingInformation",
      :headerText => "Tracking",
      :noDataAction => "ShowMessageRow",
      :noDataMessage => "No Tracking",
      :columns => ["DateTime:Date/Time","ChangedTo:Status"]
    }
    ]
  end
  
  def menu
    app_tag "MENU", 'name="transaction" separator="|"'
  end
  
end