require File.join(File.dirname(__FILE__), 'form')
class ArticleRequest < Form
  
  def page_name
    "Request an Article"
  end
  
  def form 
     super.merge!({
       :form_fields => [
        {:field => "PhotoArticleTitle", :field_title => "Article Title", :required => true, :input_text => true},
        {:field => "PhotoArticleAuthor", :field_title => "Article Author", :input_text => true},
        {:field => "PhotoJournalTitle", :field_title => "Journal Title", :required => true, :note => "Please do not abbreviate unless your citation is abbreviated", :input_text => true},
        {:field => "PhotoJournalVolume", :field_title => "Volume Number", :required => true, :input_text => true},
        {:field => "PhotoJournalIssue", :field_title => "Issue Number", :input_text => true},
        {:field => "PhotoJournalYear", :field_title => "Year", :required => true, :input_text => true},
        {:field => "PhotoJournalInclusivePages", :field_title => "Pages", :required => true, :input_text => true, :title => "(e.g., 7-12; 5, 6-8, 10-15)"},
        {:field => "ESPNumber", :field_title => "OCLC Number #{oclc_popup}", :note => 'Will speed processing.', :input_text => true},
        {:field => "ISSN", :field_title => "ISSN #{issn_popup}", :note => "Will speed processing.", :input_text => true},
        {:field => "NotWantedAfter", :field_title => "I need this material by:", :required => true, :note => "Plan ahead when requesting materials, if the \"not wanted after date\" is sooner than 7 days than the request will be canceled.", :input_text => true},
        {:field => "AcceptNonEnglish", :field_title => "Accept article in languages other than English? ", :note => "If yes, specify languages in \"Notes\" below.", :select => {:options => [{:value => "No"},{:value => "Yes"}] }},
        {:field => "ShippingOptions", :field_title => 'Are you an NYU student at a global site? Request a scan of an NYU item by indicating your location:', :note => "Request must be within <a href=\"http://nyu.libguides.com/content.php?pid=133679&sid=1146824\" target=\"_blank\">fair use guidleines</a>.", :select => {:options => [{:value => "Abu Dhabi", :title => "Abu Dhabi"},{:value => "Shanghai", :title => "Shanghai"},{:value => "Other NYU Global Site", :title => "Other NYU Global Site"}]} },
        {:field => "CitedIn", :field_title => 'Please specify "Other" global site', :input_text => true},
        {:field => "Notes", :field_title => 'Notes', :textarea => true}     
       ]
     })
   end
   
   def pre_form_text
     '<div class="linkout nyulibrary_icons_information">Need entire volume(s) or issue(s)? Use the <a href="'+action_tag({:action=>"10",:form=>"20",:value=>"GenericRequestJournal"})+'">Journal</a> form.</div>'
   end
end