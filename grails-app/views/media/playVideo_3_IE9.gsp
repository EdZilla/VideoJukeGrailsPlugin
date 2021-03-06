<%@ page import="com.summitbid.videojuke.Media" %>
<!DOCTYPE html>
<html>
	<head>
		  <meta charset="utf-8">
	 	<title>Video Jukebox 4</title>
    	<g:javascript library="jquery-1.8.2.min" />
    	<g:javascript library="raf-polyfill" />
    
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'media.label', default: 'Media')}" />
		<title>Play Video 4</title>

    <style>
        div, section, nav, header {
        /*    outline: 1px dashed black;*/
        }
        body {
            font-family:  sans-serif;
            border: 0;
            margin: 0;
            padding: 0;
        }
        header {
            text-align: center;
        }
        #player {
            display: table;
            width: 100%;
            padding: 4px;
        }
        #player > div, #player > nav {
            display: table-cell;
            vertical-align: top;
        }
    </style>
    <script>
        function change_video(event) {
            var v = $(event.target).text().trim();
            var vp = $('#player video:first-of-type');
	    var p = vp[0];
            var ext = p.currentSrc.slice(p.currentSrc.lastIndexOf('.'),p.currentSrc.length);
            var nv = $('<video controls src="videos/' + v + ext + '" ' +
                   'width="720" height="480">' +
		'Your browser does not support the video element, please ' +
                'try <a href="videos/' + v + ext+ '">downloading ' +
                'the video instead</a></video>');
	    vp.parent().append(nv);
	    vp.remove();
            nv[0].play();
        }
        $(document).ready(
            function() {
                $('.playlist').bind('click', change_video);
            }
        )
    </script>

	</head>
<body>
  <div class="body">
  HTML5 Video Juke 4
  </div>
  
   <header>
        <h1>HTML5 Video Telestrator Jukebox</h1>
    </header>
    <section id="player">
        <div>
            <canvas width="720" height="480"></canvas>
            <video controls
                   width="720" height="480">
                 <source src="http://localhost/DevVid/VID_mp4Experiment-web-low.webm" type="video/webm">  
                <source src="http://localhost/DevVid/VID_mp4Experiment-web-low.mp4" type="video/mp4">
                Your browser does not support the video element, please
                try <a href="http://localhost/DevVid/VID_mp4Experiment-web-low.mp4">download the video </a> instead
            </video>
        </div>
        <nav>
            <h2>Playlist</h2>
            <ul class="playlist">
            	<li>VID_mp4Experiment-web-low</li>
                <li>VID_20120122_133036</li>
                <li>VID_20120122_132933</li>
                <li>VID_20120122_132348</li>
                <li>VID_20120122_132307</li>
                <li>VID_20120122_132223</li>
                <li>VID_20120122_132134                
            </ul>
        </nav>
    </section>
  
</body>
</html>