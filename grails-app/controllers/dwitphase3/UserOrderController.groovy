package dwitphase3



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class UserOrderController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def mailService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond UserOrder.findAllByStatus(1), model:[userOrderInstanceCount: UserOrder.count()]
    }

    def show(UserOrder userOrderInstance) {
        respond userOrderInstance
    }

    def create() {
        respond new UserOrder(params)
    }

    @Transactional
    def save(UserOrder userOrderInstance) {
        if (userOrderInstance == null) {
            notFound()
            return
        }

        if (userOrderInstance.hasErrors()) {
            respond userOrderInstance.errors, view:'create'
            return
        }

        userOrderInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'userOrder.label', default: 'UserOrder'), userOrderInstance.id])
                redirect userOrderInstance
            }
            '*' { respond userOrderInstance, [status: CREATED] }
        }
    }

    def confirmOrder(UserOrder userOrderInstance){
        userOrderInstance.status = 2
        userOrderInstance.save()

        def text = "Your order for "+ userOrderInstance.product.name+"("+userOrderInstance.quantity+") has been confirmed.<br>"+
                " The total is "+(userOrderInstance.product.price*userOrderInstance.quantity)+". <br>"+
                "Thank you and hope you visit again."

        mailService.sendMail {
            to userOrderInstance.email
            subject "Order confirmation"
            html text
        }

        redirect(action: "index")
    }


    def edit(UserOrder userOrderInstance) {
        respond userOrderInstance
    }

    @Transactional
    def update(UserOrder userOrderInstance) {
        if (userOrderInstance == null) {
            notFound()
            return
        }

        if (userOrderInstance.hasErrors()) {
            respond userOrderInstance.errors, view:'edit'
            return
        }

        userOrderInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'UserOrder.label', default: 'UserOrder'), userOrderInstance.id])
                redirect userOrderInstance
            }
            '*'{ respond userOrderInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(UserOrder userOrderInstance) {

        if (userOrderInstance == null) {
            notFound()
            return
        }

        userOrderInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'UserOrder.label', default: 'UserOrder'), userOrderInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'userOrder.label', default: 'UserOrder'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def registerOrder(){
        String fname = params.fname
        String lname = params.lname
        String country= params.country
        String city = params.city
        String province = params.province
        String phone = params.phone
        Integer zipcode = Integer.parseInt(params.zipcode)
        String email = params.email

        def text = "Hello "+fname+", your orders are listed in the table below";

        if(session.cart){
            Map<Integer, Integer> cart = session.cart
            def productIds = cart.keySet()
            text = text + "<table><tr><th>Quantity</th><th>Product Name</th><th>Price</th>"
            for (Integer productId: productIds){
                def product = Product.get(productId)

                new UserOrder(product: product, status: 1, quantity: cart.get(productId), fname: fname, lname: lname, phone: phone, email: email, country: country, city: city, zipcode: zipcode, province: province ).save()
                text = text+"<tr><td>"+cart.get(productId)+"</td><td>"+product.name+"</td><td>"+(product.price-product.discount)+"</td></tr>"
            }
            text = text+ "</table><br> We will soon contact you on "+phone
            mailService.sendMail {
                to email
                subject "Orders"
                html text
            }
        }
        forward(action: "clearCart", controller: "product")
    }
}
