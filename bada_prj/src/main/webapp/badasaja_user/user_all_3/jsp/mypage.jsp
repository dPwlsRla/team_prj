<%--
  Created by IntelliJ IDEA.
  User: seohuisu
  Date: 2022/04/12
  Time: 9:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>mypage</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
    <link rel="stylesheet" href="../fonts/icomoon/style.css">

    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/magnific-popup.css">
    <link rel="stylesheet" href="../css/jquery-ui.css">
    <link rel="stylesheet" href="../css/owl.carousel.min.css">
    <link rel="stylesheet" href="../css/owl.theme.default.min.css">


    <link rel="stylesheet" href="../css/aos.css">

    <link rel="stylesheet" href="../css/style.css">

</head>
<body>

<div class="site-wrap">
    <%@include file="components/header.jsp"%>
    <div class="site-section">
        <div class="container">
            <div class="row mb-5">
                <div class="col-md-9 order-2">
                    <h3>교환 목록</h3>
                    <div class="tabs">
                        <input id="my-promise" type="radio" name="tab_item" >
                        <label class="tab_item" for="my-promise"style="float: right;width:70px">거래약속</label>
                        <input id="my-trade" type="radio" name="tab_item">
                        <label class="tab_item" for="my-trade"style="float: right;width:70px">거래한글</label>
                        <input id="my-write" type="radio" name="tab_item"checked="checked">
                        <label class="tab_item" for="my-write" style="float: right;width:70px">내가쓴글</label>

                        <div class="tab_content" id="my-write_content">
                            <div class="card-item" data-aos="fade-up">
                                <div class="row align-items-center">
                                    <h5>2022.03.31 드림</h5>
                                </div>
                                <div class="row align-items-center">
                                    <div class="image">
                                        <a href="#"><img src="../images/blog_1.jpg" alt="Image placeholder" class="img"></a>
                                    </div>
                                    <div class="text">
                                        <h6>바나나 우유 딸기로 바꿉니다</h6>
                                        <h7>거래한 분 : 바나나가좋아</h7>
                                    </div>
                                </div>
                            </div>
                            <div class="card-item" data-aos="fade-up">
                                <div class="row align-items-center">
                                    <h5>2022.03.31 드림</h5>
                                </div>
                                <div class="row align-items-center">
                                    <div class="image">
                                        <a href="#"><img src="../images/blog_1.jpg" alt="Image placeholder" class="img"></a>
                                    </div>
                                    <div class="text">
                                        <h6>바나나 우유 딸기로 바꿉니다</h6>
                                        <h7>거래한 분 : 바나나가좋아</h7>
                                    </div>
                                </div>
                            </div>
                            <div class="card-item" data-aos="fade-up">
                                <div class="row align-items-center">
                                    <h5>2022.03.31 드림</h5>
                                </div>
                                <div class="row align-items-center">
                                    <div class="image">
                                        <a href="#"><img src="../images/blog_1.jpg" alt="Image placeholder" class="img"></a>
                                    </div>
                                    <div class="text">
                                        <h6>바나나 우유 딸기로 바꿉니다</h6>
                                        <h7>거래한 분 : 바나나가좋아</h7>
                                    </div>
                                </div>
                            </div>
                            <div class="card-item" data-aos="fade-up">
                                <div class="row align-items-center">
                                    <h5>2022.03.31 드림</h5>
                                </div>
                                <div class="row align-items-center">
                                    <div class="image">
                                        <a href="#"><img src="../images/blog_1.jpg" alt="Image placeholder" class="img"></a>
                                    </div>
                                    <div class="text">
                                        <h6>바나나 우유 딸기로 바꿉니다</h6>
                                        <h7>거래한 분 : 바나나가좋아</h7>
                                    </div>
                                </div>
                            </div>
                            <div class="card-item" data-aos="fade-up">
                                <div class="row align-items-center">
                                    <h5>2022.03.31 드림</h5>
                                </div>
                                <div class="row align-items-center">
                                    <div class="image">
                                        <a href="#"><img src="../images/blog_1.jpg" alt="Image placeholder" class="img"></a>
                                    </div>
                                    <div class="text">
                                        <h6>바나나 우유 딸기로 바꿉니다</h6>
                                        <h7>거래한 분 : 바나나가좋아</h7>
                                    </div>
                                </div>
                            </div>
                            <div class="card-item" data-aos="fade-up">
                                <div class="row align-items-center">
                                    <h5>2022.03.31 드림</h5>
                                </div>
                                <div class="row align-items-center">
                                    <div class="image">
                                        <a href="#"><img src="../images/blog_1.jpg" alt="Image placeholder" class="img"></a>
                                    </div>
                                    <div class="text">
                                        <h6>바나나 우유 딸기로 바꿉니다</h6>
                                        <h7>거래한 분 : 바나나가좋아</h7>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="tab_content" id="my-trade_content">
                          <div class="card-item" data-aos="fade-up">
                                <div class="row align-items-center">
                                    <h5>2022.03.31 드림</h5>
                                </div>
                                <div class="row align-items-center">
                                    <div class="image">
                                        <a href="#"><img src="../images/blog_1.jpg" alt="Image placeholder" class="img"></a>
                                    </div>
                                    <div class="text">
                                        <h6>바나나 우유 딸기로 바꿉니다</h6>
                                        <h7>거래한 분 : 바나나가좋아</h7>
                                    </div>
                                </div>
                            </div>
                            <div class="card-item" data-aos="fade-up">
                                <div class="row align-items-center">
                                    <h5>2022.03.31 드림</h5>
                                </div>
                                <div class="row align-items-center">
                                    <div class="image">
                                        <a href="#"><img src="../images/blog_1.jpg" alt="Image placeholder" class="img"></a>
                                    </div>
                                    <div class="text">
                                        <h6>바나나 우유 딸기로 바꿉니다</h6>
                                        <h7>거래한 분 : 바나나가좋아</h7>
                                    </div>
                                </div>
                            </div>
                            <div class="card-item" data-aos="fade-up">
                                <div class="row align-items-center">
                                    <h5>2022.03.31 드림</h5>
                                </div>
                                <div class="row align-items-center">
                                    <div class="image">
                                        <a href="#"><img src="../images/blog_1.jpg" alt="Image placeholder" class="img"></a>
                                    </div>
                                    <div class="text">
                                        <h6>바나나 우유 딸기로 바꿉니다</h6>
                                        <h7>거래한 분 : 바나나가좋아</h7>
                                    </div>
                                </div>
                            </div>
                            <div class="card-item" data-aos="fade-up">
                                <div class="row align-items-center">
                                    <h5>2022.03.31 드림</h5>
                                </div>
                                <div class="row align-items-center">
                                    <div class="image">
                                        <a href="#"><img src="../images/blog_1.jpg" alt="Image placeholder" class="img"></a>
                                    </div>
                                    <div class="text">
                                        <h6>바나나 우유 딸기로 바꿉니다</h6>
                                        <h7>거래한 분 : 바나나가좋아</h7>
                                    </div>
                                </div>
                            </div>
                            <div class="card-item" data-aos="fade-up">
                                <div class="row align-items-center">
                                    <h5>2022.03.31 드림</h5>
                                </div>
                                <div class="row align-items-center">
                                    <div class="image">
                                        <a href="#"><img src="../images/blog_1.jpg" alt="Image placeholder" class="img"></a>
                                    </div>
                                    <div class="text">
                                        <h6>바나나 우유 딸기로 바꿉니다</h6>
                                        <h7>거래한 분 : 바나나가좋아</h7>
                                    </div>
                                </div>
                            </div>
                            <div class="card-item" data-aos="fade-up">
                                <div class="row align-items-center">
                                    <h5>2022.03.31 드림</h5>
                                </div>
                                <div class="row align-items-center">
                                    <div class="image">
                                        <a href="#"><img src="../images/blog_1.jpg" alt="Image placeholder" class="img"></a>
                                    </div>
                                    <div class="text">
                                        <h6>바나나 우유 딸기로 바꿉니다</h6>
                                        <h7>거래한 분 : 바나나가좋아</h7>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="tab_content" id="my-promise_content">
                            <div class="card-item" data-aos="fade-up">
                                <div class="row align-items-center">
                                    <h5>2022.03.31 드림</h5>
                                </div>
                                <div class="row align-items-center">
                                    <div class="image">
                                        <a href="#"><img src="../images/blog_1.jpg" alt="Image placeholder" class="img"></a>
                                    </div>
                                    <div class="text">
                                    <input type="button" value="완료" style="
                                    width: 50px; height: 30px; float: right;margin-right: 50px; margin-bottom: 50px;color: white;background-color: #2a90ab">
                                        <h6>바나나 우유 딸기로 바꿉니다</h6>
                                    </div>
                                </div>
                            </div>
                            <div class="card-item" data-aos="fade-up">
                                <div class="row align-items-center">
                                    <h5>2022.03.31 드림</h5>
                                </div>
                                <div class="row align-items-center">
                                    <div class="image">
                                        <a href="#"><img src="../images/blog_1.jpg" alt="Image placeholder" class="img"></a>
                                    </div>
                                    <div class="text">
                                    <input type="button" value="완료" style="
                                    width: 50px; height: 30px; float: right;margin-right: 50px; margin-bottom: 50px;color: white;background-color: #2a90ab">
                                        <h6>바나나 우유 딸기로 바꿉니다</h6>
                                    </div>
                                </div>
                            </div>
                            <div class="card-item" data-aos="fade-up">
                                <div class="row align-items-center">
                                    <h5>2022.03.31 드림</h5>
                                </div>
                                <div class="row align-items-center">
                                    <div class="image">
                                        <a href="#"><img src="../images/blog_1.jpg" alt="Image placeholder" class="img"></a>
                                    </div>
                                    <div class="text">
                                    <input type="button" value="완료" style="
                                    width: 50px; height: 30px; float: right;margin-right: 50px; margin-bottom: 50px;color: white;background-color: #2a90ab">
                                        <h6>바나나 우유 딸기로 바꿉니다</h6>
                                    </div>
                                </div>
                            </div>
                            <div class="card-item" data-aos="fade-up">
                                <div class="row align-items-center">
                                    <h5>2022.03.31 드림</h5>
                                </div>
                                <div class="row align-items-center">
                                    <div class="image">
                                        <a href="#"><img src="../images/blog_1.jpg" alt="Image placeholder" class="img"></a>
                                    </div>
                                    <div class="text">
                                    <input type="button" value="완료" style="
                                    width: 50px; height: 30px; float: right;margin-right: 50px; margin-bottom: 50px;color: white;background-color: #2a90ab">
                                        <h6>바나나 우유 딸기로 바꿉니다</h6>
                                    </div>
                                </div>
                            </div>
                            <div class="card-item" data-aos="fade-up">
                                <div class="row align-items-center">
                                    <h5>2022.03.31 드림</h5>
                                </div>
                                <div class="row align-items-center">
                                    <div class="image">
                                        <a href="#"><img src="../images/blog_1.jpg" alt="Image placeholder" class="img"></a>
                                    </div>
                                    <div class="text">
                                    <input type="button" value="완료" style="
                                    width: 50px; height: 30px; float: right;margin-right: 50px; margin-bottom: 50px;color: white;background-color: #2a90ab">
                                        <h6>바나나 우유 딸기로 바꿉니다</h6>
                                    </div>
                                </div>
                            </div>
                            <div class="card-item" data-aos="fade-up">
                                <div class="row align-items-center">
                                    <h5>2022.03.31 드림</h5>
                                </div>
                                <div class="row align-items-center">
                                    <div class="image">
                                        <a href="#"><img src="../images/blog_1.jpg" alt="Image placeholder" class="img"></a>
                                    </div>
                                    <div class="text">
                                    <input type="button" value="완료" style="
                                    width: 50px; height: 30px; float: right;margin-right: 50px; margin-bottom: 50px;color: white;background-color: #2a90ab">
                                        <h6>바나나 우유 딸기로 바꿉니다</h6>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <%@include file="components/mypage_nav.jsp"%>
            </div>
        </div>
    </div>
</div>
    	  <%@include file="components/footer.jsp"%>						


<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/jquery-ui.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/owl.carousel.min.js"></script>
<script src="../js/jquery.magnific-popup.min.js"></script>
<script src="../js/aos.js"></script>
<script src="../js/main.js"></script>

</body>
</html>