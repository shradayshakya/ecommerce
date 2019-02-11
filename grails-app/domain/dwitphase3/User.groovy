package dwitphase3

class User {
    String name
    String email
    String password
    String role

    static constraints = {
        name (size: 5..10)
        email(email: true, unique: true)
        password(size: 5..10)
        role(inList: ["Admin","User"])
    }
}
