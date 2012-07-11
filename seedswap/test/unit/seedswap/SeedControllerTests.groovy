package seedswap



import org.junit.*
import grails.test.mixin.*

@TestFor(SeedController)
@Mock(Seed)
class SeedControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/seed/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.seedInstanceList.size() == 0
        assert model.seedInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.seedInstance != null
    }

    void testSave() {
        controller.save()

        assert model.seedInstance != null
        assert view == '/seed/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/seed/show/1'
        assert controller.flash.message != null
        assert Seed.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/seed/list'

        populateValidParams(params)
        def seed = new Seed(params)

        assert seed.save() != null

        params.id = seed.id

        def model = controller.show()

        assert model.seedInstance == seed
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/seed/list'

        populateValidParams(params)
        def seed = new Seed(params)

        assert seed.save() != null

        params.id = seed.id

        def model = controller.edit()

        assert model.seedInstance == seed
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/seed/list'

        response.reset()

        populateValidParams(params)
        def seed = new Seed(params)

        assert seed.save() != null

        // test invalid parameters in update
        params.id = seed.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/seed/edit"
        assert model.seedInstance != null

        seed.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/seed/show/$seed.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        seed.clearErrors()

        populateValidParams(params)
        params.id = seed.id
        params.version = -1
        controller.update()

        assert view == "/seed/edit"
        assert model.seedInstance != null
        assert model.seedInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/seed/list'

        response.reset()

        populateValidParams(params)
        def seed = new Seed(params)

        assert seed.save() != null
        assert Seed.count() == 1

        params.id = seed.id

        controller.delete()

        assert Seed.count() == 0
        assert Seed.get(seed.id) == null
        assert response.redirectedUrl == '/seed/list'
    }
}
