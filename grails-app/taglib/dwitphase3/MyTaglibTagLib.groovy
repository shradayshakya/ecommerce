package dwitphase3

class MyTaglibTagLib {
    static defaultEncodeAs = [taglib:'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    def myDates = { attrs ->
        def date = attrs.get('date')
        if (!date) {
            date = new Date()
        }
        def format = attrs.get('format')
        if (!format) {
            format = "yyyy"
        }
        out << "This is my date"+new java.text.SimpleDateFormat(format).format(date)
    }

    def myNumbers = { attrs ->
        def number = attrs.get('number')
        if (!number) {
            number = new Double(0)
        }
        def format = attrs.get('format')
        if (!format) {
            format = "0"
        }
        out << new java.text.DecimalFormat(format)
                .format((Double)number)
    }

    def mySalaryRS = { attrs ->
        def number = attrs.get('number')
        if (!number) {
            number = new Double(0)
        }
        def format = attrs.get('format')
        if (!format) {
            format = "0"
        }
        out << "RS "+new java.text.DecimalFormat(format)
                .format((Double)number) +"|-"
    }

    def mySalaryDollers = { attrs ->
        def number = attrs.get('number')
        if (!number) {
            number = new Double(0)
        }
        number = number/102f;
        def format = attrs.get('format')
        if (!format) {
            format = "0"
        }
        out << "\$ "+new java.text.DecimalFormat(format)
                .format((Double)number)
    }

    def myText ={ attrs->
        def text = attrs.get('text')
        out <<"${text}"
    }

}
