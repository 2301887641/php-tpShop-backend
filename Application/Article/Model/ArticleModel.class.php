<?php 
namespace Article\Model;
use Think\Model;
class ArticleModel extends Model{

   protected $_validate =array(
   
     
   array('title','require','文章标题不能为空',1),
 

    
   array('content','require','内容不能为空',1),
 

    
   array('cat_id','require','文章分类id不能为空',1),
 

         );  
  public function search(){
       $pages=15;
      
       $where=1;
       
        $count= $this->where($where)->count();// 查询满足要求的总记录数
       $Page= new \Think\Page($count,$pages);// 实例化分页类 传入总记录数和每页显示的记录数(25)
     
       $data['show'] = $Page->show();// 分页显示输出

      $data['list']=$this->alias('a')->join('sh_article_cat b on a.cat_id=b.id')->order('a.id')->field('a.*,b.cat_name')->where($where)->limit($Page->firstRow.','.$Page->listRows)->select();


      return $data;
   }   

}
