package dwitphase3

class Product {
    String name
    Float price
    Integer stock
    Float discount
    String description
    Category category
    String image


    static constraints = {
        name(unique: true)
        category()
        price()
        stock()
        discount()
        description(nullable: true, maxSize: 255)
        image(nullable: true)
    }
}
