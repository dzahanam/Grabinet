package gabinet

class Client {
	String firstName
	String surName
	String homePhone
	String workPhone
	String cellPhone
	Date birthDate
	
	String allergy
	String family
	String recommendation
	String comment
	
	Address address
	
	static hasMany = [ surgeies : Surgery ]
	
    static constraints = {
    }
}
