$(document).ready(function(){
    
    (function($) {
        "use strict";

		//목록 버튼 클릭 시 레이아웃 전환
        $('.btn-Q').on('click',function () {
			if(!$(this).hasClass('active-Q')){
           		$('.btn-Q').toggleClass('active-Q');
            	$('.btn-Q-div').toggleClass('d-none');
				if($(this).index() === 1){
					$('.collapse.collapse-Q').collapse('hide');
					$('.collapse.collapse-Q-more').collapse('hide');
				}else{
					$('.more-collapse').show();
				}
			}
        });

        //접기 펼치기
        //다른곳에도 collapse 사용하면 변수명 변경해야함
        $('.collapse.collapse-Q:not(.collapse-remove)').on("show.bs.collapse", function () {
            $('a[href="#' + $(this).attr('id') + '"]:not(.notcol)').html('<i class="fas fa-chevron-down"></i>');
        });

        $('.collapse.collapse-Q:not(.collapse-remove)').on("hide.bs.collapse", function () {
            $('a[href="#' + $(this).attr('id') + '"]:not(.notcol)').html('<i class="fas fa-chevron-up"></i>');
        });

        //더보기 접기 펼치기
        $('.collapse.collapse-Q-more').on("show.bs.collapse", function () {
            $('a[href="#' + $(this).attr('id') + '"]').hide();
        });
    
        jQuery.validator.addMethod('answercheck', function (value, element) {
            return this.optional(element) || /^\bcat\b$/.test(value)
        }, "type the correct answer -_-");

        // validate question.html(frm-Q) form
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
					event.stopPropagation();
                    event.preventDefault();
					var formData;
					if($('#fileQ')[0].files.length != 0){
						formData = new FormData($(form)[0]);
					}else{
						formData = new FormData();
					}
					formData.append('qCategory',$('#qCategory').val());
					formData.append('qTitle',$('#qTitle').val());
					formData.append('qAnswer',$('#qAnswer').val());
					formData.append('qEmail',$('#qEmail').val());
                    $.ajax({
                        url: form.action,
						processData: false,
    					contentType: false,
						data: formData,
                        type: form.method,
						dataType : 'text',
                        success: function(result) {
							if(result.trim() === 'Y'){
								$('#frm-Q').find(':input').not(':first').not(':last').val('');
    	                        $('#frm-Q :input').attr('disabled', 'disabled');
        	                    $('#frm-Q').fadeTo("slow", 1, function () {
            	                    $(this).find(':input').attr('disabled', 'disabled');
                	                $(this).find('label').css('cursor', 'default');
                    	            $('#success').fadeIn()
                        	        $('.modal').modal('hide');
                            	    $('#success').modal('show');
                           		})
							}else if(result.trim() === 'N'){
								$('#frm-Q').fadeTo("slow", 1, function () {
	                                $('#error').fadeIn()
    	                            $('.modal').modal('hide');
        	                        $('#error').modal('show');
            	                })
							}						
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
        
    })(jQuery);
})