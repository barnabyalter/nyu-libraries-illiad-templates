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
    icon_link "https://library.answers.nyu.edu/website/faq/134617"
  end

  def isbn_popup
    icon_link "https://library.answers.nyu.edu/website/faq/134616"
  end

  def issn_popup
    icon_link "https://library.answers.nyu.edu/website/faq/134614"
  end

  # Temporarily no physical pickup locations
  def pickup_options
    [
      {value: "Scan Request"}
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
      { field: "PhotoItemEdition", maxlength: "40" }
    ]
  end

  def pre_form_text
  '<div class="alert pre-form-text" id="pre-form-text">
    <p>We are doing everything we can to enable access to library collections in this extraordinary moment. The ILL pages are being used to collect requests for all materials. </p>
    <p>At present requests can only be filled digitally. We are exploring all sourcing options as they become available in a rapidly changing landscape. </p>
  </div>'
  end
end
