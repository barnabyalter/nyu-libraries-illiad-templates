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
              { :link => "https://bobcat.library.nyu.edu/primo-explore/account?vid=NYU&section=overview" , :id => "account", :title => "Library account" },
              { :link => "/" , :id => "ill", :title => "My Requests", :class => "selected" },
              { :link => "https://eshelf.library.nyu.edu" , :id => "records", :title => "Saved Items" },
              { :link => action_tag({:action=>"10",:form=>"81"}), :id => "change_user_information", :title => "Update my delivery address" }
            ]
          },
          { :id => "request", :header => "Make an Interlibrary Loan (ILL) request", :options =>
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
          { :id => "search_illiad", :header => "Search My Requests", :content =>
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
          { :id => "links", :header => "Service Information and Policies", :options =>
            [
              { :link => "#", :target => "_blank" , :id => "delivery_policies", :title => "Delivery Services Info & Policies" },
              { :link => "https://library.nyu.edu/services/borrowing/from-non-nyu-libraries/interlibrary-loan/", :target => "_blank" , :id => "ill_policies", :title => "Interlibrary Loan (ILL) info & Policies" }
            ]
          }
        ]
      }
    ]
  end

end
