<?php
session_start();
include '../db_connect.php';

if (!isset($_SESSION['login_id'])) {
    echo 'Login ID not found. Please log in.';
    exit;
}

$faculty_id = $_SESSION['login_id'];

// Fetch faculty name
$stmt = $conn->prepare("SELECT *, CONCAT(firstname, ' ', lastname) AS name FROM faculty_list WHERE id = ?");
$stmt->bind_param("i", $faculty_id);
$stmt->execute();
$result = $stmt->get_result();
$faculty = $result->fetch_assoc();
$faculty_name = $faculty['name'];

// Fetch active academic year
$active_academic_query = "SELECT id, year FROM academic_list WHERE status = 1";
$active_academic_result = $conn->query($active_academic_query);
$active_academic = $active_academic_result->fetch_assoc();

$active_academic_id = isset($active_academic['id']) ? $active_academic['id'] : '';
$active_academic_year = isset($active_academic['year']) ? $active_academic['year'] : 'No Active Academic Year';

// Fetch all classes associated with the faculty
$class_query = "
    SELECT 
        cl.id AS class_id,
        CONCAT(cl.curriculum, ' ', cl.level, ' - ', cl.section) AS class_name
    FROM class_list cl
    WHERE FIND_IN_SET(?, cl.faculty_id) > 0
";

$stmt = $conn->prepare($class_query);
$stmt->bind_param("i", $faculty_id);
$stmt->execute();
$class_result = $stmt->get_result();

$c_arr = [];
while ($row = $class_result->fetch_assoc()) {
    $c_arr[$row['class_id']] = $row['class_name'];
}

// Fetch all subjects
$subject_query = "
    SELECT 
        sl.id AS subject_id,
        CONCAT(sl.code, ' - ', sl.subject) AS subject_name
    FROM subject_list sl
";

$stmt = $conn->prepare($subject_query);
$stmt->execute();
$subject_result = $stmt->get_result();

$subjects = [];
while ($row = $subject_result->fetch_assoc()) {
    $subjects[] = $row;
}
?>

<!-- HTML and JavaScript for Form Submission -->
<div class="container-fluid">
    <form action="" id="manage-restriction-<?php echo htmlspecialchars($faculty_id); ?>">
        <input type="hidden" name="faculty_id" value="<?php echo htmlspecialchars($faculty_id); ?>">
        
        <!-- Modal Header -->
        <div class="modal-header">
            <h5>Add subject</h5>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>

        <!-- Modal Body -->
        <div class="modal-body">
            <div class="row" style="gap:15px">
                <!-- Class Dropdown -->
                <div class="form-group">
                    <label for="class_id" class="control-label">Class</label>
                    <select name="class_id" id="class_id-<?php echo htmlspecialchars($faculty_id); ?>" class="form-control form-control-sm select2" required>
                        <option value="">Select Class</option>
                        <?php foreach ($c_arr as $class_id => $class_name): ?>
                            <option value="<?php echo htmlspecialchars($class_id); ?>">
                                <?php echo htmlspecialchars($class_name); ?>
                            </option>
                        <?php endforeach; ?>
                    </select>
                </div>
  
                <!-- Subject Dropdown -->
                <div class="form-group">
                    <label for="subject_id" class="control-label">Subject</label>
                    <select name="subject_id" id="subject_id-<?php echo htmlspecialchars($faculty_id); ?>" class="form-control form-control-sm select2" required disabled>
                        <option value="">Select Subject</option>
                        <?php foreach ($subjects as $subject): ?>
                            <option value="<?php echo htmlspecialchars($subject['subject_id']); ?>">
                                <?php echo htmlspecialchars($subject['subject_name']); ?>
                            </option>
                        <?php endforeach; ?>
                    </select>
                </div>
            </div>
        </div>
    </form>
</div>

<script>
    $(document).ready(function() {
        // Enable the subject dropdown only after a class is selected
        $('#class_id-<?php echo htmlspecialchars($faculty_id); ?>').change(function() {
            var selectedClass = $(this).val();
            if (selectedClass) {
                $('#subject_id-<?php echo htmlspecialchars($faculty_id); ?>').prop('disabled', false);
            } else {
                $('#subject_id-<?php echo htmlspecialchars($faculty_id); ?>').prop('disabled', true);
            }
        });
    });

    $('#manage-restriction-<?php echo htmlspecialchars($faculty_id); ?>').submit(function(e) {
        e.preventDefault();
        $('input, select').removeClass("border-danger");

        var classSelected = $('#class_id-<?php echo htmlspecialchars($faculty_id); ?>').val();
        var subjectSelected = $('#subject_id-<?php echo htmlspecialchars($faculty_id); ?>').val();

        if (!classSelected) {
            $('#class_id-<?php echo htmlspecialchars($faculty_id); ?>').addClass("border-danger");
            alert_toast('Please select a class.', "warning");
            return false;
        }
        if (!subjectSelected) {
            $('#subject_id-<?php echo htmlspecialchars($faculty_id); ?>').addClass("border-danger");
            alert_toast('Please select a subject.', "warning");
            return false;
        }

        start_load();
        const formData = new FormData($(this)[0]);
        formData.append('academic_id', '<?php echo htmlspecialchars($active_academic_id); ?>');

        $.ajax({
            url: 'ajax.php?action=save_restriction',
            data: formData,
            cache: false,
            contentType: false,
            processData: false,
            method: 'POST',
            success: function(resp) {
                if (resp == 1) {
                    alert_toast('Restriction successfully saved.', "success");
                    setTimeout(function() {
                        location.replace('index.php?page=subject');
                    }, 750);
                } else if (resp == 2) {
                    alert_toast('Duplicate class and subject combination found.', "warning");
                    end_load();
                } else if (resp == 3) {
                    alert_toast('Duplicate entry for this faculty ID.', "warning");
                    end_load();
                } else {
                    alert_toast('Failed to save restriction.', "error");
                    end_load();
                }
            },
            error: function() {
                alert_toast('An error occurred. Please try again.', "error");
                end_load();
            }
        });
    });
</script>
