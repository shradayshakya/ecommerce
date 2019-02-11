package dwitphase3

class Category {
String categoryName
    String description
    static constraints = {
        categoryName(maxSize: 10)
        description(nullable: true)
    }

    String toString(){
        return categoryName
    }
}
