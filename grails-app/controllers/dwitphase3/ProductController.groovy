package dwitphase3

import com.google.gson.JsonObject
import grails.converters.JSON
import grails.converters.XML
import org.codehaus.groovy.grails.web.json.JSONObject
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ProductController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def mailService

    def grailsApplication
    def exportService


        def list = {
            if(!params.max) params.max = 10

            if(params?.format && params.format != "html"){
                response.contentType = grailsApplication.config.grails.mime.types[params.format]
                response.setHeader("Content-disposition", "attachment; filename=books.${params.extension}")


                List fields = ["name", "price", "stock","discount","description", "category"]
                Map labels = ["name": "Name", "price": "Price", "stock":"Stock", "discount":"Discount", "description":"Description","category":"Category"]

                // Formatter closure
                def upperCase = { domain, value ->
                    return value.toUpperCase()
                }

                Map formatters = [name: upperCase]
                Map parameters = [title: "Products", "column.widths": [0.2, 0.3, 0.5]]

                exportService.export(params.format, response.outputStream, Prooduct.list(params), fields, labels, formatters, parameters)
            }

            render ([ productInstanceList: Product.list( params ) ])
        }

    def productList() {

        /*JSONObject json = new JSONObject()
        json.putAt("productList",Product.list())
        json.putAt("name","Prakash")
        json.putAt("deerwalk",User.list())*/

        render Product.list() as XML

    }

    def land() {
        def productList = Product.list(max: 4)
        [productList:productList]
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)

        respond Product.list(params), model:[productInstanceCount: Product.count()]
    }

    def show(Product productInstance) {
        respond productInstance
    }

    def create() {
        respond new Product(params)
    }


    def results(){
        def productName = params.productName
        def categoryId = params.categoryId
        def productCriteria = Product.createCriteria()

        def results = productCriteria.list {
            like("name", "%$productName%")
            eq("category", Category.get(categoryId))
        }

        [productList:results]
    }

    @Transactional
    def save(Product productInstance) {

        if (productInstance == null) {
            notFound()
            return
        }

        if (productInstance.hasErrors()) {
            respond productInstance.errors, view:'create'
            return
        }

        String path = "web-app/product/images/"
        MultipartHttpServletRequest mpr = (MultipartHttpServletRequest)request;
        CommonsMultipartFile file = (CommonsMultipartFile) mpr.getFile("imageFile");
        String filePath = file.getOriginalFilename()
        filePath = new Date().toString()+filePath
        file.transferTo(new File(path+filePath))

        productInstance.image = filePath

        productInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'product.label', default: 'Product'), productInstance.id])
                redirect productInstance
            }
            '*' { respond productInstance, [status: CREATED] }
        }
    }

    def edit(Product productInstance) {
        respond productInstance
    }

    @Transactional
    def update(Product productInstance) {
        if (productInstance == null) {
            notFound()
            return
        }

        if (productInstance.hasErrors()) {
            respond productInstance.errors, view:'edit'
            return
        }

        productInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Product.label', default: 'Product'), productInstance.id])
                redirect productInstance
            }
            '*'{ respond productInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Product productInstance) {

        if (productInstance == null) {
            notFound()
            return
        }

        productInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Product.label', default: 'Product'), productInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    def unit(){
        def id = params.productId
        Product product = Product.get(id)
        [product:product]
    }

    def checkout(){

    }

    def addToCart(){
        Integer id = Integer.parseInt(params.productId)
        Integer quantity = Integer.parseInt(params.quantity)
        Map<Integer, Integer> cart =null
        if(!session.getAttribute("cart")){
            cart = new HashMap<>()
            cart.put(id,quantity)
            session.setAttribute("cart",cart)
        }else{
            cart = (Map<Integer, Integer>)session.getAttribute("cart")

            if(cart.containsKey(id)){
                cart.put(id, cart.get(id)+quantity)
            }else{
                cart.put(id, quantity)
            }
        }
        redirect(action: "cart")
    }



    def clearCart(){
        session.setAttribute("cart", null)
        redirect(action:"land")
    }


    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }


    def searchList(){

        def productName = params.keyword
        def categoryId = params.categoryId
        def productCriteria = Product.createCriteria()

        def names = productCriteria.list {
            ilike("name", "%$productName%")
            eq("category", Category.get(categoryId))
        }.name

        if(!names){
            render ""
        }else{
            render  new com.google.gson.Gson().toJson(names)
        }
    }


    def cart(){
       // render session.cart
        if(!session.getAttribute("cart")){
            forward(action:"land")
        }
    }

    def updateCart(){
        Integer id = Integer.parseInt(params.id)
        Integer quantity = Integer.parseInt(params.value)
        //System.out.println(id+":"+quantity)
        Map<Integer, Integer> cart = (Map<Integer, Integer>)session.getAttribute("cart")


        if(quantity <= 0){
            cart.remove(id)
        }else{
            cart.put(id, quantity)
        }
        render "success"
    }

}
