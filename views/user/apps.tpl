
<script>
window.addEventListener('load', () => { 
	$(".mlist li a").first().addClass("active");
	$(".applist:first-child").addClass("active");
	$(".applist li a").first().addClass("active");
	$(".configlist:first-child").addClass("active");	
}); 
</script>
<div class="col-xl-8 col-lg-8 col-md-6 col-sm-12 col-12">
         <div class="card" >
            <div class="card mlist ">
			   </br></br>
			   <ul class="nav nav-pills justify-content-center" id="rounded-pills-icon-tab" role="tablist">
			    {$a = 0}
				{foreach $setup as $app}
				{if $app['type'] != $a}
				{$a = $app['type']}
                  <li class="nav-item ml-1 mr-1">
                     <a class="nav-link mb-2   text-center " id="rounded-pills-icon-A{$app['type']}-tab" data-toggle="pill" href="#rounded-pills-icon-A{$app['type']}" role="tab" aria-controls="rounded-pills-icon-A{$app['type']}" aria-selected="true" style="width:100px">{$setup_name->SetupName({$app['type']})}</a>
                  </li> 
				{/if}  
				{/foreach}
               </ul>
            </div>
		    
            <div class="card tab-content apps" id="rounded-pills-icon-tabContent">			
				{$b = 0}
				{foreach $setup as $listo}
				{if $listo['type'] != $b}
				{$b = $listo['type']}
               <div class="tab-pane  fade show applist" id="rounded-pills-icon-A{$listo['type']}" role="tabpanel" aria-labelledby="rounded-pills-icon-A{$listo['type']}-tab">
				  <ul class="nav nav-pills N{$listo['type']} justify-content-center" id="rounded-pills-icon-tab" role="tablist">
					{$c = 0}
                    {foreach $setup as $list}
					{if $list['id'] != $c }
					{$c = $list['id']}
					{if $list['type'] == $listo['type'] }
						<li class="nav-item ml-1 mr-1 ap">
							<a class="nav-link mb-2 {if $list['id'] ==1 || $list['id'] == 5 || $list['id'] == 9 || $list['id'] == 13 || $list['id'] == 17 || $list['id'] == 21 || $list['id'] == 25 || $list['id'] == 29}active{/if}  text-center" id="rounded-pills-icon-{$list['id']}-tab" data-toggle="pill" href="#rounded-pills-icon-{$list['id']}" role="tab" aria-controls="rounded-pills-icon-{$list['id']}" aria-selected="false"><i class="{$list['icon']}"></i> {$list['title']} </a>
						</li>
                    {/if}
					{/if} 					
					{/foreach}
                  </ul>
                  <hr>
                  <div class="card-body tab-content" id="rounded-pills-icon-tabContent">
					{$d = 0}
					{foreach $setup as $lists}
					{if $lists['id'] != $d}
					{$d = $lists['id']}
					{if $lists['type'] == $listo['type'] }
					
                     <div class="tab-pane  fade show configlist" id="rounded-pills-icon-{$lists['id']}" role="tabpanel" aria-labelledby="rounded-pills-icon-{$lists['id']}-tab">
							{if $lists['type'] != 8}
							<p>
							   {$lang->get('downloads')}  
							   <a  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:#1572e8;color:white"  href="{$lists['url']}" target="_blank"><i class="fad fa-download mr-50"></i> {$lang->get('App')}</a>
							</p>
							{/if}
							{if $Config['TutorialState'] != 1}
							<p>
							   {$lang->get('setup')} 
							   <button  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:#1572e8;color:white" type="button" style="background-color: #1572e8;" data-toggle="modal" data-target="#modal_{$lists['id']}"><i class="fad fa-bookmark mr-50"></i> {$lang->get('View')} </button>
							</p>
							{/if}
						{if $lists['type'] == 1 || $lists['type'] == 2 || $lists['type'] == 3 || $lists['type'] == 4 || $lists['type'] == 5 || $lists['type'] == 6}	
							<p>
							  {$lang->get('ConfigLink')}  
							  <a  class="copy-text btn-dl btn btn-sm btn-flat-primary" style="background-color:#1572e8;color:white"  data-clipboard-text="{if $Config["sub_addr"] != ""}{$Config["sub_addr"]}{else}{$Config["subUrl"]}{/if}{$sub_token}?{$lists['link']}"><i class="fad fa-paper-plane mr-50"></i>  {$lang->get('CopyLink')}</a>
							{if $lists['id'] == 1 ||$lists['id'] == 5 || $lists['id'] == 13 || $lists['id'] == 14 || $lists['id'] == 18}
							   {if $Config["sub_addr"] != ""}
							   <a  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:#1572e8;color:white"  href="clash://install-config?url={urlencode($Config["sub_addr"])}{urlencode($sub_token)}?{urlencode($lists['link'])}"><i class="fad fa-paper-plane mr-50"></i> {$lang->get('ToApp')}</a>
								{else}
							   <a  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:#1572e8;color:white"  href="clash://install-config?url={urlencode($Config["subUrl"])}{urlencode($sub_token)}?{urlencode($lists['link'])}"><i class="fad fa-paper-plane mr-50"></i> {$lang->get('ToApp')}</a>
								{/if}
							{/if}
							{if $lists['id'] == 9}
								<a class="btn-dl btn btn-sm btn-flat-primary" style="background-color:#1572e8;color:white"  onclick=AddSub("{if $Config["sub_addr"] != ""}{$Config["sub_addr"]}{else}{$Config["subUrl"]}{/if}{$sub_token}?{$lists['link']}","shadowrocket://add/sub://")><i class="fad fa-paper-plane mr-50"></i> {$lang->get('ToApp')} </a>
							{/if}
							</p>
						{/if}                         
					 </div>
					{/if} 
					{/if}
					{/foreach} 
                  </div>
				  
			   </div> 
			{/if}  
			{/foreach}   
            </div>
			
         </div>
      </div>
	   


<style>				
.modal-body {
    max-height: calc(70vh - 250px);
    overflow-y: auto;
}
</style>
{foreach $setup as $modals}
<div class="modal fade" id="modal_{$modals['id']}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
   <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
      <div class="modal-content" >
         <div class="modal-header">
            <h5 class="modal-title" >{$modals['title']} </h5>
         </div>
         <div class="modal-body">
		   {if $lang_cookie == "en"}	
			{$modals['content']}
		   {else}
			{$modals['content_cn']}
		   {/if}
         </div>
      </div>
   </div> 
</div>	
{/foreach}
<script>
	window.addEventListener('load', () => {
		if(document.getElementById("clash-android")){
			document.getElementById("clash-android").innerHTML = '<a  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:#1572e8;color:white"  href="clash://install-config?url={urlencode($subInfo['clash'])}"><i class="fas fa-paper-plane"></i> {$lang->get('ToApp')}</a>';
		}
		if(document.getElementById("anxray-android")){
			document.getElementById("anxray-android").innerHTML = '<a class="copy-text btn-dl btn btn-sm btn-flat-primary" style="background-color:#1572e8;color:white"  data-clipboard-text="{$subInfo['anxray']}"><i class="fas fa-paper-plane"></i> {$lang->get('CopyLink')}</a>';
		}
		if(document.getElementById("v2rayng-android")){
			document.getElementById("v2rayng-android").innerHTML = '<a class="copy-text btn-dl btn btn-sm btn-flat-primary" style="background-color:#1572e8;color:white"  data-clipboard-text="{$subInfo['config']}"><i class="fas fa-paper-plane"></i> {$lang->get('CopyLink')}</a>';
		}
		if(document.getElementById("clash-windows")){
			document.getElementById("clash-windows").innerHTML = '<a  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:#1572e8;color:white"  href="clash://install-config?url={urlencode($subInfo['clash'])}"><i class="fas fa-paper-plane"></i> {$lang->get('ToApp')}</a>';
		}
		if(document.getElementById("v2rayn-windows")){
			document.getElementById("v2rayn-windows").innerHTML = '<a class="copy-text btn-dl btn btn-sm btn-flat-primary" style="background-color:#1572e8;color:white"  data-clipboard-text="{$subInfo['config']}"><i class="fas fa-paper-plane"></i> {$lang->get('CopyLink')}</a>';
		}
		if(document.getElementById("shadowrocket-ios")){
			document.getElementById("shadowrocket-ios").innerHTML = '<a class="btn-dl btn btn-sm btn-flat-primary" style="background-color:#1572e8;color:white"  onclick=AddSub("{$subInfo['shadowrocket']}","shadowrocket://add/sub://")><i class="fas fa-paper-plane"></i> {$lang->get('ToApp')}</a>';
		}	
		if(document.getElementById("quantumultx-ios")){
			document.getElementById("quantumultx-ios").innerHTML = '<a class="copy-text btn-dl btn btn-sm btn-flat-primary" style="background-color:#1572e8;color:white"  data-clipboard-text="{$subInfo['quantumultx']}"><i class="fas fa-paper-plane"></i> {$lang->get('CopyLink')}</a>';
		}
		if(document.getElementById("clash-mac-ox")){
			document.getElementById("clash-mac-ox").innerHTML = '<a  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:#1572e8;color:white"  href="clash://install-config?url={urlencode($subInfo['clash'])}"><i class="fas fa-paper-plane"></i> {$lang->get('ToApp')}</a>';
		}
		if(document.getElementById("clash-mac")){
			document.getElementById("clash-mac").innerHTML = '<a  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:#1572e8;color:white"  href="clash://install-config?url={urlencode($subInfo['clash'])}"><i class="fas fa-paper-plane"></i> {$lang->get('ToApp')}</a>';
		}
		if(document.getElementById("qv2ray-linux")){
			document.getElementById("qv2ray-linux").innerHTML = '<a class="copy-text btn-dl btn btn-sm btn-flat-primary" style="background-color:#1572e8;color:white"  data-clipboard-text="{$subInfo['config']}"><i class="fas fa-paper-plane"></i> {$lang->get('CopyLink')}</a>';
		}
		if(document.getElementById("clash-linux")){
			document.getElementById("clash-linux").innerHTML = '<a class="copy-text btn-dl btn btn-sm btn-flat-primary" style="background-color:#1572e8;color:white"  href="clash://install-config?url={urlencode($subInfo['clash'])}"><i class="fas fa-paper-plane"></i> {$lang->get('ToApp')}</a>';
		}		
	})
</script>
