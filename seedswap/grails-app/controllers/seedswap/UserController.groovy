package seedswap

class UserController {

    def index = { }

    def login = { }

    def doLogin = {
          def user = Farmer.findWhere(email:params['email'],password:params['password'])
          session.user = user
        if(user){
            render "Login successful"
        }
        else{
            render "Login failed"
        }
    }
}
