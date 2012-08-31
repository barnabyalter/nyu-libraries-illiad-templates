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
        {:field => "Other", :field_title => "Citation", :required => true, :input_text => true},
        {:field => "ESPNumber", :field_title => "OCLC Number #{oclc_popup}", :note => 'Will speed processing.', :input_text => true},
        {:field => "NotWantedAfter", :field_title => "I need this material by:", :required => true, :note => "Expect 7-10 days for delivery.", :input_text => true},
        {:field => "AcceptNonEnglish", :field_title => "Accept item in languages other than English? ", :note => "If yes, specify languages in \"Notes\" below.", :select => {:options => [{:value => "No"},{:value => "Yes"}] }},        
        {:field => "ShippingOptions", :field_title => "Pickup Location", :required => true, :select => {:options => [{:value => "NYU Bobst"},{:value => "NYU Abu Dhabi"},{:value => "NYU Institute of Fine Arts"},{:value => "NYU Inst Study Ancient World"},{:value => "NYU Jack Brause"}]} },        
        {:field => "Notes", :field_title => 'Notes', :textarea => true}     
       ]
     })
   end
end
