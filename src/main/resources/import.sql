-- Storage Items

INSERT INTO storage_item
    (id, createdat, updatedat, name, total, totalprice, unitofmesure)
	VALUES (1,'2009-09-22 16:47:08.128','2009-09-22 16:47:08.128','Boots','152','1350','pairs');

INSERT INTO storage_item
    (id, createdat, updatedat, name, total, totalprice, unitofmesure)
	VALUES (2,'2009-09-22 16:47:08.128','2019-09-06 20:54:14.35','Beer','67','250','galons');

INSERT INTO storage_item
    (id, createdat, updatedat, name, total, totalprice, unitofmesure)
	VALUES (3,'2009-09-22 16:47:08.128','2009-09-22 16:47:08.128','Snacks','1233','350','packages');

INSERT INTO storage_item
    (id, createdat, updatedat, name, total, totalprice, unitofmesure)
	VALUES (4,'2009-09-22 16:47:08.128','2009-09-22 16:47:08.128','Lazy Bag','12','460','object');

INSERT INTO storage_item
    (id, createdat, updatedat, name, total, totalprice, unitofmesure)
	VALUES (5,'2019-09-06 20:29:13.526','2019-09-06 20:29:13.526','Apples','2500','3360','kilos');

INSERT INTO storage_item
    (id, createdat, updatedat, name, total, totalprice, unitofmesure)
	VALUES (6,'2019-09-06 20:29:36.648','2019-09-06 20:29:36.648','Lemons','255','1235','kilos');

INSERT INTO storage_item
    (id, createdat, updatedat, name, total, totalprice, unitofmesure)
	VALUES (7,'2019-09-06 20:34:24.391','2019-09-06 20:34:24.391','Sugar','335','33247','tons');

INSERT INTO storage_item
    (id, createdat, updatedat, name, total, totalprice, unitofmesure)
	VALUES (8,'2019-09-06 20:40:11.376','2019-09-06 20:40:11.376','Meat','3256','124587','tons');

INSERT INTO storage_item
    (id, createdat, updatedat, name, total, totalprice, unitofmesure)
	VALUES (9,'2019-09-06 20:46:08.184','2019-09-06 20:46:08.184','Seeds','258','3214','bags');

INSERT INTO storage_item
    (id, createdat, updatedat, name, total, totalprice, unitofmesure)
	VALUES (10,'2019-09-06 20:49:30.492','2019-09-06 20:49:30.492','Vine','12','2450','bottles');

-- User Roles

INSERT INTO user_role
    (id, createdat, updatedat, description, key, name)
	VALUES (1,'2009-09-22 16:47:08.128','2009-09-22 16:47:08.128','Can perform all actions','ROLE_ADMIN','Admin');

INSERT INTO user_role
    (id, createdat, updatedat, description, key, name)
	VALUES (2,'2009-09-22 16:47:08.128','2009-09-22 16:47:08.128','Can fetch and update data','ROLE_EMPLOYEE','Employee');

-- Users

INSERT INTO storage_user
    (id, createdat, updatedat, email, image, name, password, id_role)
	VALUES (1,'2009-09-22 16:47:08.128','2009-09-22 16:47:08.128','admin@mail.com','https://scontent.fbeg10-1.fna.fbcdn.net/v/t1.0-1/c1.0.959.959a/13096066_1439776489381085_9102775995846028030_n.jpg?_nc_cat=104&_nc_oc=AQkTb6WyONmvsZCgof2pizFzgl0qHDdTNxXYGmlEN700ID917JDOrqI4QIAOrE_qTMs&_nc_ht=scontent.fbeg10-1.fna&oh=50f42fa08394ce2d6aca4e9004816a82&oe=5DC86D17','Mihalo Vasic','admin',1);

INSERT INTO storage_user
    (id, createdat, updatedat, email, image, name, password, id_role)
	VALUES (2,'2009-09-22 16:47:08.128','2019-09-06 20:19:19.091','employee@mail.com','https://scontent.fbeg10-1.fna.fbcdn.net/v/t1.0-9/69273240_2564553356902801_8916100073520103424_n.jpg?_nc_cat=106&_nc_oc=AQkprneMw0is3c04MGf0PV1LUHnODL4s-iLc5QtJSwLDiGoJKhXlnJoODjkbJWY5TE4&_nc_ht=scontent.fbeg10-1.fna&oh=29886d64974741d636fe61493fda3fa9&oe=5DF571E2','Paja','employee',2);