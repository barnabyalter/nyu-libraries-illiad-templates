require File.join(File.dirname(__FILE__), 'form')
class ChangeUserInformation < Form
  def page_name
    "Update Patron Address"
  end

  def form
     super.merge!({
      form_id: "IlliadForm",
      form_fields: [
        {field: "Address", field_title: "Primary Address Line 1", required: true, input_text: true},
        {field: "Address2", field_title: "Primary Address Line 2", input_text: true},
        {field: "City", field_title: "Primary Address City", required: true, input_text: true},
        {field: "State", field_title: "Primary Address State", required: true, select: true, options_group: '<#OPTION name="custom" groupname="State" selectedValue="<#PARAM name=State>" />'},
        {field: "Zip", field_title: "Primary Address Zip", input_text: true},
      ].map {|field| field.merge(Hash[form_fields_maxlength.find{|f| f[:field] == field[:field]}.to_a]) }
     })
   end

end
