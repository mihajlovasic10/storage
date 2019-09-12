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

          <!-- Topbar Search -->
          <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" action="home" method="GET">
            <div class="input-group">
              <input type="text" name="search" class="form-control bg-light border-0 small" placeholder="Search for item..." aria-label="Search" aria-describedby="basic-addon2">
              <div class="input-group-append">
                <button class="btn btn-primary" type="submit">
                  <i class="fa fa-search"></i> Search
                </button>
              </div>
            </div>
          </form>

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

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <% String role = (String) request.getSession().getAttribute("role"); %>
          <h1 class="h3 mb-2 text-gray-800">Warehouse items</h1>
          <% if ("ROLE_ADMIN".equals(role)) { %>
            <p class="mb-4">User can perform all actions on the storage items.</p>
          <% } %>
          <% if (!"ROLE_ADMIN".equals(role)) { %>
            <p class="mb-4">User can fetch and modify data of the storage items.</p>
          <% } %>
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Items currently in storage</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered text-center" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>Name</th>
                      <th>Total Items</th>
                      <th>Unit of Measure</th>
                      <th>Total Price</th>
                      <th>Options</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>Name</th>
                      <th>Total Items</th>
                      <th>Unit of Measure</th>
                      <th>Total Price</th>
                      <th>Options</th>
                    </tr>
                  </tfoot>
                  <tbody>
                    <c:forEach items="${items}" var="item">
                      <tr>
                        <td>${item.name}</td>
                        <td>${item.total}</td>
                        <td>${item.unitOfMesure}</td>
                        <td>${item.totalPrice}$</td>
                        <td>
                        <div>
                          <form class="btn" action="home" method="GET">
                            <button name="edit" class="btn btn-success" value=${item.id} type="submit">
                              <i class="fa fa-pencil"></i>
                            </button>
                          </form>
                          <% if ("ROLE_ADMIN".equals(role)) { %>
                            <form class="btn" action="home" method="GET">
                              <button class="btn btn-danger" name="delete" value=${item.id} type="submit">
                                <i class="fa fa-close"></i>
                              </button>
                            </form>
                          <% } %>
                          </div>
                        </td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <% if (request.getAttribute("edit") != null) { %>

      <!-- The Modal -->
      <div class="modal">

      <!-- Modal content -->
      <div class="modal-content">
        <form action="home" method="POST">
            <button type="submit" name="close" class="close">&times;</button>
        </form>
        <form id="form-edit" action="home" method="POST">
          <input type="hidden" class="form-control" name="edit-id" required  value=${edit.id}>
          <div class="form-group">
            <label>Name</label>
            <input type="text" class="form-control" name="edit-name" required  value=${edit.name}>
          </div>
          <div class="form-group">
            <label>Total number</label>
            <input class="form-control" name="edit-total" required value=${edit.total}>
          </div>
          <div class="form-group">
            <label>Unit of mesure</label>
            <input class="form-control" name="edit-unit-of-mesure" required value=${edit.unitOfMesure}>
          </div>
          <div class="form-group">
            <label>Total price</label>
            <input class="form-control" name="edit-total-price" required value=${edit.totalPrice}>
          </div>
          <button type="submit" class="btn btn-primary btn-block"><i class="fa fa-save"></i> Save</button>
        </form>
      </div>

    </div>

  <% } %>

  <% if (request.getAttribute("create") != null) { %>

        <!-- The Modal -->
        <div class="modal">

        <!-- Modal content -->
        <div class="modal-content">
          <form action="home" method="POST">
            <button type="submit" name="close" class="close">&times;</button>
          </form>
          <form id="form-create" action="home" method="POST">
            <input type="hidden" class="form-control" name="create-id" required  value="1">
            <div class="form-group">
              <label>Name</label>
              <input type="text" class="form-control" name="create-name" required >
            </div>
            <div class="form-group">
              <label>Total number</label>
              <input class="form-control" name="create-total" required>
            </div>
            <div class="form-group">
              <label>Unit of mesure</label>
              <input class="form-control" name="create-unit-of-mesure" required>
            </div>
            <div class="form-group">
              <label>Total price</label>
              <input class="form-control" name="create-total-price" required>
            </div>
            <button type="submit" class="btn btn-primary btn-block"><i class="fa fa-save"></i> Save</button>
          </form>
        </div>

      </div>

    <% } %>

    <% if ("ROLE_ADMIN".equals(role)) { %>
        <form class="container text-center" action="home" method="GET">
            <button class="btn btn-primary mb-5" type="submit" name="create" value="create">
                <i class="fa fa-plus"></i> Create new item
            </button>
        <form>
    <% } %>

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
