// DOM ready
	 $(document).ready(function() {
	   
      // Create the dropdown base
      $("<select />").appendTo(".nav-main");
      
      // Create default option "Go to..."
      $("<option />", {
         "selected": "selected",
         "value"   : "",
         "text"    : "Home"
      }).appendTo(".nav-main select");
      
      // Populate dropdown with menu items
      $(".nav-main a").each(function() {
       var el = $(this);
       $("<option />", {
           "value"   : el.attr("href"),
           "text"    : el.text()
       }).appendTo(".nav-main select");
      });
      
	   // To make dropdown actually work
	   // To make more unobtrusive: http://css-tricks.com/4064-unobtrusive-page-changer/
      $(".nav-main select").change(function() {
        window.location = $(this).find("option:selected").val();
      });
	 
	 });