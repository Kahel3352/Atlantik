#include "bateau.h"


Bateau::Bateau()
{

}

Bateau::Bateau(string unId, string unNom, float uneLongueur, float uneLargeur)
{
    cout<<"Bateau::Bateau(string unId, string unNom, float uneLongueur, float uneLargeur)"<<endl;
    this->idBat = unId;
    this->nomBat = unNom;
    this->longueurBat = uneLongueur;
    this->largeurBat = uneLargeur;
}


