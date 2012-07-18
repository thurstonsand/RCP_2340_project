package seedswap

//This controller defines actions associated with the farmer class.
class UserController {
    def MAX_LOGIN_ATTEMPT = 3;

    def index = {
        if(session.user) {
            if(session.user.role == UserRole.ADMIN) {
                redirect(action: "adminList", controller: "user")
            } else{
                redirect(action: "list", controller: "seed")
            }
        } else {
            render(view: 'login')
        }
    }

    def signup = { }

    def login = {}

    // Used for AJAX to return only the content of the form
    def loginForm = {
        render(view: '_loginForm')
    }

    //renders the administrator view
    def adminList = {
        render(view: 'adminList', model: [userList: Farmer.list()])
    }

    //unlocks a locked account
    def unlock = {
        def user = Farmer.get(params.id)
        user.locked = false;
        user.save()
        this.adminList()
    }

    //Login validation takes place here
    def doLogin = { LoginCommand cmd ->
        if (request.method == 'POST') {
            if(cmd.hasErrors()) {
                render(view: 'login', model: [cmd: cmd])
                return
            }
            //Checks the email and password entered in the text box against the values stored in
            //the database, and adds this as a session variable called "user"
            def user = Farmer.findWhere(email:cmd.email)

            //If user is true (associated with an email and the account is not locked, log the attempt
            if(user && !user.locked) {
                def attempt = new LoginAttempt(farmer: user)
                attempt.success = user.password == cmd.password
                attempt.save()
                //if the attempt was successful, set the session and load seed listing
                if(attempt.success) {
                    request.session.user = user
                    if(user.role == UserRole.ADMIN) {
                        redirect(action: "adminList", controller: "user")
                    } else{
                        redirect(action: "list", controller: "seed")
                    }

                    return
                    //if the login failed, increment fail count
                } else {
                    def attempts = LoginAttempt.findAll("from LoginAttempt where farmer = :farmer order by attemptAt desc", [farmer: user], [max: MAX_LOGIN_ATTEMPT]);
                    def consecutiveFails = 0
                    attempts.each() { att ->
                        if(!att.success) {
                            consecutiveFails++;
                        }
                    }

                    //if the fail count is >= the maximum login attempts, lock the account
                    if(consecutiveFails >= MAX_LOGIN_ATTEMPT) {
                        user.locked = true;
                        user.save()
                    }
                }
            }
            def msg = user && user.locked? "Your account has been locked" : "Login Failed"
            render(view: 'login', model: [msg: msg])
        } else if (session.user) {
            redirect(action: "list", controller: "seed")
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
                redirect(action:"login")
            }
        } else if (session.user) {
            // don't allow registration while user is logged in
            redirect(action: "login")
        }
    }

    def logout = {
        session.invalidate()
        redirect(action: "index")
    }
}

//login wrapper
class LoginCommand {
    String email
    String password

    static constraints = {
        email(blank: false)
        password(blank: false)
    }
}