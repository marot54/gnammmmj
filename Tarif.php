<?php

class Tarif
{
	private $en_ville,$code_qf,$bons_vac,$alloc_caf,$tarif_jour;
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