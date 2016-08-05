require File.join(File.dirname(__FILE__), 'text_page')
class IlliadMainMenu < TextPage

  def page_header
    "Interlibrary Loan (ILL)"
  end

  def text_sections
    [
    {
      :text_class => "text_section",
      :text_id => "status",
      :paragraphs => [
        "<p>Use the links to the left to request materials that are unavailable in the New York University or consortium libraries and to view current and past requests.</p> ",
        "<p>Want more information? Visit <a href=\"https://library.nyu.edu/services/borrowing/from-non-nyu-libraries/interlibrary-loan/\" target=\"_blank\">https://library.nyu.edu/services/borrowing/from-non-nyu-libraries/interlibrary-loan/</a> for details about who can use ILL, how long it takes, how to pick up materials, etc.</p>"
      ]
    }
    ]
  end

end
