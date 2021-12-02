				<div class="tab-pane  fade show active applist" id="rounded-pills-icon-A1" role="tabpanel" aria-labelledby="rounded-pills-icon-A1-tab">
					<ul class="nav nav-pills N1  justify-content-center" id="rounded-pills-icon-tab" role="tablist">
					    
						<li class="nav-item ml-1 mr-1 ap">
							<a class="nav-link mb-2  active text-center" id="rounded-pills-icon-1-tab" data-toggle="pill" href="#rounded-pills-icon-1" role="tab" aria-controls="rounded-pills-icon-1" aria-selected="false"><i class="{$app->getAppIcon(1)}"></i> {$app->getTitle(1)} </a>
						</li>
						
						{if $app->getStatus(2) == 1}
						<li class="nav-item ml-1 mr-1 ap">
							<a class="nav-link mb-2   text-center" id="rounded-pills-icon-2-tab" data-toggle="pill" href="#rounded-pills-icon-2" role="tab" aria-controls="rounded-pills-icon-2" aria-selected="false"><i class="{$app->getAppIcon(2)}"></i> {$app->getTitle(2)} </a>
						</li>
						{/if}
						{if $app->getStatus(3) == 1}
						<li class="nav-item ml-1 mr-1 ap">
							<a class="nav-link mb-2   text-center" id="rounded-pills-icon-3-tab" data-toggle="pill" href="#rounded-pills-icon-3" role="tab" aria-controls="rounded-pills-icon-3" aria-selected="false"><i class="{$app->getAppIcon(3)}"></i> {$app->getTitle(3)} </a>
						</li>
						{/if}
						{if $app->getStatus(4) == 1}
						<li class="nav-item ml-1 mr-1 ap">
							<a class="nav-link mb-2   text-center" id="rounded-pills-icon-4-tab" data-toggle="pill" href="#rounded-pills-icon-4" role="tab" aria-controls="rounded-pills-icon-4" aria-selected="false"><i class="{$app->getAppIcon(4)}"></i> {$app->getTitle(4)} </a>
						</li> 
						{/if}
				    </ul>
				   <hr>
				    <div class="card-body tab-content" id="rounded-pills-icon-tabContent">
						
						<div class="tab-pane fade show active configlist" id="rounded-pills-icon-1" role="tabpanel" aria-labelledby="rounded-pills-icon-1-tab">
						   <p>
							  {$lang->get('downloads')}
							  <a  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  href="{$app->getAppURL(1)}" target="_blank"><i class="fad fa-download mr-50"></i> {$lang->get('App')}</a>
						   </p>
						   <p>
							  {$lang->get('setup')} 
							  <button  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white" type="button" style="background-color: {$Config['app_color']};" data-toggle="modal" data-target="#modal_1"><i class="fad fa-bookmark mr-50"></i> {$lang->get('View')} </button>
						   </p>
						   <p>
							  {$lang->get('ConfigLink')}  
							  <a  class="copy-text btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  data-clipboard-text="{if $Config["sub_addr"] != ""}{$Config["sub_addr"]}{else}{$Config["subUrl"]}{/if}{$sub_token}?{$app->getAppLink(1)}"><i class="fad fa-paper-plane mr-50"></i>  {$lang->get('CopyLink')} </a>
							  <a  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  href="clash://install-config?url={urlencode($Config["sub_addr"])}{urlencode($sub_token)}?{urlencode($app->getAppLink(1))}"><i class="fad fa-paper-plane mr-50"></i> {$lang->get('ToApp')}</a>
						   </p>
						</div>
						
						{if $app->getStatus(2) == 1}
						<div class="tab-pane  fade show configlist" id="rounded-pills-icon-2" role="tabpanel" aria-labelledby="rounded-pills-icon-2-tab">
						   <p>
							 {$lang->get('downloads')} 
							  <a  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  href="{$app->getAppURL(2)}" target="_blank"><i class="fad fa-download mr-50"></i> {$lang->get('App')}</a>
						   </p>
						   <p>
							  {$lang->get('setup')} 
							  <button  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white" type="button" style="background-color: {$Config['app_color']};" data-toggle="modal" data-target="#modal_2"><i class="fad fa-bookmark mr-50"></i> {$lang->get('View')} </button>
						   </p>
						   <p>
							 {$lang->get('ConfigLink')}    
							  <a  class="copy-text btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  data-clipboard-text="{if $Config["sub_addr"] != ""}{$Config["sub_addr"]}{else}{$Config["subUrl"]}{/if}{$sub_token}?{$app->getAppLink(2)}"><i class="fad fa-paper-plane mr-50"></i>  {$lang->get('CopyLink')}</a>
						   </p>
						</div>
						{/if}
						{if $app->getStatus(3) == 1}
						<div class="tab-pane  fade show configlist" id="rounded-pills-icon-3" role="tabpanel" aria-labelledby="rounded-pills-icon-3-tab">
						   <p>
							  {$lang->get('downloads')} 
							  <a  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  href="{$app->getAppURL(3)}" target="_blank"><i class="fad fa-download mr-50"></i> {$lang->get('App')}</a>
						   </p>
						   <p>
							  {$lang->get('setup')} 
							  <button  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white" type="button" style="background-color: {$Config['app_color']};" data-toggle="modal" data-target="#modal_3"><i class="fad fa-bookmark mr-50"></i> {$lang->get('View')} </button>
						   </p>
						   <p>
							  {$lang->get('ConfigLink')}  
							  <a  class="copy-text btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  data-clipboard-text="{if $Config["sub_addr"] != ""}{$Config["sub_addr"]}{else}{$Config["subUrl"]}{/if}{$sub_token}?{$app->getAppLink(3)}"><i class="fad fa-paper-plane mr-50"></i>  {$lang->get('CopyLink')}</a>
						   </p>
						</div>
						{/if}
						{if $app->getStatus(4) == 1}
						<div class="tab-pane  fade show configlist" id="rounded-pills-icon-4" role="tabpanel" aria-labelledby="rounded-pills-icon-4-tab">
						   <p>
							  {$lang->get('downloads')}  
							  <a  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  href="{$app->getAppURL(4)}" target="_blank"><i class="fad fa-download mr-50"></i> {$lang->get('App')}</a>
						   </p>
						   <p>
							  {$lang->get('setup')}
							  <button  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white" type="button" style="background-color: {$Config['app_color']};" data-toggle="modal" data-target="#modal_4"><i class="fad fa-bookmark mr-50"></i> {$lang->get('View')} </button>
						   </p>
						   <p>
							  {$lang->get('ConfigLink')}  
							  <a  class="copy-text btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  data-clipboard-text="{if $Config["sub_addr"] != ""}{$Config["sub_addr"]}{else}{$Config["subUrl"]}{/if}{$sub_token}?{$app->getAppLink(4)}"><i class="fad fa-paper-plane mr-50"></i>  {$lang->get('CopyLink')}</a>
						   </p>
						</div>
						{/if}
				    </div>
			    </div>