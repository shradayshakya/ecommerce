<%--
  Created by IntelliJ IDEA.
  User: shinigami
  Date: 1/21/19
  Time: 1:09 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:layoutTitle default="Shakya"/></title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Shakya project">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script>
        function ajaxFunction(value) {
            var data = {
                categoryId:  document.getElementById("category").value,
                keyword: value
            }

            $.getJSON('/DwitPhase3/product/searchList', data, function (result) {
                var dataList = document.getElementById("searchList");
                dataList.innerHTML = "";
                result.forEach(function(productName) {
                    // Create a new <option> element.
                    var option = document.createElement('option');
                    // Set the value using the item in the JSON array.
                    option.value = productName;
                    // Add the <option> element to the <datalist>.
                    dataList.appendChild(option);
                });
            });
        }
    </script>

    <style>
    #loader {
        position: absolute;
        left: 50%;
        top: 50%;
        z-index: 1;
        width: 150px;
        height: 150px;
        margin: -75px 0 0 -75px;
        border: 16px solid #f3f3f3;
        border-radius: 50%;
        border-top: 16px solid #3498db;
        width: 120px;
        height: 120px;
    }
    </style>


    %{--Style sheets--}%
    <link rel="stylesheet" type="text/css" href="${resource(file: 'css/bootstrap4/bootstrap.min.css', absolute: true)}">
    <link href="${resource(file: 'plugins/font-awesome-4.7.0/css/font-awesome.min.css', absolute: true)}" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="${resource(file: 'plugins/OwlCarousel2-2.2.1/owl.carousel.css', absolute: true)}">
    <link rel="stylesheet" type="text/css" href="${resource(file: 'plugins/OwlCarousel2-2.2.1/owl.theme.default.css', absolute: true)}">
    <link rel="stylesheet" type="text/css" href="${resource(file: 'plugins/OwlCarousel2-2.2.1/animate.css', absolute: true)}">

    %{--Scripts--}%
    <script src="${resource(file:'js/jquery-3.2.1.min.js', absolute: true)}"></script>
    <script src="${resource(file:'css/bootstrap4/popper.js', absolute: true)}"></script>
    <script src="${resource(file:'css/bootstrap4/bootstrap.min.js', absolute: true)}"></script>
    <script src="${resource(file:'plugins/greensock/TweenMax.min.js', absolute: true)}"></script>
    <script src="${resource(file:'plugins/greensock/TimelineMax.min.js', absolute: true)}"></script>
    <script src="${resource(file:'plugins/scrollmagic/ScrollMagic.min.js', absolute: true)}"></script>
    <script src="${resource(file:'plugins/greensock/animation.gsap.min.js', absolute: true)}"></script>
    <script src="${resource(file:'plugins/greensock/ScrollToPlugin.min.js', absolute: true)}"></script>
    <script src="${resource(file:'plugins/OwlCarousel2-2.2.1/owl.carousel.js', absolute: true)}"></script>
    <script src="${resource(file:'plugins/Isotope/isotope.pkgd.min.js', absolute: true)}"></script>
    <script src="${resource(file:'plugins/easing/easing.js', absolute: true)}"></script>
    <script src="${resource(file:'plugins/parallax-js-master/parallax.min.js', absolute: true)}"></script>

    </head>

    <g:layoutHead/>
</head>
<body>


<div class="super_container">
    <g:set var="cart" value="${0}" />
    <g:each in="${session.getAttribute("cart")}" var="item">
        <g:set var = "cart" value="${cart+item.value}"/>
    </g:each>

    <!-- Header -->

    <header class="header">
    <div class="header_container">
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="header_content d-flex flex-row align-items-center justify-content-start">
                        <div class="logo">
                            <g:link controller="product" action="land">Shakya</g:link></div>
                        <nav class="main_nav">
                            <ul>
                                <li><g:link controller="product" action="land">Home</g:link></li>
                                <li><g:link action="login" controller="user">Login</g:link></li>
                            </ul>
                        </nav>
                            <div class="header_extra ml-auto">
                            <div class="shopping_cart">
                                <g:link action="cart" controller="product">
                                    <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                         viewBox="0 0 489 489" style="enable-background:new 0 0 489 489;" xml:space="preserve">
                                        <g>
                                            <path d="M440.1,422.7l-28-315.3c-0.6-7-6.5-12.3-13.4-12.3h-57.6C340.3,42.5,297.3,0,244.5,0s-95.8,42.5-96.6,95.1H90.3
													c-7,0-12.8,5.3-13.4,12.3l-28,315.3c0,0.4-0.1,0.8-0.1,1.2c0,35.9,32.9,65.1,73.4,65.1h244.6c40.5,0,73.4-29.2,73.4-65.1
													C440.2,423.5,440.2,423.1,440.1,422.7z M244.5,27c37.9,0,68.8,30.4,69.6,68.1H174.9C175.7,57.4,206.6,27,244.5,27z M366.8,462
													H122.2c-25.4,0-46-16.8-46.4-37.5l26.8-302.3h45.2v41c0,7.5,6,13.5,13.5,13.5s13.5-6,13.5-13.5v-41h139.3v41
													c0,7.5,6,13.5,13.5,13.5s13.5-6,13.5-13.5v-41h45.2l26.9,302.3C412.8,445.2,392.1,462,366.8,462z"/>
                                        </g>
                                    </svg>
                                    <div>Cart <span>(${cart})</span>
                                    </div>
                                </g:link>
                            </div>
                            <div class="search">
                                <div class="search_icon">
                                    <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                         viewBox="0 0 475.084 475.084" style="enable-background:new 0 0 475.084 475.084;"
                                         xml:space="preserve">
                                        <g>
                                            <path d="M464.524,412.846l-97.929-97.925c23.6-34.068,35.406-72.047,35.406-113.917c0-27.218-5.284-53.249-15.852-78.087
												c-10.561-24.842-24.838-46.254-42.825-64.241c-17.987-17.987-39.396-32.264-64.233-42.826
												C254.246,5.285,228.217,0.003,200.999,0.003c-27.216,0-53.247,5.282-78.085,15.847C98.072,26.412,76.66,40.689,58.673,58.676
												c-17.989,17.987-32.264,39.403-42.827,64.241C5.282,147.758,0,173.786,0,201.004c0,27.216,5.282,53.238,15.846,78.083
												c10.562,24.838,24.838,46.247,42.827,64.234c17.987,17.993,39.403,32.264,64.241,42.832c24.841,10.563,50.869,15.844,78.085,15.844
												c41.879,0,79.852-11.807,113.922-35.405l97.929,97.641c6.852,7.231,15.406,10.849,25.693,10.849
												c9.897,0,18.467-3.617,25.694-10.849c7.23-7.23,10.848-15.796,10.848-25.693C475.088,428.458,471.567,419.889,464.524,412.846z
												 M291.363,291.358c-25.029,25.033-55.148,37.549-90.364,37.549c-35.21,0-65.329-12.519-90.36-37.549
												c-25.031-25.029-37.546-55.144-37.546-90.36c0-35.21,12.518-65.334,37.546-90.36c25.026-25.032,55.15-37.546,90.36-37.546
												c35.212,0,65.331,12.519,90.364,37.546c25.033,25.026,37.548,55.15,37.548,90.36C328.911,236.214,316.392,266.329,291.363,291.358z
												"/>
                                        </g>
                                    </svg>
                                </div>
                            </div>
                            <div class="hamburger"><i class="fa fa-bars" aria-hidden="true"></i></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Search Panel -->
    <div class="search_panel trans_300">
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="search_panel_content d-flex flex-row align-items-center justify-content-end">
                        <g:form controller="product" action="results">
                            <input type="text" class="search_input" id="searchBar" name = "productName" list="searchList" placeholder="Product name"   onkeydown="ajaxFunction(this.value)">
                            <datalist id="searchList">
                            </datalist>
                            <g:select id="category"  name="categoryId" from="${dwitphase3.Category.list()}" optionKey="id" d value="${productInstance?.category?.id}" class="many-to-one custom-select"/>
                            <input type="submit" class="btn btn-dark" value="Search" >

                        </g:form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Social -->
    <div class="header_social">
        <ul>
            <li><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
            <li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
            <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
            <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
        </ul>
    </div>
</header>

    %{--This is where the body code will be inserted--}%
    <g:layoutBody/>

    <div class="footer_overlay"></div>
    <footer class="footer">
        <div class="footer_background" style="background-image:url(${resource(file: 'images/footer.jpg',absolute: true)})"></div>
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="footer_content d-flex flex-lg-row flex-column align-items-center justify-content-lg-start justify-content-center">
                        <div class="footer_logo"><a href="#">Shakya</a></div>
                        <div class="copyright ml-auto mr-auto"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Copyright &copy;<script>document.write(new Date().getFullYear());</script></div>
                       %{-- <div class="footer_social ml-lg-auto">
                            <ul>
                                <li><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                            </ul>
                        </div>--}%
                    </div>
                </div>
            </div>
        </div>
    </footer>
</div>

</body>
</html>