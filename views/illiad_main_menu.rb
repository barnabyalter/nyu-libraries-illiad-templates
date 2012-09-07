require File.join(File.dirname(__FILE__), 'text_page')
class IlliadMainMenu < TextPage
  
  def page_header
    "NYU Interlibrary Loan (ILL) has a new look!"
  end
  
  def text_sections
    [
    {
      :text_class => "text_section", 
      :text_id => "status",
      :paragraphs => [
        "<p>Our interlibrary loan request system is now accessible directly from your e-Shelf. </p> ",
        "<p>Use the links to the left to request materials that are unavailable in the New York University or consortium libraries and to view current and past requests. </p>",
        "<p>More information on interlibrary loan can be found here: <a href=\"https://library.nyu.edu/services/ill.html\" target=\"_blank\">https://library.nyu.edu/services/ill.html</a></p>",
        "<p>Questions? Contact Ask a Librarian: <a href=\"https://library.nyu.edu/ask/\" target=\"_blank\">https://library.nyu.edu/ask/</a></p>"
      ]
    }
    ]
  end
  
end
