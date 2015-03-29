package org.code4good


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TwilloMessageController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TwilloMessage.list(params), model: [twilloMessageInstanceCount: TwilloMessage.count()]
    }

    def show(TwilloMessage twilloMessageInstance) {
        respond twilloMessageInstance
    }

    def create() {
        respond new TwilloMessage(params)
    }

    @Transactional
    def save(TwilloMessage twilloMessageInstance) {
        if (twilloMessageInstance == null) {
            notFound()
            return
        }

        if (twilloMessageInstance.hasErrors()) {
            respond twilloMessageInstance.errors, view: 'create'
            return
        }

        twilloMessageInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'twilloMessage.label', default: 'TwilloMessage'), twilloMessageInstance.id])
                redirect twilloMessageInstance
            }
            '*' { respond twilloMessageInstance, [status: CREATED] }
        }
    }

    def edit(TwilloMessage twilloMessageInstance) {
        respond twilloMessageInstance
    }

    @Transactional
    def update(TwilloMessage twilloMessageInstance) {
        if (twilloMessageInstance == null) {
            notFound()
            return
        }

        if (twilloMessageInstance.hasErrors()) {
            respond twilloMessageInstance.errors, view: 'edit'
            return
        }

        twilloMessageInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TwilloMessage.label', default: 'TwilloMessage'), twilloMessageInstance.id])
                redirect twilloMessageInstance
            }
            '*' { respond twilloMessageInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TwilloMessage twilloMessageInstance) {

        if (twilloMessageInstance == null) {
            notFound()
            return
        }

        twilloMessageInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TwilloMessage.label', default: 'TwilloMessage'), twilloMessageInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'twilloMessage.label', default: 'TwilloMessage'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
