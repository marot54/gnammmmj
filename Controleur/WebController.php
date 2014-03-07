<?php

include 'Controller.php';

class WebController extends Controller {

    public function __construct() {
        $this->actionlist = array('' => '', '' => '', '' => '');
    }

    protected function listAction($get) {
        $listbillet = Billets::findAll();
        $view = new Vue($listbillet);
        echo $view->afficheAll();
    }

    protected function defaultAction($p) {
        
    }

}

?>