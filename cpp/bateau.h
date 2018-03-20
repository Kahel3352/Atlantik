#ifndef BATEAU_H
#define BATEAU_H
#include <string>
using namespace std;

/**
 * @brief Représente un bateau de la base de données
 */
class Bateau
{
protected:
    /**
     * @brief Id du bateau dans la base de données
     */
    string idBat;

    /**
     * @brief Nom du bateau
     */
    string nomBat;

    /**
     * @brief Longueur du bateau
     */
    float longueurBat;

    /**
     * @brief Largeur du bateau
     */
    float largeurBat;
public:
    /**
     * @brief Constructeur par défaut de Bateau
     */
    Bateau();

    /**
     * @brief Constructeur de Bateau
     * @param Id du bateau dans la base de données
     * @param Nom du bateau
     * @param Longueur du bateau
     * @param Largeur du bateau
     */
    Bateau(string unId, string unNom, float uneLongueur, float uneLargeur);

};

#endif // BATEAU_H
