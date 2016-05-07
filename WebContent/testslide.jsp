<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>



<script src="scripts/jquery-1.6.min.js" type="text/javascript"></script>
<script src="scripts/jquery.cycle.all.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
#slideshow {  
    			padding: 10px;
				margin:0;
				left:200px;  
			} 
	#slideshow img : hover
	{
	opacity : 0.4;
	}		
			#slideshow-caption{
				padding:0;
				margin:0;
			}
 
			#slideshow img, #slideshow div {  
    			padding: 10px;
    			background-color: #EEE;
				-webkit-border-radius: 10px;
				-moz-border-radius: 10px;
				border-radius: 10px; 
    			margin: 0; 
			}
		
/* EndOAWidget_Instance_2559022 */
</style>
<script type="text/xml">
<!--
<oa:widgets>
  <oa:widget wid="2559022" binding="#slideshow" />
</oa:widgets>
-->
</script>
</head>
<body>


<script type="text/javascript">
// BeginOAWidget_Instance_2559022: #slideshow

   		    slideshowAddCaption=true;
$(document).ready(function() {
	$('#slideshow').cycle({
		after:			slideshowOnCycleAfter, //the function that is triggered after each transition
		autostop:			false,     // true to end slideshow after X transitions (where X == slide count) 
		fx:				'blindX',// name of transition effect 
		pause:			true,     // true to enable pause on hover 
		randomizeEffects:	true,  // valid when multiple effects are used; true to make the effect sequence random 
		speed:			1000,  // speed of the transition (any valid fx speed value) 
		sync:			true,     // true if in/out transitions should occur simultaneously 
		timeout:		3000,  // milliseconds between slide transitions (0 to disable auto advance) 
		fit:			true,
		height:		   '400px',
		width:         '800px'   // container width (if the 'fit' option is true, the slides will be set to this width as well) 
	});
}); 
function slideshowOnCycleAfter() { 
	if (slideshowAddCaption==true){
			$('#slideshow-caption').html(this.title); 
	}
} 
		
// EndOAWidget_Instance_2559022
</script>
<div id="slideshow">
  <!--All elements inside this will become slides-->
  <img src="images/Slide1.JPG" width="800" height="300" /> <img src="images/Slide2.JPG" width="1000" height="300"  /> <img src="images/Slide3.JPG" width="1000" height="300"  />
</div>  
 <!-- <img src="images/taxi4.jpg" width="1000" height="300"  /> <img src="images/taxi5.jpg" width="1000" height="300"  /> <img src="images/taxi6.jpg" width="1000" height="300"  /></div> -->
<!--It is safe to delete this if captions are disabled-->

</body>
</html>