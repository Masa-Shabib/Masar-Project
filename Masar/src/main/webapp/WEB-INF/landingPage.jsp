<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css"/>
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!-- JQUERY -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    <!-- SMOOTH SCROLL -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script>
        $(function () {
            $('a[href*=#]:not([href=#])').click(function () {
                if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location
                    .hostname == this.hostname) {
                    var target = $(this.hash);
                    target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                    if (target.length) {
                        $('html,body').animate({
                            scrollTop: target.offset().top
                        }, 500);
                        return false;
                    }
                }
            });
        });
    </script>
    <!-- End of SMOOTH SCROLL -->
	
	  <style>
      /* Carousel styling */
      #introCarousel,
      .carousel-inner,
      .carousel-item,
      .carousel-item.active {
        height: 100vh;
      }
      
      section{height:100vh;}

      .carousel-item:nth-child(1) {
        background-image: url('https://i.ibb.co/GCkV5JG/IMG-20211217-142604-1.jpg');
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center center;
      }

      .carousel-item:nth-child(2) {
        background-image: url('https://mdbootstrap.com/img/Photos/Others/images/77.jpg');
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center center;
      }

      .carousel-item:nth-child(3) {
        background-image: url('https://mdbootstrap.com/img/Photos/Others/images/78.jpg');
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center center;
      }
      #join{
       background-image: url('https://i.ibb.co/5xzNg8D/IMG-20211015-163617.jpg');
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center center;
        margin-left: calc(50% - 50vw);
   		margin-right: calc(50% - 49.5vw);
      }
	
	#vision{
       background-image: url('https://i.ibb.co/L8zLQ1z/IMG-20211013-112137.jpg');
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center center;
        margin-left: calc(50% - 50vw);
   		margin-right: calc(50% - 49.5vw);
        
        
      }
	
      /* Height for devices larger than 576px */
      @media (min-width: 992px) {
        #introCarousel {
          margin-top: -58.59px;
        }
      }

      .navbar .nav-link {
        color: #fff !important;
      }
    </style>
</head>
<body>
  <!--Main Navigation-->
  <header>
  

    <!-- Navbar -->
    <nav class="navbar fixed-top navbar-expand-lg navbar-dark d-none d-lg-block " style="z-index: 2000;background-color:#333333">
      <div class="container-fluid">
        <!-- Navbar brand -->
       <a class="navbar-brand me-5" href="/masar"><img
                    src="https://i.ibb.co/3mwbKsD/masar2.png"
                    alt="logo" style="width: 120px; height: 40px;"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
        <div class="collapse navbar-collapse" id="navbarExample01">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
         
            <li class="nav-item">
              <a class="nav-link" href="#featured" rel="nofollow"
                target="_blank">Featured Trails</a>
            </li>
             <li class="nav-item">
              <a class="nav-link" href="#users" target="_blank">Masar users</a>
            </li>
             <li class="nav-item">
              <a class="nav-link" href="#join" target="_blank">Join us</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#vision" target="_blank">Our Vision</a>
            </li>
           	<c:set var="user2" value="${currentUser }"/> 
          <c:choose>
			    <c:when test="${user2==null}">
			        <li class="nav-item active">
             			 <a class="nav-link" aria-current="page" href="/login">Login</a>
            		</li>
			    </c:when>    
			    <c:otherwise>
			    	<li class="nav-item active">
                        <a class="nav-link" href="/masar/trails" >Trails</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="/masar/businessTrails" >Business Trails</a>
                    </li>
			        <li class="nav-item active">
                       <form id="logoutForm" method="POST" action="/logout">
                              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                              <input style="border-radius:20px;color:white" type="submit" value="Logout!"  class="btn btn-outline-secondary"/>
                        </form>
            		</li>
			    </c:otherwise>
			</c:choose>
          </ul>

          <ul class="navbar-nav d-flex flex-row">
                        <!-- Icons -->
                        <li class="nav-item me-3 me-lg-0">
                            <a class="nav-link" href="#"
                                rel="nofollow"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                    fill="currentColor" class="bi bi-youtube me-3" viewBox="0 0 16 16">
                                    <path
                                        d="M8.051 1.999h.089c.822.003 4.987.033 6.11.335a2.01 2.01 0 0 1 1.415 1.42c.101.38.172.883.22 1.402l.01.104.022.26.008.104c.065.914.073 1.77.074 1.957v.075c-.001.194-.01 1.108-.082 2.06l-.008.105-.009.104c-.05.572-.124 1.14-.235 1.558a2.007 2.007 0 0 1-1.415 1.42c-1.16.312-5.569.334-6.18.335h-.142c-.309 0-1.587-.006-2.927-.052l-.17-.006-.087-.004-.171-.007-.171-.007c-1.11-.049-2.167-.128-2.654-.26a2.007 2.007 0 0 1-1.415-1.419c-.111-.417-.185-.986-.235-1.558L.09 9.82l-.008-.104A31.4 31.4 0 0 1 0 7.68v-.123c.002-.215.01-.958.064-1.778l.007-.103.003-.052.008-.104.022-.26.01-.104c.048-.519.119-1.023.22-1.402a2.007 2.007 0 0 1 1.415-1.42c.487-.13 1.544-.21 2.654-.26l.17-.007.172-.006.086-.003.171-.007A99.788 99.788 0 0 1 7.858 2h.193zM6.4 5.209v4.818l4.157-2.408L6.4 5.209z" />
                                </svg>
                                <i class="fab fa-youtube"></i>
                            </a>
                        </li>
                        <li class="nav-item me-3 me-lg-0">
                            <a class="nav-link" href="#" rel="nofollow"><svg
                                    xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                    class="bi bi-facebook me-3" viewBox="0 0 16 16">
                                    <path
                                        d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z" />
                                </svg>
                                <i class="fab fa-facebook-f"></i>
                            </a>
                        </li>
                        <li class="nav-item me-3 me-lg-0">
                            <a class="nav-link" href="#" rel="nofollow"><svg
                                    xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                    class="bi bi-twitter me-3" viewBox="0 0 16 16">
                                    <path
                                        d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15z" />
                                </svg>
                                <i class="fab fa-twitter"></i>
                            </a>
                        </li>
                        <li class="nav-item me-3 me-lg-0">
                            <a class="nav-link" href="#" rel="nofollow"><svg
                                    xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                    class="bi bi-github me-5" viewBox="0 0 16 16">
                                    <path
                                        d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.012 8.012 0 0 0 16 8c0-4.42-3.58-8-8-8z" />
                                </svg>
                                <i class="fab fa-github"></i>
                            </a>
                        </li>
                    </ul>
        </div>
      </div>
    </nav>
    <!-- Navbar -->

    <!-- Carousel wrapper -->
    <div id="introCarousel" class="carousel slide carousel-fade shadow-2-strong" data-mdb-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-mdb-target="#introCarousel" data-mdb-slide-to="0" class="active"></li>
        <li data-mdb-target="#introCarousel" data-mdb-slide-to="1"></li>
        <li data-mdb-target="#introCarousel" data-mdb-slide-to="2"></li>
      </ol>

      <!-- Inner -->
      <div style="height:112vh" class="carousel-inner">
        <!-- Single item -->
        <div style="height: 112vh " class="carousel-item active">
          <div style="height: 112vh;background-color: rgba(0, 0, 0, 0.1);"   class="mask" >
            <div class="d-flex justify-content-center align-items-center h-100">
              <div class="text-white text-center">
                <h1 class="mb-3">Explore Existing Trails By Your Favourite Location</h1>
               <form class="mt-4"  action="/masar/trails/search" >
                <div class="form-floating d-flex mt-3 justify-content-center">
                    <input style="width:500px;margin-top:7px;height:calc(2.9rem + 2px)" class="form-control me-2" name="location" type="search" placeholder="Search By Location" id="location" aria-label="Search">
                    <label style="margin-left:150px;color:grey;" name="location" for="floatingInput">Search By Location</label>
                    <button class="btn btn-outline-light btn-lg m-2" role="button" rel="nofollow" target="_blank">Explore</button>
               	</div>
               </form>		
                
              </div>
            </div>
          </div>
        </div>

        <!-- Single item -->
        <div class="carousel-item">
          <div class="mask" style="background-color: rgba(0, 0, 0, 0.3);">
            <div class="d-flex justify-content-center align-items-center h-100">
              <div class="text-white text-center">
                <h2>You can place here any content</h2>
              </div>
            </div>
          </div>
        </div>

        <!-- Single item -->
        <div class="carousel-item">
          <div class="mask" style="
                background: linear-gradient(
                  45deg,
                  rgba(29, 236, 197, 0.7),
                  rgba(91, 14, 214, 0.7) 100%
                );
              ">
            <div class="d-flex justify-content-center align-items-center h-100">
              <div class="text-white text-center">
                <h2>And cover it with any mask</h2>
                <a class="btn btn-outline-light btn-lg m-2"
                  href="https://mdbootstrap.com/docs/standard/content-styles/masks/" target="_blank" role="button">Learn
                  about masks</a>
              </div>
            </div>
          </div>
        </div>
      </div>
     </div>
      <!-- Inner -->

    <!-- Carousel wrapper -->
  </header>
  <!--Main Navigation-->

  <!--Main layout-->
  <main class="mt-5">
    <div class="container">
      <!--Section: Content-->
      
      
      <!--Section: Content-->

      <hr class="my-5" />

      <!--Section: Content-->
      
      <section id="featured" class="text-center d-flex align-items-center">
        <div class="row">
        <h4 class="m-5 "><strong>Featured Trails</strong></h4>
          <div class="col-lg-4 col-md-12 mb-4">
            <div class="card">
              <div class="bg-image hover-overlay ripple" data-mdb-ripple-color="light">
                <img src="https://mdbootstrap.com/img/new/standard/nature/184.jpg" class="img-fluid" />
                <a href="#!">
                  <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                </a>
              </div>
              <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">
                  Some quick example text to build on the card title and make up the bulk of the
                  card's content.
                </p>
                <a href="#!" class="btn btn-outline-secondary">Details</a>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card">
              <div class="bg-image hover-overlay ripple" data-mdb-ripple-color="light">
                <img src="https://mdbootstrap.com/img/new/standard/nature/023.jpg" class="img-fluid" />
                <a href="#!">
                  <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                </a>
              </div>
              <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">
                  Some quick example text to build on the card title and make up the bulk of the
                  card's content.
                </p>
                <a href="#!" class="btn btn-outline-secondary">Details</a>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card">
              <div class="bg-image hover-overlay ripple" data-mdb-ripple-color="light">
                <img src="https://mdbootstrap.com/img/new/standard/nature/111.jpg" class="img-fluid" />
                <a href="#!">
                  <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                </a>
              </div>
              <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">
                  Some quick example text to build on the card title and make up the bulk of the
                  card's content.
                </p>
                <a href="#!" class="btn btn-outline-secondary">Details</a>
              </div>
            </div>
          </div>
        </div>
      </section>
     <!--Section: Content--> 
 
      <hr id="users" class="my-5" />
      
      
      <!--Section: Content-->
      <section  class="d-flex align-items-center">
      <div>
          <div class="row">
            <div class="col-md-6 gx-5 mb-4">
              <div class="bg-image hover-overlay ripple shadow-2-strong rounded-5" data-mdb-ripple-color="light">
                <img src="https://i.ibb.co/Nnxh6pg/IMG-20210402-093503.jpg" class="img-fluid" style="height:350px; width:600px" />
                <a href="#!">
                  <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                </a>
              </div>
            </div>

            <div class="col-md-6 gx-5 mb-4">
              <h4><strong>Hikers who are looking for adventure</strong></h4>
              <p class="text-muted">
                Hiking is a bit like life: The journey only requires you to put one foot
                in front of the other again and again and again. And if you allow yourself the
				opportunity to be present throughout the entirety of the trek, you will witness beauty every step of the way,
				 not just at the summit.
              </p>
              <p><strong>You can join them too!</strong></p>
              <p class="text-muted">
                Feel the fear and do it anyway!
              </p>
            </div>
          </div>
          
        
        <!--Section: Content-->
          
          <div class="row">
            
            <div class="col-md-6 gx-5 mb-4">
              <h4><strong>Trail guides who are looking for support</strong></h4>
              <p class="text-muted">
                Our goal is to connect those guides with people that have the spirit of adventure,
                 forming a bridge that leads to knowing more about the history and civilization of our magnificent homeland.
              </p>
              <p><strong>Host your own trails!</strong></p>
              <p class="text-muted">
                Your trail is our vision.
              </p>
            </div>
            
            <div class="col-md-6 gx-5 mb-4">
              <div class="bg-image hover-overlay ripple shadow-2-strong rounded-5" data-mdb-ripple-color="light">
                <img src="https://i.ibb.co/8KQswPg/IMG-20211105-112815.jpg" class="img-fluid"  style="height:350px; width:600px"/>
                <a href="#!">
                  <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                </a>
              </div>
            </div>
          </div>
          </div>
        </section>
        
        <!--Section: Content-->

        <hr class="my-5" />
        

      <!--Section: Content-->
      
      <section id="join">
      
      
      
      
      <div class="d-flex justify-content-center align-items-center h-100" >
         <div class="text-dark text-center">
            <h2 class="mb-3">"A walk in nature walks the soul back home." - MARY DAVIS</h2>
            
            <a class="btn btn-outline-secondary" href="/registration"  >Register as a Hiker</a>
            <a class="btn btn-outline-secondary" href="/registration/client"  >Register as a Guide</a>
             
 		</div>
      </div>
      
      
      
      </section>
   
      <!--Section: Content-->
      <hr class="my-5" />
      <!--Section: Content-->
      
      <section id="vision">
      <div class="d-flex justify-content-center align-items-center h-100">
         <div class="text-dark text-center">
            <h2 style="font-size:50px" class="mb-3">Our Vision</h2>
            
 		<img style="width:800px;height:300px" alt="Masar Logo" src="https://i.ibb.co/L9TyH4d/masar.png">
 		
           <p style= "font-size:25px;font-weight:500">
           Masar is built to enrich our lives and enlarge our understanding of Palestinian history,<br>
            while creating for us a sense of continuity through outdoor trips to historical landmarks which strengthens<br>
             the roots of Palestinian identity, through observing the beauty of nature in our beloved holy homeland.
           
			</p>
             
 		</div>
 		
      </div>
      
      
      
      </section>
   
      <!--Section: Content-->
      
      
      
      
      
      
    </div>
  </main>
  <!--Main layout-->

  <!--Footer-->
  

    <footer>

    <!-- Copyright -->
    <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
    	<h6>Designed by Masa Shabib, Mubarak Mubarak and Mohammad Omair</h6>
      © 2022 Copyright:
      <a class="text-dark" href="/masar">Masar.com</a>
    </div>
    <!-- Copyright -->
  </footer>
  <!--Footer-->
  
   <!-- sript-for-icons -->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

</body>
</html>