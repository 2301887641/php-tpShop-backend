<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>ECSHOP 管理中心 - 商品列表 </title>
    <meta name="robots" content="noindex, nofollow">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/Public/Styles/general.css" rel="stylesheet" type="text/css" />
    <link href="/Public/Styles/main.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/Public/Js/jquery.js"></script>
</head>
<body>
    <h1>
        <span class="action-span"><a href="/Goods/Goods/add">添加商品 </a></span>
        <span class="action-span1"><a href="#">ECSHOP 管理中心</a></span>
        <span id="search_id" class="action-span1"> - 商品 列表 </span>
        <div style="clear:both"></div>
    </h1>
    <div class="form-div">
        <form action="/Goods/Goods/lst.html" method="get" name="searchForm">
            <img src="/Public/Images/icon_search.gif" width="26" height="22" border="0" alt="search" />
            用户名：<input type="text" name="un" size="15" value=""/>
            id：<input type="text" name="id" size="15" value="" />
            <input type="submit" value=" 搜索 " class="button" />
        </form>
    </div>
    <form method="post" action="/Goods/Goods/bdel" name="listForm">

        <div class="list-div" id="listDiv">
            <table cellpadding="3" cellspacing="1">
                <tr>
                    <th width="80"><input type="checkbox" class="first_check"></th>
                    <th>id</th>
                    <th>商品名称</th>
                    <th>市场价</th>
                    <th>本店价</th>
                    <th>logo</th>
                    <th>是否上架</th>
                    <th>库存量</th>
                    <th>操作</th>
                </tr>
                <?php foreach($list as $v):?>            <tr>
                    <td class="first-cell" align="center">
                     <input type="checkbox" class="second_check" name="del_check[]" value="<?php echo $v['id']?>" >
                     
                 </td>
                 <td align="center">
                     <?php echo $v['id'];?>                </td>
                     <td align="center">
                         <?php echo $v['goods_name'];?>                </td>
                         <td align="center">
                             <?php echo $v['market_price'];?>                </td>
                             <td align="center">
                                 <?php echo $v['shop_price'];?>                </td>
                                 <td align="center">
                                    <img src="<?php echo '/Public/Uploads/'.$v['sm_logo'];?>">                </td>
                                    <td align="center">
                                     <?php echo $v['is_on_sale'];?>                </td>

                                     <td align="center"><?php echo $v['goods_number']?></td>
                                     <td align="center">
                                         <a href="/Goods/Goods/product/goods_id/<?php echo $v['id']?>" title="货品">货品</a>
                                         <a href="/Goods/Goods/save/id/<?php echo $v['id']?>" title="编辑">编辑</a>
                                         | <a href="/Goods/Goods/del/id/<?php echo $v['id']?>" onclick="return confirm('是否要删除?')" title="编辑">移除</a> 

                                     </td>
                                 </tr>
                             <?php endforeach ?>            <tr><td><input type="submit" value="删除所有"></td><td colspan="7"></td></tr>
                             <tr>
                                <td align="right" nowrap="true" colspan="6">
                                    <div id="turn-page">
                                       <?php echo $show?>                    </div>
                                   </td>
                               </tr>
                           </table>
                       </div>
                   </form>

                   <div id="footer">
                    共执行 3 个查询，用时 0.021251 秒，Gzip 已禁用，内存占用 2.194 MB<br />
                    版权所有 &copy; 2005-2012 高端大气上档次有限公司，并保留所有权利。</div>
                </body>
                </html>
                <script>
                    $(".first_check").click(function(){
                        if($(this).attr("checked")){
                            $(".second_check").attr("checked","checked");
                        }else{
                         $(".second_check").removeAttr("checked"); 

                     }

                 });


                </script>