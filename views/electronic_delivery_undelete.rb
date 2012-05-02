require File.join(File.dirname(__FILE__), 'table')
class ElectronicDeliveryUndelete < Table

  def tables
    [
    { 
      :class => "default-table",
      :name => "ElectronicDeliveryUndelete",
      :headerText => "Deleted Electronically Received Articles"
    }
    ]
  end
  
end