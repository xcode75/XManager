				<div class="tab-pane  fade show applist5" id="rounded-pills-icon-A6" role="tabpanel" aria-labelledby="rounded-pills-icon-A6-tab">
				   <ul class="nav nav-pills N6 justify-content-center" id="rounded-pills-icon-tab" role="tablist">
					  {if $app->getStatus(21) == 1}
					  <li class="nav-item ml-1 mr-1 ap">
						 <a class="nav-link mb-2 active  text-center" id="rounded-pills-icon-21-tab" data-toggle="pill" href="#rounded-pills-icon-21" role="tab" aria-controls="rounded-pills-icon-21" aria-selected="false"><i class="{$app->getAppIcon(21)}"></i> {$app->getTitle(21)} </a>
					  </li>
					  {/if}
					  {if $app->getStatus(22) == 1}
					  <li class="nav-item ml-1 mr-1 ap">
						 <a class="nav-link mb-2   text-center" id="rounded-pills-icon-22-tab" data-toggle="pill" href="#rounded-pills-icon-22" role="tab" aria-controls="rounded-pills-icon-22" aria-selected="false"><i class="{$app->getAppIcon(22)}"></i> {$app->getTitle(22)} </a>
					  </li>
					  {/if}
					  {if $app->getStatus(23) == 1}
					  <li class="nav-item ml-1 mr-1 ap">
						 <a class="nav-link mb-2   text-center" id="rounded-pills-icon-23-tab" data-toggle="pill" href="#rounded-pills-icon-23" role="tab" aria-controls="rounded-pills-icon-23" aria-selected="false"><i class="{$app->getAppIcon(23)}"></i> {$app->getTitle(23)} </a>
					  </li>
					  {/if}
					  {if $app->getStatus(24) == 1}
					  <li class="nav-item ml-1 mr-1 ap">
						 <a class="nav-link mb-2   text-center" id="rounded-pills-icon-24-tab" data-toggle="pill" href="#rounded-pills-icon-24" role="tab" aria-controls="rounded-pills-icon-24" aria-selected="false"><i class="{$app->getAppIcon(24)}"></i> {$app->getTitle(24)} </a>
					  </li>
					  {/if}
				   </ul>
				   <hr>
				   <div class="card-body tab-content" id="rounded-pills-icon-tabContent">
					  {if $app->getStatus(21) == 1}
					  <div class="tab-pane  fade show configlist" id="rounded-pills-icon-21" role="tabpanel" aria-labelledby="rounded-pills-icon-21-tab">
						 <p>
							{$lang->get('downloads')}
							<a  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  href="{$app->getAppURL(21)}" target="_blank"><i class="fad fa-download mr-50"></i> {$lang->get('App')}</a>
						 </p>
						 <p>
							{$lang->get('setup')} 
							<button  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white" type="button" style="background-color: {$Config['app_color']};" data-toggle="modal" data-target="#modal_21"><i class="fad fa-bookmark mr-50"></i> {$lang->get('View')} </button>
						 </p>
						 <p>
							{$lang->get('ConfigLink')}
							<a  class="copy-text btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  data-clipboard-text="{if $Config["sub_addr"] != ""}{$Config["sub_addr"]}{else}{$Config["subUrl"]}{/if}{$sub_token}?{$app->getAppLink(21)}"><i class="fad fa-paper-plane mr-50"></i>  {$lang->get('CopyLink')}</a>
						 </p>
					  </div>
					  {/if}
					  {if $app->getStatus(22) == 1}
					  <div class="tab-pane  fade show configlist" id="rounded-pills-icon-22" role="tabpanel" aria-labelledby="rounded-pills-icon-22-tab">
						 <p>
							{$lang->get('downloads')}
							<a  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  href="{$app->getAppURL(22)}" target="_blank"><i class="fad fa-download mr-50"></i> {$lang->get('App')}</a>
						 </p>
						 <p>
							{$lang->get('setup')} 
							<button  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white" type="button" style="background-color: {$Config['app_color']};" data-toggle="modal" data-target="#modal_22"><i class="fad fa-bookmark mr-50"></i> {$lang->get('View')} </button>
						 </p>
						 <p>
							{$lang->get('ConfigLink')}
							<a  class="copy-text btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  data-clipboard-text="{if $Config["sub_addr"] != ""}{$Config["sub_addr"]}{else}{$Config["subUrl"]}{/if}{$sub_token}?{$app->getAppLink(22)}"><i class="fad fa-paper-plane mr-50"></i>  {$lang->get('CopyLink')}</a>
						 </p>
					  </div>
					  {/if}
					  {if $app->getStatus(23) == 1}
					  <div class="tab-pane  fade show configlist" id="rounded-pills-icon-23" role="tabpanel" aria-labelledby="rounded-pills-icon-23-tab">
						 <p>
							{$lang->get('downloads')} 
							<a  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  href="{$app->getAppURL(23)}" target="_blank"><i class="fad fa-download mr-50"></i> {$lang->get('App')}</a>
						 </p>
						 <p>
							{$lang->get('setup')} 
							<button  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white" type="button" style="background-color: {$Config['app_color']};" data-toggle="modal" data-target="#modal_23"><i class="fad fa-bookmark mr-50"></i> {$lang->get('View')} </button>
						 </p>
						 <p>
							{$lang->get('ConfigLink')}  
							<a  class="copy-text btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  data-clipboard-text="{if $Config["sub_addr"] != ""}{$Config["sub_addr"]}{else}{$Config["subUrl"]}{/if}{$sub_token}?{$app->getAppLink(23)}"><i class="fad fa-paper-plane mr-50"></i>  {$lang->get('CopyLink')}</a>
						 </p>
					  </div>
					  {/if}
					  {if $app->getStatus(24) == 1}
					  <div class="tab-pane  fade show configlist" id="rounded-pills-icon-24" role="tabpanel" aria-labelledby="rounded-pills-icon-24-tab">
						 <p>
							{$lang->get('downloads')}
							<a  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  href="{$app->getAppURL(24)}" target="_blank"><i class="fad fa-download mr-50"></i> {$lang->get('App')}</a>
						 </p>
						 <p>
							{$lang->get('setup')} 
							<button  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white" type="button" style="background-color: {$Config['app_color']};" data-toggle="modal" data-target="#modal_24"><i class="fad fa-bookmark mr-50"></i> {$lang->get('View')} </button>
						 </p>
						 <p>
							{$lang->get('ConfigLink')}
							<a  class="copy-text btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  data-clipboard-text="{if $Config["sub_addr"] != ""}{$Config["sub_addr"]}{else}{$Config["subUrl"]}{/if}{$sub_token}?{$app->getAppLink(24)}"><i class="fad fa-paper-plane mr-50"></i>  {$lang->get('CopyLink')}</a>
						 </p>
					  </div>
					  {/if}
				   </div>
				</div>
