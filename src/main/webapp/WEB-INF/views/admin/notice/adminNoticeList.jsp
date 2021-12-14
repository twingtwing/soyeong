<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="content-body">

            <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">Home</a></li>
                    </ol>
                </div>
            </div>
            <!-- row -->

            <div class="container-fluid">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <h2>공지사항</h2>
                            <div id="grid" class="m-5"></div>
                            <div class="row justify-content-end">
                                <button type="button" class="btn mb-1 btn-primary">글쓰기</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            
            <!-- #/ container -->
        </div>
        
    <script src="plugins/common/common.min.js"></script>
    <script src="js/custom.min.js"></script>
    <script src="js/settings.js"></script>
    <script src="js/gleek.js"></script>
    <script src="js/styleSwitcher.js"></script>

    <script>
        var gridData = [
            {
                id: 549731,
                name: 'Beautiful Lies',
                artist: 'Birdy',
                release: '2016.03.26',
                type: 'Deluxe',
                typeCode: '1',
                genre: 'Pop',
                genreCode: '1',
                grade: '2',
                price: 10000,
                downloadCount: 1000,
                listenCount: 5000,
            },
            {
                id: 436461,
                name: 'X',
                artist: 'Ed Sheeran',
                release: '2014.06.24',
                type: 'Deluxe',
                typeCode: '1',
                genre: 'Pop',
                genreCode: '1',
                grade: '3',
                price: 20000,
                downloadCount: 1000,
                listenCount: 5000,
            },
            {
                id: 295651,
                name: 'Moves Like Jagger',
                release: '2011.08.08',
                artist: 'Maroon5',
                type: 'Single',
                typeCode: '3',
                genre: 'Pop,Rock',
                genreCode: '1,2',
                grade: '2',
                price: 7000,
                downloadCount: 1000,
                listenCount: 5000,
            },
            {
                id: 541713,
                name: 'A Head Full Of Dreams',
                artist: 'Coldplay',
                release: '2015.12.04',
                type: 'Deluxe',
                typeCode: '1',
                genre: 'Rock',
                genreCode: '2',
                grade: '3',
                price: 25000,
                downloadCount: 1000,
                listenCount: 5000,
            },
            {
                id: 265289,
                name: '21',
                artist: 'Adele',
                release: '2011.01.21',
                type: 'Deluxe',
                typeCode: '1',
                genre: 'Pop,R&B',
                genreCode: '1,3',
                grade: '3',
                price: 15000,
                downloadCount: 1000,
                listenCount: 5000,
            },
            {
                id: 555871,
                name: 'Warm On A Cold Night',
                artist: 'HONNE',
                release: '2016.07.22',
                type: 'EP',
                typeCode: '1',
                genre: 'R&B,Electronic',
                genreCode: '3,4',
                grade: '2',
                price: 11000,
                downloadCount: 1000,
                listenCount: 5000,
            },
            {
                id: 550571,
                name: 'Take Me To The Alley',
                artist: 'Gregory Porter',
                release: '2016.09.02',
                type: 'Deluxe',
                typeCode: '1',
                genre: 'Jazz',
                genreCode: '5',
                grade: '3',
                price: 30000,
                downloadCount: 1000,
                listenCount: 5000,
            },
            {
                id: 544128,
                name: 'Make Out',
                artist: 'LANY',
                release: '2015.12.11',
                type: 'EP',
                typeCode: '2',
                genre: 'Electronic',
                genreCode: '4',
                grade: '2',
                price: 12000,
                downloadCount: 1000,
                listenCount: 5000,
            },
            {
                id: 366374,
                name: 'Get Lucky',
                artist: 'Daft Punk',
                release: '2013.04.23',
                type: 'Single',
                typeCode: '3',
                genre: 'Pop,Funk',
                genreCode: '1,5',
                grade: '3',
                price: 9000,
                downloadCount: 1000,
                listenCount: 5000,
            },
            {
                id: 8012747,
                name: 'Valtari',
                artist: 'Sigur Rós',
                release: '2012.05.31',
                type: 'EP',
                typeCode: '3',
                genre: 'Rock',
                genreCode: '2',
                grade: '3',
                price: 10000,
                downloadCount: 1000,
                listenCount: 5000,
            },
            {
                id: 502792,
                name: 'Bush',
                artist: 'Snoop Dogg',
                release: '2015.05.12',
                type: 'EP',
                typeCode: '2',
                genre: 'Hiphop',
                genreCode: '5',
                grade: '3',
                price: 18000,
                downloadCount: 1000,
                listenCount: 5000,
            },
            {
                id: 294574,
                name: '2',
                artist: 'Beyoncé',
                release: '2011.07.26',
                type: 'Deluxe',
                typeCode: '1',
                genre: 'Pop',
                genreCode: '1',
                grade: '3',
                price: 12000,
                downloadCount: 1000,
                listenCount: 5000,
            },
            {
                id: 317659,
                name: "I Won't Give Up",
                artist: 'Jason Mraz',
                release: '2012.01.03',
                type: 'Single',
                typeCode: '3',
                genre: 'Pop',
                genreCode: '1',
                grade: '2',
                price: 7000,
                downloadCount: 1000,
                listenCount: 5000,
            },
            {
                id: 583551,
                name: 'Following My Intuition',
                artist: 'Craig David',
                release: '2016.10.01',
                type: 'Deluxe',
                typeCode: '1',
                genre: 'R&B,Electronic',
                genreCode: '3,4',
                grade: '3',
                price: 15000,
                downloadCount: 1000,
                listenCount: 5000,
            },
            {
                id: 490500,
                name: 'Blue Skies',
                release: '2015.03.18',
                artist: 'Lenka',
                type: 'Single',
                typeCode: '3',
                genre: 'Pop,Rock',
                genreCode: '1,2',
                grade: '3',
                price: 6000,
                downloadCount: 1000,
                listenCount: 5000,
            },

        ];


        const grid = new tui.Grid({
            el: document.getElementById('grid'),
            data: gridData,
            scrollX: false,
            scrollY: false,
            minBodyHeight: 30,
            rowHeaders: ['rowNum'],
            pageOptions: {
                useClient: true,
                perPage: 5
            },
            pagination: true,
            columns: [
                {
                    header: '제목',
                    name: 'name'
                },
                {
                    header: '작성일자',
                    name: 'release'
                },
                {
                    header: '작성자',
                    name: 'type'
                },
                {
                    header: '조회수',
                    name: 'grade'
                }
            ]
        });

        // 셀 클릭했을 때 페이지 이동
        grid.on('click', function() {
            location.href="#";
        });

        // 표 테마
        tui.Grid.applyTheme('clean');
    </script>

</body>
</html>