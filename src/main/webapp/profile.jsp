<!DOCTYPE html>
<html lang="en">

<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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

  <!-- Custom fonts for this template -->
  <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="<%=ctx%>/css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="<%=ctx%>/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

  <style>

  .background-login {
    background-image: url(${loggedUser.image});
    background-size: cover;
    background-position: center;
  }

  /* The Modal (background) */
  .modal {
    display: block; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 20vh; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  }

  /* Modal Content */
  .modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
  }

  /* The Close Button */
  .close {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
  }

  .close:hover,
  .close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
  }
  </style>

</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper bg-info">

    <nav class="navbar navbar-expand-lg navbar-light bg-info">
      <a class="navbar-brand text-light" href="#">WAREHOUSE</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item active">
            <a class="nav-link text-light" href="/storage/home"> <i class="fa fa-home"></i> Home <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-light" href="/storage/profile"> <i class="fa fa-user"></i> Profile</a>
          </li>
        </ul>
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link text-light" href="/storage/logout"> <i class="fa fa-chevron-left"></i> Logout</a>
          </li>
        </ul>
      </div>
    </nav>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <div class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link" href="#" id="userDropdown">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">${loggedUser.name}</span>
                <img class="img-profile rounded-circle" width="32" height="32" src=${loggedUser.image}>
              </a>
            </li>

          </ul>

        </div>
        <!-- End of Topbar -->

        <div class="container">

            <!-- Outer Row -->
            <div class="row justify-content-center">

              <div class="col-xl-12 col-lg-12 col-md-12">

                <div class="card o-hidden border-0 shadow-lg my-5">
                  <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                      <div class="col-lg-4 d-none d-lg-block container-fluid background-login p-3">
                      </div>
                      <div class="col-lg-8">
                        <div class="p-5">
                          <div class="text-center">
                            <h1 class="h5 text-gray-900 mb-4">Update Profile Info</h1>
                          </div>
                          <form class="user" action="profile" method="POST">
                            <div class="form-group">
                              <label>Name</label>
                               <input type="text" name="user-name" maxlength="255" required class="form-control form-control-user" value=${loggedUser.name}>
                              </div>
                            <div class="form-group">
                              <label>Email</label>
                              <input type="email" name="email" required class="form-control form-control-user" value=${loggedUser.email}>
                            </div>
                            <div class="form-group">
                              <label>Password</label>
                              <input type="text" name="password" required class="form-control form-control-user" value=${loggedUser.password}>
                            </div>
                            <div class="form-group">
                              <label>Image</label>
                              <input type="text" name="image" required class="form-control form-control-user" value=${loggedUser.image}>
                            </div>
                            <button type="submit" class="btn btn-primary btn-user btn-block">
                              <i class="fa fa-save"></i> Save changes
                            </button>
                          </form>
                          <div class="text-center text-danger">
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

  <!-- Bootstrap core JavaScript-->
  <script src="<%=ctx%>/vendor/jquery/jquery.min.js"></script>
  <script src="<%=ctx%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="<%=ctx%>/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="<%=ctx%>/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="<%=ctx%>/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="<%=ctx%>/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="<%=ctx%>/js/demo/datatables-demo.js"></script>

</body>

</html>
