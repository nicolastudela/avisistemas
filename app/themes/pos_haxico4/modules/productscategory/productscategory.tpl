{*
* 2007-2015 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2015 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
{if count($categoryProducts) > 0 && $categoryProducts !== false}
<section class="page-product-box blockproductscategory">
	<div class="pos-title">
		<h2>
			
			{if $categoryProducts|@count == 1}
				{l s='%s other product in the same category:' sprintf=[$categoryProducts|@count] mod='productscategory'}
			{else}
				{l s='%s other products in the same category:' sprintf=[$categoryProducts|@count] mod='productscategory'}
			{/if}
		
		</h2>
	</div>
	<div id="productscategory_list" class="clearfix">
		<div class="row pos-content">
			<div id="product_category">
			{foreach from=$categoryProducts item='categoryProduct' name=categoryProduct}
				<div class="item-product">
					<div class="products-inner">
						<a href="{$link->getProductLink($categoryProduct.id_product, $categoryProduct.link_rewrite, $categoryProduct.category, $categoryProduct.ean13)}" class="lnk_img product_image" title="{$categoryProduct.name|htmlspecialchars}"><img data-src="{$link->getImageLink($categoryProduct.link_rewrite, $categoryProduct.id_image, 'home_default')|escape:'html':'UTF-8'}" class="img-responsive lazyOwl" alt="{$categoryProduct.name|htmlspecialchars}" />
						{hook h="rotatorImg" product=$categoryProduct}
						</a>
						{if isset($categoryProduct.new) && $categoryProduct.new == 1}
							<a class="new-box" href="{$categoryProduct.link|escape:'html':'UTF-8'}">
								<span class="new-label">{l s='New' mod='productscategory'}</span>
							</a>
						{/if}
						{if isset($categoryProduct.on_sale) && $categoryProduct.on_sale && isset($categoryProduct.show_price) && $categoryProduct.show_price && !$PS_CATALOG_MODE}
							<a class="sale-box" href="{$categoryProduct.link|escape:'html':'UTF-8'}">
								<span class="sale-label">{l s='Sale!' mod='productscategory'}</span>
							</a>
						{/if}					
					</div>
					<div class="product-contents">
						<h5 itemprop="name" class="product-name">
							<a href="{$link->getProductLink($categoryProduct.id_product, $categoryProduct.link_rewrite, $categoryProduct.category, $categoryProduct.ean13)|escape:'html':'UTF-8'}" title="{$categoryProduct.name|htmlspecialchars}">{$categoryProduct.name|truncate:35:'...'|escape:'html':'UTF-8'}</a>
						</h5>
						{if $ProdDisplayPrice && $categoryProduct.show_price == 1 && !isset($restricted_country_mode) && !$PS_CATALOG_MODE}
						<div class="price-box">
							{if isset($categoryProduct.specific_prices) && $categoryProduct.specific_prices
							&& ($categoryProduct.displayed_price|number_format:2 !== $categoryProduct.price_without_reduction|number_format:2)}

								<span class="price special-price">{convertPrice price=$categoryProduct.displayed_price}</span>
								{if $categoryProduct.specific_prices.reduction && $categoryProduct.specific_prices.reduction_type == 'percentage'}
									<span class="price-percent-reduction small"><span>-{$categoryProduct.specific_prices.reduction * 100}%</span></span>
								{/if}
								<span class="old-price">{displayWtPrice p=$categoryProduct.price_without_reduction}</span>

							{else}
								<span class="price">{convertPrice price=$categoryProduct.displayed_price}</span>
							{/if}
							</div>
						{else}

						{/if}	
						{capture name='displayProductListReviews'}{hook h='displayProductListReviews' product=$categoryProduct}{/capture}
						{if $smarty.capture.displayProductListReviews}
							<div class="hook-reviews">
							{hook h='displayProductListReviews' product=$categoryProduct}
							</div>
						{/if}
								<div class="actions">
							<div class="actions-inner">
								{if !$PS_CATALOG_MODE && ($categoryProduct.allow_oosp || $categoryProduct.quantity > 0)}
								<div class="cart">
									<a class="exclusive button ajax_add_to_cart_button" href="{$link->getPageLink('cart', true, NULL, 'qty=1&amp;id_product={$categoryProduct.id_product|intval}&amp;token={$static_token}&amp;add')|escape:'html':'UTF-8'}" data-id-product="{$categoryProduct.id_product|intval}" title="{l s='Add to cart' mod='productscategory'}">
										<span>{l s='Add to cart' mod='productscategory'}</span>
									</a>
								</div>
								{/if}
								<ul class="add-to-links">
									
									<li>
										{hook h='displayProductListFunctionalButtons' product=$categoryProduct}
									</li>
									<li>
										
										{if isset($comparator_max_item) && $comparator_max_item}
										  <a class="add_to_compare" title="{l s='Add to Compare'}" href="{$categoryProduct.link|escape:'html':'UTF-8'}" data-id-product="{$categoryProduct.id_product}">{l s='Compare' mod='productscategory'}
										
										  </a>
										 {/if}
									</li>
									<li>
									{if isset($quick_view) && $quick_view}
										<a class="quick-view" title="{l s='Quick view' mod='productscategory'}"  href="{$categoryProduct.link|escape:'html':'UTF-8'}">
											<span>{l s='Quick view' mod='productscategory'}</span>
										</a>
									{/if}
									</li>		
								
								</ul>		
							</div>
						</div>	
						
					</div>	
				</div>
			{/foreach}
			</div>
		</div>
	</div>
</section>
{/if}
<script type="text/javascript"> 
    $(document).ready(function() {
		var owl = $("#product_category");
		owl.owlCarousel({
		items : 3,
		pagination :false,
		lazyLoad: true,
		slideSpeed :1000,
		navigation : true,
		addClassActive: true,
		itemsDesktop : [1199,3],
		itemsDesktopSmall : [911,2], 
		itemsTablet: [767,2], 
		itemsMobile : [479,1],
		});
		 
    });

</script>