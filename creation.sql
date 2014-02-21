

# -----------------------------------------------------------------------------
#       TABLE : FACTURE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS FACTURE
 (
   NO_FACT INT NOT NULL auto_increment ,
   DATE_FACT CHAR(32) NULL  ,
   MONTANT_FACT CHAR(32) NULL  ,
   MODE_PAIEMENT CHAR(32) NULL  
   , PRIMARY KEY (NO_FACT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : FAMILLE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS FAMILLE
 (
   NO_FAM INTEGER NOT NULL auto_increment ,
   NOM_RESP CHAR(32) NULL  ,
   PRE_RESP CHAR(32) NULL  ,
   TYPE_RESP CHAR(32) NULL  ,
   ADR_RESP CHAR(32) NULL  ,
   TEL_RESP CHAR(32) NULL  ,
   NOALLOC_CAF_RESP CHAR(32) NULL  ,
   QF_RESP REAL(5,2) NULL  ,
   EN_VILLE CHAR(32) NULL  ,
   BONS_VAC CHAR(32) NULL  
   , PRIMARY KEY (NO_FAM) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : INSCRIPTION
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS INSCRIPTION
 (
   NO_INSCRIPT INT NOT NULL  ,
   NO_FACT INT NOT NULL  ,
   ARRET_BUS INTEGER NULL  ,
   NO_UNITE INTEGER NOT NULL  ,
   NO_SITE CHAR(32) NOT NULL  ,
   NO_ENF INTEGER NOT NULL  ,
   DEDUC_JOUR CHAR(32) NULL  ,
   NOM_ACCOMPAGNATEUR_ENF CHAR(32) NULL  ,
   PRE_ACCOMPAGNATEUR_ENF CHAR(32) NULL  ,
   MONTANT_INSCR CHAR(32) NULL  ,
   LIEU_INSCR CHAR(32) NULL  
   , PRIMARY KEY (NO_INSCRIPT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : GROUPE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS GROUPE
 (
   NO_SITE CHAR(32) NOT NULL  ,
   NO_UNITE INTEGER NOT NULL  ,
   NO_GROUPE INTEGER NOT NULL  ,
   NO_UNITE_COMPOSE INTEGER NOT NULL  ,
   NO_SITE_COMPOSE CHAR(32) NOT NULL  ,
   NOM_GROUPE CHAR(32) NULL  
   , PRIMARY KEY (NO_SITE,NO_UNITE,NO_GROUPE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : PTACCUEIL
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PTACCUEIL
 (
   ARRET_BUS INTEGER NOT NULL  ,
   NO_SITE CHAR(32) NOT NULL  
   , PRIMARY KEY (ARRET_BUS) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : TARIF
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS TARIF
 (
   EN_VILLE BOOL NOT NULL  ,
   CODE_QF INTEGER NOT NULL  ,
   BONS_VAC BOOL NOT NULL  ,
   ALLOC_CAF INTEGER NOT NULL  ,
   TARIF_JOUR REAL(5,2) NULL  
   , PRIMARY KEY (EN_VILLE,CODE_QF,BONS_VAC,ALLOC_CAF) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : UNITE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS UNITE
 (
   NO_UNITE INTEGER NOT NULL  ,
   NO_SITE CHAR(32) NOT NULL  ,
   NO_SITE_POSSEDE CHAR(32) NOT NULL  ,
   NOM_UNITE CHAR(32) NULL  
   , PRIMARY KEY (NO_UNITE,NO_SITE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : ANIMATEUR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ANIMATEUR
 (
   NO_ANIM INTEGER NOT NULL  ,
   NOM_ANIM CHAR(32) NULL  ,
   PRE_ANIM CHAR(32) NULL  
   , PRIMARY KEY (NO_ANIM) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : ENFANT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ENFANT
 (
   NO_ENF INTEGER NOT NULL  ,
   NO_FAM INTEGER NOT NULL  ,
   NOM_ENF CHAR(32) NULL  ,
   PRENOM_ENF CHAR(32) NULL  ,
   ADR_ENF CHAR(32) NULL  ,
   SEXE_ENF VARCHAR(1) NULL  ,
   DATN_ENF DATE NULL  ,
   LIEU_NAISS_ENF CHAR(32) NULL  
   , PRIMARY KEY (NO_ENF) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : JOUR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS JOUR
 (
   SEM_SEJ INTEGER NOT NULL  ,
   NO_JOUR INTEGER NOT NULL  ,
   SEM_SEJ_DEPEND INTEGER NOT NULL  
   , PRIMARY KEY (SEM_SEJ,NO_JOUR) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : PERIODE_ACTIVITE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PERIODE_ACTIVITE
 (
   JOUR CHAR(32) NOT NULL  
   , PRIMARY KEY (JOUR) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : SEMAINE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS SEMAINE
 (
   SEM_SEJ INTEGER NOT NULL  ,
   DU_SEM DATE NULL  ,
   AU_SEM DATE NULL  ,
   NBJ_SEM INTEGER NULL  
   , PRIMARY KEY (SEM_SEJ) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : ACTIVITE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ACTIVITE
 (
   CODACTIV CHAR(32) NOT NULL  ,
   NO_UNITE INTEGER NOT NULL  ,
   NO_SITE CHAR(32) NOT NULL  ,
   LIBACTIV CHAR(32) NULL  
   , PRIMARY KEY (CODACTIV) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : REMBOURSEMENT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS REMBOURSEMENT
 (
   NO_REMBOURS CHAR(32) NOT NULL  ,
   NO_FAM INTEGER NOT NULL  ,
   DATE_REMBOURS CHAR(32) NULL  ,
   MONTANT_REMBOURS CHAR(32) NULL  
   , PRIMARY KEY (NO_REMBOURS) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : REGLEMENT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS REGLEMENT
 (
   NO_REGLEMENT CHAR(32) NOT NULL  ,
   NO_FACT INT NOT NULL  ,
   DATE_REGLEMENT CHAR(32) NULL  ,
   MONTANT_REGLEMENT CHAR(32) NULL  ,
   DOM_BANCAIRE CHAR(32) NULL  ,
   TITULAIRE_COMPTE CHAR(32) NULL  
   , PRIMARY KEY (NO_REGLEMENT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : SITE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS SITE
 (
   NO_SITE CHAR(32) NOT NULL  ,
   NOM_SITE CHAR(32) NULL  
   , PRIMARY KEY (NO_SITE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : POUR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS POUR
 (
   NO_INSCRIPT CHAR(32) NOT NULL  ,
   SEM_SEJ INTEGER NOT NULL  
   , PRIMARY KEY (NO_INSCRIPT,SEM_SEJ) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : OFFRE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS OFFRE
 (
   SEM_SEJ INTEGER NOT NULL  ,
   NO_UNITE INTEGER NOT NULL  ,
   NO_SITE CHAR(32) NOT NULL  ,
   NB_PLACES_OFFERTES CHAR(32) NULL  ,
   NB_PLACES_OCCUPEES CHAR(32) NULL  
   , PRIMARY KEY (SEM_SEJ,NO_UNITE,NO_SITE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : COMPETENT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS COMPETENT
 (
   CODACTIV CHAR(32) NOT NULL  ,
   NO_ANIM INTEGER NOT NULL  
   , PRIMARY KEY (CODACTIV,NO_ANIM) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : A_LIEU
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS A_LIEU
 (
   JOUR CHAR(32) NOT NULL  ,
   CODACTIV CHAR(32) NOT NULL  ,
   DEMI_JOURNEE CHAR(32) NULL  
   , PRIMARY KEY (JOUR,CODACTIV) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : ABSENT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ABSENT
 (
   NO_INSCRIPT CHAR(32) NOT NULL  ,
   SEM_SEJ INTEGER NOT NULL  ,
   NO_JOUR INTEGER NOT NULL  ,
   ABS_SEJ BOOL NULL  ,
   ABS_RAM BOOL NULL  
   , PRIMARY KEY (NO_INSCRIPT,SEM_SEJ,NO_JOUR) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : ANIME
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ANIME
 (
   CODACTIV CHAR(32) NOT NULL  ,
   NO_ANIM INTEGER NOT NULL  ,
   SEM_SEJ INTEGER NOT NULL  ,
   EST_RESPONSABLE CHAR(32) NULL  
   , PRIMARY KEY (CODACTIV,NO_ANIM,SEM_SEJ) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : PRATIQUE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PRATIQUE
 (
   CODACTIV CHAR(32) NOT NULL  ,
   SEM_SEJ INTEGER NOT NULL  ,
   NO_INSCRIPT CHAR(32) NOT NULL  
   , PRIMARY KEY (CODACTIV,SEM_SEJ,NO_INSCRIPT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : ENCADRE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ENCADRE
 (
   NO_SITE CHAR(32) NOT NULL  ,
   NO_UNITE INTEGER NOT NULL  ,
   NO_GROUPE INTEGER NOT NULL  ,
   SEM_SEJ INTEGER NOT NULL  ,
   NO_ANIM INTEGER NOT NULL  
   , PRIMARY KEY (NO_SITE,NO_UNITE,NO_GROUPE,SEM_SEJ,NO_ANIM) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : PLACE_DANS
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PLACE_DANS
 (
   NO_INSCRIPT CHAR(32) NOT NULL  ,
   NO_SITE CHAR(32) NOT NULL  ,
   NO_UNITE INTEGER NOT NULL  ,
   NO_GROUPE INTEGER NOT NULL  ,
   SEM_SEJ INTEGER NOT NULL  
   , PRIMARY KEY (NO_INSCRIPT,NO_SITE,NO_UNITE,NO_GROUPE,SEM_SEJ) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : S_OCCUPE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS S_OCCUPE
 (
   ARRET_BUS INTEGER NOT NULL  ,
   SEM_SEJ INTEGER NOT NULL  ,
   NO_ANIM INTEGER NOT NULL  
   , PRIMARY KEY (ARRET_BUS,SEM_SEJ,NO_ANIM) 
 ) 
 comment = "";


# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------


ALTER TABLE INSCRIPTION 
  ADD FOREIGN KEY FK_INSCRIPTION_FACTURE (NO_FACT)
      REFERENCES FACTURE (NO_FACT) ;


ALTER TABLE INSCRIPTION 
  ADD FOREIGN KEY FK_INSCRIPTION_PTACCUEIL (ARRET_BUS)
      REFERENCES PTACCUEIL (ARRET_BUS) ;


ALTER TABLE INSCRIPTION 
  ADD FOREIGN KEY FK_INSCRIPTION_UNITE (NO_UNITE,NO_SITE)
      REFERENCES UNITE (NO_UNITE,NO_SITE) ;


ALTER TABLE INSCRIPTION 
  ADD FOREIGN KEY FK_INSCRIPTION_ENFANT (NO_ENF)
      REFERENCES ENFANT (NO_ENF) ;


ALTER TABLE GROUPE 
  ADD FOREIGN KEY FK_GROUPE_UNITE (NO_UNITE_COMPOSE,NO_SITE_COMPOSE)
      REFERENCES UNITE (NO_UNITE,NO_SITE) ;


ALTER TABLE PTACCUEIL 
  ADD FOREIGN KEY FK_PTACCUEIL_SITE (NO_SITE)
      REFERENCES SITE (NO_SITE) ;


ALTER TABLE UNITE 
  ADD FOREIGN KEY FK_UNITE_SITE (NO_SITE_POSSEDE)
      REFERENCES SITE (NO_SITE) ;


ALTER TABLE ENFANT 
  ADD FOREIGN KEY FK_ENFANT_FAMILLE (NO_FAM)
      REFERENCES FAMILLE (NO_FAM) ;


ALTER TABLE JOUR 
  ADD FOREIGN KEY FK_JOUR_SEMAINE (SEM_SEJ_DEPEND)
      REFERENCES SEMAINE (SEM_SEJ) ;


ALTER TABLE ACTIVITE 
  ADD FOREIGN KEY FK_ACTIVITE_UNITE (NO_UNITE,NO_SITE)
      REFERENCES UNITE (NO_UNITE,NO_SITE) ;


ALTER TABLE REMBOURSEMENT 
  ADD FOREIGN KEY FK_REMBOURSEMENT_FAMILLE (NO_FAM)
      REFERENCES FAMILLE (NO_FAM) ;


ALTER TABLE REGLEMENT 
  ADD FOREIGN KEY FK_REGLEMENT_FACTURE (NO_FACT)
      REFERENCES FACTURE (NO_FACT) ;


ALTER TABLE POUR 
  ADD FOREIGN KEY FK_POUR_INSCRIPTION (NO_INSCRIPT)
      REFERENCES INSCRIPTION (NO_INSCRIPT) ;


ALTER TABLE POUR 
  ADD FOREIGN KEY FK_POUR_SEMAINE (SEM_SEJ)
      REFERENCES SEMAINE (SEM_SEJ) ;


ALTER TABLE OFFRE 
  ADD FOREIGN KEY FK_OFFRE_SEMAINE (SEM_SEJ)
      REFERENCES SEMAINE (SEM_SEJ) ;


ALTER TABLE OFFRE 
  ADD FOREIGN KEY FK_OFFRE_UNITE (NO_UNITE,NO_SITE)
      REFERENCES UNITE (NO_UNITE,NO_SITE) ;


ALTER TABLE COMPETENT 
  ADD FOREIGN KEY FK_COMPETENT_ACTIVITE (CODACTIV)
      REFERENCES ACTIVITE (CODACTIV) ;


ALTER TABLE COMPETENT 
  ADD FOREIGN KEY FK_COMPETENT_ANIMATEUR (NO_ANIM)
      REFERENCES ANIMATEUR (NO_ANIM) ;


ALTER TABLE A_LIEU 
  ADD FOREIGN KEY FK_A_LIEU_PERIODE_ACTIVITE (JOUR)
      REFERENCES PERIODE_ACTIVITE (JOUR) ;


ALTER TABLE A_LIEU 
  ADD FOREIGN KEY FK_A_LIEU_ACTIVITE (CODACTIV)
      REFERENCES ACTIVITE (CODACTIV) ;


ALTER TABLE ABSENT 
  ADD FOREIGN KEY FK_ABSENT_INSCRIPTION (NO_INSCRIPT)
      REFERENCES INSCRIPTION (NO_INSCRIPT) ;


ALTER TABLE ABSENT 
  ADD FOREIGN KEY FK_ABSENT_JOUR (SEM_SEJ,NO_JOUR)
      REFERENCES JOUR (SEM_SEJ,NO_JOUR) ;


ALTER TABLE ANIME 
  ADD FOREIGN KEY FK_ANIME_ACTIVITE (CODACTIV)
      REFERENCES ACTIVITE (CODACTIV) ;


ALTER TABLE ANIME 
  ADD FOREIGN KEY FK_ANIME_ANIMATEUR (NO_ANIM)
      REFERENCES ANIMATEUR (NO_ANIM) ;


ALTER TABLE ANIME 
  ADD FOREIGN KEY FK_ANIME_SEMAINE (SEM_SEJ)
      REFERENCES SEMAINE (SEM_SEJ) ;


ALTER TABLE PRATIQUE 
  ADD FOREIGN KEY FK_PRATIQUE_ACTIVITE (CODACTIV)
      REFERENCES ACTIVITE (CODACTIV) ;


ALTER TABLE PRATIQUE 
  ADD FOREIGN KEY FK_PRATIQUE_SEMAINE (SEM_SEJ)
      REFERENCES SEMAINE (SEM_SEJ) ;


ALTER TABLE PRATIQUE 
  ADD FOREIGN KEY FK_PRATIQUE_INSCRIPTION (NO_INSCRIPT)
      REFERENCES INSCRIPTION (NO_INSCRIPT) ;


ALTER TABLE ENCADRE 
  ADD FOREIGN KEY FK_ENCADRE_GROUPE (NO_SITE,NO_UNITE,NO_GROUPE)
      REFERENCES GROUPE (NO_SITE,NO_UNITE,NO_GROUPE) ;


ALTER TABLE ENCADRE 
  ADD FOREIGN KEY FK_ENCADRE_SEMAINE (SEM_SEJ)
      REFERENCES SEMAINE (SEM_SEJ) ;


ALTER TABLE ENCADRE 
  ADD FOREIGN KEY FK_ENCADRE_ANIMATEUR (NO_ANIM)
      REFERENCES ANIMATEUR (NO_ANIM) ;


ALTER TABLE PLACE_DANS 
  ADD FOREIGN KEY FK_PLACE_DANS_INSCRIPTION (NO_INSCRIPT)
      REFERENCES INSCRIPTION (NO_INSCRIPT) ;


ALTER TABLE PLACE_DANS 
  ADD FOREIGN KEY FK_PLACE_DANS_GROUPE (NO_SITE,NO_UNITE,NO_GROUPE)
      REFERENCES GROUPE (NO_SITE,NO_UNITE,NO_GROUPE) ;


ALTER TABLE PLACE_DANS 
  ADD FOREIGN KEY FK_PLACE_DANS_SEMAINE (SEM_SEJ)
      REFERENCES SEMAINE (SEM_SEJ) ;


ALTER TABLE S_OCCUPE 
  ADD FOREIGN KEY FK_S_OCCUPE_PTACCUEIL (ARRET_BUS)
      REFERENCES PTACCUEIL (ARRET_BUS) ;


ALTER TABLE S_OCCUPE 
  ADD FOREIGN KEY FK_S_OCCUPE_SEMAINE (SEM_SEJ)
      REFERENCES SEMAINE (SEM_SEJ) ;


ALTER TABLE S_OCCUPE 
  ADD FOREIGN KEY FK_S_OCCUPE_ANIMATEUR (NO_ANIM)
      REFERENCES ANIMATEUR (NO_ANIM) ;

