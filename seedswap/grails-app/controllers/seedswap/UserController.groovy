package seedswap

class UserController {

    def index() { }

    def login = {
        if(params.username=="admin" && params.password=="pass"){
            render "Login Successful"
            session.user= "admin"
        }
        else{
            render "Login Failed"
        }
    }
}
