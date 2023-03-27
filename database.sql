drop schema if exists sdProjectRTX ;
create schema sdProjectRTX;
use sdProjectRTX;

create table publisher(
publisher_id int primary key unique not null AUTO_INCREMENT,
e_mail varchar(128) unique not null,
pass varchar(64) not null,
publisher_name varchar(50) not null,
picture varchar(256) not null default 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
publisher_description varchar(1000) not null
);

create table game(
game_id int primary key unique not null AUTO_INCREMENT,
game_name varchar(50) not null,
game_series varchar(50) not null,
publisher_id int not null,
release_date date not null,
game_description varchar(1000) not null,
FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id)
);

create table game_tags (
game_id int not null,
tag varchar(30) not null,
PRIMARY KEY (game_id, tag),
FOREIGN KEY (game_id) REFERENCES game(game_id)
);

create table game_screenshots(
game_id int not null,
screenshot varchar(256) not null,
PRIMARY KEY (game_id, screenshot),
FOREIGN KEY (game_id) REFERENCES game(game_id)
);

create table users (
user_id int primary key unique not null AUTO_INCREMENT,
e_mail varchar(128) unique not null,
pass varchar(64) not null,
nickname varchar(50) not null,
picture varchar(256) not null default 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
moderator boolean default false,
playing int
);

create table owned_games (
user_id int not null,
game_id int not null,
PRIMARY KEY (user_id, game_id),
FOREIGN KEY (user_id) REFERENCES users(user_id),
FOREIGN KEY (game_id) REFERENCES game(game_id)
);

create table games_history (
user_id int not null,
game_id int not null,
PRIMARY KEY (user_id, game_id),
FOREIGN KEY (user_id) REFERENCES users(user_id),
FOREIGN KEY (game_id) REFERENCES game(game_id)
);

create table friends (
user_id int not null,
friend_id int not null,
PRIMARY KEY (user_id, friend_id),
FOREIGN KEY (user_id) REFERENCES users(user_id),
FOREIGN KEY (friend_id) REFERENCES users(user_id)
);

insert into publisher (e_mail, pass, publisher_name, picture, publisher_description) values
( "valve@valvesoftware.com", "valvesoft", "Valve", "https://avatars.akamai.steamstatic.com/5f4b7a6439548f5513fc72968dae2217309e3d54_full.jpg", "Valve's debut title, Half-Life, was released in 1998. Since then, we've released dozens of titles that changed the world (and one that didn't). Today, millions of people play our games every day." ),
( "rockstargames@rg.co.uk", "rockstarYeah", "Rockstar Games", "https://avatars.akamai.steamstatic.com/d83a1786f23929deb5f20326f128bbc13a9a1e85_full.jpg", "Publishers of such popular games as Grand Theft Auto, Max Payne, Red Dead Redemption, L.A. Noire, Bully & more."),
( "sega@google.jp", "genesissaturndreamcast", "SEGA", "https://avatars.akamai.steamstatic.com/93aafaeb1ee958cc14bb78344df71c92d9734980_full.jpg", "To be this good takes AGES");

insert into game (game_name, game_series, publisher_id, release_date, game_description) values
("Half-Life", "Half-Life", 1,  "1998-11-08", "Named Game of the Year by over 50 publications, Valve's debut title blends action and adventure with award-winning technology to create a frighteningly realistic world where players must think to survive. Also includes an exciting multiplayer mode that allows you to play against friends and enemies around the world."),
("Half-Life 2", "Half-Life", 1, "2004-11-16", "NOW. By taking the suspense, challenge and visceral charge of the original, and adding startling new realism and responsiveness, Half-Life 2 opens the door to a world where the player's presence affects everything around them, from the physical environment to the behaviors even the emotions of both friends and enemies."),
("Half-Life: Alyx", "Half-Life", 1, "2020-03-23", "Half-Life: Alyx is Valve’s VR return to the Half-Life series. It’s the story of an impossible fight against a vicious alien race known as the Combine, set between the events of Half-Life and Half-Life 2."),
("Portal", "Portal", 1, "2007-10-10", "Portal™ is a new single player game from Valve. Set in the mysterious Aperture Science Laboratories, Portal has been called one of the most innovative new games on the horizon and will offer gamers hours of unique gameplay."),
("Portal 2", "Portal", 1, "2011-04-19", "Portal 2 draws from the award-winning formula of innovative gameplay, story, and music that earned the original Portal over 70 industry accolades and created a cult following."),
("Counter-Strike", "Counter-Strike", 1, "2000-11-01", "Play the world's number 1 online action game. Engage in an incredibly realistic brand of terrorist warfare in this wildly popular team-based game. Ally with teammates to complete strategic missions. Take out enemy sites. Rescue hostages. Your role affects your team's success. Your team's success affects your role."),
("Counter-Strike: Global Offensive", "Counter-Strike", 1, "2012-08-21", "Counter-Strike: Global Offensive (CS: GO) expands upon the team-based action gameplay that it pioneered when it was launched 19 years ago.");
insert into game_tags (game_id, tag) values
(1, "FPS"), (1, "Sci-Fi"), (1, "Multiplayer"), (1, "Classic"),
(2, "FPS"), (2, "Action"), (2, "Sci-Fi"), (2, "Classic"),
(3, "VR"), (3, "FPS"), (3, "Horror"), (3, "Action"), (3, "Story Rich"),
(4, "Puzzle"), (4, "FPS"), (4, "Sci-Fi"),
(5, "Puzzle"), (5, "FPS"), (5, "Sci-Fi"), (5, "Story Rich"),
(6, "Action"), (6, "FPS"), (6, "Multiplayer"), (6, "Classic"),
(7, "Action"), (7, "FPS"), (7, "Competitive");
insert into game_screenshots (game_id, screenshot) values
(1, "https://cdn.akamai.steamstatic.com/steam/apps/70/0000002354.1920x1080.jpg?t=1666824272"), (1, "https://cdn.akamai.steamstatic.com/steam/apps/70/0000002343.1920x1080.jpg?t=1666824272"), (1, "https://cdn.akamai.steamstatic.com/steam/apps/70/0000002342.1920x1080.jpg?t=1666824272"), (1, "https://cdn.akamai.steamstatic.com/steam/apps/70/0000002344.1920x1080.jpg?t=1666824272"), (1, "https://cdn.akamai.steamstatic.com/steam/apps/70/0000002345.1920x1080.jpg?t=1666824272"), (1, "https://cdn.akamai.steamstatic.com/steam/apps/70/0000002352.1920x1080.jpg?t=1666824272"), (1, "https://cdn.akamai.steamstatic.com/steam/apps/70/0000002347.1920x1080.jpg?t=1666824272"), (1, "https://cdn.akamai.steamstatic.com/steam/apps/70/0000002348.1920x1080.jpg?t=1666824272"), (1, "https://cdn.akamai.steamstatic.com/steam/apps/70/0000002349.1920x1080.jpg?t=1666824272"), (1, "https://cdn.akamai.steamstatic.com/steam/apps/70/0000002350.1920x1080.jpg?t=1666824272"), (1, "https://cdn.akamai.steamstatic.com/steam/apps/70/0000002351.1920x1080.jpg?t=1666824272"),
(2, "https://cdn.akamai.steamstatic.com/steam/apps/220/0000001864.1920x1080.jpg?t=1666823596"), (2, "https://cdn.akamai.steamstatic.com/steam/apps/220/0000001865.1920x1080.jpg?t=1666823596"), (2, "https://cdn.akamai.steamstatic.com/steam/apps/220/0000001866.1920x1080.jpg?t=1666823596"), (2, "https://cdn.akamai.steamstatic.com/steam/apps/220/0000001867.1920x1080.jpg?t=1666823596"), (2, "https://cdn.akamai.steamstatic.com/steam/apps/220/0000001868.1920x1080.jpg?t=1666823596"), (2, "https://cdn.akamai.steamstatic.com/steam/apps/220/0000001869.1920x1080.jpg?t=1666823596"), (2, "https://cdn.akamai.steamstatic.com/steam/apps/220/0000001870.1920x1080.jpg?t=1666823596"), (2, "https://cdn.akamai.steamstatic.com/steam/apps/220/0000001871.1920x1080.jpg?t=1666823596"), (2, "https://cdn.akamai.steamstatic.com/steam/apps/220/0000001872.1920x1080.jpg?t=1666823596"), 
(3, "https://cdn.akamai.steamstatic.com/steam/apps/546560/ss_d61365e93f20ceb5a94a1e5b2811cf504cbfa303.1920x1080.jpg?t=1673391297"), (3, "https://cdn.akamai.steamstatic.com/steam/apps/546560/ss_fe7066404a704aa20f7c6f251facb7aef2606bda.1920x1080.jpg?t=1673391297"), (3, "https://cdn.akamai.steamstatic.com/steam/apps/546560/ss_6868ae1644628f857e7df4b72a00fdf506f79c7f.1920x1080.jpg?t=1673391297"), (3, "https://cdn.akamai.steamstatic.com/steam/apps/546560/ss_4236773ab28112613bd7d4c6282331c861bc222a.1920x1080.jpg?t=1673391297"), (3, "https://cdn.akamai.steamstatic.com/steam/apps/546560/ss_5d228b092e93ff148e6a998c33e751fb968cc956.1920x1080.jpg?t=1673391297"), (3, "https://cdn.akamai.steamstatic.com/steam/apps/546560/ss_70fce3236bf252d3814f793744f648cbe35164e4.1920x1080.jpg?t=1673391297"), (3, "https://cdn.akamai.steamstatic.com/steam/apps/546560/ss_fcc7a64234b8b26cac3d69dfc4779dd438582f15.1920x1080.jpg?t=1673391297"), (3, "https://cdn.akamai.steamstatic.com/steam/apps/546560/ss_0360004603a7861cf6781d5449e641f916f1ee07.1920x1080.jpg?t=1673391297"), (3, "https://cdn.akamai.steamstatic.com/steam/apps/546560/ss_e5152f19710aaa91c4a4ab161785af3e1f8d850d.1920x1080.jpg?t=1673391297"), (3, "https://cdn.akamai.steamstatic.com/steam/apps/546560/ss_ac80dfaacaade35a1da835dadd52ab420607603b.1920x1080.jpg?t=1673391297"), (3, "https://cdn.akamai.steamstatic.com/steam/apps/546560/ss_ddc667aa2687543c0baa1a63c6bdb5fa59e0617e.1920x1080.jpg?t=1673391297"), (3, "https://cdn.akamai.steamstatic.com/steam/apps/546560/ss_4912f4c3d259a472e9898f0a7b1f819a533d2c1e.1920x1080.jpg?t=1673391297"), 
(4, "https://cdn.akamai.steamstatic.com/steam/apps/400/0000002582.1920x1080.jpg?t=1673562889"), (4, "https://cdn.akamai.steamstatic.com/steam/apps/400/0000002583.1920x1080.jpg?t=1673562889"), (4, "https://cdn.akamai.steamstatic.com/steam/apps/400/0000002584.1920x1080.jpg?t=1673562889"), (4, "https://cdn.akamai.steamstatic.com/steam/apps/400/0000002585.1920x1080.jpg?t=1673562889"), (4, "https://cdn.akamai.steamstatic.com/steam/apps/400/0000002586.1920x1080.jpg?t=1673562889"), (4, "https://cdn.akamai.steamstatic.com/steam/apps/400/0000002587.1920x1080.jpg?t=1673562889"), (4, "https://cdn.akamai.steamstatic.com/steam/apps/400/0000002588.1920x1080.jpg?t=1673562889"), (4, "https://cdn.akamai.steamstatic.com/steam/apps/400/ss_25aa95176ac6319fad955b31554451f3ea61f1e8.1920x1080.jpg?t=1673562889"), (4, "https://cdn.akamai.steamstatic.com/steam/apps/400/ss_15c08be59046abbd785ab8e7e8857ba8633f292b.1920x1080.jpg?t=1673562889"), (4, "https://cdn.akamai.steamstatic.com/steam/apps/400/ss_5d9a2b799aaaa6f8992128c126e68b7e8d718715.1920x1080.jpg?t=1673562889"), (4, "https://cdn.akamai.steamstatic.com/steam/apps/400/ss_3164c436ce7708dcf0f46bb4569e7f7b83ccb01e.1920x1080.jpg?t=1673562889"), 
(5, "https://cdn.akamai.steamstatic.com/steam/apps/620/ss_f3f6787d74739d3b2ec8a484b5c994b3d31ef325.1920x1080.jpg?t=1677267116"), (5, "https://cdn.akamai.steamstatic.com/steam/apps/620/ss_6a4f5afdaa98402de9cf0b59fed27bab3256a6f4.1920x1080.jpg?t=1677267116"), (5, "https://cdn.akamai.steamstatic.com/steam/apps/620/ss_0cdd90fafc160b52d08b303d205f9fd4e83cf164.1920x1080.jpg?t=1677267116"), (5, "https://cdn.akamai.steamstatic.com/steam/apps/620/ss_ec35a739b4b33270eb170d9e561c5b016cba50a6.1920x1080.jpg?t=1677267116"), (5, "https://cdn.akamai.steamstatic.com/steam/apps/620/ss_3d13161104a04603a0524536770c5f74626db4c0.1920x1080.jpg?t=1677267116"), (5, "https://cdn.akamai.steamstatic.com/steam/apps/620/ss_8a772608d29ffd56ac013d2ac7c4388b96e87a21.1920x1080.jpg?t=1677267116"), (5, "https://cdn.akamai.steamstatic.com/steam/apps/620/ss_358127df30a766a1516ad139083c2bcec3fe0975.1920x1080.jpg?t=1677267116"), (5, "https://cdn.akamai.steamstatic.com/steam/apps/620/ss_410c7955c3cc8ca4a5e3c81daa214f534c9aabc8.1920x1080.jpg?t=1677267116"), (5, "https://cdn.akamai.steamstatic.com/steam/apps/620/ss_0e16bceacb6616a5ca4bc4ba4d28c7a0d06b671c.1920x1080.jpg?t=1677267116"), (5, "https://cdn.akamai.steamstatic.com/steam/apps/620/ss_d8f172249d6e89999c3692bf2c380921f197fd82.1920x1080.jpg?t=1677267116"), (5, "https://cdn.akamai.steamstatic.com/steam/apps/620/ss_fe9782ea3b43ef7af37b18e0a5c5f7bdc9c21f12.1920x1080.jpg?t=1677267116"), (5, "https://cdn.akamai.steamstatic.com/steam/apps/620/ss_3858536cbc0a07dfbe36e8f87b3f08bf3be45e54.1920x1080.jpg?t=1677267116"), 
(6, "https://cdn.akamai.steamstatic.com/steam/apps/10/0000000132.1920x1080.jpg?t=1666823513"), (6, "https://cdn.akamai.steamstatic.com/steam/apps/10/0000000133.1920x1080.jpg?t=1666823513"), (6, "https://cdn.akamai.steamstatic.com/steam/apps/10/0000000134.1920x1080.jpg?t=1666823513"), (6, "https://cdn.akamai.steamstatic.com/steam/apps/10/0000000135.1920x1080.jpg?t=1666823513"), (6, "https://cdn.akamai.steamstatic.com/steam/apps/10/0000000136.1920x1080.jpg?t=1666823513"), (6, "https://cdn.akamai.steamstatic.com/steam/apps/10/0000002540.1920x1080.jpg?t=1666823513"), (6, "https://cdn.akamai.steamstatic.com/steam/apps/10/0000002539.1920x1080.jpg?t=1666823513"), (6, "https://cdn.akamai.steamstatic.com/steam/apps/10/0000002538.1920x1080.jpg?t=1666823513"), (6, "https://cdn.akamai.steamstatic.com/steam/apps/10/0000002537.1920x1080.jpg?t=1666823513"), (6, "https://cdn.akamai.steamstatic.com/steam/apps/10/0000002536.1920x1080.jpg?t=1666823513"), (6, "https://cdn.akamai.steamstatic.com/steam/apps/10/0000002541.1920x1080.jpg?t=1666823513"), (6, "https://cdn.akamai.steamstatic.com/steam/apps/10/0000002542.1920x1080.jpg?t=1666823513"), (6, "https://cdn.akamai.steamstatic.com/steam/apps/10/0000002543.1920x1080.jpg?t=1666823513"), 
(7, "https://cdn.akamai.steamstatic.com/steam/apps/730/ss_118cb022b9a43f70d2e5a2df7427f29088b6b191.1920x1080.jpg?t=1668125812"), (7, "https://cdn.akamai.steamstatic.com/steam/apps/730/ss_d196d945c6170e9cadaf67a6dea675bd5fa7a046.1920x1080.jpg?t=1668125812"), (7, "https://cdn.akamai.steamstatic.com/steam/apps/730/ss_8c9cce9a9dde7b9c020837dcbd4615efe6f77d66.1920x1080.jpg?t=1668125812"), (7, "https://cdn.akamai.steamstatic.com/steam/apps/730/ss_2b9e362287b509bb3864fa7bad654fe1fda0f7ed.1920x1080.jpg?t=1668125812"), (7, "https://cdn.akamai.steamstatic.com/steam/apps/730/ss_855c016cde14b7cec5c3d2523589b9054c030010.1920x1080.jpg?t=1668125812"), (7, "https://cdn.akamai.steamstatic.com/steam/apps/730/ss_34090867f1a02b6c17652ba9043e3f622ed985a9.1920x1080.jpg?t=1668125812"), (7, "https://cdn.akamai.steamstatic.com/steam/apps/730/ss_77215ea1b454c08a75351a74585a5b089142da3e.1920x1080.jpg?t=1668125812"), (7, "https://cdn.akamai.steamstatic.com/steam/apps/730/ss_110be563b66dde31b3b00dcf7d2f644c50374f07.1920x1080.jpg?t=1668125812"), (7, "https://cdn.akamai.steamstatic.com/steam/apps/730/ss_92c05c1cb1319beb15ed92c63b6b1d6f261d2f64.1920x1080.jpg?t=1668125812"), (7, "https://cdn.akamai.steamstatic.com/steam/apps/730/ss_3cef516c1a3c338f2554f3f11790aba3b7c0add7.1920x1080.jpg?t=1668125812"), (7, "https://cdn.akamai.steamstatic.com/steam/apps/730/ss_60b4f959497899515f46012df805b0006ef21af6.1920x1080.jpg?t=1668125812");

insert into game (game_name, game_series, publisher_id, release_date, game_description) values
("Grand Theft Auto IV: Complete Edition", "Grand Theft Auto", 2, "2008-04-29", "This definitive Grand Theft Auto bundle boasts hundreds of hours of single-player gameplay; a full suite of open-world multiplayer game types limited only by players’ creativity; dozens of eclectic radio stations with hours of music and original dialogue"),
("Grand Theft Auto V", "Grand Theft Auto", 2, "2015-04-14", "When a young street hustler, a retired bank robber and a terrifying psychopath find themselves entangled with some of the most frightening and deranged elements of the criminal underworld, the U.S. government and the entertainment industry, they must pull off a series of dangerous heists to survive in a ruthless city in which they can trust nobody, least of all each other."),
("L.A. Noire", "L.A. Noire", 2, "2011-11-08", "Using groundbreaking new animation technology, MotionScan, that captures every nuance of an actor's facial performance in astonishing detail, L.A. Noire is a violent crime thriller that blends breathtaking action with true detective work to deliver an unprecedented interactive experience. Search for clues, chase down suspects and interrogate witnesses as you struggle to find the truth in a city where everyone has something to hide."),
("Max Payne", "Max Payne", 2, "2001-07-25", "Max Payne is a man with nothing to lose in the violent, cold urban night. A fugitive undercover cop framed for murder, hunted by cops and the mob, Max is a man with his back against the wall, fighting a battle he cannot hope to win. Max Payne is a relentless story-driven game about a man on the edge, fighting to clear his name while struggling to uncover the truth about his slain family amongst a myriad of plot-twists and twisted thugs in the gritty bowels of New York during the century's worst blizzard."),
("Max Payne 2: The Fall of Max Payne", "Max Payne", 2, "2003-10-14", "Max Payne 2: The Fall of Max Payne is a violent, film-noir love story. Dark, tragic and intense, the in-depth story is a thrill-ride of shocking twists and revelations."),
("Max Payne 3", "Max Payne", 2, "2012-06-01", "No longer a cop, close to washed up and addicted to pain killers, Max takes a job in São Paulo, Brazil, protecting the family of wealthy real estate mogul Rodrigo Branco, in an effort to finally escape his troubled past. But as events spiral out of his control, Max Payne finds himself alone on the streets of an unfamiliar city, desperately searching for the truth and fighting for a way out."),
("Red Dead Redemption 2", "Red Dead Redemption", 2, "2019-12-05", "Arthur Morgan and the Van der Linde gang are outlaws on the run. With federal agents and the best bounty hunters in the nation massing on their heels, the gang must rob, steal and fight their way across the rugged heartland of America in order to survive. As deepening internal divisions threaten to tear the gang apart, Arthur must make a choice between his own ideals and loyalty to the gang who raised him.");
insert into game_tags (game_id, tag) values
(8, "Open World"), (8, "Action"), (8, "Racing"),
(9, "Open World"), (9, "Action"), (9, "Multiplayer"), (9, "Racing"), (9, "Crime"),
(10, "Detective"), (10, "Crime"), (10, "Open World"), (10, "Noir"), (10, "Adventure"),
(11, "Action"), (11, "Noir"), (11, "Classic"), (11, "Third-Person Shooter"), 
(12, "Action"), (12, "Noir"), (12, "Classic"), (12, "Third-Person Shooter"), 
(13, "Action"), (13, "Noir"), (13, "Third-Person Shooter"), (13, "Story Rich"),
(14, "Open World"), (14, "Story Rich"), (14, "Adventure"), (14, "Western");
insert into game_screenshots (game_id, screenshot) values
(8, "https://cdn.akamai.steamstatic.com/steam/apps/901583/ss_b44b3cc92cdc53383a2a42829d113814d966cdb3.1920x1080.jpg?t=1509997232"), (8, "https://cdn.akamai.steamstatic.com/steam/apps/901583/ss_48011acf4f9f9c81cdd7fb6e7aa1d694b819783b.1920x1080.jpg?t=1509997232"), (8, "https://cdn.akamai.steamstatic.com/steam/apps/901583/ss_c08df65a9bbed9636b5f030f5b3780cc37992566.1920x1080.jpg?t=1509997232"), (8, "https://cdn.akamai.steamstatic.com/steam/apps/901583/ss_0f61e8ba1b4a52dab7b4c0759a8c61131b566459.1920x1080.jpg?t=1509997232"), (8, "https://cdn.akamai.steamstatic.com/steam/apps/901583/ss_f99cd452de8f15d8db9522e5281444aebf8bfd14.1920x1080.jpg?t=1509997232"), (8, "https://cdn.akamai.steamstatic.com/steam/apps/901583/ss_40e9525788096d5d5bc6b7c35158b9eb4df34891.1920x1080.jpg?t=1509997232"), 
(9, "https://cdn.akamai.steamstatic.com/steam/apps/271590/ss_32aa18ab3175e3002217862dd5917646d298ab6b.1920x1080.jpg?t=1678296348"), (9, "https://cdn.akamai.steamstatic.com/steam/apps/271590/ss_2744f112fa060320d191a50e8b3a92441a648a56.1920x1080.jpg?t=1678296348"), (9, "https://cdn.akamai.steamstatic.com/steam/apps/271590/ss_da39c16db175f6973770bae6b91d411251763152.1920x1080.jpg?t=1678296348"), (9, "https://cdn.akamai.steamstatic.com/steam/apps/271590/ss_bd5db78286be0a7c6b2c62519099a9e27e6b06f3.1920x1080.jpg?t=1678296348"), (9, "https://cdn.akamai.steamstatic.com/steam/apps/271590/ss_b1a1cb7959d6a0e6fcb2d06ebf97a66c9055cef3.1920x1080.jpg?t=1678296348"), (9, "https://cdn.akamai.steamstatic.com/steam/apps/271590/ss_bc5fc79d3366c837372327717249a4887aa46d63.1920x1080.jpg?t=1678296348"), (9, "https://cdn.akamai.steamstatic.com/steam/apps/271590/ss_d2eb9d3e50f9e4cb8db37d2976990b3795da8187.1920x1080.jpg?t=1678296348"), (9, "https://cdn.akamai.steamstatic.com/steam/apps/271590/ss_bd944debbec9936769f6dfb39ee456ca605615e3.1920x1080.jpg?t=1678296348"), (9, "https://cdn.akamai.steamstatic.com/steam/apps/271590/ss_66daaa8e0416b805ffb9a853235e21468d6b85bc.1920x1080.jpg?t=1678296348"), (9, "https://cdn.akamai.steamstatic.com/steam/apps/271590/ss_3820844756ae43340809e247fea327025dca1e39.1920x1080.jpg?t=1678296348"), 
(10, "https://cdn.akamai.steamstatic.com/steam/apps/110800/ss_f76d95ebe8940377460838a6e09d42120c9214b3.1920x1080.jpg?t=1648581040"), (10, "https://cdn.akamai.steamstatic.com/steam/apps/110800/ss_4f4fb0ecc8d8e94215f604a3b9ed229034d40bbd.1920x1080.jpg?t=1648581040"), (10, "https://cdn.akamai.steamstatic.com/steam/apps/110800/ss_155cd1693d8c033395d388b83693b6100caecedc.1920x1080.jpg?t=1648581040"), (10, "https://cdn.akamai.steamstatic.com/steam/apps/110800/ss_1a056176128202e4d9d9921746b81a214da84324.1920x1080.jpg?t=1648581040"), (10, "https://cdn.akamai.steamstatic.com/steam/apps/110800/ss_900b5313b3e7e087ba945a0851719d448dd95e63.1920x1080.jpg?t=1648581040"), (10, "https://cdn.akamai.steamstatic.com/steam/apps/110800/ss_943769823bd292f7ac1f2b76be58bc0cc61d0491.1920x1080.jpg?t=1648581040"), (10, "https://cdn.akamai.steamstatic.com/steam/apps/110800/ss_559016b579a212504533287a28cd1642cdbacf05.1920x1080.jpg?t=1648581040"), (10, "https://cdn.akamai.steamstatic.com/steam/apps/110800/ss_301a5d01af31af7bbfa606bced413b91fdbe0bcb.1920x1080.jpg?t=1648581040"), (10, "https://cdn.akamai.steamstatic.com/steam/apps/110800/ss_6118b481b60060602dc4159f89895cf00ecaeadb.1920x1080.jpg?t=1648581040"), (10, "https://cdn.akamai.steamstatic.com/steam/apps/110800/ss_3703f2cc34090a0aa6e7f52e1831fdfad01d71ee.1920x1080.jpg?t=1648581040"), (10, "https://cdn.akamai.steamstatic.com/steam/apps/110800/ss_be5a2b8a99bb40964e623ce6a9b30b996fa54cd8.1920x1080.jpg?t=1648581040"), (10, "https://cdn.akamai.steamstatic.com/steam/apps/110800/ss_8078b5dc36bc17f1de4be3a7b2576efa733608c3.1920x1080.jpg?t=1648581040"), (10, "https://cdn.akamai.steamstatic.com/steam/apps/110800/ss_2ffb8b5a34935dcc9d77727496bf878b158d6414.1920x1080.jpg?t=1648581040"), (10, "https://cdn.akamai.steamstatic.com/steam/apps/110800/ss_45b3bf7eb1728f88750a0e87601d2a3d6589a505.1920x1080.jpg?t=1648581040"), 
(11, "https://cdn.akamai.steamstatic.com/steam/apps/12140/0000003256.1920x1080.jpg?t=1618852800"), (11, "https://cdn.akamai.steamstatic.com/steam/apps/12140/0000003257.1920x1080.jpg?t=1618852800"), (11, "https://cdn.akamai.steamstatic.com/steam/apps/12140/0000003258.1920x1080.jpg?t=1618852800"), (11, "https://cdn.akamai.steamstatic.com/steam/apps/12140/0000003259.1920x1080.jpg?t=1618852800"), (11, "https://cdn.akamai.steamstatic.com/steam/apps/12140/0000003260.1920x1080.jpg?t=1618852800"), (11, "https://cdn.akamai.steamstatic.com/steam/apps/12140/0000003261.1920x1080.jpg?t=1618852800"), (11, "https://cdn.akamai.steamstatic.com/steam/apps/12140/0000003262.1920x1080.jpg?t=1618852800"), (11, "https://cdn.akamai.steamstatic.com/steam/apps/12140/0000003263.1920x1080.jpg?t=1618852800"), (11, "https://cdn.akamai.steamstatic.com/steam/apps/12140/0000003264.1920x1080.jpg?t=1618852800"), (11, "https://cdn.akamai.steamstatic.com/steam/apps/12140/0000003265.1920x1080.jpg?t=1618852800"), 
(12, "https://cdn.akamai.steamstatic.com/steam/apps/12150/0000003271.1920x1080.jpg?t=1618852824"), (12, "https://cdn.akamai.steamstatic.com/steam/apps/12150/0000003272.1920x1080.jpg?t=1618852824"), (12, "https://cdn.akamai.steamstatic.com/steam/apps/12150/0000003273.1920x1080.jpg?t=1618852824"), (12, "https://cdn.akamai.steamstatic.com/steam/apps/12150/0000003274.1920x1080.jpg?t=1618852824"), 
(13, "https://cdn.akamai.steamstatic.com/steam/apps/204100/ss_84fc2ba217ce04ec4b782f9f5ccc09d20980f220.1920x1080.jpg?t=1619108680"), (13, "https://cdn.akamai.steamstatic.com/steam/apps/204100/ss_b442d79fbc45be2cb773d3de6f7b40fa5f126588.1920x1080.jpg?t=1619108680"), (13, "https://cdn.akamai.steamstatic.com/steam/apps/204100/ss_4ae054ce0dd3563aea20d8f76630ea4caff878d2.1920x1080.jpg?t=1619108680"), (13, "https://cdn.akamai.steamstatic.com/steam/apps/204100/ss_6e329c5ed6d471c55ef7e04c9aac309005bfa734.1920x1080.jpg?t=1619108680"), (13, "https://cdn.akamai.steamstatic.com/steam/apps/204100/ss_649a56eff153bd1ffe46795f5f20775b3625f96f.1920x1080.jpg?t=1619108680"), (13, "https://cdn.akamai.steamstatic.com/steam/apps/204100/ss_4fc1bd43a6a2d09617706b8dd85900edf293a711.1920x1080.jpg?t=1619108680"), (13, "https://cdn.akamai.steamstatic.com/steam/apps/204100/ss_6a62487932b5cba0f0190a4dc552b3cb38e19028.1920x1080.jpg?t=1619108680"), (13, "https://cdn.akamai.steamstatic.com/steam/apps/204100/ss_351fd2a6f0d8766772c37d8a0edd6b33719dd17d.1920x1080.jpg?t=1619108680"), 
(14, "https://cdn.akamai.steamstatic.com/steam/apps/1174180/ss_66b553f4c209476d3e4ce25fa4714002cc914c4f.1920x1080.jpg?t=1671485009"), (14, "https://cdn.akamai.steamstatic.com/steam/apps/1174180/ss_bac60bacbf5da8945103648c08d27d5e202444ca.1920x1080.jpg?t=1671485009"), (14, "https://cdn.akamai.steamstatic.com/steam/apps/1174180/ss_668dafe477743f8b50b818d5bbfcec669e9ba93e.1920x1080.jpg?t=1671485009"), (14, "https://cdn.akamai.steamstatic.com/steam/apps/1174180/ss_4ce07ae360b166f0f650e9a895a3b4b7bf15e34f.1920x1080.jpg?t=1671485009"), (14, "https://cdn.akamai.steamstatic.com/steam/apps/1174180/ss_d1a8f5a69155c3186c65d1da90491fcfd43663d9.1920x1080.jpg?t=1671485009");

insert into game (game_name, game_series, publisher_id, release_date, game_description) values
("Sonic Adventure 2", "Sonic", 3, "2012-11-19", "The hunt for the Chaos Emeralds is on and battle lines have been drawn between Hero and Dark. Experience two unique adventures featuring both long-time heroes and new and returning villains as they battle for the fate of the world!"),
("Sonic Mania", "Sonic", 3, "2017-08-29", "The ultimate celebration of past and future. An all-new adventure with Sonic, Tails and Knuckles full of unique bosses, rolling 2D landscapes, and fun classic gameplay. Sonic Mania brings retro fast-paced platforming into the future through pixel perfect 2D graphics running at 60FPS"),
("Sonic Frontiers", "Sonic", 3, "2022-11-08", "Worlds are colliding in Sonic the Hedgehog’s newest high-speed adventure! In search of the missing Chaos emeralds, Sonic becomes stranded on an ancient island teeming with unusual creatures. Battle hordes of powerful enemies as you explore a breathtaking world of action, adventure, and mystery. Accelerate to new heights and experience the thrill of high-velocity, open-zone platforming freedom as you race across the five massive Starfall Islands. Jump into adventure, wield the power of the Ancients, and fight to stop these new mysterious foes. Welcome to the evolution of Sonic games!"),
("Persona 4 Golden", "Persona", 3, "2020-06-13", "Inaba—a quiet town in rural Japan sets the scene for budding adolescence in Persona 4 Golden. A coming of age story that sets the protagonist and his friends on a journey kickstarted by a chain of serial murders. Explore meeting kindred spirits, feelings of belonging, and even confronting the darker sides of one’s self."),
("Persona 5 Royal", "Persona", 3, "2022-10-21", "Prepare for the award-winning RPG experience in this definitive edition of Persona 5 Royal, featuring a treasure trove of downloadable content included!"),
("Yakuza 0", "Yakuza", 3, "2018-08-01", "Yakuza 0 is one of the most eccentric, idiosyncratic and downright charming games around… There's simply nothing else quite like it, and it's well worth your time."),
("Yakuza Kiwami", "Yakuza", 3, "2019-02-19", "2005… Akira Nishikiyama has become a changed man. Yumi is nowhere to be found. Ten billion yen has gone missing from the Tojo Clan's coffers, putting the organization on the brink of civil war. And Kazuma Kiryu is released from prison to a world he no longer recognizes."),
("Yakuza: Like a Dragon", "Yakuza", 3, "2020-11-10", "Ichiban Kasuga, a low-ranking grunt of a low-ranking yakuza family in Tokyo, faces an 18-year prison sentence after taking the fall for a crime he didn't commit. Never losing faith, he loyally serves his time and returns to society to discover that no one was waiting for him on the outside, and his clan has been destroyed by the man he respected most. Ichiban sets out to discover the truth behind his family's betrayal and take his life back, drawing a ragtag group of society’s outcasts to his side: Adachi, a rogue cop, Nanba, a homeless ex-nurse, and Saeko, a hostess on a mission. Together, they are drawn into a conflict brewing beneath the surface in Yokohama and must rise to become the heroes they never expected to be.");
insert into game_tags (game_id, tag) values
(15, "Action"), (15, "Platformer"), (15, "Adventure"),
(16, "2D"), (16, "Playformer"), (16, "Retro"), (16, "Action"),
(17, "Adventure"), (17, "Open World"), (17, "Action"),
(18, "RPG"), (18, "Story Rick"),
(19, "RPG"), (19, "Action"), (19, "Story Rich"),
(20, "Story Rich"), (20, "Action"), (20, "Beat 'em up"),
(21, "Action"), (21, "Adventure"), (21, "Story Rich"), (21, "RPG"), (21, "Crime"),
(22, "RPG"), (22, "Adventure"), (22, "Action"), (22, "Story Rich");
insert into game_screenshots (game_id, screenshot) values
(15, "https://cdn.akamai.steamstatic.com/steam/apps/213610/ss_4be4624b9d7f049129f83113074ebf335e193539.1920x1080.jpg?t=1669906865"), (15, "https://cdn.akamai.steamstatic.com/steam/apps/213610/ss_9b764e4b2062a8227060795b4f2ef8933e34a406.1920x1080.jpg?t=1669906865"), (15, "https://cdn.akamai.steamstatic.com/steam/apps/213610/ss_0ac1eb686b38128e2740bc56ce0e2052e3ced2c7.1920x1080.jpg?t=1669906865"), (15, "https://cdn.akamai.steamstatic.com/steam/apps/213610/ss_90a1671625c5965dbfdb4ef6b31d5a6b6b222935.1920x1080.jpg?t=1669906865"), (15, "https://cdn.akamai.steamstatic.com/steam/apps/213610/ss_87dda4f135b2417b1ec2bcda1c29f1f42f52f0fa.1920x1080.jpg?t=1669906865"), (15, "https://cdn.akamai.steamstatic.com/steam/apps/213610/ss_68e3178af290aa67b341a8b0a24126371ec410e6.1920x1080.jpg?t=1669906865"), (15, "https://cdn.akamai.steamstatic.com/steam/apps/213610/ss_be83e02d1570e764c53211359215b4c8f69de5ab.1920x1080.jpg?t=1669906865"), (15, "https://cdn.akamai.steamstatic.com/steam/apps/213610/ss_ece952523b8dbc00dd21051be1a3df35e47f4e7a.1920x1080.jpg?t=1669906865"), (15, "https://cdn.akamai.steamstatic.com/steam/apps/213610/ss_41cc8da77b695cb0be4523ffe7ce694d5cfc5799.1920x1080.jpg?t=1669906865"), 
(16, "https://cdn.akamai.steamstatic.com/steam/apps/584400/ss_27efb8f61892a9bd732952c76dae9dd7ad1b6748.1920x1080.jpg?t=1669906775"), (16, "https://cdn.akamai.steamstatic.com/steam/apps/584400/ss_93ee106db863c16e00989ad9d51bcbea4af91ab0.1920x1080.jpg?t=1669906775"), (16, "https://cdn.akamai.steamstatic.com/steam/apps/584400/ss_72b7374ba1d4978c2b5e7c74c2e56aecc33b0d3c.1920x1080.jpg?t=1669906775"), (16, "https://cdn.akamai.steamstatic.com/steam/apps/584400/ss_5168ae3cd4e0ccac9808325242ccb2e6760ee2f0.1920x1080.jpg?t=1669906775"), (16, "https://cdn.akamai.steamstatic.com/steam/apps/584400/ss_1e19c5bd7aaada51a7811f8468f5fb71cf42f3f7.1920x1080.jpg?t=1669906775"), 
(17, "https://cdn.akamai.steamstatic.com/steam/apps/1237320/ss_8ac5bfdc998b20e4a54ee27b68ef175f7cd9f1a9.1920x1080.jpg?t=1678200169"), (17, "https://cdn.akamai.steamstatic.com/steam/apps/1237320/ss_d9c769a9346e5b1d7e1f9109d0c317c81213c021.1920x1080.jpg?t=1678200169"), (17, "https://cdn.akamai.steamstatic.com/steam/apps/1237320/ss_45369645d9c1c1b1fd9483b48c8a15f21b8693c5.1920x1080.jpg?t=1678200169"), (17, "https://cdn.akamai.steamstatic.com/steam/apps/1237320/ss_cddd10b31502d648f964c5df550499d041212759.1920x1080.jpg?t=1678200169"), (17, "https://cdn.akamai.steamstatic.com/steam/apps/1237320/ss_b355860697bafd2a16e77b97be27ffaf5c9b6609.1920x1080.jpg?t=1678200169"), (17, "https://cdn.akamai.steamstatic.com/steam/apps/1237320/ss_e115f40d130f010908ba4208ac769ad695d91406.1920x1080.jpg?t=1678200169"), (17, "https://cdn.akamai.steamstatic.com/steam/apps/1237320/ss_2b77ee8ba5497f29409d1110dd3010161be3da91.1920x1080.jpg?t=1678200169"), (17, "https://cdn.akamai.steamstatic.com/steam/apps/1237320/ss_9817ace7705cf9096bde3fae0141055d170fbf66.1920x1080.jpg?t=1678200169"), 
(18, "https://cdn.akamai.steamstatic.com/steam/apps/1113000/ss_eaa97afeaed3e89d3032e8bb60cb8d6f331f241d.1920x1080.jpg?t=1679398793"), (18, "https://cdn.akamai.steamstatic.com/steam/apps/1113000/ss_c92cef1e572183055dab3d8bcdcbc5fe55deb0cc.1920x1080.jpg?t=1679398793"), (18, "https://cdn.akamai.steamstatic.com/steam/apps/1113000/ss_949196116c67aa963863a94def5a810a6d12979c.1920x1080.jpg?t=1679398793"), (18, "https://cdn.akamai.steamstatic.com/steam/apps/1113000/ss_e772d1ad98a07b52e4434ef0fe1e8251e5908629.1920x1080.jpg?t=1679398793"), (18, "https://cdn.akamai.steamstatic.com/steam/apps/1113000/ss_b5e00d6660011d7f729b3c3a8467ac1d6821a032.1920x1080.jpg?t=1679398793"), (18, "https://cdn.akamai.steamstatic.com/steam/apps/1113000/ss_cdce2c78607ed827eb1a65f7d141c440584e9616.1920x1080.jpg?t=1679398793"), (18, "https://cdn.akamai.steamstatic.com/steam/apps/1113000/ss_3dba5ab7bf955a8369c37402d59b54e92d88024d.1920x1080.jpg?t=1679398793"), (18, "https://cdn.akamai.steamstatic.com/steam/apps/1113000/ss_a6dc3d5fb905cfc13f50bc4c3a30478d9f83f4cd.1920x1080.jpg?t=1679398793"), 
(19, "https://cdn.akamai.steamstatic.com/steam/apps/1687950/ss_663171dc3afce8fe987e57e8659f91b69faa39bc.1920x1080.jpg?t=1679398700"), (19, "https://cdn.akamai.steamstatic.com/steam/apps/1687950/ss_a3258aba84ae2f2ff13a02a160f7495bfc152adb.1920x1080.jpg?t=1679398700"), (19, "https://cdn.akamai.steamstatic.com/steam/apps/1687950/ss_ddcc016b8e5c434ccbd1a89c0157ce73acf905ae.1920x1080.jpg?t=1679398700"), (19, "https://cdn.akamai.steamstatic.com/steam/apps/1687950/ss_63d2164bf39a43905e9602381f43a9ad4ab46dea.1920x1080.jpg?t=1679398700"), (19, "https://cdn.akamai.steamstatic.com/steam/apps/1687950/ss_38d09e40dd56df43a1bb083dc94e27cb1360b526.1920x1080.jpg?t=1679398700"), (19, "https://cdn.akamai.steamstatic.com/steam/apps/1687950/ss_56f354736174fdb01b7b295b587ca72ca9254df7.1920x1080.jpg?t=1679398700"), (19, "https://cdn.akamai.steamstatic.com/steam/apps/1687950/ss_cfa96c0c9a983689b48cc679ddc63cfe373c2b9a.1920x1080.jpg?t=1679398700"), (19, "https://cdn.akamai.steamstatic.com/steam/apps/1687950/ss_ed4f15d50417a60b5d4b712c8eb0ea1d8ba876bc.1920x1080.jpg?t=1679398700"), 
(20, "https://cdn.akamai.steamstatic.com/steam/apps/638970/ss_673bf61e19a07e6e0301b71b26d121281822c782.1920x1080.jpg?t=1671625198"), (20, "https://cdn.akamai.steamstatic.com/steam/apps/638970/ss_0b59c9984364e73a4d4413f50884d0ead3c81ab1.1920x1080.jpg?t=1671625198"), (20, "https://cdn.akamai.steamstatic.com/steam/apps/638970/ss_644c85a24f6d2710acc927072a30f70841ea955f.1920x1080.jpg?t=1671625198"), (20, "https://cdn.akamai.steamstatic.com/steam/apps/638970/ss_8c1431af6d1ae4a6ee3bdd10e326a7822713b24f.1920x1080.jpg?t=1671625198"), (20, "https://cdn.akamai.steamstatic.com/steam/apps/638970/ss_bcda5d10659c03acb555330d6059681c3cdc72ee.1920x1080.jpg?t=1671625198"), (20, "https://cdn.akamai.steamstatic.com/steam/apps/638970/ss_9b8553753141d10eca4a496d9187edb04221cd29.1920x1080.jpg?t=1671625198"), (20, "https://cdn.akamai.steamstatic.com/steam/apps/638970/ss_3bcb648adcef82e720f8e678dbe98c9a189cdb77.1920x1080.jpg?t=1671625198"), (20, "https://cdn.akamai.steamstatic.com/steam/apps/638970/ss_c2d149633c58b59db5c8947cb8f710d437e86e8d.1920x1080.jpg?t=1671625198"), (20, "https://cdn.akamai.steamstatic.com/steam/apps/638970/ss_6a9abd6c744125f0bd9958cd017e2cffcdf79a8f.1920x1080.jpg?t=1671625198"), (20, "https://cdn.akamai.steamstatic.com/steam/apps/638970/ss_0dc6c8021bef526e49c3a552f71542cc5842003d.1920x1080.jpg?t=1671625198"), 
(21, "https://cdn.akamai.steamstatic.com/steam/apps/834530/ss_1d5134f2ffb5d19573380160f959f521fb1d3bdc.1920x1080.jpg?t=1671625294"), (21, "https://cdn.akamai.steamstatic.com/steam/apps/834530/ss_071dd419bb2ecf637a8680e8684b93ffb2a29907.1920x1080.jpg?t=1671625294"), (21, "https://cdn.akamai.steamstatic.com/steam/apps/834530/ss_b4d58157e78c6f84b4da9654ca134682845fe7af.1920x1080.jpg?t=1671625294"), (21, "https://cdn.akamai.steamstatic.com/steam/apps/834530/ss_ea37b10029d36781a7fa550f983f7adae349fa3a.1920x1080.jpg?t=1671625294"), (21, "https://cdn.akamai.steamstatic.com/steam/apps/834530/ss_c39895853874a53d4236ef26ea5670842a7ae82f.1920x1080.jpg?t=1671625294"), (21, "https://cdn.akamai.steamstatic.com/steam/apps/834530/ss_9253faef697628fac9e4640f6acde4de6b5d8de2.1920x1080.jpg?t=1671625294"), (21, "https://cdn.akamai.steamstatic.com/steam/apps/834530/ss_e6d1538fe4537e47afd84bd058e301e08d52cdfd.1920x1080.jpg?t=1671625294"), (21, "https://cdn.akamai.steamstatic.com/steam/apps/834530/ss_f66826fdf4775f4980e85e09d11d217b47409eb9.1920x1080.jpg?t=1671625294"), (21, "https://cdn.akamai.steamstatic.com/steam/apps/834530/ss_1684866b3772c9977beaf82b23f294828cbb26d7.1920x1080.jpg?t=1671625294"), 
(22, "https://cdn.akamai.steamstatic.com/steam/apps/1235140/ss_3672df00523861cd37b0f969d80604003ba14fd4.1920x1080.jpg?t=1677167527"), (22, "https://cdn.akamai.steamstatic.com/steam/apps/1235140/ss_9cecfb713527a480f607bbde54c01763b18bf354.1920x1080.jpg?t=1677167527"), (22, "https://cdn.akamai.steamstatic.com/steam/apps/1235140/ss_d8bcb8c72368ec09506d3a60d42ff2a1901e39f7.1920x1080.jpg?t=1677167527"), (22, "https://cdn.akamai.steamstatic.com/steam/apps/1235140/ss_23d607ec8ceaca26edc88b6445d92ddcd111fea4.1920x1080.jpg?t=1677167527"), (22, "https://cdn.akamai.steamstatic.com/steam/apps/1235140/ss_66151ac4259635b4f90e7945706498dacf6e98c1.1920x1080.jpg?t=1677167527"), (22, "https://cdn.akamai.steamstatic.com/steam/apps/1235140/ss_b7336fc083ba36c6073c25659fe23075234b179a.1920x1080.jpg?t=1677167527"), (22, "https://cdn.akamai.steamstatic.com/steam/apps/1235140/ss_8562245f8ca68976ffb5404023d148fb0cbc13e9.1920x1080.jpg?t=1677167527"), (22, "https://cdn.akamai.steamstatic.com/steam/apps/1235140/ss_fe349bb52fa4a8243ba8d9b861bb52c3a4f4b5b0.1920x1080.jpg?t=1677167527"), (22, "https://cdn.akamai.steamstatic.com/steam/apps/1235140/ss_a46dfebb4726aa042c76636131f8bbaa1a079fb9.1920x1080.jpg?t=1677167527"), (22, "https://cdn.akamai.steamstatic.com/steam/apps/1235140/ss_5a17b24cc9582e458a3db0f5f9ecc3f956ded072.1920x1080.jpg?t=1677167527"), (22, "https://cdn.akamai.steamstatic.com/steam/apps/1235140/ss_d3fe630add22247a497f0c2d22e568df66a39f48.1920x1080.jpg?t=1677167527");

insert into users (e_mail, pass, nickname, picture, moderator, playing) values
("hanker@gmail.com", "hanker", "Hanker", "https://avatars.akamai.steamstatic.com/b660292585f2e6c04f514456708d0930a3f8d4b3_full.jpg", true, null),
("abuba@gmail.com", "abuba", "Abuba K", "https://avatars.akamai.steamstatic.com/0b101c2e578125d4135905f7fff872f6cdbe3798_full.jpg", false, 7),
("cosmin@gmail.com", "cosmin", "CosminPerRam", "https://avatars.akamai.steamstatic.com/8fbf661c8a9abdbfe89f5cf9e7d4407f793edae0_full.jpg", false, 20),
("codex@gmail.com", "codex", "CODEX", "https://avatars.akamai.steamstatic.com/a96717ad9ae0f8f7a1937c302b529e4fb9479afd_full.jpg", true, null), 
("krissu@gmail.com", "krissu", "KriSSu09", "https://avatars.akamai.steamstatic.com/37445a24418a0122b00ba13a010dc1927610b096_full.jpg", false, 19);
insert into owned_games (user_id, game_id) values 
(1, 1), (1, 2), (1, 3), (1, 5), (1, 7), (1, 9), (1, 11), (1, 12), (1, 15), (1, 16), (1, 17), (1, 18), (1, 19), (1, 20),
(2, 1), (2, 2), (2, 4), (2, 5), (2, 6), (2, 7), (2, 8), (2, 9), (2, 14), (2, 20), (2, 21), (2, 22),
(3, 1), (3, 2), (3, 4), (3, 5), (3, 7), (3, 11), (3, 12), (3, 13), (3, 15), (3, 16), (3, 17), (3, 20),
(4, 1), (4, 4), (4, 7), (4, 8), (4, 9), (4, 10), (4, 12), (4, 13), (4, 14), (4, 18), (4, 19),
(5, 6), (5, 7), (5, 8), (5, 9), (5, 11), (5, 12), (5, 13), (5, 14), (5, 19);
insert into games_history (user_id, game_id) values
(1, 11), (1, 19),
(2, 7), (2, 1), (2, 20), (2, 6),
(3, 20), (3, 12), (3, 13), (3, 17), (3, 5),
(5, 19), (5, 11), (5, 6);
insert into friends (user_id, friend_id) values
(1, 2), (1, 4), (3, 4), (3, 5), (4, 5),
(2, 1), (4, 1), (4, 3), (5, 3), (5, 4);

select * from users