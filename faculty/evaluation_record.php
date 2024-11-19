<?php
include 'db_connect.php';

function ordinal_suffix($num) {
    $num = $num % 100;
    if ($num < 11 || $num > 13) {
        switch ($num % 10) {
            case 1: return $num . 'st';
            case 2: return $num . 'nd';
            case 3: return $num . 'rd';
        }
    }
    return $num . 'th';
}

// Initialize academic ID from the session
if (isset($_SESSION['academic']['id'])) {
    $academic_id = $_SESSION['academic']['id'];
} else {
    die("Academic ID not set in session.");
}

// Get the faculty ID from the session
$teacher_id = is_array($_SESSION['login_id']) ? $_SESSION['login_id']['id'] : $_SESSION['login_id'];

$evaluations = $conn->query("
    SELECT 
        sl.subject,
        CONCAT(st.firstname, ' ', st.lastname) AS student_name,
        a.year AS academic_year,
        CONCAT(cl.level, ' - ', cl.section) AS class_details,
        cl.curriculum,
        st.avatar
    FROM evaluation_list r
    LEFT JOIN subject_list sl ON r.subject_id = sl.id
    LEFT JOIN student_list st ON r.student_id = st.id
    LEFT JOIN class_list cl ON r.class_id = cl.id
    LEFT JOIN academic_list a ON r.academic_id = a.id
    WHERE r.faculty_id = '$teacher_id' AND r.academic_id = '$academic_id'
    ORDER BY st.lastname ASC
");
?>

<div class="col-lg-12">
    <div class="card card-outline card-success">
        <div class="card-header">
            <h3 class="text-center" style="font-weight: bold; color: #dc143c;">Student Who Evaluated</h3>
            <div class="input-group mb-3" style="max-width: 20%; margin-left: auto;">
                <input type="text" class="form-control" id="search-input" placeholder="Search..." aria-label="Search">
                <div class="input-group-append">
                    <span class="input-group-text"><i class="fa fa-search"></i></span>
                </div>
            </div>
        </div>
        <div class="card-body">
            <table class="table table-hover table-bordered styled-table" id="evaluation-table">
                <thead>
                    <tr>
                        <th>Student Name</th>
                        <th>Subject</th>
                        <th>Academic Year</th>
                        <th>Class</th>
                    </tr>
                </thead>
                <tbody id="evaluation-table-body">
                    <?php while ($row = $evaluations->fetch_assoc()): 
                        $avatar = !empty($row['avatar']) ? 'assets/uploads/' . $row['avatar'] : 'assets/uploads/default_avatar.png';
                    ?>
                    <tr>
                        <td><?php echo ucwords($row['student_name']); ?></td>
                        <td><?php echo $row['subject']; ?></td>
                        <td><?php echo $row['academic_year'] . ' ' . ordinal_suffix($_SESSION['academic']['semester']) . ' Semester'; ?></td>
                        <td><?php echo $row['curriculum'] . ' (' . $row['class_details'] . ')'; ?></td>
                    </tr>
                    <?php endwhile; ?>
                </tbody>
            </table>

            <div class="mb-3" style="width: 100px; margin-left: auto; float: left;">
                <select id="rows-per-page" class="form-control">
                    <option value="5">5 rows</option>
                    <option value="10">10 rows</option>
                    <option value="15">15 rows</option>
                    <option value="20">20 rows</option>
                </select>
            </div>
            <div id="pagination-controls" class="mt-3 d-flex justify-content-end"></div>
        </div>
    </div>
</div>
<style>
    .styled-table tbody tr {
        border-bottom: 1px solid #dddddd;
    }
    .styled-table tbody tr:nth-of-type(even) {
        background-color: #f3f3f3;
    }
    .styled-table tbody tr:last-of-type {
        border-bottom: 2px solid #009879;
    }
    thead th {
        background-color: #9b0a1e;
        color: #f3f3f3;
        font-weight: bold;
    }
    tbody tr:hover {
        background-color: #95d2ec;
    }

    .card-success.card-outline{
        border-top: 3px solid #9b0a1e !important;
    }

    @media (max-width: 540px) {
    .callout.callout-info {
        padding: 10px;
        font-size: 14px;
    }

    .btn-info {
        font-size: 12px;
    }

    .card-body {
        padding: 10px;
    }

    .table th, .table td {
        font-size: 12px;
        padding: 8px;
    }

    .font-weight-bold {
        font-size: 14px;
    }

    .ml-3 h5 {
        font-size: 20px;
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
    .callout.callout-info {
        padding: 8px;
        font-size: 12px;
    }

    .input-group.mb-3 {
        max-width: 90%;
    }

    .btn-info {
        font-size: 10px;
        padding: 5px 10px;
    }

    .card-body {
        padding: 8px;
    }

    .table th, .table td {
        font-size: 10px;
        padding: 6px;
    }

    .font-weight-bold {
        font-size: 12px;
    }

    .ml-3 h5 {
        font-size: 18px;
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
    .callout.callout-info {
        padding: 6px;
        font-size: 10px;
    }

    .input-group.mb-3 {
        max-width: 95%;
    }

    .btn-info {
        font-size: 9px;
        padding: 4px 8px;
    }

    .card-body {
        padding: 6px;
    }

    .table th, .table td {
        font-size: 9px;
        padding: 5px;
    }

    .font-weight-bold {
        font-size: 10px;
    }

    .ml-3 h5 {
        font-size: 16px;
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


<script>
    $(document).ready(function() {
        $('#evaluation-table').dataTable();
        
        let rowsPerPage = 5;
        let currentPage = 1;

        $('#search-input').on('keyup', function() {
            let value = $(this).val().toLowerCase();
            filterTableRows(value);
        });

        $('#rows-per-page').on('change', function() {
            rowsPerPage = parseInt($(this).val());
            currentPage = 1;
            paginateTableRows();
        });

        function filterTableRows(query) {
            $('#evaluation-table-body tr').each(function() {
                $(this).toggle($(this).text().toLowerCase().indexOf(query) > -1);
            });
            paginateTableRows();
        }

        function paginateTableRows() {
            const rows = $('#evaluation-table-body tr');
            const totalRows = rows.length;
            const totalPages = Math.ceil(totalRows / rowsPerPage);
            rows.hide();

            const start = (currentPage - 1) * rowsPerPage;
            const end = start + rowsPerPage;
            rows.slice(start, end).show();

            renderPaginationControls(totalPages);
        }

        function renderPaginationControls(totalPages) {
            $('#pagination-controls').empty();

            const prevButton = $('<button></button>')
                .text('Previous')
                .prop('disabled', currentPage === 1)
                .on('click', function() {
                    if (currentPage > 1) {
                        currentPage--;
                        paginateTableRows();
                    }
                });

            const nextButton = $('<button></button>')
                .text('Next')
                .prop('disabled', currentPage === totalPages)
                .on('click', function() {
                    if (currentPage < totalPages) {
                        currentPage++;
                        paginateTableRows();
                    }
                });

            $('#pagination-controls').append(prevButton);

            for (let i = 1; i <= totalPages; i++) {
                const btn = $('<button></button>')
                    .text(i)
                    .addClass(i === currentPage ? 'active' : '')
                    .on('click', function() {
                        currentPage = i;
                        paginateTableRows();
                    });
                $('#pagination-controls').append(btn);
            }

            $('#pagination-controls').append(nextButton);
        }

        paginateTableRows();
    });
</script>