import gabinet.Address
import gabinet.Client

import org.codehaus.groovy.grails.commons.ApplicationHolder
import org.gabinet.SecRole
import org.gabinet.SecUser
import org.gabinet.SecUserSecRole

class BootStrap {
	def springSecurityService

    def init = { servletContext ->
		// Check whether the test data already exists.
		if (!Client.count()) {
			def address = new Address(city: "Poznan", street : "ulica", postalCode : "61-100").save(failOnError: true)
			new Client(
				firstName: "Stephen King", 
				surName: "The Shining", 
				email: "example@org.pl", 
				allergy: "", 
				birthDate: new Date(), 
				cellPhone: "", 
				comment: "", 
				family: "", 
				homePhone: "", 
				recommendation: "", 
				workPhone: "", 
				address: address).save(failOnError: true)
			new Client(firstName: "Józef", surName: "Dobronocki", email: "j.dobro@gazeta.pl", recommendation: "recommendation1").save(failOnError: true)
//			def filePath = "resources/klienci2.csv"
//			def text = ApplicationHolder.application.parentContext.getResource("classpath:$filePath").inputStream.text
//			text.eachLine {
//				println it
//				  def ClientFields = it.split(",")
//				println ClientFields
//				  new Client(firstName: ClientFields[1],
//			             email: "",
//						 surName: ClientFields[2],
//						 homePhone: ClientFields[3],
//						 workPhone: ClientFields[4],
//						 cellPhone: ClientFields[5],
//						 allergy: ClientFields[6],
//						 birthDate: ClientFields[7],
//						 family: ClientFields[8],
//						 recommendation: ClientFields[9],
////			          other: ClientFields[10],	
//						 address: address
//			          ).save()
//			}

		}
		
    	/* bootstrap roles */
    	def userRole = SecRole.findByAuthority('ROLE_USER') ?: new SecRole(authority: 'ROLE_USER').save(failOnError: true)
        def adminRole = SecRole.findByAuthority('ROLE_ADMIN') ?: new SecRole(authority: 'ROLE_ADMIN').save(failOnError: true)
		
		/* bootstrap admin */
        def adminUser = SecUser.findByUsername('admin') ?: new SecUser(
                username: 'admin',
                password: springSecurityService.encodePassword('admin'),
                enabled: true).save(failOnError: true)

        if (!adminUser.authorities.contains(adminRole)) {
            SecUserSecRole.create adminUser, adminRole
        }
    }
    def destroy = {
    }
}
