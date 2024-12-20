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
    color: #007bff;
    background-color: transparent;
    border: none;
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

/* Hover effect for rows */
tbody tr:hover {
    background-color: #95d2ec;
}

@media (max-width: 540px) {
    .card-body {
        padding: 0.5rem;
    }

    .styled-table {
        font-size: 12px;
    }


    .styled-table td, .styled-table th {
        padding: 8px;
    }

    .btn-sm {
        font-size: 12px;
        padding: 5px 10px;
    }

    .new_academic {
        font-size: 12px;
        padding: 5px 10px;
    }

    .card-header {
        padding: 0.5rem 1rem;
    }

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

@media (max-width: 430px) {
    .card-body {
        padding: 0.25rem;
    }


    .styled-table {
        font-size: 10px;
    }

    .styled-table td, .styled-table th {
        padding: 2px;
    }

    .btn-sm {
        font-size: 10px;
        padding: 3px 6px;
    }

    .new_academic {
        font-size: 10px;
        padding: 3px 6px;
    }


    .table th, .table td {
        font-size: 10px;
    }

    .btn-group .btn {
        font-size: 10px;
        padding: 5px 8px;
    }

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

@media (max-width: 414px) {
    .card-body {
        padding: 0.25rem;
    }


    .styled-table {
        font-size: 10px;
    }

    .styled-table td, .styled-table th {
        padding: 2px;
    }

    .btn-sm {
        font-size: 10px;
        padding: 3px 6px;
    }

    .new_academic {
        font-size: 10px;
        padding: 3px 6px;
    }


    .table th, .table td {
        font-size: 10px;
    }

    .btn-group .btn {
        font-size: 10px;
        padding: 5px 8px;
    }

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

@media (max-width: 414px) {

    .card-body {
        padding: 0.25rem;
    }


    .styled-table {
        font-size: 9px;
    }


    .styled-table td, .styled-table th {
        padding: 4px;
    }


    .btn-sm {
        font-size: 9px;
        padding: 4px 6px;
    }


    .new_academic {
        font-size: 9px;
        padding: 4px 6px;
    }


    .btn-group .btn {
        font-size: 9px; 
        padding: 5px 8px;
    }

    .table th, .table td {
        font-size: 8px;
    }


    .btn-group {
        display: block;
        width: 100%;
        margin-top: 5px;
    }


    .new_academic {
        width: 100%;
        font-size: 9px;
    }

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

@media (max-width: 390px) {
    .card-body {
        padding: 0.25rem;
    }


    .styled-table {
        font-size: 8px;
    }

    .styled-table td, .styled-table th {
        padding: 3px;
    }


    .btn-sm {
        font-size: 8px;
        padding: 3px 5px;
    }


    .new_academic {
        font-size: 8px;
        padding: 3px 5px;
    }

    .btn-group .btn {
        font-size: 8px;
        padding: 4px 6px;
    }


    .table th, .table td {
        font-size: 7px;
    }

    .btn-group {
        display: block;
        width: 100%;
        margin-top: 5px;
    }

    .new_academic {
        width: 100%;
        font-size: 8px;
    }

    .styled-table {
        overflow-x: auto;
    }

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

@media (max-width: 375px) {
    .card-body {
        padding: 0.25rem;
    }


    .styled-table {
        font-size: 8px;
    }

    .styled-table td, .styled-table th {
        padding: 2px;
    }


    .btn-sm {
        font-size: 8px;
        padding: 3px 5px;
    }


    .new_academic {
        font-size: 8px;
        padding: 3px 5px;
    }

    .btn-group .btn {
        font-size: 8px;
        padding: 4px 6px;
    }


    .table th, .table td {
        font-size: 7px;
    }

    .btn-group {
        display: block;
        width: 100%;
        margin-top: 5px;
    }

    .new_academic {
        width: 100%;
        font-size: 8px;
    }

    .styled-table {
        overflow-x: auto;
    }

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
<?php include'db_connect.php' ?>
<div class="col-lg-12">
	<div class="card card-outline card-primary">
		<div class="card-header">
			<div class="card-tools">
				<a class="btn btn-block btn-sm btn-default btn-flat border-primary new_academic" href="javascript:void(0)"><i class="fa fa-plus"></i> <span style="color: #dc143c; font-weight: bold;">Add New</span></a>
			</div>
		</div>
		<div class="card-body">
		<table class="table tabe-hover table-bordered styled-table" id="list">
				<colgroup>
					<col width="5%">
					<col width="25%">
					<col width="25%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
				</colgroup>
				<thead>
					<tr>
						<th class="text-center">#</th>
						<th>Year</th>
						<th>Semester</th>
						<th>Active Academic Year</th>
						<th>Evaluation Status</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<?php
					$i = 1;
					$qry = $conn->query("SELECT * FROM academic_list order by abs(year) desc,abs(semester) desc ");
					while($row= $qry->fetch_assoc()):
					?>
					<tr>
						<th class="text-center"><?php echo $i++ ?></th>
						<td><b><?php echo $row['year'] ?></b></td>
						<td><b><?php echo $row['semester'] ?></b></td>
						<td class="text-center">
							<?php if($row['is_default'] == 0): ?>
								<button type="button" class="btn btn-secondary bg-gradient-secondary col-sm-4 btn-flat btn-sm px-1 py-0 make_default" data-id="<?php echo $row['id'] ?>">Inactive</button>
							<?php else: ?>
								<button type="button" class="btn btn-primary bg-gradient-primary col-sm-4 btn-flat btn-sm px-1 py-0"><span style="color: white; font-weight: bold;">Active</span></button>
							<?php endif; ?>
						</td>
						<td class="text-center">
							<?php if($row['status'] == 0): ?>
								<span class="badge badge-secondary">Not yet Started</span>
							<?php elseif($row['status'] == 1): ?>
								<span class="badge badge-success">Starting</span>
							<?php elseif($row['status'] == 2): ?>
								<span class="badge badge-primary">Closed</span>
							<?php endif; ?>
						</td>

						<td class="text-center">
		                    <div class="btn-group">
		                        <a href="javascript:void(0)" data-id='<?php echo $row['id'] ?>' class="btn btn-primary btn-flat manage_academic">
		                          <i class="fas fa-edit"></i>
		                        </a>
		                        <button type="button" class="btn btn-danger btn-flat delete_academic" data-id="<?php echo $row['id'] ?>">
		                          <i class="fas fa-trash"></i>
		                        </button>
	                      </div>
						</td>
					</tr>	
				<?php endwhile; ?>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
		$('.new_academic').click(function(){
			uni_modal("New academic","<?php echo $_SESSION['login_view_folder'] ?>manage_academic.php")
		})
		$('.manage_academic').click(function(){
			uni_modal("Manage academic","<?php echo $_SESSION['login_view_folder'] ?>manage_academic.php?id="+$(this).attr('data-id'))
		})
		$('.delete_academic').click(function(){
		_conf("Are you sure to delete this academic?","delete_academic",[$(this).attr('data-id')])
		})
		$('.make_default').click(function(){
		_conf("Are you sure to make this academic year as active?","make_default",[$(this).attr('data-id')])
		})
		$('#list').dataTable()
	})
	function delete_academic($id){
		start_load()
		$.ajax({
			url:'ajax.php?action=delete_academic',
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
	function make_default($id){
		start_load()
		$.ajax({
			url:'ajax.php?action=make_default',
			method:'POST',
			data:{id:$id},
			success:function(resp){
				if(resp==1){
					alert_toast("Active Academic Year Updated",'success')
					setTimeout(function(){
						location.reload()
					},1500)
				}
			}
		})
	}
</script>
