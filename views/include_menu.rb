require 'mustache'
require File.join(File.dirname(__FILE__), 'helper')
class IncludeMenu < Mustache
	include Helper  
  def boxes
    [
      {
        :id => "shelf", 
        :header => "My Shelf #{icon_link("http://nyu.beta.libanswers.com/search/?q=eshelf&t=0")}",
        :option_groups => [
          { :id => "shelf_options", :header => nil, :options => 
            [
              { :link => "http://eshelf.library.nyu.edu/account" , :id => "account", :title => "My library account" },
              { :link => "http://ill.library.nyu.edu/illiad/illiad.dll" , :id => "ill", :title => "My interlibrary loan (ILL)", :class => "selected" },
              { :link => "http://eshelf.library.nyu.edu" , :id => "records", :title => "All saved records" }
            ]
          },
          { :id => "request", :header => "Make a request", :options => 
            [
              { :link => action_tag({:action=>"10",:form=>"22"}), :id => "request_article", :title => "Article" },
              { :link => action_tag({:action=>"10",:form=>"21"}), :id => "request_book", :title => "Book" },
              { :link => action_tag({:action=>"10",:form=>"23"}), :id => "request_book_chapter", :title => "Book chapter" },
              { :link => action_tag({:action=>"10",:form=>"20",:value=>"GenericRequestJournal"}) , :id => "request_journal", :title => "Journal" },
              { :link => action_tag({:action=>"10",:form=>"27"}), :id => "request_dissertation_thesis", :title => "Dissertation/Thesis" },
              { :link => action_tag({:action=>"10",:form=>"20",:value=>"GenericRequestAudioVisual"}), :id => "request_audio_visual", :title => "Audio/Visual" },
              { :link => action_tag({:action=>"10",:form=>"20",:value=>"GenericRequestMusicalScore"}), :id => "request_musical_score", :title => "Musical score" },
              { :link => action_tag({:action=>"10",:form=>"20",:value=>"GenericRequestMicroform"}), :id => "request_microform", :title => "Microform" },
              { :link => action_tag({:action=>"10",:form=>"29"}), :id => "request_other", :title => "Other" }
            ]
          },
          { :id => "view", :header => "View", :options => 
            [
              { :link => action_tag({:action=>"10",:form=>"62"}) , :id => "view_in_processing", :title => "Requests in processing" },
              { :link => action_tag({:action=>"10",:form=>"60"}) , :id => "view_all", :title => "Request history" },
              { :link => action_tag({:action=>"10",:form=>"64"}) , :id => "view_electronic", :title => "My available articles" }
            ]
          },
          { :id => "search_illiad", :header => "Search ILL Requests", :content => 
            '
            <form action="illiad.dll" name="Search" method="post" id="Search">
              <input type="hidden" name="IlliadForm" value="Search"> 
              <input id="SessionID" name="SessionID" type="hidden" value="'+param_tag({:name=>"SessionID"})+'"> 
              <label for="SearchCriteria">
                <input id="SearchCriteria" name="SearchCriteria" type="text" class="f-criteria">
              </label> 
              <input type="submit" name="SubmitButton" value="Search" class="f-submit">
              <div id="searchType">
                <input name="SearchType" type="hidden" id="SearchTypeAll" value="All">
              </div>
            </form>
            '
          },
          { :id => "links", :header => "Additional Options", :options => 
            [
              { :link => "http://library.nyu.edu/services/ill.html", :target => "_blank" , :id => "ill_policies", :title => "Interlibrary Loan (ILL) info & Policies" }
            ]
          }
        ]
      }
    ]
  end
  
end
