				<div class="tab-pane  fade show applist1" id="rounded-pills-icon-A3" role="tabpanel" aria-labelledby="rounded-pills-icon-A3-tab">
				   <ul class="nav nav-pills N3 justify-content-center" id="rounded-pills-icon-tab" role="tablist">
					  {if $app->getStatus(5) == 1}
					  <li class="nav-item ml-1 mr-1 ap">
						 <a class="nav-link mb-2  active text-center" id="rounded-pills-icon-5-tab" data-toggle="pill" href="#rounded-pills-icon-5" role="tab" aria-controls="rounded-pills-icon-5" aria-selected="false"><i class="{$app->getAppIcon(5)}"></i> {$app->getTitle(5)} </a>
					  </li>
					  {/if}
					  {if $app->getStatus(6) == 1}
					  <li class="nav-item ml-1 mr-1 ap">
						 <a class="nav-link mb-2   text-center" id="rounded-pills-icon-6-tab" data-toggle="pill" href="#rounded-pills-icon-6" role="tab" aria-controls="rounded-pills-icon-6" aria-selected="false"><i class="{$app->getAppIcon(6)}"></i> {$app->getTitle(6)} </a>
					  </li>
					  {/if}
					  {if $app->getStatus(7) == 1}
					  <li class="nav-item ml-1 mr-1 ap">
						 <a class="nav-link mb-2   text-center" id="rounded-pills-icon-7-tab" data-toggle="pill" href="#rounded-pills-icon-7" role="tab" aria-controls="rounded-pills-icon-7" aria-selected="false"><i class="{$app->getAppIcon(7)}"></i> {$app->getTitle(7)} </a>
					  </li>
					  {/if}
					  {if $app->getStatus(8) == 1}
					  <li class="nav-item ml-1 mr-1 ap">
						 <a class="nav-link mb-2   text-center" id="rounded-pills-icon-8-tab" data-toggle="pill" href="#rounded-pills-icon-8" role="tab" aria-controls="rounded-pills-icon-8" aria-selected="false"><i class="{$app->getAppIcon(8)}"></i> {$app->getTitle(8)} </a>
					  </li>
					  {/if}
				   </ul>
				   <hr>
				   <div class="card-body tab-content" id="rounded-pills-icon-tabContent">
					  {if $app->getStatus(5) == 1}
					  <div class="tab-pane  fade show configlist" id="rounded-pills-icon-5" role="tabpanel" aria-labelledby="rounded-pills-icon-5-tab">
						 <p>
							{$lang->get('downloads')}
							<a  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  href="{$app->getAppURL(5)}" target="_blank"><i class="fad fa-download mr-50"></i> {$lang->get('App')}</a>
						 </p>
						 <p>
							{$lang->get('setup')} 
							<button  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white" type="button" style="background-color: {$Config['app_color']};" data-toggle="modal" data-target="#modal_5"><i class="fad fa-bookmark mr-50"></i> {$lang->get('View')} </button>
						 </p>
						 <p>
							{$lang->get('ConfigLink')}  
							<a  class="copy-text btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  data-clipboard-text="{if $Config["sub_addr"] != ""}{$Config["sub_addr"]}{else}{$Config["subUrl"]}{/if}{$sub_token}?{$app->getAppLink(5)}"><i class="fad fa-paper-plane mr-50"></i>  {$lang->get('CopyLink')}</a>
							<a  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  href="clash://install-config?url={urlencode($Config["sub_addr"])}{urlencode($sub_token)}?{urlencode($app->getAppLink(5))}"><i class="fad fa-paper-plane mr-50"></i> {$lang->get('ToApp')}</a>
						 </p>
					  </div>
					  {/if}
					  {if $app->getStatus(6) == 1}
					  <div class="tab-pane  fade show configlist" id="rounded-pills-icon-6" role="tabpanel" aria-labelledby="rounded-pills-icon-6-tab">
						 <p>
							{$lang->get('downloads')}
							<a  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  href="{$app->getAppURL(6)}" target="_blank"><i class="fad fa-download mr-50"></i> {$lang->get('App')}</a>
						 </p>
						 <p>
							{$lang->get('setup')} 
							<button  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white" type="button" style="background-color: {$Config['app_color']};" data-toggle="modal" data-target="#modal_6"><i class="fad fa-bookmark mr-50"></i> {$lang->get('View')} </button>
						 </p>
						 <p>
							{$lang->get('ConfigLink')} 
							<a  class="copy-text btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  data-clipboard-text="{if $Config["sub_addr"] != ""}{$Config["sub_addr"]}{else}{$Config["subUrl"]}{/if}{$sub_token}?{$app->getAppLink(6)}"><i class="fad fa-paper-plane mr-50"></i>  {$lang->get('CopyLink')}</a>
						 </p>
					  </div>
					  {/if}
					  {if $app->getStatus(7) == 1}
					  <div class="tab-pane  fade show configlist" id="rounded-pills-icon-7" role="tabpanel" aria-labelledby="rounded-pills-icon-7-tab">
						 <p>
							{$lang->get('downloads')}
							<a  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  href="{$app->getAppURL(7)}" target="_blank"><i class="fad fa-download mr-50"></i> {$lang->get('App')}</a>
						 </p>
						 <p>
							{$lang->get('setup')} 
							<button  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white" type="button" style="background-color: {$Config['app_color']};" data-toggle="modal" data-target="#modal_7"><i class="fad fa-bookmark mr-50"></i> {$lang->get('View')} </button>
						 </p>
						 <p>
							{$lang->get('ConfigLink')}
							<a  class="copy-text btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  data-clipboard-text="{if $Config["sub_addr"] != ""}{$Config["sub_addr"]}{else}{$Config["subUrl"]}{/if}{$sub_token}?{$app->getAppLink(7)}"><i class="fad fa-paper-plane mr-50"></i>  {$lang->get('CopyLink')}</a>
						 </p>
					  </div>
					  {/if}
					  {if $app->getStatus(8) == 1}
					  <div class="tab-pane  fade show configlist" id="rounded-pills-icon-8" role="tabpanel" aria-labelledby="rounded-pills-icon-8-tab">
						 <p>
							{$lang->get('downloads')}
							<a  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  href="{$app->getAppURL(8)}" target="_blank"><i class="fad fa-download mr-50"></i> {$lang->get('App')}</a>
						 </p>
						 <p>
							{$lang->get('setup')} 
							<button  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white" type="button" style="background-color: {$Config['app_color']};" data-toggle="modal" data-target="#modal_8"><i class="fad fa-bookmark mr-50"></i> {$lang->get('View')} </button>
						 </p>
						 <p>
							{$lang->get('ConfigLink')}
							<a  class="copy-text btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  data-clipboard-text="{if $Config["sub_addr"] != ""}{$Config["sub_addr"]}{else}{$Config["subUrl"]}{/if}{$sub_token}?{$app->getAppLink(8)}"><i class="fad fa-paper-plane mr-50"></i>  {$lang->get('CopyLink')}</a>
						 </p>
					  </div>
					  {/if}
				   </div>
				</div>
