<%@ page import="com.summitbid.videojuke.Media" %>
<!DOCTYPE html>
<html>
	<head>
		  <meta charset="utf-8">
	 	<title>Video Jukebox 5</title>
    	<g:javascript library="jquery-1.8.2.min" />
    	<g:javascript library="raf-polyfill" />
    
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'media.label', default: 'Media')}" />
		<title>Play Video-5</title>
				
	 <style>
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
        #player video:first-of-type {
            display: none;
        }
    </style>
    
    <script>
    	// get the clicked on event and construct the source element
        function change_video(event) {
            // Trim off any whitespace characters. 
            var v = $(event.target).text().trim();
            // grab the first src of the video element
            var p = $('#player video:first-of-type')[0];
            // get the extension
            var ext = p.currentSrc.slice(p.currentSrc.lastIndexOf('.'),p.currentSrc.length);            
            console.log("event.target : ", $(event.target).text()); 
            console.log("v : ", v);
	    	console.log("p : ", p);
	    	console.log("ext : ", ext);
	    	console.log("p.src : ", p.src);
	    	p.src = 'http://localhost/DevVid/' + v + ext;
        }

    	function getVid(url) {
        	console.log("url: ", url)
        }
        
    	
    	// log events
        function log_state(event) {
            console.log(event.type);
            console.log('networkState: ' + event.target.networkState);
            console.log('readyState: ' + event.target.readyState);
        }
        
        $(document).ready(
            function() {
                $('.playlist').bind('click', change_video);
                var v = $('#player video:first-of-type')[0];

                v.addEventListener('loadedmetadata', log_state);
                v.addEventListener('loadeddata', log_state);
                v.addEventListener('canplay', log_state);
                v.addEventListener('canplaythrough', log_state);
                v.addEventListener('canplaythrough', play_video);
                
                var canvas = $('#player canvas:first-of-type')[0];
                var context = canvas.getContext('2d');
                function draw() {
                    if(v.paused || v.ended) return false;
                    context.drawImage(v,0,0,720,480);
                    requestAnimationFrame(draw, canvas);
                }
                function play_video(event) {
                    event.target.play();
                }

                                                 
                
                v.addEventListener('canplaythrough', play_video);
                v.addEventListener('play', draw);
                $('menu').bind('click', function(event) {
                    var action = $(event.target).text().trim();
                    switch (action) {
                        case '|<':
                            v.currentTime = 0;
                            break;
                        case '<<':
                            v.playbackRate = v.playbackRate * 0.5;
                            break;
                        case '||':
                            v.pause();
                            break;
                        case '>':
                            v.playbackRate = 1.0;
                            v.play();
                            break;
                        case '>>':
                            v.playbackRate = v.playbackRate * 2.0
                            break;
                    }
                    return false;
                })
            }
        )
    </script>
    
	</head>
<body>
  <div class="body">
  HTML5 Video Juke 5
  
  </div>
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
   <header>
        <h1>HTML5 Video Telestrator Juke_5</h1>
        
    </header>
      <section id="player">
        <div>
            <canvas width="720" height="480"></canvas>
            <menu>
                <button>|&lt;</button>
                <button>&lt;&lt;</button>
                <button>||</button>
                <button> &gt; </button>
                <button>&gt;&gt;</button>
            </menu>
            <video controls autoplay
                   width="720" height="480">
                <source src="http://localhost/DevVid/VID_mp4Experiment-web-low.mp4" type="video/mp4">
                <source src="http://localhost/DevVid/VID_mp4Experiment-web-low.webm" type="video/webm">
                Your browser does not support the video element, please
                try <a href="http://localhost/DevVid/VID_mp4Experiment-web-low.mp4">downloading
                the video instead</a>
            </video>
        </div>
        
        <nav>
            <h2>Playlist</h2>
            <ul class="playlist">
            	<g:each in="${mediaInstanceList}" status="i" var="mediaInstance">
         								<li>${mediaInstance.url.split('/')[-1].replaceAll("\\.mp4", '').replaceAll("\\.webm",'')}</li>
				</g:each>
                <li>VID_20120122_133036</li>
                <li>VID_20120122_132933</li>
                <li>VID_20120122_132348</li>
                <li>VID_20120122_132307</li>
                <li>VID_20120122_132223</li>
                <li>VID_20120122_132134</li>
            </ul>
        </nav>
    </section>
</body>
</html>