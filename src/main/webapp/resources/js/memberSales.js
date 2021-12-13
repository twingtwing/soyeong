;(function($){

 //목록 버튼 클릭 시 레이아웃 전환
            $('.btn-Pay').on('click','div:not(.active-btn-Pay)',function () {
                //목록 변경
                $('.active-btn-Pay').toggleClass('active-btn-Pay');
                this.classList.toggle('active-btn-Pay');
                //내용 변경
                $('.active-div-Pay').toggleClass('active-div-Pay').toggleClass('d-none');
                $('.div-Pay > div').eq($(this).index()).toggleClass('active-div-Pay').toggleClass('d-none');
            });

            //collapse
            $('.collapse.collapse-Pay-more').on("show.bs.collapse", function () {
                $('a[href="#' + $(this).attr('id') + '"]').closest('tr').remove();
            });

            $('.refund-Y').on('click',function(){
                //환불 승인
                console.log( this.closest('tr').children[0].innerHTML);
            });

            $('.refund-N').on('click',function(){
                //환불 취소
                console.log( this.closest('tr').children[0].innerHTML);
            });
            
            //버튼 클릭 시 버튼 변경
            $('.btn-Pay-date').on('click',function(event){
                if(event.target.nodeName === 'BUTTON' && !event.target.classList.contains('active-Pay-date')){
                    if($('.active-Pay-date')) $('.active-Pay-date').attr("class", 'genric-btn default');
                    event.target.setAttribute("class", 'genric-btn warning active-Pay-date');
                }else if(event.target.nodeName === 'BUTTON' && event.target.classList.contains('active-Pay-date')){
                    event.target.setAttribute("class", 'genric-btn default ');
                }
                
                if(event.target.nodeName === 'BUTTON' && $(event.target).index() == 2){
                    event.target.closest('div').parentNode.parentNode.querySelector('.pay-date-detail').classList.toggle('d-print-block');
                }
            })

            //datatime어찌고 id 어떻게 할지 정하기
            $('.active-div-Pay .btn-Pay-ajax').on('click',function(){
                //카테고리에 따라 ajax경로 다르게 설정하거나 혹으 serviceimpl 메서드를 다르게 해야함

                if(!$('.active-Pay-date')){
                    //디자인 바꿀수 있으면 하기
                    alert('검색할 범위를 먼저 선택해주세요.');
                    return false;
                }
                let startDate, endDate;
                let now = new Date();
                if($('.active-Pay-date').index() != 2 ){
                    //순서 바뀌면 안됨
                    endDate = now.toISOString().substring(0,10);
                    startDate = new Date(now.setMonth(now.getMonth() - $('.active-Pay-date').val())).toISOString().substring(0,10);
                }else{
                    startDate = $('#datetimepicker-pay-start > input').val();
                    endDate = $('#datetimepicker-pay-end > input').val();
                }
                console.log(startDate);
                console.log(endDate);
            });

	//달력 설정
	    $('.datetimepicker-pay-start').datetimepicker({
        format: 'yyyy-mm-dd',
        minView: 'month',
        startDate: new Date((new Date).setDate((new Date).getDate() + 1)),
        endDate: new Date((new Date).setDate((new Date).getFullYear() + 1))
    }).on('changeDate ', function(){
        let startDate = $('.datetimepicker-pay-start > input').val();
        let end = Number(startDate.substring(startDate.length-1))+1;
        startDate = startDate.substring(0,startDate.length-1) + `${end}`;
        $('#datetimepicker-pay-end').datetimepicker('setStartDate', startDate);
    });

    $('.datetimepicker-pay-end').datetimepicker({
        format: 'yyyy-mm-dd',
        minView: 'month',
        endDate: new Date((new Date).setDate((new Date).getFullYear() + 1))
    });

    $('#datetimepicker-math').datetimepicker({
        format: 'yyyy-mm',
        minView: 'month',
        endDate: new Date(new Date().getFullYear(),new Date().getMonth(),0)
    });

	//통계 chart.js
    var lineId = document.getElementById('lineChart').getContext('2d');
    var monthNames = ["January", "February", "March", "April", "May", "June",
        "July", "August", "September", "October", "November", "December"
    ];

    var monthChart = [];
    for(var i = 0; i < 12 ; i++){
        monthChart.push(monthNames[(new Date().getMonth()+i)%12]);
    }

    var lineChart = new Chart(lineId, {
        // 챠트 종류를 선택 
        type: 'line',
        // 챠트를 그릴 데이타 
        data: {
            labels: monthChart,
            datasets: [{
                label : '월 수입 ',
                backgroundColor: 'transparent',
                borderColor: 'red',
                borderWidth: 4,
                data: [0, 10, 5, 2, 20, 30, 45, 40, 67, 87, 99, 70]
            }]
        },
        // 옵션 
        options: {
            responseive : false,
            legend: {
                display: false
            },
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero:true
                    },
                    afterTickToLabelConversion : function(q){
                        for(var tick in q.ticks){
                          q.ticks[tick] += '만 원';
                        }
                    }
                }]
            }
        }
    });

})(jQuery)