require 'mustache'
require File.join(File.dirname(__FILE__), 'helper')
class IncludeFooter < Mustache
	include Helper  
  def footer
    app_tag "COPYRIGHT"
  end
  
  def gauges
    "
    <script type=\"text/javascript\">
      var _gauges = _gauges || [];
      (function() {
        var t   = document.createElement('script');
        t.type  = 'text/javascript';
        t.async = true;
        t.id    = 'gauges-tracker';
        t.setAttribute('data-site-id', '5141cd8bf5a1f56376000050');
        t.src = '//secure.gaug.es/track.js';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(t, s);
      })();
    </script>
    "
  end

end
