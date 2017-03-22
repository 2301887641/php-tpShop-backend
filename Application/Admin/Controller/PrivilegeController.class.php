<?php
namespace Admin\Controller;

use Admin\Controller\IndexController;

class PrivilegeController extends IndexController
{
    public function add()
    {//添加
        $admin = D("Privilege");//D函数必须自己创建模型,一般模型中有验证规则时用D
        if (IS_POST) {

            if ($admin->create()) {
                if ($admin->add()) {
                    $this->success("添加成功", U("lst"));
                    exit;

                } else
                    $this->error("添加失败");
            } else

                $this->error($admin->getError());//从模型中获取失败的原因
            exit;

        }
        $data = $admin->get_pri();
        $this->assign('list', $data);
        $this->display();
    }

    public function save($id)
    {//修改 修改表单要有一个隐藏表单域,name位主键
        $admin = D("Privilege");//D函数必须自己创建模型,一般模型中有验证规则时用D
        if (IS_POST) {

            if ($admin->create()) {
                if ($admin->save() !== false) {//返回受影响的行数
                    $this->success("修改成功", U("lst"));
                    exit;

                } else
                    $this->error("修改失败");
            } else

                $this->error($admin->getError());//从模型中获取失败的原因
            exit;

        }
        $d = $admin->find($id);
        $this->assign('data', $d);
        $data = $admin->get_pri();
        $this->assign('list', $data);
        $this->display();
    }

    public function lst()
    {
        $admin = D("Privilege");//D函数必须自己创建模型,一般模型中有验证规则时用D
        $data = $admin->search();
        $this->assign('list', $data);
        $this->display();
    }

    public function del($id)
    {

        $admin = M('Privilege');
        $admin->delete($id);

        $this->success("修改成功");


    }

    public function bdel()
    {
        $del = I('post.del_check');
        if ($del) {
            $admin = D('Privilege');
            $str = implode(',', $del);
            $admin->delete($str);
        }
        $this->success("删除成功");
    }
}
    
    
    
