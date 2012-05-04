require 'mustache'
class IncludeMenu < Mustache
  
  def boxes
    [
      {
        :id => "shelf", 
        :header => 'My Shelf <a href="http://library.nyu.edu/info/eshelf.html" class="nyulibrary_icons_help nyulibrary_help" style="text-decoration:none;" title="">&nbsp;</a>',
        :option_groups => [
          { :id => "shelf_options", :header => nil, :options => 
            [
              { :link => "http://eshelf.library.nyu.edu/account" , :id => "account", :title => "My library account" },
              { :link => "http://illdev.library.nyu.edu" , :id => "ill", :title => "My interlibrary loan (ILL)", :class => "selected" },
              { :link => "http://eshelf.library.nyu.edu" , :id => "records", :title => "All saved records" }
            ]
          },
          { :id => "request", :header => "Request", :options => 
            [
              { :link => '<#ACTION action="10" form="22">', :id => "request_article", :title => "Article" },
              { :link => '<#ACTION action="10" form="21">', :id => "request_book", :title => "Book" },
              { :link => '<#ACTION action="10" form="23">', :id => "request_book_chapter", :title => "Book Chapter" },
              { :link => '<#ACTION action="10" form="20" value="GenericRequestPeriodicalVolume">' , :id => "request_periodical_volume", :title => "Periodical Volume" },
              { :link => '<#ACTION action="10" form="27">', :id => "request_dissertation_thesis", :title => "Dissertation/Thesis" },
              { :link => '<#ACTION action="10" form="20" value="GenericRequestAudioVisual">', :id => "request_audio_visual", :title => "Audio/Visual" },
              { :link => '<#ACTION action="10" form="20" value="GenericRequestMusicalScore">', :id => "request_musical_score", :title => "Musical Score" },
              { :link => '<#ACTION action="10" form="20" value="GenericRequestMicroform">', :id => "request_microform", :title => "Microform" },
              { :link => '<#ACTION action="10" form="29">', :id => "request_other", :title => "Other" }
            ]
          },
          { :id => "view", :header => "View", :options => 
            [
              { :link => '<#ACTION action="10" form="60">' , :id => "view_all", :title => "All Requests" },
              #{ :link => '<#ACTION action="10" form="62">' , :id => "view_outstanding", :title => "Outstanding Requests" },
              { :link => '<#ACTION action="10" form="64">' , :id => "view_electronic", :title => "Electronically Received Articles" },
              #{ :link => '<#ACTION action="10" form="66">' , :id => "view_checked_out", :title => "Checked Out Items" },
              #{ :link => '<#ACTION action="10" form="70">' , :id => "view_cancelled", :title => "Cancelled Requests" },
              #{ :link => '<#ACTION action="10" form="68">' , :id => "view_history", :title => "History Requests" },
              #{ :link => '<#ACTION action="10" form="60">' , :id => "view_all", :title => "All Requests" },
              { :link => '<#ACTION action="10" form="73">' , :id => "view_notifications", :title => "Notifications" }
            ]
          },
          { :id => "search_illiad", :header => "Search", :content => 
            '
            <form action="illiad.dll" name="Search" method="post" id="Search">
              <input type="hidden" name="IlliadForm" value="Search"> 
              <input id="SessionID" name="SessionID" type="hidden" value="<#PARAM name="SessionID">"> 
              <label for="SearchCriteria">
                <input id="SearchCriteria" name="SearchCriteria" type="text" class="f-criteria">
              </label> 
              <input type="submit" name="SubmitButton" value="Search" class="f-submit">
              <div id="searchType">
                <input name="SearchType" type="hidden" id="SearchTypeAll" value="All">
              </div>
            </form>
            '
          }
        ]
      }
    ]
  end
  
end
