import seedswap.Farmer
import seedswap.Seed

//Creates a new Farmer object in the bootstrap prior to application startup. This represents an
//existing farmer whose data has been stored in the database and will be used to validate login.
class BootStrap {

    def init = { servletContext ->
        Farmer joe = new Farmer(username: "farmerjoe@seeds.net",password:"i<3seeds")
        joe.save()
    }
    //No need to delete users yet, but this is where it will be handled
    def destroy = { }
}
