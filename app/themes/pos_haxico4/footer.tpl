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
{if !isset($content_only) || !$content_only}
	{if isset($category) && !empty($category->getRelevantCategoryId())}
		{assign var='relevant_category' value=$category->getRelevantCategoryId()}
		{if $relevant_category == $get_estudio['id_category']}
			{assign var='brandCaptureName' value='BrandSlider2'}
		{elseif $relevant_category == $get_audio_video['id_category']}
			{assign var='brandCaptureName' value='BrandSlider3'}
		{else}
			{assign var='brandCaptureName' value='BrandSlider'}
		{/if}
	{else}
		{assign var='brandCaptureName' value='BrandSlider'}
	{/if}
					</div><!-- #center_column -->
					{if isset($right_column_size) && !empty($right_column_size)}
						<div id="right_column" class="col-xs-12 col-sm-{$right_column_size|intval} column">{$HOOK_RIGHT_COLUMN}</div>
					{/if}
					</div><!-- .row -->
				</div><!-- #columns -->
				
				<div class="BrandSlider">
					<div class="container">
					{capture name='BrandSlider'}{hook h=$brandCaptureName}{/capture}
					{if $smarty.capture.BrandSlider}
						{$smarty.capture.BrandSlider}
					{/if}
					</div>
				</div>
				
			</div><!-- .columns-container -->
			{if isset($HOOK_FOOTER)}
				<div style="display: none"/>
					{$HOOK_FOOTER}
				</div>
				<!-- Footer -->
				<div class="footer-container">
					<footer id="footer">
						<div class="footer-static-top">
							<div class="container">	
								<div class="row">
								{capture name='blockFooter1'}{hook h='blockFooter1'}{/capture}
								{if $smarty.capture.blockFooter1}
								{$smarty.capture.blockFooter1}
								{/if}
								</div>
							</div>
						
						</div>
						<div class="footer-middle">
							<div class="container">
								<div class="row">
									{capture name='blockFooter2'}{hook h='blockFooter2'}{/capture}
									{if $smarty.capture.blockFooter2}
									{$smarty.capture.blockFooter2}
									{/if}
								</div>
							</div>
							
						</div>
						<div class="footer-bottom">
							<div class="container">
								<div class="row">
									{capture name='blockFooter3'}{hook h='blockFooter3'}{/capture}
									{if $smarty.capture.blockFooter3}
									{$smarty.capture.blockFooter3}
									{/if}
								</div>
							</div>
							
						</div>
						<div class="footer-bottom2">
							<div class="container">
								<div class="row">
									{capture name='blockFooter4'}{hook h='blockFooter4'}{/capture}
									{if $smarty.capture.blockFooter4}
									{$smarty.capture.blockFooter4}
									{/if}
								</div>
							</div>
							
						</div>
						{capture name='posscroll'}{hook h='posscroll'}{/capture}
						{if $smarty.capture.posscroll}
						{$smarty.capture.posscroll}
						{/if}
					</footer>
				</div><!-- #footer -->
			{/if}
		</div><!-- #page -->
{/if}
{include file="$tpl_dir./global.tpl"}
{addJsDefL name=min_item}{l s='Please select at least one product' js=1}{/addJsDefL}
{addJsDefL name=max_item}{l s='You cannot add more than %d product(s) to the product comparison' sprintf=$comparator_max_item js=1}{/addJsDefL}
{addJsDef comparator_max_item=$comparator_max_item}
{addJsDef comparedProductsIds=$compared_products}
	</body>
</html>
<script type="text/javascript">
 $(document).ready(function(){	
	 $(window).scroll(function() {    
   var scroll = $(window).scrollTop();
   if (scroll < 180) {
    $(".header-bottom").removeClass("scroll-menu");
   }else{
    $(".header-bottom").addClass("scroll-menu");
   }
  });

 });
</script>

