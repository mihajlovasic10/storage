<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <% String ctx = request.getContextPath(); %>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>WAREHOUSE</title>

  <!-- Bootstrap -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" type="text/css">

  <!-- Custom fonts for this template-->
  <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="<%=ctx%>/css/sb-admin-2.min.css" rel="stylesheet">

    <style>

        body {
            width: 100vw;
            height: 100vh;
            position: relative;
        }

        .background-login {
            background-image: url("https://www.conceptstorage.com/media/zoo/images/warehouse-storage-benefits-2_72950a00bc17dda4f85c445ee2ef68c3.jpg");
            background-size: cover;
            background-position: center;
        }

        .login-container {
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            position: absolute;
            height: 420px;
        }

    </style>

</head>

<body class="bg-info">

  <div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-6 col-lg-9 col-md-8 login-container">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-6 d-none d-lg-block container-fluid border-right background-login">
              </div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">WAREHOUSE</h1>
                  </div>
                  <form class="user" action="login" method="POST">
                    <div class="form-group">
                      <input type="email" name="email" required class="form-control form-control-user" aria-describedby="emailHelp" placeholder="Enter email address...">
                    </div>
                    <div class="form-group">
                      <input type="password" name="password" required class="form-control form-control-user" placeholder="Enter password...">
                    </div>
                    <hr>
                    <button type="submit" class="btn btn-primary btn-user btn-block">
                      <i class="fa fa-chevron-right"></i> Login
                    </button>
                  </form>
                  <div class="text-center text-danger m-2">
                     <% String error = (String) request.getAttribute("error"); %>
                     <%= error != null ? error : "" %>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>

    </div>

  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="<%=ctx%>/vendor/jquery/jquery.min.js"></script>
  <script src="<%=ctx%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="<%=ctx%>/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="<%=ctx%>/js/sb-admin-2.min.js"></script>

</body>

</html>
