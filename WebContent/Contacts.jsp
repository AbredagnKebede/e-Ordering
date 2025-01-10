<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        /* General styling */
        :root {
            --primary-color: #3b5998;
            --secondary-color: #4c669f;
            --text-color: #fff;
            --highlight-color: #ffcc00;
        }

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, var(--secondary-color), var(--primary-color));
            color: var(--text-color);
        }

        h1 {
            text-align: center;
            margin: 20px 0;
            font-size: 2.5rem;
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
            position: relative;
        }

        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.3);
        }

        .card .character {
            font-size: 50px;
            margin-bottom: 10px;
        }

        .card img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin-bottom: 10px;
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
            color: var(--highlight-color);
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        .card a:hover {
            color: var(--text-color);
        }

        .card .tooltip {
            display: none;
            position: absolute;
            bottom: 120%;
            left: 50%;
            transform: translateX(-50%);
            background: rgba(0, 0, 0, 0.7);
            color: #fff;
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 0.9rem;
        }

        .card:hover .tooltip {
            display: block;
        }

        @media (max-width: 768px) {
            .card {
                width: 90%;
            }
        }
    </style>
</head>

<body>
    <h1>Contact Our Team</h1>
    <div class="container">
        <div class="card">
            <div class="character">
                <i class="fas fa-user"></i>
            </div>
            <h3>Abredagn Kebede</h3>
            <p>Role: Backend Developer</p>
            <p>Contact me: <a href="tel:0911234567">0911234567</a></p>
            <span class="tooltip">Handles server-side logic and database management</span>
        </div>

        <div class="card">
            <div class="character">
                <i class="fas fa-code"></i>
            </div>
            <h3>Kirubel Ayele</h3>
            <p>Role: Frontend Developer</p>
            <p>Contact me: <a href="tel:0977325296">0977325296</a></p>
            <span class="tooltip">Responsible for UI and user interaction design</span>
        </div>

        <div class="card">
            <div class="character">
                <i class="fas fa-paint-brush"></i>
            </div>
            <h3>Beamlak Tamrat</h3>
            <p>Role: Designer</p>
            <p>Contact me: <a href="tel:0911234567">0911234567</a></p>
            <span class="tooltip">Creates visual elements and design concepts</span>
        </div>

        <div class="card">
            <div class="character">
                <i class="fas fa-bug"></i>
            </div>
            <h3>Abdi Mangashahun</h3>
            <p>Role: Tester</p>
            <p>Contact me: <a href="tel:0911234567">0911234567</a></p>
            <span class="tooltip">Ensures software quality and identifies bugs</span>
        </div>

        <div class="card">
            <div class="character">
                <i class="fas fa-chart-line"></i>
            </div>
            <h3>Gena F.</h3>
            <p>Role: Analyst</p>
            <p>Contact me: <a href="tel:0911234567">0911234567</a></p>
            <span class="tooltip">Analyzes requirements and project goals</span>
        </div>

        <div class="card">
            <div class="character">
                <i class="fas fa-lightbulb"></i>
            </div>
            <h3>Henok Demissie</h3>
            <p>Role: Consultant</p>
            <p>Contact me: <a href="tel:0911234567">0911234567</a></p>
            <span class="tooltip">Provides expert advice and strategy</span>
        </div>
    </div>
</body>

</html>
