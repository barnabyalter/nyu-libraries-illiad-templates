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
        {:field => "NotWantedAfter", :field_title => "I need this material by:", :required => true, :note => "Please pick a date that gives us time to fill the request, taking into account shipping and processing. This date will not affect the speed or priority of request processing.", :input_text => true},
        {:field => "AcceptNonEnglish", :field_title => "Accept book in languages other than English?", :note => "If yes, specify languages in \"Notes\" below.", :select => {:options => [{:value => "No"},{:value => "Yes"}] }},
        {:field => "AcceptAlternateEdition", :field_title => "Accept an alternate edition?", :select => {:options => [{:value => "No"},{:value => "Yes"}] }},
        {:field => "ShippingOptions", :field_title => "Your location and delivery preferences #{faq_popup}", :note => "We may explore different options for filling your request depending on where you are currently located. Please see the FAQ for more details.", :required => true, :select => {:options => pickup_options} },
        {:field => "Notes", :field_title => 'Notes', :textarea => true}
       ].map {|field| field.merge(Hash[form_fields_maxlength.find{|f| f[:field] == field[:field]}.to_a]) }
     })
   end

   def pre_fields_text
      '<div>
        <div>NYU Libraries will pursue a digital first fulfillment approach for all requests for materials not available in our collection. If we are unable to source an electronic version, we will try to borrow a print copy on your behalf. Different sourcing options may apply based on your current location.</div>
        <div class="linkout nyulibrary_icons_information">Just need a chapter? Use the <a href="'+action_tag({:action=>"10",:form=>"23"})+'">Book Chapter</a> form.</div>
      </div>'
    end
end
