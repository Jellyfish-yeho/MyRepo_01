<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 

				<nav class="navbar navbar-expand-lg navbar-light bg-light">
					<div class="container">	
						<a class="navbar-brand" href="<%=request.getContextPath()%>/myWebs/01_SHINee.jsp">
							<img src="../myWebsImg/shinee logo.png" width=30px;/> <strong id="shinee">SHINee</strong>
						</a>
						<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarNav">
							<ul class="navbar-nav navbar-left">
								<li class="nav-item">
									<a class="nav-link" href="#" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight">History
										<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
												<div class="offcanvas-header">
													<h5 id="offcanvasRightLabel">History</h5>
													<button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"></button>
												</div>
												<div class="offcanvas-body">
												    <ul class="list-group list-group-flush">
														<li class="list-group-item nav-item" >
															<p>
																<a class="link-success" data-bs-toggle="collapse" href="#collapseExample" >
																	2008 - 2010
																	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
																		<path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
																	</svg>															 	
																</a>
															</p>
															<div class="collapse" id="collapseExample">
															  <div class="card card-body">
															  	<ul>
															  		<li>누난너무예뻐</li>
															  		<li>AMIGO</li>
															  		<li>ROMEO</li>
															  		<li>Lucifer</li>
															  		<li>Hello</li>															  	
															  	</ul>														
															  </div>
															</div>
														</li>															
														<li class="list-group-item">2011 - 2013</li>
														<li class="list-group-item">2015 - 2017</li>
														<li class="list-group-item">2018 - 2020</li>
													</ul>
												</div>
										</div>
									</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="#membersContent">Members</a>
								</li>
								<li class="nav-item">
									<li class="nav-item dropdown">
										<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
											Albums
										</a>
										<ul class="dropdown-menu">
											<li><a class="dropdown-item nav-link" href="<%=request.getContextPath() %>/myWebs/02_Atlantis.jsp" >7th Repackage : Atlantis</a></li>
											<li><a class="dropdown-item nav-link" href="<%=request.getContextPath() %>/myWebs/03_DontCallMe.jsp">7th : Don7t Call Me</a></li>
											<li><hr class="dropdown-divider"></li>
											<li><a class="dropdown-item nav-link" href="https://namu.wiki/w/%EC%83%A4%EC%9D%B4%EB%8B%88">See All...</a></li>
										</ul>
									</li>	           
								<li class="nav-item">
									<a class="nav-link" target="_blank" href="https://smtownandstore.com/product/celeb_shinee.html?cate_no=49">Shop</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="<%=request.getContextPath()%>/myWebs/04_GuestBook.jsp">GuestBook</a>
								</li>
							</ul>	
						</div>

						<div class="w-100 clearfix">
							<a class="btn btn-sm btn-outline-success float-end ms-2" href="<%=request.getContextPath()%>/myWebs/signup_form.jsp">Sign up</a>						
							<a class="btn btn-sm btn-outline-success float-end" href="<%=request.getContextPath()%>/myWebs/login_form.jsp">Log in</a>
						</div>
					</div>	
				</nav>

    