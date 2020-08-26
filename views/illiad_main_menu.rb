require File.join(File.dirname(__FILE__), 'table')
class IlliadMainMenu < Table

  def page_header
    "My Requests"
  end

  def tables
    [
    {
      :class => "default-table",
      :name => "ElectronicDelivery",
      :headerText => nil,
      :noDataAction => "ShowMessageRow",
      :noDataMessage => "No Articles",
      :columns => ["TransactionNumber:Transaction Number (TN)","View:Click here to view your document","DocumentType:Format Type","Size","PhotoArticleTitle:Article/Chapter Title","PhotoArticleAuthor:Author","PhotoJournalTitle:Journal/Book Title","Expires","Delete"],
      :orderBy => "TransactionNumber DESC",
      :text_above => %{
        <h3>This page has details about the document delivery and interlibrary loan (ILL) requests you've submitted.</h3>
        <h4>To Make New Requests</h4>
        <ul>
          <li>For NYU Libraries Collections items use the <a href="https://bobcat.library.nyu.edu">catalog</a>.</li>
          <li>For Interlibrary Loan (ILL) use the "Make an Interlibrary Loan (ILL) request" forms on the left side of the page.</li>
        </ul>
        <p>
        Details about what materials are available through Document Delivery and ILL services are available via our Service Information and Policies section in the left side menu.
        </p>
        
        <h3>Documents Available to Save/Print</h3>
        <ul>
          <li><strong>Documents are accessible for 30 days from the date of posting.</strong> You can print or save the document for future use.</li>
          <li>To delete documents you no longer need, select the "Delete" link in the far right column for that item. <strong>Deleted documents can't be recovered or re-requested.</strong></li>
        </ul>

        <p>
        <strong>Trouble viewing your documents? </strong>Contact the Interlibrary Loan Office at +1 212-998-2511 or <a href="mailto:lib-ill@nyu.ed">lib-ill@nyu.edu</a>
        </p>        
      }
    },
    {
      :class => "default-table",
      :name => "ViewOutstandingRequests",
      :headerText => nil,
      :noDataAction => "ShowMessageRow",
      :noDataMessage => "No Requests",
      :columns => ["TransactionNumber:Transaction Number (TN)","DocumentType:Format Type","Title","Author","CreationDate:Request Submitted"],
      :orderBy => "TransactionNumber ASC",
      :text_above => %{
        <h3>Requests in Processing</h3>
        <p>These are the requests we are actively trying to source for you from either our own collection or from other libraries via Interlibrary Loan. If you would like more information on the status of a request, please contact us at <a href="mailto:lib-ill@nyu.edu">lib-ill@nyu.edu</a>.</p>
      },
      :text_below => %{
      <h4>Please contact ILL or Delivery Services with questions or concerns.</h4>
      <ul>
        <li>ILL: <a href="mailto:lib-ill@nyu.edu">lib-ill@nyu.edu</a></li>
        <li>Delivery Services: <a href="mailto:lib-deliveryservices@nyu.edu">lib-deliveryservices@nyu.edu</a></li>
        <li>+1 (212) 998-2511, Monday-Friday 9:00 am to 5:00 pm (EST)</li>
      </ul>
      }
    }
    ]
  end

end
