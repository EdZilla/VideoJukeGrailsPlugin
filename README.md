VideoJukeGrailsPlugin
=====================

Grails plugin to manage urls and present videos

Issues remain with Firefox. Does not play video using firefox. 
The original index-5.html works in firefox 
and works with the new experimental video VID_mp4Experiment-web-low.webm (firefox does not support mp4)

It seems that the src element does not support an url
            p.src = 'http://localhost/DevVid/' + v + ext;
was originally
            p.src = 'videos/' + v + ext;            
but fails with the url

Need to find out how to replace it with a url