require File.join(File.dirname(__FILE__), 'table')
class ViewNotificationsDetail < Table

  def tables
    [
    { 
      :class => "default-table",
      :name => "NotificationInformation",
      :headerText => "Notification Information",
      :hideColumnHeaders => "true"
    }
    ]
  end
  
end