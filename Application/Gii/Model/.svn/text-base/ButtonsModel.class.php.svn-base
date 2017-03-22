<?php 
namespace Gii\Model;
use Think\Model;
class ButtonsModel extends Model{

   protected $_validate =array(
   
     
   array('btn_name','require','按钮名称不能为空',1),
 

    
   array('btn_url','require','按钮地址不能为空',1),
 

    
   array('btn_pos','require','按钮位置不能为空',1),
 

         );  
  public function search(){
       $pages=15;
      
       $where=1;
       
        $count= $this->where($where)->count();// 查询满足要求的总记录数
       $Page= new \Think\Page($count,$pages);// 实例化分页类 传入总记录数和每页显示的记录数(25)
     
       $data['show'] = $Page->show();// 分页显示输出

      $data['list']=$this->order('id')->where($where)->limit($Page->firstRow.','.$Page->listRows)->select();
      //echo $this->getLastSql();die;
      return $data;
   }   

}
