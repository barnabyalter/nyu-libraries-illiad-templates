require File.join(File.dirname(__FILE__), 'form')
class ChangeUserInformation < Form
  def page_name
    "Update My Profile"
  end

  def form
     super.merge!({
      form_id: "IlliadForm",
      footer: nil,
      hidden_fields: [
         {name: "ILLiadForm", value: self.class.name},
         {name: "Username", value: param_tag("Username") },
         {name: "SessionID", value: param_tag("SessionID") },
        #  {name: "EMailAddress", value: param_tag("EMailAddress") },
       ],
      form_fields: [
        {field: "EMailAddress", value: param_tag("EMailAddress"), input_text: true, required: true, readonly: true },
        {field: "Address", value: param_tag("Address"), field_title: "Primary Address Line 1", required: true, input_text: true},
        {field: "Address2", value: param_tag("Address2"), field_title: "Primary Address Line 2", input_text: true},
        {field: "City", value: param_tag("City"), field_title: "Primary Address City", required: true, input_text: true},
        {field: "State", value: param_tag("State"), field_title: "Primary Address State", required: true, select: true, options_group: '<#OPTION name="custom" groupname="State" selectedValue="<#PARAM name=State>" defaultValue="NONE" defaultName="Choose your State">'},
        {field: "Zip", value: param_tag("Zip"), field_title: "Primary Address Zip", required: true, input_text: true},
        {field: "SAddress", value: param_tag("SAddress"), field_title: "Secondary Address Line 1", input_text: true},
        {field: "SAddress2", value: param_tag("SAddress2"), field_title: "Secondary Address Line 2", input_text: true},
        {field: "SCity", value: param_tag("SCity"), field_title: "Secondary Address City", input_text: true},
        {field: "SState", value: param_tag("SState"), field_title: "Secondary Address State", select: true, options_group: '<#OPTION name="custom" groupname="State" selectedValue="<#PARAM name=SState>" defaultValue="NONE" defaultName="Choose your State">'},
        {field: "SZip", value: param_tag("SZip"), field_title: "Secondary Address Zip", input_text: true},
      ].map {|field| field.merge(Hash[form_fields_maxlength.find{|f| f[:field] == field[:field]}.to_a]) }
     })
   end

   def request_buttons
    '
    <div class="request_buttons">
    <input type="submit" name="SubmitButton" value="Submit Information">
    <input type="submit" name="SubmitButton" value="Cancel - Exit to Main Menu">
    </div>
    '
   end

end
