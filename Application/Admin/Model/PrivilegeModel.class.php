<?php
namespace Admin\Model;

use Think\Model;

class PrivilegeModel extends Model
{

    protected $_validate = array(


        array('pri_name', 'require', '权限名称不能为空', 1),


        array('module_name', 'require', '模块名称不能为空', 1),


        array('controller_name', 'require', '控制器名称不能为空', 1),


        array('action_name', 'require', '方法名称不能为空', 1),


        array('pri_name', '', '权限名称不能重复', 1, 'unique'),

    );

    public function search()
    {
        $pages = 15;

        $where = 1;

        $count = $this->where($where)->count();// 查询满足要求的总记录数
        $Page = new \Think\Page($count, $pages);// 实例化分页类 传入总记录数和每页显示的记录数(25)

        $data['show'] = $Page->show();// 分页显示输出

        $data['list'] = $this->order('id')->select();

        $data['list'] = $this->get_tree($data['list']);
        return $data['list'];
    }

    public function get_pri()
    {
        $data = $this->select();
        return $this->get_tree($data);

    }

    public function get_tree($data, $parent_id = 0, $level = 0)
    {
        static $arr = array();
        foreach ($data as $d) {
            if ($d['parent_id'] == $parent_id) {
                $d['level'] = $level;
                $arr[] = $d;
                $this->get_tree($data, $d['id'], $level + 1);
            }
        }
        return $arr;
    }

    /**
     * 前置删除 删除权限前连同下级一同删除
     * @param $options
     */
    public function _before_delete($options)
    {
        $data = $this->select();
        if (is_array($options['where']['id'])) {
            $arr = explode(',', $options['where']['id'][1]);
            $arr2 = array();
            foreach ($arr as $a) {
                $tree = $this->delete_tree($data, $a);
                $arr2 = array_merge($arr2, $tree);//将所有的数组取出合并到一个数组中去
            }
            $arr2 = array_unique($arr2);
            $str = implode(',', $arr2);
            $this->execute("delete from sh_privilege where id in ( $str )");
        } else {
            $del = $this->delete_tree($data, $options['where']['id']);
            $str = implode(',', $del);

            $this->execute("delete from sh_privilege where id in ( $str )");
        }
    }

    /**
     * 递归删除权限id
     * @param $data
     * @param $parent_id
     * @return array
     */
    public function delete_tree($data, $parent_id)
    {
        $arr = array();
        foreach ($data as $c) {
            if ($c['parent_id'] == $parent_id) {
                $arr[] = $c['id'];
                $arr = array_merge($arr, $this->delete_tree($data, $c['id']));
            }
        }
        return $arr;
    }
}
