#ifndef PASSERELLE_H
#define PASSERELLE_H
#include <vector>
#include "equipement.h"
#include "bateauvoyageur.h"
#include "iostream"
#include <QtSql>

using namespace std;

/**
 * @brief Fait le lien entre le programme est la base de données
 */
class Passerelle
{
public:
    /**
     * @brief Base de données
     */
    static QSqlDatabase db;

    /**
     * @brief Initialise la base de données
     */
    static void setDatabase();

    /**
     * @brief Retourne la liste des équippements pour un bateau
     * @param Id du bateau
     * @return Collection d'Equipement
     */
    static vector<Equipement> chargerLesEquipements(int unIdBateau);

    /**
     * @brief Retourne la liste des bateaux voyageurs de la base de données
     * @return Collection de BateauVoyageur
     */
    static vector<BateauVoyageur> chargerLesBateauxVoyageurs();
};

#endif // PASSERELLE_H
