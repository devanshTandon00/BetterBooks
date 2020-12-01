<html>
    <head>
        <link href = 'customerLandingPage.css' rel = 'stylesheet'>
        <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@600&family=Work+Sans:ital@1&display=swap" rel="stylesheet">    
        <link rel="stylesheet" href= "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <header> 
            <div class = "container">
                <img src = "../images/icon-book.svg" class="book-icon">
                <h3 class = "projectTitle"><a href = "customerLandingPage.jsp"> BetterBooks </a></h3>
                <nav class = "navbar fixed-top">
                    <ul>
                        <li><a href="../DisplayItems">Bookstore</a></li>
                        <li><a href="../aboutPage/about.jsp">About</a></li>
                        <li><a href="../inventoryPage/inventory.jsp">Inventory</a></li>
                          <li><a href = "../searchPage/search.jsp">Search</a></li>
                        <li><a href="../sellerPage/sellBookForm.jsp"> Add Book </a></li>
                      
                    </ul>
                </nav>
            </div>
        </header>

        <div class = "greeting">
        	<h2 class = "greetingHead"><u>Hello, ${username}</u></h2>
        	<form action ="<%=request.getContextPath()%>/logout">
        		<input type = "submit" value = "Logout" class = "logout">
        	</form>
        </div>
        
        <div class = "inputBox">
            <input type = "search" placeholder="Enter book name ...." class = "searchBox"> 
            <i class="fa fa-search" aria-hidden="true"></i>
        </div>

        <div class = "bookSection">
            <img src="../images/book.png" class = "bookIMG">
            <img src="../images/book_1.jpg" class = "bookIMG">
            <img src="../images/book_2.jpg" class = "bookIMG">
            <img src="../images/book_3.webp" class = "bookIMG">
            <img src="../images/book_4.png" class = "bookIMG">
            <img src="../images/book_5.jpg" class = "bookIMG">
            <img src="../images/book_6.jpg" class = "bookIMG">
            <img src="../images/book_7.jpg" class = "bookIMG">
        </div>
    </body>
</html>