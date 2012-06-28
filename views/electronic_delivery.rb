require File.join(File.dirname(__FILE__), 'table')
class ElectronicDelivery < Table

  def tables
    [
    { 
      :class => "default-table",
      :name => "ElectronicDelivery",
      :headerText => "Documents Available to Save/Print",
      :noDataAction => "ShowMessageRow",
      :noDataMessage => "No Articles",
      :columns => ["TransactionNumber:Transaction Number (TN)","View:Click here to view your document","DocumentType:Format Type","Size","DocumentType:Format Type","PhotoArticleAuthor:Author","PhotoJournalTitle: Journal/Book Title","Expires","Delete"],
      :orderBy => "RequestType,DocumentType,TransactionNumber DESC",
      :text_above => '
        <p>Articles posted to this page will remain accessible for <strong>15 days from the date of posting or for a maximum of 5 views</strong>. You are encouraged to print or save the document for your future use.</p>
        <p>If, prior to this time, you no longer require the use of an article, you may delete it using the "Delete" link to the right of the article information. Deleted articles cannot be recovered or re-requested.</p>
        <p>If you have trouble viewing your document, please contact the Interlibrary Loan Office at 212-998-2511 or <a href="mailto:ill@library.nyu.edu">ill@library.nyu.edu</a></p>
      '
    }
    ]
  end
  
end

