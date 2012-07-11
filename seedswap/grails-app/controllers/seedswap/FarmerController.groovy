package seedswap

import org.springframework.dao.DataIntegrityViolationException

class FarmerController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [farmerInstanceList: Farmer.list(params), farmerInstanceTotal: Farmer.count()]
    }

    def create() {
        [farmerInstance: new Farmer(params)]
    }

    def save() {
        def farmerInstance = new Farmer(params)
        if (!farmerInstance.save(flush: true)) {
            render(view: "create", model: [farmerInstance: farmerInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'farmer.label', default: 'Farmer'), farmerInstance.id])
        redirect(action: "show", id: farmerInstance.id)
    }

    def show(Long id) {
        def farmerInstance = Farmer.get(id)
        if (!farmerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'farmer.label', default: 'Farmer'), id])
            redirect(action: "list")
            return
        }

        [farmerInstance: farmerInstance]
    }

    def edit(Long id) {
        def farmerInstance = Farmer.get(id)
        if (!farmerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'farmer.label', default: 'Farmer'), id])
            redirect(action: "list")
            return
        }

        [farmerInstance: farmerInstance]
    }

    def update(Long id, Long version) {
        def farmerInstance = Farmer.get(id)
        if (!farmerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'farmer.label', default: 'Farmer'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (farmerInstance.version > version) {
                farmerInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'farmer.label', default: 'Farmer')] as Object[],
                          "Another user has updated this Farmer while you were editing")
                render(view: "edit", model: [farmerInstance: farmerInstance])
                return
            }
        }

        farmerInstance.properties = params

        if (!farmerInstance.save(flush: true)) {
            render(view: "edit", model: [farmerInstance: farmerInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'farmer.label', default: 'Farmer'), farmerInstance.id])
        redirect(action: "show", id: farmerInstance.id)
    }

    def delete(Long id) {
        def farmerInstance = Farmer.get(id)
        if (!farmerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'farmer.label', default: 'Farmer'), id])
            redirect(action: "list")
            return
        }

        try {
            farmerInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'farmer.label', default: 'Farmer'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'farmer.label', default: 'Farmer'), id])
            redirect(action: "show", id: id)
        }
    }
}
