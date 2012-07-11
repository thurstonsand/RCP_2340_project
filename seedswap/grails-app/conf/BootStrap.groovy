import seedswap.Farmer

//Creates a new Farmer object in the bootstrap prior to application startup. This represents an
//existing farmer whose data has been stored in the database and will be used to validate login.
class BootStrap {

    def init = { servletContext ->
        new Farmer(email:"farmerjoe@seeds.net",password:"i<3seeds", isAdmin: true).save()
    }
    //No need to delete users yet, but this is where it will be handled
    def destroy = { }
}
