<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
<!-- BEGIN: Head-->

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta name="description" content="{$Config['appName']}">
    <meta name="keywords" content="{$Config['appName']}">
    <meta name="author" content="{$Config['appName']}">
    <title>{$Config['appName']}</title>
    <link rel="apple-touch-icon" href="{$Config['logo_path']}">
    <link rel="shortcut icon" type="image/x-icon" href="{$Config['logo_path']}">
    <link href="/assets/default/css/montserrat.css?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;1,400;1,500;1,600" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="/assets/default/css/vendors.css">
    <link rel="stylesheet" type="text/css" href="/assets/default/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/assets/default/css/bootstrap-extended.css">
    <link rel="stylesheet" type="text/css" href="/assets/default/css/colors.css">
    <link rel="stylesheet" type="text/css" href="/assets/default/css/page-misc.css">


</head>
<body class="vertical-layout vertical-menu-modern blank-page navbar-floating footer-static  " data-open="click" data-menu="vertical-menu-modern" data-col="blank-page">
    <!-- BEGIN: Content-->
    <div class="app-content content ">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper">
            <div class="content-header row">
            </div>
            <div class="content-body">
                <div class="row match-height">
                    <div class="col-12 col-md-12 col-lg-12 mb-5">
                        <div class="card mb-5" >
                            <div class="card-body mb-5">
                                <div ></br></br>
									{$tos}						
                                </div>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
    </div>
    <script src="/assets/default/js/core/vendors.js"></script>
    <script src="/assets/default/js/core/app-menu.js"></script>
    <script src="/assets/default/js/core/vendorapp.js"></script>

    <script>
        $(window).on('load', function() {
            if (feather) {
                feather.replace({
                    width: 14,
                    height: 14
                });
            }
        })
    </script>
	{if $Config['enable_google_analytics'] ==1}	
	<script>
		  (function(i,s,o,g,r,a,m){
		  i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		  (i[r].q=i[r].q||[]).push(arguments)
		  },i[r].l=1*new Date();a=s.createElement(o),
		  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');		
		  ga('create', '{$Config['google_tracking_id']}', 'auto');
		  ga('send', 'pageview');
		
	</script>	
	{/if}	
</body>
<!-- END: Body-->

</html>