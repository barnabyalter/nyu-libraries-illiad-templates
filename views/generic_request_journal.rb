require File.join(File.dirname(__FILE__), 'form')
class GenericRequestJournal < Form
  def page_name
    "Request a Journal"
  end
  
  def form 
    parent_hash = super
    parent_hash.merge!({
       :hidden_fields => parent_hash[:hidden_fields].push({:name => "RequestType", :value => 'Loan'},{:name => "DocumentType", :value => 'Periodical Vol'}),
       :form_fields => [
        {:field => "LoanTitle", :field_title => "Title", :required => true, :note => "Please do not abbreviate unless your citation is abbreviated", :input_text => true},
        {:field => "LoanPlace", :field_title => "Place of Publication", :input_text => true},
        {:field => "LoanPublisher", :field_title => "Publisher", :input_text => true},
        {:field => "LoanDate", :field_title => "Date Range Needed", :required => true, :input_text => true, :title => "(e.g., 1978-1982)"},
        {:field => "LoanEdition", :field_title => "Volume(s) or Issue(s) Needed", :required => true, :input_text => true},
        {:field => "ESPNumber", :field_title => "OCLC Number #{oclc_popup}", :note => 'Will speed processing.', :input_text => true},
        {:field => "ISSN", :field_title => "ISBN #{isbn_popup}", :note => 'Will speed processing.', :input_text => true},
        {:field => "NotWantedAfter", :field_title => "I need this material by:", :required => true, :note => "Plan ahead when requesting materials, if the \"not wanted after date\" is sooner than 7 days than the request will be canceled.", :input_text => true},
        {:field => "AcceptNonEnglish", :field_title => "Accept journal in languages other than English?", :note => "If yes, specify languages in \"Notes\" below.", :select => {:options => [{:value => "No"},{:value => "Yes"}] }},
        {:field => "ShippingOptions", :field_title => "Pickup Location", :required => true, :select => {:options => [{:value => "NYU Bobst"},{:value => "NYU Abu Dhabi"},{:value => "NYU Shanghai"},{:value => "NYU Institute of Fine Arts"},{:value => "NYU Inst Study Ancient World"},{:value => "NYU Jack Brause"}]} },        
        {:field => "Notes", :field_title => 'Notes', :textarea => true}     
       ]
     })
   end
   
   def pre_form_text
      '<div class="linkout nyulibrary_icons_information">Just need an article? Use the <a href="'+action_tag({:action=>"10",:form=>"22"})+'">Article</a> form.</div>'
    end
end
