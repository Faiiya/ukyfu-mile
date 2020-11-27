{**
 * 2007-2017 PrestaShop
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
 * @copyright 2007-2017 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{assign var=_counter value=0}
{function name="menu" nodes=[] depth=0 parent=null}
  {if $nodes|count}
    <ul {if $depth === 0}class="menu-top h-100" id="top-menu" role="navigation"{else} class="menu-sub__list menu-sub__list--{$depth}"{/if} data-depth="{$depth}">
      {foreach from=$nodes item=node}
        {if $node.children|count}
          {assign var=_expand_id value=10|mt_rand:100000}
        {/if}
        <li class="h-100 menu__item--{$depth} {$node.type} menu__item {if $depth === 0}menu__item--top{else}menu__item--sub{/if}{if $node.current} menu__item--current{/if}"
          id="{$node.page_identifier}" {if $node.children|count}aria-haspopup="true" aria-expanded="false"
          aria-owns="top_sub_menu_{$_expand_id}" aria-controls="top_sub_menu_{$_expand_id}"{/if}>
          {assign var=_counter value=$_counter+1}

          {if $node.children|count}
          <div class="menu__item-header">
          {/if}
            <a
              class="d-md-flex w-100 h-100 {if $depth === 0}menu__item-link--top{else}menu__item-link--sub menu__item-link--{$depth}{/if} {if $node.children|count}menu__item-link--hassubmenu{else}menu__item-link--nosubmenu{/if}"
              href="{$node.url}" data-depth="{$depth}"
              {if $node.open_in_new_window} target="_blank" {/if}
            >
              <span class="align-self-center">{$node.label}</span>
            </a>
            {if $node.children|count}
            {* Cannot use page identifier as we can have the same page several times *}
            {assign var=_expand_id value=10|mt_rand:100000}
            <span class="visible--mobile">
                <span data-target="#top_sub_menu_{$_expand_id}" data-toggle="collapse"
                      class="d-block navbar-toggler icon-collapse">
                  <i class="material-icons menu__collapseicon">&#xE313;</i>
                </span>
              </span>
          </div>
          {/if}
          {if $node.children|count}
            <div class="{if $depth === 0}menu-sub {/if}clearfix collapse show" data-collapse-hide-mobile
                 id="top_sub_menu_{$_expand_id}" role="group" aria-labelledby="{$node.page_identifier}"
                 aria-expanded="false" aria-hidden="true">
              <div{if $depth === 0} class="menu-sub__content"{/if}>
                {menu nodes=$node.children depth=$node.depth parent=$node}
              </div>
            </div>
          {/if}
        </li>
      {/foreach}
    </ul>
  {/if}
{/function}


{block name='header_banner'}
    <div class="header-banner">
        {hook h='displayBanner'}
    </div>
{/block}

{block name='header_nav'}
    <div class="header-nav u-bor-bot">
        <div class="header__container mx-5">
            <div class="u-a-i-c d--flex-between visible--desktop">
                <div class="small">
                    {hook h='displayNav1'}
                </div>
                <div class="header-nav__right">
                    {hook h='displayNav2'}
                </div>
            </div>
        </div>
    </div>
{/block}

{block name='header_top'}
    <div class="header-top tw-flex tw-flex-row px-5">
        <button class="visible--mobile btn" id="menu-icon" data-toggle="modal" data-target="#mobile_top_menu_wrapper">
            <i class="material-icons d-inline">&#xE5D2;</i>
        </button>
        <a href="{$urls.base_url}" class="header__logo tw-flex-initial">
            <img class="logo img-fluid tw-m-0" style="height:50px" src="{$shop.logo}" alt="{$shop.name}">
        </a>
        <div class="tw-flex-auto px-1">
            {hook h='displayMenuNav'}
        </div>
        <div class="header__right tw-flex-initial"> 
            {hook h='displaySearch'}
            {hook h='displayTop'}
        </div>
    </div>
{/block}
