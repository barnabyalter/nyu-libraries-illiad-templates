module Helper
  def app_tag tag_name, params = {}
    str = "<##{tag_name.upcase}"
    params.each do |name, value|
      str += " #{name}=\"#{value}\""
    end
    str += ">"
    return str
  end
  
  def action_tag params = {}
    app_tag "ACTION", params
  end
  
  def status
    app_tag "STATUS"
  end
  
  def footer
    include_tag "include_footer.html"
  end
  
  def include_tag filename
    app_tag "INCLUDE", { :filename => filename }
  end
  
  def menu_tag params = { :name => "transaction", :separator => "|" }
    app_tag "MENU", params
  end
  
  def param_tag name
    app_tag "PARAM", { :name => name }
  end
  
  def error_tag name
    app_tag "ERROR", { :name => "ERROR#{name}" }
  end
  
  def icon_link url, css_classes = ["nyulibrary_icons_help", "nyulibrary_help", "iconlink"], title = nil
    "<a href=\"#{url}\" class=\"#{css_classes.join(" ")}\" title=\"#{title}\">&nbsp;</a>"
  end
end