$(document).ready(function(){
    $("#savelist").click(function(){
       $("#showSavelist").show();
    });
    $("#bnt-create").click(function(){
    	var cat = $('#saveListnames').val();
    	if(cat > 0){
   
    		console.log(cat);
    	}else{
    		$("#newsavelist").show();
    	}
    	
    	
    });
    
    $("#toggleSavelist").click(function(){
    	
    	$("li").show();
    });
    
    
  
});
