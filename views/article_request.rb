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
        {:field => "AcceptNonEnglish", :field_title => "Accept article in languages other than English? ", :note => "If yes, specify languages in \"Notes\" below.", :select => {:options => [{:value => "No"},{:value => "Yes"}] }},
        {:field => "ShippingOptions", :field_title => "Pickup Location", :required => true, :select => {:options => pickup_options} },
        {:field => "CitedIn", :field_title => 'Please specify "Other" global site', :input_text => true},
        {:field => "Notes", :field_title => 'Notes', :textarea => true}
       ]
     })
   end

end
