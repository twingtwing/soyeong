<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- toast ui -->
    <link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
    <link rel="stylesheet" href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />
    <script src="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.js"></script>
    <script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
</head>
<body>

	<!--================Banner Area =================-->

    <section class="section_gap">
        <div class="container">

            <h3>공지사항</h3>
            <br>
            <div class="row m-2 d-flex justify-content-end">
                <input type="text" class="form-control w-25" >
                <button class="genric-btn primary small font-weight-bold">Search</button>
            </div>
            <div id="noticegrid"></div>
            <br>

            <!-- <div class="form-row float-right">
                <button type="button" class="genric-btn primary" onclick = "location.href = 'noticeForm.do' ">글쓰기</button>
            </div> -->
        </div>
    </section>
    
    <script type="text/javascript">
    
    (function() {
    var dataNotice = JSON.parse('${notices}');
    
    const noticeGrid = new tui.Grid({
        el: document.getElementById('noticegrid'),
        data: dataNotice,
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
    noticeGrid.on('click', function(event){
    	console.log(event.rowKey);
    	console.log()
    	// rowKey값으로 pk값을 통해 location.href
    	console.log(dataNotice[event.rowKey].id);
    	location.href = "noticeRead.do?bno="+dataNotice[event.rowKey].bno;
    });

    // 표 테마
    tui.Grid.applyTheme('clean');
    
	})();
    
    
    </script>

</body>
</html>