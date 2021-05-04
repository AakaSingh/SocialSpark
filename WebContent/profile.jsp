<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/profile.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.1/css/all.css" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
<main>
	<header>
            <div class="tb">
                <div class="td" id="logo">
                    <a href="#"><i class="fab fa-facebook-square"></i></a>
                </div>
                <div class="td" id="search-form">
                    <form method="get" action="#">
                        <input type="text" placeholder="Search Facebook">
                        <button type="submit"><i class="material-icons">search</i></button>
                    </form>
                </div>
                <div class="td" id="f-name-l"><span>Dhruv's Profile</span></div>
                <div class="td" id="i-links">
                    <div class="tb">
                        <div class="td" id="m-td">
                            <div class="tb">
                                <span class="td"><i class="material-icons">person_add</i></span>
                                <span class="td"><i class="material-icons">chat_bubble</i></span>
                                <span class="td m-active"><i class="material-icons">notifications</i></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
       
        <div id="main-content">
            <div class="tb">
                <div class="td" id="r-col">
                    <div id="chat-bar">
                        <div id="chat-lb"><i class="material-icons">contacts</i><span>Friends</span></div>
                        <div id="cts">
                            <div class="on-ct active">
                                <a href="#"><img src="img/a.png">Aakash</a><br/>
                            </div>
                            <div class="on-ct active">
                                <a href="#"><img src="img/ss.png">Sahil </a>
                            </div>
                            <div class="on-ct">
                                <a href="#"><img src="img/n.png">Nirav</a>
                            </div>
                             <div class="on-ct active">
                                <a href="#"><img src="img/n.png">Trudeau</a>
                            </div>
                            <div class="on-ct active">
                                <a href="#"><img src="img/h.png">Harshil</a>
                            </div>          
                        </div>
                    </div>
                                 
                    
                   
                   
                   
                </div>
                <div class="td" id="m-col">
                    <div class="m-mrg" id="p-tabs">
                        <div class="tb">
                            <div class="td">
                                <div class="tb" id="p-tabs-m">
                                    <div class="td active"><i class="material-icons">av_timer</i><span>TIMELINE</span></div>
                         
                                    <div class="td"><i class="material-icons">archive</i><span>ARCHIVE</span></div>
                                </div>
                            </div>
                            <div class="td" id="p-tab-m"><i class="material-icons">keyboard_arrow_down</i></div>
                        </div>
                    </div>
                    <div class="m-mrg" id="composer">
                        <div id="c-tabs-cvr">
                            <div class="tb" id="c-tabs">
                                <div class="td active"><i class="material-icons">subject</i><span>Make Post</span></div>
                             
                            </div>
                        </div>
                        <div id="c-c-main">
                            <div class="tb">
                                <div class="td" id="p-c-i"><img src="img/d.jpg"></div>
                                <div class="td" id="c-inp">
                                    <input type="text" placeholder="What's on your mind?">
                                    <input type="button" value="submit" style="width: 30%; float: right;">
                                </div>			
                            </div>
                            <br>
                            <div id="insert_emoji"><i class="material-icons">insert_emoticon</i></div>
                        </div>
                    </div>
                    <div>
                        <div class="post">
                            <div class="tb">
                                <a href="#" class="td p-p-pic"><img src="img/a.png"></a>
                                <div class="td p-r-hdr">
                                    <div class="p-u-info">
                                        <a href="#">Aakash Singh</a> shared a memory with <a href="#">Dhruv Shah</a> 
                                    </div>
                                    <div class="p-dt">
                                        <i class="material-icons">calendar_today</i>
                                        <span>April 29, 2021</span>
                                    </div>
                                </div>
                                <div class="td p-opt"><i class="material-icons">keyboard_arrow_down</i></div>
                            </div>
                            <a href="#" class="p-cnt-v">
                                <img src="img/v.jpg">
                            </a>
                            <div>
                                <div class="p-acts">
                                    <div class="p-act like"><i class="material-icons">thumb_up_alt</i><span>25</span></div>
                                    <div class="p-act comment"><i class="material-icons">comment</i><span>1</span></div>
                                    <div class="p-act share"><i class="material-icons">reply</i></div>
                                </div>
                            </div>
                        </div>
                    </div>
                 		
                </div>
               
            </div>
        </div></main>
</body>
</html>