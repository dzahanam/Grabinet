import java.text.ParseException

import gabinet.Address
import gabinet.Client
import java.text.SimpleDateFormat

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
//			new Client(
//				firstName: "Stephen King", 
//				surName: "The Shining", 
//				email: "example@org.pl", 
//				allergy: "", 
//				birthDate: new Date(), 
//				cellPhone: "", 
//				comment: "", 
//				family: "", 
//				homePhone: "", 
//				recommendation: "", 
//				workPhone: "", 
//				address: address).save(failOnError: true)
			def filePath = "resources/klienci.csv"
			def text = ApplicationHolder.application.parentContext.getResource("classpath:$filePath").inputStream.text
			text.eachCsvLine {
				tokens ->
				println "tokens: "+tokens + " size: "+tokens.size()
				SimpleDateFormat format = new SimpleDateFormat("yy-MM-dd")
				Date date = new Date()
				if (tokens[7]!="")
					try {
						date = format.parse(tokens[7])					
					} catch (ParseException e) {
					}
				new Client(firstName: tokens[1]!="" ? tokens[1] : "DU",
			             email: "",
						 surName: tokens[2]!="" ? tokens[2] : "DU",
						 homePhone: tokens[3],
						 workPhone: tokens[4],
						 cellPhone: tokens[5],
						 allergy: tokens[6],
						 birthDate: date,
						 family: tokens[8],
						 recommendation: tokens[9],
						 comment: tokens[10],
						 address: address
			          ).save(failOnError: true)
			}

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
