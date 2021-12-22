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
    <style type="text/css">
    #noticeTable div.tui-grid-cell-content {
		text-align: center;
	}
	td{
	cursor: pointer;
}
    </style>
</head>
<body>

	<!--================ start Banner Area =================-->
	<section class="breadcrumb_area">
            <div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
            <div class="container">
                <div class="page-cover text-center">
                    <h2 class="page-cover-tittle">공지사항</h2>
                </div>
            </div>
        </section>
	<!--================ Banner Area =================-->

	<!--================Banner Area =================-->

    <section class="section_gap">
        <div class="container">
        	<div class="row mb-30">
                <a href="javascript:history.back()" class="genric-btn warning-border circle arrow pl-4"><span class="lnr lnr-arrow-left mr-2 ml-0 pl-0"></span>Prev</a>
            </div>
			<div class="section_title text-center">
				<h2 class="title_color">
					<strong>공지사항</strong>
				</h2>
			</div>
            <div class="row m-2 mt-4 d-flex justify-content-end">
                <input type="text" id="btitle" name="btitle" 
                	class="form-control w-25" >
                <button class="genric-btn primary small font-weight-bold" id="nsearch" style="margin-left:0.5rem;">Search</button>
            </div>
            <div>
            	<div id="noticeTable"></div>
            </div>
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

	    const noticegrid = new tui.Grid({
	        el: div,
	        data: dataNotice,
	        scrollX: false,
	        scrollY: false,
	        minBodyHeight: 30,
	        rowHeaders: [{type: 'rowNum', align : 'center', valign : 'middle'}],
	        pageOptions: {
	            useClient: true,
	            perPage: 10
	        },
	        pagination: true,
	        columns: [
	            {
	                header: '제목',
	                name: 'btitle'
	            },
	            {
	                header: '작성일자',
	                name: 'bdate',
	                width : 'auto',
		            minWidth :150
		         }, 
	            {
	                header: '작성자',
	                name: 'id',
	                width : 'auto',
		            minWidth :150
		         }
	        ]
	    });

	 	// 셀 클릭했을 때 글 상세 조회 페이지로 이동
	    noticegrid.on('click', function(event){
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