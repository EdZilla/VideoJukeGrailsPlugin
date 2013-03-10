package com.summitbid.videojuke

import org.springframework.dao.DataIntegrityViolationException

class MediaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
		log.trace("Executing action $actionName with params $params")
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
		log.trace("Executing action $actionName with params $params")
        params.max = Math.min(max ?: 10, 100)
		log.debug("${Media.count()}, ${Media.list()}, params: $params")
        [mediaInstanceList: Media.list(params), mediaInstanceTotal: Media.count()]
    }

    def create() {
		log.trace("Executing action $actionName with params $params")
        [mediaInstance: new Media(params)]
    }

    def save() {
		log.trace("Executing action $actionName with params $params")
        def mediaInstance = new Media(params)
        if (!mediaInstance.save(flush: true)) {
            render(view: "create", model: [mediaInstance: mediaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'media.label', default: 'Media'), mediaInstance.id])
        redirect(action: "show", id: mediaInstance.id)
    }

    def show(Long id) {
		log.trace("Executing action $actionName with params $params")
        def mediaInstance = Media.get(id)
        if (!mediaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'media.label', default: 'Media'), id])
            redirect(action: "list")
            return
        }

        [mediaInstance: mediaInstance]
    }

    def edit(Long id) {
		log.trace("Executing action $actionName with params $params")
        def mediaInstance = Media.get(id)
        if (!mediaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'media.label', default: 'Media'), id])
            redirect(action: "list")
            return
        }

        [mediaInstance: mediaInstance]
    }

    def update(Long id, Long version) {
		log.trace("Executing action $actionName with params $params")
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
		log.trace("Executing action $actionName with params $params")
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
		log.debug("${Media.count()}, ${Media.list()}, params: $params")
		[mediaInstanceList: Media.list(params), mediaInstanceTotal: Media.count()]
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
