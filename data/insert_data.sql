BEGIN;

INSERT INTO category ("label", "image") VALUES 
    ('Patisserie', 'url bon gateau'),
    ('Viennoiserie', 'chocolatine en force'),
    ('Boulangerie', 'du bon pain de chez nous'),
    ('Bonbon', 'oui il y en a toujours');

INSERT INTO product ("title", "description", "price", "image") VALUES 
    ('Baguette', 'Le pain à la française qui est devenu historique. Ingrédients : Farine, Eau, Levure de boulanger, Sel.', 1, 'https://cdn.pixabay.com/photo/2017/03/14/21/03/bread-2144397_960_720.jpg'), 
('Croissant', 'La viennoiserie simple et efficace. Ingrédients : Pâte levée feuilletée, Levure, Beurre.', 0.80, 'https://cdn.pixabay.com/photo/2016/03/27/21/59/bread-1284438_960_720.jpg'), 
('Chocolatine', 'La viennoiserie du Sud Ouest. Ingrédients : Farine, Levure, Beurre, Barre de chocolat, Eau, Sel, Sucre.', 0.95, 'https://cdn.pixabay.com/photo/2019/03/12/07/46/pastry-4050125_960_720.jpg'), 
('Commande spéciale', 'Nous nous plions en quatre pour vous faire vos gâteaux préférés. Ingrédients : Recette secrète', 17.95, 'https://cdn.pixabay.com/photo/2019/07/07/16/09/cake-4322800_960_720.jpg'),
('Baguette tradition', 'La baguette classique, mais encore meilleure. Ingrédients : Farine, Eau, Levure de boulanger, Sel.', 1.10, 'https://cdn.pixabay.com/photo/2017/06/23/23/57/bread-2436370_960_720.jpg');
-- ('Pain’, ‘Le pain pour les gros mangeurs. Ingrédients : Farine, Eau, Levure chimique, Sel.’, 2,’https://cdn.pixabay.com/photo/2019/05/06/14/24/bread-4183225__340.jpg’),
-- (‘Pain sans sel’, ‘Le pain de prédilection pour ceux qui font de l’hypertension. Ingrédients : Farine, Eau, Levure de boulanger.’, 1.90, ‘https://cdn.pixabay.com/photo/2016/07/11/17/31/bread-1510155_960_720.jpg’),
-- (‘Pain complet’, ‘Le pain qui tient bien au ventre. Ingrédients : Farine complète et riche en fibres, Eau, Céréales contenant du gluten, Levure de boulanger, Sel.’, 2.20, ‘https://cdn.pixabay.com/photo/2018/06/19/09/34/bread-3484107_960_720.jpg’),
-- (‘Pain bio’, ‘Le pain qui vous fait sentir en harmonie avec votre environnement. Ingrédients : Farine bio, Eau de source, Levure bio fraîche, Sel marin, Oeuf du poulailler pour la dorure.’, 1.90, ‘https://cdn.pixabay.com/photo/2016/07/11/18/42/bread-1510298_960_720.jpg’),
-- (‘Pain de campagne’, ‘Le pain parfait pour vos tartines de pâté. Ingrédients : Farine à pain artisanale de campagne, Eau, Levure de boulanger, Sucre, Sel.’, 2.40, ‘https://cdn.pixabay.com/photo/2014/07/09/22/09/bread-388647_960_720.jpg’),
-- (‘Chausson aux pommes’, ‘Encore meilleur quand on le déguste en pantoufle assis dans son canapé. Ingrédients : Pâte feuilletée, Pomme du verger, Compote de pomme, Oeuf, Beurre, Sucre.', 1.50, 'https://cdn.pixabay.com/photo/2017/03/10/18/19/pastries-2133439_960_720.jpg');
-- ('Chouquette', 'Petit chou tout mignon parsemé de sucre perlé à manger en une bouchée. Ingrédients : Farine, Oeuf, Eau, Levure, Beurre, Sucre, Sel.’, 0.30, ‘https://cdn.pixabay.com/photo/2018/10/13/17/54/icing-sugar-3744757_960_720.jpg’),
-- (‘Cannelé’, ‘Il ravira les amateurs de rhum et de caramel. Ingrédients : Lait, Oeuf, Gousse de vanille, Rhum, Farine, Beurre, Sucre, Sel.’, 1.70, ‘https://cdn.pixabay.com/photo/2015/02/27/11/42/pastry-652022_960_720.jpg’),
-- (‘Pain aux raisins’, ‘Il est costaud et vous en aurez pour votre argent. Ingrédients : Farine, Sucre, Oeuf, Lait, Levure, Beurre, Sel, Crème pâtissière, Sucre de canne, raisins secs.’, 1.40, ‘https://images.unsplash.com/photo-1614205569927-1f104e088eee?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1388&q=80’),
-- (‘Brioche’, ‘Indispensable pour vos petits déjeuners tardifs. Ingrédients : Farine, Beurre, Oeuf, Sucre, Levure, Lait, Sel’, 1, ‘https://cdn.pixabay.com/photo/2015/01/10/16/01/galette-des-rois-595438_960_720.jpg’),
-- (‘Paris-Brest’, ‘La fameuse roue de vélo mangeable. Ingrédients : Farine, Oeuf, Sucre, Maïzena, Beurre, Eau, Sel, Lait, Praliné, Amandes effilées.’, 2, ‘https://cdn.pixabay.com/photo/2020/08/16/18/46/paris-brest-5493546_960_720.jpg’),
-- (‘Millefeuille’, ‘Excellent choix surtout en automne. Ingrédients : Oeuf, Lait, Sucre, Farine, Sucre vanillé, Sucre glace, Chocolat.’, 2.10, ‘https://cdn.pixabay.com/photo/2018/07/31/03/57/lunch-3574123_960_720.jpg’),
-- (‘Fraisier’, ‘Le fameux, bien gourmand et bien fondant. Ingrédients : Oeuf, Sucre, Farine, Maïzena, Levure, Sel, Lait, Sucre, Fraises, Fraises des bois, Sucre de canne, Kirsch, Sucre glace.’, 2.40, https://images.unsplash.com/photo-1611293388250-580b08c4a145?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1322&q=80’),
-- (‘Éclair au chocolat’, ‘Un foudre de guerre de la gourmandise. Ingrédients : Farine, Lait, Beurre, Chocolat noir, Oeuf, Sucre, Eau, Sel, Huile.’, 1.80, ‘https://images.unsplash.com/photo-1582217308209-2207886c55bd?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80’),
-- (‘Éclair au café’, ‘Le foudre de guerre caféiné de la gourmandise. Ingrédients : Farine, Lait, Beurre, Chocolat noir, Oeuf, Sucre, Eau, Sel, Huile.’, 1.80, ‘https://cdn.pixabay.com/photo/2016/03/24/12/06/eclair-1276591_960_720.jpg’),
-- (‘Tarte tatin’, ‘Ticket express pour le royaume des plaisirs papillaires. Ingrédients : Pâte brisée, Sucre, Beurre, Pomme du verger.’, 2.20, ‘https://cdn.pixabay.com/photo/2019/01/13/23/48/pie-3931528_960_720.jpg’),
-- (‘Baba au rhum’, ‘Attention aux âmes sensibles, il y a double rasade de rhum car on sait que vous aimez ça. Ingrédients : Farine, Beurre, Sucre, Levure, Lait, Oeuf, Eau, Sucre de canne, Rhum, et encore du Rhum.’, 2.50, ‘https://media.istockphoto.com/photos/savarina-dessert-baba-au-rhum-picture-id1170159881?k=6&m=1170159881&s=170667a&w=0&h=ZCM14L2V-DSNysLbTtDzuxqV5HdXqkkqbGatwBX81ZY=’),
-- (‘Jambon beurre’, ‘El gran classico. Ingrédients : Farine, Eau, Levure de boulanger, Sel, Tranche de jambon blanc du boucher, noix de beurre salé.’, 3.50, ‘https://cdn.pixabay.com/photo/2015/03/26/10/44/sandwich-691875_960_720.jpg’),
-- (‘Crudités’, ‘Une cible de premier choix pour les végétariens. Ingrédients : Farine, Eau, Levure de boulanger, Sel, Tomate, Roquette, Avocat, Concombre, Radis, Mozzarella, Fromage frais, Noix, Basilic, Poivre.’, 3.80, ‘https://cdn.pixabay.com/photo/2018/06/21/15/07/bread-3488727_960_720.jpg’),
-- (‘Saucisson corse’, ‘Attention, si vous donnez un mauvais avis sur ce sandwich vous serez bannis du site immédiatement. Ingrédients : Farine, Eau, Levure de boulanger, Sel, Saucisson corse, Beurre, Cornichons.’, 4.20, ‘https://images.unsplash.com/photo-1590076862697-0324a3938545?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80’),
-- (‘Pâté de canard au poivre vert’, ‘Vos papilles vont remercieront. Ingrédients : Farine, Eau, Levure de boulanger, Sel, Pâté de canard de mon ami et producteur de canards landais, Poivre vert, Cornichons, Une feuille de laitue pour la couleur.’, 4.30, ‘https://t4.ftcdn.net/jpg/00/47/64/27/360_F_47642783_kA6tOoX12XauUs9wCmkhBSrKuvmykUNK.jpg’),
-- (‘Thon crudités’, ‘Notre thon est garanti sans plastique ni mercure. Ingrédients : Farine, Eau, Levure de boulanger, Sel, Thon rouge de la mer Baltique, Tomate, Salade feuille de chêne, Concombre, mayonnaise maison.’, 4.10, ‘https://st2.depositphotos.com/1777829/10016/i/950/depositphotos_100168238-stock-photo-tuna-sandwich-in-a-seeded.jpg’),
-- (‘Jambon de Bayonne’, ‘Le casse-croûte des rugbymen. Ingrédients : Farine, Eau, Levure de boulanger, Sel, Du vrai jambon de Bayonne, du vrai Comté de Franche-Comté, du vrai beurre de Normandie.’, 4.10, ‘https://images.unsplash.com/photo-1485451456034-3f9391c6f769?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80’),
-- (‘Panini nutella’, ‘Pour le plaisir des grands et des petits. Ingrédients : Farine, Eau, Levure de boulanger, Sel, Pâte à tartiner chocolatée et avec beaucoup d’huile de palme.’, 4, ‘https://images.unsplash.com/photo-1572542873907-204263f6a869?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1351&q=80’);










-- INSERT INTO product_category ("product_id", "category_id") VALUES 
--     (1,3), (2,2), (3,2), (4,1);

COMMIT;