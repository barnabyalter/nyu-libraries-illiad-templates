require File.join(File.dirname(__FILE__), 'form')
class GenericRequestAudioVisual < Form
  def page_name
    "Request Audio or Visual Material"
  end
  
  def form 
    parent_hash = super
    parent_hash.merge!({
       :hidden_fields => parent_hash[:hidden_fields].push({:name => "RequestType", :value => 'Loan'},{:name => "DocumentType", :value => 'Audio/Visual'}),
       :form_fields => [
        {:field => "LoanTitle", :field_title => "Title", :required => true, :note => "Please do not abbreviate unless your citation is abbreviated", :input_text => true},
        {:field => "LoanAuthor", :field_title => "Creator", :required => true, :input_text => true}, 
        {:field => "LoanPlace", :field_title => "Place of Recording/Production", :input_text => true},
        {:field => "LoanPublisher", :field_title => "Recording/Production Company", :input_text => true},
        {:field => "LoanDate", :field_title => "Recording/Production Date", :required => true, :input_text => true},
        {:field => "LoanEdition", :field_title => "Preferred Format", :required => true, :select => {:options => [{:value=>"CD"},{:value=>"DVD"},{:value=>"LP"},{:value=>"Cassette"},{:value=>"Film"},{:value=>'Other (write in "Notes" below)'}]}},
        {:field => "AcceptAlternateEdition", :field_title => "Accept an alternate format of this item?", :select => {:options => [{:value => "No"},{:value => "Yes"}] }},
        {:field => "ESPNumber", :field_title => "OCLC Number #{oclc_popup}", :note => 'Will speed processing.', :input_text => true},
        {:field => "NotWantedAfter", :field_title => "I need this material by:", :required => true, :note => "Plan ahead when requesting materials, if the \"not wanted after date\" is sooner than 7 days than the request will be canceled.", :input_text => true},
        {:field => "AcceptNonEnglish", :field_title => "Accept item in languages other than English (without English subtitles)?", :note => "If yes, specify language(s) in \"Notes\" below.", :select => {:options => [{:value => "No"},{:value => "Yes"}] }},
        {:field => "ShippingOptions", :field_title => "Pickup Location", :required => true, :select => {:options => [{:value => "NYU Bobst"},{:value => "NYU Abu Dhabi"},{:value => "NYU Shanghai"},{:value => "NYU Bern Dibner"},{:value => "NYU Courant"},{:value => "NYU Institute of Fine Arts"},{:value => "NYU Inst Study Ancient World"},{:value => "NYU Jack Brause"}]} },
        {:field => "Notes", :field_title => 'Notes', :textarea => true}     
       ]
     })
   end
end