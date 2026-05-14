1. SELECT 
    v.date_vente AS `Date de Vente`,
    p.nom_produit AS `Nom du Produit`,
    vi.nom_ville AS `Ville du Magasin`,
    v.quantite_vendue AS `Quantité`
FROM 
    ventes v
JOIN 
    produits p ON v.id_produit = p.id_produit
JOIN 
    magasins m ON v.id_magasin = m.id_magasin
JOIN 
    villes vi ON m.id_ville = vi.id_ville;


2 . SELECT 
    p.nom_produit AS `Nom Produit`,
    p.prix AS `Prix`,
    v.quantite_vendue AS `Quantité`,
    vi.nom_ville AS `Ville`
FROM 
    ventes v
JOIN 
    produits p ON v.id_produit = p.id_produit
JOIN 
    magasins m ON v.id_magasin = m.id_magasin
JOIN 
    villes vi ON m.id_ville = vi.id_ville
WHERE 
    vi.nom_ville IN ('Goma', 'Bukavu');

3. SELECT 
    p.nom_produit AS `Nom Produit`,
    SUM(v.quantite_vendue) AS `Total Quantités Vendues`
FROM 
    ventes v
JOIN 
    produits p ON v.id_produit = p.id_produit
JOIN 
    categories c ON p.id_categorie = c.id_categorie
JOIN 
    magasins m ON v.id_magasin = m.id_magasin
JOIN 
    villes vi ON m.id_ville = vi.id_ville
WHERE 
    vi.nom_ville = 'Lubumbashi'
    AND c.nom_categorie = 'Running'
GROUP BY 
    p.id_produit, 
    p.nom_produit;

4. SELECT 
    m.nom_magasin AS `Nom du Magasin`,
    vi.nom_ville AS `Ville`,
    SUM(v.quantite_vendue * p.prix) AS `Chiffre d'Affaires Total`
FROM 
    ventes v
JOIN 
    produits p ON v.id_produit = p.id_produit
JOIN 
    magasins m ON v.id_magasin = m.id_magasin
JOIN 
    villes vi ON m.id_ville = vi.id_ville
GROUP BY 
    m.id_magasin,
    m.nom_magasin,
    vi.nom_ville
ORDER BY 
    `Chiffre d'Affaires Total` DESC
LIMIT 1;

5. SELECT DISTINCT
    vi.nom_ville AS `Ville`,
    c.nom_categorie AS `Catégorie Vendue`
FROM 
    ventes v
JOIN 
    produits p ON v.id_produit = p.id_produit
JOIN 
    categories c ON p.id_categorie = c.id_categorie
JOIN 
    magasins m ON v.id_magasin = m.id_magasin
JOIN 
    villes vi ON m.id_ville = vi.id_ville
ORDER BY 
    vi.nom_ville, 
    c.nom_categorie;

