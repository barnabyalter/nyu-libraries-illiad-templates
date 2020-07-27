require File.join(File.dirname(__FILE__), 'form')
class ChangeUserInformation < Form
  def page_name
    "Change Personal Information"
  end

  def form
     super.merge!({
      form_id: "IlliadForm",
      :form_fields => [
        {:field => "Address", :field_title => "Primary Address Line 1", :required => true, :input_text => true},
        {:field => "Address2", :field_title => "Primary Address Line 2", :input_text => true},
        {:field => "City", :field_title => "Primary Address City", :required => true, :input_text => true, :title => "(e.g., 7-12; 5, 6-8, 10-15)"},
        {:field => "State", :field_title => "Primary Address State", :required => true, :note => "Please do not abbreviate unless your citation is abbreviated", :input_text => true},
        {:field => "Zip", :field_title => "Primary Address Zip", :input_text => true},
      ].map {|field| field.merge(Hash[form_fields_maxlength.find{|f| f[:field] == field[:field]}.to_a]) }
     })
   end
   
end
