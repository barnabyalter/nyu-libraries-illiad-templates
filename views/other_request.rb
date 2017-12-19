require File.join(File.dirname(__FILE__), 'form')
class OtherRequest < Form
  def page_name
    "Request Other Material"
  end

  def form
    parent_hash = super
    parent_hash.merge!({
       :hidden_fields => parent_hash[:hidden_fields].push({:name => "RequestType", :value => 'Loan'}),
       :form_fields => [
        { field: "DocumentType", field_title: "Material Type", required: true, select: { options: material_type_options } },
        {:field => "Other", :field_title => "Citation", :required => true, :input_text => true},
        {:field => "ESPNumber", :field_title => "OCLC Number #{oclc_popup}", :note => 'Will speed processing.', :input_text => true},
        {:field => "NotWantedAfter", :field_title => "I need this material by:", :required => true, :note => "Plan ahead when requesting materials, if the \"not wanted after date\" is sooner than 7 days than the request will be canceled.", :input_text => true},
        {:field => "AcceptNonEnglish", :field_title => "Accept item in languages other than English? ", :note => "If yes, specify languages in \"Notes\" below.", :select => {:options => [{:value => "No"},{:value => "Yes"}] }},
        {:field => "ShippingOptions", :field_title => "Pickup Location", :required => true, :select => {:options => pickup_options} },
        {:field => "Notes", :field_title => 'Notes', :textarea => true}
       ]
     })
   end

   def material_type_options
    [
      { value: :Conference },
      { value: :Journal },
      { value: :"Audio/Visual" },
      { value: :"Musical Score" },
      { value: :Microform },
      { value: :"Dissertation/Thesis" },
      { value: :Other }
    ]
   end
end
