<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="ISO-8859-1">

  <!-- Font Awesome for icons (used in case you want to add icons to buttons or inputs) -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />

  <!-- Google Fonts for custom fonts, in this case, Roboto font family -->
  <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />

  <!-- MDB UI Kit for additional UI components like cards, buttons, etc. -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.2/mdb.min.css" rel="stylesheet" />

  <title>Admin Login | ASTU</title>

  <!-- Favicon for the website -->
  <link rel="icon" type="image/x-icon" href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZzPo9uv7MUCwwLTBVLgf29PIwG_Or3n2uVw&usqp=CAU">

  <style>
    /* Styling for the body: Set background image, font, and animation */
    body {
      background: url("https://cdn.pixabay.com/photo/2024/05/06/17/06/french-fries-8743802_1280.jpg") no-repeat center center fixed;
      background-size: cover; /* Ensures the image covers the entire page */
      font-family: 'Roboto', sans-serif; /* Applying custom font family */
      perspective: 1000px; /* Giving depth for 3D effect */
      animation: fadeIn 2s ease-in-out; /* Animation for fading in the page */
    }

    /* Keyframe for fade-in effect */
    @keyframes fadeIn {
      from { opacity: 0; }
      to { opacity: 1; }
    }

    /* Styling for the card element: adds round corners, background with transparency */
    .card {
      border-radius: 1rem;
      background: rgba(255, 255, 255, 0.8); /* Semi-transparent background */
      backdrop-filter: blur(10px); /* Applies a blur effect to background */
      box-shadow: 0 4px 30px rgba(0, 0, 0, 0.2); /* Shadow for depth */
      transition: all 0.3s ease; /* Smooth transition */
      animation: slideIn 1s ease-out; /* Slide-in animation */
    }

    /* Keyframes for slide-in animation */
    @keyframes slideIn {
      from { transform: translateY(50px); opacity: 0; }
      to { transform: translateY(0); opacity: 1; }
    }

    /* Hover effect for card: slightly lifts the card */
    .card:hover {
      transform: translateY(-10px);
    }

    /* Styling for the logo with 3D effect and transition */
    .logo {
      width: 80px;
      height: 80px;
      border-radius: 50%; /* Circular logo */
      transform-style: preserve-3d; /* Keeps 3D effects during transitions */
      transition: transform 0.5s ease;
      position: relative;
    }

    /* Logo hover effect: rotating and scaling the logo */
    .logo:hover {
      transform: rotateX(10deg) rotateY(10deg) scale(1.1);
      box-shadow: -20px -20px 30px rgba(255, 255, 255, 0.5), 20px 20px 30px rgba(0, 0, 0, 0.3);
    }

    /* Image container with 3D effect and transition */
    .image-container {
      position: relative;
      transform-style: preserve-3d; /* For 3D transform */
      transition: transform 0.5s ease;
      overflow: hidden;
      border-radius: 1rem 0 0 1rem;
    }

    /* Image container hover effect: rotation and scale */
    .image-container:hover {
      transform: rotateY(-15deg) rotateX(5deg) scale(1.05);
    }

    /* Gradient overlay effect */
    .image-container::after {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background: linear-gradient(45deg, rgba(255, 255, 255, 0.2) 0%, rgba(255, 255, 255, 0) 100%);
      transition: opacity 0.3s ease;
    }

    /* Hover effect for gradient overlay to fade it out */
    .image-container:hover::after {
      opacity: 0;
    }

    /* Image styling with box-shadow */
    .image-container img {
      width: 100%;
      height: 100%;
      object-fit: cover; /* Ensures image fully covers the container */
      box-shadow: -10px -10px 20px rgba(255, 255, 255, 0.3), 10px 10px 20px rgba(0, 0, 0, 0.3);
    }

    /* Button styling with gradient background and shadow */
    .btn-dark {
      background: linear-gradient(135deg, #007bff, #00bcd4);
      border: none;
      transition: all 0.3s ease;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
    }

    /* Button hover effect: change background and lift the button */
    .btn-dark:hover {
      background: linear-gradient(135deg, #0056b3, #008ba3);
      transform: translateY(-3px) scale(1.05);
      box-shadow: 0 5px 15px rgba(0, 123, 255, 0.4);
    }

    /* Form control styling with background and focus effect */
    .form-control {
      background: rgba(255, 255, 255, 0.9);
      backdrop-filter: blur(5px); /* Applying blur to background */
      border: 1px solid rgba(255, 255, 255, 0.3);
      transition: all 0.3s ease;
    }

    /* Focus effect for form controls: border color and shadow */
    .form-control:focus {
      border-color: #007bff;
      box-shadow: 0 0 10px rgba(0, 123, 255, 0.5);
    }

    /* Label styling */
    .form-label {
      font-weight: 500;
      color: #343a40;
      transition: all 0.3s ease;
    }

    /* Focus effect on label: color change and scaling */
    .form-outline input:focus + .form-label {
      color: #007bff;
      transform: scale(1.1);
    }

    /* Text color styling */
    .text-black {
      color: rgba(0, 0, 0, 0.8) !important;
    }

    /* Heading text with dimming and brightening animation */
    .h1 {
      text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
      animation: dimBright 2s infinite alternate;
    }

    /* Keyframes for dimming and brightening effect */
    @keyframes dimBright {
      0% {
        color: rgba(0, 0, 0, 0.8);
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
      }
      100% {
        color: rgba(0, 0, 0, 1);
        text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.4);
      }
    }
  </style>
</head>
<body>

  <!-- Main section for the login form -->
  <section class="vh-75">
    <div class="container py-5 h-75">
      <div class="row d-flex justify-content-center align-items-center h-75">
        <div class="col col-xl-10">
          <div class="card">
            <div class="row g-0">
              <div class="col-md-6 col-lg-5 d-none d-md-block">
                <!-- Image container with 3D effect -->
                <div class="image-container">
                  <img src="CSS/b8cc9fd74dfab4f06da503108808529c_LE_magic_x2_creativity_50_resemblance_25.jpg" alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;" />
                </div>
              </div>
              <div class="col-md-6 col-lg-7 d-flex align-items-center">
                <div class="card-body p-4 p-lg-5 text-black">

                  <!-- Admin login form -->
                  <form action="<%=request.getContextPath()%>/Adminlogin" method="post">

                    <div class="d-flex align-items-center mb-3 pb-1">
                      <!-- Logo of the site -->
                      <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZzPo9uv7MUCwwLTBVLgf29PIwG_Or3n2uVw&usqp=CAU" class="logo">
                      <span class="h1 fw-bold mb-0">abc order</span>
                    </div>

                    <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Admin Login</h5>

                    <!-- Username input -->
                    <div class="form-outline mb-4">
                      <input type="text" id="form2Example17" class="form-control form-control-lg" name="username" />
                      <label class="form-label" for="form2Example17">Username</label>
                    </div>

                    <!-- Password input -->
                    <div class="form-outline mb-4">
                      <input type="password" id="form2Example27" class="form-control form-control-lg" name="password" />
                      <label class="form-label" for="form2Example27">Password</label>
                    </div>

                    <!-- Submit button -->
                    <div class="pt-1 mb-4">
                      <input class="btn btn-dark btn-lg btn-block" type="submit" value="Submit" />
                    </div>

                    <!-- Forgot password link -->
                    <a class="small text-muted" href="#!">Forgot password?</a>
                    
                  </form>

                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- MDB UI Kit JavaScript for interactive elements -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.2/mdb.min.js"></script>

  <!-- Custom JavaScript for 3D effect on the image and logo -->
  <script>
    // Mouse move event for the image container to create 3D effect
    const imageContainer = document.querySelector('.image-container');
    imageContainer.addEventListener('mousemove', (e) => {
      const { left, top, width, height } = imageContainer.getBoundingClientRect();
      const x = (e.clientX - left) / width - 0.5;
      const y = (e.clientY - top) / height - 0.5;
      
      imageContainer.style.transform = `
        perspective(1000px)
        rotateY(${x * 20}deg)
        rotateX(${-y * 20}deg)
        scale3d(1.05, 1.05, 1.05)
      `;
    });

    // Reset the 3D tilt effect when mouse leaves the image container
    imageContainer.addEventListener('mouseleave', () => {
      imageContainer.style.transform = 'perspective(1000px) rotateY(0) rotateX(0) scale3d(1, 1, 1)';
    });

    // Mouse move event for the logo to create 3D effect
    const logo = document.querySelector('.logo');
    logo.addEventListener('mousemove', (e) => {
      const { left, top, width, height } = logo.getBoundingClientRect();
      const x = (e.clientX - left) / width - 0.5;
      const y = (e.clientY - top) / height - 0.5;
      
      logo.style.transform = `
        perspective(1000px)
        rotateY(${x * 30}deg)
        rotateX(${-y * 30}deg)
        scale3d(1.1, 1.1, 1.1)
      `;
    });

    // Reset the 3D effect when mouse leaves the logo
    logo.addEventListener('mouseleave', () => {
      logo.style.transform = 'perspective(1000px) rotateY(0) rotateX(0) scale3d(1, 1, 1)';
    });
  </script>

</body>
</html>
