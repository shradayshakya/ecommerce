<%--
  Created by IntelliJ IDEA.
  User: shinigami
  Date: 1/17/19
  Time: 9:52 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="userpanel">
    <title>Login</title>
    <asset:stylesheet href="main_styles.css" />
    <asset:stylesheet href="responsive.css" />
    <asset:javascript src="custom.js" />
    <asset:stylesheet href="login.css" />
</head>
<body>

<div class="login">
<g:form action="home" controller="user" method="post">
    <div class="box">
        <h1>Login</h1>

        <input type="text" name="name"  placeholder="Enter name" class="text-box" />

        <input type="password" name="password" placeholder="Enter password"  class="text-box" />

        <button type="submit" class="btn1" style="margin-left: 80px">Sign In</button> <!-- End Btn -->

    </div> <!-- End Box -->



</g:form>
</div>



</body>
</html>