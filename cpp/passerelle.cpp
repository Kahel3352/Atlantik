#include "passerelle.h"

QSqlDatabase Passerelle::db;
void Passerelle::setDatabase()
{
    cout<<"void Passerelle::setDatabase()"<<endl;
    db = QSqlDatabase::addDatabase("QMYSQL3");
    db.setHostName("localhost");
    db.setDatabaseName("atlantik");
    db.setUserName("root");
    db.setPassword("ini01");
}

vector<Equipement> Passerelle::chargerLesEquipements(int unIdBateau)
{
    cout<<"vector<Equipement> Passerelle::chargerLesEquipements(int unIdBateau)"<<endl;
            vector<Equipement> vectEquipement;
    if(!db.open())
        cout<<db.lastError().text().toStdString()<<endl;
    else
    {
        QString txtReq = "select id, lib from Posseder inner join Equipement on idEquip = id where idBat = ?;";
        //cout<<"query: "<<txtReq.toStdString()<<endl;
        QSqlQuery query;
        query.prepare(txtReq);
        query.addBindValue(unIdBateau);

        if(query.exec())
        {
            while(query.next())
            {
                Equipement e(query.value("id").toString().toStdString(), query.value("lib").toString().toStdString());
                vectEquipement.push_back(e);
            }
        }
        else
            cout<<query.lastError().text().toStdString()<<endl;


    }

    db.close();
    return vectEquipement;
}

vector<BateauVoyageur> Passerelle::chargerLesBateauxVoyageurs()
{
    cout<<"vector<BateauVoyageur> Passerelle::chargerLesBateauxVoyageurs()"<<endl;
            vector<BateauVoyageur> vectBateau;
    if(!db.open())
        cout<<db.lastError().text().toStdString()<<endl;
    else
    {
        QString txtReq = "SELECT * FROM Bateau WHERE type = 'v';";
        QSqlQuery query;

        if(query.exec(txtReq))
        {
            while(query.next())
            {
                BateauVoyageur b(query.value("id").toString().toStdString(), query.value("libelle").toString().toStdString(), query.value("longueur").toFloat(), query.value("largeur").toFloat(), query.value("vitesse").toFloat(), query.value("image").toString().toStdString(), Passerelle::chargerLesEquipements(query.value("id").toInt()));
                vectBateau.push_back(b);
            }
        }


    }

    db.close();
    return vectBateau;
}
