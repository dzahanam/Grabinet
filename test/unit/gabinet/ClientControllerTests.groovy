package gabinet

import grails.test.*

class ClientControllerTests extends ControllerUnitTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testIndex() {
        def controller = new ClientController()
        controller.index()
        assertEquals "/gabinet/list", controller.response.redirectedUrl
    }
	
//    void testSomeRender() {
//		controller.params.max = 10
//		controller.show()
//		assertEquals "", controller.response.contentAsString
//    }
	

}
