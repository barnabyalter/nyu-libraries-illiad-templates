require File.join(File.dirname(__FILE__), 'form')
class GenericRequestPeriodicalVolume < Form
  def page_name
    "Periodical Volume Request"
  end
  
  def form 
    parent_hash = super
    parent_hash.merge!({
       :hidden_fields => parent_hash[:hidden_fields].push({:name => "RequestType", :value => 'Loan'},{:name => "DocumentType", :value => 'Periodical Vol'}),
       :form_fields => [
        {:field => "LoanTitle", :field_title => "Title (Journal, Newspaper, or Conference Proceedings)", :required => true, :note => "Please do not abbreviate unless your citation is abbreviated", :textarea => true},
        {:field => "LoanPublisher", :field_title => "Publisher", :input_text => true},
        {:field => "LoanPlace", :field_title => "Place of Publication", :input_text => true},
        {:field => "LoanDate", :field_title => "Date Range Needed", :required => true, :input_text => true},
        {:field => "LoanEdition", :field_title => "Volume(s) or Issue(s) Needed", :required => true, :input_text => true},
        {:field => "ESPNumber", :field_title => "OCLC Number", :note => 'If given will speed request processing. OCLC numbers are found on <a href="http://www.worldcat.org" target="_blank">WorldCat</a>.', :input_text => true},
        {:field => "ISSN", :field_title => "ISSN (International Standard Serial Number)", :note => 'If given will speed request processing', :input_text => true},
        {:field => "NotWantedAfter", :field_title => "Not Wanted After Date", :required => true, :note => "Date after which the requested material will not be useful to you	(MM/DD/YYYY) Note: loans can take a minimum of 7-10 days to obtain.", :input_text => true},
        {:field => "AcceptNonEnglish", :field_title => "Will you accept the item in a language other than English?", :note => "If yes, specify acceptable languages in the notes field.", :select => {:options => [{:value => "No"},{:value => "Yes"}] }},
        {:field => "ShippingOptions", :field_title => "Pickup Location", :required => true, :select => {:options => [{:value => "NYU Bobst"},{:value => "NYU Abu Dhabi"},{:value => "NYU Institute of Fine Arts"},{:value => "NYU Inst Study Ancient World"},{:value => "NYU Jack Brause"}]} },        
        {:field => "Notes", :field_title => 'Notes', :note => "Put any information here that may help us find the item, as well as any other pertinent information.", :textarea => true}     
       ]
     })
   end
end
