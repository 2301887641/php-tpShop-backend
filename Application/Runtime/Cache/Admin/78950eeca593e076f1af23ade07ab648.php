<?php if (!defined('THINK_PATH')) exit();?><!-- $Id: brand_info.htm 14216 2008-03-10 02:27:21Z testyang $ -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>ECSHOP 管理中心 - 添加管理员 </title>
<meta name="robots" content="noindex, nofollow">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/Public/Styles/general.css" rel="stylesheet" type="text/css" />
<link href="/Public/Styles/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
<h1>
    <span class="action-span"><a href="/Admin/Admin/lst">管理员列表</a></span>
    <span class="action-span1"><a href="#">ECSHOP 管理中心</a></span>
    <span id="search_id" class="action-span1"> - 添加管理员 </span>
    <div style="clear:both"></div>
</h1>
<div class="main-div">
    <form method="post" action="/Admin/Admin/save/id/1" enctype="multipart/form-data" >
        <input type="hidden" name='id' value="<?php echo $data['id']?>">
        <table cellspacing="1" cellpadding="3" width="100%">
            <tr>
               
                <td class="label">角色:</td>
                <td>
                    <select>
                        
                    <?php foreach($role as $r) :if($r['id']==$data['role_id']) $select="selected='selected'"; else $select='';?>
                    <option <?php echo $select?> value="<?php echo $r['id']?>"><?php echo $r['role_name']?></option>
                    
                    
                    <?php endforeach;?>
                    </select>
                </td>
                
            </tr>
            <tr>
                <td class="label">用户名:</td>
                <td>
                    <input type="text" name="username" maxlength="60" value="<?php echo $data['username']?>"/>
                    <span class="require-field">*</span>
                </td>
            </tr>
            <tr>
                <td class="label">密码:</td>
                <td>
                    <input type="text" name="password" maxlength="60" size="40"/><span class="require-field">*如果留空表示不修改密码</span>
                </td>
            </tr>
      
            <tr>
                <td colspan="2" align="center"><br />
                    <input type="submit" class="button" value=" 确定 " />
                    <input type="reset" class="button" value=" 重置 " />
                </td>
            </tr>
        </table>
    </form>
</div>

<div id="footer">
共执行 1 个查询，用时 0.018952 秒，Gzip 已禁用，内存占用 2.197 MB<br />
版权所有 &copy; 2005-2012 高端大气上档次有限公司，并保留所有权利。</div>
</body>
</html>