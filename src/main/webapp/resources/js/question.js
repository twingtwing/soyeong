$(document).ready(function(){
    
    (function($) {
        "use strict";

		//목록 버튼 클릭 시 레이아웃 전환
        $('.btn-Q').on('click', function () {
            $('.btn-Q').toggleClass('active-Q');
            $('.btn-Q-div').toggleClass('d-none');
        });

        //접기 펼치기
        //다른곳에도 collapse 사용하면 변수명 변경해야함
        $('.collapse.collapse-Q:not(.collapse-remove)').on("show.bs.collapse", function () {
            $('a[href="#' + $(this).attr('id') + '"]').html('<i class="fas fa-chevron-down"></i>');
        });

        $('.collapse.collapse-Q:not(.collapse-remove)').on("hide.bs.collapse", function () {
            $('a[href="#' + $(this).attr('id') + '"]').html('<i class="fas fa-chevron-up"></i>');
        });

        //더보기 접기 펼치기
        $('.collapse.collapse-Q-more').on("show.bs.collapse", function () {
            $('a[href="#' + $(this).attr('id') + '"]').remove();
        });

    
        jQuery.validator.addMethod('answercheck', function (value, element) {
            return this.optional(element) || /^\bcat\b$/.test(value)
        }, "type the correct answer -_-");

        // validate question.html(frm-Q) form
        $(function () {
            $('#frm-Q').validate({
                rules: {
                    qTitle: {
                        required: true,
                        minlength: 1
                    },
                    qAnswer: {
                        required: true,
                    },
                    qEmail: {
                        required: true,
                        email: true
                    }
                },
                messages: {
                    qTitle: {
                        required: "Please enter the title.",
                        minlength: "The title must consist of at least 2 characters"
                    },
                    qAnswer: {
                        required: "Please enter the contents."
                    },
                    qEmail: {
                        required: "Please enter your email address"
                    }
                },
                //ajax
                submitHandler: function (form) {
                    $(form).ajaxSubmit({
                        type: form.method,
                        data: $(form).serialize(),
                        url: form.action,
                        success: function () {
                            $('#frm-Q :input').attr('disabled', 'disabled');
                            $('#frm-Q').fadeTo("slow", 1, function () {
                                $(this).find(':input').attr('disabled', 'disabled');
                                $(this).find('label').css('cursor', 'default');
                                $('#success').fadeIn()
                                $('.modal').modal('hide');
                                $('#success').modal('show');
                                //값 모두 사라지는지 확인하기
                            })
                        },
                        error: function () {
                            $('#frm-Q').fadeTo("slow", 1, function () {
                                $('#error').fadeIn()
                                $('.modal').modal('hide');
                                $('#error').modal('show');
                            })
                        }
                    })
                }
            })
        })
        
    })(jQuery);
})