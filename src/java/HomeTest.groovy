import static org.junit.Assert.*


class HomeTest extends functionaltestplugin.FunctionalTestCase {
  void testSearch() {
    get('http://www.twitter.com')
    click "Search"

    assertStatus 200
    assertContentContains "search"

    form('searchForm') {
      q = "#grails"
      click "Search"
    }

    assertStatus 200
    assertContentContains "#grails"		
  }
}