package seedswap

class Farmer {

    String password;
    String email;

    String toString(){
        "$email"
    }

    static constraints = {
        email email:true
        password blank:false, password:true
    }
}
