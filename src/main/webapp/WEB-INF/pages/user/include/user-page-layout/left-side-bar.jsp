<%@ page pageEncoding="utf-8"%>
    
<aside class="main-sidebar">
  <!-- sidebar: style can be found in sidebar.less -->
  <section class="sidebar">
    <!-- Sidebar user panel -->
    <div class="user-panel">
      <span class="pull-left# image profile" >
      	<img data-ng-src="{{API_PATH_ANGULAR}}/resources/img/user-profile/{{userInfoByUserID.PROFILE}}" class="img-circle" alt="User Image">
      </span>
      <br><br>
      <div >
			<a  ​href="#" class="upload-proflie" class="btn btn-info btn-lg" data-toggle="modal" data-target="#update-user-image"​>
				<i class="fa fa-camera" aria-hidden="true"></i> ចុចទីនេះដើម្បីផ្លាស់ប្តូររូបភាពថ្មី
			</a>
		</div>
		
      <!-- <div class="pull-left info">
        <p>Alexander Pierce</p>
        <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
      </div> -->
    </div>
    <!-- search form -->
    <!-- <form action="#" method="get" class="sidebar-form">
      <div class="input-group">
        <input type="text" name="q" class="form-control" placeholder="Search...">
            <span class="input-group-btn">
              <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
              </button>
            </span>
      </div>
    </form> -->
    <!-- /.search form -->
    <!-- sidebar menu: : style can be found in sidebar.less -->
    <ul class="sidebar-menu">
      <li class="header">USER CONTROL</li>  
      
      <li>
        <a data-toggle="tab" href="#infor">
          <i class="fa fa-info-circle"></i> <span>ព័ត៌មានរបស់ខ្ញុំ</span>          
        </a>
      </li>        
      
      <!-- <li>
        <a href="#user-dashboard" data-toggle="tab">
          <i class="fa fa-dashboard"></i> <span>Dashboard</span>          
        </a>
      </li> -->
      
      <li ng-init="countTotalDocByUserID()">
        <a data-toggle="tab" ng-click="getDocumentByUser()" href="#mydoc">
          <i class="fa fa-book"></i> <span>ឯកសាររបស់ខ្ញុំ</span> 
          <span class="pull-right-container">
            <small class="label pull-right bg-green">{{countDocByUserID}}</small>
          </span>         
        </a>
      </li>
      
      <li class="treeview">
         <a  ng-click="getSavelistMenuUser()" href="#" data-toggle="tab#">
          <i class="fa fa-list"></i> 
          <span>បញ្ជីរក្សាទុកឯកសារ</span>
          <span class="pull-right-container">
            <i class="fa fa-angle-left pull-right"></i>
          </span>
        </a>
        <ul class="treeview-menu">
           <li ng-repeat ="savelistmenu in getSavelistMenu" class="savelistData">
          	<a data-toggle="tab"  ng-click="getDocumentByEachSavelist(savelistmenu.LIST_ID)" href="#mysavelist"><i class="fa fa-circle-o"></i> 
          		{{savelistmenu.LIST_NAME}}
	          	<span class="pull-right-container">
	            	<small class="label pull-right bg-green" ng-show="savelistmenu.TOTAL_DOCUMENT>0">{{savelistmenu.TOTAL_DOCUMENT}}</small>	            	
	            </span>	           
          	</a>           	
          </li>  
        </ul>
      </li>
      
      <li>
        <a data-toggle="tab" ng-click="getLogByUserID()" href="#viewed">
          <i class="fa fa-history"></i> <span>ប្រវត្តិនៃការចូលមើល</span>          
        </a>
      </li>            
    
    </ul>
  </section>
  <!-- /.sidebar -->
</aside>   