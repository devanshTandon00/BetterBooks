<html>
    <head>
        <link href = 'landingPage.css' rel = 'stylesheet'>
        <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@600&family=Work+Sans:ital@1&display=swap" rel="stylesheet">    
        <link rel="stylesheet" href= "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <header> 
            <div class = "container">
                <img src = "../images/icon-book.svg" class="book-icon">
                <h3 class = "projectTitle"><a href = "index.jsp"> BetterBooks </a></h3>
                <nav class = "navbar fixed-top">
                    <ul>
                        <li><a href = "../loginPage/login.jsp">Register</a></li>
                        <li><a href="../DisplayItems">Bookstore</a></li>
                        <li><a href="../aboutPage/about.jsp">About</a></li>
                        <li><a href="../inventoryPage/inventory.jsp">Inventory</a></li>
                        <li><a href="../ViewCartItems">
                                <img src="../images/cart-icon.png" class="cart_icon" width="30" height="25">
                        </a></li>    
                    </ul>
                </nav>
            </div>
        </header>

        <div class = "inputBox">
        	<form class="search" action="../searchPage/search.jsp?sortBy=default">
        		<input type="text" placeholder="Search for book...." name="search" class = "searchBox" style = "width:100%">
        		<input type="hidden" name="sortBy" value="default">
        	</form>
        </div>
        <div>
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