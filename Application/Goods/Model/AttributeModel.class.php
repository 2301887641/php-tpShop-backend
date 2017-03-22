<?php 
namespace Goods\Model;
use Think\Model;
class AttributeModel extends Model{

   protected $_validate =array(
   
     
   array('attr_name','require','属性名称不能为空',1),
 

    
   array('attr_type','require','属性类型不能为空',1),
 

    
   array('type_id','require','所属类型不能为空',1),
 

         );  
  public function search(){
       $pages=15;
     
       $where='type_id='.I('get.type_id');
       
        $count= $this->where($where)->count();// 查询满足要求的总记录数
       $Page= new \Think\Page($count,$pages);// 实例化分页类 传入总记录数和每页显示的记录数(25)
     
       $data['show'] = $Page->show();// 分页显示输出

      $data['list']=$this->order('id')->where($where)->limit($Page->firstRow.','.$Page->listRows)->select();
      //echo $this->getLastSql();die;
      return $data;
   }   
  public function _before_insert(&$data, $options) {
       
       $data ["attr_values"]=  str_replace('，', ',', $data ["attr_values"]);
      
      }
      
   public function _before_update(&$data, $options) {
       $data ["attr_values"]=  str_replace('，', ',', $data ["attr_values"]);
       }   
}
