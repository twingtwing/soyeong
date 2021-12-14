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
	
			<!-- customerSerivce.js에 있음 -->

            <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="admin.do">Main</a></li>
                        <li class="breadcrumb-item active"><a href="adminQuestion.do">Customer Service</a></li>
                    </ol>
                </div>
            </div>
            <!-- row -->

            <div class="container-fluid">
                <div class="row mb-3 ml-2">
                    <div class="card">
                        <div class="card-body pb-0">
                            <h4 class="d-inline">Customer Service</h4>
                            <p class="text-muted">고객과 관련된 서비스를 관리하는 페이지 입니다.</p>
                        </div>
                        
                        <div class="card-body pt-0">
                            <ul class="nav nav-pills">
                                <li class="nav-item">
                                    <a href="#cs-nav-1" class="nav-link active show btn mb-1 btn-outline-dark" data-toggle="tab" aria-expanded="false">Q & A</a>
                                </li>
                                <li class="nav-item ml-3">
                                    <a href="#cs-nav-2" class="nav-link btn mb-1 btn-outline-dark" data-toggle="tab" aria-expanded="true">고객의 소리</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                <div class="row m-2">
                    <div class="card col-12">
                        <div class="card-body">
                            <div class="tab-content br-n pn">
                                <div id="cs-nav-1" class="tab-pane active show">
                                    <div class="card-title pb-2 pt-1">
                                        <h4>Q n A</h4>
                                    </div>
                                    <div id="cs-table-1" class="table-responsive"></div>
                                    <div class="row d-flex justify-content-end">
                                        <a type="button" href="qeustionAInsert.do" class="btn mb-1 btn-rounded btn-outline-dark">글쓰기</a>
                                    </div>
                                </div>
                                <div id="cs-nav-2" class="tab-pane">
                                    <div class="card-title pb-2 pt-1">
                                        <h4>The Sound of Customers</h4>
                                    </div>
                                    <div id="cs-table-2" class="table-responsive">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #/ container -->
        </div>
</body>
</html>