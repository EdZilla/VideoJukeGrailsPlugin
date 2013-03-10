package com.summitbid.videojuke

class Media {
	String filename
	String url
	
    static constraints = {
    }
	
	String toString() {
		return this.url;
	}
}
