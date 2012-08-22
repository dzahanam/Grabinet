package gabinet

import grails.plugins.springsecurity.Secured

import org.apache.commons.logging.LogFactory

//@Secured(['IS_AUTHENTICATED_FULLY'])
class SurgeryController {
	private static final log = LogFactory.getLog(this)
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
		println "params.sort: "+params.sort
		if (params.sort == null)
		  params.sort = "date"
        [surgeryInstanceList: Surgery.list(params), surgeryInstanceTotal: Surgery.count()]
    }

    def create = {
		def clientInstance = Client.get(params.id)
        return [clientInstance : clientInstance]
    }

    def save = {
		def clientInstance = Client.get(params.id)
        def surgeryInstance = new Surgery(params)
		clientInstance.addToSurgeies(surgeryInstance)
		
		def f = request.getFile('picture')
	    // List of OK mime-types
	    def okcontents = ['image/png', 'image/jpeg', 'image/gif']
	    if ((f != null) && ! okcontents.contains(f.getContentType())) {
	      log.error "picture must be one of: ${okcontents}"
		  surgeryInstance.picture = null
	    }
		log.info("File uploaded: " + f.getContentType())
		
        if (surgeryInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'surgery.label', default: 'Surgery'), surgeryInstance.id])}"
            redirect(action: "show", id: surgeryInstance.id)
        }
        else {
            render(view: "create", model: [surgeryInstance: surgeryInstance])
        }
    }

    def show = {
        def surgeryInstance = Surgery.get(params.id)
        if (!surgeryInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'surgery.label', default: 'Surgery'), params.id])}"
            redirect(action: "list")
        }
        else {
			println surgeryInstance.client
            [surgeryInstance: surgeryInstance]
        }
    }

    def edit = {
        def surgeryInstance = Surgery.get(params.id)
        if (!surgeryInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'surgery.label', default: 'Surgery'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [surgeryInstance: surgeryInstance]
        }
    }

    def update = {
        def surgeryInstance = Surgery.get(params.id)
        if (surgeryInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (surgeryInstance.version > version) {
                    
                    surgeryInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'surgery.label', default: 'Surgery')] as Object[], "Another user has updated this Surgery while you were editing")
                    render(view: "edit", model: [surgeryInstance: surgeryInstance])
                    return
                }
            }
            surgeryInstance.properties = params
			
			def f = request.getFile('picture')
		    // List of OK mime-types
		    def okcontents = ['image/png', 'image/jpeg', 'image/gif']
		    if ((f != null) && ! okcontents.contains(f.getContentType())) {
		      log.error "picture must be one of: ${okcontents}"
			  surgeryInstance.picture = null
		    }
			log.info("File uploaded: " + f.getContentType())
			
            if (!surgeryInstance.hasErrors() && surgeryInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'surgery.label', default: 'Surgery'), surgeryInstance.id])}"
                redirect(action: "show", id: surgeryInstance.id)
            }
            else {
                render(view: "edit", model: [surgeryInstance: surgeryInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'surgery.label', default: 'Surgery'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def surgeryInstance = Surgery.get(params.id)
        if (surgeryInstance) {
            try {
                surgeryInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'surgery.label', default: 'Surgery'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'surgery.label', default: 'Surgery'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'surgery.label', default: 'Surgery'), params.id])}"
            redirect(action: "list")
        }
    }

    def viewImage = {

      def surgeryInstance = Surgery.get(params.id)
      byte[] image = surgeryInstance.picture 
      response.outputStream << image

    }
	
	def deletePicture = {
      def surgeryInstance = Surgery.get(params.id)
      surgeryInstance.picture = null
	  if (!surgeryInstance.hasErrors() && surgeryInstance.save(flush: true)) {
          flash.message = "${message(code: 'default.updated.message', args: [message(code: 'surgery.label', default: 'Surgery'), surgeryInstance.id])}"
          redirect(action: "show", id: surgeryInstance.id)
      } else {
          render(view: "edit", model: [surgeryInstance: surgeryInstance])
      }
	  render(view: "edit", model: [surgeryInstance: surgeryInstance])
	}
}
