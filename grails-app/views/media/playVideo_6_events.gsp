<%@ page import="com.summitbid.videojuke.Media" %>
<!DOCTYPE html>
<html>
	<head>
		  <meta charset="utf-8">
	 	<title>Video Jukebox 6-events</title>
    	<g:javascript library="jquery-1.8.2.min" />
    	<g:javascript library="raf-polyfill" />
    
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'media.label', default: 'Media')}" />
		<title>Play Video-6 Events</title>
		
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
        #player video:first-of-type, #player img:first-of-type {
            display: none;
        }
    </style>
    <script>
        function change_video(event) {
            var v = $(event.target).text().trim();
            var p = $('#player video:first-of-type')[0];
            var ext = p.currentSrc.slice(p.currentSrc.lastIndexOf('.'),p.currentSrc.length);
            p.src = 'videos/' + v + ext;
        }
        function play_video(event) {
            event.target.play();
        }
        function log_state(event) {
            console.log(event.target.networkState);
            console.log(event.target.readyState);
        }
        $(document).ready(
            function() {
                $('.playlist').bind('click', change_video);
                var v = $('#player video:first-of-type')[0];
                var frame = $('#player img:first-of-type')[0];
                var canvas = $('#player canvas:first-of-type')[0];
                var context = canvas.getContext('2d');
                function draw() {
                    if(v.paused || v.ended) return false;
                    context.drawImage(v,0,0,720,480);
                    context.drawImage(frame,0,0,720,480);
                    requestAnimationFrame(draw, canvas);
                }
                v.addEventListener('play', function(){
                    draw();
                },false);
                v.addEventListener('loadedmetadata', log_state);
                v.addEventListener('loadeddata', log_state);
                v.addEventListener('canplay', log_state);
                v.addEventListener('canplaythrough', log_state);
                v.addEventListener('canplaythrough', play_video);
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
  HTML5 Video Juke 6
  </div>
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
   <header>
        <h1>HTML5 Video Telestrator Jukebox_6</h1>
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
                <button>Framed</button>
                <button>Gray</button>
            </menu>
            <label>
                Composition:
                <select>
                    <option>copy</option>
                    <option>destination-atop</option>
                    <option>destination-in</option>
                    <option>destination-out</option>
                    <option>destination-over</option>
                    <option>source-atop</option>
                    <option>source-in</option>
                    <option>source-out</option>
                    <option selected>source-over</option>
                    <option>lighter</option>
                    <option>xor</option>
                </select>
            </label>
            <label>
                Opacity:
                <input type="number" step="0.1" min="0" max="1" value="1.0">
            </label>
            <video controls
                   width="720" height="480">
                 <source src="http://localhost/DevVid/VID_mp4Experiment-web-low.webm" type="video/webm">  
                <source src="http://localhost/DevVid/VID_mp4Experiment-web-low.mp4" type="video/mp4">
                Your browser does not support the video element, please
                try <a href="http://localhost/DevVid/VID_mp4Experiment-web-low.mp4">download the video</a>instead
            </video>
            <img src="images/frame.svg">
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
                <li>VID_20120122_132134</li>
            </ul>
        </nav>
    </section>
  
</body>
</html>