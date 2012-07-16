package seedswap

import org.springframework.dao.DataIntegrityViolationException

class SeedController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    static layout = 'main'

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [seedInstanceList: Seed.list(params), seedInstanceTotal: Seed.count()]
    }

    def create() {
        [seedInstance: new Seed(params)]
    }

    def save() {
        def seedInstance = new Seed(params)
        if (!seedInstance.save(flush: true)) {
            render(view: "create", model: [seedInstance: seedInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'seed.label', default: 'Seed'), seedInstance.id])
        redirect(action: "show", id: seedInstance.id)
    }

    def show(Long id) {
        def seedInstance = Seed.get(id)
        if (!seedInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'seed.label', default: 'Seed'), id])
            redirect(action: "list")
            return
        }

        [seedInstance: seedInstance]
    }

    def edit(Long id) {
        def seedInstance = Seed.get(id)
        if (!seedInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'seed.label', default: 'Seed'), id])
            redirect(action: "list")
            return
        }

        [seedInstance: seedInstance]
    }

    def update(Long id, Long version) {
        def seedInstance = Seed.get(id)
        if (!seedInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'seed.label', default: 'Seed'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (seedInstance.version > version) {
                seedInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'seed.label', default: 'Seed')] as Object[],
                          "Another user has updated this Seed while you were editing")
                render(view: "edit", model: [seedInstance: seedInstance])
                return
            }
        }

        seedInstance.properties = params

        if (!seedInstance.save(flush: true)) {
            render(view: "edit", model: [seedInstance: seedInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'seed.label', default: 'Seed'), seedInstance.id])
        redirect(action: "show", id: seedInstance.id)
    }

    def search = {
        if(request.method == 'POST') {
            def term = "%" + params.search + "%"
            def search = Seed.findAllByNameIlikeOrScientificNameIlikeOrHardiness(term, term, params.search)
            render(view: "search", model: [searchResultList: search, search: search.size()])
        } else {
            redirect(view: 'list')
        }
    }

    def delete(Long id) {
        def seedInstance = Seed.get(id)
        if (!seedInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'seed.label', default: 'Seed'), id])
            redirect(action: "list")
            return
        }

        try {
            seedInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'seed.label', default: 'Seed'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'seed.label', default: 'Seed'), id])
            redirect(action: "show", id: id)
        }
    }
}
