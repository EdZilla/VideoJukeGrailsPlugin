<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to the VideoJukePlugin</title>
		 
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
						<g:link controller="Media" action="playVideo" >Play Video</g:link><br>
						<g:link controller="digCont" action="dacTopology" >DAC Topology</g:link><br>
						<g:link controller="digCont" action="dacSystem" >DAC System Info</g:link><br>
		</div>
	</body>
</html>
