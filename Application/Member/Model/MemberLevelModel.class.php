<?php 
namespace Member\Model;
use Think\Model;
class MemberLevelModel extends Model{

   protected $_validate =array(
   
     
   array('level_name','require','级别名称不能为空',1),
 

    
   array('num_bottom','require','积分下限不能为空',1),
 

    
   array('num_top','require','积分上限不能为空',1),
 

    
   array('rate','require','折扣率不能为空',1),
 

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
