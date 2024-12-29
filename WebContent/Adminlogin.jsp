<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<!-- Font Awesome for icons -->
<link
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
  rel="stylesheet"
/>
<!-- Google Fonts for custom fonts -->
<link
  href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
  rel="stylesheet"
/>
<!-- MDB UI Kit for additional UI components -->
<link
  href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.2/mdb.min.css"
  rel="stylesheet"
/>

<title>Admin Login | ASTU</title>
<link rel="icon" type="image/x-icon" href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZzPo9uv7MUCwwLTBVLgf29PIwG_Or3n2uVw&usqp=CAU">
<style>
  /* Styling for the body with a background image and a fade-in animation */
  body {
    background: url("https://cdn.pixabay.com/photo/2024/05/06/17/06/french-fries-8743802_1280.jpg") no-repeat center center fixed;
    background-size: cover;
    font-family: 'Roboto', sans-serif;
    perspective: 1000px;
    animation: fadeIn 2s ease-in-out;
  }

  /* Keyframes for the fade-in animation to gradually show the body content */
  @keyframes fadeIn {
    from { opacity: 0; }
    to { opacity: 1; }
  }
  
  /* Styling for the card element with rounded corners and a slide-in animation */
  .card {
    border-radius: 1rem;
    background: rgba(255, 255, 255, 0.8);
    backdrop-filter: blur(10px);
    box-shadow: 0 4px 30px rgba(0, 0, 0, 0.2);
    transition: all 0.3s ease;
    animation: slideIn 1s ease-out;
  }

  /* Keyframes for the slide-in animation to slide the card from below */
  @keyframes slideIn {
    from { transform: translateY(50px); opacity: 0; }
    to { transform: translateY(0); opacity: 1; }
  }

  /* Hover effect for the card to slightly lift it up */
  .card:hover {
    transform: translateY(-10px);
  }

  /* Styling for the logo with a 3D effect and transition */
  .logo {
    width: 80px;
    height: 80px;
    border-radius: 50%;
    transform-style: preserve-3d;
    transition: transform 0.5s ease;
    position: relative;
  }

  /* Hover effect for the logo to rotate and scale it */
  .logo:hover {
    transform: 
      rotateX(10deg) 
      rotateY(10deg) 
      scale(1.1);
    box-shadow: 
      -20px -20px 30px rgba(255, 255, 255, 0.5),
      20px 20px 30px rgba(0, 0, 0, 0.3);
  }

  /* Styling for the image container with a 3D effect and transition */
  .image-container {
    position: relative;
    transform-style: preserve-3d;
    transition: transform 0.5s ease;
    overflow: hidden;
    border-radius: 1rem 0 0 1rem;
  }

  /* Hover effect for the image container to rotate and scale it */
  .image-container:hover {
    transform: 
      rotateY(-15deg) 
      rotateX(5deg) 
      scale(1.05);
  }

  /* Gradient overlay for the image container to add a visual effect */
  .image-container::after {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: linear-gradient(
      45deg,
      rgba(255,255,255,0.2) 0%,
      rgba(255,255,255,0) 100%
    );
    transition: opacity 0.3s ease;
  }

  /* Hover effect for the gradient overlay to fade it out */
  .image-container:hover::after {
    opacity: 0;
  }

  /* Styling for the image inside the container with shadow effects */
  .image-container img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    box-shadow: 
      -10px -10px 20px rgba(255,255,255,0.3),
      10px 10px 20px rgba(0,0,0,0.3);
  }

  /* Styling for the button with a gradient background and hover effect */
  .btn-dark {
    background: linear-gradient(135deg, #007bff, #00bcd4);
    border: none;
    transition: all 0.3s ease;
    box-shadow: 0 4px 15px rgba(0,0,0,0.2);
  }

  /* Hover effect for the button to change background and slightly lift it */
  .btn-dark:hover {
    background: linear-gradient(135deg, #0056b3, #008ba3);
    transform: translateY(-3px) scale(1.05);
    box-shadow: 0 5px 15px rgba(0,123,255,0.4);
  }

  /* Styling for the form control with a focus effect */
  .form-control {
    background: rgba(255, 255, 255, 0.9);
    backdrop-filter: blur(5px);
    border: 1px solid rgba(255,255,255,0.3);
    transition: all 0.3s ease;
  }

  /* Focus effect for the form control to change border color and add shadow */
  .form-control:focus {
    border-color: #007bff;
    box-shadow: 0 0 10px rgba(0, 123, 255, 0.5);
  }

  /* Styling for the form label with a transition effect */
  .form-label {
    font-weight: 500;
    color: #343a40;
    transition: all 0.3s ease;
  }

  /* Focus effect for the form label to change color and scale it */
  .form-outline input:focus + .form-label {
    color: #007bff;
    transform: scale(1.1);
  }

  /* Styling for the text color */
  .text-black {
    color: rgba(0,0,0,0.8) !important;
  }

  /* Styling for the heading with a dimming and brightening animation */
  .h1 {
    text-shadow: 2px 2px 4px rgba(0,0,0,0.2);
    animation: dimBright 2s infinite alternate;
  }

  /* Keyframes for the dimming and brightening animation to change text color */
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
    
<section class="vh-75">
  <div class="container py-5 h-75">
    <div class="row d-flex justify-content-center align-items-center h-75">
      <div class="col col-xl-10">
        <div class="card">
          <div class="row g-0">
            <div class="col-md-6 col-lg-5 d-none d-md-block">
              <div class="image-container">
                <img src="CSS/b8cc9fd74dfab4f06da503108808529c_LE_magic_x2_creativity_50_resemblance_25.jpg" 
                alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;" />
              </div>
            </div>
            <div class="col-md-6 col-lg-7 d-flex align-items-center">
              <div class="card-body p-4 p-lg-5 text-black">

                <form action="<%=request.getContextPath()%>/Adminlogin" method="post">

                  <div class="d-flex align-items-center mb-3 pb-1">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZzPo9uv7MUCwwLTBVLgf29PIwG_Or3n2uVw&usqp=CAU" class="logo">
                    <span class="h1 fw-bold mb-0">abc order</span>
                  </div>

                  <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Admin Login</h5>

                  <div class="form-outline mb-4">
                    <input type="text" id="form2Example17" class="form-control form-control-lg" name="username" />
                    <label class="form-label" for="form2Example17">Username</label>
                  </div>

                  <div class="form-outline mb-4">
                    <input type="password" id="form2Example27" class="form-control form-control-lg" name="password" />
                    <label class="form-label" for="form2Example27">Password</label>
                  </div>

                  <div class="pt-1 mb-4">
                    <input class="btn btn-dark btn-lg btn-block" type="submit" value="Submit" />
                  </div>

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

<!-- MDB UI Kit JavaScript for additional UI components -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.2/mdb.min.js"></script>

<script>
  // Add 3D tilt effect to the image container on mouse move
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

  // Reset the 3D tilt effect when the mouse leaves the image container
  imageContainer.addEventListener('mouseleave', () => {
    imageContainer.style.transform = 'perspective(1000px) rotateY(0) rotateX(0) scale3d(1, 1, 1)';
  });

  // Add 3D effect to the logo on mouse move
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

  // Reset the 3D effect when the mouse leaves the logo
  logo.addEventListener('mouseleave', () => {
    logo.style.transform = 'perspective(1000px) rotateY(0) rotateX(0) scale3d(1, 1, 1)';
  });
</script>

</body>
</html>
