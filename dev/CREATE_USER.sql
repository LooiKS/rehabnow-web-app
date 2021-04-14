-- var sqls = '';
-- users.forEach((user)=>{
--     var sql = `INSERT INTO app_user 
-- 	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
-- 	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
-- 	VALUES 
-- 	('password', '03/03/2021', '${user.login.username}', '${user.login.username}@rehabnow.com', '${user.location.street.name}', '${user.location.city}', '${user.location.country}', '${user.registered.date}', '${user.dob.date}', '${user.name.first}', '${user.gender}', 
-- 	'${user.id.value}', '${user.name.last}', '${user.nat}', '${user.phone}', '${user.location.postcode}', '${user.location.state}', 'active', '${user.picture.large}', false);`;
-- sqls += sql;
-- });

-- INSERT INTO APP_PHYSIOTHERAPIST (PHYSIOTHERAPIST_ID) 
-- (
-- SELECT ID FROM APP_USER
-- ORDER BY ID ASC
-- LIMIT 20);

-- INSERT INTO APP_PATIENT (PATIENT_ID, PHYSIOTHERAPIST_ID) 
-- (
-- SELECT ID, 'angrybutterfly553' FROM APP_USER
-- WHERE ID NOT IN (SELECT PHYSIOTHERAPIST_ID FROM APP_PHYSIOTHERAPIST));

-- UPDATE APP_PATIENT SET PHYSIOTHERAPIST_ID = 'bluekoala549'
-- WHERE PATIENT_ID IN (
-- 	SELECT PATIENT_ID FROM APP_PATIENT 
-- 	WHERE PHYSIOTHERAPIST_ID = 'angryleopard130'
-- );

-- DELETE FROM APP_PHYSIOTHERAPIST;

INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'organicswan953', 'organicswan953@rehabnow.com', 'Filistin Cd', 'Manisa', 'Turkey', '2005-04-29T22:34:55.451Z', '1963-03-31T14:23:16.590Z', 'Ayşe', 'female', 
	'null', 'Çörekçi', 'TR', '(164)-304-4214', '40134', 'Sivas', 'active', 'https://randomuser.me/api/portraits/women/53.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'organicelephant468', 'organicelephant468@rehabnow.com', 'North Street', 'Exeter', 'United Kingdom', '2009-12-24T13:56:25.849Z', '1990-12-21T11:25:34.847Z', 'Alexandra', 'female', 
	'AA 40 66 10 W', 'Garcia', 'GB', '017687 72356', 'ZR56 8XS', 'Cheshire', 'active', 'https://randomuser.me/api/portraits/women/54.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'whitemouse909', 'whitemouse909@rehabnow.com', 'Baselaarsstraat', 'Krommenie', 'Netherlands', '2007-10-26T20:29:09.419Z', '1978-04-13T17:21:39.509Z', 'Lammie', 'female', 
	'59057664', 'Schopman', 'NL', '(639)-120-2443', '14535', 'Zeeland', 'active', 'https://randomuser.me/api/portraits/women/51.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'sadlion942', 'sadlion942@rehabnow.com', 'Korkeavuorenkatu', 'Sotkamo', 'Finland', '2014-04-24T15:53:17.458Z', '1982-01-10T00:18:39.376Z', 'Sofia', 'female', 
	'NaNNA812undefined', 'Hamalainen', 'FI', '05-819-865', '86964', 'South Karelia', 'active', 'https://randomuser.me/api/portraits/women/58.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'tinyrabbit192', 'tinyrabbit192@rehabnow.com', 'Mill Road', 'Armagh', 'United Kingdom', '2014-06-20T04:08:26.815Z', '1974-11-08T15:12:32.801Z', 'Rosie', 'female', 
	'MK 74 45 87 V', 'Parker', 'GB', '019467 45994', 'N8 4TP', 'West Sussex', 'active', 'https://randomuser.me/api/portraits/women/35.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'orangeleopard415', 'orangeleopard415@rehabnow.com', 'Rue des Écoles', 'Mulhouse', 'France', '2009-06-14T06:27:17.902Z', '1964-01-09T23:08:17.423Z', 'Tom', 'male', 
	'1NNaN34003353 93', 'Thomas', 'FR', '03-30-82-44-74', '79797', 'Cher', 'active', 'https://randomuser.me/api/portraits/men/38.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'ticklishostrich232', 'ticklishostrich232@rehabnow.com', 'Hickory Creek Dr', 'Dumas', 'United States', '2003-07-25T05:40:50.311Z', '1990-01-24T09:02:24.947Z', 'Maxine', 'female', 
	'466-44-1892', 'Carlson', 'US', '(853)-147-1324', '93500', 'California', 'active', 'https://randomuser.me/api/portraits/women/31.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'tinygoose481', 'tinygoose481@rehabnow.com', 'Istiklal Cd', 'Tokat', 'Turkey', '2011-01-11T20:41:19.236Z', '1980-05-10T06:57:55.264Z', 'Vedat', 'male', 
	'null', 'Orbay', 'TR', '(708)-181-8999', '64238', 'Ordu', 'active', 'https://randomuser.me/api/portraits/men/50.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'organicgoose741', 'organicgoose741@rehabnow.com', 'Fairview St', 'Busselton', 'Australia', '2003-03-08T18:50:59.690Z', '1966-08-04T09:36:08.718Z', 'Troy', 'male', 
	'628877721', 'Moore', 'AU', '01-7100-6721', '2394', 'New South Wales', 'active', 'https://randomuser.me/api/portraits/men/86.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'angrysnake867', 'angrysnake867@rehabnow.com', 'Mariagervej', 'Ryslinge', 'Denmark', '2014-03-04T11:43:29.462Z', '1985-05-15T10:43:55.643Z', 'Sara', 'female', 
	'150585-2484', 'Petersen', 'DK', '48410320', '74219', 'Syddanmark', 'active', 'https://randomuser.me/api/portraits/women/63.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'silvermeercat422', 'silvermeercat422@rehabnow.com', 'شهید شهرام امیری', 'مشهد', 'Iran', '2007-06-26T19:31:55.945Z', '1958-07-16T05:05:20.842Z', 'کوروش', 'male', 
	'null', 'کوتی', 'IR', '006-35968784', '35418', 'فارس', 'active', 'https://randomuser.me/api/portraits/men/54.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'silverbear987', 'silverbear987@rehabnow.com', 'West Street', 'Westminster', 'United Kingdom', '2017-01-12T22:07:09.675Z', '1959-09-27T06:59:50.787Z', 'Rick', 'male', 
	'ML 27 33 57 B', 'Rodriguez', 'GB', '015242 52877', 'KG74 0BQ', 'Northumberland', 'active', 'https://randomuser.me/api/portraits/men/64.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'smallgoose334', 'smallgoose334@rehabnow.com', 'Park Road', 'Laytown-Bettystown-Mornington', 'Ireland', '2017-06-13T20:01:25.891Z', '1993-01-26T01:23:34.501Z', 'Donna', 'female', 
	'8719650T', 'Bailey', 'IE', '071-603-8140', '43067', 'Westmeath', 'active', 'https://randomuser.me/api/portraits/women/30.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'whiteleopard834', 'whiteleopard834@rehabnow.com', 'Pyynikintie', 'Kontiolahti', 'Finland', '2013-05-04T09:17:08.641Z', '1997-02-17T04:27:54.343Z', 'Anton', 'male', 
	'NaNNA505undefined', 'Kyllo', 'FI', '09-328-745', '22586', 'Central Ostrobothnia', 'active', 'https://randomuser.me/api/portraits/men/96.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'yellowrabbit780', 'yellowrabbit780@rehabnow.com', 'Kirchweg', 'Reutlingen', 'Germany', '2002-03-21T19:45:39.463Z', '1997-02-28T10:59:56.073Z', 'Helge', 'male', 
	'null', 'Kuschel', 'DE', '0890-5396085', '28580', 'Niedersachsen', 'active', 'https://randomuser.me/api/portraits/men/65.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'sadmouse783', 'sadmouse783@rehabnow.com', 'Øvreseterveien', 'Trolldalen', 'Norway', '2012-08-09T14:38:42.102Z', '1956-09-28T08:02:46.416Z', 'Emmeline', 'female', 
	'28095618008', 'Sikveland', 'NO', '73193655', '7481', 'Møre og Romsdal', 'active', 'https://randomuser.me/api/portraits/women/89.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'bigpeacock243', 'bigpeacock243@rehabnow.com', 'Birkemosevej', 'Stoevring', 'Denmark', '2014-02-20T18:16:43.209Z', '1952-12-15T02:45:31.522Z', 'Magnus', 'male', 
	'151252-5640', 'Rasmussen', 'DK', '42439135', '99439', 'Sjælland', 'active', 'https://randomuser.me/api/portraits/men/11.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'goldensnake205', 'goldensnake205@rehabnow.com', 'Bulevardi', 'Sund', 'Finland', '2005-02-01T23:07:54.592Z', '1969-05-02T04:26:42.865Z', 'Hilla', 'female', 
	'NaNNA850undefined', 'Linna', 'FI', '05-860-007', '16638', 'Kymenlaakso', 'active', 'https://randomuser.me/api/portraits/women/82.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'blueswan928', 'blueswan928@rehabnow.com', 'Wiri Station Road', 'Invercargill', 'New Zealand', '2014-08-25T13:42:00.255Z', '1969-05-08T02:05:20.589Z', 'Jacob', 'male', 
	'null', 'Wang', 'NZ', '(098)-481-7481', '12762', 'Nelson', 'active', 'https://randomuser.me/api/portraits/men/6.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'purplefrog658', 'purplefrog658@rehabnow.com', 'Necatibey Cd', 'Elazığ', 'Turkey', '2009-01-10T12:38:31.206Z', '1983-04-03T06:50:26.826Z', 'Nalan', 'female', 
	'null', 'Ekşioğlu', 'TR', '(625)-687-7809', '80046', 'Bilecik', 'active', 'https://randomuser.me/api/portraits/women/79.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'heavysnake141', 'heavysnake141@rehabnow.com', 'Hatanpään Valtatie', 'Asikkala', 'Finland', '2009-12-26T05:02:41.438Z', '1992-03-06T11:38:21.030Z', 'Iina', 'female', 
	'NaNNA564undefined', 'Hanka', 'FI', '05-472-269', '32639', 'Southern Ostrobothnia', 'active', 'https://randomuser.me/api/portraits/women/63.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'purpleleopard511', 'purpleleopard511@rehabnow.com', 'Manchester Street', 'Napier', 'New Zealand', '2004-09-16T03:24:55.018Z', '1956-07-04T13:47:00.596Z', 'Emily', 'female', 
	'null', 'Harris', 'NZ', '(338)-763-3382', '15873', 'Northland', 'active', 'https://randomuser.me/api/portraits/women/15.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'goldenfrog380', 'goldenfrog380@rehabnow.com', 'Trollvannsveien', 'Slidre', 'Norway', '2006-06-13T10:51:46.202Z', '1973-09-05T03:54:40.708Z', 'Aisha', 'female', 
	'05097349691', 'Røgeberg', 'NO', '84247533', '4088', 'Hordaland', 'active', 'https://randomuser.me/api/portraits/women/77.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'tinymouse176', 'tinymouse176@rehabnow.com', 'Fatih Sultan Mehmet Cd', 'Yozgat', 'Turkey', '2005-10-12T13:36:17.550Z', '1947-06-30T11:38:33.529Z', 'Okan', 'male', 
	'null', 'Nebioğlu', 'TR', '(111)-626-9911', '83866', 'Mardin', 'active', 'https://randomuser.me/api/portraits/men/70.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'crazygoose969', 'crazygoose969@rehabnow.com', 'Dorfstraße', 'Wriezen', 'Germany', '2013-06-09T10:14:55.155Z', '1963-10-08T23:35:05.375Z', 'Lotte', 'female', 
	'null', 'Benner', 'DE', '0309-9693425', '57129', 'Sachsen-Anhalt', 'active', 'https://randomuser.me/api/portraits/women/17.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'whitepeacock173', 'whitepeacock173@rehabnow.com', 'Reijolankatu', 'Ilmajoki', 'Finland', '2012-05-15T10:03:25.648Z', '1994-12-18T21:02:49.509Z', 'Siiri', 'female', 
	'NaNNA174undefined', 'Niskanen', 'FI', '08-337-973', '17050', 'Päijät-Häme', 'active', 'https://randomuser.me/api/portraits/women/61.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'lazypeacock712', 'lazypeacock712@rehabnow.com', 'Rue de LÉglise', 'Aubervilliers', 'France', '2009-10-05T05:27:10.894Z', '1949-06-18T11:42:40.492Z', 'Marion', 'female', 
	'2NNaN00543902 24', 'Adam', 'FR', '04-40-00-57-90', '54820', 'Aube', 'active', 'https://randomuser.me/api/portraits/women/25.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'lazyostrich883', 'lazyostrich883@rehabnow.com', 'Place de LAbbé-Jean-Lebeuf', 'Caen', 'France', '2011-09-01T10:23:29.752Z', '1967-07-31T11:06:43.046Z', 'Eliot', 'male', 
	'1NNaN50434319 12', 'Durand', 'FR', '02-13-76-92-35', '87246', 'Calvados', 'active', 'https://randomuser.me/api/portraits/men/58.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'heavyleopard345', 'heavyleopard345@rehabnow.com', 'E North St', 'Tamworth', 'Australia', '2012-05-12T05:47:44.356Z', '1986-02-10T15:11:25.422Z', 'Don', 'male', 
	'794797355', 'Roberts', 'AU', '06-2935-9037', '5665', 'Queensland', 'active', 'https://randomuser.me/api/portraits/men/2.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'whitezebra768', 'whitezebra768@rehabnow.com', 'Maple Ave', 'Chipman', 'Canada', '2003-10-20T23:03:25.445Z', '1957-09-26T23:55:09.721Z', 'Marilou', 'female', 
	'null', 'Liu', 'CA', '004-718-0712', 'P1W 7S5', 'New Brunswick', 'active', 'https://randomuser.me/api/portraits/women/60.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'bigfish600', 'bigfish600@rehabnow.com', 'Tryvannsveien', 'Helgelandsmoen', 'Norway', '2004-01-04T05:52:52.423Z', '1974-08-24T16:45:04.358Z', 'Frank', 'male', 
	'24087419394', 'Thon', 'NO', '54847596', '8047', 'Sogn og Fjordane', 'active', 'https://randomuser.me/api/portraits/men/74.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'brownmeercat584', 'brownmeercat584@rehabnow.com', 'دماوند', 'پاکدشت', 'Iran', '2006-05-18T13:23:55.459Z', '1951-01-23T02:40:03.104Z', 'آوینا', 'female', 
	'null', 'موسوی', 'IR', '072-01296796', '76021', 'اردبیل', 'active', 'https://randomuser.me/api/portraits/women/44.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'whitecat417', 'whitecat417@rehabnow.com', 'Avenida de América', 'Orihuela', 'Spain', '2017-07-08T15:33:19.804Z', '1998-08-31T15:39:11.289Z', 'Gloria', 'female', 
	'52502108-F', 'Castro', 'ES', '915-936-987', '72417', 'Navarra', 'active', 'https://randomuser.me/api/portraits/women/57.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'yellowdog143', 'yellowdog143@rehabnow.com', 'Spring St', 'Boston', 'United States', '2011-02-22T03:22:10.203Z', '1981-10-22T05:03:25.013Z', 'Dawn', 'female', 
	'961-73-6757', 'Andrews', 'US', '(921)-379-1676', '11854', 'Arizona', 'active', 'https://randomuser.me/api/portraits/women/48.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'crazysnake728', 'crazysnake728@rehabnow.com', 'Rue du Bât-DArgent', 'Provence', 'Switzerland', '2012-06-24T13:35:01.603Z', '1963-12-02T16:48:44.529Z', 'Veronica', 'female', 
	'756.0124.9021.33', 'Nguyen', 'CH', '078 704 62 98', '3205', 'Zug', 'active', 'https://randomuser.me/api/portraits/women/11.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'redbear467', 'redbear467@rehabnow.com', 'Rue du Stade', 'Orléans', 'France', '2002-03-30T04:39:58.040Z', '1974-10-11T20:47:09.291Z', 'Nora', 'female', 
	'2NNaN24892842 63', 'Laurent', 'FR', '01-53-17-87-20', '43465', 'Seine-et-Marne', 'active', 'https://randomuser.me/api/portraits/women/38.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'tinyfrog115', 'tinyfrog115@rehabnow.com', 'Bağdat Cd', 'Kilis', 'Turkey', '2018-02-14T07:35:07.517Z', '1962-12-10T07:04:56.698Z', 'Eren', 'male', 
	'null', 'Nalbantoğlu', 'TR', '(910)-226-2830', '64662', 'Sakarya', 'active', 'https://randomuser.me/api/portraits/men/92.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'redladybug844', 'redladybug844@rehabnow.com', 'Bağdat Cd', 'Bilecik', 'Turkey', '2005-02-23T07:44:50.022Z', '1998-08-10T12:12:15.452Z', 'Ülkü', 'female', 
	'null', 'Erçetin', 'TR', '(876)-825-2385', '11433', 'Kırıkkale', 'active', 'https://randomuser.me/api/portraits/women/56.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'bigbutterfly969', 'bigbutterfly969@rehabnow.com', 'Itsenäisyydenkatu', 'Ulvila', 'Finland', '2007-05-22T04:43:13.710Z', '1946-12-09T16:36:32.589Z', 'Aada', 'female', 
	'NaNNA708undefined', 'Nikula', 'FI', '06-005-759', '10473', 'Southern Savonia', 'active', 'https://randomuser.me/api/portraits/women/18.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'smallgorilla483', 'smallgorilla483@rehabnow.com', 'Rotuaari', 'Miehikkälä', 'Finland', '2012-02-09T03:30:04.215Z', '1965-10-03T08:00:27.489Z', 'Leo', 'male', 
	'NaNNA593undefined', 'Jutila', 'FI', '02-525-480', '10844', 'Åland', 'active', 'https://randomuser.me/api/portraits/men/4.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'ticklishkoala945', 'ticklishkoala945@rehabnow.com', 'Rue de LAbbé-Grégoire', 'Vex', 'Switzerland', '2007-08-02T08:38:41.823Z', '1959-02-24T22:41:08.821Z', 'Grégory', 'male', 
	'756.4322.5592.12', 'Morin', 'CH', '076 123 99 35', '7617', 'Bern', 'active', 'https://randomuser.me/api/portraits/men/28.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'purplerabbit787', 'purplerabbit787@rehabnow.com', 'Avenida de Castilla', 'Fuenlabrada', 'Spain', '2011-04-21T19:58:24.694Z', '1978-12-13T00:19:14.575Z', 'Antonia', 'female', 
	'31537484-X', 'Gutierrez', 'ES', '983-246-551', '56132', 'Aragón', 'active', 'https://randomuser.me/api/portraits/women/53.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'blackgorilla254', 'blackgorilla254@rehabnow.com', 'Satakennankatu', 'Muonio', 'Finland', '2016-08-03T05:32:49.119Z', '1974-07-28T13:31:40.889Z', 'Amanda', 'female', 
	'NaNNA590undefined', 'Kauppi', 'FI', '09-270-168', '33798', 'Northern Ostrobothnia', 'active', 'https://randomuser.me/api/portraits/women/53.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'goldenpanda951', 'goldenpanda951@rehabnow.com', 'Albert Road', 'Dunboyne', 'Ireland', '2011-04-14T14:31:20.148Z', '1980-12-27T00:56:06.993Z', 'Leah', 'female', 
	'8339900T', 'Murray', 'IE', '071-313-5937', '58668', 'Galway', 'active', 'https://randomuser.me/api/portraits/women/78.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'crazycat462', 'crazycat462@rehabnow.com', 'Place Paul-Duquaire', 'Dagmersellen', 'Switzerland', '2009-08-20T23:05:28.187Z', '1954-01-07T06:42:14.840Z', 'Anouk', 'female', 
	'756.0573.0101.45', 'Dumont', 'CH', '078 515 73 60', '2599', 'Valais', 'active', 'https://randomuser.me/api/portraits/women/90.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'goldenpeacock163', 'goldenpeacock163@rehabnow.com', 'Locust Rd', 'Mackay', 'Australia', '2019-07-21T19:24:48.473Z', '1974-03-18T04:55:55.632Z', 'Eleanor', 'female', 
	'139108127', 'Williams', 'AU', '03-7019-7334', '5990', 'Australian Capital Territory', 'active', 'https://randomuser.me/api/portraits/women/66.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'orangewolf364', 'orangewolf364@rehabnow.com', 'Damveien', 'Nypan', 'Norway', '2014-06-08T23:13:07.798Z', '1947-09-18T03:15:36.261Z', 'Nathalie', 'female', 
	'18094728416', 'Krasniqi', 'NO', '86502789', '2640', 'Buskerud', 'active', 'https://randomuser.me/api/portraits/women/34.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'lazylion549', 'lazylion549@rehabnow.com', 'Stevens Creek Blvd', 'Warragul', 'Australia', '2005-02-24T01:14:27.030Z', '1976-06-04T13:28:29.554Z', 'Edna', 'female', 
	'089442515', 'Howell', 'AU', '09-0960-9754', '8999', 'Tasmania', 'active', 'https://randomuser.me/api/portraits/women/21.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'goldenfish239', 'goldenfish239@rehabnow.com', 'The Grove', 'Kinsealy-Drinan', 'Ireland', '2018-10-30T15:03:47.996Z', '1994-08-25T09:16:54.526Z', 'Brent', 'male', 
	'6803555T', 'Sullivan', 'IE', '021-983-6051', '62228', 'South Dublin', 'active', 'https://randomuser.me/api/portraits/men/26.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'bluekoala549', 'bluekoala549@rehabnow.com', 'Pilestredet Park', 'Drammen', 'Norway', '2007-06-11T04:17:00.864Z', '1969-03-22T03:10:54.303Z', 'Audun', 'male', 
	'22036936987', 'Sætre', 'NO', '33746675', '6220', 'Description', 'active', 'https://randomuser.me/api/portraits/men/21.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'happyduck812', 'happyduck812@rehabnow.com', 'Vænget', 'Horsens', 'Denmark', '2014-02-11T22:34:54.055Z', '1955-05-04T06:05:28.338Z', 'Rosa', 'female', 
	'040555-0677', 'Pedersen', 'DK', '77627981', '26812', 'Nordjylland', 'active', 'https://randomuser.me/api/portraits/women/50.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'goldengorilla472', 'goldengorilla472@rehabnow.com', 'High Street', 'Preston', 'United Kingdom', '2013-05-13T12:44:53.429Z', '1983-05-05T08:17:15.074Z', 'Jeffery', 'male', 
	'CM 39 66 90 T', 'Garcia', 'GB', '013873 97516', 'KI4 7EA', 'Herefordshire', 'active', 'https://randomuser.me/api/portraits/men/63.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'angryrabbit476', 'angryrabbit476@rehabnow.com', 'Fitzgerald Avenue', 'Napier', 'New Zealand', '2014-07-09T08:15:16.057Z', '1997-04-14T15:42:16.089Z', 'Aaliyah', 'female', 
	'null', 'Zhang', 'NZ', '(638)-221-8246', '56388', 'Northland', 'active', 'https://randomuser.me/api/portraits/women/73.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'silvergoose488', 'silvergoose488@rehabnow.com', 'Calle de Atocha', 'Santiago de Compostela', 'Spain', '2012-09-08T16:01:11.818Z', '1946-05-11T00:11:54.457Z', 'Adrian', 'male', 
	'00488735-L', 'Herrera', 'ES', '921-707-018', '96254', 'Comunidad Valenciana', 'active', 'https://randomuser.me/api/portraits/men/62.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'redkoala686', 'redkoala686@rehabnow.com', 'Schulstraße', 'Altdorf Bei Nürnberg', 'Germany', '2012-11-18T01:51:45.073Z', '1991-04-04T23:18:38.676Z', 'Lidwina', 'female', 
	'null', 'Scheffler', 'DE', '0115-4994218', '40368', 'Saarland', 'active', 'https://randomuser.me/api/portraits/women/64.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'angryleopard130', 'angryleopard130@rehabnow.com', 'West Ave', 'Hampton', 'Canada', '2009-12-10T06:49:50.766Z', '1986-07-14T07:57:52.075Z', 'Dominic', 'male', 
	'null', 'Côté', 'CA', '503-785-6959', 'C1S 4K7', 'Saskatchewan', 'active', 'https://randomuser.me/api/portraits/men/60.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'beautifulgorilla420', 'beautifulgorilla420@rehabnow.com', 'Rue Dubois', 'Amiens', 'France', '2011-12-08T21:41:16.185Z', '1966-05-23T14:10:39.288Z', 'Adam', 'male', 
	'1NNaN81735450 11', 'Dumas', 'FR', '02-86-87-46-17', '91160', 'Haute-Corse', 'active', 'https://randomuser.me/api/portraits/men/21.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'orangeduck900', 'orangeduck900@rehabnow.com', 'دکتر علی شریعتی', 'کرج', 'Iran', '2015-11-10T15:48:12.733Z', '1966-11-18T17:07:38.867Z', 'سارا', 'female', 
	'null', 'سلطانی نژاد', 'IR', '086-02871432', '93946', 'البرز', 'active', 'https://randomuser.me/api/portraits/women/9.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'redbutterfly321', 'redbutterfly321@rehabnow.com', 'Rua São Luiz ', 'Brasília', 'Brazil', '2010-05-27T09:54:20.556Z', '1966-12-20T20:29:15.564Z', 'Ariadne', 'female', 
	'null', 'Fogaça', 'BR', '(09) 0218-9879', '57425', 'Amazonas', 'active', 'https://randomuser.me/api/portraits/women/47.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'redgoose399', 'redgoose399@rehabnow.com', 'Degnevænget', 'Klitmøller', 'Denmark', '2012-09-05T19:56:52.666Z', '1998-05-20T04:19:53.996Z', 'Laura', 'female', 
	'200598-3726', 'Poulsen', 'DK', '55604988', '72230', 'Syddanmark', 'active', 'https://randomuser.me/api/portraits/women/9.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'smallwolf131', 'smallwolf131@rehabnow.com', 'Rue Pierre-Delore', 'Tours', 'France', '2016-12-01T20:03:51.709Z', '1959-07-20T10:11:37.737Z', 'Constance', 'female', 
	'2NNaN54506830 63', 'Rolland', 'FR', '03-03-19-41-36', '25290', 'Bas-Rhin', 'active', 'https://randomuser.me/api/portraits/women/16.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'redkoala858', 'redkoala858@rehabnow.com', 'Rue des Ecrivains', 'Homberg', 'Switzerland', '2006-05-18T00:05:26.225Z', '1962-04-29T00:36:10.588Z', 'Viktoria', 'female', 
	'756.9088.3445.71', 'Fabre', 'CH', '078 939 69 82', '4621', 'Schaffhausen', 'active', 'https://randomuser.me/api/portraits/women/15.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'blackladybug851', 'blackladybug851@rehabnow.com', 'W 6th St', 'Boise', 'United States', '2011-12-09T23:43:30.491Z', '1970-11-25T13:41:40.130Z', 'Jon', 'male', 
	'352-15-7583', 'Peck', 'US', '(282)-844-8005', '48330', 'Hawaii', 'active', 'https://randomuser.me/api/portraits/men/32.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'angrysnake461', 'angrysnake461@rehabnow.com', 'New North Road', 'Masterton', 'New Zealand', '2016-08-05T08:36:27.035Z', '1983-07-23T07:54:39.040Z', 'Chloe', 'female', 
	'null', 'Edwards', 'NZ', '(415)-050-7611', '63582', 'Nelson', 'active', 'https://randomuser.me/api/portraits/women/59.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'greendog116', 'greendog116@rehabnow.com', 'Helgesvej', 'Vipperød', 'Denmark', '2012-02-09T01:58:30.797Z', '1978-02-09T02:50:54.814Z', 'Johan', 'male', 
	'090278-2343', 'Sørensen', 'DK', '65285253', '47772', 'Danmark', 'active', 'https://randomuser.me/api/portraits/men/61.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'lazyfish785', 'lazyfish785@rehabnow.com', 'Honthorsterweg', 'Dinxperlo', 'Netherlands', '2006-07-01T08:47:18.460Z', '1996-02-18T16:46:34.453Z', 'Jurre', 'male', 
	'03184361', 'Samuels', 'NL', '(923)-373-4030', '98584', 'Friesland', 'active', 'https://randomuser.me/api/portraits/men/63.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'happykoala372', 'happykoala372@rehabnow.com', 'Guyton Street', 'Gisborne', 'New Zealand', '2013-09-02T09:52:38.677Z', '1977-08-02T01:55:24.559Z', 'Caitlin', 'female', 
	'null', 'Thomas', 'NZ', '(939)-234-0318', '40839', 'Waikato', 'active', 'https://randomuser.me/api/portraits/women/14.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'yellowtiger157', 'yellowtiger157@rehabnow.com', 'South Street', 'Wicklow', 'Ireland', '2011-09-28T03:36:14.851Z', '1959-11-02T04:19:40.520Z', 'Stephen', 'male', 
	'4876416T', 'Powell', 'IE', '071-902-6883', '31914', 'Longford', 'active', 'https://randomuser.me/api/portraits/men/75.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'bigostrich965', 'bigostrich965@rehabnow.com', 'Römerstraße', 'Schierbrok', 'Germany', '2003-03-19T15:02:23.291Z', '1978-06-13T18:24:06.525Z', 'Milka', 'female', 
	'null', 'Hofer', 'DE', '0675-8583168', '95601', 'Hamburg', 'active', 'https://randomuser.me/api/portraits/women/57.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'smallbear422', 'smallbear422@rehabnow.com', 'Oaks Cross', 'Preston', 'United Kingdom', '2015-12-06T14:14:41.353Z', '1946-03-30T14:04:09.282Z', 'Lily', 'female', 
	'HP 02 24 47 P', 'Elliott', 'GB', '013873 10659', 'RB5J 0PT', 'South Yorkshire', 'active', 'https://randomuser.me/api/portraits/women/94.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'purplegoose731', 'purplegoose731@rehabnow.com', 'Rua Dezesseis de Maio', 'Divinópolis', 'Brazil', '2003-10-05T00:34:38.405Z', '1961-11-02T05:31:56.622Z', 'Olivier', 'male', 
	'null', 'Duarte', 'BR', '(76) 8586-6851', '94810', 'Mato Grosso do Sul', 'active', 'https://randomuser.me/api/portraits/men/60.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'crazylion949', 'crazylion949@rehabnow.com', 'Galway Road', 'Cork', 'Ireland', '2017-06-30T07:39:10.739Z', '1973-06-12T23:24:36.617Z', 'Curtis', 'male', 
	'8969940T', 'Evans', 'IE', '011-852-1361', '86727', 'Clare', 'active', 'https://randomuser.me/api/portraits/men/24.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'purplebear949', 'purplebear949@rehabnow.com', 'Faunveien', 'Åkrehamn', 'Norway', '2016-06-03T20:45:21.368Z', '1958-02-01T09:16:42.064Z', 'Vebjørn', 'male', 
	'01025802361', 'Yildirim', 'NO', '86293614', '6456', 'Nordland', 'active', 'https://randomuser.me/api/portraits/men/58.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'crazydog177', 'crazydog177@rehabnow.com', 'Rua Quinze de Novembro ', 'Londrina', 'Brazil', '2004-04-06T08:54:55.231Z', '1965-01-14T01:04:49.248Z', 'Aléxis', 'male', 
	'null', 'Dias', 'BR', '(40) 5917-6947', '77043', 'Pernambuco', 'active', 'https://randomuser.me/api/portraits/men/5.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'greenkoala230', 'greenkoala230@rehabnow.com', 'Lindenweg', 'Limbach-Oberfrohna', 'Germany', '2016-08-03T21:08:59.715Z', '1990-03-09T13:17:24.386Z', 'Nathalie', 'female', 
	'null', 'Tetzlaff', 'DE', '0511-4430439', '89235', 'Baden-Württemberg', 'active', 'https://randomuser.me/api/portraits/women/79.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'whitelion201', 'whitelion201@rehabnow.com', 'Main Road', 'Newry', 'United Kingdom', '2015-11-21T04:44:49.420Z', '1981-11-03T12:29:09.715Z', 'Miguel', 'male', 
	'TP 17 59 58 T', 'Hunter', 'GB', '0113672 910 0698', 'U30 9TA', 'Tyne and Wear', 'active', 'https://randomuser.me/api/portraits/men/15.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'angrybutterfly553', 'angrybutterfly553@rehabnow.com', 'Park Lane', 'Belfast', 'United Kingdom', '2004-04-02T23:22:49.447Z', '1990-02-18T15:03:58.325Z', 'Chloe', 'female', 
	'WP 95 07 23 L', 'Russell', 'GB', '017687 77346', 'VL56 0FU', 'Highlands and Islands', 'active', 'https://randomuser.me/api/portraits/women/92.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'redbutterfly800', 'redbutterfly800@rehabnow.com', 'Rue de la Barre', 'Metz', 'France', '2007-09-17T03:33:25.460Z', '1980-04-23T01:43:04.163Z', 'Maëlle', 'female', 
	'2NNaN76568432 87', 'Noel', 'FR', '01-16-52-69-18', '88739', 'Mayenne', 'active', 'https://randomuser.me/api/portraits/women/41.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'brownbear657', 'brownbear657@rehabnow.com', 'Rua Dom Pedro Ii ', 'Juazeiro do Norte', 'Brazil', '2006-12-08T03:42:56.306Z', '1964-08-02T02:33:15.471Z', 'Sândi', 'female', 
	'null', 'Barbosa', 'BR', '(30) 0568-5991', '31463', 'Mato Grosso', 'active', 'https://randomuser.me/api/portraits/women/68.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'bluefrog586', 'bluefrog586@rehabnow.com', 'Præstevænget', 'Samsø', 'Denmark', '2019-06-17T04:55:56.420Z', '1981-04-29T02:55:25.295Z', 'Andreas', 'male', 
	'290481-2553', 'Johansen', 'DK', '99723034', '45411', 'Nordjylland', 'active', 'https://randomuser.me/api/portraits/men/95.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'bluetiger674', 'bluetiger674@rehabnow.com', 'Visiokatu', 'Vantaa', 'Finland', '2003-08-13T13:14:35.471Z', '1970-06-19T10:16:04.785Z', 'Milla', 'female', 
	'NaNNA836undefined', 'Hakala', 'FI', '07-559-857', '57769', 'Åland', 'active', 'https://randomuser.me/api/portraits/women/73.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'goldenladybug341', 'goldenladybug341@rehabnow.com', 'The Grove', 'Kells', 'Ireland', '2002-05-11T23:19:23.502Z', '1945-12-11T03:15:00.062Z', 'Zoe', 'female', 
	'3377185T', 'Davies', 'IE', '011-452-4491', '42757', 'Cork', 'active', 'https://randomuser.me/api/portraits/women/40.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'beautifulladybug415', 'beautifulladybug415@rehabnow.com', 'Kingsway', 'Stoke-on-Trent', 'United Kingdom', '2008-10-29T13:04:01.760Z', '1982-08-06T14:35:42.906Z', 'Vicky', 'female', 
	'LS 71 29 60 E', 'Parker', 'GB', '0110811 658 7015', 'U0 2YL', 'Central', 'active', 'https://randomuser.me/api/portraits/women/80.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'whitebear107', 'whitebear107@rehabnow.com', 'Presidentgata', 'Ringstad', 'Norway', '2010-10-04T14:58:07.414Z', '1945-11-20T05:36:00.239Z', 'Zakariya', 'male', 
	'20114510999', 'Vanvik', 'NO', '64794238', '6447', 'Description', 'active', 'https://randomuser.me/api/portraits/men/85.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'silvercat361', 'silvercat361@rehabnow.com', 'Northaven Rd', 'Baltimore', 'United States', '2011-02-13T15:40:34.080Z', '1962-11-05T05:44:43.107Z', 'Violet', 'female', 
	'740-76-4242', 'Ray', 'US', '(838)-004-9131', '26813', 'North Dakota', 'active', 'https://randomuser.me/api/portraits/women/10.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'bigfrog236', 'bigfrog236@rehabnow.com', 'North Street', 'Athlone', 'Ireland', '2004-06-16T01:55:02.403Z', '1982-05-23T08:59:19.716Z', 'Ian', 'male', 
	'9508071T', 'Smythe', 'IE', '061-519-3990', '89414', 'Sligo', 'active', 'https://randomuser.me/api/portraits/men/48.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'goldenfrog252', 'goldenfrog252@rehabnow.com', 'New Road', 'Clonmel', 'Ireland', '2012-11-15T17:14:54.174Z', '1959-06-16T11:12:43.486Z', 'Clayton', 'male', 
	'1529379T', 'Williams', 'IE', '071-398-3732', '37619', 'Fingal', 'active', 'https://randomuser.me/api/portraits/men/71.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'greenkoala661', 'greenkoala661@rehabnow.com', 'W Gray St', 'San Diego', 'United States', '2018-01-23T05:58:01.482Z', '1990-01-07T17:51:03.076Z', 'Louis', 'male', 
	'462-93-7317', 'Foster', 'US', '(858)-508-4812', '91434', 'Pennsylvania', 'active', 'https://randomuser.me/api/portraits/men/51.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'brownlion105', 'brownlion105@rehabnow.com', 'Talak Göktepe Cd', 'Kırşehir', 'Turkey', '2008-11-03T11:02:39.511Z', '1945-08-25T09:43:34.936Z', 'Afet', 'female', 
	'null', 'Çetiner', 'TR', '(457)-193-4147', '86437', 'Tunceli', 'active', 'https://randomuser.me/api/portraits/women/96.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'organicdog442', 'organicdog442@rehabnow.com', 'Rua Quinze de Novembro ', 'Ribeirão Pires', 'Brazil', '2011-03-02T20:02:48.223Z', '1949-08-08T02:37:09.044Z', 'Albenisa', 'female', 
	'null', 'Duarte', 'BR', '(42) 9166-5518', '97955', 'Paraná', 'active', 'https://randomuser.me/api/portraits/women/37.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'greenlion767', 'greenlion767@rehabnow.com', 'Gullkroken', 'Mo', 'Norway', '2004-08-20T11:02:21.492Z', '1990-09-07T02:17:13.984Z', 'Jayden', 'male', 
	'07099043983', 'Roberg', 'NO', '85460688', '3071', 'Nordland', 'active', 'https://randomuser.me/api/portraits/men/81.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'tinypanda427', 'tinypanda427@rehabnow.com', 'Talak Göktepe Cd', 'Siirt', 'Turkey', '2007-09-15T15:21:56.451Z', '1951-06-23T09:14:59.825Z', 'Efe', 'male', 
	'null', 'Çamdalı', 'TR', '(297)-820-8641', '62484', 'Kırşehir', 'active', 'https://randomuser.me/api/portraits/men/69.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'tinybutterfly967', 'tinybutterfly967@rehabnow.com', 'Æblehaven', 'Jerslev Sj', 'Denmark', '2018-09-15T07:40:33.667Z', '1995-05-14T03:10:50.498Z', 'Alma', 'female', 
	'140595-4491', 'Jensen', 'DK', '76884300', '19522', 'Midtjylland', 'active', 'https://randomuser.me/api/portraits/women/37.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'goldenpeacock476', 'goldenpeacock476@rehabnow.com', 'Calle de Téllez', 'Barcelona', 'Spain', '2018-05-27T18:37:05.303Z', '1962-12-27T06:19:53.924Z', 'Cesar', 'male', 
	'69464688-S', 'Torres', 'ES', '925-837-614', '52120', 'La Rioja', 'active', 'https://randomuser.me/api/portraits/men/57.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'orangebutterfly809', 'orangebutterfly809@rehabnow.com', 'Tehtaankatu', 'Ruovesi', 'Finland', '2010-09-23T22:02:48.767Z', '1987-09-03T15:31:15.780Z', 'Kerttu', 'female', 
	'NaNNA312undefined', 'Hietala', 'FI', '02-467-849', '34477', 'Uusimaa', 'active', 'https://randomuser.me/api/portraits/women/4.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'yellowzebra927', 'yellowzebra927@rehabnow.com', 'Avenue Joliot Curie', 'Arzier-Le Muids', 'Switzerland', '2009-12-08T08:57:09.286Z', '1967-11-09T11:36:38.769Z', 'Katarzyna', 'female', 
	'756.7254.7573.15', 'Brunet', 'CH', '078 126 48 96', '5977', 'Ticino', 'active', 'https://randomuser.me/api/portraits/women/16.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'heavywolf609', 'heavywolf609@rehabnow.com', 'Rue du 8 Mai 1945', 'Aulnay-sous-Bois', 'France', '2014-11-12T22:43:16.085Z', '1970-01-20T00:29:53.957Z', 'Alyssa', 'female', 
	'2NNaN16211347 40', 'Deschamps', 'FR', '01-41-89-38-53', '63889', 'Haute-Marne', 'active', 'https://randomuser.me/api/portraits/women/74.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'brownsnake101', 'brownsnake101@rehabnow.com', 'High Street', 'Drogheda', 'Ireland', '2012-06-13T08:03:44.807Z', '1960-06-21T07:44:54.100Z', 'Scarlett', 'female', 
	'0343903T', 'Snyder', 'IE', '041-383-7183', '31203', 'Longford', 'active', 'https://randomuser.me/api/portraits/women/78.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'blacklion325', 'blacklion325@rehabnow.com', 'New Street', 'Bath', 'United Kingdom', '2005-03-26T01:18:27.753Z', '1994-09-30T12:02:25.115Z', 'Peter', 'male', 
	'NY 09 24 33 Q', 'Castillo', 'GB', '015395 82287', 'UA6A 1TJ', 'South Yorkshire', 'active', 'https://randomuser.me/api/portraits/men/90.jpg', false);
    
INSERT INTO app_user 
	(password, last_login, id, email, address, city, country, created_dt, dob, first_name, gender, 
	ic_passport, last_name, nationality, phone_num, postcode, state, status, photo, is_admin) 
	VALUES 
	('password', '03/03/2021', 'goldencat607', 'goldencat607@rehabnow.com', 'Carl Grøndahls vei', 'Hesseng', 'Norway', '2005-09-02T09:19:56.920Z', '1970-10-13T15:18:34.153Z', 'Elisa', 'female', 
	'13107039001', 'Friberg', 'NO', '34053228', '2690', 'Sør-Trøndelag', 'active', 'https://randomuser.me/api/portraits/women/94.jpg', false);