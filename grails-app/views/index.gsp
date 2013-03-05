<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>VideoJukePlugin</title>
		 
	</head>
	<body>
	 
		<div id="page-body" role="main">
			<div id="controller-list" role="navigation">
				<h2>Available Controllers:</h2>
				<ul>
					<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
						<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
					</g:each>
				</ul>
			</div>
		</div>
		<div>
						<g:link controller="Media" action="playVideo_3_IE9" >Play Video 3_IE9</g:link><br>
						<g:link controller="Media" action="playVideo_4" >Play Video 4</g:link><br>
						<g:link controller="Media" action="playVideo_5" >Play Video_5</g:link><br>
						<g:link controller="Media" action="playVideo_6" >Play Video_6</g:link><br>
						<g:link controller="Media" action="playVideo_6" >Play Video_6_events</g:link><br>
						<g:link controller="Media" action="playVideo_7" >Play Video_7</g:link><br>
						<g:link controller="Media" action="playVideo_8" >Play Video_8</g:link><br>
						<g:link controller="Media" action="playVideo_9" >Play Video_9</g:link><br>
						<g:link controller="Media" action="playVideo_10" >Play Video_10</g:link><br>						
		</div>
	</body>
</html>
