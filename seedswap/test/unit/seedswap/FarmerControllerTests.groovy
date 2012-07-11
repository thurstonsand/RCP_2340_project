package seedswap



import org.junit.*
import grails.test.mixin.*

@TestFor(FarmerController)
@Mock(Farmer)
class FarmerControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/farmer/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.farmerInstanceList.size() == 0
        assert model.farmerInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.farmerInstance != null
    }

    void testSave() {
        controller.save()

        assert model.farmerInstance != null
        assert view == '/farmer/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/farmer/show/1'
        assert controller.flash.message != null
        assert Farmer.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/farmer/list'

        populateValidParams(params)
        def farmer = new Farmer(params)

        assert farmer.save() != null

        params.id = farmer.id

        def model = controller.show()

        assert model.farmerInstance == farmer
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/farmer/list'

        populateValidParams(params)
        def farmer = new Farmer(params)

        assert farmer.save() != null

        params.id = farmer.id

        def model = controller.edit()

        assert model.farmerInstance == farmer
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/farmer/list'

        response.reset()

        populateValidParams(params)
        def farmer = new Farmer(params)

        assert farmer.save() != null

        // test invalid parameters in update
        params.id = farmer.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/farmer/edit"
        assert model.farmerInstance != null

        farmer.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/farmer/show/$farmer.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        farmer.clearErrors()

        populateValidParams(params)
        params.id = farmer.id
        params.version = -1
        controller.update()

        assert view == "/farmer/edit"
        assert model.farmerInstance != null
        assert model.farmerInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/farmer/list'

        response.reset()

        populateValidParams(params)
        def farmer = new Farmer(params)

        assert farmer.save() != null
        assert Farmer.count() == 1

        params.id = farmer.id

        controller.delete()

        assert Farmer.count() == 0
        assert Farmer.get(farmer.id) == null
        assert response.redirectedUrl == '/farmer/list'
    }
}
