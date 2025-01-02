<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Setting the character encoding and page metadata -->
    <meta charset="ISO-8859-1">
    <title>Register</title>

    <!-- Linking external resources: favicon, fonts, and stylesheets -->
    <link rel="icon" type="image/x-icon" href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZzPo9uv7MUCwwLTBVLgf29PIwG_Or3n2uVw&usqp=CAU">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.2/mdb.min.css" rel="stylesheet"/>

    <style>
        /* Custom background gradient and card styling */
        .gradient-custom-3 {
            background: rgba(0, 0, 0, 0.4);
        }

        .card {
            background: rgba(255, 255, 255, 0.9) !important;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2) !important;
        }

        /* Hover effect for the card */
        .card:hover {
            transform: translateY(-5px);
            transition: all 0.3s ease;
        }

        /* Styling for form controls */
        .form-control {
            background: rgba(255, 255, 255, 0.9) !important;
            border: 1px solid rgba(0, 0, 0, 0.1) !important;
        }

        .form-control:focus {
            background: rgba(255, 255, 255, 1) !important;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1) !important;
        }

        /* Styling for submit button */
        .btn-dark {
            background: linear-gradient(135deg, #007bff, #00bcd4) !important;
            border: none !important;
            transition: all 0.3s ease !important;
        }

        .btn-dark:hover {
            background: linear-gradient(135deg, #0056b3, #008ba3) !important;
            transform: scale(1.05);
            box-shadow: 0 5px 15px rgba(0,123,255,0.4) !important;
        }

        /* Text and label styling */
        .text-body {
            color: #333 !important;
        }

        .card-body h2 {
            background: linear-gradient(45deg, #1a1a1a, #333333);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            font-weight: bold;
            letter-spacing: 1px;
        }

        .form-check-label {
            color: #555;
        }

        /* Footer text styling */
        .footer-text {
            background: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 10px;
            margin-top: 20px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        /* Form outline and label styling */
        .form-outline {
            position: relative;
            margin-bottom: 25px !important;
        }

        .form-label {
            color: #555 !important;
            font-weight: 500;
        }

        /* Fade-in animation for the card */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .card {
            animation: fadeIn 0.8s ease-out;
        }

        /* Custom background for the section */
        .custom-background {
            background-image: url('https://cdn.pixabay.com/photo/2024/05/06/17/06/french-fries-8743802_1280.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            min-height: 100vh; /* Ensure full viewport height */
        }
    </style>
</head>
<body>

<!-- Main section with a full-screen background -->
<section class="vh-100 bg-image custom-background">
    <div class="mask d-flex align-items-center h-100 gradient-custom-3 overflow-auto">
        <div class="container h-100 p-4">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                    <div class="card" style="border-radius: 25px;">
                        <div class="card-body p-5">
                            <!-- Form title -->
                            <h2 class="text-uppercase text-center mb-5">Create an Account</h2>

                            <!-- Registration form -->
                            <form action="insert" method="post">
                                <!-- Input field for name -->
                                <div class="form-outline">
                                    <input type="text" id="form3Example1cg" class="form-control form-control-lg" name="name" required/>
                                    <label class="form-label" for="form3Example1cg">Your Name</label>
                                </div>

                                <!-- Input field for email -->
                                <div class="form-outline">
                                    <input type="email" id="form3Example3cg" class="form-control form-control-lg" name="email" required/>
                                    <label class="form-label" for="form3Example3cg">Your Email</label>
                                </div>

                                <!-- Input field for phone number -->
                                <div class="form-outline">
                                    <input type="text" id="form3Example4cg" class="form-control form-control-lg" name="phone" required/>
                                    <label class="form-label" for="form3Example4cg">Your Phone Number</label>
                                </div>

                                <!-- Input field for delivery address -->
                                <div class="form-outline">
                                    <input type="text" id="form3Example5cg" class="form-control form-control-lg" name="address" required/>
                                    <label class="form-label" for="form3Example5cg">Delivery Address</label>
                                </div>

                                <!-- Input field for username -->
                                <div class="form-outline">
                                    <input type="text" id="form3Example6cg" class="form-control form-control-lg" name="uid" required/>
                                    <label class="form-label" for="form3Example6cg">Username</label>
                                </div>

                                <!-- Input field for password -->
                                <div class="form-outline">
                                    <input type="password" id="form3Example7cg" class="form-control form-control-lg" name="psw" required/>
                                    <label class="form-label" for="form3Example7cg">Password</label>
                                </div>

                                <!-- Input field for role -->
                                <div class="form-outline">
                                    <input type="text" id="form3Example8cg" class="form-control form-control-lg" name="role" required/>
                                    <label class="form-label" for="form3Example8cg">Role: Customer/Delivery Person</label>
                                </div>

                                <!-- Terms and conditions checkbox -->
                                <div class="form-check d-flex justify-content-center mb-5">
                                    <input class="form-check-input me-2" type="checkbox" value="" id="form2Example3cg" required/>
                                    <label class="form-check-label" for="form2Example3g">
                                        I agree to all statements in <a href="#!" class="text-body"><u>Terms of service</u></a>
                                    </label>
                                </div>

                                <!-- Submit button -->
                                <div class="d-flex justify-content-center">
                                    <input type="submit" name="submit" value="Create An Account" class="btn btn-dark btn-lg btn-block">
                                </div>

                                <!-- Link to login page -->
                                <p class="text-center text-muted mt-5 mb-0">Have already an account? <a href="login.jsp" class="fw-bold text-body"><u>Login here</u></a></p>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- Footer text -->
                <div class="footer-text text-center mt-4">
                    <h4>Save your time!</h4>
                    <h5>Abc Order</h5>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Linking external JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.2/mdb.min.js"></script>
</body>
</html>
