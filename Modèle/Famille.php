<?php

class Famille {

    private $no_fam;
    private $nom_resp;
    private $pre_resp;
    private $type_resp;
    private $adr_resp;
    private $tel_resp;
    private $noalloc_caf_resp;
    private $qf_resp;
    private $en_ville;
    private $bons_vac;

    public function __construct() {
        
    }

    public function __get($attr_name) {
        if (property_exists(__CLASS__, $attr_name)) {
            return $this->$attr_name;
        }
        $emess = __CLASS__ . ": unknown member $attr_name (getAttr)";
        throw new Exception($emess, 45);
    }

    public function __set($attr_name, $attr_val) {

        if (property_exists(__CLASS__, $attr_name)) {
            $this->$attr_name = $attr_val;
        } else {
            $emess = __CLASS__ . ": unknown member $attr_name (setAttr)";
            echo ($emess);
        }
    }

    public function update() {

        if (!isset($this->id)) {
            throw new Exception(__CLASS__ . ": Primary Key undefined : cannot update");
        }

        $c = Base::getConnection();
        $query = $c->prepare("update Famille set nom_resp= ?,
                                                 pre_resp= ?
                                                 type_resp= ?
                                                 adr_resp= ?
                                                 tel_resp= ?
                                                 noalloc_caf_resp= ?
                                                 qf_resp= ?
                                                 en_ville= ?
                                                 bons_vac= ?
				                 where no_fam= ?");

        $query->bindParam(1, $this->nom_resp, PDO::PARAM_STR);
        $query->bindParam(2, $this->pre_resp, PDO::PARAM_STR);
        $query->bindParam(3, $this->type_resp, PDO::PARAM_STR);
        $query->bindParam(4, $this->adr_resp, PDO::PARAM_STR);
        $query->bindParam(5, $this->tel_resp, PDO::PARAM_INT);
        $query->bindParam(6, $this->noalloc_caf_resp, PDO::PARAM_INT);
        $query->bindParam(7, $this->qf_resp, PDO::PARAM_INT);
        $query->bindParam(8, $this->en_ville, PDO::PARAM_STR);
        $query->bindParam(9, $this->bons_vac, PDO::PARAM_STR);
        $query->bindParam(10, $this->no_fam, PDO::PARAM_INT);

        return $query->execute();
    }

    public function delete() {

        if (isset($this->id)) {
            $db = Base::getConnection();
            $delete_query = "delete from Famille where no_fam = $this->no_fam";
            try {
                $stmt = $db->prepare($delete_query);
                $this->nom_resp = null;
                $this->pre_resp = null;
                $this->type_resp = null;
                $this->adr_resp = null;
                $this->tel_resp = null;
                $this->noalloc_caf_resp = null;
                $this->qf_resp = null;
                $this->en_ville = null;
                $this->bons_vac = null;
                $this->no_fam = null;
                return $stmt->execute();
            } catch (BaseException $e) {
                throw new Exception("méthode delete() non implantée");
            }
        }
    }

    public function insert() {

        try {
            $db = Base::getConnection();
            $insert_query = "INSERT INTO Famille (nom_resp,pre_resp,type_resp ,adr_resp,tel_resp,noalloc_caf_resp,qf_resp,en_ville,bons_vac) "
                    . "VALUES (:nom_resp , :pre_resp ,"
                    . ":type_resp ,:adr_resp ,:tel_resp ,:noalloc_caf_resp ,:qf_resp ,"
                    . ":en_ville ,:bons_vac)";
            $query = $db->prepare($insert_query);
            $query->bindParam(":nom_resp", $this->nom_resp, PDO::PARAM_STR);
            $query->bindParam(":pre_resp", $this->pre_resp, PDO::PARAM_STR);
            $query->bindParam(":type_resp", $this->type_resp, PDO::PARAM_STR);
            $query->bindParam(":adr_resp", $this->adr_resp, PDO::PARAM_STR);
            $query->bindParam(":tel_resp", $this->tel_resp, PDO::PARAM_INT);
            $query->bindParam(":noalloc_caf_resp", $this->noalloc_caf_resp, PDO::PARAM_INT);
            $query->bindParam(":qf_resp", $this->qf_resp, PDO::PARAM_INT);
            $query->bindParam(":en_ville", $this->en_ville, PDO::PARAM_STR);
            $query->bindParam(":bons_vac", $this->bons_vac, PDO::PARAM_STR);
            $a = $query->execute();
            $this->id = $db->LastInsertId();
        } catch (PDOException $e) {
            echo "méthode insert() non implantée";
            return null;
        }
        return $a;
    }

    public static function findById($id) {
        try {
            $c = Base::getConnection();
            $query = $c->prepare("SELECT * FROM Famille WHERE no_fam = :no_fam ");
            $query->bindParam(":no_fam", $id, PDO::PARAM_INT);
            $dbres = $query->execute();
            $d = $query->fetch(PDO::FETCH_BOTH);
            $s = new Famille();
            $s->no_fam = $d[0];
            $s->nom_resp = $d[1];
            $s->pre_resp = $d[2];
            $s->type_resp = $d[3];
            $s->adr_resp = $d[4];
            $s->tel_resp = $d[5];
            $s->noalloc_caf_resp = $d[6];
            $s->qf_resp = $d[7];
            $s->en_ville = $d[8];
            $s->bons_vac = $d[9];
            return $s;
        } catch (PDOException $e) {
            echo("méthode insert() non implantée");
            return null;
        }
    }

    public static function findAll() {

        try {
            $c = Base::getConnection();
            $query = $c->prepare("select * from Famille");
            $query->execute();
            $res = array();
            while ($d = $query->fetch(PDO::FETCH_BOTH)) {
                $s = new Famille();
                $s->no_fam = $d[0];
                $s->nom_resp = $d[1];
                $s->pre_resp = $d[2];
                $s->type_resp = $d[3];
                $s->adr_resp = $d[4];
                $s->tel_resp = $d[5];
                $s->noalloc_caf_resp = $d[6];
                $s->qf_resp = $d[7];
                $s->en_ville = $d[8];
                $s->bons_vac = $d[9];
                $res[] = $s;
            }
            return $res;
        } catch (PDOException $e) {
            echo 'fail connection';
            return null;
        }
    }

    public static function findByNom($nom) {
        try {
            $c = Base::getConnection();
            $query = $c->prepare("SELECT * FROM Famille WHERE nom_resp = :nom_resp ");
            $query->bindParam(":nom_resp", $nom, PDO::PARAM_STR);
            $query->execute();
            $res = array();
            while ($d = $query->fetch(PDO::FETCH_BOTH)) {
                $s = new Famille();
                $s->no_fam = $d[0];
                $s->nom_resp = $d[1];
                $s->pre_resp = $d[2];
                $s->type_resp = $d[3];
                $s->adr_resp = $d[4];
                $s->tel_resp = $d[5];
                $s->noalloc_caf_resp = $d[6];
                $s->qf_resp = $d[7];
                $s->en_ville = $d[8];
                $s->bons_vac = $d[9];
                $res[] = $s;
            }
            return $res;
        } catch (PDOException $e) {
            echo 'fail connection';
            return null;
        }
    }

}

?>