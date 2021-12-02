				<div class="tab-pane  fade show applist7" id="rounded-pills-icon-A8" role="tabpanel" aria-labelledby="rounded-pills-icon-A8-tab">
				   <ul class="nav nav-pills N8 justify-content-center" id="rounded-pills-icon-tab" role="tablist">
					 {if $app->getStatus(29) == 1}
					 <li class="nav-item ml-1 mr-1 ap">
						 <a class="nav-link mb-2 active  text-center" id="rounded-pills-icon-29-tab" data-toggle="pill" href="#rounded-pills-icon-29" role="tab" aria-controls="rounded-pills-icon-29" aria-selected="false"><i class="{$app->getAppIcon(29)}"></i> {$app->getTitle(29)} </a>
					  </li>
					  {/if}
					  {if $app->getStatus(30) == 1}
					  <li class="nav-item ml-1 mr-1 ap">
						 <a class="nav-link mb-2   text-center" id="rounded-pills-icon-30-tab" data-toggle="pill" href="#rounded-pills-icon-30" role="tab" aria-controls="rounded-pills-icon-30" aria-selected="false"><i class="{$app->getAppIcon(30)}"></i> {$app->getTitle(30)} </a>
					  </li>
					  {/if}
					  {if $app->getStatus(31) == 1}
					  <li class="nav-item ml-1 mr-1 ap">
						 <a class="nav-link mb-2   text-center" id="rounded-pills-icon-31-tab" data-toggle="pill" href="#rounded-pills-icon-31" role="tab" aria-controls="rounded-pills-icon-31" aria-selected="false"><i class="{$app->getAppIcon(31)}"></i> {$app->getTitle(31)} </a>
					  </li>
					  {/if}
					  {if $app->getStatus(32) == 1}
					  <li class="nav-item ml-1 mr-1 ap">
						 <a class="nav-link mb-2   text-center" id="rounded-pills-icon-32-tab" data-toggle="pill" href="#rounded-pills-icon-32" role="tab" aria-controls="rounded-pills-icon-32" aria-selected="false"><i class="{$app->getAppIcon(32)}"></i> {$app->getTitle(32)} </a>
					  </li>
					  {/if}
				   </ul>
				   <hr>
				   <div class="card-body tab-content" id="rounded-pills-icon-tabContent">
					  {if $app->getStatus(29) == 1}
					  <div class="tab-pane  fade show configlist" id="rounded-pills-icon-29" role="tabpanel" aria-labelledby="rounded-pills-icon-29-tab">
						 <p>
							{$lang->get('setup')} 
							<button  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white" type="button" style="background-color: {$Config['app_color']};" data-toggle="modal" data-target="#modal_29"><i class="fad fa-bookmark mr-50"></i> {$lang->get('View')} </button>
						 </p>
					  </div>
					  {/if}
					  {if $app->getStatus(30) == 1}
					  <div class="tab-pane  fade show configlist" id="rounded-pills-icon-30" role="tabpanel" aria-labelledby="rounded-pills-icon-30-tab">
						 <p>
							{$lang->get('setup')} 
							<button  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white" type="button" style="background-color: {$Config['app_color']};" data-toggle="modal" data-target="#modal_30"><i class="fad fa-bookmark mr-50"></i> {$lang->get('View')} </button>
						 </p>
					  </div>
					  {/if}
					  {if $app->getStatus(31) == 1}
					  <div class="tab-pane  fade show configlist" id="rounded-pills-icon-31" role="tabpanel" aria-labelledby="rounded-pills-icon-31-tab">
						 <p>
							{$lang->get('setup')} 
							<button  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white" type="button" style="background-color: {$Config['app_color']};" data-toggle="modal" data-target="#modal_31"><i class="fad fa-bookmark mr-50"></i> {$lang->get('View')} </button>
						 </p>
					  </div>
					  {/if}
					  {if $app->getStatus(32) == 1}
					  <div class="tab-pane  fade show configlist" id="rounded-pills-icon-32" role="tabpanel" aria-labelledby="rounded-pills-icon-32-tab">
						 <p>
							{$lang->get('setup')}  
							<button  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white" type="button" style="background-color: {$Config['app_color']};" data-toggle="modal" data-target="#modal_32"><i class="fad fa-bookmark mr-50"></i> {$lang->get('View')} </button>
						 </p>
					  </div>
					  {/if}
				   </div>
				</div>
