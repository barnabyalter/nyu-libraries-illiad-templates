require 'mustache'
class IncludeHeader < Mustache
  
  def application_name
    "Interlibrary Loan Request System"
  end
  
  def breadcrumbs
    [
      {:title => "NYU Libraries", :link => "https://library.nyu.edu"},
      {:title => "BobCat", :link => "http://bobcat.library.nyu.edu"},
      {:title => "E-Shelf"}
    ]
  end
  
  def login
    '
    <ul class="login">
      <li>
        <li><a href="<#ACTION action="99">" class="nyulibrary_icons_logout">Log-out <span class="logout_username"><#USER field="FirstName"></span> </a></li>
      </li>
    </ul>
    '
  end
  
  def head_group
    {
      :application_title => "e-Shelf",
      :username_text =>'for <#USER field="FirstName"> <#USER field="LastName">',
    }
  end
  
end
