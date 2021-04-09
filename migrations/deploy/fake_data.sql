-- Deploy ou-est-mon-pain:fake_data to pg

BEGIN;

DELETE FROM product_category;

UPDATE category SET "label"='Pain', "image"='https://images.unsplash.com/photo-1509440159596-0249088772ff?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1352&q=80'
WHERE "id"=1;

UPDATE category SET "label"='Viennoiserie', "image"='https://images.unsplash.com/photo-1597528662465-55ece5734101?ixid=MXwxMjA3fDB8MHxwaG90[…]ufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1267&q=80'
WHERE "id"=2;

UPDATE category SET "label"='Patisserie', "image"='https://images.unsplash.com/photo-1541781304420-38fd3dd748ac?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80'
WHERE "id"=3;

UPDATE category SET "label"='Sandwich', "image"='https://images.unsplash.com/photo-1509722747041-616f39b57569?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80'
WHERE "id"=4;

INSERT INTO product ("title", "description", "price", "image") VALUES 
('Cannelé', 'Il ravira les amateurs de rhum et de caramel. Ingrédients : Lait, Oeuf, Gousse de vanille, Rhum, Farine, Beurre, Sucre, Sel.', 1.70, 'https://cdn.pixabay.com/photo/2015/02/27/11/42/pastry-652022_960_720.jpg'),
('Pain aux raisins', 'Il est costaud et vous en aurez pour votre argent. Ingrédients : Farine, Sucre, Oeuf, Lait, Levure, Beurre, Sel, Crème pâtissière, Sucre de canne, raisins secs.', 1.40, 'https://images.unsplash.com/photo-1614205569927-1f104e088eee?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1388&q=80'),
('Brioche', 'Indispensable pour vos petits déjeuners tardifs. Ingrédients : Farine, Beurre, Oeuf, Sucre, Levure, Lait, Sel', 1, 'https://cdn.pixabay.com/photo/2015/01/10/16/01/galette-des-rois-595438_960_720.jpg'),
('Paris-Brest', 'La fameuse roue de vélo mangeable. Ingrédients : Farine, Oeuf, Sucre, Maïzena, Beurre, Eau, Sel, Lait, Praliné, Amandes effilées.', 2, 'https://cdn.pixabay.com/photo/2020/08/16/18/46/paris-brest-5493546_960_720.jpg'),
('Millefeuille', 'Excellent choix surtout en automne. Ingrédients : Oeuf, Lait, Sucre, Farine, Sucre vanillé, Sucre glace, Chocolat.', 2.10, 'https://cdn.pixabay.com/photo/2018/07/31/03/57/lunch-3574123_960_720.jpg'),
('Éclair au chocolat', 'Un foudre de guerre de la gourmandise. Ingrédients : Farine, Lait, Beurre, Chocolat noir, Oeuf, Sucre, Eau, Sel, Huile.', 1.80, 'https://images.unsplash.com/photo-1582217308209-2207886c55bd?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80'),
('Éclair au café', 'Un foudre de guerre caféiné de la gourmandise. Ingrédients : Farine, Lait, Beurre, Café, Oeuf, Sucre, Eau, Sel, Huile.', 1.80, 'https://cdn.pixabay.com/photo/2016/03/24/12/06/eclair-1276591_960_720.jpg'),
('Tarte tatin', 'Ticket express pour le royaume des plaisirs papillaires. Ingrédients : Pâte brisée, Sucre, Beurre, Pomme du verger.', 2.20, 'https://cdn.pixabay.com/photo/2019/01/13/23/48/pie-3931528_960_720.jpg'),
('Baba au rhum', 'Attention aux âmes sensibles car il y a double rasade de rhum car on sait que vous aimez ça. Ingrédients : Farine, Beurre, Sucre, Levure, Lait, Oeuf, Eau, Sucre de canne, Rhum, et encore du Rhum', 2.50, 'https://media.istockphoto.com/photos/savarina-dessert-baba-au-rhum-picture-id1170159881?k=6&m=1170159881&s=170667a&w=0&h=ZCM14L2V-DSNysLbTtDzuxqV5HdXqkkqbGatwBX81ZY='),
('Jambon beurre', 'El gran classico. Ingrédients : Farine, Eau, Levure de boulanger, Sel, Tranche de jambon blanc du boucher, noix de beurre salé.', 3.50, 'https://cdn.pixabay.com/photo/2015/03/26/10/44/sandwich-691875_960_720.jpg'),
('Crudités', 'Une cible de premier choix pour les végétariens. Ingrédients : Farine, Eau, Levure de boulanger, Sel, Tomate, Roquette, Avocat, Concombre, Radis, Mozzarella, Fromage frais, Basilic, Poivre.', 3.80, 'https://cdn.pixabay.com/photo/2018/06/21/15/07/bread-3488727_960_720.jpg'),
('Saucisson corse', 'Attention, si vous donnez un mauvais avis sur ce sandwich vous serez bannis du site. Ingrédients : Farine, Eau, Levure de boulanger, Sel, Saucisson corse, Beurre, Cornichons.', 4.20, 'https://images.unsplash.com/photo-1590076862697-0324a3938545?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80'),
('Pâté de canard au poivre vert', 'Vos papilles vont remercieront. Ingrédients : Farine, Eau, Levure de boulanger, Sel, Pâté de canard de mon ami et producteur de canards landais, Poivre vert, Cornichons, Une feuille de laitue pour la couleur.', 4.30, 'https://t4.ftcdn.net/jpg/00/47/64/27/360_F_47642783_kA6tOoX12XauUs9wCmkhBSrKuvmykUNK.jpg'),
('Thon crudités', 'Notre thon est garanti sans plastique ni mercure. Ingrédients : Farine, Eau, Levure de boulanger, Sel, Thon rouge de la mer Baltique, Tomate, Salade feuille de chêne, Concombre, mayonnaise maison.', 4.10, 'https://st2.depositphotos.com/1777829/10016/i/950/depositphotos_100168238-stock-photo-tuna-sandwich-in-a-seeded.jpg'),
('Jambon de Bayonne', 'Le casse-croûte des rugbymen. Ingrédients : Farine, Eau, Levure de boulanger, Sel, Du vrai jambon de Bayonne, du vrai Comté de Franche-Comté, du vrai beurre de Normandie.', 4.10, 'https://images.unsplash.com/photo-1485451456034-3f9391c6f769?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80'),
('Crêpe au nutella', 'Pour le plaisir des grands et des petits. Ingrédients : Farine, Eau, Levure de boulanger, Sel, Pâte à tartiner chocolatée et avec beaucoup d’huile de palme.', 4, 'https://images.unsplash.com/photo-1572542873907-204263f6a869?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1351&q=80');


INSERT INTO product_category ("product_id", "category_id") VALUES 
(1,1), (2,2), (3,2), (4,3), (5,1), (6,1), (7,1), (8,1), (9,1), (10,1), (11,2),(12,3);
-- (13,3),(14,2),(15,1),(16,3),(17,3),(18,3),(19,3),(20,3),(21,3), (22,4), (23,4), (24,4),(25,4),(26,4),(27,4),(28,3);


INSERT INTO allergen ("name", "color") VALUES
('lactose', '#ff00ff'),
('oeuf', '#ffff00'),
('fruits à coques', '#00ffff'),
('gluten', '#0000ff');

COMMIT;
