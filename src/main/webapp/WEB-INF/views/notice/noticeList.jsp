<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice</title>
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
                <input type="text" id="btitle" name="btitle" 
                	class="form-control w-25" >
                <button class="genric-btn primary small font-weight-bold" id="nsearch">Search</button>
            </div>
            <div id="noticeTable"></div>
            <br>

            <!-- <div class="form-row float-right">
                <button type="button" class="genric-btn primary" onclick = "location.href = 'noticeForm.do' ">글쓰기</button>
            </div> -->
        </div>
    </section>
    
    <script type="text/javascript">
    
 // 검색
    createNotice(JSON.parse('${notices}'));


	function createNotice(dataNotice) {
		let div = document.getElementById('noticeTable');
		if(div.children.length!=0){
			div.children[0].remove();
		}

	    const admingrid = new tui.Grid({
	        el: div,
	        data: dataNotice,
	        scrollX: false,
	        scrollY: false,
	        minBodyHeight: 30,
	        rowHeaders: [{type: 'rowNum', align : 'center', valign : 'middle'}],
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
	    admingrid.on('click', function(event){
	    	let no = dataNotice[event.rowKey].bno;
	    	location.href = "noticeRead.do?bno="+dataNotice[event.rowKey].bno;
	    });
	
	    // 표 테마
	    tui.Grid.applyTheme('clean');


	function createNotice(dataNotice) {
		let div = document.getElementById('noticeTable');
		if(div.children.length!=0){
			div.children[0].remove();
	}

    const admingrid = new tui.Grid({
        el: div,
        data: dataNotice,
        scrollX: false,
        scrollY: false,
        minBodyHeight: 30,
        rowHeaders: [{type: 'rowNum', align : 'center', valign : 'middle'}],
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
    admingrid.on('click', function(event){
    	let no = dataNotice[event.rowKey].bno;
    	location.href = "noticeRead.do?bno="+dataNotice[event.rowKey].bno;
    });

    // 표 테마
    tui.Grid.applyTheme('clean');
	}

	document.getElementById('nsearch').addEventListener('click', function(){
		let t = document.getElementById('btitle').value;
		
		let path = 'noticeSearch.do?btitle='+t;
		
		fetch(path)
		
		.then(response => response.json())
		.then(data => {
			createNotice(data);
		});
	})

	document.getElementById('btitle').addEventListener('keypress', function(event){
		if(event.keyCode === 13){
			document.getElementById('nsearch').click();
		}
	})
    
    </script>

</body>
</html>