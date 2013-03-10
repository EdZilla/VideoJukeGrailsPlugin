package com.summitbid.videojuke

import org.springframework.dao.DataIntegrityViolationException

class MediaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
		log.trace "index enter"
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
		log.trace "list enter"
        params.max = Math.min(max ?: 10, 100)
        [mediaInstanceList: Media.list(params), mediaInstanceTotal: Media.count()]
    }

    def create() {
		log.trace "create enter"
        [mediaInstance: new Media(params)]
    }

    def save() {
		log.trace "save enter"
        def mediaInstance = new Media(params)
        if (!mediaInstance.save(flush: true)) {
            render(view: "create", model: [mediaInstance: mediaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'media.label', default: 'Media'), mediaInstance.id])
        redirect(action: "show", id: mediaInstance.id)
    }

    def show(Long id) {
		log.trace "show enter"
        def mediaInstance = Media.get(id)
        if (!mediaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'media.label', default: 'Media'), id])
            redirect(action: "list")
            return
        }

        [mediaInstance: mediaInstance]
    }

    def edit(Long id) {
		log.trace "edit enter"
        def mediaInstance = Media.get(id)
        if (!mediaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'media.label', default: 'Media'), id])
            redirect(action: "list")
            return
        }

        [mediaInstance: mediaInstance]
    }

    def update(Long id, Long version) {
		log.trace "update enter"
        def mediaInstance = Media.get(id)
        if (!mediaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'media.label', default: 'Media'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (mediaInstance.version > version) {
                mediaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'media.label', default: 'Media')] as Object[],
                          "Another user has updated this Media while you were editing")
                render(view: "edit", model: [mediaInstance: mediaInstance])
                return
            }
        }

        mediaInstance.properties = params

        if (!mediaInstance.save(flush: true)) {
            render(view: "edit", model: [mediaInstance: mediaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'media.label', default: 'Media'), mediaInstance.id])
        redirect(action: "show", id: mediaInstance.id)
    }

    def delete(Long id) {
		log.trace "delete enter"
        def mediaInstance = Media.get(id)
        if (!mediaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'media.label', default: 'Media'), id])
            redirect(action: "list")
            return
        }

        try {
            mediaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'media.label', default: 'Media'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'media.label', default: 'Media'), id])
            redirect(action: "show", id: id)
        }
    }
	
	
	def playVideo_3_IE9 = {
		log.trace" playVideo_3_IE9 enter"
	}
	
	def playVideo_4 = {
		log.trace" playVideo_4 enter"
	}
	
	def playVideo_5 = {
		log.trace" playVideo_5 enter"
	}
	
	def playVideo_6 = {
		log.trace" playVideo_6 enter"
	}
	
	def playVideo_6_events = {
		log.trace" playVideo_6_events enter"
	}
	
	def playVideo_7 = {
		log.trace" playVideo_7 enter"
	}
	
	def playVideo_8 = {
		log.trace" playVideo_8 enter"
	}
	
	def playVideo_9 = {
		log.trace" playVideo_9 enter"
	}
	
	def playVideo_10 = {
		log.trace" playVideo_10 enter"
	}
}
