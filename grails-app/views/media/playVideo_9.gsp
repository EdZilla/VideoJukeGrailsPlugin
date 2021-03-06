<%@ page import="com.summitbid.videojuke.Media" %>
<!DOCTYPE html>
<html>
	<head>
		  <meta charset="utf-8">
	 	<title>Video Jukebox 9 </title>
    	<g:javascript library="jquery-1.8.2.min" />
    	<g:javascript library="raf-polyfill" />
    
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'media.label', default: 'Media')}" />
		<title>Play Video-9</title>
		
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
        #player canvas {
            display: block;
        }
        #player menu, #player label {
            display: inline-block;
            padding: 0;
        }
        #player video:first-of-type, #player img:first-of-type {
            display: none;
        }
        input[type=number] {
            width: 36px;
        }
    </style>
    <script>
        function change_video(event) {
            var v = $(event.target).text().trim();
            var p = $('#player video:first-of-type')[0];
            var ext = p.currentSrc.slice(p.currentSrc.lastIndexOf('.'),p.currentSrc.length);
            p.src = 'http://localhost/DevVid/' + v + ext;
        }
        $(document).ready(
            function() {
                var c_mode = 'source-over';
                var c_opac = 1;
                var clickX = new Array();
                var clickY = new Array();
                var clickDrag = new Array();
                var paint = false;                
                function addClick(x, y, dragging) {
                    clickX.push(x);
                    clickY.push(y);
                    clickDrag.push(dragging);
                }
                $('.playlist').bind('click', change_video);
                var v = $('#player video:first-of-type')[0];
                var canvas = $('#player canvas:first-of-type');
                var pos = canvas.position();
                canvas.bind('mousedown', function(event) {
                    var mouseX = event.pageX - pos.left;
                    var mouseY = event.pageY - pos.top;
                    paint = true;
                    addClick(mouseX, mouseY);
                }).bind('mousemove', function(event) {
                    if(paint){
                        var mouseX = event.pageX - pos.left;
                        var mouseY = event.pageY - pos.top;
                        addClick(mouseX, mouseY, true);
                    }
                }).bind('mouseup', function(event) {
                    paint = false;
                }).bind('mouseleave', function(event) {
                    paint = false;
                });
                var context = canvas[0].getContext('2d');
                function draw() {
                    if(v.paused || v.ended) return false;
                    context.clearRect(0,0,720,480);
                    context.globalCompositeOperation = c_mode;
                    context.globalAlpha = c_opac;
                    context.drawImage(v,0,0,720,480);
                    context.strokeStyle = "#ffff00";
                    context.lineJoin = "round";
                    context.lineWidth = 8;
                    for(var i=0; i < clickX.length; i++) {		
                        context.beginPath();
                        if(clickDrag[i] && i){
                            context.moveTo(clickX[i-1], clickY[i-1]);
                        } else {
                            context.moveTo(clickX[i]-1, clickY[i]);
                        }
                        context.lineTo(clickX[i], clickY[i]);
                        context.closePath();
                        context.stroke();
                    }
                    requestAnimationFrame(draw, canvas[0]);
                    return true;
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
                        case 'Clear':
                            clickX = new Array();
                            clickY = new Array();
                            clickDrag = new Array();
                            paint = false; 
                    }
                    return false;
                })
                $('select').bind('change', function(event) {
                    c_mode = event.target.value;
                })
                $('input[type=number]').bind('input', function(event) {
                    c_opac = event.target.value;
                })
            }
        )
    </script>
    
	</head>
<body>
  <div class="body">
  HTML5 Video Juke 9
  </div>
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
    <header>
        <h1>HTML5 Video Telestrator Jukebox_9</h1>
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
                <button>Clear</button>
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
                <source src="http://localhost/DevVid/VID_mp4Experiment-web-low.mp4" type="video/mp4">
                <source src="http://localhost/DevVid/VID_mp4Experiment-web-low.webm" type="video/webm">
                Your browser does not support the video element, please
                try <a href="http://localhost/DevVid/VID_mp4Experiment-web-low.mp4">downloading
                the video instead</a>
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