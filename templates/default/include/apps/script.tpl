<script>
	window.addEventListener('load', () => {
		if(document.getElementById("clash-android")){
			document.getElementById("clash-android").innerHTML = '<a  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  href="clash://install-config?url={urlencode($subInfo['clash'])}"><i class="fas fa-paper-plane"></i> {$lang->get('ToApp')}</a>';
		}
		if(document.getElementById("clash-android-cn")){
			document.getElementById("clash-android-cn").innerHTML = '<a  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  href="clash://install-config?url={urlencode($subInfo['clash'])}"><i class="fas fa-paper-plane"></i> {$lang->get('ToApp')}</a>';
		}		
		if(document.getElementById("anxray-android")){
			document.getElementById("anxray-android").innerHTML = '<a class="copy-text btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  data-clipboard-text="{$subInfo['anxray']}"><i class="fas fa-paper-plane"></i> {$lang->get('CopyLink')}</a>';
		}
		if(document.getElementById("v2rayng-android")){
			document.getElementById("v2rayng-android").innerHTML = '<a class="copy-text btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  data-clipboard-text="{$subInfo['config']}"><i class="fas fa-paper-plane"></i> {$lang->get('CopyLink')}</a>';
		}
		if(document.getElementById("clash-windows")){
			document.getElementById("clash-windows").innerHTML = '<a  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  href="clash://install-config?url={urlencode($subInfo['clash'])}"><i class="fas fa-paper-plane"></i> {$lang->get('ToApp')}</a>';
		}
		if(document.getElementById("v2rayn-windows")){
			document.getElementById("v2rayn-windows").innerHTML = '<a class="copy-text btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  data-clipboard-text="{$subInfo['config']}"><i class="fas fa-paper-plane"></i> {$lang->get('CopyLink')}</a>';
		}
		if(document.getElementById("shadowrocket-ios")){
			document.getElementById("shadowrocket-ios").innerHTML = '<a class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  onclick=AddSub("{$subInfo['shadowrocket']}","shadowrocket://add/sub://")><i class="fas fa-paper-plane"></i> {$lang->get('ToApp')}</a>';
		}	
		if(document.getElementById("quantumultx-ios")){
			document.getElementById("quantumultx-ios").innerHTML = '<a class="copy-text btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  data-clipboard-text="{$subInfo['quantumultx']}"><i class="fas fa-paper-plane"></i> {$lang->get('CopyLink')}</a>';
		}
		if(document.getElementById("clash-mac-ox")){
			document.getElementById("clash-mac-ox").innerHTML = '<a  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  href="clash://install-config?url={urlencode($subInfo['clash'])}"><i class="fas fa-paper-plane"></i> {$lang->get('ToApp')}</a>';
		}
		if(document.getElementById("clash-mac")){
			document.getElementById("clash-mac").innerHTML = '<a  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  href="clash://install-config?url={urlencode($subInfo['clash'])}"><i class="fas fa-paper-plane"></i> {$lang->get('ToApp')}</a>';
		}
		if(document.getElementById("qv2ray-linux")){
			document.getElementById("qv2ray-linux").innerHTML = '<a class="copy-text btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  data-clipboard-text="{$subInfo['config']}"><i class="fas fa-paper-plane"></i> {$lang->get('CopyLink')}</a>';
		}
		if(document.getElementById("clash-linux")){
			document.getElementById("clash-linux").innerHTML = '<a class="copy-text btn-dl btn btn-sm btn-flat-primary" style="background-color:{$Config['app_color']};color:white"  href="clash://install-config?url={urlencode($subInfo['clash'])}"><i class="fas fa-paper-plane"></i> {$lang->get('ToApp')}</a>';
		}		
	})
</script>