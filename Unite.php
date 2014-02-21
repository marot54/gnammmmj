<?php

class Unite
{
	private $no_site_possede,$no_unite,$no_site,$non_unite;
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