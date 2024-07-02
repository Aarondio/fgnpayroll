<?php include('include/header.php') ?>
<?php include('include/connection.php') ?>
<?php

session_start();
function display_msg($message) {
    // Display message
    echo "<script>alert('$message');</script>";
}

$msg = "";
if(isset($_POST['submit']))
{
    extract($_POST);
    
   
	$name = $_POST['name'];
	$email = $_POST['email'];
	$empId = $_POST['empId'];
	$joiningDate = $_POST['joiningDate'];
	$phone = $_POST['phone'];
	$department = $_POST['department'];
	$password = $_POST['password'];
	$cpassword = $_POST['cpassword'];  
    $account = $_POST['account'];
    $bank = $_POST['bank'];

	//$sql =   "INSERT INTO assets( `name`, `email`, `purchase_date`, `amount`, `condition`, `manufacturer`, `sn`, `supplier`, `user`, `status`) VALUES ('$name','$assetID','$purchase_date','$amount','$condition','$manufacturer','$sn','$supplier','$user','$status')";

    $sql=mysqli_query($conn,"SELECT * FROM employee where email='$email'");
    $row  = mysqli_fetch_array($sql);
    if(is_array($row))
    {
        $msg = "Email Already registered";
     
    }else if($password != $cpassword){
        $msg = "password does not match";
    }
    else
    {
        $encPass = md5($pass);
		$sql = "INSERT INTO employee( `name`, `email`, `empID`, `joiningDate`, `phone`, `department`, `password`, `account`, `bank`) VALUES ('$name','$email','$empId','$joiningDate','$phone','$department','$password','$account','$bank')";
        if(mysqli_query($conn,$sql)){
            display_msg("Registeration successful");
            header("Location: login.php");  
        }
    }
}


?>

<body>
    <!-- Main Wrapper -->
    <div class="main-wrapper">

    <?php
include('./include/nav.php');
include('./include/sidenav.php');
?>


        <!-- Page Wrapper -->
        <div class="page-wrapper">

            <!-- Page Content -->
            <div class="content container-fluid">

                <!-- Page Header -->
                <div class="page-header">
                    <div class="row align-items-center">
                        <div class="col">
                            <h3 class="page-title">Unpaid Employee Loan</h3>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.php">Dashboard</a></li>
                                <li class="breadcrumb-item active">Employee</li>
                            </ul>
                        </div>
                        <!-- <div class="col-auto float-right ml-auto">
                            <a href="#" class="btn add-btn" data-toggle="modal" data-target="#add_employee"><i class="fa fa-plus"></i> Add Employee</a>
                           
                        </div> -->
                    </div>
                </div>
                <!-- /Page Header -->


                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table class="table table-striped custom-table datatable">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Employee ID</th>
                                        <th>level</th>
                                        <th>salary</th>
                                        <th class="text-nowrap">Loan Amount</th>
<!--                                     
                                        <th class="text-right no-sort">Action</th> -->
                                    </tr>
                                </thead>
                                <tbody>


                                    <?php 
                                    $result = mysqli_query($conn,"SELECT  employee.id,employee.empID,employee.name,employee.email,employee.joiningDate, salary.salary,salary.empID,salary.hra,salary.loan,salary.basic,salary.level
                                    FROM employee INNER JOIN salary ON employee.empID = salary.empID WHERE salary.loan> 0");
                                   
                                   //$result = mysqli_query($conn,"SELECT  salary.salary,salary.empID,salary.hra,salary.loan,salary.basic,salary.level, employee.name where loan > 0");

                                  
                                  while($row = mysqli_fetch_array($result)){?>

                                    <tr>
                                    <td>
                                            <?php echo $row['name']  ?>
                                        </td>
                                        <td>
                                            <h2 class="table-avatar">
                                                <a href="#" class="avatar"><img alt="" src="assets/img/profiles/avatar-10.jpg"></a>
                                                <a href="#">
                                                    <?php echo $row['empID']  ?> </a>
                                            </h2>
                                        </td>
                                        <td>
                                            <?php echo $row['level']  ?>
                                        </td>
                                        <td>
                                            <?php echo $row['salary']  ?>
                                        </td>
                                        <td>
                                            <?php echo $row['loan']  ?>
                                        </td>
                                        
                                      
                                        <!-- <td class="text-right">
                                            <div class="dropdown dropdown-action">
                                                <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
                                                <div class="dropdown-menu dropdown-menu-right">
                                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#edit<?php echo $row['id']; ?>"><i class="fa fa-pencil m-r-5"></i> Edit</a>
                                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete<?php echo $row['id'] ?>"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
                                                </div>
                                            </div>
                                        </td> -->
                                    </tr>
             


                                    <?php } ?>


                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Page Content -->

            <!-- Add Employee Modal -->
            <div id="add_employee" class="modal custom-modal fade" role="dialog">
                <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Add Employee</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
                        </div>
                        <div class="modal-body">
						<p class="text-danger text-center"><?php echo $msg; ?></p>
                            <form method="post" action="task/add_employee.php">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label class="col-form-label">Full Name <span class="text-danger">*</span></label>
                                            <input class="form-control" type="text" name="name" required>
                                        </div>
                                    </div>
                                    
            
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label class="col-form-label">Email <span class="text-danger">*</span></label>
                                            <input class="form-control" type="email" name="email" required>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label class="col-form-label">Password</label>
                                            <input class="form-control" type="password" name="password" required>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label class="col-form-label">Confirm Password</label>
                                            <input class="form-control" type="password" name="cpassword" required>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label class="col-form-label">Employee ID <span class="text-danger">*</span></label>
                                            <input type="text" class="form-control"  value="<?php echo "FGN".rand(10,10000) ?>" name="empId">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label class="col-form-label">Joining Date <span class="text-danger">*</span></label>
                                            <div class="cal-icon"><input class="form-control datetimepicker" type="text" name="joiningDate" required></div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label class="col-form-label">Phone </label>
                                            <input class="form-control" type="text" name="phone" required>
                                        </div>
                                    </div>
                   
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Department <span class="text-danger">*</span></label>
                                            <select class="select" name="department">
											<?php 

													$result = mysqli_query($conn,"SELECT * FROM department");
														$i=1;
													while($row = mysqli_fetch_array($result)) {?>
													  <option value="<?php echo $row['name'] ?>"><?php echo $row['name'] ?></option>

													<?php }  ?>
												</select>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label class="col-form-label">Account Number </label>
                                            <input class="form-control" type="number" name="account" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Bank <span class="text-danger">*</span></label>
                                            <select class="select" name="bank">
                                                        <option selected>Choose Your Bank</option>
                                                        <option value="access">Access Bank</option>
                                                        <option value="citibank">Citibank</option>
                                                        <option value="diamond">Diamond Bank</option>
                                                        <option value="ecobank">Ecobank</option>
                                                        <option value="fidelity">Fidelity Bank</option>
                                                        <option value="firstbank">First Bank</option>
                                                        <option value="fcmb">First City Monument Bank (FCMB)</option>
                                                        <option value="gtb">Guaranty Trust Bank (GTB)</option>
                                                        <option value="heritage">Heritage Bank</option>
                                                        <option value="keystone">Keystone Bank</option>
                                                        <option value="polaris">Polaris Bank</option>
                                                        <option value="providus">Providus Bank</option>
                                                        <option value="stanbic">Stanbic IBTC Bank</option>
                                                        <option value="standard">Standard Chartered Bank</option>
                                                        <option value="sterling">Sterling Bank</option>
                                                        <option value="suntrust">Suntrust Bank</option>
                                                        <option value="union">Union Bank</option>
                                                        <option value="uba">United Bank for Africa (UBA)</option>
                                                        <option value="unity">Unity Bank</option>
                                                        <option value="wema">Wema Bank</option>
                                                        <option value="zenith">Zenith Bank</option>
											</select>
                                        </div>
                                    </div>
                                 
                                </div>

                                <div class="submit-section">
                                    <button class="btn btn-primary submit-btn" name="submit">Submit</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Add Employee Modal -->

          

            <!-- Delete Employee Modal -->
            <div class="modal custom-modal fade" id="delete_employee" role="dialog">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div class="form-header">
                                <h3>Delete Employee</h3>
                                <p>Are you sure want to delete?</p>
                            </div>
                            <div class="modal-btn delete-action">
                                <div class="row">
                                    <div class="col-6">
                                        <a href="javascript:void(0);" class="btn btn-primary continue-btn">Delete</a>
                                    </div>
                                    <div class="col-6">
                                        <a href="javascript:void(0);" data-dismiss="modal" class="btn btn-primary cancel-btn">Cancel</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Delete Employee Modal -->

        </div>
        <!-- /Page Wrapper -->

    </div>
    <!-- /Main Wrapper -->

    <!-- jQuery -->
    <script src="assets/js/jquery-3.2.1.min.js"></script>

    <!-- Bootstrap Core JS -->
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>

    <!-- Slimscroll JS -->
    <script src="assets/js/jquery.slimscroll.min.js"></script>

    <!-- Select2 JS -->
    <script src="assets/js/select2.min.js"></script>

    <!-- Datetimepicker JS -->
    <script src="assets/js/moment.min.js"></script>
    <script src="assets/js/bootstrap-datetimepicker.min.js"></script>

    <!-- Datatable JS -->
    <script src="assets/js/jquery.dataTables.min.js"></script>
    <script src="assets/js/dataTables.bootstrap4.min.js"></script>

    <!-- Custom JS -->
    <script src="assets/js/app.js"></script>

</body>

</html>