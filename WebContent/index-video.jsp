<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>모두?</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,400,600&amp;subset=latin-ext"
	rel="stylesheet">

<!-- CSS -->
<link href="assets/css/jquery.mb.YTPlayer.min.css" rel="stylesheet">
<link href="assets/css/jquery.mb.vimeo_player.min.css" rel="stylesheet">
<link href="assets/css/main.css" rel="stylesheet">

<!-- JS -->
<script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
<script src="assets/js/vendor/jquery-1.12.0.min.js"></script>
</head>
<body>
	<div class="site" id="page">
		<a class="skip-link sr-only" href="#main">Skip to content</a>

		<!-- Options headline effects: .rotate | .slide | .zoom | .push | .clip -->
		<section class="hero-section hero-section--video clearfix rotate">
			<div class="hero-section__wrap">
				<div class="hero-section__option">
					<div data-video="youtube" class="player"
						data-property="{videoURL:'https://youtu.be/uE5WtVNqt-w',containment:'body',autoPlay:true, mute:true, startAt:42, opacity:10}">Video
						Youtube</div>
				</div>
				<!-- .hero-section__option -->

				<div class="container">
					<div class="row">
						<div class="offset-lg-2 col-lg-8">
							<div class="title-01 title-01--11 text-center">
								<h2 class="title__heading">We are AweSome!</h2>
								<div class="title__description">네이버 모두!를 벤치마킹한 웹사이트입니다</div>

								<!-- Options btn color: .btn-success | .btn-info | .btn-warning | .btn-danger | .btn-primary -->
								<div class="title__action">
									<a
										href="modoo.bo"
										class="btn btn-success">모두? 시작하기</a>
								</div>
							</div>
							<!-- .title-01 -->
						</div>
					</div>
				</div>
			</div>
			<!-- .hero-section__wrap -->
		</section>
		<!-- .hero-section -->
	</div>
	<div class="button-group">
		<a href="index-slider.jsp" class="btn btn-outline-success button-sm">Slider</a>
		<a href="index-color.jsp" class="btn btn-outline-success button-sm">Color</a>
	</div>

	<!-- JS -->
	<script src="assets/js/plugins/jquery.mb.YTPlayer.min.js"></script>
	<script src="assets/js/plugins/jquery.mb.vimeo_player.min.js"></script>
	<script src="assets/js/plugins/animate-headline.js"></script>
	<script src="assets/js/main.js"></script>


</body>
</html>
