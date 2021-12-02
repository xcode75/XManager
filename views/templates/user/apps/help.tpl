				<div class="tab-pane  fade show applist6" id="rounded-pills-icon-A7" role="tabpanel" aria-labelledby="rounded-pills-icon-A7-tab">
				   <ul class="nav nav-pills N7 justify-content-center" id="rounded-pills-icon-tab" role="tablist">
					 {if $app->getStatus(25) == 1}
					 <li class="nav-item ml-1 mr-1 ap">
						 <a class="nav-link mb-2 active  text-center" id="rounded-pills-icon-25-tab" data-toggle="pill" href="#rounded-pills-icon-25" role="tab" aria-controls="rounded-pills-icon-25" aria-selected="false"><i class="{$app->getAppIcon(25)}"></i> {$app->getTitle(25)} </a>
					  </li>
					  {/if}
					  {if $app->getStatus(26) == 1}
					  <li class="nav-item ml-1 mr-1 ap">
						 <a class="nav-link mb-2   text-center" id="rounded-pills-icon-26-tab" data-toggle="pill" href="#rounded-pills-icon-26" role="tab" aria-controls="rounded-pills-icon-26" aria-selected="false"><i class="{$app->getAppIcon(26)}"></i> {$app->getTitle(26)} </a>
					  </li>
					  {/if}
					  {if $app->getStatus(27) == 1}
					  <li class="nav-item ml-1 mr-1 ap">
						 <a class="nav-link mb-2   text-center" id="rounded-pills-icon-27-tab" data-toggle="pill" href="#rounded-pills-icon-27" role="tab" aria-controls="rounded-pills-icon-27" aria-selected="false"><i class="{$app->getAppIcon(27)}"></i> {$app->getTitle(27)} </a>
					  </li>
					  {/if}
					  {if $app->getStatus(28) == 1}
					  <li class="nav-item ml-1 mr-1 ap">
						 <a class="nav-link mb-2   text-center" id="rounded-pills-icon-28-tab" data-toggle="pill" href="#rounded-pills-icon-28" role="tab" aria-controls="rounded-pills-icon-28" aria-selected="false"><i class="{$app->getAppIcon(28)}"></i> {$app->getTitle(28)} </a>
					  </li>
					  {/if}
				   </ul>
				   <hr>
				   <div class="card-body tab-content" id="rounded-pills-icon-tabContent">
					  {if $app->getStatus(25) == 1}
					  <div class="tab-pane  fade show configlist" id="rounded-pills-icon-25" role="tabpanel" aria-labelledby="rounded-pills-icon-25-tab">
						 <p>
							{$lang->get('downloads')}  
							<a  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  href="{$app->getAppURL(25)}" target="_blank"><i class="fad fa-download mr-50"></i> {$lang->get('App')}</a>
						 </p>
						 <p>
							{$lang->get('setup')}  
							<button  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white" type="button" style="background-color: {$Config['app_color']};" data-toggle="modal" data-target="#modal_25"><i class="fad fa-bookmark mr-50"></i> {$lang->get('View')} </button>
						 </p>
					  </div>
					  {/if}
					  {if $app->getStatus(26) == 1}
					  <div class="tab-pane  fade show configlist" id="rounded-pills-icon-26" role="tabpanel" aria-labelledby="rounded-pills-icon-26-tab">
						 <p>
							{$lang->get('downloads')}  
							<a  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  href="{$app->getAppURL(26)}" target="_blank"><i class="fad fa-download mr-50"></i> {$lang->get('App')}</a>
						 </p>
						 <p>
							{$lang->get('setup')} 
							<button  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white" type="button" style="background-color: {$Config['app_color']};" data-toggle="modal" data-target="#modal_26"><i class="fad fa-bookmark mr-50"></i> {$lang->get('View')} </button>
						 </p>
					  </div>
					  {/if}
					  {if $app->getStatus(27) == 1}
					  <div class="tab-pane  fade show configlist" id="rounded-pills-icon-27" role="tabpanel" aria-labelledby="rounded-pills-icon-27-tab">
						 <p>
							{$lang->get('downloads')}  
							<a  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  href="{$app->getAppURL(27)}" target="_blank"><i class="fad fa-download mr-50"></i> {$lang->get('App')}</a>
						 </p>
						 <p>
							{$lang->get('setup')}  
							<button  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white" type="button" style="background-color: {$Config['app_color']};" data-toggle="modal" data-target="#modal_27"><i class="fad fa-bookmark mr-50"></i> {$lang->get('View')} </button>
						 </p>
					  </div>
					  {/if}
					  {if $app->getStatus(28) == 1}
					  <div class="tab-pane  fade show configlist" id="rounded-pills-icon-28" role="tabpanel" aria-labelledby="rounded-pills-icon-28-tab">
						 <p>
							{$lang->get('downloads')}  
							<a  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  href="{$app->getAppURL(28)}" target="_blank"><i class="fad fa-download mr-50"></i> {$lang->get('App')}</a>
						 </p>
						 <p>
							{$lang->get('setup')} 
							<button  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white" type="button" style="background-color: {$Config['app_color']};" data-toggle="modal" data-target="#modal_28"><i class="fad fa-bookmark mr-50"></i> {$lang->get('View')} </button>
						 </p>
					  </div>
					  {/if}
				   </div>
				</div>				
