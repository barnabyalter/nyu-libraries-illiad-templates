require File.join(File.dirname(__FILE__), 'form')
class BookChapterRequest < Form
  def form 
     super.merge!({
       :form_fields => [
        {:field => "PhotoJournalTitle", :field_title => "Book Title", :required => true, :note => "Please do not abbreviate unless your citation is abbreviated", :textarea => true},
        {:field => "PhotoItemAuthor", :field_title => "Book Author/Editor", :input_text => true},
        {:field => "PhotoItemPublisher", :field_title => "Publisher", :input_text => true},
        {:field => "PhotoItemPlace", :field_title => "Place of Publication", :input_text => true},
        {:field => "PhotoJournalYear", :field_title => "Date of Publication", :required => true, :input_text => true},
        {:field => "PhotoItemEdition", :field_title => "Edition", :input_text => true},
        {:field => "PhotoJournalInclusivePages", :field_title => "Pages", :required => true, :input_text => true},
        {:field => "ESPNumber", :field_title => "OCLC Number", :note => 'If given will speed request processing. OCLC numbers are found on <a href="http://www.worldcat.org" target="_blank">WorldCat</a>.', :input_text => true},
        {:field => "ISSN", :field_title => "ISSN/ISBN (International Standard Serial/Book Number)", :note => "If given will speed request processing", :input_text => true},
        {:field => "PhotoArticleAuthor", :field_title => "Chapter Author", :input_text => true},
        {:field => "PhotoArticleTitle", :field_title => "Chapter Title", :input_text => true},
        {:field => "NotWantedAfter", :field_title => "Not Wanted After Date", :required => true, :note => "Date after which the requested material will not be useful to you	(MM/DD/YYYY) Note: loans can take a minimum of 7-10 days to obtain.", :input_text => true},
        {:field => "AcceptNonEnglish", :field_title => "Will you accept the item in a language other than English?", :note => "If yes, specify acceptable languages in the notes field.", :select => {:options => [{:value => "No"},{:value => "Yes"}]}},
        {:field => "ShippingOptions", :field_title => 'Scanning services are available, within <a href="http://library.nyu.edu/copyright/" target="_blank">fair use guidelines</a>, to NYU faculty and students at global sites. Please indicate if you are in:', :select => {:options => [{:value => "Abu Dhabi"},{:value => "Other NYU Global Site"}]} },
        {:field => "CitedIn", :field_title => 'Please specify "Other" global site', :input_text => true},
        {:field => "Notes", :field_title => 'Notes', :note => "Put any information here that may help us find the item.", :textarea => true}     
       ]
     })
   end
end
