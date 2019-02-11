<%--
  Created by IntelliJ IDEA.
  User: shinigami
  Date: 1/17/19
  Time: 4:33 PM
--%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="layout" content="adminpanel">
    <title>Adminpanel</title>
</head>
<body>
        <div class="row">
            <div class="col-lg-12">
                <h2>ADMIN DASHBOARD</h2>
            </div>
        </div>
        <!-- /. ROW  -->
        <hr />
        <div class="row">
            <div class="col-lg-12 ">
                <div class="alert alert-info">
                    <strong>Welcome ${session.user.name}!!

                    </strong>
                </div>

            </div>
        </div>
        <!-- /. ROW  -->
        <div class="row text-center pad-top">
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                <div class="div-square">
                    <g:link action="index" controller="user">
                        <i class="fa fa-users fa-5x"></i>
                        <h5>Users</h5>
                    </g:link>
                </div>
            </div>

            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                <div class="div-square">
                    <g:link action="index" controller="product">
                        <i class="fa fa-product-hunt fa-5x"></i>
                        <h5>Products</h5>
                    </g:link>
                </div>
            </div>

            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                <div class="div-square">
                    <g:link action="index" controller="category">
                        <i class="fa fa-cubes fa-5x"></i>
                        <h5>Categories</h5>
                    </g:link>
                </div>
            </div>


            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                <div class="div-square">
                    <g:link action="index" controller="order">
                        <i class="fa fa-opera fa-5x"></i>
                        <h5>Orders</h5>
                    </g:link>
                </div>
            </div>




    </div>

        </div>
        <!-- /. ROW  -->

</body>
</html>

