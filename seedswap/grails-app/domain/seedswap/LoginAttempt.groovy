package seedswap

/**
 * LoginAttempt logs login attempts by the date and success
 *
 * @author Jenelle Walker
 */
class LoginAttempt {
    Farmer farmer
    static belongsTo=[farmer:Farmer]
    Date attemptAt
    boolean success

    public LoginAttempt() {
        this.attemptAt = new Date()
    }
}