package seedswap

//This controller defines actions associated with the farmer class.
class UserController {

    def index = { }

    //Login validation takes place here
    def doLogin = {
          //Checks the email and password entered in the text box against the values stored in
          //the database, and adds this as a session variable called "user"
          def user = Farmer.findWhere(username:params['username'],password:params['password'])
          session.user = user
        //If user is true (i.e. the password and login are valid and match the database),
        //the login is a success.
        if(user){
            redirect(controller: "farmer", action: "list")
        }
        else{
            render "${params['username']}"
        }
    }
}
