#ifndef BATEAUVOYAGEUR_H
#define BATEAUVOYAGEUR_H
#include <vector>
#include "bateau.h"
#include "equipement.h"

using namespace std;

/**
 * @brief Représente un BateauVoyageur dans la base de données
 */
class BateauVoyageur : public Bateau
{
private:
    /**
     * @brief Vitesse du BateauVoyageur
     */
    float vitesseBatVoy;

    /**
     * @brief Adresse de l'image du BateauVoyageur
     */
    string imageBatVoy;

    /**
     * @brief Collection des équipements du BateauVoyageur
     */
    vector<Equipement> lesEquipements;
public:
    /**
     * @brief Constructeur de BateauVoyageur
     * @param unId
     * @param Id du BateauVoyageur dans la base de données
     * @param Nom du BateauVoyageur
     * @param Longueur du BateauVoyageur
     * @param Largeur du BateauVoyageur
     * @param Vitesse du BateauVoyageur
     * @param Adresse de l'images du BateauVoyageur
     * @param Les équipements du BateauVoyageur
     */
    BateauVoyageur(string unId, string unNom, float uneLongueur, float uneLargeur,
                   float uneVitesse, string uneImage,
                   vector<Equipement> uneCollEquip);

    /**
     * @brief Converti le BateauVoyageur en une chaine de caractère (html)
     * @return Une chaine de caractère (html)
     */
    string versChaine();

    /**
     * @brief Retourne l'adresse de l'image
     * @return L'adresse de l'image
     */
    string getImage();
};

#endif // BATEAUVOYAGEUR_H
