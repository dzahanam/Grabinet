import java.text.ParseException

import gabinet.Address
import gabinet.Client
import gabinet.Surgery
import java.text.SimpleDateFormat

import org.codehaus.groovy.grails.commons.ApplicationHolder
import org.gabinet.SecRole
import org.gabinet.SecUser
import org.gabinet.SecUserSecRole



class BootStrap {
	def springSecurityService
	def addressesList = [:]
	def surgeriesList = [:]


    def init = { servletContext ->
		// Check whether the test data already exists.
		if (!Client.count()) {
			createSurgeries()
			createAddresses()
			createClients()
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
	
	def createAddresses = {
			def filePath = "resources/adresy.csv"
			def text = ApplicationHolder.application.parentContext.getResource("classpath:$filePath").inputStream.text
			text.eachCsvLine {
				tokens ->
				def address = new Address( city: tokens[3]!="" ? tokens[3] : "Poznan",
					street : tokens[2]!="" ? tokens[2] : "ulica",
					postalCode : tokens[1]!="" ? tokens[1] : "61-100")
				addressesList.put(tokens[0],address)
				//assert addressesList.get(tokens[0]) == address 
			}
	} 
	
	def createSurgeries = {
			def filePath = "resources/zabiegi.csv"
			def text = ApplicationHolder.application.parentContext.getResource("classpath:$filePath").inputStream.text
			text.eachCsvLine {
				//"IDzabiegu","Data","TerapiaDot","CeraOpis","Zalecenia","Zabieg","IDklienta"
				tokens ->
				println "tokens: "+tokens + " size: "+tokens.size()
				SimpleDateFormat format = new SimpleDateFormat("yy-MM-dd")
				Date date = new Date()
				if (tokens[1]!="")
					try {
						date = format.parse(tokens[1])					
					} catch (ParseException e) {
					}
				def surgery = new Surgery( date: date,
					therapy : tokens[2]!="" ? tokens[2] : "DU",
					skin : tokens[3]!="" ? tokens[3] : "DU",
					recommendation : tokens[4]!="" ? tokens[4] : "DU",
					surgery : tokens[5]!="" ? tokens[5] : "DU")
				def last = tokens.size()-1
				def tmp = 0
				def surgeryTmp = surgeriesList.get(tokens[last]+"."+tmp)
				while (surgeryTmp instanceof Surgery && surgeryTmp != null) {
				   tmp++
				   surgeryTmp = surgeriesList.get(tokens[last]+"."+tmp)
				   println "surgeriesList.get: "+tokens[last]+"."+tmp+" surgeryTmp: "+surgeryTmp
				}
				surgeriesList.put(tokens[last]+"."+tmp,surgery)
				println "surgeriesList.put: "+tokens[last]+"."+tmp+" surgery: "+surgery
//				assert surgeriesList.get(tokens[last]) == surgery 
			}
	} 
	
	def createClients = {
//			def address = new Address(city: "Poznan", street : "ulica", postalCode : "61-100").save(failOnError: true)
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
//				println "tokens: "+tokens + " size: "+tokens.size()
				SimpleDateFormat format = new SimpleDateFormat("yy-MM-dd")
				Date date = new Date()
				if (tokens[7]!="")
					try {
						date = format.parse(tokens[7])					
					} catch (ParseException e) {
					}
					
				def addressId = tokens[11]
//				println "addressesList "+tokens[11]+" : "+addressesList.get(tokens[11])
				def address = new Address(city: "Poznan", street : "DU", postalCode : "DU")
				if (addressesList.get(tokens[11]) != null)
					address = addressesList.get(tokens[11])
				address.save(failOnError: true)

				def clientInstance = new Client(firstName: tokens[1]!="" ? tokens[1] : "DU",
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
				
			    //odbieranie listy
 	            def tmp2 = 0
				def surgery = surgeriesList.get(tokens[0]+"."+tmp2)
					println "surgeriesList "+tokens[0]+" : "+surgeriesList.get(tokens[0]+"."+tmp2)+" : "+surgery
					while (surgery instanceof Surgery && surgery != null) {
						println "tmp2: "+tmp2+" list: "+surgeriesList.get(tokens[0]+"."+tmp2)
						clientInstance.addToSurgeies(surgery)
						tmp2++
						surgery = surgeriesList.get(tokens[0]+"."+tmp2)
					}
			}
	}
}
