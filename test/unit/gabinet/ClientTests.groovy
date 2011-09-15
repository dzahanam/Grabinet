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
}
