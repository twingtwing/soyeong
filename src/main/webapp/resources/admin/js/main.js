(function ($) {
    "use strict";

    //main card year,month
    const monthDiv = document.getElementsByClassName('admin-div');

    let nowDate = new Date();
    let preDate = new Date(nowDate.getFullYear()-1,nowDate.getMonth(),0);
    
    for(var div of monthDiv){
         let p = document.createElement('p');
        p.classList.add('text-white','mb-0');
        p.innerHTML = preDate.getFullYear()+'.' +nowDate.getMonth()+' - '+nowDate.getFullYear()+ '.' +preDate.getMonth();
        div.appendChild(p);
    }

    //admin chart
    var mct = document.getElementById('admin-chart');
    mct.height = 200;

    var adminMonth = ["January", "February", "March", "April", "May", "June",
        "July", "August", "September", "October", "November", "December"
    ];

    var monthAry = [];
    for(var i = 0; i < 12 ; i++){
        monthAry.push(adminMonth[(nowDate.getMonth()+i)%12]);
    }
    
    var adminChart = new Chart(mct,{
       type : 'line',
       data : {
           labels : monthAry,
           type : 'line',
           defaultFontFamily: 'Montserrat',
           datasets:[{
                data :[0, 15, 7, 12, 85, 10, 50,80,28,49, 80,91],
                label : nowDate.getFullYear() +'년',
                backgroundColor: 'rgba(255, 0, 0, 0.2)',
                borderColor: 'red',
                borderWidth: 0.5,
                pointStyle: 'circle',
                pointRadius: 5,
                pointBorderColor: 'transparent',
                pointBackgroundColor: 'red',
           },{
                data :[10, 9, 37, 40, 75, 30, 40, 55, 38, 20, 50, 70],
                label : preDate.getFullYear() +'년',
                backgroundColor: 'rgba(0, 0, 255, 0.2)',
                borderColor: 'blue',
                borderWidth: 0.5,
                pointStyle: 'circle',
                pointRadius: 5,
                pointBorderColor: 'transparent',
                pointBackgroundColor: 'blue',
           }]
       },
       options: {
        responsive: true,
        tooltips: {
            mode: 'index',
            titleFontSize: 12,
            titleFontColor: '#000',
            bodyFontColor: '#000',
            backgroundColor: '#fff',
            titleFontFamily: 'Montserrat',
            bodyFontFamily: 'Montserrat',
            cornerRadius: 3,
            intersect: false,
        },
        legend: {
            position: 'top',
            labels: {
                usePointStyle: true,
                fontFamily: 'Montserrat',
            },


        },
        scales: {
            xAxes: [{
                display: true,
                gridLines: {
                    display: false,
                    drawBorder: false
                }
            }],
            yAxes: [{
                display: true,
                gridLines: {
                    display: false,
                    drawBorder: false
                },
                ticks: {
                    beginAtZero:true
                },
                afterTickToLabelConversion : function(q){
                    for(var tick in q.ticks){
                      q.ticks[tick] += '만 원';
                    }
                }
            }]
        },
        title: {
            display: false,
        }
    } 
    });

})(jQuery);