require File.join(File.dirname(__FILE__), 'table')
class IlliadMainMenu < Table

  def page_header
    "Interlibrary Loan (ILL)"
  end

  def tables
    [
    {
      :class => "default-table",
      :name => "ElectronicDelivery",
      :headerText => "Documents Available to Save/Print",
      :noDataAction => "ShowMessageRow",
      :noDataMessage => "No Articles",
      :columns => ["TransactionNumber:Transaction Number (TN)","View:Click here to view your document","DocumentType:Format Type","Size","PhotoArticleTitle:Article/Chapter Title","PhotoArticleAuthor:Author","PhotoJournalTitle:Journal/Book Title","Expires","Delete"],
      :orderBy => "TransactionNumber DESC",
      :text_above => '
        <div class="alert" style="color: black;">
          <p>The ILL webpages will be unavailable from 10-11 AM on Thursday, November 14th, for a planned upgrade. Please watch <a href="https://library.nyu.edu">https://library.nyu.edu</a> for status updates.</p>
          <p style="margin-bottom: 0;">Patrons with documents available to save/print will no longer be able to use the direct links emailed before update. The pdfs will still be available here. Direct links compatible with the upgrade will be emailed on delivery to patrons whose requests are filled going forward.</p> 
        </div>
        <p>Articles posted to this page will remain accessible for <strong>60 days from the date of posting</strong>. You are encouraged to print or save the document for your future use.</p>
        <p>If, prior to this time, you no longer require the use of an article, you may delete it using the "Delete" link to the right of the article information. Deleted articles cannot be recovered or re-requested.</p>
        <p>If you have trouble viewing your document, please contact the Interlibrary Loan Office at 212-998-2511 or <a href="mailto:lib-ill@nyu.edu">lib-ill@nyu.edu</a></p>
      '
    },
    {
      :class => "default-table",
      :name => "ViewOutstandingRequests",
      :headerText => "Requests in Processing",
      :noDataAction => "ShowMessageRow",
      :noDataMessage => "No Requests",
      :columns => ["TransactionNumber:Transaction Number (TN)","DocumentType:Format Type","Title","Author","CreationDate:Request Submitted"],
      :orderBy => "TransactionNumber ASC",
      :text_below => '
      <p>Please contact ILL with questions or concerns:<br />
      <a href="mailto:lib-ill@nyu.edu">lib-ill@nyu.edu</a><br />
      (212) 998-2511<br />
      Monday-Friday: 9-5</p>
      '
    }
    ]
  end

end
