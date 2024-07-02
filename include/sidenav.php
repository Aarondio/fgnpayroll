<!-- Sidebar -->
<div class="sidebar" id="sidebar">
    <div class="sidebar-inner slimscroll">
        <div id="sidebar-menu" class="sidebar-menu">
            <ul>
                <li class="menu-title">
                    <span>Main</span>
                </li>
                <li class="">
                    <a href="index.php"><i class="la la-dashboard"></i> <span> Dashboard</span></a>

                </li>

                <li class="menu-title">
                    <span>Employees</span>
                </li>
                <li class="submenu">
                    <a href="#" class="noti-dot"><i class="la la-user"></i> <span> Employees</span> <span
                            class="menu-arrow"></span></a>
                    <ul style="display: none;">
                        <?php 
                      if(isset($_SESSION['admin_status'])){

                    ?>
                        <li><a href="daily_task.php">Daily Task</a></li>
                        <li><a href="approval.php">Approval</a></li>

                        <?php
                      }
                        ?>
                        <li><a href="employees.php">All Employees</a></li>


                        <!-- <li><a href="leaves.php">Leaves</a></li> -->
                        <?php 
                      if(isset($_SESSION['admin_status'])){

                    ?>
                        <li><a href="attendance.php">Attendance (Admin)</a></li>
                        <?php
}?>
                        <li><a href="adminattendance.php">My Attendance</a></li>


                    </ul>
                </li>

                <li class="menu-title">
                    <span>HR</span>
                </li>
              

                <li class="submenu">
                    <a href="#"><i class="la la-files-o"></i> <span> Hirerachy </span> <span
                            class="menu-arrow"></span></a>
                    <ul style="display: none;">
                    <?php
                            if(isset($_SESSION['admin_status'])){
                            ?>
                        <li><a href="position.php">Position</a></li>
                        <?php
                            }
                            ?>
                      
                    </ul>
                </li>
                <li class="submenu">
                    <a href="#"><i class="la la-money"></i> <span> Payroll </span> <span class="menu-arrow"></span></a>
                    <ul style="display: none;">
                        <li><a href="salary.php"> Employee Salary </a></li>
                        <li><a href="allawance.php">Allowance </a></li>
                
                        <!-- payroll page for further work to do -->
                      

                    </ul>
                </li>



                <li class="menu-title">
                    <span>Administration</span>
                </li>
                <li>
                    <a href="asset.php"><i class="la la-object-ungroup"></i> <span>Assets</span></a>
                </li>

                <li>
                    <a href="users.php"><i class="la la-user-plus"></i> <span>Users</span></a>
                </li>

                <li>
                    <a href="attendance.php"><i class="la la-user-plus"></i> <span>Attendance</span></a>
                </li>
               


            </ul>
        </div>
    </div>
</div>
<!-- /Sidebar -->