<?php 
namespace Ad\Model;
use Think\Model;
class AdPosModel extends Model{

   protected $_validate =array(
   
     
   array('pos_name','require','广告位名称不能为空',1),
 

    
   array('pos_width','require','广告位宽不能为空',1),
 

    
   array('pos_height','require','广告位高不能为空',1),
 

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
 public function _before_delete($options) {
  
    $ad=M('ad');
    if(is_array($options['where']['id'])){
        
     //$ad->where('pos_id in('.$options['where']['id'].')')->delete();   
    }else{
        
     //$ad->where('pos_id='.$options['where']['id'])->delete();   
        
    }
    
     }
}
