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
    
    (function() {
    	var dataNotice = Json.parse('${notices}');

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
                    name: 'btitle'
                },
                {
                    header: '작성일자',
                    name: 'bdate'
                },
                {
                    header: '작성자',
                    name: 'id'
                }
            ]
        });

     // 셀 클릭했을 때 글 상세 조회 페이지로 이동
        grid.on('click', function(event){
        	console.log(event.rowKey);
        	console.log()
        	// rowKey값으로 pk값을 통해 location.href
        	console.log(dataNotice[event.rowKey].id);
        	location.href = "noticeRead.do";
        });

        // 표 테마
        tui.Grid.applyTheme('clean');
    })();
    </script>

</body>
</html>