<?php 
namespace Goods\Model;
use Think\Model;
class TypeModel extends Model{

   protected $_validate =array(
   
     
   array('type_name','require','类型名称不能为空',1),
 

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
        //var_dump($options["where"]["id"]);die; 
       
       if(is_array($options["where"]["id"]))
           $this->execute("delete from sh_attribute where type_id in({$options['where']['id'][1]})");
       else 
         $this->execute("delete from sh_attribute where type_id={$options['where']['id']}");    
      }
}
