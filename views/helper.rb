module Helper
  def app_tag tag_name, params = {}
    str = "<##{tag_name.upcase}"
    params.each do |name, value|
      # if we have multiple values, create separate html attribute for each; needed to deal with redundant "item" attributes
      # atlas docs: https://support.atlas-sys.com/hc/en-us/articles/360011907513-Adding-and-Removing-Menu-Options-v9-0-
      if value.is_a? Array
        value.each do |val|
          str += " #{name}=\"#{val}\""
        end
      else
        str += " #{name}=\"#{value}\""
      end
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

  def menu_tag params = { :name => "transaction", :separator => "|", :item => ["Edit:Edit Request", "Cancel:Cancel Request", "Renew:Renew Request", "ViewPDF:View PDF", "DeletePDF:Delete PDF", "Clone:Clone Request"]}
    app_tag "MENU", params
  end

  def param_tag name
    app_tag "PARAM", { :name => name }
  end

  def error_tag name
    app_tag "ERROR", { :name => "ERROR#{name}" }
  end

  def icon_link url, target="_blank", css_classes = ["nyulibrary_icons_help", "iconlink"], title = nil
    "<a href=\"#{url}\" class=\"#{css_classes.join(" ")}\" title=\"#{title}\" target=\"#{target}\">&nbsp;</a>"
  end
end
