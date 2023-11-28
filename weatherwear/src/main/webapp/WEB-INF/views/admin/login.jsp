<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"/>
<style>
   
   html,
   body {
     height: 100%;
   }
   
   body {
     display: flex;
     align-items: center;
     padding-top: 40px;
     padding-bottom: 40px;
     background-color: #f5f5f5;
   }
   
   .form-signin {
     width: 100%;
     max-width: 330px;
     padding: 15px;
     margin: auto;
   }
   
   .form-signin .checkbox {
     font-weight: 400;
   }
   
   .form-signin .form-floating:focus-within {
     z-index: 2;
   }
   
   .form-signin input[type="email"] {
     margin-bottom: -1px;
     border-bottom-right-radius: 0;
     border-bottom-left-radius: 0;
   }
   
   .form-signin input[type="password"] {
     margin-bottom: 10px;
     border-top-left-radius: 0;
     border-top-right-radius: 0;
   }

</style>

<script>
$(document).ready(function(){
	
	
});
</script>
</head>
<body class="text-center">
   <main class="form-signin">
      <form action="adminLogin.mdo" method="post">
     	 <img class="mb-4" src="resources/image/admin/login_logo.png" alt="" width="300" height="300">
     	 
         <div class="form-floating">
            <input type="text" class="form-control" id="clientId" name="clientId" onkeyup='print1()' placeholder="Id" value="admin">
            <input type="password" class="form-control" id="clientPwd" name="clientPwd" placeholder="Password" value="admin123">
         </div>
         
         <div class="checkbox mb-3">
         </div>
         <button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
         <div id='result'></div>
      </form>
   </main>
   
</body>
</html>