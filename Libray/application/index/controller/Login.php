<?php
/**
 * Created by PhpStorm.
 * User: God
 * Date: 2018/9/19
 * Time: 13:26
 */

namespace app\index\controller;
use app\index\model\usersModel;
use think\Controller;
use think\Db;
use think\Session;

class Login extends Controller{
    public function index(){
        return view('login');
    }
    public function  check(){
        $userno=$_POST["userno"];
        $password=$_POST["password"];
        $sql="select * from users where userno='$userno'";
        $user=Db::query($sql);
        foreach($user as $data){
            $pass=$data['password'];
            if($data == null){
                $this->error('请输入正确的用户名');
            }
            else {
                if ($pass != $password) {
                    $this->error('密码错误');
                }
                else{
                    if($data['power']=='0'){
                        Session::set('username', $_POST['userno']);
                        $this->success('登录成功','users/index');
                    }
                    else {
                        Session::set('username', $_POST['userno']);
                        $this->success('登录成功',url('manager/index'));
                    }
                }

            }
        }

    }
    public function register()
    {
        return view('register');
    }
    public function saveresign(){
        if(Db::table('users')->where('userno',$_POST['userno'])->select())
        {
            $this->error('用户名已存在');
        }
        $data=['userno'=>$_POST['userno'],'password'=>$_POST['password'],'power'=>0];
        $d=['userno'=>$_POST['userno'],'password'=>$_POST['password'],'readertypeno'=>7,'workno'=>7,'stat'=>'空闲'];
        $flag=Db::table('users')->insert($data);
        $f=Db::table('reader')->insert($d);
        if($flag>=1&&$f>=1){
            $this->success('注册成功',url('login/index'));
        }
    }
}