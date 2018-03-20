#include "bateauvoyageur.h"
#include <sstream>
#include <iostream>

BateauVoyageur::BateauVoyageur(string unId, string unNom, float uneLongueur, float uneLargeur, float uneVitesse, string uneImage, vector<Equipement> uneCollEquip)
{
    cout<<"BateauVoyageur::BateauVoyageur(string unId, string unNom, float uneLongueur, float uneLargeur, float uneVitesse, string uneImage, vector<Equipement> uneCollEquip)"<<endl;

    cout<<"size "<<uneCollEquip.size()<<endl;
    this->idBat = unId;
    this->nomBat = unNom;
    this->longueurBat = uneLongueur;
    this->largeurBat = uneLargeur;
    this->vitesseBatVoy = uneVitesse;
    this->imageBatVoy = uneImage;
    this->lesEquipements = uneCollEquip;
}

string BateauVoyageur::versChaine()
{
    cout<<"string BateauVoyageur::versChaine()"<<endl;

    string SautLigne = "\n";
    string chaine = "";
    chaine += "Nom du bateau: "+this->nomBat+SautLigne;

    //conversion float->string
    stringstream s;
    s << this->longueurBat;
    string stringLongueur(s.str());

    chaine += "<p>Longueur: "+stringLongueur+" mètres</p>";

    s.str("");
    s << this->largeurBat;
    string stringLargeur(s.str());

    chaine += "<p>Largeur: "+stringLargeur+" mètres</p>";

    s.str("");
    s << this->vitesseBatVoy;
    string stringVitesse(s.str());

    chaine+= "<p>Vitesse: "+stringVitesse+" noeuds</p>";

    chaine+="<p>Liste des équipements du bateau:</p>";
    int nbEquipements = this->lesEquipements.size();
    for(int i = 0; i<nbEquipements;i++)
        chaine+="<p>-"+lesEquipements[i].versChaine()+"</p>";

    return chaine;

}

string BateauVoyageur::getImage()
{
    cout<<"string BateauVoyageur::getImage()"<<endl;
    return this->imageBatVoy;
}
