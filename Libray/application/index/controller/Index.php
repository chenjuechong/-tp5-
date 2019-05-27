<?php
/**
 * Created by PhpStorm.
 * User: sj
 * Date: 2019/1/14
 * Time: 17:10
 */

namespace app\index\controller;


use think\Controller;

class Index extends Controller
{
    public function index(){
        $this->redirect("Login/index");
    }

}