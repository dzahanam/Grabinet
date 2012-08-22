package gabinet

import grails.test.*

class SurgeryTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testSomething() {
		def surgeriesList = [:]
		surgeriesList.put(1,"a")
		def tmp = 0
		if (surgeriesList.get(1) != null) {
			surgeriesList.put(1+"."+tmp.toString(),"c")
			tmp++
			surgeriesList.put(1+"."+tmp.toString(),"d")
		}
		surgeriesList.put(1,"b")
		println "1: "+surgeriesList.get(1)
		println "surgeriesList: "+surgeriesList
		
		if (surgeriesList.get(1) != null) {
			println "1: "+surgeriesList.get(1)
			def tmp2 = 0
			while (surgeriesList.get(1+"."+tmp2)) {
				println "tmp2: "+tmp2+" list: "+surgeriesList.get(1+"."+tmp2)
				tmp2++
			}
		}
		
    }
}
