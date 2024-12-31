<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Page</title>
    
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #4c669f, #3b5998);
            color: #fff;
        }
        h1 {
            text-align: center;
            margin-top: 20px;
            font-size: 3rem;
        }
        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding: 20px;
        }
        .card {
            background: rgba(255, 255, 255, 0.2);
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin: 15px;
            padding: 20px;
            width: 250px;
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.3);
        }
        .card .character {
            font-size: 50px;
            margin-bottom: 15px;
            animation: fadeIn 1s ease;
        }
        .card img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin-bottom: 15px;
            animation: fadeIn 1s ease;
        }
        .card h3 {
            margin: 0;
            font-size: 1.5rem;
        }

        .card p {
            margin: 5px 0;
            font-size: 1rem;
        }
        .card a {
            color: #ffcc00;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s ease;
        }
        .card a:hover {
            color: #fff;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>

<body>
<h1>Contact Our Team</h1>
<div class="container">
    <div class="card">

        <div class="character">&#128100;</div>
        <h3>Abredagn kebede</h3>
        <p>Role: Backend Developer</p>
        <p>Contact me: 0911234567</p>
    </div>

    <div class="card">
        <div class="character">&#128100;</div>
        <h3>Kirubel ayele</h3>
        <p>Role: Frontend Developer</p>
        <p>Contact me: 0977325296</p>
    </div>

    <div class="card">
        <div class="character">&#128100;</div>
        <h3>Beamlak Tamrat</h3>
        <p>Role: Designer</p>
        <p>Contact me: 0911234567</p>
    </div>

    <div class="card">
        <div class="character">&#128100;</div>
        <h3>Abdi mangashahun</h3>
        <p>Role: Tester</p>
        <p>Contact me: 0911234567</p>
    </div>

    <div class="card">
        <div class="character">&#128100;</div>
        <h3>Gena .F</h3>
        <p>Role: Analyst</p>
        <p>Contact me: 0911234567</p>
    </div>

    <div class="card">
        <div class="character">&#128100;</div>
        <h3>Henok Demissie</h3>
        <p>Role: Consultant</p>
        <p>Contact me: 0911234567</p>
    </div>

</div>
</body>
</html>
