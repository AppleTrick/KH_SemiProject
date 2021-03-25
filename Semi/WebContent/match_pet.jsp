<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <style type="text/css">
      body {
        font-family: sans-serif;
        background-color: #eeeeee;
      }
      
      .centering{
      	
      	text-algin : center;
      }

      .file-upload {
        background-color: #ffffff;
        width: 600px;
        margin: 0 auto;
        padding: 20px;
      }

      .file-upload-btn {
        width: 100%;
        margin: 0;
        color: #fff;
        background: #1fb264;
        border: none;
        padding: 10px;
        border-radius: 4px;
        border-bottom: 4px solid #15824b;
        transition: all 0.2s ease;
        outline: none;
        text-transform: uppercase;
        font-weight: 700;
      }

      .file-upload-btn:hover {
        background: #1aa059;
        color: #ffffff;
        transition: all 0.2s ease;
        cursor: pointer;
      }

      .file-upload-btn:active {
        border: 0;
        transition: all 0.2s ease;
      }

      .file-upload-content {
        display: none;
        text-align: center;
      }

      .file-upload-input {
        position: absolute;
        margin: 0;
        padding: 0;
        width: 100%;
        height: 100%;
        outline: none;
        opacity: 0;
        cursor: pointer;
      }

      .image-upload-wrap {
        margin-top: 20px;
        border: 4px dashed #1fb264;
        position: relative;
      }

      .image-dropping,
      .image-upload-wrap:hover {
        background-color: #1fb264;
        border: 4px dashed #ffffff;
      }

      .image-title-wrap {
        padding: 0 15px 15px 15px;
        color: #222;
      }

      .drag-text {
        text-align: center;
      }

      .drag-text h3 {
        font-weight: 100;
        text-transform: uppercase;
        color: #15824b;
        padding: 60px 0;
      }

      .file-upload-image {
        max-height: 200px;
        max-width: 200px;
        margin: auto;
        padding: 20px;
      }

      .remove-image {
        width: 200px;
        margin: 0;
        color: #fff;
        background: #cd4535;
        border: none;
        padding: 10px;
        border-radius: 4px;
        border-bottom: 4px solid #b02818;
        transition: all 0.2s ease;
        outline: none;
        text-transform: uppercase;
        font-weight: 700;
      }

      .remove-image:hover {
        background: #c13b2a;
        color: #ffffff;
        transition: all 0.2s ease;
        cursor: pointer;
      }

      .remove-image:active {
        border: 0;
        transition: all 0.2s ease;
      }
    </style>
    <script
      class="jsbin"
      src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"
    ></script>
    <script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@0.8/dist/teachablemachine-image.min.js"></script>
    <script type="text/javascript">
      function readURL(input) {
        if (input.files && input.files[0]) {
          var reader = new FileReader();

          reader.onload = function (e) {
            $(".image-upload-wrap").hide();

            $(".file-upload-image").attr("src", e.target.result);
            $(".file-upload-content").show();
            $(".result-message").hide();

            $(".image-title").html(input.files[0].name);
          };
          reader.readAsDataURL(input.files[0]);
          init().then(function () {
            predict();
          });
        } else {
          removeUpload();
        }
      }

      function removeUpload() {
        $(".file-upload-input").replaceWith($(".file-upload-input").clone());
        $(".file-upload-content").hide();
        $(".image-upload-wrap").show();
      }
      $(".image-upload-wrap").bind("dragover", function () {
        $(".image-upload-wrap").addClass("image-dropping");
      });
      $(".image-upload-wrap").bind("dragleave", function () {
        $(".image-upload-wrap").removeClass("image-dropping");
      });
    </script>
    <script type="text/javascript">
      // More API functions here:
      // https://github.com/googlecreativelab/teachablemachine-community/tree/master/libraries/image

      // the link to your model provided by Teachable Machine export panel
      const URL = "https://teachablemachine.withgoogle.com/models/KUWrkiFhy/";

      let model, webcam, labelContainer, maxPredictions;

      // Load the image model and setup the webcam
      async function init() {
        const modelURL = URL + "model.json";
        const metadataURL = URL + "metadata.json";

        // load the model and metadata
        // Refer to tmImage.loadFromFiles() in the API to support files from a file picker
        // or files from your local hard drive
        // Note: the pose library adds "tmImage" object to your window (window.tmImage)
        model = await tmImage.load(modelURL, metadataURL);
        maxPredictions = model.getTotalClasses();
        labelContainer = document.getElementById("label-container");
        for (let i = 0; i < maxPredictions; i++) {
          // and class labels
          labelContainer.appendChild(document.createElement("div"));
        }
      }

      // run the webcam image through the image model
      async function predict() {
        // predict can take in an image, video or canvas html element
        var image = document.getElementById("face-image");
        const prediction = await model.predict(image, false);
        prediction.sort(
          (a, b) => parseFloat(b.probability) - parseFloat(a.probability)
        );
        console.log(prediction[0].className);
        var resultMessege;
        switch (prediction[0].className) {
          case "강아지":
            resultMessege = "강아지상";
            break;
          case "고양이":
            resultMessege = "고양이상";
            break;
          default:
            resultMessege = "알수없음";
            break;
        }
        $(document).ready(function () {
          $(".result-message").val(resultMessege);
          $(".result-message").show();
        });
        $(".result-message").html(resultMessege);
        for (let i = 0; i < maxPredictions; i++) {
          const classPrediction =
            prediction[i].className +
            ": " +
            prediction[i].probability.toFixed(2);
          labelContainer.childNodes[i].innerHTML = classPrediction;
        }
      }
    </script>
  </head>
  <body>
  	<%@ include file="Form/header.jsp"%>
    <form action="donate.do" method="POST">
      <div class="file-upload">
        <button
          class="file-upload-btn"
          type="button"
          onclick="$('.file-upload-input').trigger( 'click' )"
        >
          Add Image
        </button>
        <div class="image-upload-wrap">
          <input
            class="file-upload-input"
            type="file"
            onchange="readURL(this);"
            accept="image/*"
          />
          <div class="drag-text">
            <h3>Drag and drop a file or select add Image</h3>
          </div>
        </div>
        <div class="file-upload-content">
          <img
            class="file-upload-image"
            id="face-image"
            src="#"
            alt="your image"
          />
          <!-- <a name="command" href="Servlet.do"><p class="result-message"></p></a> -->
          <!-- <button class="result-message" name="kindoftype" onclick="location.href='animal.do'"></button> -->
          
          <!-- 메시지 부분  -->
          <div>
          	<input type="submit" class="result-message centering" name="command"/>
          </div>
          
          
          <div id="label-container"></div>
          <div class="image-title-wrap">
            <button
              type="button"
              onclick="removeUpload();"
              class="remove-image"
            >
              Remove <span class="image-title">Uploaded Image</span>
            </button>
          </div>
        </div>
      </div>
      <div id="webcam-container"></div>
    </form>
  </body>
</html>
