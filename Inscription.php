<?php

class Inscription
{
	private $no_fact,$arret_bus,$no_unite,$no_site,$no_enf,$no_inscript,$deduc_jour,$nom_accompagnateur_enf,$pre_accompagnateur_enf,$montant_inscr,$lieu_inscr;
	public function __get($attr_name) {
    	if (property_exists( __CLASS__, $attr_name)) { 
     		return $this->$attr_name;
    	} 
   		 $emess = __CLASS__ . ": unknown member $attr_name (getAttr)";
    	throw new Exception($emess, 45);
 	}

  

    public function __set($attr_name, $attr_val) {
    
    	$this->$attr_name = $attr_val;    
	}
}