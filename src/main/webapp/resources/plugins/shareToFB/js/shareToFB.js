  window.fbAsyncInit = function() {
	  FB.init({
      appId      : '1910861819140575', 
      xfbml      : true,
      version    : 'v2.7'
    });
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
  
  

//REFERENT : http://jsfiddle.net/benjasHu/3dhq9k21/























/*
window.fbAsyncInit = function() {
	  FB.init({
      appId      : '1910861819140575', 
      xfbml      : true,
      version    : 'v2.7'
    });
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
	
	document.getElementById('shareBtn').onclick = function() {
		// var thumnail = "https://drive.google.com/thumbnail?&sz=w320&id=" + fbThumbnail;
		 var url = 'http://192.168.178.28:2222/' + window.location.pathname;
		 
		 
		 var image=document.getElementById("thubnail").value;
		// alert(image);
		 
	  FB.ui({
	    method: 'share',
	    display: 'popup',
	    caption: 'TESTING',
	    href:  url ,
	  //  picture: thumnail,
	    picture: image,
	    
	  }, function(response){
		  
	  });
	};*/