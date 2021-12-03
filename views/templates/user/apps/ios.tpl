				<div class="tab-pane  fade show applist2" id="rounded-pills-icon-A2" role="tabpanel" aria-labelledby="rounded-pills-icon-A2-tab">
				   <ul class="nav nav-pills N2 justify-content-center" id="rounded-pills-icon-tab" role="tablist">
					  {if $app->getStatus(9) == 1}
					  <li class="nav-item ml-1 mr-1 ap">
						 <a class="nav-link mb-2 active  text-center" id="rounded-pills-icon-9-tab" data-toggle="pill" href="#rounded-pills-icon-9" role="tab" aria-controls="rounded-pills-icon-9" aria-selected="false"><i class="{$app->getAppIcon(9)}"></i> {$app->getTitle(9)} </a>
					  </li>
					  {/if}
					  {if $app->getStatus(10) == 1}
					  <li class="nav-item ml-1 mr-1 ap">
						 <a class="nav-link mb-2   text-center" id="rounded-pills-icon-10-tab" data-toggle="pill" href="#rounded-pills-icon-10" role="tab" aria-controls="rounded-pills-icon-10" aria-selected="false"><i class="{$app->getAppIcon(10)}"></i> {$app->getTitle(10)} </a>
					  </li>
					  {/if}
					  {if $app->getStatus(11) == 1}
					  <li class="nav-item ml-1 mr-1 ap">
						 <a class="nav-link mb-2   text-center" id="rounded-pills-icon-11-tab" data-toggle="pill" href="#rounded-pills-icon-11" role="tab" aria-controls="rounded-pills-icon-11" aria-selected="false"><i class="{$app->getAppIcon(11)}"></i> {$app->getTitle(11)} </a>
					  </li>
					  {/if}
					  {if $app->getStatus(12) == 1}
					  <li class="nav-item ml-1 mr-1 ap">
						 <a class="nav-link mb-2   text-center" id="rounded-pills-icon-12-tab" data-toggle="pill" href="#rounded-pills-icon-12" role="tab" aria-controls="rounded-pills-icon-12" aria-selected="false"><i class="{$app->getAppIcon(12)}"></i> {$app->getTitle(12)} </a>
					  </li>
					  {/if}
				   </ul>
				   <hr>
				   <div class="card-body tab-content" id="rounded-pills-icon-tabContent">
					  {if $app->getStatus(9) == 1}
					  <div class="tab-pane  fade show configlist" id="rounded-pills-icon-9" role="tabpanel" aria-labelledby="rounded-pills-icon-9-tab">
						 <p>
							{$lang->get('downloads')}  
							<a  class="btn-dl btn btn-sm btn-relief-primary" style="background-color:{$Config['app_color']};color:white"  href="{$app->getAppURL(9)}" target="_blank"><i class="fad fa-download mr-50"></i> {$lang->get('App')}</a>
						 </p>
						 <p>
							{$lang->get('setup')} 
							<button  class="btn-dl btn btn-sm btn-relief-primary" style="background-color:{$Config['app_color']};color:white" type="button" style="background-color: {$Config['app_color']};" data-toggle="modal" data-target="#modal_9"><i class="fad fa-bookmark mr-50"></i> {$lang->get('View')} </button>
						 </p>
						 <p>
							{$lang->get('ConfigLink')}  
							<a  class="copy-text btn-dl btn btn-sm btn-relief-primary" style="background-color:{$Config['app_color']};color:white"  data-clipboard-text="{if $Config["sub_addr"] != ""}{$Config["sub_addr"]}{else}{$Config["subUrl"]}{/if}{$sub_token}?{$app->getAppLink(9)}"><i class="fad fa-paper-plane mr-50"></i>  {$lang->get('CopyLink')}</a>
							<a class="btn-dl btn btn-sm btn-relief-primary" style="background-color:{$Config['app_color']};color:white"  onclick=AddSub("{if $Config["sub_addr"] != ""}{$Config["sub_addr"]}{else}{$Config["subUrl"]}{/if}{$sub_token}?{$app->getAppLink(9)}","shadowrocket://add/sub://")><i class="fad fa-paper-plane mr-50"></i> {$lang->get('ToApp')} </a>
						 </p>
					  </div>
					  {/if}
					  {if $app->getStatus(10) == 1}
					  <div class="tab-pane  fade show configlist" id="rounded-pills-icon-10" role="tabpanel" aria-labelledby="rounded-pills-icon-10-tab">
						 <p>
							{$lang->get('downloads')}  
							<a  class="btn-dl btn btn-sm btn-relief-primary" style="background-color:{$Config['app_color']};color:white"  href="{$app->getAppURL(10)}" target="_blank"><i class="fad fa-download mr-50"></i> {$lang->get('App')}</a>
						 </p>
						 <p>
							{$lang->get('setup')}  
							<button  class="btn-dl btn btn-sm btn-relief-primary" style="background-color:{$Config['app_color']};color:white" type="button" style="background-color: {$Config['app_color']};" data-toggle="modal" data-target="#modal_10"><i class="fad fa-bookmark mr-50"></i> {$lang->get('View')} </button>
						 </p>
						 <p>
							{$lang->get('ConfigLink')}   
							<a  class="copy-text btn-dl btn btn-sm btn-relief-primary" style="background-color:{$Config['app_color']};color:white"  data-clipboard-text="{if $Config["sub_addr"] != ""}{$Config["sub_addr"]}{else}{$Config["subUrl"]}{/if}{$sub_token}?{$app->getAppLink(10)}"><i class="fad fa-paper-plane mr-50"></i>  {$lang->get('CopyLink')}</a>
						 </p>
					  </div>
					  {/if}
					  {if $app->getStatus(11) == 1}
					  <div class="tab-pane  fade show configlist" id="rounded-pills-icon-11" role="tabpanel" aria-labelledby="rounded-pills-icon-11-tab">
						 <p>
							{$lang->get('downloads')}  
							<a  class="btn-dl btn btn-sm btn-relief-primary" style="background-color:{$Config['app_color']};color:white"  href="{$app->getAppURL(11)}" target="_blank"><i class="fad fa-download mr-50"></i> {$lang->get('App')}</a>
						 </p>
						 <p>
							{$lang->get('setup')}  
							<button  class="btn-dl btn btn-sm btn-relief-primary" style="background-color:{$Config['app_color']};color:white" type="button" style="background-color: {$Config['app_color']};" data-toggle="modal" data-target="#modal_11"><i class="fad fa-bookmark mr-50"></i> {$lang->get('View')} </button>
						 </p>
						 <p>
							{$lang->get('ConfigLink')} 
							<a  class="copy-text btn-dl btn btn-sm btn-relief-primary" style="background-color:{$Config['app_color']};color:white"  data-clipboard-text="{if $Config["sub_addr"] != ""}{$Config["sub_addr"]}{else}{$Config["subUrl"]}{/if}{$sub_token}?{$app->getAppLink(11)}"><i class="fad fa-paper-plane mr-50"></i>  {$lang->get('CopyLink')}</a>
						 </p>
					  </div>
					  {/if}
					  {if $app->getStatus(12) == 1}
					  <div class="tab-pane  fade show configlist" id="rounded-pills-icon-12" role="tabpanel" aria-labelledby="rounded-pills-icon-12-tab">
						 <p>
							{$lang->get('downloads')}   
							<a  class="btn-dl btn btn-sm btn-relief-primary" style="background-color:{$Config['app_color']};color:white"  href="{$app->getAppURL(12)}" target="_blank"><i class="fad fa-download mr-50"></i> {$lang->get('App')}</a>
						 </p>
						 <p>
							{$lang->get('setup')} 
							<button  class="btn-dl btn btn-sm btn-relief-primary" style="background-color:{$Config['app_color']};color:white" type="button" style="background-color: {$Config['app_color']};" data-toggle="modal" data-target="#modal_12"><i class="fad fa-bookmark mr-50"></i> {$lang->get('View')} </button>
						 </p>
						 <p>
							{$lang->get('ConfigLink')}  
							<a  class="copy-text btn-dl btn btn-sm btn-relief-primary" style="background-color:{$Config['app_color']};color:white"  data-clipboard-text="{if $Config["sub_addr"] != ""}{$Config["sub_addr"]}{else}{$Config["subUrl"]}{/if}{$sub_token}?{$app->getAppLink(12)}"><i class="fad fa-paper-plane mr-50"></i>  {$lang->get('CopyLink')}</a>
						 </p>
					  </div>
					  {/if}
				   </div>
				</div>				
