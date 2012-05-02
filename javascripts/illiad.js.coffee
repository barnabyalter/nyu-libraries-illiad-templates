#//= require_tree ./lib/jquery
//= require ./lib/jquery/jquery.pjax.js
jQuery ($)-> 

  #$('a').pjax('#content')
  
  #Init dropdown actions
  $('div.actions').bobcat "droplist", droplist_class: "tsetse_droplist", events: ['click', 'hover']
  $('div.actions ul li a').live "click", (event)->
    url = "#{$(this).closest("form").attr("action")}?#{$.query.load($(this).attr("href")).get("service[action]")}"
    $(this).attr("href", url)

  #Properly capitalize usernames
  capitalize = (phrase) -> phrase.replace /\B[A-Z]/g, (letter) -> letter.toLowerCase()

  $(".login a, hgroup .username").text( -> 
    capitalize($(this).text())
  )
  
  #Shuffle around status classes
  $(".status_container:has(span.statusNormal)").addClass("info")
  $(".status_container:has(.success)").addClass("success")
  $(".status_container:has(span.statusInformation)").addClass("info")
  $(".status_container:has(span.statusError)").addClass("error")
  $(".status_container").children(":has(.success)").removeClass("success")
  $(".status_container").children(":has(.error)").removeClass("error")
  
  #Form actions
  $("form#IlliadForm").validate() if $("form#IlliadForm").length
  $("form .field:has(input#CitedIn)").hide()
  $("form #NotWantedAfter").datepicker()
  $("form #ShippingOptions").change -> 
    if $.trim($(this).children("option:selected").text()) is "Other NYU Global Site"
      $("form .field:has(input#CitedIn)").show()  
      $("form .field input#CitedIn").addClass("required").focus()
    else
      $("form .field:has(input#CitedIn)").hide()    

