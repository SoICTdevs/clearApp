jQuery(function(){
    var departments;
    $('#student_department_id').parent().hide();
    departments = $('#student_department_id').html();
    return $('#student_school_id').change(function(){
        var school, options;
        school = $('#student_school_id :selected').text();
        options = $(departments).filter("optgroup[label=" + school + "]").html();
        if(options){
            $('#student_department_id').html(options);
            return $('#student_department_id').parent().show();           
        }else{
            $('#student_department_id').empty();
            return $('#student_department_id').parent().hide();
        }
    });
});