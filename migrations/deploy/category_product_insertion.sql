BEGIN;

INSERT INTO category ("label", "image") VALUES 
    ('Patisserie', 'url bon gateau'),
    ('Viennoiserie', 'chocolatine en force'),
    ('Boulangerie', 'du bon pain de chez nous'),
    ('Bonbon', 'oui il y en a toujours');

INSERT INTO product ("title", "description", "price", "image") VALUES 
    ('Baguette', 'Le pain historique. Ingrédients : Farine, Eau, Levure de boulanger, Sel.', 1, 'https://cdn.pixabay.com/photo/2017/03/14/21/03/bread-2144397_960_720.jpg'), 
    ('Croissant', 'La viennoiserie simple. Ingrédients : Pâte levée feuilletée, Levure, Beurre.', 0.80, 'https://cdn.pixabay.com/photo/2016/03/27/21/59/bread-1284438_960_720.jpg'), 
    ('Chocolatine', 'La viennoiserie du Sud Ouest. Ingrédients : Farine, Levure, Beurre, Barre de chocolat, Eau, Sel, Sucre.', 0.95, 'https://cdn.pixabay.com/photo/2019/03/12/07/46/pastry-4050125_960_720.jpg'), 
    ('Fraisier', 'Idéal pour la St Valentin. Ingrédients : Recette secrète', 13.95, 'https://cdn.pixabay.com/photo/2019/07/07/16/09/cake-4322800_960_720.jpg'),
    ('Baguette tradition', 'La baguette classique, mais encore meilleure. Ingrédients : Farine, Eau, Levure de boulanger, Sel.', 1.10, 'https://cdn.pixabay.com/photo/2017/06/23/23/57/bread-2436370_960_720.jpg'),
    ('Pain', 'Le pain pour les gros mangeurs. Ingrédients : Farine, Eau, Levure de boulanger, Sel.', 2,'https://cdn.pixabay.com/photo/2019/05/06/14/24/bread-4183225__340.jpg'),
    ('Pain sans sel', 'Le pain de prédilection pour ceux qui font de l’hypertension. Ingrédients : Farine, Eau, Levure de boulanger.', 1.90, 'https://cdn.pixabay.com/photo/2016/07/11/17/31/bread-1510155_960_720.jpg'),


    ('Pain complet', 'Le pain qui tient bien au ventre. Ingrédients : Farine complète et riche en fibres, Eau, Levure de boulanger, Sel.', 2.20, 'https://cdn.pixabay.com/photo/2018/06/19/09/34/bread-3484107_960_720.jpg'),
    
    
    
    ('Pain bio', 'Le pain qui vous fait sentir en harmonie avec votre environnement. Ingrédients : Farine bio, Eau de source, Levure bio fraîche, Sel marin, Oeuf du poulailler pour la dorure.', 1.90, 'https://cdn.pixabay.com/photo/2016/07/11/18/42/bread-1510298_960_720.jpg'),


    ('Pain de campagne', 'Le pain parfait pour vos tartines de pâté. Ingrédients : Farine à pain artisanale de campagne, Eau, Levure de boulanger, Sucre, Sel.', 2.40, 'https://cdn.pixabay.com/photo/2014/07/09/22/09/bread-388647_960_720.jpg'),
    ('Chausson aux pommes', 'Encore meilleur quand on le déguste en pantoufle dans son canapé. Ingrédients : Pâte feuilletée, Pomme du verger, Compote de pomme, Oeuf, Beurre, Sucre.', 1.50, 'https://cdn.pixabay.com/photo/2017/03/10/18/19/pastries-2133439_960_720.jpg'),

    ('Chouquette', 'Petit chou tout mignon parsemé de sucre perlé à manger en une bouchée. Ingrédients : Farine, Oeuf, Eau, Levure, Beurre, Sucre, Sel.', 0.30, 'https://cdn.pixabay.com/photo/2018/10/13/17/54/icing-sugar-3744757_960_720.jpg');









INSERT INTO product_category ("product_id", "category_id") VALUES 
    (1,3), (2,2), (3,2), (4,1);

COMMIT;