require File.join(File.dirname(__FILE__), 'form')
class LoanRequest < Form
  def page_name
    "Request a Book"
  end
  
  def form 
    super.merge!({
       :form_fields => [
        {:field => "LoanTitle", :field_title => "Title", :required => true, :note => "Please do not abbreviate unless your citation is abbreviated", :input_text => true},
        {:field => "LoanAuthor", :field_title => "Author/Editors", :required => true, :input_text => true},         
        {:field => "LoanPlace", :field_title => "Place of Publication", :input_text => true},
        {:field => "LoanPublisher", :field_title => "Publisher", :input_text => true},
        {:field => "LoanDate", :field_title => "Publication Date", :required => true, :input_text => true},
        {:field => "LoanEdition", :field_title => "Edition", :input_text => true},
        {:field => "ESPNumber", :field_title => "OCLC Number #{oclc_popup}", :note => 'Will speed  processing.', :input_text => true},
        {:field => "ISSN", :field_title => "ISBN #{isbn_popup}", :note => 'Will speed processing', :input_text => true},
        {:field => "NotWantedAfter", :field_title => "I need this material by:", :required => true, :note => "Expect 7-10 days for delivery.", :input_text => true},
        {:field => "AcceptNonEnglish", :field_title => "Accept book in languages other than English?", :note => "If yes, specify languages in \"Notes\" below.", :select => {:options => [{:value => "No"},{:value => "Yes"}] }},
        {:field => "AcceptAlternateEdition", :field_title => "Accept an alternate edition?", :select => {:options => [{:value => "No"},{:value => "Yes"}] }},
        {:field => "ShippingOptions", :field_title => "Pickup Location", :required => true, :select => {:options => [{:value => "NYU Bobst"},{:value => "NYU Abu Dhabi"},{:value => "NYU Institute of Fine Arts"},{:value => "NYU Inst Study Ancient World"},{:value => "NYU Jack Brause"}]} },
        {:field => "Notes", :field_title => 'Notes', :textarea => true}     
       ]
     })
   end
   
   def pre_form_text
      '<div class="linkout nyulibrary_icons_information">
        Just need a chapter? Use the <a href="'+action_tag({:action=>"10",:form=>"23"})+'">Book Chapter</a> form.<br />
        <a href="'+action_tag({:action=>"10",:form=>"27"})+'">Request a Dissertation or Thesis</a>
      </div>'
    end
end
