<?php

define('BASE_URL', '//'.$_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']).'/');
require_once './app/controllers/chocolatecontroller.php';
require_once './app/controllers/brandcontroller.php';
require_once './app/controllers/authcontroller.php';

 if (!empty($_GET['action'])) {
    $action = $_GET['action'];
} else {
    $action = 'brands'; // acción por defecto si no envían
}

$params = explode('/', $action);
/*TODO: mejorar el router con dos o tres switchs en params[1], por ejemplo: item, brand, login
para que quede mas prolijo, arreglar el error que salia (Undefined array key) con arreglos.*/
switch ($params[0]) {
            case 'brands':
                $brandcontroller = new Brandcontroller();
                $brandcontroller->showbrandstable();
                break;
            case 'add':
                $brandcontroller = new Brandcontroller();
                $brandcontroller->addbrand();
                break;   
            case 'delete':
                $brandcontroller = new Brandcontroller();
                $id = $params[1];
                $brandcontroller->delete($id);
                break;
            case 'edit':
                $brandcontroller = new Brandcontroller();
                $id = $params[1];
                $brandcontroller->edit($id);
                break;
            case 'item':
                $chocolatecontroller = new Chocolatecontroller();
                $chocolatecontroller->showchocolatetable();
                break;
            case 'additem':
                $chocolatecontroller = new Chocolatecontroller();
                $chocolatecontroller->adddata();
                break;
            case 'deleteitem':
                $chocolatecontroller = new Chocolatecontroller();
                $id = $params[1];
                $chocolatecontroller->delete($id);
                break;
            case 'edititem':
                $chocolatecontroller = new Chocolatecontroller();
                $id = $params[1];
                $chocolatecontroller->edit($id);
                break;
            case 'detail':
                $chocolatecontroller = new Chocolatecontroller();
                $id = $params[1];
                $chocolatecontroller->detail($id);
                break;
            case 'filter':
                $chocolatecontroller = new Chocolatecontroller();
                $chocolatecontroller->filter();
                break;
            case 'login':
                $Authcontroller = new Authcontroller();
                $Authcontroller->showformlogin();
                break;
            case 'validate':
                $Authcontroller = new Authcontroller();
                $Authcontroller->validateuser();
                break;
            case 'logout':
                $Authcontroller = new Authcontroller();
                $Authcontroller->logout();
            break;
    default:
        echo('404 Page not found'); 
        break;
}
?>