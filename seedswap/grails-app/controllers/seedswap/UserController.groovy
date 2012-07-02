package seedswap

//This controller defines actions associated with the farmer class.
class UserController {

    def index = { }

    def signup = { }

    //Login validation takes place here
    def doLogin = {
        if(request.method == 'POST') {
          //Checks the email and password entered in the text box against the values stored in
          //the database, and adds this as a session variable called "user"
          def user = Farmer.findWhere(email:params['email'],password:params['password'])
          session.user = user
        //If user is true (i.e. the password and login are valid and match the database),
        //the login is a success.
        if(user){
            render "Login successful"
            //redirect(url: "/")
        }
        else{
            flash.message = "Login failed"
            //redirect(url: "/")
            //failAttempt
        }
        } else if (session.user) {
            redirect(url: "/")
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
                redirect(url:"/")
            }
        } else if (session.user) {
            // don't allow registration while user is logged in
            redirect(url: "/")
        }
    }

//    def failAttempt = {
//        def user = Farmer.findWhere(email:params['email'])
//        session.user = user
//        if(user) {
//            def attempt = Farmer.get(params.id)
//            attempt.attempts = params.attempts + 1
//            attempt.save()
//        }
//    }
}
