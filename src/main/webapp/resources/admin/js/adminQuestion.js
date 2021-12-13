(function ($) {
    "use strict";

    //QnA table cs-table-1
    var dataQnA = [
        {
          id: 549731,
          name: 'Beautiful Lies',
          artist: 'Birdy'
        },
        {
          id: 436461,
          name: 'X',
          artist: 'Ed Sheeran'
        },
        {
          id: 295651,
          name: 'Moves Like Jagger',
          release: '2011.08.08',
          artist: 'Maroon5'
        },
        {
          id: 541713,
          name: 'A Head Full Of Dreams',
          artist: 'Coldplay'
        },
        {
          id: 265289,
          name: '21',
          artist: 'Adele'
        },
        {
          id: 555871,
          name: 'Warm On A Cold Night',
          artist: 'HONNE'
        },
        {
          id: 550571,
          name: 'Take Me To The Alley',
          artist: 'Gregory Porter'
        },
        {
          id: 544128,
          name: 'Make Out',
          artist: 'LANY'
        },
        {
          id: 366374,
          name: 'Get Lucky',
          artist: 'Daft Punk'
        },
        {
          id: 8012747,
          name: 'Valtari',
          artist: 'Sigur Rós'
        },
        {
          id: 502792,
          name: 'Bush',
          artist: 'Snoop Dogg'
        },
        {
          id: 294574,
          name: '2',
          artist: 'Beyoncé'
        },
        {
          id: 317659,
          name: "I Won't Give Up",
          artist: 'Jason Mraz'
        },
        {
          id: 583551,
          name: 'Following My Intuition',
          artist: 'Craig David'
        },
        {
          id: 490500,
          name: 'Blue Skies',
          artist: 'Lenka'
        },

    ];
   
    const gridQnA = new tui.Grid({
        el : document.getElementById('cs-table-1'),
        data : dataQnA,
        scrollX : false,
        scrollY : false,
        minBodyHeight: 30,
        rowHeaders: ['rowNum'],
        pageOptions: {
            useClient : true,
            perPage: 10
        },
        pagination : true,
        columns : [
          {
            header : '말머리',
            name : 'id'
         }, {
            header : '제목',
            name : 'name'
         }, {
            header : '답변',
            name : 'artist'
         }]
    });

    //customer voic table cs-table-2

    var dataCV = [
        {
          id: 549731,
          name: 'Beautiful Lies',
          artist: 'Birdy',
          release: '2016.03.26'
        },
        {
          id: 436461,
          name: 'X',
          artist: 'Ed Sheeran',
          release: '2014.06.24'
        },
        {
          id: 295651,
          name: 'Moves Like Jagger',
          release: '2011.08.08',
          artist: 'Maroon5'
        },
        {
          id: 541713,
          name: 'A Head Full Of Dreams',
          artist: 'Coldplay',
          release: '2015.12.04'
        },
        {
          id: 265289,
          name: '21',
          artist: 'Adele',
          release: '2011.01.21'
        },
        {
          id: 555871,
          name: 'Warm On A Cold Night',
          artist: 'HONNE',
          release: '2016.07.22'
        },
        {
          id: 550571,
          name: 'Take Me To The Alley',
          artist: 'Gregory Porter',
          release: '2016.09.02'
        },
        {
          id: 544128,
          name: 'Make Out',
          artist: 'LANY',
          release: '2015.12.11'
        },
        {
          id: 366374,
          name: 'Get Lucky',
          artist: 'Daft Punk',
          release: '2013.04.23'
        },
        {
          id: 8012747,
          name: 'Valtari',
          artist: 'Sigur Rós',
          release: '2012.05.31'
        },
        {
          id: 502792,
          name: 'Bush',
          artist: 'Snoop Dogg',
          release: '2015.05.12'
        },
        {
          id: 294574,
          name: '2',
          artist: 'Beyoncé',
          release: '2011.07.26'
        },
        {
          id: 317659,
          name: "I Won't Give Up",
          artist: 'Jason Mraz',
          release: '2012.01.03'
        },
        {
          id: 583551,
          name: 'Following My Intuition',
          artist: 'Craig David',
          release: '2016.10.01'
        },
        {
          id: 490500,
          name: 'Blue Skies',
          release: '2015.03.18',
          type: 'Single',
          artist: 'Lenka'
        },

    ];
   
    const gridCV = new tui.Grid({
        el : document.getElementById('cs-table-2'),
        data : dataCV,
        scrollX : false,
        scrollY : false,
        minBodyHeight: 30,
        rowHeaders: ['rowNum'],
        pageOptions: {
            useClient : true,
            perPage: 10
        },
        pagination : true,
        columns : [
        {
            header : '말머리',
            name : 'id'
         }, {
            header : '제목',
            name : 'name'
         }, {
            header : '질문자',
            name : 'artist'
         }, {
            header : '파일 포함여부',
            name : 'release'
         }
        ]
    });

    $('.nav-pills a').on('shown.bs.tab', function() {
        if (this.hash === "#cs-nav-2") {
            gridCV.refreshLayout();
        } else if (this.hash === "#cs-nav-1") {
            gridQnA.refreshLayout();
        }
    });

    gridQnA.on('click',function(event){
      console.log(event.rowKey);
      //rowkey값으로 pk값을 통해 location.href을 한다
      console.log(dataQnA[event.rowKey].id);
		location.href = "questionA.do";
    });

    gridCV.on('click',function(event){
      console.log(event.rowKey);
      console.log(dataCV[event.rowKey].id);
		location.href = "questionV.do";
    });

    tui.Grid.applyTheme('clean');

})(jQuery);

