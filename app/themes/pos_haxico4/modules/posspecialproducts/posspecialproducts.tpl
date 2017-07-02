<div class=" col-xs-12 col-sm-12 col-md-12 col-lg-4">
{if isset($products) AND $products}

	<div id="special_products_home" class="pos-content">
		<div class="pos-title">
			<h2>
				<span>{l s='Deal' mod='posspecialsproducts'}</span> {l s='of the days' mod='posspecialsproducts'}
			</h2>
		</div>
		<div class="block_content">
			<div class="row">
				<div id="pos-special-products">
				{foreach from=$products item=product name=myLoop}
				{if $smarty.foreach.myLoop.index % 1 == 0 || $smarty.foreach.myLoop.first }
					<div class="item-special">
				{/if}
					<div class="item-product">
						<div class="products-inner">
							<a href="{$product.link|escape:'html'}" title="{$product.legend|escape:'html':'UTF-8'}" class="content_img clearfix">
								<img src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'home_default')|escape:'html'}"
									class="img-responsive" alt="{$product.legend|escape:'html':'UTF-8'}"/>
							</a>
						</div>
						<div class="product-contents">
							<div class="countdown" >
								{if isset($product.specific_prices) && $product.specific_prices && isset($product.specific_prices.reduction) && $product.specific_prices.reduction && $product.specific_prices.to|date_format:"%Y" !=0 }
									{hook h='timecountdown' product=$product }  
									<span id="future_date_{$product.id_category_default}_{$product.id_product}" data-time ='
								   {$product.specific_prices.to|date_format:"%Y"} ,{$product.specific_prices.to|date_format:"%m"}-1 ,{$product.specific_prices.to|date_format:"%d"},{$product.specific_prices.to|date_format:"%H"}, {$product.specific_prices.to|date_format:"%M"}, {$product.specific_prices.to|date_format:"%S"}' class="id_countdown">  </span>
								{/if}
							</div>
							
							<p class="product-desc" itemprop="description">
								{$product.description_short|strip_tags:'UTF-8'|truncate:360:'...'}
							</p>
					
							{capture name='displayProductListReviews'}{hook h='displayProductListReviews' product=$product}{/capture}
							{if $smarty.capture.displayProductListReviews}
								<div class="hook-reviews">
								{hook h='displayProductListReviews' product=$product}
								</div>
							{/if}
							<h5 class="product-name">
								<a href="{$product.link|escape:'html'}" title="{$product.legend|escape:'html':'UTF-8'}">
								{$product.name|strip_tags:'UTF-8'|escape:'html':'UTF-8'}<br/>
								</a>
							</h5>
							{if (!$PS_CATALOG_MODE AND ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
						
							<div  class="price-box">
								{if isset($product.show_price) && $product.show_price && !isset($restricted_country_mode)}
					
									<span class="price product-price">
										{if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}
									</span>
									{if isset($product.specific_prices) && $product.specific_prices && isset($product.specific_prices.reduction) && $product.specific_prices.reduction > 0}
										{hook h="displayProductPriceBlock" product=$product type="old_price"}
										<span class="old-price product-price">
											{displayWtPrice p=$product.price_without_reduction}
										</span>
										{hook h="displayProductPriceBlock" id_product=$product.id_product type="old_price"}
										{if $product.specific_prices.reduction_type == 'percentage'}
											<span class="price-percent-reduction">-{$product.specific_prices.reduction * 100}%</span>
										{/if}
									{/if}
									{hook h="displayProductPriceBlock" product=$product type="price"}
									{hook h="displayProductPriceBlock" product=$product type="unit_price"}
								{/if}
							
							</div>	
							{/if}
								
							<div class="actions">														
								<div class="actions-inner">
									<div class="cart">
										{if ($product.id_product_attribute == 0 || (isset($add_prod_display) && ($add_prod_display == 1))) && $product.available_for_order && !isset($restricted_country_mode) && $product.minimal_quantity <= 1 && $product.customizable != 2 && !$PS_CATALOG_MODE}
										{if ($product.allow_oosp || $product.quantity > 0)}
										{if isset($static_token)}
											<a class="button ajax_add_to_cart_button btn btn-default" href="{$link->getPageLink('cart',false, NULL, "add=1&amp;id_product={$product.id_product|intval}&amp;token={$static_token}", false)|escape:'html':'UTF-8'}" rel="nofollow"  title="{l s='Add to cart' mod='posspecialsproducts'}" data-id-product="{$product.id_product|intval}">
												<span>{l s='Add to cart' mod='posspecialsproducts'}</span>
												
											</a>
										{else}
										<a class="button ajax_add_to_cart_button btn btn-default" href="{$link->getPageLink('cart',false, NULL, 'add=1&amp;id_product={$product.id_product|intval}', false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Add to cart' mod='posspecialsproducts'}" data-id-product="{$product.id_product|intval}">
											<span>{l s='Add to cart' mod='posspecialsproducts'}</span>
										</a>
										   {/if}      
										{else}
										<span class="button ajax_add_to_cart_button btn btn-default disabled" >
											<span>{l s='Add to cart' mod='posspecialsproducts'}</span>
										</span>
										{/if}
										{/if}
									</div>
									<ul class="add-to-links">											
										<li>
											{hook h='displayProductListFunctionalButtons' product=$product}
										</li>
										<li>
										{if isset($comparator_max_item) && $comparator_max_item}
										  <a class="add_to_compare" href="{$product.link|escape:'html':'UTF-8'}" data-id-product="{$product.id_product}" title="{l s='Add to Compare' mod='posspecialsproducts'}">{l s='Compare' mod='posspecialsproducts'}
										
										  </a>
										 {/if}
										</li>
										<li>
											{if isset($quick_view) && $quick_view}
												<a class="quick-view" title="{l s='Quick view' mod='posspecialsproducts'}" href="{$product.link|escape:'html':'UTF-8'}">
													<span>{l s='Quick view' mod='posspecialsproducts'}</span>
												</a>
											{/if}
										</li>
									</ul>
								</div>
							</div>	

						</div>	
						
					</div>
					{if $smarty.foreach.myLoop.iteration % 1 == 0 || $smarty.foreach.myLoop.last  }
					</div>
				{/if}
				{/foreach}
				</div>
			</div>
			
		</div>
	</div>
</div>
{/if}
<script>


    $(document).ready(function() {
     
    var owl = $("#pos-special-products");
     
   		owl.owlCarousel({
			items : {$slider_options.number_item},
			itemsDesktop : [1199,{$slider_options.items_md}],
			itemsDesktopSmall : [991,{$slider_options.items_sm}],
			itemsTablet: [767,{$slider_options.items_xs}],
			itemsMobile : [479,{$slider_options.items_xxs}],
			autoPlay :  {if $slider_options.auto_play}{if $slider_options.auto_time}{$slider_options.auto_time}{else}3000{/if}{else} false{/if},
			stopOnHover: {if $slider_options.pausehover} true {else} false {/if},
			slideSpeed : {if $slider_options.speed_slide}{$slider_options.speed_slide}{else}1000{/if},
			addClassActive: true,
			scrollPerPage: {if $slider_options.move} false {else} true {/if},
			navigation : {if $slider_options.show_arrow} true {else} false {/if},
			pagination : {if $slider_options.show_pagination} true {else} false {/if},
		});
    });
</script>