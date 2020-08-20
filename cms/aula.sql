create database cms;
use cms;

create table category(
	cat_id int(3) not null auto_increment,
    cat_title varchar(255),
    PRIMARY KEY (cat_id)
);

ALTER TABLE `cms`.`category` 
RENAME TO  `cms`.`categories` ;

insert into cms.categories (categories.cat_title) VALUES 
	('Bootstrap'),
    ('Javascript');

SELECT * FROM cms.categories;
insert into cms.categories(cat_title) VALUES
	('PHP'),
    ('JAVA');
    
CREATE TABLE posts(
	post_id int(3) not null auto_increment,
    post_category_id int(3),
    post_title varchar(255),
    post_author varchar(255),
    post_date date,
    post_image text,
    post_content text,
    PRIMARY KEY (post_id),
    FOREIGN KEY posts(post_category_id) REFERENCES categories(cat_id) ON DELETE SET NULL
);

ALTER TABLE cms.posts ADD COLUMN (
	post_tags varchar(255),
    post_comment_count varchar(255),
    post_status varchar(255)
);
ALTER TABLE cms.posts CHANGE post_comment_count post_comment_count int(11);

ALTER TABLE cms.posts ALTER post_status SET DEFAULT 'draft';

SELECT * FROM cms.posts;

INSERT INTO cms.posts VALUES
	(NULL, NULL, 'Edwin\'s CMS PHP Course', 'Eliakim Meneses', CURDATE(), NULL, 'This course is okay', 'edwin, cms, php, course', NULL,NULL);

UPDATE cms.posts SET post_category_id = 1
	WHERE post_id = 1;