VideoJukeGrailsPlugin
=====================

Grails plugin to manage urls and present videos

Issues remain with Firefox. 
Does not autoplay video using firefox so adding the 'autoplay' attribute to the video tag does the trick.

also added to httpd.conf
    AddType video/ogg .ogm
    AddType video/ogg .ogv
    AddType video/ogg .ogg
    AddType video/webm .webm
    AddType audio/webm .weba

    AddType video/mp4 .mp4
    AddType video/x-m4v .m4v
     

What does it take to view video from axis video servers? 