CREATE KEYSPACE elections WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };


CREATE TABLE administre (
    Nom_A text PRIMARY KEY,
    Prenom_A text,
    Adresse text,
    NIN varint
);


CREATE TABLE Candidat (
    Nom_P text ,
    Prenom_P text,
    Parti_politique text,
    nbr_vote int ,
  PRIMARY KEY (parti_politique,nbr_vote),
) WITH CLUSTERING ORDER BY (nbr_vote desc);



CREATE TABLE Vote (
Nom_A text,
Nom_P  text,
PRIMARY KEY(Nom_A, Nom_P)
);



INSERT INTO Candidat (Nom_P , Prenom_P , Parti_politique , nbr_vote )
VALUES ('toto1' , 'tôt', 'A' , 2 );
INSERT INTO Candidat (Nom_P , Prenom_P , Parti_Politique , nbr_vote )
VALUES ('toto2', 'tôt2', 'B' , 1 );
INSERT INTO Candidat (Nom_P , Prenom_P , Parti_Politique , nbr_vote )
VALUES ('toto3' , 'tôt3', 'C' , 10 );
INSERT INTO Candidat (Nom_P , Prenom_P , Parti_Politique , nbr_vote )
VALUES ('toto4' , 'tôt4', 'A' , 5 );




Select from candidat where parti_politique= 'C';

CREATE INDEX ipp on Candidat (parti_politique);
CREATE INDEX nbr on Candidat (nbr_vote);
CREATE INDEX np on Candidat (prenom_P)

Select * from Candidat order by nbr_vote DESC ;
Select sum(nbr_vote) from candidat group by parti_politique;
SElect  parti_politique, sum(nbr_vote) from candidat group by parti_politique;
Select * from candidat where nbr_vote=max(nbr_vote);
select parti_politique,sum(nbr_vote) from candidat;



Q1 Select  parti_politique, sum(nbr_vote) from candidat  group by parti_politique ;
-- Query qui ne fonctionne pas :Select  parti_politique, sum(nbr_vote) from candidat  group by parti_politique order by sum(nbr_vote) DESC LIMIT 1;--


Q2 Select  Nom_P,MAX(nbr_vote)  from candidat;
-- Query qui ne fonctionne pas : Select Nom_P, nbr_vote from candidat order by nbr_votre DESC LIMIT 1;--

Q3 
SELECT MAX (nbr_vote),Nom_P,Prenom_P,Parti_politique FROM candidat;
SELECT  parti_politique, sum(nbr_vote) FROM candidat GROUP BY parti_politique ;
-- Oui--

-- Exercice 2

CREATE TABLE gagnant_Candidat_commune (
    Nom_C text ,
    Prenom_C text,
    Parti_politique text,
    nbr_vote int ,
    commune text,
  PRIMARY KEY (parti_politique,nbr_vote,Nom_C),
) WITH CLUSTERING ORDER BY (nbr_vote desc);



INSERT INTO gagnant_Candidat_commune (Nom_C , Prenom_C , Parti_politique , nbr_vote, commune )
VALUES ('titi1' , 'tôt', 'A' , 2,'tr' );
INSERT INTO gagnant_Candidat_commune (Nom_C , Prenom_C , Parti_Politique , nbr_vote, commune )
VALUES ('titi2', 'tôt2', 'B' , 1, 'ty' );
INSERT INTO gagnant_Candidat_commune (Nom_C , Prenom_C , Parti_Politique , nbr_vote, commune )
VALUES ('titi3' , 'tôt3', 'C' , 4, 'lol' );
INSERT INTO gagnant_Candidat_commune (Nom_C , Prenom_C , Parti_Politique , nbr_vote, commune )
VALUES ('titi4' , 'tôt4', 'A' , 5 , 'ftb');

Q1 Select parti_politique ,  sum(nbr_vote) from gagnant_Candidat_commune group by parti_politique order by nbr_vote DESC LIMIT 1;


Q2 Select parti_politique, sum(nbr_vote) from gagnant_Candidat_commune group by parti_politique order by nbr_vote ASC LIMIT 1;
