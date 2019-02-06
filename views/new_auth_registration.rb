require File.join(File.dirname(__FILE__), 'text_page')
class NewAuthRegistration < TextPage

  def page_header
    "TEST - Welcome to NYU Interlibrary Loan Request System"
  end

  def page_name
    page_header
  end

  def text_sections
    [
    {
      :text_class => "text_section",
      :text_id => "status",
      :paragraphs => [
        "<div class=\"status_container\"><#STATUS></div>",
        "<p>This system allows you to request material that is not available at NYU or consortium libraries and to track the progress of your requests. You may request books, book chapters, journal or newspaper articles, dissertations, videos, music, computer files and microforms. </p>",
        "<p>You will be notified by email at <strong> <#PARAM name=\"EMailAddress\"> </strong> when your request is ready. </p>",
        "<p>Please review the following copyright statement and press <strong>Go to Main Menu</strong> to place a request. </p>",
        "<h2>Important Copyright Information</h2>",
        "<p>WARNING CONCERNING COPYRIGHT RESTRICTIONS</p>",
        "<p>The copyright law of the United States (Title 17, United States Code) governs the making of photocopies or other reproductions of copyrighted materials.</p>",
				"<p>Under certain conditions specified in the law, libraries and archives are authorized to furnish a photocopy or other reproduction. One of these specified conditions is that the photocopy or reproduction is not to be &quot;used for any purpose other than private study, scholarship, or research&quot;. If a user makes a request for, or later uses, a photocopy or reproduction for purposes in excess of &quot;fair use&quot;, that user may be liable for copyright infringement.</p>",
				"<p>NYU Interlibrary Loan reserves the right to refuse to accept a copying order if, in its judgment, fulfillment of the order would involve violation of copyright law.</p>",
		    "<h4>Questions?</h4>",
        "<p>Contact NYU Interlibrary Loan at (212) 998-2511 Monday - Friday, 9 a.m. - 5 p.m. EST, or email <a href=\"mailto:ill@library.nyu.edu\">ill@library.nyu.edu</a> at any time.",
        "<p>Thank you for using Interlibrary Loan.</p>",
      	'<form style="background-color: #EFF0E8;" action="illiad.dll" method="post" name="NewAuthRegistration" class="f-wrap-request">
          <input type="hidden" name="ILLiadForm" value="NewAuthRegistration">
          <fieldset>
            <div style="display:none">
              <input type="hidden" name="NVTGC" value="ZYU">
              <input type="hidden" name="DeliveryGroup" value="Hold for Pickup">
              <input type="hidden" name="LoanDeliveryGroup" value="Hold for Pickup">
              <input type="hidden" name="WebDeliveryGroup" value="Yes">
              <input type="hidden" name="NotifyGroup" value="E-Mail">
              <input id="FirstName" name="FirstName" type="hidden" size="40" class="f-name" tabindex="2" value="<#PARAM name="FirstName">">
              <input id="LastName" name="LastName" type="hidden" size="40" class="f-name" tabindex="2" value="<#PARAM name="LastName">">
              <input id="SSN" name="SSN" type="hidden" size="40" class="f-name" tabindex="3" value="<#PARAM name="SSN">">
              <input id="EMailAddress" name="EMailAddress" type="hidden" size="40" class="f-name" tabindex="3" value="<#PARAM name="EMailAddress">">
              <input id="Phone" name="Phone" type="hidden" size="40" class="f-name" tabindex="3" value="<#PARAM name="Phone">">
              <input id="Address" name="Address" type="hidden" size="40" class="f-name" tabindex="3" value="<#PARAM name="Address">">
              <input id="Address2" name="Address2" type="hidden" size="40" class="f-name" tabindex="3" value="<#PARAM name="Address2">">
              <input id="City" name="City" type="hidden" size="40" class="f-name" tabindex="3" value="<#PARAM name="City">">
              <input id="State" name="State" type="hidden" size="40" class="f-name" tabindex="3" value="<#PARAM name="State">">
              <input id="Zip" name="Zip" type="hidden" size="40" class="f-name" tabindex="3" value="<#PARAM name="Zip">">
              <input id="SAddress" name="SAddress" type="hidden" size="40" class="f-name" tabindex="3" value="<#PARAM name="SAddress">">
              <input id="SAddress2" name="SAddress2" type="hidden" size="40" class="f-name" tabindex="3" value="<#PARAM name="SAddress2">">
              <input id="SCity" name="SCity" type="hidden" size="40" class="f-name" tabindex="3" value="<#PARAM name="SCity">">
              <input id="SState" name="SState" type="hidden" size="40" class="f-name" tabindex="3" value="<#PARAM name="SState">">
              <input id="SZip" name="SZip" type="hidden" size="40" class="f-name" tabindex="3" value="<#PARAM name="SZip">">
              <input id="StatusGroup" name="StatusGroup" size="1" class="f-name" tabindex="4" style="display: none;">
              <select id="StatusGroup" name="StatusGroup" size="1" style="display: none;">
                <option selected><#PARAM name="StatusGroup"></option>
                <option>Graduate</option>
                <option>Faculty</option>
                <option>Staff</option>
                <option>Undergraduate</option>
                <option>Distance Ed Grad</option>
              </select>
              <select id="Department" name="Department" size="1" class="f-name" tabindex="4" style="display: none;">
                <option selected><#PARAM name="Department"></option>
                <option>Art</option>
                <option>Math</option>
                <option>Music</option>
                <option>Physics</option>
                <option>Other - Unlisted</option>
              </select>
              <textarea id="AuthorizedUsers" name="AuthorizedUsers" style="display: none;" rows="2" cols="40" class="f-name" tabindex="15"><#PARAM name="AuthorizedUsers"></textarea>
            </div>
            <div class="f-submit-wrap" style="padding: 0; text-align: center;" >
            <input type="submit" name="SubmitButton" value="Go to Main Menu" class="f-submit" tabindex="60" />
            </div>
          </fieldset>
        </form>'
      ]
    }
    ]
  end

  def sidebar

  end

end
