#require_tree ./lib/jquery
jQuery ($)-> 

  #Init dropdown actions
  $(".actions").show()
  $('div.actions').bobcat "droplist", droplist_class: "tsetse_droplist", events: ['click', 'hover']
  $('div.actions ul li a').live "click", (event)->
    url = "#{$(this).closest("form").attr "action"}?#{$.query.load($(this).attr "href").get("service[action]")}"
    $(this).attr "href": url
    
  #Popup tips
  $(".nyulibrary_help").nyulibrary_popup_tip "init"

  #Properly capitalize usernames
  capitalize = (phrase) -> phrase.replace /\B[A-Z]/g, (letter) -> letter.toLowerCase()
  $(".login a, hgroup .username").text( -> 
    capitalize($(this).text())
  )
  
  # Shuffle around status classes
  $(".status_container:has(span.statusNormal)").addClass "info"
  $(".status_container:has(.success)").addClass "success"
  $(".status_container:has(span.statusInformation)").addClass "info"
  $(".status_container:has(span.statusError)").addClass "error"
  $(".status_container").children(":has(.success)").removeClass "success"
  $(".status_container").children(":has(.error)").removeClass "error"
  # Hide status container if no statuses
  $(".status_container").hide() if $.trim($(".status_container").html()) == ""
  
  match_form_text = (form_el, form_text) -> $.trim(form_el.children("option:selected").text()) is form_text
  
  #Form actions
  $("form#IlliadForm").validate() if $("form#IlliadForm").length
  $("form .field:has(input#CitedIn)").hide() unless match_form_text($("form #ShippingOptions"), "Other NYU Global Site")
  $("form #NotWantedAfter").datepicker minDate: 0
  $("form #ShippingOptions").change -> 
    if match_form_text($(this), "Other NYU Global Site")
      $("form .field:has(input#CitedIn)").show()  
      $("form .field input#CitedIn").addClass("required").focus()
    else
      $("form .field:has(input#CitedIn)").hide()  
  #Prevent submitting defaults
  $("form").live "submit", (event) -> 
    $(this).find(".defaultText").each -> 
      $(this).val "" if $(this).val() == $(this).attr "title"  
  
  #Hide username if registering new user
  $("#NewAuthRegistration .username").hide()
  
  # Set title of request to link from Transaction Number    
  url = (anchor) -> anchor.attr "href"
  $(".default-table table tbody tr td:first-child a").each -> 
    # Do some simplistic matching to make sure it matches what we expect a transaction number to look like, i.e. some numbers
    # So it doesn't accidentally grab a vicious "Delete" link and mask it as a friendly "View" link
    if /\d+/.test $(this).html()
      link_to_item = $("<a />").attr( "href", url $(this) ).html $(this).closest("tr").find(":nth-child(3)").text()  
      $(this).closest("tr").find(":nth-child(3)").html link_to_item
    
  #Set title as for fields with defaultText
  $(".defaultText").live "focus", (event) ->
    if $(this).val() == $(this).attr("title")
      $(this).removeClass "defaultTextActive"
      $(this).val ""
  $(".defaultText").live "blur", (event) ->
    if $(this).val() == ""
      $(this).addClass "defaultTextActive"
      $(this).val $(this).attr "title"
  		
  $(".defaultText").focus()
  $(".defaultText").blur()
  
  		
      
