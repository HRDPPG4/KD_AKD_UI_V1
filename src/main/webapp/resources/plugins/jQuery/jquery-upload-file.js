$(document).ready(function() {
	/* SINGLE UPLOAD DOCUMENT*/
	
	$('#singleUploadDocument').on('change',function ()
		    {
				var ext = $('#singleUploadDocument').val().split('.').pop().toLowerCase();
				if($.inArray(ext, ['pdf','pptx','ppt','doc','docx']) == -1) {
				    alert('សូមអភ័យទោស! លោកអ្នកអាចធ្វើការចែកចាយឯកសារបានតែប្រភេទ  PDF, Word និង PowerPoint តែប៉ុណ្ណោះ!');	    
				    $('#btnSave').prop('disabled', true);	    
				}
				else{
					
				}
				
				var filename = $('input[type=file]').val().replace(/C:\\fakepath\\/i, '');
				var finalName=filename.substring(0, filename.lastIndexOf('.'));
				$("#title").val($('input[type=file]').val().replace(/.*(\/|\\)/, ''));
				document.getElementById("title").value=finalName;	
				jQuery('#title').trigger('input');
				
				
		    }); 
			

			$('#singleUploadDocument').filer({
			    /*changeInput: '<div class="jFiler-input-dragDrop"><div class="jFiler-input-inner"><div class="jFiler-input-icon"><i class="icon-jfi-folder"></i></div><div class="jFiler-input-text"><h3>Click on this box</h3> <span style="display:inline-block; margin: 15px 0">or</span></div><a class="jFiler-input-choose-btn blue">Browse Files</a></div></div>',*/
				changeInput: '<div ></div><a class="jFiler-input-choose-btn blue">ជ្រើសរើសឯកសារ</a></div></div>',
				showThumbs: true,
			    theme: "dragdropbox",
			    templates: {
			        box: '<ul class="jFiler-items-list jFiler-items-grid"></ul>',
			        item: '<br/> <li class="jFiler-item" ng-controller="DocumentCtrl">\
			                    <div class="jFiler-item-container">\
			                        <div class="jFiler-item-inner">\
			                            <div class="jFiler-item-thumb">\
			                                <div class="jFiler-item-status"></div>\
			                                <div class="jFiler-item-info">\
			                                    <span class="jFiler-item-title"><b title="{{fi-name}}">{{fi-name | limitTo: 25}}</b></span>\
			                                    <span class="jFiler-item-others">{{fi-size2}}</span>\
			                                </div>\
			                                {{fi-image}}\
			                            </div>\
			                            <div class="jFiler-item-assets jFiler-row">\
			                                <ul class="list-inline pull-right">\
			                                    <li><a class="icon-jfi-trash jFiler-item-trash-action"></a></li>\
			                                </ul>\
			                            </div>\
			        			<div class="form-group">\
								\
			        			</div>\
			                        </div>\
			                    </div>\
			                </li>',
			        itemAppend: '<li class="jFiler-item">\
			                        <div class="jFiler-item-container">\
			                            <div class="jFiler-item-inner">\
			                                <div class="jFiler-item-thumb">\
			                                    <div class="jFiler-item-status"></div>\
			                                    <div class="jFiler-item-info">\
			                                        <span class="jFiler-item-title"><b title="{{fi-name}}">{{fi-name | limitTo: 25}}</b></span>\
			                                        <span class="jFiler-item-others">{{fi-size2}}</span>\
			                                    </div>\
			                                    {{fi-image}}\
			                                </div>\
			                                <div class="jFiler-item-assets jFiler-row">\
			                                    <ul class="list-inline pull-left">\
			                                        <li><span class="jFiler-item-others">{{fi-icon}}</span></li>\
			                                    </ul>\
			                                    <ul class="list-inline pull-right">\
			                                        <li><a class="icon-jfi-trash jFiler-item-trash-action"></a></li>\
			                                    </ul>\
			                                </div>\
			        			<div class="form-group">\
								\
			        			</div>\
			                            </div>\
			                        </div>\
			                    </li>',
			        itemAppendToEnd: false,
			        removeConfirmation: true,
			        _selectors: {
			            list: '.jFiler-items-list',
			            item: '.jFiler-item',
			            remove: '.jFiler-item-trash-action'
			        }
			    }
			});
	
	
	
	
	
	/* MULTIPLE UPLOAD DOCUMENT*/
	
	$('#multipleUploadDocument').on('change',function ()
    {
		var ext = $('#multipleUploadDocument').val().split('.').pop().toLowerCase();
		if($.inArray(ext, ['pdf','pptx','ppt','doc','docx']) == -1) {
		    alert('សូមអភ័យទោស! លោកអ្នកអាចធ្វើការចែកចាយឯកសារបានតែប្រភេទ  PDF, Word និង PowerPoint តែប៉ុណ្ណោះ!');	    
		    $('#btnSave').prop('disabled', true);	    
		}
		else{
			
		}
		
		var filename = $('input[type=file]').val().replace(/C:\\fakepath\\/i, '');
		var finalName=filename.substring(0, filename.lastIndexOf('.'));
		$("#title").val($('input[type=file]').val().replace(/.*(\/|\\)/, ''));
		document.getElementById("title").value=finalName;	
		jQuery('#title').trigger('input');
		
		
    }); 
	

	$('#multipleUploadDocument').filer({
	    /*changeInput: '<div class="jFiler-input-dragDrop"><div class="jFiler-input-inner"><div class="jFiler-input-icon"><i class="icon-jfi-folder"></i></div><div class="jFiler-input-text"><h3>Click on this box</h3> <span style="display:inline-block; margin: 15px 0">or</span></div><a class="jFiler-input-choose-btn blue">Browse Files</a></div></div>',*/
		changeInput: '<div ></div><a class="jFiler-input-choose-btn blue">ជ្រើសរើសឯកសារ</a></div></div>',
		showThumbs: true,
	    theme: "dragdropbox",
	    templates: {
	        box: '<ul class="jFiler-items-list jFiler-items-grid"></ul>',
	        item: '<br/> <li class="jFiler-item" ng-controller="DocumentCtrl">\
	                    <div class="jFiler-item-container">\
	                        <div class="jFiler-item-inner">\
	                            <div class="jFiler-item-thumb">\
	                                <div class="jFiler-item-status"></div>\
	                                <div class="jFiler-item-info">\
	                                    <span class="jFiler-item-title"><b title="{{fi-name}}">{{fi-name | limitTo: 25}}</b></span>\
	                                    <span class="jFiler-item-others">{{fi-size2}}</span>\
	                                </div>\
	                                {{fi-image}}\
	                            </div>\
	                            <div class="jFiler-item-assets jFiler-row">\
	                                <ul class="list-inline ">\
										<input type="text" value="{{fi-name}}" name="fileName[]" class="form-control FileTitle">\
	        						</ul>\
	        						<br>\
	                                <ul class="list-inline pull-right">\
	                                    <li><a class="icon-jfi-trash jFiler-item-trash-action"></a></li>\
	                                </ul>\
	                            </div>\
	        			<div class="form-group">\
						\
	        			</div>\
	                        </div>\
	                    </div>\
	                </li>',
	        itemAppend: '<li class="jFiler-item">\
	                        <div class="jFiler-item-container">\
	                            <div class="jFiler-item-inner">\
	                                <div class="jFiler-item-thumb">\
	                                    <div class="jFiler-item-status"></div>\
	                                    <div class="jFiler-item-info">\
	                                        <span class="jFiler-item-title"><b title="{{fi-name}}">{{fi-name | limitTo: 25}}</b></span>\
	                                        <span class="jFiler-item-others">{{fi-size2}}</span>\
	                                    </div>\
	                                    {{fi-image}}\
	                                </div>\
	                                <div class="jFiler-item-assets jFiler-row">\
	                                    <ul class="list-inline pull-left">\
	                                        <li><span class="jFiler-item-others">{{fi-icon}}</span></li>\
	                                    </ul>\
	                                    <ul class="list-inline pull-right">\
	                                        <li><a class="icon-jfi-trash jFiler-item-trash-action"></a></li>\
	                                    </ul>\
	                                </div>\
	        			<div class="form-group">\
						\
	        			</div>\
	                            </div>\
	                        </div>\
	                    </li>',
	        itemAppendToEnd: false,
	        removeConfirmation: true,
	        _selectors: {
	            list: '.jFiler-items-list',
	            item: '.jFiler-item',
	            remove: '.jFiler-item-trash-action'
	        }
	    }
	});
	
	
	  
	$('#user').on('change',function ()
		    {
				var ext = $('#user').val().split('.').pop().toLowerCase();
				if($.inArray(ext, ['png','gif','jpg']) == -1) {
				    alert('សូមអភ័យទោស!លោកអ្នកអាចធ្វើការ Upload បានតែ រូបភាពប៉ុណ្ណោះ....');	    
				    $('#btnSave').prop('disabled', true);	    
				}
				else{
					
				}
		    }); 
			

			$('#user').filer({
			  //  changeInput: '<div class="jFiler-input-dragDrop"><div class="jFiler-input-inner"><div class="jFiler-input-icon"><i class="icon-jfi-folder"></i></div><div class="jFiler-input-text"><h3>Click on this box</h3> <span style="display:inline-block; margin: 15px 0">or</span></div><a class="jFiler-input-choose-btn blue">Browse Files</a></div></div>',
			   
				changeInput: '<div ></div><a class="jFiler-input-choose-btn blue">ជ្រើសរើសរូបភាព</a></div></div>',
				
				showThumbs: true,
			    theme: "dragdropbox",
			    templates: {
			        box: '<ul class="jFiler-items-list jFiler-items-grid"></ul>',
			        item: '<li class="jFiler-item">\
			                    <div class="jFiler-item-container">\
			                        <div class="jFiler-item-inner">\
			                            <div class="jFiler-item-thumb">\
			                                <div class="jFiler-item-status"></div>\
			                                <div class="jFiler-item-info">\
			                                    <span class="jFiler-item-title"><b title="{{fi-name}}">{{fi-name | limitTo: 25}}</b></span>\
			                                    <span class="jFiler-item-others">{{fi-size2}}</span>\
			                                </div>\
			                                {{fi-image}}\
			                            </div>\
			                            <div class="jFiler-item-assets jFiler-row">\
			                                <ul class="list-inline pull-left"></ul>\
			                                <ul class="list-inline pull-right">\
			                                    <li><a class="icon-jfi-trash jFiler-item-trash-action"></a></li>\
			                                </ul>\
			                            </div>\
			        			<div class="form-group">\
								\
			        			</div>\
			                        </div>\
			                    </div>\
			                </li>',
			        itemAppend: '<li class="jFiler-item">\
			                        <div class="jFiler-item-container">\
			                            <div class="jFiler-item-inner">\
			                                <div class="jFiler-item-thumb">\
			                                    <div class="jFiler-item-status"></div>\
			                                    <div class="jFiler-item-info">\
			                                        <span class="jFiler-item-title"><b title="{{fi-name}}">{{fi-name | limitTo: 25}}</b></span>\
			                                        <span class="jFiler-item-others">{{fi-size2}}</span>\
			                                    </div>\
			                                    {{fi-image}}\
			                                </div>\
			                                <div class="jFiler-item-assets jFiler-row">\
			                                    <ul class="list-inline pull-left">\
			                                        <li><span class="jFiler-item-others">{{fi-icon}}</span></li>\
			                                    </ul>\
			                                    <ul class="list-inline pull-right">\
			                                        <li><a class="icon-jfi-trash jFiler-item-trash-action"></a></li>\
			                                    </ul>\
			                                </div>\
			        			<div class="form-group">\
								\
			        			</div>\
			                            </div>\
			                        </div>\
			                    </li>',
			        itemAppendToEnd: false,
			        removeConfirmation: true,
			        _selectors: {
			            list: '.jFiler-items-list',
			            item: '.jFiler-item',
			            remove: '.jFiler-item-trash-action'
			        }
			    }
			});
			
			
			$('#docThumbnail').on('change',function ()
				    {
						var ext = $('#docThumbnail').val().split('.').pop().toLowerCase();
						if($.inArray(ext, ['png','gif','jpg']) == -1) {
						    alert('សូមអភ័យទោស!លោកអ្នកអាចធ្វើការ Upload បានតែ រូបភាពប៉ុណ្ណោះ....');	    
						    $('#btnSave').prop('disabled', true);	    
						}
						else{
							
						}
				    }); 
					

					$('#docThumbnail').filer({
					  //  changeInput: '<div class="jFiler-input-dragDrop"><div class="jFiler-input-inner"><div class="jFiler-input-icon"><i class="icon-jfi-folder"></i></div><div class="jFiler-input-text"><h3>Click on this box</h3> <span style="display:inline-block; margin: 15px 0">or</span></div><a class="jFiler-input-choose-btn blue">Browse Files</a></div></div>',
					   
						changeInput: '<div ></div><a class="jFiler-input-choose-btn blue">ជ្រើសរើសរូបភាព</a></div></div>',
						
						showThumbs: true,
					    theme: "dragdropbox",
					    templates: {
					        box: '<ul class="jFiler-items-list jFiler-items-grid"></ul>',
					        item: '<li class="jFiler-item">\
					                    <div class="jFiler-item-container">\
					                        <div class="jFiler-item-inner">\
					                            <div class="jFiler-item-thumb">\
					                                <div class="jFiler-item-status"></div>\
					                                <div class="jFiler-item-info">\
					                                    <span class="jFiler-item-title"><b title="{{fi-name}}">{{fi-name | limitTo: 25}}</b></span>\
					                                    <span class="jFiler-item-others">{{fi-size2}}</span>\
					                                </div>\
					                                {{fi-image}}\
					                            </div>\
					                            <div class="jFiler-item-assets jFiler-row">\
					                                <ul class="list-inline pull-left"></ul>\
					                                <ul class="list-inline pull-right">\
					                                    <li><a class="icon-jfi-trash jFiler-item-trash-action"></a></li>\
					                                </ul>\
					                            </div>\
					        			<div class="form-group">\
										\
					        			</div>\
					                        </div>\
					                    </div>\
					                </li>',
					        itemAppend: '<li class="jFiler-item">\
					                        <div class="jFiler-item-container">\
					                            <div class="jFiler-item-inner">\
					                                <div class="jFiler-item-thumb">\
					                                    <div class="jFiler-item-status"></div>\
					                                    <div class="jFiler-item-info">\
					                                        <span class="jFiler-item-title"><b title="{{fi-name}}">{{fi-name | limitTo: 25}}</b></span>\
					                                        <span class="jFiler-item-others">{{fi-size2}}</span>\
					                                    </div>\
					                                    {{fi-image}}\
					                                </div>\
					                                <div class="jFiler-item-assets jFiler-row">\
					                                    <ul class="list-inline pull-left">\
					                                        <li><span class="jFiler-item-others">{{fi-icon}}</span></li>\
					                                    </ul>\
					                                    <ul class="list-inline pull-right">\
					                                        <li><a class="icon-jfi-trash jFiler-item-trash-action"></a></li>\
					                                    </ul>\
					                                </div>\
					        			<div class="form-group">\
										\
					        			</div>\
					                            </div>\
					                        </div>\
					                    </li>',
					        itemAppendToEnd: false,
					        removeConfirmation: true,
					        _selectors: {
					            list: '.jFiler-items-list',
					            item: '.jFiler-item',
					            remove: '.jFiler-item-trash-action'
					        }
					    }
					});
			
	
	
});
