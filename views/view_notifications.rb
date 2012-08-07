require File.join(File.dirname(__FILE__), 'table')
class ViewNotifications < Table

  def meta
    "#{super} <link href=\"#{action_tag({:action=>"2", :type=>"41", :value=>"RSSID", :valueType=>"lookup", :absolutePath=>"false", :includeSessionID=>"false"})}\" rel=\"alternate\" type=\"application/rss+xml\" title=\"ILLiad Notifications\" />"
  end

  def tables
    [
    { 
      :class => "default-table",
      :name => "ViewNotifications",
      :headerText => "Notifications",
      :noDataAction => "ShowMessageRow",
      :noDataMessage => "No Notifications",
      :maxRows => "20",
      :text_above => "
        <p><a href=\"#{action_tag({:action=>"2", :type=>"41", :value=>"RSSID", :valueType=>"lookup", :absolutePath=>"false", :includeSessionID=>"false"})}\">Subscribe to Notifications Feed</a></p>
      "
    }
    ]
  end
  
end

