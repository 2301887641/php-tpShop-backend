<?php 
namespace Article\Model;
use Think\Model;
class ArticleCatModel extends Model{

   protected $_validate =array(
   
     
   array('cat_name','require','分类名称不能为空',1),
 

    
   array('is_help','require','是否是帮助不能为空',1),
 

         );  
  public function search(){
       $pages=15;
      
       $where=1;
       
        $count= $this->where($where)->count();// 查询满足要求的总记录数
       $Page= new \Think\Page($count,$pages);// 实例化分页类 传入总记录数和每页显示的记录数(25)
     
       $data['show'] = $Page->show();// 分页显示输出

      $data['list']=$this->alias('a')->field('a.*,count(b.cat_id) article_count')->join('left join sh_article b on a.id=b.cat_id')->group('a.id')->order('article_count desc')->where($where)->limit($Page->firstRow.','.$Page->listRows)->select();
     // var_dump($data['list']);
//echo $this->getLastSql();die;
      return $data;
   }   
 public function _before_delete($options) {
  
    $article=M('article');
    if(is_array($options['where']['id'])){
        
     $article->where('cat_id in('.$options['where']['id'].')')->delete();   
    }else{
        
     $article->where('cat_id='.$options['where']['id'])->delete();   
        
    }
    
     }
}
