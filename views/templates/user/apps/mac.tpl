				<div class="tab-pane  fade show applist3" id="rounded-pills-icon-A4" role="tabpanel" aria-labelledby="rounded-pills-icon-A4-tab">
				   <ul class="nav nav-pills N4 justify-content-center" id="rounded-pills-icon-tab" role="tablist">
					  {if $app->getStatus(13) == 1}
					  <li class="nav-item ml-1 mr-1 ap">
						 <a class="nav-link mb-2 active  text-center" id="rounded-pills-icon-13-tab" data-toggle="pill" href="#rounded-pills-icon-13" role="tab" aria-controls="rounded-pills-icon-13" aria-selected="false"><i class="{$app->getAppIcon(13)}"></i> {$app->getTitle(13)} </a>
					  </li>
					  {/if}
					  {if $app->getStatus(14) == 1}
					  <li class="nav-item ml-1 mr-1 ap">
						 <a class="nav-link mb-2   text-center" id="rounded-pills-icon-14-tab" data-toggle="pill" href="#rounded-pills-icon-14" role="tab" aria-controls="rounded-pills-icon-14" aria-selected="false"><i class="{$app->getAppIcon(14)}"></i> {$app->getTitle(14)} </a>
					  </li>
					  {/if}
					  {if $app->getStatus(15) == 1}
					  <li class="nav-item ml-1 mr-1 ap">
						 <a class="nav-link mb-2   text-center" id="rounded-pills-icon-15-tab" data-toggle="pill" href="#rounded-pills-icon-15" role="tab" aria-controls="rounded-pills-icon-15" aria-selected="false"><i class="{$app->getAppIcon(15)}"></i> {$app->getTitle(15)} </a>
					  </li>
					  {/if}
					  {if $app->getStatus(16) == 1}
					  <li class="nav-item ml-1 mr-1 ap">
						 <a class="nav-link mb-2   text-center" id="rounded-pills-icon-16-tab" data-toggle="pill" href="#rounded-pills-icon-16" role="tab" aria-controls="rounded-pills-icon-16" aria-selected="false"><i class="{$app->getAppIcon(16)}"></i> {$app->getTitle(16)} </a>
					  </li>
					  {/if}
				   </ul>
				   <hr>
				   <div class="card-body tab-content" id="rounded-pills-icon-tabContent">
					  {if $app->getStatus(13) == 1}
					  <div class="tab-pane  fade show configlist" id="rounded-pills-icon-13" role="tabpanel" aria-labelledby="rounded-pills-icon-13-tab">
						 <p>
							{$lang->get('downloads')}    
							<a  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  href="{$app->getAppURL(13)}" target="_blank"><i class="fad fa-download mr-50"></i> {$lang->get('App')}</a>
						 </p>
						 <p>
							{$lang->get('setup')}
							<button  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white" type="button" style="background-color: {$Config['app_color']};" data-toggle="modal" data-target="#modal_13"><i class="fad fa-bookmark mr-50"></i> {$lang->get('View')} </button>
						 </p>
						 <p>
							{$lang->get('ConfigLink')} 
							<a  class="copy-text btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  data-clipboard-text="{if $Config["sub_addr"] != ""}{$Config["sub_addr"]}{else}{$Config["subUrl"]}{/if}{$sub_token}?{$app->getAppLink(13)}"><i class="fad fa-paper-plane mr-50"></i>  {$lang->get('CopyLink')}</a>
							<a  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  href="clash://install-config?url={urlencode($Config["sub_addr"])}{urlencode($sub_token)}?{urlencode($app->getAppLink(13))}"><i class="fad fa-paper-plane mr-50"></i> {$lang->get('ToApp')}</a>
						 </p>
					  </div>
					  {/if}
					  {if $app->getStatus(14) == 1}
					  <div class="tab-pane  fade show configlist" id="rounded-pills-icon-14" role="tabpanel" aria-labelledby="rounded-pills-icon-14-tab">
						 <p>
							{$lang->get('downloads')}   
							<a  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  href="{$app->getAppURL(14)}" target="_blank"><i class="fad fa-download mr-50"></i> {$lang->get('App')}</a>
						 </p>
						 <p>
							{$lang->get('setup')}
							<button  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white" type="button" style="background-color: {$Config['app_color']};" data-toggle="modal" data-target="#modal_14"><i class="fad fa-bookmark mr-50"></i> {$lang->get('View')} </button>
						 </p>
						 <p>
							{$lang->get('ConfigLink')}  
							<a  class="copy-text btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  data-clipboard-text="{if $Config["sub_addr"] != ""}{$Config["sub_addr"]}{else}{$Config["subUrl"]}{/if}{$sub_token}?{$app->getAppLink(14)}"><i class="fad fa-paper-plane mr-50"></i>  {$lang->get('CopyLink')}</a>
							<a  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  href="clash://install-config?url={urlencode($Config["sub_addr"])}{urlencode($sub_token)}?{urlencode($app->getAppLink(14))}"><i class="fad fa-paper-plane mr-50"></i> {$lang->get('ToApp')}</a>
						 </p>
					  </div>
					  {/if}
					  {if $app->getStatus(15) == 1}
					  <div class="tab-pane  fade show configlist" id="rounded-pills-icon-15" role="tabpanel" aria-labelledby="rounded-pills-icon-15-tab">
						 <p>
							{$lang->get('downloads')}  
							<a  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  href="{$app->getAppURL(15)}" target="_blank"><i class="fad fa-download mr-50"></i> {$lang->get('App')}</a>
						 </p>
						 <p>
							{$lang->get('setup')}
							<button  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white" type="button" style="background-color: {$Config['app_color']};" data-toggle="modal" data-target="#modal_15"><i class="fad fa-bookmark mr-50"></i> {$lang->get('View')} </button>
						 </p>
						 <p>
							{$lang->get('ConfigLink')}   
							<a  class="copy-text btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  data-clipboard-text="{if $Config["sub_addr"] != ""}{$Config["sub_addr"]}{else}{$Config["subUrl"]}{/if}{$sub_token}?{$app->getAppLink(15)}"><i class="fad fa-paper-plane mr-50"></i>  {$lang->get('CopyLink')}</a>
						 </p>
					  </div>
					  {/if}
					  {if $app->getStatus(16) == 1}
					  <div class="tab-pane  fade show configlist" id="rounded-pills-icon-16" role="tabpanel" aria-labelledby="rounded-pills-icon-16-tab">
						 <p>
							{$lang->get('downloads')}  
							<a  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  href="{$app->getAppURL(16)}" target="_blank"><i class="fad fa-download mr-50"></i> {$lang->get('App')}</a>
						 </p>
						 <p>
							{$lang->get('setup')} 
							<button  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white" type="button" style="background-color: {$Config['app_color']};" data-toggle="modal" data-target="#modal_16"><i class="fad fa-bookmark mr-50"></i> {$lang->get('View')} </button>
						 </p>
						 <p>
							{$lang->get('ConfigLink')}   
							<a  class="copy-text btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  data-clipboard-text="{if $Config["sub_addr"] != ""}{$Config["sub_addr"]}{else}{$Config["subUrl"]}{/if}{$sub_token}?{$app->getAppLink(16)}"><i class="fad fa-paper-plane mr-50"></i>  {$lang->get('CopyLink')}</a>
						 </p>
					  </div>
					  {/if}
				   </div>
				</div>				
