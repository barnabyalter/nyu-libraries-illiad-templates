require File.join(File.dirname(__FILE__), 'layout')
class Form < Layout
  def content
    mustache = Kernel.const_get(self.class.name).new
    mustache.template_file = File.join(File.dirname(__FILE__), "form.html.mustache")
    mustache.render
  end

  def form
    count = 0
    {
       :form_header => page_name,
       :form_name => self.class.name,
       :form_id => "IlliadForm",
       :form_action => app_tag("DLL"),
       :form_method => "post",
       #:sub_header => "Describe the item you want",
       :count => lambda { return count += 1 },
       :param_tag => lambda { |field| param_tag field },
       :error_tag => lambda { |field| error_tag field },
       :hidden_fields => [
         {:name => "ILLiadForm", :value => self.class.name},
         {:name => "Username", :value => param_tag("Username") },
         {:name => "SessionID", :value => param_tag("SessionID") }
       ],
       :footer => '<b>By submitting this request you agree to adhere to all restrictions regarding this material expressed in <a href="http://guides.nyu.edu/friendly.php?s=copyright" target="_blank">U.S. Copyright Law</a>.</b>',
       :required_text => "Indicates required field",
       :required_class => "req",
       :required_indicator => "*"
     }
  end

  def request_buttons
    include_tag "include_request_buttons.html"
  end

  def oclc_popup
    icon_link "https://library.answers.nyu.edu/faq/134617"
  end

  def isbn_popup
    icon_link "https://library.answers.nyu.edu/faq/134616"
  end

  def issn_popup
    icon_link "https://library.answers.nyu.edu/faq/134614"
  end

  def faq_popup
    icon_link "https://library.answers.nyu.edu/faq/331018"
  end

  def pickup_options
    [
      {:value => "BOBLK", :title => "NYU New York (Bobst Locker pickup)"},
      {:value => "DIBLK", :title => "NYU New York (Dibner Locker Pickup)"},
      {:value => "HOMED", :title => "NYU New York (Home Delivery)"},
      {:value => "HOMED", :title => "Continental US (Home Delivery)"},
      {:value => "NY-GLOBAL", :title => "NYU  Remote (Global)"},
      {:value => "NYUAB", :title => "NYU Abu Dhabi Campus"},
      {:value => "NYUSH-MAIN", :title => "NYU Shanghai (Academic Building)"},
      {:value => "NYUSH-SHINMAY", :title => "NYU Shanghai (Go Local - Shinmay)"},
      {:value => "NYUSH-FUHUI", :title => "NYU Shanghai (Go Local - Fuhui)"},
      {:value => "NYUSH-REMOTE",:title => "NYU Shanghai Remote"},
      {:value => "OTHER", :title => "Other"},
    ]
  end

  def scan_option
    [
      {:value => "Scan Request"}
    ]
  end

  # def pickup_options
  #   [
  #     {:value => "NYU Bobst"},
  #     {:value => "NYU Abu Dhabi"},
  #     {:value => "NYU Shanghai"},
  #     {:value => "NYU Bern Dibner"},
  #     {:value => "NYU Courant"},
  #     {:value => "NYU Institute of Fine Arts"},
  #     {:value => "NYU Inst Study Ancient World"},
  #     {:value => "NYU Jack Brause"},
  #     {:value => "NYU Lapidus Health Sciences"}
  #   ]
  # end

  def form_fields_maxlength
    [
      { field: "PhotoArticleTitle", maxlength: "250" },
      { field: "PhotoArticleAuthor", maxlength: "100" },
      { field: "PhotoJournalTitle", maxlength: "255" },
      { field: "PhotoJournalVolume", maxlength: "30" },
      { field: "PhotoJournalIssue", maxlength: "30" },
      { field: "PhotoJournalYear", maxlength: "30" },
      { field: "PhotoJournalInclusivePages", maxlength: "30" },
      { field: "ESPNumber", maxlength: "32" },
      { field: "ISSN", maxlength: "20" },
      { field: "Notes", maxlength: "200" },
      { field: "LoanTitle", maxlength: "255" },
      { field: "LoanAuthor", maxlength: "100" },
      { field: "LoanPlace", maxlength: "30" },
      { field: "LoanPublisher", maxlength: "50" },
      { field: "LoanDate", maxlength: "30" },
      { field: "LoanEdition", maxlength: "30" },
      { field: "PhotoItemAuthor", maxlength: "100" },
      { field: "PhotoItemPlace", maxlength: "40" },
      { field: "PhotoItemPublisher", maxlength: "40" },
      { field: "PhotoItemEdition", maxlength: "40" },
      { field: "Address", maxlength: "40" },
      { field: "Address2", maxlength: "40" },
      { field: "City", maxlength: "30" },
      { field: "State", maxlength: "2" },
      { field: "Zip", maxlength: "10" },
      { field: "SAddress", maxlength: "40" },
      { field: "SAddress2", maxlength: "40" },
      { field: "SCity", maxlength: "30" },
      { field: "SState", maxlength: "2" },
      { field: "SZip", maxlength: "10" }
    ]
  end

  def pre_form_text
  '<div class="alert pre-form-text" id="pre-form-text">
    <p><strong>At present requests can only be filled digitally. We are exploring all sourcing options as they become available in a rapidly changing landscape. </strong></p>
    <p><strong>If this item is for a Course: </strong>
    <ul>
      <li>Instructors make your course item request using the <a href="https://ares.library.nyu.edu" target="_blank">Course Reserves System</a></li>
      <li>Students email your course item request to <a href="mailto:lib-bobst-reserve@nyu.edu">lib-bobst-reserve@nyu.edu</a></li>
    </ul>
    </p>
  </div>'
  end
end
