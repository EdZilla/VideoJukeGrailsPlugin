<%@ page import="com.summitbid.videojuke.Media" %>
<!DOCTYPE html>
<html>
	<head>
		  <meta charset="utf-8">
	 	<title>Video Telestrator Jukebox</title>
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
        function change_video(event) {
            var v = $(event.target).text().trim();
            var p = $('#player video:first-of-type')[0];
            var ext = p.currentSrc.slice(p.currentSrc.lastIndexOf('.'),p.currentSrc.length);
            p.src = 'https://chimps-dev.cable.comcast.com/DevVideos/bak/' + v + ext;
        }
        
        $(document).ready(
            function() {
                $('.playlist').bind('click', change_video);
                var v = $('#player video:first-of-type')[0];
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
  Howdy
  </div>
  
   <header>
        <h1>HTML5 Video Telestrator Jukebox_5</h1>
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
            <video controls
                   width="720" height="480">
                 <source src="https://chimps-dev.cable.comcast.com/DevVideos/bak/VID_20120122_133036.webm" type="video/webm">  
                <source src="https://chimps-dev.cable.comcast.com/DevVideos/bak/VID_20120122_133036.mp4" type="video/mp4">
                Your browser does not support the video element, please
                try <a href="https://chimps-dev.cable.comcast.com/DevVideos/bak/VID_20120122_133036.mp4">downloading
                the video instead</a>
            </video>
        </div>
        <nav>
            <h2>Playlist</h2>
            <ul class="playlist">
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