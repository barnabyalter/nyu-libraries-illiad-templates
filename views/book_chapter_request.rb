require File.join(File.dirname(__FILE__), 'form')
class BookChapterRequest < Form
  def page_name
    "Request a Book Chapter"
  end

  def form
     super.merge!({
       :form_fields => [
        {:field => "PhotoArticleTitle", :field_title => "Chapter Title", :required => true, :input_text => true},
        {:field => "PhotoArticleAuthor", :field_title => "Chapter Author", :input_text => true},
        {:field => "PhotoJournalInclusivePages", :field_title => "Pages", :required => true, :input_text => true, :title => "(e.g., 7-12; 5, 6-8, 10-15)"},
        {:field => "PhotoJournalTitle", :field_title => "Book Title", :required => true, :note => "Please do not abbreviate unless your citation is abbreviated", :input_text => true},
        {:field => "PhotoItemAuthor", :field_title => "Book Author/Editor", :input_text => true},
        {:field => "PhotoItemPlace", :field_title => "Place of Publication", :input_text => true},
        {:field => "PhotoItemPublisher", :field_title => "Publisher", :input_text => true},
        {:field => "PhotoJournalYear", :field_title => "Publication Date", :required => true, :input_text => true},
        {:field => "PhotoItemEdition", :field_title => "Edition", :input_text => true},
        {:field => "ESPNumber", :field_title => "OCLC Number #{oclc_popup}", :note => 'Will speed processing.', :input_text => true},
        {:field => "ISSN", :field_title => "ISBN #{isbn_popup}", :note => "Will speed processing.", :input_text => true},
        {:field => "AcceptNonEnglish", :field_title => "Accept chapter in languages other than English? ", :note => "If yes, specify languages in \"Notes\" below.", :select => {:options => [{:value => "No"},{:value => "Yes"}]}},
        {:field => "ShippingOptions", :field_title => "Pickup Location", :required => true, :select => {:options => pickup_options} },
        {:field => "CitedIn", :field_title => 'Please specify "Other" global site', :input_text => true},
        {:field => "Notes", :field_title => 'Notes', :textarea => true}
       ]
     })
   end

   def pre_form_text
     '<div class="linkout nyulibrary_icons_information">Need the whole book? Use the <a href="'+action_tag({:action=>"10",:form=>"21"})+'">Book</a> form.</div>'
   end
end
