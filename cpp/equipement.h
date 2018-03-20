#ifndef EQUIPEMENT_H
#define EQUIPEMENT_H
#include <string>
using namespace std;

/**
 * @brief Représente un Equipement dans la base de donées
 */
class Equipement
{
private:
    /**
     * @brief Id de l'Equipement dans la base de données
     */
    string idEquip;

    /**
     * @brief Nom de l'Equipement
     */
    string libEquip;
public:
    /**
     * @brief Constructeur de Equipement
     * @param Id de l'Equipement dans la base de données
     * @param Nom de l'Equipement
     */
    Equipement(string unId, string unLib);

    /**
     * @brief Converti le Equipement en une chaine de caractère (html)
     * @return Une chaine de caractère (html)
     */
    string versChaine();
};

#endif // EQUIPEMENT_H
