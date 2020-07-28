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
         {name: "EMailAddress", value: param_tag("EMailAddress") },
       ],
      form_fields: [
        {field: "Address", field_title: "Primary Address Line 1", required: true, input_text: true},
        {field: "Address2", field_title: "Primary Address Line 2", input_text: true},
        {field: "City", field_title: "Primary Address City", required: true, input_text: true},
        {field: "State", field_title: "Primary Address State", required: true, select: true, options_group: '<#OPTION name="custom" groupname="State" selectedValue="<#PARAM name=State>">'},
        {field: "Zip", field_title: "Primary Address Zip", input_text: true},
        {field: "SAddress", field_title: "Secondary Address Line 1", required: true, input_text: true},
        {field: "SAddress2", field_title: "Secondary Address Line 2", input_text: true},
        {field: "SCity", field_title: "Secondary Address City", required: true, input_text: true},
        {field: "SState", field_title: "Secondary Address State", required: true, select: true, options_group: '<#OPTION name="custom" groupname="State" selectedValue="<#PARAM name=SState>">'},
        {field: "SZip", field_title: "Secondary Address Zip", input_text: true},
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
