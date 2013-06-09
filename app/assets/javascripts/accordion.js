// JavaScript Document
$(document).ready(function() {
	 
	//ACCORDION BUTTON ACTION (ON CLICK DO THE FOLLOWING)
	$('.accordionButton').click(function() {

		//REMOVE THE ON CLASS FROM ALL BUTTONS
		//$('.accordionButton').removeClass('on');
		  
		//NO MATTER WHAT WE CLOSE ALL OPEN SLIDES
	 	//$('.accordionContent').slideUp('normal');
   
		//IF THE NEXT SLIDE WASN'T OPEN THEN OPEN IT
		if($(this).next().is(':hidden') == true) {
			
			//ADD THE ON CLASS TO THE BUTTON
			$(this).addClass('on');
			$(this).addClass('onOver');
			$(this).removeClass('offOver');  
			//OPEN THE SLIDE
			$(this).next().slideDown('normal');
		 }else {
		 	$(this).removeClass('onOver');
		 	$(this).removeClass('on');
		 	$(this).next().slideUp('normal');

		 } 
		  
	 });
	  
	
	/*** REMOVE IF MOUSEOVER IS NOT REQUIRED ***/
	
	//ADDS THE .OVER CLASS FROM THE STYLESHEET ON MOUSEOVER 
	$('.accordionButton').mouseover(function() {
		if($(this).next().is(':hidden') == true)
		{
			$(this).addClass('offOver');
		}
		else {
			$(this).addClass('onOver');
		}
		
	//ON MOUSEOUT REMOVE THE OVER CLASS
	}).mouseout(function() {
		if($(this).next().is(':hidden') == true)
		{
			$(this).removeClass('offOver');
		}
		else {
			$(this).removeClass('onOver');
		}										
	});
	
	/*** END REMOVE IF MOUSEOVER IS NOT REQUIRED ***/
	
	
	/********************************************************************************************************************
	CLOSES ALL S ON PAGE LOAD
	********************************************************************************************************************/	
	$('.accordionContent').hide();

});