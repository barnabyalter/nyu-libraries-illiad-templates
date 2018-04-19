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
        {:field => "LoanTitle", :field_title => "Title", :required => true, :note => "Please do not abbreviate unless your citation is abbreviated", :input_text => true},
        {:field => "LoanAuthor", :field_title => "Author/Editors", :required => true, :input_text => true},
        {:field => "LoanPlace", :field_title => "Place of Publication", :input_text => true},
        {:field => "LoanPublisher", :field_title => "Publisher", :input_text => true},
        {:field => "LoanDate", :field_title => "Publication Date", :required => true, :input_text => true},
        {:field => "LoanEdition", :field_title => "Edition", :input_text => true},
        {:field => "ESPNumber", :field_title => "OCLC Number #{oclc_popup}", :note => 'Will speed  processing.', :input_text => true},
        {:field => "ISSN", :field_title => "ISBN #{isbn_popup}", :note => 'Will speed processing', :input_text => true},
        {:field => "AcceptNonEnglish", :field_title => "Accept book in languages other than English?", :note => "If yes, specify languages in \"Notes\" below.", :select => {:options => [{:value => "No"},{:value => "Yes"}] }},
        {:field => "AcceptAlternateEdition", :field_title => "Accept an alternate edition?", :select => {:options => [{:value => "No"},{:value => "Yes"}] }},
        {:field => "ShippingOptions", :field_title => "Pickup Location", :required => true, :select => {:options => pickup_options} },
        {:field => "Notes", :field_title => 'Notes', :textarea => true}
      ].map {|field| field.merge(Hash[form_fields_maxlength.find{|f| f[:field] == field[:field]}.to_a]) }
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
