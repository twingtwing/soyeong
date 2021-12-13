(function ($) {
    jQuery(".CS-valide").validate({
        ignore: [],
        errorClass: "invalid-feedback animated fadeInDown",
        errorElement: "div",
        errorPlacement: function (e, a) {
            jQuery(a).parents(".form-group > div").append(e)
        },
        highlight: function (e) {
            jQuery(e).closest(".form-group").removeClass("is-invalid").addClass("is-invalid")
        },
        success: function (e) {
            jQuery(e).closest(".form-group").removeClass("is-invalid"), jQuery(e).remove()
        },
        rules: {
            "fTitle": {
                required: !0,
                minlength: 2
            },
            "fAnswer": {
                required: !0,
                minlength: 2
            }
        },
        messages: {
            "fTitle": {
                required: "Please enter Title",
                minlength: "Title must consist of at least 2 characters"
            },
            "fAnswer": {
                required: "Please enter Answer",
                minlength: "Answer must consist of at least 2 characters"
            }
        }
    });
})(jQuery);