require File.join(File.dirname(__FILE__), 'form')
class GenericRequestMusicalScore < Form
  def page_name
    "Request a Musical Score"
  end
  
  def form 
    parent_hash = super
    parent_hash.merge!({
       :hidden_fields => parent_hash[:hidden_fields].push({:name => "RequestType", :value => 'Loan'},{:name => "DocumentType", :value => 'Musical Score'}),
       :form_fields => [
        {:field => "LoanTitle", :field_title => "Title", :required => true, :note => "Please do not abbreviate unless your citation is abbreviated", :input_text => true},
        {:field => "LoanAuthor", :field_title => "Composer", :required => true, :input_text => true}, 
        {:field => "LoanPlace", :field_title => "Place of Publication", :input_text => true},
        {:field => "LoanPublisher", :field_title => "Publisher", :input_text => true},
        {:field => "LoanDate", :field_title => "Publication Date", :required => true, :input_text => true},
        {:field => "LoanEdition", :field_title => "Parts Needed", :input_text => true, :title => "(e.g., SATB, violin, trio)"},
        {:field => "ESPNumber", :field_title => "OCLC Number #{oclc_popup}", :note => 'Will speed processing.', :input_text => true},
        {:field => "ISSN", :field_title => "ISBN #{isbn_popup}", :note => 'Will speed processing', :input_text => true},
        {:field => "NotWantedAfter", :field_title => "I need this material by:", :required => true, :note => "Plan ahead when requesting materials, if the \"not wanted after date\" is sooner than 7 days than the request will be canceled.", :input_text => true},
        {:field => "AcceptNonEnglish", :field_title => "Accept score in languages other than English?", :note => "If yes, specify languages in \"Notes\" below.", :select => {:options => [{:value => "No"},{:value => "Yes"}] }},
        {:field => "AcceptAlternateEdition", :field_title => "Accept an alternate edition? ", :select => {:options => [{:value => "No"},{:value => "Yes"}] }},
        {:field => "ShippingOptions", :field_title => "Pickup Location", :required => true, :select => {:options => [{:value => "NYU Bobst"},{:value => "NYU Abu Dhabi"},{:value => "NYU Institute of Fine Arts"},{:value => "NYU Inst Study Ancient World"},{:value => "NYU Jack Brause"}]} },        
        {:field => "Notes", :field_title => 'Notes', :textarea => true}     
       ]
     })
   end
end
