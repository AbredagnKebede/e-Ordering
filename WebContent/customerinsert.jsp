<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Meta information and external resources -->
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="icon" href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZzPo9uv7MUCwwLTBVLgf29PIwG_Or3n2uVw&usqp=CAU">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.2/mdb.min.css" rel="stylesheet">

    <!-- Custom Styles -->
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
        }

        .custom-background {
            background-image: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), 
                              url('https://cdn.pixabay.com/photo/2024/05/06/17/06/french-fries-8743802_1280.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            min-height: 100vh;
        }

        .card {
            backdrop-filter: blur(15px);
            background: rgba(255, 255, 255, 0.8) !important;
            border-radius: 25px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            animation: fadeIn 0.8s ease-out;
        }

        .card:hover {
            transform: translateY(-5px);
            transition: all 0.3s ease;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .form-control {
            border: 1px solid rgba(0, 0, 0, 0.1);
            background: rgba(255, 255, 255, 0.9);
        }

        .form-control:focus {
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            background: #fff;
        }

        .btn-primary {
            background: linear-gradient(135deg, #007bff, #00bcd4);
            border: none;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            transform: scale(1.05);
            box-shadow: 0 5px 15px rgba(0, 123, 255, 0.4);
        }

        .footer-text {
            text-shadow: 0 1px 3px rgba(0, 0, 0, 0.3);
            color: #fff;
        }
    </style>
</head>
<body>

<section class="vh-100 custom-background">
    <div class="container d-flex justify-content-center align-items-center h-100">
        <div class="col-md-8 col-lg-6">
            <div class="card">
                <div class="card-body p-5">
                    <!-- Form Header -->
                    <h2 class="text-uppercase text-center mb-4">Create an Account</h2>

                    <!-- Registration Form -->
                    <form action="insert" method="post">
                        <div class="form-outline mb-4">
                            <input type="text" id="name" name="name" class="form-control form-control-lg" required>
                            <label class="form-label" for="name">Full Name</label>
                        </div>

                        <div class="form-outline mb-4">
                            <input type="email" id="email" name="email" class="form-control form-control-lg" required>
                            <label class="form-label" for="email">Email Address</label>
                        </div>

                        <div class="form-outline mb-4">
                            <input type="tel" id="phone" name="phone" class="form-control form-control-lg" pattern="[0-9]{10}" title="Please enter a 10-digit phone number" required>
                            <label class="form-label" for="phone">Phone Number</label>
                        </div>

                        <div class="form-outline mb-4">
                            <input type="text" id="address" name="address" class="form-control form-control-lg" required>
                            <label class="form-label" for="address">Delivery Address</label>
                        </div>

                        <div class="form-outline mb-4">
                            <input type="text" id="uid" name="uid" class="form-control form-control-lg" required>
                            <label class="form-label" for="uid">Username</label>
                        </div>

                        <div class="form-outline mb-4">
                            <input type="password" id="psw" name="psw" class="form-control form-control-lg" required>
                            <label class="form-label" for="psw">Password</label>
                        </div>

                        <div class="form-outline mb-4">
                            <select id="role" name="role" class="form-control form-control-lg" required>
                                <option value="" disabled selected>Select Role</option>
                                <option value="Customer">Customer</option>
                                <option value="Delivery Person">Delivery Person</option>
                            </select>
                            <label class="form-label" for="role">Role</label>
                        </div>

                        <div class="form-check d-flex justify-content-center mb-4">
                            <input type="checkbox" id="terms" class="form-check-input" required>
                            <label class="form-check-label" for="terms">
                                I agree to the <a href="#!" class="text-primary"><u>Terms of Service</u></a>.
                            </label>
                        </div>

                        <div class="d-flex justify-content-center">
                            <button type="submit" class="btn btn-primary btn-lg btn-block">Create Account</button>
                        </div>

                        <p class="text-center text-muted mt-4">Already have an account? 
                            <a href="login.jsp" class="fw-bold text-primary"><u>Login Here</u></a>
                        </p>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.2/mdb.min.js"></script>
</body>
</html>
