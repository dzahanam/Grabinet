import gabinet.Address
import gabinet.Client

import org.gabinet.SecRole
import org.gabinet.SecUser
import org.gabinet.SecUserSecRole

class BootStrap {
	def springSecurityService

    def init = { servletContext ->
		// Check whether the test data already exists.
		if (!Client.count()) {
			def address = new Address(city: "Poznan", street : "ulica", postalCode : "61-100").save(failOnError: true)
			new Client(firstName: "Stephen King", surName: "The Shining", email: "example@org.pl", allergy: "", birthDate: new Date(), cellPhone: "", comment: "", family: "", homePhone: "", recommendation: "", workPhone: "", address: address).save(failOnError: true)
//			new Client(firstName: "Józef", surName: "Dobronocki", email: "j.dobro@gazeta.pl", recommendation: "recommendation1").save(failOnError: true)
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
