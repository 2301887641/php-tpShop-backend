<?php 
namespace Gii\Model;
use Think\Model;
class ShopConfigModel extends Model{

   protected $_validate =array(
   
     
   array('config_name','require','参数名称不能为空',1),
 

    
   array('config_type','require','参数类型不能为空',1),


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
   
   public function _before_insert(&$data, $options) {
       $data['config_value']=  str_replace('，', ',', $data['config_value']); 
       }
   public function _before_update(&$data, $options) {
      // var_dump($data);die;
      $data['config_value']=  str_replace('，', ',', $data['config_value']); 
       }
}
