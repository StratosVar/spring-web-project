<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="header.jsp"></c:import>
<style>


.container{
   
    margin:auto;
    overflow: inherit;
    
}
    

ul{
    margin: 0%;
    padding: 0%;
}

.dark{
    padding: 15px;
    background: #35424a;
    color: #ffffff;
    margin-top: 10px;
    margin-bottom: 10px;
}

#showcase{
	min-height:500px;
    background: url("${pageContext.request.contextPath}/images/image33.jpg") no-repeat center;
    color: #ffffff;
    width: 100%;
    height: auto;
    background-size: 100% 100%;
    
}

#showcase .container{
	text-align: left;
    margin-left: 1%;
    /* text-align: center; */
}

#showcase h1{
    margin-top: 100px;
    font-size: 65px;
    font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
    margin-bottom: 10px;
    text-shadow: 0 0 20px #4f0977;
    filter: blur(0.5px);
}

#showcase p{
    font-size: 20px;
    font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode',Verdana, sans-serif;
    text-shadow: 0 0 20px #00060f;
    font-weight: 900;
    filter: blur(0.5px);
}


.btn-strat{
    background-color: #e8491d;
    border: none;
    color: white;
    padding: 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 2px 10px;
    transition: 0.8s all;
}

.btn-strat:hover {
    background-color: #ffffff;
    color: #e8491d;
}

#boxes{
    margin-top: 20px;
    background-color: #ffffff;
}

#boxes .box{
    float: left;
    text-align: center;
    width: 33%;
    padding: 100px;
    margin-top: -7%;
    
}

#boxes .box img{
    width: 100px;
}

article #main-col{
    float: left;
    width: 65%;
}

article#sidebar{
    float: right;
    width: 30%;
    margin-top: 10px;
}

aside #sidebar .quote input, aside #sidebar .quote textarea{
    width: 90%;
    padding: 5px;
}


ul#services{
    list-style: none;
    padding:20px;
    border: #cccccc solid 1px;
    margin-bottom: 5px;
    background: #e6e6e6;
}


@media(max-width:768px){
    header #branding,
    header nav,
    header nav li,
    #buttons,
    #boxes .box,
    article#main-col
    aside#aside{
        float: none;
        text-align: center;
        width: 100%;
    }

    header{
        padding-bottom: 20px;
    }

    #showcase h1{
        margin-top: 40px;
    }
  

}

</style>

<section id="showcase">
        <div class="container">
             <h1>Ask A Pro</h1>
            <br>
            <p>The best way to get an answer...<br> is by asking a Pro!</p>
        </div>
    </section>

    
    <section id="boxes">
        <div class="container">
            <div class="box">
                <img src="${pageContext.request.contextPath}/images/images.jpg">
                <h3>Register as a simple user</h3>
                <p>Feel free to Register as a simple user. Get answers by professionals.Save time and money and get their services.</p>
            </div>
            <div class="box">
                <img src="${pageContext.request.contextPath}/images/images2.jpg">
                <h3>Register as a specialist</h3>
                <p>Join the community of the professionals and get ratted by answersering questions.Gain reputation and offer
                    your services.</p>
            </div>
            <div class="box">
                <img src="${pageContext.request.contextPath}/images/why.jpg">
                <h3>Why we do it</h3>
                <p>It is important not to overlook the marketing potential that lies within the content of your website’s About
                    Us page. 
                </p>
            </div>
        </div>
    </section>
<c:import url="footer.jsp"></c:import>  