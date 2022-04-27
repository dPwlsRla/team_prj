<%@page import="kr.co.sist.badasaja.vo.ProductVO"%>
<%@page import="kr.co.sist.badasaja.vo.LocalVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.badasaja.admin.dao.BaseDAO"%>
<%@page import="kr.co.sist.badasaja.admin.dao.DashDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <html
        lang="en"
        class="light-style layout-menu-fixed"
        dir="ltr"
        data-theme="theme-default"
        data-assets-path="../assets/"
        data-template="vertical-menu-template-free"
>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>Tables - Basic Tables | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="../assets/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="../assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="../assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="../assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="../assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.4.1"></script> <!-- chart.js CDN -->
    <script src="../assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="../assets/js/config.js"></script>	
 </head>



<body onload="ageOfCustomer(), guCnt()">
<%
BaseDAO bDAO = BaseDAO.getInstance();
List<LocalVO> lList = bDAO.selectLocalList();
	

pageContext.setAttribute("lList", lList);
%>


<%@ include file="nav.jsp"%>

<div class="layout-wrapper layout-content-navbar">
  <div class="layout-container">
    <!-- Menu -->
    <%@ include file="sidemenu.jsp"%>
    <!-- / Menu -->
    <div class="layout-page">
          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <div class="row">
                <div class="col-lg-8 mb-4 order-0">
                  <div class="card">
                    <div class="d-flex align-items-end row">
                      <div class="col-sm-7">
                        <div class="card-body">
                          <h4 class="card-title text-primary">Notice to Operator</h4>
                          <p class="mb-4">
                          <Label>Latest Notice :</Label>  
                          	<span class="fw-bold" style="margin-left:10px; font-size:15px;">
                          		<%String notice = DashDAO.getInstance().selectOperNotice();%>
						  		<%=notice %>
                          </span>
                          </p>
                        </div>
                      </div>
                      <div class="col-sm-5 text-center text-sm-left">
                        <div class="card-body pb-0 px-0 px-md-4">
                          <a href="operation.jsp" class="btn btn-sm btn-outline-primary">View More</a>
                          <img
                            src="../assets/img/illustrations/man-with-laptop-light.png"
                            height="140"
                            alt="View Badge User"
                            data-app-dark-img="illustrations/man-with-laptop-dark.png"
                            data-app-light-img="illustrations/man-with-laptop-light.png"
                          />
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-4 col-md-4 order-1">
                  <div class="row">
                    <div class="col-lg-6 col-md-12 col-6 mb-4">
                      <div class="card">
                        <div class="card-body">
                          <div class="card-title d-flex align-items-start justify-content-between">
                            <div class="avatar flex-shrink-0">
                              <img
                                src="../assets/img/icons/unicons/pupple_profile.PNG"
                                height="20"
                                alt="chart success"
                                class="rounded"
                              />
                            </div>
                          </div>
                          <span class="fw-semibold d-block mb-1"><strong>Daily</strong> Subscriber</span>
                          <h3 class="card-title mb-2">
	                      <%int  dailyCnt= DashDAO.getInstance().selectSignCustomer("dd");%>
						  <%=dailyCnt %> 
                          </h3>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-6 col-md-12 col-6 mb-4">
                      <div class="card">
                        <div class="card-body">
                          <div class="card-title d-flex align-items-start justify-content-between">
                            <div class="avatar flex-shrink-0">
                              <img
                                src="../assets/img/icons/unicons/blue_profile.PNG"
                                height="20"
                                alt="chart success"
                                class="rounded"
                              />
                            </div>
                          </div>
                          <span class="fw-semibold d-block mb-1"><strong>Monthly</strong> Subscriber</span>
                          <h3 class="card-title mb-2">
                          <%int  monthlyCnt= DashDAO.getInstance().selectSignCustomer("MM");%>
						  <%=monthlyCnt %> 
                          </h3>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
 <!-- Number of member by region -->
				  <div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4">
                  <div class="card">
                    <div class="row row-bordered g-0">
                      <div class="col-md-8">
                        <h5 class="card-header m-0 me-2 pb-3">Number of member by region</h5>
                        <div class="px-2" style="text-align:center;">
							<img src="../assets/img/icons/unicons/seoul_map.jpg" 
							height="320"
							style="margin-bottom:30px;"/>                      
                        </div>
                      </div>
                      <div class="col-md-4" style="border:0px;" >
                        <div class="card-body" style="margin:30px;">
                          <div class="text-center">
                            <div>
	                            <select id="region" onchange="guCnt()" class="form-select mb-3 btn-outline-primary text-center" aria-label="Disabled select example">
	 							 <c:forEach var="data" items="${lList }">
	 							 <option style="background-color:white; color:gray;" value="${ data.guCode }"><c:out value="${ data.guName }" /> </option>
								 </c:forEach>
								</select>							
                            </div>
                          </div>
                        </div>
                        <div style="margin:0px auto; width:100px; height:100px; border-radius:50px;" id="localColor"></div>
                        <div class="px-xxl-4 px-lg-2 p-4 text-center">
						<h3 class="mb-0" id="localCusCnt"></h3>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
 <!--------------/ Number of member by region ------------------->
                <div class="col-12 col-md-8 col-lg-4 order-3 order-md-2">
                  <div class="row">
                    <div class="col-12 mb-8">
                      <div class="card" style="height:410px;">
                        <div class="card-body">
                          <div class="d-flex justify-content-between flex-sm-row flex-column gap-3">
                            <div class="d-flex flex-sm-column flex-row align-items-start justify-content-between">
                              <div class="card-title">
                                <h5 class="text-nowrap mb-2">Profit</h5>
                                <span class="badge bg-label-warning rounded-pill">advertisement</span>
                              </div>
                            </div>
                          </div>
                          <div>
                            <select onchange="profitTerm(this.value)" class="form-select mb-3 btn-outline-primary text-center" aria-label="Disabled select example">
 							 <option style="background-color:white; color:gray;" value="dd">Daily</option>
 							 <option style="background-color:white; color:gray;" value="MM">Monthly</option>
  			 				 <option style="background-color:white; color:gray;" value="yyyy">Yearly</option>
							</select>
                         </div>
                              <div class="mt-sm-auto text-center">
                                <small class="text-success text-nowrap fw-semibold"
                                  ><i class="bx bx-chevron-up"></i> 68.2%</small
                                >
                                <h3 id="profit" class="mb-0"><%=DashDAO.getInstance().revenue("dd") %>원</h3>
                              </div>
                              <div class="text-center">
                              <img src="../assets/img/icons/unicons/profit.PNG" height="200"/>
                              </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
<!-- Tranaction rate -->
                <div class="col-md-6 col-lg-4 mb-4">
                  <div class="card h-100">
                    <div class="card-header d-flex align-items-center justify-content-between pb-0">
                      <div class="card-title mb-0">
                        <h5 class="m-0 me-2">Transaction rate</h5>
                        <small class="text-muted">Total Transaction</small>
                      </div>
                    </div>
                    <div class="card-body">
                        <div class="text-center">
                            <div>
	                            <select id="tTerm" onchange="transactionByProduct()" class="form-select mb-3 btn-outline-primary text-center" aria-label="Disabled select example">
	 							 <option style="background-color:white; color:gray;" value="dd">Daily</option>
	 							 <option style="background-color:white; color:gray;" value="MM">Monthly</option>
	 							 <option style="background-color:white; color:gray;" value="yyyy">Yearly</option>
								</select>							
                            </div>
                         </div>
                      <div>
                        <div class="tab-pane fade show active">
                          <div class="d-flex justify-content-center pt-4 gap-2">
                            <div class="flex-shrink-0">
                              <div>
<!--Transaction rate chart--> <div id="tChartDiv" style="width: 300px; height: 300px;">
									<!--차트가 그려질 부분-->
									<canvas id="tChart" style="width:100%; height:100%;"></canvas>
<!--Transaction rate chart--> </div>									
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--/ Order Statistics -->

                <!-- Expense Overview -->
                <div class="col-md-6 col-lg-4 mb-4">
                  <div class="card h-100">
                    <div class="card-header d-flex align-items-center justify-content-between pb-0">
                      <div class="card-title mb-0">
                        <h5 class="m-0 me-2">Advertisement rate</h5>
                        <small class="text-muted">Total Advertisement</small>
                      </div>
                    </div>
                    <div class="card-body">
                      <div>
                        <div class="tab-pane fade show active">
                          <div class="d-flex justify-content-center pt-4 gap-2">
                            <div class="flex-shrink-0">
                              <div>
<!--advertisement rate chart--> <div style="width: 300px; height: 300px;">
									<!--차트가 그려질 부분-->
									<canvas id="adRate" style="width:100%; height:100%;"></canvas>
<!--advertisement rate chart--> </div>									
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--/ Expense Overview -->
				
				<!-- Age of Customer -->
                <div class="col-md-6 col-lg-4 order-1 mb-4">
                  <div class="card h-100">
                    <div class="card-header d-flex align-items-center justify-content-between pb-0">
                      <div class="card-title mb-0">
                        <h5 class="m-0 me-2">Age of customer</h5>
                        <small class="text-muted">by region</small>
                      </div>
                    </div>
                    <div class="card-body">
                      <div>
                        <div class="tab-pane fade show active container">
                          <div class="row align-items-start mt-3">
                          <div class="col" style="width:30%;">
                            <select id="term" onchange="ageOfCustomer()" class="form-select mb-3 mr-3 ml-3 btn-outline-primary" aria-label="Disabled select example" >
 							 <option style="background-color:white; color:gray;" value="dd">Daily</option>
 							 <option style="background-color:white; color:gray;" value="MM">Monthly</option>
  			 				 <option style="background-color:white; color:gray;" value="yyyy">Yearly</option>
							</select>
                         </div>
                          <div class="col" style="width:30%;">
                            <select id="local" onchange="ageOfCustomer()" class="form-select mb-3 mr-3 ml-3 btn-outline-primary" aria-label="Disabled select example">
	 							 <c:forEach var="data" items="${lList }">
	 							 <option style="background-color:white; color:gray;" value="${ data.guName }"><c:out value="${ data.guName }" /> </option>
								 </c:forEach>
							</select>
                         </div>
                         <div class="col" style="width:30%;">
                            <select id="gender" onchange="ageOfCustomer()" class="form-select mb-3 mr-3 ml-3 btn-outline-primary" aria-label="Disabled select example">
 							 <option style="background-color:white; color:gray;" value="m">남자</option>
  			 				 <option style="background-color:white; color:gray;" value="f">여자</option>
							</select>
                         </div>
                         </div>
                          <div class="d-flex justify-content-center pt-4 gap-2">
                            <div class="flex-shrink-0">
                              <div>
<!-- age_of_customer chart --> 	<div id="chartDiv" style="width: 300px; height: 300px;">
									<!--차트가 그려질 부분-->
									<canvas id="myChart" style="width:100%; height:100%;"></canvas>
<!-- /age_of_customer chart --> </div>									
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--/ Expense Overview -->
               </div>
            </div>
            <!-- / Content -->

            <!-- Footer -->
            <footer class="content-footer footer bg-footer-theme">
              <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                <div class="mb-2 mb-md-0">
                  ©
                  <script>
                    document.write(new Date().getFullYear());
                  </script>
                  , made with ❤️ by
                  <a href="https://themeselection.com" target="_blank" class="footer-link fw-bolder">ThemeSelection</a>
                </div>
                <div>
                  <a href="https://themeselection.com/license/" class="footer-link me-4" target="_blank">License</a>
                  <a href="https://themeselection.com/" target="_blank" class="footer-link me-4">More Themes</a>

                  <a
                    href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/"
                    target="_blank"
                    class="footer-link me-4"
                    >Documentation</a
                  >

                  <a
                    href="https://github.com/themeselection/sneat-html-admin-template-free/issues"
                    target="_blank"
                    class="footer-link me-4"
                    >Support</a
                  >
                </div>
              </div>
            </footer>
            <!-- / Footer -->

            <div class="content-backdrop fade"></div>
          </div>
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>
      
     
	<script type="text/javascript">

	function transactionByProduct(){
		alert($("#tTerm").val());
		$.ajax({
			url:"http://localhost/bada_prj/badasaja_admin/jsp/transaction_chart_ajax.jsp",
			 data: {
				   term : $("#tTerm").val(),
			},
			type:"get",
			dataType:"json",
			error:function(xhr){
					alert(xhr.status+"/"+xhr.statusText);
			},//end error
			success:function(jsonObj){
				var ot = jsonObj.ot;
				var pe = jsonObj.pe;
				var be = jsonObj.be;
				var ho = jsonObj.ho;
				var fo = jsonObj.fo;
				var is = jsonObj.is;
				var cl = jsonObj.cl;
				var fu = jsonObj.fu;
				var el = jsonObj.el;
				var wr = jsonObj.wr;
				
				//Chart를 재사용하기 위해 초기화함.	
	            $('#tChart').remove();
	            $('#tChartDiv').append('<canvas id="tChart" style="width:100%; height:100%;"></canvas>');
	            
	            //Transaction Rate
	            var con = document
	                .getElementById('tChart')
	                .getContext('2d');
	            var tChart = new Chart(con, {
	                type: 'bar', // 차트의 형태
	                data: { // 차트에 들어갈 데이터
	                    labels: [
	                        '기타물품','반려 동물 용품','뷰티,미용',
	                        '생활용품','식품','악기','의류','인테리어,가구',
	                        '전자기기','학용품'
	                    ],
	                    datasets: [
	                        { //데이터
	                        	axis: 'y',
	                            label: 'transaction rate', //차트 제목
	                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
	                            data: [
	                				ot, pe, be, ho, fo, is, cl, fu, el, wr
	                            ],
	                            backgroundColor: [
	                                //색상
	                                'rgb(61, 44, 141)'
	                            ],
	                            borderColor: [
	                                //경계선 색상
	                            	'rgb(61, 44, 141)'
	                            ],
	                            borderWidth: 1 //경계선 굵기
	                        }
	                    ]
	                },
	                options: {
	                	indexAxis: 'y',
	                	responsive: false,
	                    scales: {
	                        yAxes: [
	                            {
	                                ticks: {
	                                    beginAtZero: true
	                                }
	                            }
	                        ]
	                    }
	                }
	            });
	        //transaction Rate
			}//success
		})//ajax
	}//transactionByProduct()
	
	
	function ageOfCustomer(){
		$.ajax({
			url:"http://localhost/bada_prj/badasaja_admin/jsp/age_of_customer_ajax.jsp",
			 data: {
				   term : $("#term").val(),
				   local : $("#local").val(),
				   gender : $("#gender").val(),
			},
			type:"post",
			dataType:"json",
			error:function(xhr){
					alert(xhr.status+"/"+xhr.statusText);
			},//end error
			success:function(jsonObj){
				var teens = jsonObj.teens;
				var twenties = jsonObj.twenties;
				var thirties = jsonObj.thirties;
				var forties = jsonObj.forties;
				var fifties = jsonObj.fiftes;
				var sixties = jsonObj.sixties;
				
				//Chart를 재사용하기 위해 초기화함.	
	            $('#myChart').remove();
	            $('#chartDiv').append('<canvas id="myChart" style="width:100%; height:100%;"></canvas>');
	            
	            /*Chart.js Age of customer chart */
		        var context = document
	                .getElementById('myChart')
	                .getContext('2d');
	            var myChart = new Chart(context, {
	                type: 'bar', // 차트의 형태
	                data: { // 차트에 들어갈 데이터
	                    labels: [
	                        //x 축
	                        '10대','20대','30대','40대','50대','60대'
	                    ],
	                    datasets: [
	                        { //데이터
	                            label: 'Members', //차트 제목
	                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
	                            data: [
	                            	teens,
	                            	twenties,
	                            	thirties,
	                            	forties,
	                            	fifties,
	                            	sixties,
	                               //x축 label에 대응되는 데이터 값
	                            ],
	                            backgroundColor: [
	                                //색상
	                                '#E8EDF3',
	                                '#C2CFE5',
	                                '#9FAED7',
	                                '#7F8AC9',
	                                '#6265BB',
	                            ],
	                            borderColor: [
	                                //경계선 색상
	                                '#E8EDF3',
	                                '#C2CFE5',
	                                '#9FAED7',
	                                '#7F8AC9',
	                                '#6265BB',
	                            ],
	                            borderWidth: 0.5 //경계선 굵기
	                        }
	                    ]
	                },
	                options: {
	                	responsive: false,
	                    scales: {
	                        yAxes: [
	                            {
	                                ticks: {
	                                    beginAtZero: true
	                                }
	                            }
	                        ]
	                    }
	                }
	            })/*Chart.js /Age of customer chart */
			}//success
		})//ajax
	}//ageOfCustomer
	
	
	function profitTerm(value){
		<%int profit= 0;%>
		if(value=="MM"){
			<%profit= DashDAO.getInstance().revenue("MM");%>
			$("#profit").html(<%=profit %>+"원");
		}else if(value=="dd"){
			<%profit= DashDAO.getInstance().revenue("dd");%>
			$("#profit").html(<%=profit %>+"원");
		}else{
			<%profit= DashDAO.getInstance().revenue("yy");%>
			$("#profit").html(<%=profit %>+"원");
		}//end else
	} //profitTerm
	
	
	function guCnt(){ 
		var value=$("#region").val();
 		$.ajax({
			url:"http://localhost/bada_prj/badasaja_admin/jsp/local_customer_chart_ajax.jsp",
			data:{localCode:value},
			dataType:"json",
			type:"post",
			error:function(xhr){
				alert(xhr.status+"/"+xhr.statusText);
			},//end error
			success:function(data){
				$("#localCusCnt").html(data.cusCnt);
				$("#localColor").css("background-color",data.color);
				}//end success
		})//end ajax 
	}//guCode
	
	

	<!-- Advertisement Rate -->
            var context = document
                .getElementById('adRate')
                .getContext('2d');
            var adRate = new Chart(context, {
                type: 'pie', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: [
                        //광고 종류
                        'Forum','Banner'
                    ],
                    datasets: [
                        { //데이터
                            label: 'advertisement', //차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data: [
                                <%=DashDAO.getInstance().selectForumCnt()%>, <%=DashDAO.getInstance().selectBannerCnt()%>//광고 종류 label에 대응되는 데이터 값
                            ],
                            backgroundColor: [
                                //색상
                                '#4F47AD',
                                '#7F8AC9',
                            ],
                            borderColor: [
                                //경계선 색상
                                '#4F47AD',
                                '#7F8AC9',
                            ],
                            borderWidth: 1 //경계선 굵기
                        }
                    ]
                },
                options: {
                	responsive: false,
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    beginAtZero: true
                                }
                            }
                        ]
                    }
                }
            });
    //Advertisement Rate      
    

    </script>
    
      

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->

    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="../assets/vendor/libs/jquery/jquery.js"></script>
    <script src="../assets/vendor/libs/popper/popper.js"></script>
    <script src="../assets/vendor/js/bootstrap.js"></script>
    <script src="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="../assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->
    <script src="../assets/vendor/libs/apex-charts/apexcharts.js"></script>

    <!-- Main JS -->
    <script src="../assets/js/main.js"></script>

    <!-- Page JS -->
    <script src="../assets/js/dashboards-analytics.js"></script>

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
    
  </body>
</html>

