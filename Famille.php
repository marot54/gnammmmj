<?php

class Famille
{
	private $no_fam, $nom_resp, $pre_resp, $type_resp, $adr_resp, $tel_resp,
	$no_alloc_caf_resp, $qf_resp, $en_ville, $bons_vac;


	public function __construct()
	{

	}






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


  	public function insert()
  	{
  		

   
   		try
   		{
        	$c = Base::getConnection();
    
        	$stmt = $c->prepare('insert into famille( nom_resp, pre_resp, type_resp, adr_resp, tel_resp,
	no_alloc_caf_resp, qf_resp, en_ville, bons_vac) values ( :nom_resp, :pre_resp, :type_resp, :adr_resp, :tel_resp,
	:no_alloc_caf_resp, :qf_resp, :en_ville, :bons_vac)');
        
        


        	$stmt->execute(
        		array(
        			
        			'nom_resp'=>$this->nom_resp, 
        			'pre_resp'=>$this->pre_resp, 
        			'type_resp'=>$this->type_resp, 
        			'adr_resp'=>$this->adr_resp, 
        			'tel_resp'=>$this->tel_resp, 
        			'no_alloc_caf_resp'=>$this->no_alloc_caf_resp, 
        			'qf_resp'=>$this->qf_resp, 
        			'en_ville'=>$this->en_ville, 
        			'bons_vac'=>$this->bons_vac



        			));

        
        	$this->no_fam = $c->lastInsertId();





   }
   		catch(PDOException $e)
   		{
        echo "Erreur";
        throw new BaseException($e->getMessage());
   		}
    

   
  		}
  	


}  