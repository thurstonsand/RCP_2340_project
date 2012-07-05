package seedswap
//This class represents a farmer with an associated password, email address and lock account status.
//Additional variables will be added as needed.
class Farmer {

    String password;
    String email;
    boolean locked;

    public Farmer() {
        this.locked = false
    }

    String toString(){
        "$email"
    }

    //A valid Farmer object must have an email address and a non-blank password
    static constraints = {
        email email:true
        password blank:false, password:true
    }
}
