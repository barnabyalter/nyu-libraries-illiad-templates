require File.join(File.dirname(__FILE__), 'table')
class DetailedInformation < Table

  def tables
    [
    { 
      :class => "default-table",
      :name => "DetailedInformation",
      :headerText => "Request Information",
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
      :columns => ["DateTime:Date/Time","ChangedTo:Status","ChangedBy:Changed By"]
    },
    { 
      :class => "default-table",
      :name => "BillingInformation",
      :headerText => "Billing",
      :noDataAction => "ShowMessageRow",
      :noDataMessage => "No Billing",
      :columns => ["ChargeDate:Date/Time","ChargeName:Charge","ChargeBase:Base","ChargeUnit:Unit","ChargeQty:Quantity","ChargeAmount:Amount","ChargeDesc:Description","ChargeNote:Note"]
    }
    ]
  end
  
  def menu
    '<#MENU name="transaction" separator="|">'
  end
  
end