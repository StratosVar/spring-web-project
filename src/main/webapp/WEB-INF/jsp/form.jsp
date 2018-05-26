<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>

<body>
    <div>

        <button id="button3" name="text" value="text">
            Click
        </button>

        <div id="div3"> <p></p></div>
    </div>
    <style>
        .form {
            padding-top: 20px;
            padding-left: 100px;
        }

        .valid {
            border: 2px solid green;
            background: #D3D3D3;
        }

        .invalid {
            border: 2px solid red;
        }
    </style>


    <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
        crossorigin="anonymous">
        </script>

    <div class="form">

        <form  name ="myForm">
            <input type="text" name="number" id="number" width="100px">
            <input type="submit" value="Hello" id="btn"> </form>

            <script>

                function myFunction() {
                    var pattern = /^\d+$/;
                    var isValid = pattern.test($('#number').val());
                    var $inputElement = $("#number");


                    if (isValid) {
                        $inputElement.removeClass("invalid");
                        $('form[name="myForm"]').submit();
                        
                    }
                        
                    else {
                        $inputElement.addClass("invalid")
                    }
                }

                $(document).ready(function () {


                    $('#btn').on('click', (event) => {
                        event.preventDefault();
                        myFunction();
                    }).on('blur', myFunction);

                        
                        
                        
                        })



                $("#button3").click(function(){
                   
                            $get("http://localhost:8080/home", function(result){
                                $("#div3").html(result)}
                        });



             

               



            </script>


    </div>
</body>

</html>