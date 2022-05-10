<style>				
.modal-body {
    max-height: calc(70vh - 250px);
    overflow-y: auto;
}
</style>


{if $app->getStatus(1) == 1}
<div class="modal fade" id="modal_1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
   <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
      <div class="modal-content" >
         <div class="modal-header">
            <h5 class="modal-title" >{$app->getTitle(1)}</h5>
         </div>
         <div class="modal-body">
		   {if $lang_cookie == "en"}	
			{$getContentEn_1}
		   {else}
			{$getContentCn_1}
		   {/if}
         </div>
      </div>
   </div> 
</div>
{/if}

{if $app->getStatus(2) == 1}
<div class="modal fade" id="modal_2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
   <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
      <div class="modal-content" >
         <div class="modal-header">
            <h5 class="modal-title" >{$app->getTitle(2)}</h5>
         </div>
         <div class="modal-body">
		   {if $lang_cookie == "en"}	
			{$getContentEn_2}
		   {else}
			{$getContentCn_2}
		   {/if}
         </div>
      </div>
   </div> 
</div>
{/if}

{if $app->getStatus(3) == 1}
<div class="modal fade" id="modal_3" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
   <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
      <div class="modal-content" >
         <div class="modal-header">
            <h5 class="modal-title" >{$app->getTitle(3)} </h5>
         </div>
         <div class="modal-body">
		   {if $lang_cookie == "en"}	
			{$getContentEn_3}
		   {else}
			{$getContentCn_3}
		   {/if}
         </div>
      </div>
   </div> 
</div>
{/if}

{if $app->getStatus(4) == 1}
<div class="modal fade" id="modal_4" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
   <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
      <div class="modal-content" >
         <div class="modal-header">
            <h5 class="modal-title" >{$app->getTitle(4)}</h5>
         </div>
         <div class="modal-body">
		   {if $lang_cookie == "en"}	
			{$getContentEn_4}
		   {else}
			{$getContentCn_4}
		   {/if}
         </div>
      </div>
   </div> 
</div>
{/if}


{if $app->getStatus(5) == 1}
<div class="modal fade" id="modal_5" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
   <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
      <div class="modal-content" >
         <div class="modal-header">
            <h5 class="modal-title" >{$app->getTitle(5)}</h5>
         </div>
         <div class="modal-body">
		   {if $lang_cookie == "en"}	
			{$getContentEn_5}
		   {else}
			{$getContentCn_5}
		   {/if}
         </div>
      </div>
   </div> 
</div>
{/if}


{if $app->getStatus(6) == 1}
<div class="modal fade" id="modal_6" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
   <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
      <div class="modal-content" >
         <div class="modal-header">
            <h5 class="modal-title" >{$app->getTitle(6)}</h5>
         </div>
         <div class="modal-body">
		   {if $lang_cookie == "en"}	
			{$getContentEn_6}
		   {else}
			{$getContentCn_6}
		   {/if}
         </div>
      </div>
   </div> 
</div>
{/if}

{if $app->getStatus(7) == 1}
<div class="modal fade" id="modal_7" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
   <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
      <div class="modal-content" >
         <div class="modal-header">
            <h5 class="modal-title" >{$app->getTitle(7)}</h5>
         </div>
         <div class="modal-body">
		   {if $lang_cookie == "en"}	
			{$getContentEn_7}
		   {else}
			{$getContentCn_7}
		   {/if}
         </div>
      </div>
   </div> 
</div>
{/if}

{if $app->getStatus(8) == 1}
<div class="modal fade" id="modal_8" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
   <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
      <div class="modal-content" >
         <div class="modal-header">
            <h5 class="modal-title" >{$app->getTitle(8)}</h5>
         </div>
         <div class="modal-body">
		   {if $lang_cookie == "en"}	
			{$getContentEn_8}
		   {else}
			{$getContentCn_8}
		   {/if}
         </div>
      </div>
   </div> 
</div>
{/if}

{if $app->getStatus(9) == 1}
<div class="modal fade" id="modal_9" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
   <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
      <div class="modal-content" >
         <div class="modal-header">
            <h5 class="modal-title" >{$app->getTitle(9)}</h5>
         </div>
         <div class="modal-body">
		   {if $lang_cookie == "en"}	
			{$getContentEn_9}
		   {else}
			{$getContentCn_9}
		   {/if}
         </div>
      </div>
   </div> 
</div>
{/if}

{if $app->getStatus(10) == 1}
<div class="modal fade" id="modal_10" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
   <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
      <div class="modal-content" >
         <div class="modal-header">
            <h5 class="modal-title" >{$app->getTitle(10)}</h5>
         </div>
         <div class="modal-body">
		   {if $lang_cookie == "en"}	
			{$getContentEn_10}
		   {else}
			{$getContentCn_10}
		   {/if}
         </div>
      </div>
   </div> 
</div>
{/if}

{if $app->getStatus(11) == 1}
<div class="modal fade" id="modal_11" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
   <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
      <div class="modal-content" >
         <div class="modal-header">
            <h5 class="modal-title" >{$app->getTitle(11)}</h5>
         </div>
         <div class="modal-body">
		   {if $lang_cookie == "en"}	
			{$getContentEn_11}
		   {else}
			{$getContentCn_11}
		   {/if}
         </div>
      </div>
   </div> 
</div>
{/if}

{if $app->getStatus(12) == 1}
<div class="modal fade" id="modal_12" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
   <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
      <div class="modal-content" >
         <div class="modal-header">
            <h5 class="modal-title" >{$app->getTitle(12)}</h5>
         </div>
         <div class="modal-body">
		   {if $lang_cookie == "en"}	
			{$getContentEn_12}
		   {else}
			{$getContentCn_12}
		   {/if}
         </div>
      </div>
   </div> 
</div>
{/if}

{if $app->getStatus(13) == 1}
<div class="modal fade" id="modal_13" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
   <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
      <div class="modal-content" >
         <div class="modal-header">
            <h5 class="modal-title" >{$app->getTitle(13)}</h5>
         </div>
         <div class="modal-body">
		   {if $lang_cookie == "en"}	
			{$getContentEn_13}
		   {else}
			{$getContentCn_13}
		   {/if}
         </div>
      </div>
   </div> 
</div>
{/if}

{if $app->getStatus(14) == 1}
<div class="modal fade" id="modal_14" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
   <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
      <div class="modal-content" >
         <div class="modal-header">
            <h5 class="modal-title" >{$app->getTitle(14)}</h5>
         </div>
         <div class="modal-body">
		   {if $lang_cookie == "en"}	
			{$getContentEn_14}
		   {else}
			{$getContentCn_14}
		   {/if}
         </div>
      </div>
   </div> 
</div>
{/if}

{if $app->getStatus(15) == 1}
<div class="modal fade" id="modal_15" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
   <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
      <div class="modal-content" >
         <div class="modal-header">
            <h5 class="modal-title" >{$app->getTitle(15)}</h5>
         </div>
         <div class="modal-body">
		   {if $lang_cookie == "en"}	
			{$getContentEn_15}
		   {else}
			{$getContentCn_15}
		   {/if}
         </div>
      </div>
   </div> 
</div>
{/if}

{if $app->getStatus(16) == 1}
<div class="modal fade" id="modal_16" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
   <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
      <div class="modal-content" >
         <div class="modal-header">
            <h5 class="modal-title" >{$app->getTitle(16)}</h5>
         </div>
         <div class="modal-body">
		   {if $lang_cookie == "en"}	
			{$getContentEn_16}
		   {else}
			{$getContentCn_16}
		   {/if}
         </div>
      </div>
   </div> 
</div>
{/if}

{if $app->getStatus(17) == 1}
<div class="modal fade" id="modal_17" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
   <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
      <div class="modal-content" >
         <div class="modal-header">
            <h5 class="modal-title" >{$app->getTitle(17)}</h5>
         </div>
         <div class="modal-body">
		   {if $lang_cookie == "en"}	
			{$getContentEn_17}
		   {else}
			{$getContentCn_17}
		   {/if}
         </div>
      </div>
   </div> 
</div>
{/if}

{if $app->getStatus(18) == 1}
<div class="modal fade" id="modal_18" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
   <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
      <div class="modal-content" >
         <div class="modal-header">
            <h5 class="modal-title" >{$app->getTitle(18)}</h5>
         </div>
         <div class="modal-body">
		   {if $lang_cookie == "en"}	
			{$getContentEn_18}
		   {else}
			{$getContentCn_18}
		   {/if}
         </div>
      </div>
   </div> 
</div>
{/if}

{if $app->getStatus(19) == 1}
<div class="modal fade" id="modal_19" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
   <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
      <div class="modal-content" >
         <div class="modal-header">
            <h5 class="modal-title" >{$app->getTitle(19)}</h5>
         </div>
         <div class="modal-body">
		   {if $lang_cookie == "en"}	
			{$getContentEn_19}
		   {else}
			{$getContentCn_19}
		   {/if}
         </div>
      </div>
   </div> 
</div>
{/if}

{if $app->getStatus(20) == 1}
<div class="modal fade" id="modal_20" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
   <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
      <div class="modal-content" >
         <div class="modal-header">
            <h5 class="modal-title" >{$app->getTitle(20)} </h5>
         </div>
         <div class="modal-body">
		   {if $lang_cookie == "en"}	
			{$getContentEn_20}
		   {else}
			{$getContentCn_20}
		   {/if}
         </div>
      </div>
   </div> 
</div>
{/if}

{if $app->getStatus(21) == 1}
<div class="modal fade" id="modal_21" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
   <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
      <div class="modal-content" >
         <div class="modal-header">
            <h5 class="modal-title" >{$app->getTitle(21)}</h5>
         </div>
         <div class="modal-body">
		   {if $lang_cookie == "en"}	
			{$getContentEn_21}
		   {else}
			{$getContentCn_21}
		   {/if}
         </div>
      </div>
   </div> 
</div>
{/if}

{if $app->getStatus(22) == 1}
<div class="modal fade" id="modal_22" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
   <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
      <div class="modal-content" >
         <div class="modal-header">
            <h5 class="modal-title" >{$app->getTitle(22)}</h5>
         </div>
         <div class="modal-body">
		   {if $lang_cookie == "en"}	
			{$getContentEn_22}
		   {else}
			{$getContentCn_22}
		   {/if}
         </div>
      </div>
   </div> 
</div>
{/if}

{if $app->getStatus(23) == 1}
<div class="modal fade" id="modal_23" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
   <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
      <div class="modal-content" >
         <div class="modal-header">
            <h5 class="modal-title" >{$app->getTitle(23)}</h5>
         </div>
         <div class="modal-body">
		   {if $lang_cookie == "en"}	
			{$getContentEn_23}
		   {else}
			{$getContentCn_23}
		   {/if}
         </div>
      </div>
   </div> 
</div>
{/if}

{if $app->getStatus(24) == 1}
<div class="modal fade" id="modal_24" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
   <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
      <div class="modal-content" >
         <div class="modal-header">
            <h5 class="modal-title" >{$app->getTitle(24)}</h5>
         </div>
         <div class="modal-body">
		   {if $lang_cookie == "en"}	
			{$getContentEn_24}
		   {else}
			{$getContentCn_24}
		   {/if}
         </div>
      </div>
   </div> 
</div>
{/if}

{if $app->getStatus(25) == 1}
<div class="modal fade" id="modal_25" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
   <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
      <div class="modal-content" >
         <div class="modal-header">
            <h5 class="modal-title" >{$app->getTitle(25)}</h5>
         </div>
         <div class="modal-body">
		   {if $lang_cookie == "en"}	
			{$getContentEn_25}
		   {else}
			{$getContentCn_25}
		   {/if}
         </div>
      </div>
   </div> 
</div>
{/if}

{if $app->getStatus(26) == 1}
<div class="modal fade" id="modal_26" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
   <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
      <div class="modal-content" >
         <div class="modal-header">
            <h5 class="modal-title" >{$app->getTitle(26)}</h5>
         </div>
         <div class="modal-body">
		   {if $lang_cookie == "en"}	
			{$getContentEn_26}
		   {else}
			{$getContentCn_26}
		   {/if}
         </div>
      </div>
   </div> 
</div>
{/if}

{if $app->getStatus(27) == 1}
<div class="modal fade" id="modal_27" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
   <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
      <div class="modal-content" >
         <div class="modal-header">
            <h5 class="modal-title" >{$app->getTitle(27)}</h5>
         </div>
         <div class="modal-body">
		   {if $lang_cookie == "en"}	
			{$getContentEn_27}
		   {else}
			{$getContentCn_27}
		   {/if}
         </div>
      </div>
   </div> 
</div>
{/if}

{if $app->getStatus(28) == 1}
<div class="modal fade" id="modal_28" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
   <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
      <div class="modal-content" >
         <div class="modal-header">
            <h5 class="modal-title" >{$app->getTitle(28)}</h5>
         </div>
         <div class="modal-body">
		   {if $lang_cookie == "en"}	
			{$getContentEn_28}
		   {else}
			{$getContentCn_28}
		   {/if}
         </div>
      </div>
   </div> 
</div>
{/if}

{if $app->getStatus(29) == 1}
<div class="modal fade" id="modal_29" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
   <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
      <div class="modal-content" >
         <div class="modal-header">
            <h5 class="modal-title" >{$app->getTitle(29)}</h5>
         </div>
         <div class="modal-body">
		   {if $lang_cookie == "en"}	
			{$getContentEn_29}
		   {else}
			{$getContentCn_29}
		   {/if}
         </div>
      </div>
   </div> 
</div>
{/if}

{if $app->getStatus(30) == 1}
<div class="modal fade" id="modal_30" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
   <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
      <div class="modal-content" >
         <div class="modal-header">
            <h5 class="modal-title" >{$app->getTitle(30)}</h5>
         </div>
         <div class="modal-body">
		   {if $lang_cookie == "en"}	
			{$getContentEn_30}
		   {else}
			{$getContentCn_30}
		   {/if}
         </div>
      </div>
   </div> 
</div>
{/if}

{if $app->getStatus(31) == 1}
<div class="modal fade" id="modal_31" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
   <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
      <div class="modal-content" >
         <div class="modal-header">
            <h5 class="modal-title" >{$app->getTitle(31)}</h5>
         </div>
         <div class="modal-body">
		   {if $lang_cookie == "en"}	
			{$getContentEn_31}
		   {else}
			{$getContentCn_31}
		   {/if}
         </div>
      </div>
   </div> 
</div>
{/if}

{if $app->getStatus(32) == 1}
<div class="modal fade" id="modal_32" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
   <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
      <div class="modal-content" >
         <div class="modal-header">
            <h5 class="modal-title" >{$app->getTitle(32)}</h5>
         </div>
         <div class="modal-body">
		   {if $lang_cookie == "en"}	
			{$getContentEn_32}
		   {else}
			{$getContentCn_32}
		   {/if}
         </div>
      </div>
   </div> 
</div>
{/if}