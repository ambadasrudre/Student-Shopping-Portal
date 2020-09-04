<?php
include "header.php";
?>
		<!-- /BREADCRUMB -->
		<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},900);
				});
			});
</script>
		<script>
    
    (function (global) {
	if(typeof (global) === "undefined")
	{
		throw new Error("window is undefined");
	}
    var _hash = "!";
    var noBackPlease = function () {
        global.location.href += "#";
		// making sure we have the fruit available for juice....
		// 50 milliseconds for just once do not cost much (^__^)
        global.setTimeout(function () {
            global.location.href += "!";
        }, 50);
    };	
	// Earlier we had setInerval here....
    global.onhashchange = function () {
        if (global.location.hash !== _hash) {
            global.location.hash = _hash;
        }
    };
    global.onload = function () {        
		noBackPlease();
		// disables backspace on page except on input fields and textarea..
		document.body.onkeydown = function (e) {
            var elm = e.target.nodeName.toLowerCase();
            if (e.which === 8 && (elm !== 'input' && elm  !== 'textarea')) {
                e.preventDefault();
            }
            // stopping event bubbling up the DOM tree..
            e.stopPropagation();
        };		
    };
})(window);
</script>

		<!-- SECTION -->
		<div class="section main main-raised">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<!-- Product main img -->
					
					<?php 
								include 'db.php';
								$product_id = $_GET['p'];
								
								$sql = " SELECT * FROM products ";
								$sql = " SELECT * FROM products WHERE product_id = $product_id";
								if (!$con) {
									die("Connection failed: " . mysqli_connect_error());
								}
								$result = mysqli_query($con, $sql);
								if (mysqli_num_rows($result) > 0) 
								{
									while($row = mysqli_fetch_assoc($result)) 
									{
									echo '
									
                                    
                                
                                <div class="col-md-5 col-md-push-2">
                                <div id="product-main-img">
                                    <div class="product-preview">
                                        <img src="product_images/'.$row['product_image'].'" alt="">
                                    </div>

                                   
                                </div>
                            </div>
                                
                                <div class="col-md-2  col-md-pull-5">
                                <div id="product-imgs">
                                    <div class="product-preview">
                                        <img src="product_images/'.$row['product_image'].'" alt="">
                                    </div>

                                    <div class="product-preview">
                                        <img src="product_images/'.$row['product_image'].'" alt="">
                                    </div>

                                   
                                </div>
                            </div>

                                 
									';
                                    
									?>
									<!-- FlexSlider -->
									
									<?php 
									echo '
									
                                    
                                   
                    <div class="col-md-5">
						<div class="product-details">
							<h2 class="product-name">'.$row['product_title'].'</h2>
							
							<div>
								<h3 class="product-price">₹'.$row['product_price'].'<del class="product-old-price">₹990.00</del></h3>
								<span class="product-available">In Stock</span>
							</div>
							<p>this is what this is.</p>

							<div class="product-options">
								<label>
									Size
									<select class="input-select">
										<option value="0">X</option>
									</select>
								</label>
								<label>
									Color
									<select class="input-select">
										<option value="0">Red</option>
									</select>
								</label>
							</div>

							<div class="add-to-cart">
								<div class="qty-label">
									Qty
									<div class="input-number">
										
										<span class="qty-up">+</span>
										<span class="qty-down">-</span>
									</div>
								</div>
								<div class="btn-group" style="margin-left: 25px; margin-top: 15px">
								<button class="add-to-cart-btn" pid="'.$row['product_id'].'"  id="product" ><i class="fa fa-shopping-cart"></i> add to cart</button>
                                </div>
								
								
							</div>

							<ul class="product-btns">
								<li><a href="#"><i class="fa fa-heart-o"></i> add to wishlist</a></li>
								<li><a href="#"><i class="fa fa-exchange"></i> add to compare</a></li>
							</ul>

							
						</div>
					</div>
									
					
					<!-- /Product main img -->

					<!-- Product thumb imgs -->
					
					
					
					<!-- /Product thumb imgs -->

					<!-- Product details -->
					
					<!-- /Product details -->

					<!-- Product tab -->
					<div class="col-md-12">
						<div id="product-tab">
							<!-- product tab nav -->
							<ul class="tab-nav">
								<li class="active"><a data-toggle="tab" href="#tab1">Description</a></li>
								<li><a data-toggle="tab" href="#tab2">Details</a></li>
								
							</ul>
							<!-- /product tab nav -->

							<!-- product tab content -->
							<div class="tab-content">
								<!-- tab1  -->
								<div id="tab1" class="tab-pane fade in active">
									<div class="row">
										<div class="col-md-12">
											<p>desc</p>
										</div>
									</div>
								</div>
								<!-- /tab1  -->

								<!-- tab2  -->
								<div id="tab2" class="tab-pane fade in">
									<div class="row">
										<div class="col-md-12">
											<p>detail</p>
										</div>
									</div>
								</div>
								<!-- /tab2  -->

						
							</div>
							<!-- /product tab content  -->
						</div>
					</div>
					<!-- /product tab -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->

		<!-- Section -->
		<div class="section main main-raised">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
                    
					<div class="col-md-12">
						<div class="section-title text-center">
							
							
						</div>
					</div>
                    ';
									$_SESSION['product_id'] = $row['product_id'];
									}
								} 
								?>	
								
					<!-- product -->
					
					<!-- /product -->

				</div>
				<!-- /row -->
                
			</div>
			<!-- /container -->
		</div>
		<!-- /Section -->

		<!-- NEWSLETTER -->
		
		<!-- /NEWSLETTER -->

		<!-- FOOTER -->
<?php
include "newslettter.php";
include "footer.php";

?>
