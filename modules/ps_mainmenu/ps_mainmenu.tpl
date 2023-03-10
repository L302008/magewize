{**
 * 2007-2018 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
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
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2018 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{assign var=_counter value=0}
{function name="menu" nodes=[] depth=0 parent=null}
    {if $nodes|count}
        <ul class="top-menu" {if $depth == 0}id="top-menu"{/if} data-depth="{$depth}">
            <li class="classic-list category  level0 logo-sticky" id="logo-stick" style="display: none">
                <a class="dropdown-item"   href="{$urls.base_url}" data-depth="0">
                    <span class="shop-name-sticky">
                    {$shop.name}
                    </span>
                </a>
            </li>
            {foreach from=$nodes item=node}
                <li class="classic-list {$node.type}{if $node.current} current {/if} {if $node.children|count} has-child {/if} level{$depth}"
                    id="{$node.page_identifier}">
                    {assign var=_counter value=$_counter+1}
                    <a
                            class="{if $depth >= 0}dropdown-item{/if}{if $depth === 1} dropdown-submenu{/if}"
                            href="{$node.url}" data-depth="{$depth}"
                            {if $node.open_in_new_window} target="_blank" {/if}
                    >
                        {if $node.children|count}
                            {* Cannot use page identifier as we can have the same page several times *}
                            {assign var=_expand_id value=10|mt_rand:100000}
                            <span class="float-xs-right hidden-md-up">
                                <span data-target="#top_sub_menu_{$_expand_id}" data-toggle="collapse"
                                      class="navbar-toggler collapse-icons">
                                    <i class="material-icons add">&#xE313;</i>
                                    <i class="material-icons remove">&#xE316;</i>
                                </span>
                            </span>
                        {/if}
                        {$node.label}
                    </a>
                    {if $node.children|count}
                        <div {if $depth === 0} class="classic-menu popover sub-menu js-sub-menu collapse"{else} class="collapse"{/if}
                                id="top_sub_menu_{$_expand_id}">
                            {menu nodes=$node.children depth=$node.depth parent=$node}
                            {if $node.image_urls|count > 0}
                                <div class="cat-bottom-block" data-count="{$node.children|count}">
                                    {foreach from=$node.image_urls item=image_url}
                                        <p>
                                            <img src="{$image_url}" alt="{$node.label}">
                                        </p>
                                    {/foreach}
                                </div>
                            {/if}
                        </div>
                    {/if}
                </li>
            {/foreach}
        </ul>
    {/if}
{/function}
<div class="top-navigation-menu">
    <div class="menu navbar-block col-lg-8 col-md-7 js-top-menu position-static hidden-sm-down" id="_desktop_top_menu">

        {menu nodes=$menu.children}
        <div class="clearfix"></div>
    </div>
</div>
<style>
    @import url('https://fonts.cdnfonts.com/css/baloo-bhai');
</style>