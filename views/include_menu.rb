require 'mustache'
require File.join(File.dirname(__FILE__), 'helper')
class IncludeMenu < Mustache
	include Helper
  def boxes
    [
      {
        :id => "shelf",
        :header => "My Shelf",
        :option_groups => [
          { :id => "shelf_options", :header => nil, :options =>
            [
              { :link => "https://eshelf.library.nyu.edu/account" , :id => "account", :title => "My library account" },
              { :link => "https://ill.library.nyu.edu/illiad/illiad.dll" , :id => "ill", :title => "My interlibrary loan (ILL)", :class => "selected" },
              { :link => "https://eshelf.library.nyu.edu" , :id => "records", :title => "All saved records" }
            ]
          },
          { :id => "request", :header => "Make a request", :options =>
            [
              { :link => action_tag({:action=>"10",:form=>"22"}), :id => "request_article", :title => "Article" },
              { :link => action_tag({:action=>"10",:form=>"21"}), :id => "request_book", :title => "Book" },
              { :link => action_tag({:action=>"10",:form=>"23"}), :id => "request_book_chapter", :title => "Book chapter" },
              { :link => action_tag({:action=>"10",:form=>"29"}), :id => "request_other", :title => "Other" }
            ]
          },
          { :id => "view", :header => "View", :options =>
            [
              { :link => action_tag({:action=>"10",:form=>"60"}) , :id => "view_all", :title => "Request history" }
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
              { :link => "https://library.nyu.edu/services/borrowing/from-non-nyu-libraries/interlibrary-loan/", :target => "_blank" , :id => "ill_policies", :title => "Interlibrary Loan (ILL) info & Policies" }
            ]
          }
        ]
      }
    ]
  end

end
