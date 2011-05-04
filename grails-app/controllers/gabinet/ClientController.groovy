package gabinet

class ClientController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [clientInstanceList: Client.list(params), clientInstanceTotal: Client.count()]
    }

    def create = {
        def clientInstance = new Client()
        clientInstance.properties = params
        return [clientInstance: clientInstance]
    }

    def save = {
        def clientInstance = new Client(params)
		def addressInstance = new Address(params)
        clientInstance.address = addressInstance 
        if ((addressInstance.save(flush: true)) && clientInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'client.label', default: 'Client'), clientInstance.id])}"
            redirect(action: "show", id: clientInstance.id)
        }
        else {
            render(view: "create", model: [clientInstance: clientInstance])
        }
    }

    def show = {
        def clientInstance = Client.get(params.id)
        if (!clientInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'client.label', default: 'Client'), params.id])}"
            redirect(action: "list")
        }
        else {
            [clientInstance: clientInstance]
        }
    }

    def edit = {
        def clientInstance = Client.get(params.id)
        if (!clientInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'client.label', default: 'Client'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [clientInstance: clientInstance]
        }
    }

    def update = {
        def clientInstance = Client.get(params.id)
        if (clientInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (clientInstance.version > version) {
                    
                    clientInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'client.label', default: 'Client')] as Object[], "Another user has updated this Client while you were editing")
                    render(view: "edit", model: [clientInstance: clientInstance])
                    return
                }
            }
            clientInstance.properties = params
            if (!clientInstance.hasErrors() && clientInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'client.label', default: 'Client'), clientInstance.id])}"
                redirect(action: "show", id: clientInstance.id)
            }
            else {
                render(view: "edit", model: [clientInstance: clientInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'client.label', default: 'Client'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def clientInstance = Client.get(params.id)
        if (clientInstance) {
            try {
                clientInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'client.label', default: 'Client'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'client.label', default: 'Client'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'client.label', default: 'Client'), params.id])}"
            redirect(action: "list")
        }
    }
}
