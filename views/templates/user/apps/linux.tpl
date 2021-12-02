				<div class="tab-pane  fade show applist4" id="rounded-pills-icon-A5" role="tabpanel" aria-labelledby="rounded-pills-icon-A5-tab">
				   <ul class="nav nav-pills N5 justify-content-center" id="rounded-pills-icon-tab" role="tablist">
					  {if $app->getStatus(17) == 1}
					  <li class="nav-item ml-1 mr-1 ap">
						 <a class="nav-link mb-2 active  text-center" id="rounded-pills-icon-17-tab" data-toggle="pill" href="#rounded-pills-icon-17" role="tab" aria-controls="rounded-pills-icon-17" aria-selected="false"><i class="{$app->getAppIcon(17)}"></i> {$app->getTitle(17)} </a>
					  </li>
					  {/if}
					  {if $app->getStatus(18) == 1}
					  <li class="nav-item ml-1 mr-1 ap">
						 <a class="nav-link mb-2   text-center" id="rounded-pills-icon-18-tab" data-toggle="pill" href="#rounded-pills-icon-18" role="tab" aria-controls="rounded-pills-icon-18" aria-selected="false"><i class="{$app->getAppIcon(18)}"></i> {$app->getTitle(18)} </a>
					  </li>
					  {/if}
					  {if $app->getStatus(19) == 1}
					  <li class="nav-item ml-1 mr-1 ap">
						 <a class="nav-link mb-2   text-center" id="rounded-pills-icon-19-tab" data-toggle="pill" href="#rounded-pills-icon-19" role="tab" aria-controls="rounded-pills-icon-19" aria-selected="false"><i class="{$app->getAppIcon(19)}"></i> {$app->getTitle(19)} </a>
					  </li>
					  {/if}
					  {if $app->getStatus(20) == 1}
					  <li class="nav-item ml-1 mr-1 ap">
						 <a class="nav-link mb-2   text-center" id="rounded-pills-icon-20-tab" data-toggle="pill" href="#rounded-pills-icon-20" role="tab" aria-controls="rounded-pills-icon-20" aria-selected="false"><i class="{$app->getAppIcon(20)}"></i> {$app->getTitle(20)} </a>
					  </li>
					  {/if}
				   </ul>
				   <hr>
				   <div class="card-body tab-content" id="rounded-pills-icon-tabContent">
					  {if $app->getStatus(17) == 1}
					  <div class="tab-pane  fade show configlist" id="rounded-pills-icon-17" role="tabpanel" aria-labelledby="rounded-pills-icon-17-tab">
						 <p>
							{$lang->get('downloads')}  
							<a  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  href="{$app->getAppURL(17)}" target="_blank"><i class="fad fa-download mr-50"></i> {$lang->get('App')}</a>
						 </p>
						 <p>
							{$lang->get('setup')} 
							<button  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white" type="button" style="background-color: {$Config['app_color']};" data-toggle="modal" data-target="#modal_17"><i class="fad fa-bookmark mr-50"></i> {$lang->get('View')} </button>
						 </p>
						 <p>
							{$lang->get('ConfigLink')} 
							<a  class="copy-text btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  data-clipboard-text="{if $Config["sub_addr"] != ""}{$Config["sub_addr"]}{else}{$Config["subUrl"]}{/if}{$sub_token}?{$app->getAppLink(17)}"><i class="fad fa-paper-plane mr-50"></i>  {$lang->get('CopyLink')}</a>
						 </p>
					  </div>
					  {/if}
					  {if $app->getStatus(18) == 1}
					  <div class="tab-pane  fade show configlist" id="rounded-pills-icon-18" role="tabpanel" aria-labelledby="rounded-pills-icon-18-tab">
						 <p>
							{$lang->get('downloads')}  
							<a  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  href="{$app->getAppURL(18)}" target="_blank"><i class="fad fa-download mr-50"></i> {$lang->get('App')}</a>
						 </p>
						 <p>
							{$lang->get('setup')} 
							<button  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white" type="button" style="background-color: {$Config['app_color']};" data-toggle="modal" data-target="#modal_18"><i class="fad fa-bookmark mr-50"></i> {$lang->get('View')} </button>
						 </p>
						 <p>
							{$lang->get('ConfigLink')} 
							<a  class="copy-text btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  data-clipboard-text="{if $Config["sub_addr"] != ""}{$Config["sub_addr"]}{else}{$Config["subUrl"]}{/if}{$sub_token}?{$app->getAppLink(18)}"><i class="fad fa-paper-plane mr-50"></i>  {$lang->get('CopyLink')}</a>
							<a  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  href="clash://install-config?url={urlencode($Config["sub_addr"])}{urlencode($sub_token)}?{urlencode($app->getAppLink(18))}"><i class="fad fa-paper-plane mr-50"></i> {$lang->get('ToApp')}</a>
						 </p>
					  </div>
					  {/if}
					  {if $app->getStatus(19) == 1}
					  <div class="tab-pane  fade show configlist" id="rounded-pills-icon-19" role="tabpanel" aria-labelledby="rounded-pills-icon-19-tab">
						 <p>
							{$lang->get('downloads')}   
							<a  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  href="{$app->getAppURL(19)}" target="_blank"><i class="fad fa-download mr-50"></i> {$lang->get('App')}</a>
						 </p>
						 <p>
							{$lang->get('setup')} 
							<button  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white" type="button" style="background-color: {$Config['app_color']};" data-toggle="modal" data-target="#modal_19"><i class="fad fa-bookmark mr-50"></i> {$lang->get('View')} </button>
						 </p>
						 <p>
							{$lang->get('ConfigLink')}  
							<a  class="copy-text btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  data-clipboard-text="{if $Config["sub_addr"] != ""}{$Config["sub_addr"]}{else}{$Config["subUrl"]}{/if}{$sub_token}?{$app->getAppLink(19)}"><i class="fad fa-paper-plane mr-50"></i>  {$lang->get('CopyLink')}</a>
						 </p>
					  </div>
					  {/if}
					  {if $app->getStatus(20) == 1}
					  <div class="tab-pane  fade show configlist" id="rounded-pills-icon-20" role="tabpanel" aria-labelledby="rounded-pills-icon-20-tab">
						 <p>
							{$lang->get('downloads')}  
							<a  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  href="{$app->getAppURL(20)}" target="_blank"><i class="fad fa-download mr-50"></i> {$lang->get('App')}</a>
						 </p>
						 <p>
							{$lang->get('setup')} 
							<button  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white" type="button" style="background-color: {$Config['app_color']};" data-toggle="modal" data-target="#modal_20"><i class="fad fa-bookmark mr-50"></i> {$lang->get('View')} </button>
						 </p>
						 <p>
							{$lang->get('ConfigLink')}  
							<a  class="copy-text btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  data-clipboard-text="{if $Config["sub_addr"] != ""}{$Config["sub_addr"]}{else}{$Config["subUrl"]}{/if}{$sub_token}?{$app->getAppLink(20)}"><i class="fad fa-paper-plane mr-50"></i>  {$lang->get('CopyLink')}</a>
						 </p>
					  </div>
					  {/if}
				   </div>
				</div>			
