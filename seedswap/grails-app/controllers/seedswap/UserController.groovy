package seedswap

//This controller defines actions associated with the farmer class.
class UserController {

    def index = {

    }

    def signup = { }
    def login = { }

    //Login validation takes place here
    def doLogin = { LoginCommand cmd ->
        if (request.method == 'POST') {
            if(cmd.hasErrors()) {
                render(view: 'login', model: [cmd: cmd])
                return
            }
            //Checks the email and password entered in the text box against the values stored in
            //the database, and adds this as a session variable called "user"
            def user = Farmer.findWhere(email:cmd.email,password:cmd.password)
            session.user = user
            //If user is true (i.e. the password and login are valid and match the database),
            //the login is a success.
            if(user){
                render "Login successful"
                //redirect(url: "/")
            }
            else{
                user = Farmer.findWhere(email:cmd.email)
                session.user = user
                if(user) {
                    def attempt = user.attempts
                    attempt += 1
                    attempt.save()
                }
                render(view: 'login', model: [msg: "Login Failed"])
            }
        } else if (session.user) {
            redirect(url: "/seedswap")
        }
    }

    def register = {
        // new user posts his registration details
        if (request.method == 'POST') {
            // create new farmer with appropriate parameters
            def user = new Farmer(params)
            if (! user.save()) {
                // validation failed, render registration page again
                render(view: 'signup', model: [user: user])
            } else {
                // validate/save ok, store user in session, redirect to homepage
                session.user = user
                redirect(url:"/seedswap")
            }
        } else if (session.user) {
            // don't allow registration while user is logged in
            redirect(url: "/seedswap")
        }
    }
}

class LoginCommand {
    String email
    String password

    static constraints = {
        email(blank: false)
        password(blank: false)
    }
}
