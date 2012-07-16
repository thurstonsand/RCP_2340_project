import seedswap.Farmer
import seedswap.Seed
import seedswap.UserRole


//Creates a new Farmer object in the bootstrap prior to application startup. This represents an
//existing farmer whose data has been stored in the database and will be used to validate login.
class BootStrap {

    def init = { servletContext ->
        new Farmer(email:"farmerjoe@seeds.net",password:"i<3seeds",name: "joe", role: UserRole.ADMIN).save()
        new Farmer(email: "george@seeds.net",password: "asdf",name: "george").save()
    }

    //No need to delete users yet, but this is where it will be handled
    def destroy = { }
}
