$(function () {

    //jquery no conflict
    jQuery.noConflict();

    //csrf
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function (e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });

    //dialogo info global
    var dialogoInfoGlobalVisible = $('#dialogoInfoGlobalVisible');
    if(dialogoInfoGlobalVisible && dialogoInfoGlobalVisible.val()) {
        showDialogoInfoGlobal();
    }

});

//funciones dialogo info global

function showDialogoInfoGlobal() {
    $('#dialogoInfoGlobal').modal('show');
}
