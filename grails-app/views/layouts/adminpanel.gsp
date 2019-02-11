<%--
  Created by IntelliJ IDEA.
  User: shinigami
  Date: 1/21/19
  Time: 1:09 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:layoutTitle default="Adminpanel"/></title>
<meta charset="utf-8" />
    <export:resource />

    <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- BOOTSTRAP STYLES-->
<link rel="stylesheet" type="text/css" href="${resource(file:"css/bootstrap4/bootstrap.min.css",absolute: true)}">
<!-- FONTAWESOME STYLES-->
<link href="${resource(file:"plugins/font-awesome-4.7.0/css/font-awesome.min.css",absolute: true)}" rel="stylesheet" type="text/css">
<!-- GOOGLE FONTS-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
<!-- CUSTOM STYLES-->
<asset:stylesheet href="custom.css" />

<!-- JQUERY SCRIPTS -->
<script src="${resource(file:"js/jquery-3.2.1.min.js",absolute: true)}"></script>
<!-- BOOTSTRAP SCRIPTS -->
<script src="${resource(file:"css/bootstrap4/popper.js",absolute: true)}"></script>
<script src="${resource(file:"css/bootstrap4/bootstrap.min.js",absolute: true)}"></script>
<!-- CUSTOM SCRIPTS -->
<asset:javascript src="custom2.js" />

<g:layoutHead/>
</head>
<body>

<div id="wrapper">
    <!-- /. NAV TOP  -->
    <nav class="navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="navbar-nav nav" id="main-menu">
                <li class="nav nav-link active">
                <g:link action="home" controller="user"><i class="fa fa-desktop "></i>Dashboard</g:link>
                </li>

                <li class="nav nav-link">
                    <g:link action="index" controller="user"><i class="fa fa-user"></i>User</g:link>
                </li>

                <li class="nav nav-link">
                    <g:link action="index" controller="category"><i class="fa fa-cubes "></i>Category</g:link>
                </li>

                <li class="nav nav-link">
                    <g:link action="index" controller="product"><i class="fa fa-product-hunt "></i>Product</g:link>
                </li>

                <li class="nav nav-link">
                    <g:link action="index" controller="userOrder"><i class="fa fa-opera "></i>Order</g:link>
                </li>

                <li class="nav nav-link">
                    <g:link action="logout" controller="user"><i class="fa fa-sign-out "></i>Logout</g:link></a>
                </li>
                </ul>
        </div>
    </nav>
    <!-- /. NAV SIDE  -->

   %{-- This is where all the body tag goes--}%

    <div id="page-wrapper" >
        <div id="page-inner">
            <g:layoutBody />
        </div>
        <!-- /. PAGE INNER  -->
    </div>
    <!-- /. PAGE WRAPPER  -->

    </div>


<div class="footer">
    <div class="row">
        <div class="col-lg-12" >
            &copy; 2019
        </div>
    </div>
</div>



</body>
</html>