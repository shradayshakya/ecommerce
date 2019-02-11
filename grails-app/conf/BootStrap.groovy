import dwitphase3.Product
import dwitphase3.User
import dwitphase3.Category

class BootStrap {

    def init = { servletContext ->

        if(!User.getAll()){
            new User(name: "admin", password: "admin", role: "Admin", email: "aaa@aaa.com").save()
        }

        if(!Category.getAll() && !Product.getAll()){
            Category category = new Category(categoryName: "Technology", description:"Electronics").save();
            new Category(categoryName: "Clothing", description:"Clothes").save();
            new Product(name: "Iphone",category: category, description: "Black", price: 50000, stock: 100, discount:20, image: "img/lalal.jsp").save()
        }
    }
    def destroy = {
    }
}
