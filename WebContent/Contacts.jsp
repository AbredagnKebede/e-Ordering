<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Page</title>
    <style>
        /* General body styling: sets the background gradient and text color */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #4c669f, #3b5998);
            color: #fff;
        }

        /* Main heading styling: centered text with large font size */
        h1 {
            text-align: center;
            margin-top: 20px;
            font-size: 3rem;
        }

        /* Flexbox container to center the cards and wrap them responsively */
        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding: 20px;
        }

        /* Card styling: background, border-radius, and shadow for each member card */
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

        /* Hover effect for the card: slightly enlarges the card and increases shadow */
        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.3);
        }

        /* Character emoji styling */
        .card .character {
            font-size: 50px;
            margin-bottom: 15px;
            animation: fadeIn 1s ease;
        }

        /* Card image styling: circular image with fade-in animation */
        .card img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin-bottom: 15px;
            animation: fadeIn 1s ease;
        }

        /* Member name styling inside the card */
        .card h3 {
            margin: 0;
            font-size: 1.5rem;
        }

        /* Paragraph styling for the role and contact information */
        .card p {
            margin: 5px 0;
            font-size: 1rem;
        }

        /* Link styling for the 'Contact me' text */
        .card a {
            color: #ffcc00;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        /* Hover effect on links: color change when hovering */
        .card a:hover {
            color: #fff;
        }

        /* Keyframes for fade-in animation: elements fade in from below */
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
    <!-- Page heading -->
    <h1>Contact Our Team</h1>

    <!-- Container for team member cards -->
    <div class="container">
        <!-- Card for Abredagn Kebede -->
        <div class="card">
            <div class="character">&#128100;</div> <!-- Character emoji for person -->
            <h3>Abredagn Kebede</h3> <!-- Member name -->
            <p>Role: Backend Developer</p> <!-- Role description -->
            <p>Contact me: 0911234567</p> <!-- Contact information -->
        </div>

        <!-- Card for Kirubel Ayele -->
        <div class="card">
            <div class="character">&#128100;</div> <!-- Character emoji for person -->
            <h3>Kirubel Ayele</h3>
            <p>Role: Frontend Developer</p>
            <p>Contact me: 0977325296</p>
        </div>

        <!-- Card for Beamlak Tamrat -->
        <div class="card">
            <div class="character">&#128100;</div>
            <h3>Beamlak Tamrat</h3>
            <p>Role: Designer</p>
            <p>Contact me: 0911234567</p>
        </div>

        <!-- Card for Abdi Mangashahun -->
        <div class="card">
            <div class="character">&#128100;</div>
            <h3>Abdi Mangashahun</h3>
            <p>Role: Tester</p>
            <p>Contact me: 0911234567</p>
        </div>

        <!-- Card for Gena F. -->
        <div class="card">
            <div class="character">&#128100;</div>
            <h3>Gena .F</h3>
            <p>Role: Analyst</p>
            <p>Contact me: 0911234567</p>
        </div>

        <!-- Card for Henok Demissie -->
        <div class="card">
            <div class="character">&#128100;</div>
            <h3>Henok Demissie</h3>
            <p>Role: Consultant</p>
            <p>Contact me: 0911234567</p>
        </div>
    </div>
</body>

</html>
