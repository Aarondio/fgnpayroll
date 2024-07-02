<?php 
  session_start();
  if(!isset($_SESSION['ID']) || !isset($_SESSION['Email']) )      // if there is no valid session
{
    header("Location: login.php");
}

?>

<?php include('include/header.php') ?>

<?php include 'include/connection.php';?>

<?php
				 // starting a session
				$ID= $_SESSION["ID"];
				$sql=mysqli_query($conn,"SELECT * FROM employee where ID='$ID' ");
				$row  = mysqli_fetch_array($sql);
                if(is_array($row)) {
                    $_SESSION["ID"] = $row['id'];
                   $_SESSION["name"]=$row['name'];
               }
 ?>

<!--End of header-->
<?php include('include/nav.php') ?>
<?php include('include/sidenav.php') ?>

<!-- Page Wrapper -->
<div class="page-wrapper">

    <!-- Page Content -->
    <div class="content container-fluid">

        <!-- Page Header -->
        <div class="page-header">
            <div class="row">
                <div class="col-sm-12">
                    <h3 class="page-title">Welcome <?php echo $_SESSION["name"]; ?>,</h3>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item active">Dashboard</li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- /Page Header -->

        <div class="row">
            <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                <div class="card dash-widget">
                    <div class="card-body">
                        <span class="dash-widget-icon"><i class="fa fa-users"></i></span>
                        <div class="dash-widget-info">
                            <!-- <h3>112</h3> -->
                            <span><a href="employees.php" class="text-white">Employee Management</a></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                <div class="card dash-widget">
                    <div class="card-body">
                        <span class="dash-widget-icon"><i class="fa fa-building-o"></i></span>
                        <div class="dash-widget-info">

                            <span><a href="department.php" class="text-white">Department Management</a></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                <div class="card dash-widget">
                    <div class="card-body">
                        <span class="dash-widget-icon"><i class="fa fa-diamond"></i></span>
                        <div class="dash-widget-info">
                            <span><a href="asset.php" class="text-white">Asset Management</a></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                <div class="card dash-widget">
                    <div class="card-body">
                        <span class="dash-widget-icon"><i class="fa fa-bank"></i></span>
                        <div class="dash-widget-info">
                            <span><a href="salary.php" class="text-white">Salary Management</a></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--Second Row admin functionality-->

        <div class="row justify-content-center align-items-center">
            <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                <div class="card dash-widget">
                    <div class="card-body">
                        <span class="dash-widget-icon"><i class="fa fa-clock-o"></i></span>
                        <div class="dash-widget-info">
                            <span><a href="adminattendance.php" class="text-white">Admin Attendance</a></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                <div class="card dash-widget">
                    <div class="card-body">
                        <span class="dash-widget-icon"><i class="fa fa-user"></i></span>
                        <div class="dash-widget-info">
                            <span><a href="users.php" class="text-white">Users Management</a></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                <div class="card dash-widget">
                    <div class="card-body">
                        <span class="dash-widget-icon"><i class="fa fa-star"></i></span>
                        <div class="dash-widget-info">
                            <span><a href="loan.php" class="text-white">Loan Management</a></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                <div class="card dash-widget">
                    <div class="card-body">
                        <span class="dash-widget-icon"><i class="fa fa-bar-chart"></i></span>
                        <div class="dash-widget-info">
                            <span><a href="attendance.php" class="text-white">View Employee Attendance</a></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>
</div>
    <!-- /Page Wrapper -->



<?php include('include/footer.php') ?>