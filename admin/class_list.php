<?php include'db_connect.php' ?>
<div class="col-lg-12">
	<div class="card card-outline card-primary">
		<div class="card-header">
			<div class="card-tools">
				<a class="btn btn-block btn-sm btn-default btn-flat border-primary new_class" href="javascript:void(0)"><i class="fa fa-plus"></i> <span style="color: #dc143c; font-weight: bold;">Add New</span></a>
			</div>
		</div>
		<div class="card-body">
		
			<table class="table tabe-hover table-bordered styled-table" id="list">
				<colgroup>
					<col width="5%">
					<col width="60%">
				</colgroup>
				<thead>
					<tr>
						<th class="text-center">#</th>
						<th>Class</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<?php
					$i = 1;
					$qry = $conn->query("SELECT *,concat(curriculum,' ',level,'-',section) as `class` FROM class_list order by class asc ");
					while($row= $qry->fetch_assoc()):
					?>
					<tr>
						<th class="text-center"><?php echo $i++ ?></th>
						<td><b><?php echo $row['class'] ?></b></td>
						<td class="text-center">
							<div class="btn-group">
								<a href="javascript:void(0)" data-id='<?php echo $row['id'] ?>' class="btn btn-primary btn-flat manage_class">
									<i class="fas fa-edit"></i>
								</a>
								<button type="button" class="btn btn-danger btn-flat delete_class" data-id="<?php echo $row['id'] ?>">
									<i class="fas fa-trash"></i>
								</button>
								<a class="dropdown-item class_student manage-students-btn" href="index.php?page=view_class&id=<?php echo $row['id'] ?>"><i class="fa fa-eye"></i></a>
							</div>
						</td>
					</tr>	
					<?php endwhile; ?>
				</tbody>
			</table>
		</div>
	</div>
</div>

<style>
/* Modern table styling */
table.table-bordered.dataTable tbody th, table.table-bordered.dataTable tbody td {
    border-bottom-width: 0;
    border: none;
    color: #333;
    font-weight: 500; /* Add slight boldness */
}

/* Styled table */
.styled-table tbody tr {
    border-bottom: 1px solid #dddddd;
}

.styled-table tbody tr:nth-of-type(even) {
    background-color: #f3f3f3;
}

.styled-table tbody tr:last-of-type {
    border-bottom: 2px solid #009879;
}

/* Red table header */
.card-primary.card-outline {
    border-top: none;
}

thead th {
    background-color: #9b0a1e;
    color: #f3f3f3;
    font-weight: bold;
}

/* Card header styling */
.card-header {
    background-color: transparent;
    border-bottom: none;
    padding: .75rem 1.25rem;
    position: relative;
    border-top-left-radius: .25rem;
    border-top-right-radius: .25rem;
}

/* Button styles */
.btn-primary {
    color: blue;
    background-color: transparent;
    border: none;
}
.btn-group{
	float: left;
}
.btn-danger {
    color: red;
	background-color: transparent;
    border: none;
}

.card-tools i{
    color: #dc143c;
    font-weight: bold;
}



.dropdown-item:hover{
	text-decoration: none;
	background-color: #007bff;
	color: white;
}


/* Hover effect for rows */
tbody tr:hover {
    background-color: #95d2ec;
}

.btn-primary{
    color: #007bff;
}

@media (max-width: 540px) {
	.dataTables_length,
    .dataTables_filter {
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        font-size: 0.75rem;
        margin-bottom: 0.75rem;
    }

    .dataTables_length select,
    .dataTables_filter input {
        width: 100%;
    }

    .dataTables_length label,
    .dataTables_filter label {
        font-size: 0.75rem;
    }

   
    .dataTables_paginate {
        font-size: 0.75rem;
    }

    .dataTables_paginate .paginate_button {
        padding: 0.25rem 0.5rem;
        font-size: 0.75rem;
    }
}

</style>


<script>
	$(document).ready(function(){
		$('#list').dataTable()
		$('.new_class').click(function(){
			uni_modal("New class","<?php echo $_SESSION['login_view_folder'] ?>manage_class.php")
		})
		$('.manage_class').click(function(){
			uni_modal("Manage class","<?php echo $_SESSION['login_view_folder'] ?>manage_class.php?id="+$(this).attr('data-id'))
		})
		$('.delete_class').click(function(){
			_conf("Are you sure to delete this class?","delete_class",[$(this).attr('data-id')])
		})
	})
	
	function delete_class($id){
		start_load()
		$.ajax({
			url:'ajax.php?action=delete_class',
			method:'POST',
			data:{id:$id},
			success:function(resp){
				if(resp==1){
					alert_toast("Data successfully deleted",'success')
					setTimeout(function(){
						location.reload()
					},1500)
				}
			}
		})
	}
</script>
