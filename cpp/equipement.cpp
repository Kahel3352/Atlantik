#include "equipement.h"
#include <iostream>

Equipement::Equipement(string unId, string unLib)
{
    cout<<"Equipement::Equipement(string unId, string unLib)"<<endl;
    idEquip = unId;
    libEquip = unLib;
}

string Equipement::versChaine()
{
    cout<<"string Equipement::versChaine()"<<endl;
    return this->libEquip;
}
