package seedswap
//This class represents a farmer with an associated password, email address and lock account status.
//Additional variables will be added as needed.
class Farmer {

    String password;
    String email;
    boolean locked;
    UserRole role
    String name
    int climateZone
    String address
    String interests

    //seed setup
    List seeds = new ArrayList()
    static hasMany = [seeds:Seed]
    static mapping = {
        seeds cascade:"all"
    }

    //Farmer constructor; all farmers are users and their accounts are unlocked at creation
    public Farmer() {
        this.locked = false
        this.role = UserRole.USER
    }

    String toString(){
        "$name"
    }

    //A valid Farmer object must have an email address and a non-blank password
    static constraints = {
        email email:true
        password blank:false, password:true, display:false
        locked display:false, editable:false, widget:'hiddenField'
        name name:true, blank:false
        climateZone nullable:true, widget:'textbox', max:8
        address nullable:true, widget:'textarea'
        interests nullable:true, widget:'textarea'
        role nullable: false

    }
}

/**
 * enum UserRole defines two roles: user and administrator
 */
enum UserRole {
    ADMIN ('Administrator'), USER ('Regular user')
    String name

    private UserRole(String name) {
        this.name = name
    }
}
