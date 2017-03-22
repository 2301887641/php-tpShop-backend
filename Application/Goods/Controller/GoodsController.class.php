<?php 
namespace Goods\Controller;
use Admin\Controller\IndexController;

class GoodsController extends IndexController{
    public function add(){//添加
     if(IS_POST){
      //添加商品时,因为考虑到要上传多张图片所以脚本执行时间去掉
       set_time_limit(0);
          $admin= D("Goods");//D函数必须自己创建模型,一般模型中有验证规则时用D
          if($admin->create()){
            if($admin->add()){
             $this->success("添加成功",U("lst")); 
             exit; 
           }else
           $this->error("添加失败");   
         }else
            $this->error($admin->getError());//从模型中获取失败的原因   
            exit;
          }
          $cate=D('category');
          $cate_data=$cate->get_category();
          $brand=M('brand');
          $brand_date=$brand->select();
          $ml=M('memberLevel');
          $m_all=$ml->select();
          $type=M('type');
          $type_date=$type->select();
          $recommend=M('recommend');
          $recommends=$recommend->where('rec_type="商品"')->select();
          $this->assign(array(
           'cate_date'=>$cate_data,
           'brand_date'=>$brand_date,
           'member_info'=>$m_all,
           'type'=>$type_date,
           'recommend'=>$recommends
           ));
          $this->display();
        } 

   public function save($id){//修改 修改表单要有一个隐藏表单域,name位主键
        $admin= D("Goods");//D函数必须自己创建模型,一般模型中有验证规则时用D
        if(IS_POST){//判断是否是修改
          if($admin->create()){
              if($admin->save()!==false){//返回受影响的行数
               $this->success("修改成功",U("lst")); 
               exit; 
             }else
             $this->error("修改失败");   
           }else
          $this->error($admin->getError());//从模型中获取失败的原因   
          exit;
        }
        $d=$admin->find($id);
      $category=D('category');//查询商品类型
      $category_data=$category->get_category();
      $brand=M('brand');//商品品牌
      $brand_data=$brand->select();
      $member_level=M('memberLevel');//会员级别
      $member_info=$member_level->select();
      $member_price=M('memberPrice');//会员价格
      $member_price=$member_price->where('goods_id='.$id)->select();
      $goods_pic=M('goodsPic');//商品图片
      $goods_pics=$goods_pic->where('goods_id='.$id)->select();
      
      $goods_attr=M('goodsAttr');//商品属性
      $goods_attrs=$goods_attr->where('goods_id='.$id)->select();
      $goods_attrs_data=array();
      foreach($goods_attrs as $k=>$g){
       $goods_attrs_data[$g['attr_id']][]=$g; 
     }
     if($d['type_id']!=0){
      $attribute=M('attribute');
      $attributes=$attribute->where('type_id='.$d['type_id'])->select();
      $this->assign('attributes',$attributes);
    }
      $type=M('type');//商品类型
      $types=$type->select();
      $recommend=M('recommend');//推荐位
      $recommends=$recommend->where('rec_type="商品"')->select();
      $recommendItem=M('recommendItem');
      $recs=$recommendItem->alias('a')->field('group_concat(a.rec_id) rec_ids')->join('join sh_recommend b on a.rec_id=b.id')->where('goods_id='.$id.' and b.rec_type="商品"')->select();
      $this->assign(array(
        'data'=>$d,
        'category'=>$category_data, 
        'brand'=>$brand_data,
        'member_info'=>$member_info,
        'member_price'=>$member_price,
        'goods_pics'=>$goods_pics,
        'type'=>$types,
        'goods_attr'=>$goods_attrs_data,
        'recommend'=>$recommends,
        'recs'=>$recs[0]["rec_ids"]
        ));
      $this->display();
    } 

    //商品列表
    public function lst(){
          $admin= D("Goods");//D函数必须自己创建模型,一般模型中有验证规则时用D  
          $data=$admin->search(); 
          // dump($data);die;
          $this->assign(array(
           'show'=>$data['show'],
           'list'=>$data['list'],
           ));
          $this->display();
        }

        //根据id单独删除商品
        public function del($id){
          $admin=D('Goods'); 
          $admin->delete($id); 
          $this->success("修改成功");   
        }

        //批量删除商品函数
        public function bdel(){
          $del=I('post.del_check');
          if($del){
           $admin=D('Goods');
           $str=implode(',',$del);
           $admin->delete($str);
         }
         $this->success("删除成功");
       } 

       public function ajaxattr($type_id){
         $attr=  M('attribute');
         $data=$attr->where('type_id='.$type_id)->select();
         echo json_encode($data);
       }

       //ajax删除商品图片
       public function ajaxDel($id){
         $goods_pic=M('goodsPic');
         $goods_pics=$goods_pic->field("logo,sm_logo,big_logo")->where('id='.$id)->find();
         unlink(IMG_PATH2.$goods_pics['logo']);
         unlink(IMG_PATH2.$goods_pics['sm_logo']);
         unlink(IMG_PATH2.$goods_pics['big_logo']);
         $goods_pic->where('id='.$id)->delete();
       }

       //ajax删除商品属性
       public function ajaxDelGoodsAttr($id){
         $goodsAttr=M('goodsAttr');
         return $goodsAttr->delete($id);

       }

      //给货品添加库存 
       public function product($goods_id){
          $product=M("product");
      //判断是否是提交表单  
        if(IS_POST){
      //每次添加时先将这id的数据删除掉,这个表不要有id主键    
         $product->where("goods_id=$goods_id")->delete(); 
      //接收商品的库存数组
          $goods_number=I("goods_number");
      //接收货品数组    
          $goods_attr=I("goods_attr");
      //不过有多少货品,都对应货品的库存.所以,以库存为主来循环    
          foreach($goods_number as $k=>$v){
      //定义一个临时数组,存储属性.每次的初始化很重要      
          $attr_arr=array();
      //循环货品    
          foreach($goods_attr as $k2=>$v2){
        //判断下属性如果不为空再添加    
            if($v2[$k])
            $attr_arr[]=$v2[$k];
            }
            if(empty($attr_arr)) continue;
        //将货品和库存添加到数据库    
          $product->add(array(
          'goods_id'=>$goods_id,
        //库存如果不填,会置为0  
          'goods_number'=>$v,
        //属性中间用逗号分隔  
          'goods_attr'=>join(',',$attr_arr)
            ));  
           } 
           $this->success("添加成功");
           die;
        }
      //取出当前商品的所有货品库存  
        $products=$product->where('goods_id='.$goods_id)->select();
        $goods=D("Goods");
        $attrs=$goods->product($goods_id);
        $this->assign(array(
          "attrs"=>$attrs,
          "product"=>$products
          ));
        $this->display();
      }
    }



