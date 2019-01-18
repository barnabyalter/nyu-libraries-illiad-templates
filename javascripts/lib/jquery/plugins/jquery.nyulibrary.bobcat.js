(function(){
	var settings = {
		heading: '',
		remove: '',
		events: ['click', 'hover'],
		animation: 'slide',
		droplist_padding: '0 2em 0 0',
		list_padding: '.5em 1em',
		droplist_class: 'nyulibraries_bobcat_droplist'
	};

	var methods = {
		droplist: function(options){
			return jQuery(this).each(function(){
				if(options) jQuery.extend(settings, options);
				//Specify container
				$container = jQuery(this);
				$container.addClass(settings.droplist_class);
				// Remove unnecessary elements from container
				$container.find(settings.remove).remove();
				// Create headings array
				var headings = new Array();
				// If this contains a select box, preprocess to create lists based on optgroups
				if($container.children().is("select")){
					$container.find("select optgroup").each(function(index, optgroup){
						//Build list from optgroup
						var $optgroup = jQuery(optgroup);
						//Start list
						var $ul = jQuery("<ul/>");
						//Assume valid HTML (optgroup contains options)
						// If options greater than 1, put heading as optgroup label
						//if ($optgroup.children().length == 1) {
						//	headings.push($optgroup.children().first().html());
						//} else if($optgroup.children().length == 1) {
							//Get heading and add it to the headings array
							headings.push($optgroup.attr("label"));
						//} else {
							//Add default heading; weird case where we only have an optgroup and no options.
						//	headings.push(settings.heading);
						//}
						$optgroup.children().each(function(index, option){
							//Get value and text
							$option = jQuery(option);
							var value = $option.attr("value");
							var text = $option.html();
							//Get HREF from closest form action
							var href = $optgroup.closest("form").attr("action");
							//Get form element name from closest select
							var name = $optgroup.closest("select").attr("name");
							//Start list item and anchor
							var $li = jQuery("<li/>");
							var $a = jQuery("<a/>");
							//Set html to text and href to form action with form element name as a QS param
							$a.html(text);
							// Check for "?" first and then add & or ? depending on answer.
							if (href.match(/\?/)) { 
								$a.attr("href", href+"&"+name+"="+value); 
							} else {
								$a.attr("href", href+"?"+name+"="+value); 
							}
							$a.addClass(settings.droplist_class+"_anchor_"+value);
							//Append the anchor to the list item and the list item to the list
							$li.append($a);
							$ul.append($li);
						});
						//Append to container
						$container.append($ul);
					});
					// Remove select, label and submit elements
					$container.find("select").remove();
					$container.find("label").remove();
					$container.find('input[type="submit"]').remove();
				}
				//Create drop list for each list in the container
				methods._create_droplist($container, headings);
				//Position lists once they're all created
				/*$container.find("span."+settings.droplist_class+"_droplist_container").each(function(index, droplist_container) {
					$droplist_container = jQuery(droplist_container);
					$button = $droplist_container.children("button").first();
					$ul = $droplist_container.children("ul").first();
					$of = (jQuery.browser.mozilla) ? jQuery(this) : $button; // positions differently in firefox
					$ul.position({
						my: "left top",
						at: "left bottom",
						of: $of,
						collision: "none none"
					});
					
				});*/
			});
		},
		_position_droplist: function(target){
				//console.log(jQuery(target));

				//get correct context, i.e. the button
				if (jQuery(target).is("button")) {
					$this = jQuery(target);
				} else 	if (jQuery(target).children().size() > 0) {
					$this = jQuery(target).find("button");
				} else {
					$this = jQuery(target).closest("button");
				}
			
				//Position lists again after they've been created
				$ul = $this.next("ul");
				if ($ul.is("ul")) {
					//cannot change the position of a hidden element, 
					//so show it briefly, unless it is already visible, then do nothing
					if ($ul.is(":hidden")) { 
						$ul.show(); 
						//$of = (jQuery.browser.mozilla) ? jQuery(this) : jQuery(this); // positions differently in firefox
						$ul.position({
							my: "left top",
							at: "left bottom",
							of: $this,
							collision: "none none"
						});
						//then hide it again
						$ul.hide();
					}
				}
				
		},
		_toggle: function(event) {
			//position droplist when showing
			methods._position_droplist(event.target);
			
			event.preventDefault();
			if (settings.animation == "show") {	
				jQuery(this).next("ul").toggle();		
			} else {
				jQuery(this).next("ul").slideToggle('fast', 'linear');	
			}	
		},
		_show: function(event) {
			//position droplist when showing
			methods._position_droplist(event.target);
			
			event.preventDefault();
			if (settings.animation == "show") {
				jQuery(this).children("ul").show();				
			} else {
				jQuery(this).children("ul").slideDown('fast', 'linear');	
			}			
		},
		_hide: function(event) {
			event.preventDefault();
			if (settings.animation == "show") {
				jQuery(this).children("ul").hide();	
			} else {
				jQuery(this).children("ul").slideUp('fast', 'linear');	
			}
		},
		_create_droplist: function(container, headings) {
			$container = jQuery(container);
			// Hide list for formatting
			$container.find("ul").hide();
			$container.find("ul").each(function (index, ul) {
				var $ul = jQuery(ul);
				var heading = (headings && headings.length > 0) ? headings[index] : settings.heading;
				//Set class based on heading
				var heading_class = heading.replace(/[\s\/]/gi, "_").toLowerCase()
				var button_options = {icons: {primary: null, secondary:'ui-icon-triangle-1-s'}};
				// Handle case where there is only one list item
				if ($ul.children().length == 1) {
					heading = $ul.find("li").html();
					button_options = {};
				}
				//Create button heading and prepend to this
				var $button = jQuery("<button/>");
				$button.html(heading);
				$button.addClass(settings.droplist_class+"_button_"+heading_class);
				$button.button(button_options);
				$button.bind("click", function(event) {event.preventDefault();});
				//Put button and ul in a droplist_container for hover
				var $droplist_container = jQuery("<span/>");
				$droplist_container.addClass(settings.droplist_class+"_droplist_container");
				$droplist_container.addClass(settings.droplist_class+"_droplist_container_"+heading_class);
				$droplist_container.css("postion", "absolute");
				//Style droplist_container
				$droplist_container.css("padding", settings.droplist_padding);
				$droplist_container.append($button);
				// Put single elements at the beginning
				if ($ul.children().length == 1) {
					//Prepend droplist_container to the container
					$container.prepend($droplist_container);
				} else {
					//Append droplist_container to the container
					$container.append($droplist_container);
				}
				if ($ul.children().length > 1) {
					$droplist_container.append($ul);
					for(var i=0; i<settings.events.length; i++){
						var event = settings.events[i];
						if(event == 'hover') {
							$droplist_container.hover(methods._show, methods._hide);
						} else {
							$button.bind(event, methods._toggle);
						}
					}
					//Hide on click outside - requires jquery.outside-events.js
					$droplist_container.bind("clickoutside", methods._hide);
					//Style list
					//Assume valid HTML (lists contain list items)
					$ul.children().css("display", "block");
					$ul.addClass("ui-widget ui-widget-content ui-corner-all");
					//Position list under button
					$ul.css("position", "absolute");
					$ul.css("padding", settings.list_padding);
				} 
			});
			//Hide on click outside - requires jquery.outside-events.js
			$container.bind("clickoutside", methods._hide);
		}
	};
	jQuery.fn.bobcat = function(method) {
	    // Method calling logic
	    if (methods[method]) {
	      return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
	    } else {
	      jQuery.error( 'Method ' +  method + ' does not exist on jQuery.bobcat' );
	    }    
	};
})(jQuery);
