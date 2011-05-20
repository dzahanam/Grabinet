package gabinet

import grails.test.*

class ClientTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testClientCreate() {
		Client client = new Client(firstName:"Janek")
		assertEquals "Janek", client.firstName
    }
	
//	void testBlankClient(){
//		Client client = new Client(firstName:"Janek")
//		assertFalse "there should be errors", h.validate()
//		assertTrue "another way to check for errors after you call validate()", h.hasErrors()
//	  }
}
