<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>ECSHOP 管理中心 - 添加新商品 </title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/Public/Styles/general.css" rel="stylesheet" type="text/css" />
<link href="/Public/Styles/main.css" rel="stylesheet" type="text/css" />
<script src="/Public/Js/jquery.js" type="text/javascript"></script>

<script src="/Public/ueditor/ueditor.config.js" type="text/javascript"></script>
<script src="/Public/ueditor/ueditor.all.min.js" type="text/javascript"></script>

<script src="/Public/ueditor/lang/zh-cn/zh-cn.js" type="text/javascript"></script>
<script src="/Public/ueditor/btn_config.js" type="text/javascript"></script>
</head>
<body>
<h1>
    <span class="action-span"><a href="/Goods/Goods/lst">商品列表</a>
    </span>
    <span class="action-span1"><a href="__GROUP__">ECSHOP 管理中心</a></span>
    <span id="search_id" class="action-span1"> - 添加新商品 </span>
    <div style="clear:both"></div>
</h1>

<div class="tab-div">
    <div id="tabbar-div">
        <p>
            <span class="tab-front" id="general-tab">基本信息</span>
            <span class="tab-back" id="general-tab">商品描述</span>
            <span class="tab-back" id="general-tab">会员价格</span>
            <span class="tab-back" id="general-tab">商品属性</span>
            <span class="tab-back" id="general-tab">商品图片</span>
        </p>
    </div>
    <div id="tabbody-div">
        <form enctype="multipart/form-data" action="/Goods/Goods/add" method="post">
            <table width="90%" class="general-table" align="center">
                   <tr>
                    <td class="label">商品logo：</td>
                    <td>
                        <input type="file" name="logo" size="35" />
                    </td>
                </tr>
                <tr>
                    <td class="label">商品名称：</td>
                    <td><input type="text" name="goods_name" value=""size="30" />
                    <span class="require-field">*</span></td>
                </tr>
      
                <tr>
                    <td class="label">商品分类：</td>
                    <td>
                        <select name="cat_id">
                            <option value="0" selected='selected'>请选择...</option>
                           <?php foreach($cate_date as $c):?>
                           <option value="<?php echo $c['id']?>"><?php echo str_repeat('---',$c['level']).$c['cat_name']?></option>
                            <?php endforeach;?>
                        </select>
                        <span class="require-field">*</span>
                    </td>
                </tr>
                <tr>
                    <td class="label">商品品牌：</td>
                    <td>
                        <select name="brand_id">
                            <option value="0">请选择...</option>
                            <?php foreach($brand_date as $b):?>
                            <option value="<?php echo $b['id']?>"><?php echo $b['brand_name']?></option>
                            <?php endforeach;?>
                        </select>
                    </td>
                </tr>
                  <tr>
                    <td class="label">市场售价：</td>
                    <td>
                        <input type="text" name="market_price" value="0" size="20"/>
                        <span class="require-field">*</span>
                    </td>
                </tr>
                <tr>
                    <td class="label">本店售价：</td>
                    <td>
                        <input type="text" name="shop_price" value="0" size="20"/>
                        <span class="require-field">*</span>
                    </td>
                </tr>
    
                <tr>
                    <td class="label">是否上架：</td>
                    <td>
                        <input type="radio" name="is_on_sale" value="1" checked='checked'/> 是
                        <input type="radio" name="is_on_sale" value="2"/> 否
                    </td>
                </tr>
              <tr>
                    <td class="label">商品重量：</td>
                    <td>
                        <input type="text" name="goods_weight"/>
                        <select name="weight_unit">
                            <option value='1'>克</option>
                             <option value='2'>千克</option>
                        </select>
                    </td>
                </tr>
       
               <tr>
                    <td class="label">推荐到：</td>
                    <td>
                           <?php foreach($recommend as $r):?>
                           <input type='checkbox' name="rec[]" value='<?php echo $r["id"]?>'><?php echo $r['rec_name']?>
                            <?php endforeach;?>
                       
                    </td>
                </tr>
            </table>
            <table width="90%" class="general-table" align="center" style="display:none;">
                <tr><td>
                    
                        <textarea id="ue_con" name="goods_desc"></textarea>     
                    </td></tr>
                
                
            </table>
            <table width="90%" class="general-table" align="center" style="display:none;">
                <?php foreach($member_info as $m):?>  
                <tr><td>
                        <?php echo $m["level_name"];?>: ￥<input name='mp[<?php echo $m["id"];?>]' type="text">元
                        
                </td></tr>
                <?php endforeach;?>
                
            </table>
            <table width="90%" class="general-table" align="center" style="display:none;">
                <tr><td>
                        <select name="type_id">
                            <option value="0">请选择分类</option>
                    <?php foreach($type as $t):?>
                    <option value="<?php echo $t['id']?>"><?php echo $t['type_name']?></option>
                    
                    <?php endforeach;?>
                        </select>
                    </td></tr>
                <tr><td id='append_to'></td></tr>
                
            </table>
           <table width="90%" id="add_pics" class="general-table" align="center" style="display:none;">
               <tr>
                   <td><input type="button" value="添加一张" class="add_pic"></td>
               </tr>
                       <tr><td>
                               <input type="file" name="goods_pic[]">
                   </td></tr>
                
                
            </table>
            <div class="button-div">
                <input type="submit" value=" 确定 " class="button"/>
                <input type="reset" value=" 重置 " class="button" />
            </div>
        </form>
    </div>
   
</div>

<div id="footer">
共执行 9 个查询，用时 0.025161 秒，Gzip 已禁用，内存占用 3.258 MB<br />
版权所有 &copy; 2005-2012 高端大气上档次有限公司，并保留所有权利。</div>
</body>
</html>
<script>

    $('#tabbar-div span').click(function(){
        
       var i=$(this).index();
      $(".general-table").hide();
       $(".general-table").eq(i).show();
       $('#tabbar-div span').removeClass('tab-front').addClass('tab-back');
       $(this).removeClass('tab-back').addClass('tab-front');
    });
    $(document).ready(function () {
    UE.getEditor('ue_con', {
    toolbars:btn_file,
	initialFrameWidth: "100%",
	initialFrameHeight: "500",
        
});
    })  
    $('.add_pic').click(function(){
        
        $('#add_pics').append('<tr><td><input type="file" name="goods_pic[]"></td></tr>');
        
    });
    
    
$("select[name='type_id']").change(function(){
    $type_value=$(this).val();
   $.ajax({
       type:'get',
       url:'/Goods/Goods/ajaxattr/type_id/'+$type_value,
       dataType:'json',
       success:function(date){
           var html='';
         $(date).each(function(k,v){
             if(v.attr_type=='单选'){
                 html+='<span>';
                 html+=v.attr_name+':';
                 var attr=v.attr_values.split(',');
                 html+='<a href="#" onclick="addrow(this)">[+]</a><select name="goods_attr['+v.id+'][]"><option value="0" checked="checked">请选择</option><br/>';
                 for(var i=0;i<attr.length;i++){
                 html+='<option value='+attr[i]+'>'+attr[i]+'</option>';    
                     
                     
                 }
                 
           
                 html+='</select> ￥<input type="text" value="0" name="attr_price[]">元<br/></span>';
             }else{
               if(v.attr_values=='')  
              html+=v.attr_name+": <input type='text' name='goods_attr["+v.id+"]'> ￥<input type='text' value='0' name='attr_price[]'>元<br/><br/>";
               else
               {
                   html+=v.attr_name+':';
                 var attr=v.attr_values.split(',');
                 html+='<select name="goods_attr['+v.id+']"><option value="0" checked="checked">请选择</option><br/>';
                 for(var i=0;i<attr.length;i++){
                 html+='<option value='+attr[i]+'>'+attr[i]+'</option>';    
                     
                     
                 }
                 html+='</select> ￥<input type="text" value="0" name="attr_price[]">元<br/>';
     
               }
             }
            
             $('#append_to').html(html);
             
         });
           
       }
       
   });
    
    
    
}); 

function addrow(even){
     var span=$(even).parent();
    if($(even).html()=="[+]"){
   
   var newspan=span.clone();
  newspan.find("a").html("[-]");
   span.after(newspan);
    }else{
       span.remove(); 
        
        
    }  
}
</script>