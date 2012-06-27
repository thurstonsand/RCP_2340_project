import seedswap.Farmer

class BootStrap {

    def init = { servletContext ->
        new Farmer(email:"farmerjoe@seeds.net",password:"i<3seeds").save()
    }
    def destroy = {
    }
}
