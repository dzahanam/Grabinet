package gabinet

class Address {
	String postalCode
	String street
	String city
	
	static searchable = true
	
    static constraints = {
		city(blank:false)
		street(blank:false)
    }
}
