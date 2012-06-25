package seedswap

class UserController {

    def index() { }

    def login() {
        if(params.username == "admin" && params.password == "pass") render "login success"
        else render "login fail"
    }
}
