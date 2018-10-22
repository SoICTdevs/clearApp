jQuery(function(){
    var departments;
    $('#application_department_id').parent().hide();
    departments = $('#application_department_id').html();
    return $('#application_school_id').change(function(){
        var school, options;
        school = $('#application_school_id :selected').text();
        options = $(departments).filter("optgroup[label=" + school + "]").html();
        if(options){
            $('#application_department_id').html(options);
            return $('#application_department_id').parent().show();           
        }else{
            $('#application_department_id').empty();
            return $('#application_department_id').parent().hide();
        }
    });
});