require 'mustache'
require File.join(File.dirname(__FILE__), 'helper')
class IncludeHeader < Mustache
	include Helper  
  def application_name
    "Interlibrary Loan Request System"
  end
  
  def breadcrumbs
    [
      {:title => "NYU Libraries", :link => "https://library.nyu.edu"},
      {:title => "BobCat", :link => "http://bobcat.library.nyu.edu"},
      {:title => "My Requests"}
    ]
  end
  
  def login
    '
    <ul class="login">
      <li>
        <li><a href="'+action_tag({:action=>"99"})+'" class="nyulibrary_icons_logout">Log-out <span class="logout_username">'+app_tag("USER",{:field=>"FirstName"})+'</span> </a></li>
      </li>
    </ul>
    '
  end
  
  def head_group
    {
      :application_title => "My Requests",
      :username_text =>'for '+app_tag("USER",{:field=>"FirstName"})+' '+app_tag("USER",{:field=>"LastName"}),
    }
  end
  
end
