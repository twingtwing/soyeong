<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <!--================ start Banner Area =================-->
    <section class="banner_area">
        <div class="booking_table d_flex align-items-center">
            <div class="overlay bg-parallax" data-stellar-ratio="0.9" data-stellar-vertical-offset="0"
                data-background=""></div>
            <div class="container">
                <div class="banner_content text-center">
                    <h2>Relax Your Mind</h2>
                </div>
            </div>
        </div>
    </section>
    <!--================ Banner Area =================-->

    <!--================ start body Area =================-->
    <section class="section_gap">
        <div class="container">
            <div class="section_title mb-4 ml-2">
                <h2 class="title_color"><strong>고객센터</strong></h2>
            </div>
            <div class="row mb-4 border border-right-0 border-top-0 border-left-0">
                <div class="btn-Q active-Q ml-3 mr-3">
                    <h5>Q n A</h5>
                </div>
                <div class="btn-Q">
                    <h5>고객의 소리</h5>
                </div>
            </div>
            <!-- QnA div -->
            <div class="btn-Q-div">
                <!-- 여기에 Icon 추가해야함 -->
                <!-- li은 10개 / foreach 쓸때 id값 바꾸기(varStatus) -->
                <ul class="list-group list-group-flush m-1">
                    <li class="list-group-item">
                        <div>
                            <div class="mt-2 mb-3">
                                <table class="w-100">
                                    <tr>
                                        <td class="text-center text-warning" width="5%"><strong>Q</strong></td>
                                        <td class="pl-3 font-weight-bold" width="89%">탈퇴는 어떻게 하려고 하는데 어떻게 하나요?</td>
                                        <td class="text-center" width="5%">
                                            <a class="text-dark" href="#collapse-Q-1" data-toggle="collapse"><i
                                                    class="fas fa-chevron-up"></i></a>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div id="collapse-Q-1" class="collapse collapse-Q mb-3">
                                <table class="w-100">
                                    <tr>
                                        <td class="text-center" width="5%"><strong>A</strong></td>
                                        <td class="pl-3" width="94%">탈퇴는 어떻게 하려고 하는데 어떻게 하나요?</td>
                                    </tr>
                                </table>
                            </div>
                            <div class="mt-2 mb-3">
                                <table class="w-100">
                                    <tr>
                                        <td class="text-center text-warning" width="5%"><strong>Q</strong></td>
                                        <td class="pl-3 font-weight-bold" width="89%">탈퇴는 어떻게 하려고 하는데 어떻게 하나요?</td>
                                        <td class="text-center" width="5%">
                                            <a class="text-dark" href="#collapse-Q-2" data-toggle="collapse"><i
                                                    class="fas fa-chevron-up"></i></a>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div id="collapse-Q-2" class="collapse collapse-Q mb-3">
                                <table class="w-100">
                                    <tr>
                                        <td class="text-center" width="5%"><strong>A</strong></td>
                                        <td class="pl-3" width="94%">탈퇴는 어떻게 하려고 하는데 어떻게 하나요?</td>
                                    </tr>
                                </table>
                            </div>
                            <div class="mt-2 mb-3 text-center">
                                <a href="#collapse-1" data-toggle="collapse">더보기</a>
                            </div>
                        </div>
                        <div id="collapse-1" class="collapse collapse-Q-more">
                            <div class="mt-2 mb-3">
                                <table class="w-100">
                                    <tr>
                                        <td class="text-center text-warning" width="5%"><strong>Q</strong></td>
                                        <td class="pl-3 font-weight-bold" width="89%">탈퇴는 어떻게 하려고 하는데 어떻게 하나요?</td>
                                        <td class="text-center" width="5%">
                                            <a class="text-dark text-warning" href="#collapse-Q-3"
                                                data-toggle="collapse"><i class="fas fa-chevron-up"></i></a>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div id="collapse-Q-3" class="collapse collapse-Q mb-3">
                                <table class="w-100">
                                    <tr>
                                        <td class="text-center" width="5%"><strong>A</strong></td>
                                        <td class="pl-3" width="94%">탈퇴는 어떻게 하려고 하는데 어떻게 하나요?</td>
                                    </tr>
                                </table>
                            </div>
                            <div class="mt-2 mb-3">
                                <table class="w-100">
                                    <tr>
                                        <td class="text-center text-warning" width="5%"><strong>Q</strong></td>
                                        <td class="pl-3 font-weight-bold" width="89%">탈퇴는 어떻게 하려고 하는데 어떻게 하나요?</td>
                                        <td class="text-center" width="5%">
                                            <a class="text-dark " href="#collapse-Q-4" data-toggle="collapse"><i
                                                    class="fas fa-chevron-up"></i></a>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div id="collapse-Q-4" class="collapse collapse-Q mb-3">
                                <table class="w-100">
                                    <tr>
                                        <td class="text-center" width="5%"><strong>A</strong></td>
                                        <td class="pl-3" width="94%">탈퇴는 마이페이지로 이동하시면 볼수 있습니다. <br> 탈퇴예정이시면 한번 더 생각하시길
                                            바랍니다.</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </li>
                </ul>
                <div class="br"></div>
            </div>
            <!-- 고객의 소리 div -->
            <div class="btn-Q-div d-none">
                <!-- input박스 border색 고민됨 -->
                <form id="frm-Q" class="contact_form" action="contact_process.php" method="post" novalidate="novalidate">
                    <div class="blog_right_sidebar border-warning m-1 mt-5 p-5">
                        <div class="form-row col-md-12 mb-4">
                            <div class="form-group col-md-3">
                                <h6>말머리</h6>
                                <div class="default-select" id="default-select">
                                    <select style="display: none;">
                                        <option value="1">English</option>
                                        <option value="1">Spanish</option>
                                        <option value="1">Arabic</option>
                                        <option value="1">Portuguise</option>
                                        <option value="1">Bengali</option>
                                    </select>
                                    <div class="nice-select bg-warning" tabindex="0"><span class="current">English</span>
                                        <ul class="list bg-light">
                                            <li data-value="1" class="option selected focus">English</li>
                                            <li data-value="1" class="option">Spanish</li>
                                            <li data-value="1" class="option">Arabic</li>
                                            <li data-value="1" class="option">Portuguise</li>
                                            <li data-value="1" class="option">Bengali</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-md-9">
                                <h6>제목</h6>
                                <input type="text" class="form-control bg-light border-secondary" id="qTitle" name="qTitle" placeholder="Enter title">
                            </div>
                        </div>
                        <div class="col-md-12 mb-4">
                            <div class="form-group">
                                <h6>내용</h6>
                                <textarea id="qAnswer" name="qAnswer" class="form-control bg-light border-secondary" rows="7" placeholder="Enter Contents"></textarea>
                            </div>
                        </div>
                        <div class="form-row col-md-12 mb-4">
                            <div class="form-group col-md-3">
                                <h6>첨부파일</h6>
                                <input type="file" id="qFile" name="qFile" class="form-control-file">       
                            </div>
                            <div class="form-group col-md-9">
                            <h6>답변 이메일 주소</h6>
                                <input type="email" class="form-control bg-light border-secondary" id="qEmail" name="qEmail" placeholder="Enter email address">
                            </div>
                        </div>
                        <div class="col-md-12 d-flex justify-content-center mt-4">
                            <!-- primary or warning 정해야함 -->
                            <!-- 또한 각 페이지 색깔 일치 시켜야함 -->
                            <input type="submit" id="submit-Q" class="btn theme_btn button_hover" value="Submit">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!--================ body Area  =================-->

    <!--================Contact Success and Error message Area =================-->
    <div id="success" class="modal modal-message fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <i class="fa fa-close"></i>
                    </button>
                    <h2>Thank you !</h2>
                    <p>Your answer is successfully sent </p>
                </div>
            </div>
        </div>
    </div>

    <!-- Modals error -->

    <div id="error" class="modal modal-message fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <i class="fa fa-close"></i>
                    </button>
                    <h2>Sorry !</h2>
                    <p> Something went wrong </p>
                </div>
            </div>
        </div>
    </div>
    <!--================End Contact Success and Error message Area =================-->

</body>
</html>