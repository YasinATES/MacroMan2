BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "product_category" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"title"	varchar(150) NOT NULL,
	"keywords"	varchar(255) NOT NULL,
	"description"	varchar(255) NOT NULL,
	"image"	varchar(100) NOT NULL,
	"status"	integer NOT NULL,
	"create_at"	datetime NOT NULL,
	"update_at"	datetime NOT NULL,
	"slug"	varchar(50) NOT NULL,
	"parent_id"	integer,
	FOREIGN KEY("parent_id") REFERENCES "product_category"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "product_productimage" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"image"	varchar(100) NOT NULL,
	"create_at"	datetime NOT NULL,
	"update_at"	datetime NOT NULL,
	"product_id"	integer NOT NULL,
	FOREIGN KEY("product_id") REFERENCES "product_product"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "home_kampanya" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"title"	varchar(150) NOT NULL,
	"baslikbir"	varchar(150) NOT NULL,
	"baslikiki"	varchar(150) NOT NULL,
	"yazibir"	varchar(150) NOT NULL,
	"yaziiki"	varchar(150) NOT NULL,
	"yaziuc"	varchar(150) NOT NULL,
	"yazidort"	varchar(150) NOT NULL,
	"indirim"	varchar(150) NOT NULL,
	"create_at"	datetime NOT NULL,
	"update_at"	datetime NOT NULL
);
CREATE TABLE IF NOT EXISTS "home_footer" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"title"	varchar(150) NOT NULL,
	"sirketadi"	varchar(150) NOT NULL,
	"adres"	varchar(150) NOT NULL,
	"telefon"	varchar(150) NOT NULL,
	"mail"	varchar(150) NOT NULL,
	"sosyalmedya"	varchar(150) NOT NULL,
	"hakkimizdakisa"	varchar(150) NOT NULL,
	"haberbir"	varchar(150) NOT NULL,
	"haberesimbir"	varchar(100) NOT NULL,
	"tarihbir"	varchar(150) NOT NULL,
	"haberiki"	varchar(150) NOT NULL,
	"tarihiki"	varchar(150) NOT NULL,
	"haberresimiki"	varchar(100) NOT NULL,
	"create_at"	datetime NOT NULL,
	"update_at"	datetime NOT NULL
);
CREATE TABLE IF NOT EXISTS "home_pagedetail" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"title"	varchar(150) NOT NULL,
	"keywords"	varchar(255) NOT NULL,
	"description"	varchar(255) NOT NULL,
	"image"	varchar(100) NOT NULL,
	"status"	integer NOT NULL,
	"detailone"	text NOT NULL,
	"detailtwo"	text NOT NULL,
	"detailthree"	text NOT NULL,
	"create_at"	datetime NOT NULL,
	"update_at"	datetime NOT NULL
);
CREATE TABLE IF NOT EXISTS "product_product" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"title"	varchar(150) NOT NULL,
	"keywords"	varchar(255) NOT NULL,
	"description"	varchar(255) NOT NULL,
	"image"	varchar(100) NOT NULL,
	"price"	real NOT NULL,
	"amount"	integer NOT NULL,
	"detail"	text NOT NULL,
	"create_at"	datetime NOT NULL,
	"update_at"	datetime NOT NULL,
	"category_id"	integer NOT NULL,
	"status"	integer NOT NULL,
	FOREIGN KEY("category_id") REFERENCES "product_category"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"name"	varchar(150) NOT NULL UNIQUE
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"first_name"	varchar(30) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"last_name"	varchar(150) NOT NULL
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"action_time"	datetime NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag">=0),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL
);
INSERT INTO "product_category" VALUES (1,'Dış Giyim','Dış Giyim','Dış Giyim','images/d3c21ea4f0fb36867b27a9ec800e78ab.jpeg',1,'2019-05-09 22:09:30.158784','2019-05-09 22:09:30.158784','2019-05-14 12:36:54.505733+00:00',NULL);
INSERT INTO "product_category" VALUES (2,'Takım Elbise','Takım Elbise','Takım Elbise','images/d3c21ea4f0fb36867b27a9ec800e78ab_nbXQ90W.jpeg',1,'2019-05-09 22:10:03.770663','2019-05-09 22:10:03.770663','2019-05-14 12:36:54.505733+00:00',NULL);
INSERT INTO "product_category" VALUES (3,'Palto','Palto-Kaban','Palto-Kaban','images/takım_ParAY6K.jpg',1,'2019-05-14 12:39:36.473123','2019-05-14 12:39:36.473123','Palto-Kaban',1);
INSERT INTO "product_category" VALUES (4,'Kot Ceket','Kot Ceket','Kot Ceket','images/takım2_ZEL9Afi.jpg',1,'2019-05-14 12:43:44.686979','2019-05-14 12:43:44.686979','kot-ceket',1);
INSERT INTO "product_productimage" VALUES (1,'images/4A3010000076_LAC_1.jpg','2019-05-14 10:56:39.988773','2019-05-14 10:56:39.988773',6);
INSERT INTO "product_productimage" VALUES (2,'images/takım.jpg','2019-05-14 10:56:46.312682','2019-05-14 10:56:46.312682',6);
INSERT INTO "product_productimage" VALUES (3,'images/takım2.jpg','2019-05-14 10:56:54.019527','2019-05-14 10:56:54.019527',6);
INSERT INTO "product_productimage" VALUES (4,'images/4A3010000076_LAC_1_bwtKQ3V.jpg','2019-05-14 11:06:29.953587','2019-05-14 11:06:29.953587',11);
INSERT INTO "home_kampanya" VALUES (1,'Kampanya','En Gözde Erkek Giyim Ürünleri','Yeni Sezon Ürünler','Kaban','Bırakın takım elbiseniz sizi anlatsın.Bu takım elbiselerden sonra adeta bir yıldız gibi parlayacaksınız. İnsanlar gözlerini sizden alamayacaklar.','Takım Elbise','Bırakın takım elbiseniz sizi anlatsın.Bu takım elbiselerden sonra adeta bir yıldız gibi parlayacaksınız. İnsanlar gözlerini sizden alamayacaklar.','50','2019-05-10 13:50:28.531611','2019-05-10 13:58:07.887824');
INSERT INTO "home_footer" VALUES (1,'Footer','MacroMan Büyük Mağazacılık A.Ş.','100. Yıl Mahallesi 1082. Sokak No:78','+90 505 980 99 99','info@macroman.com','info@macroman.com','Sitemiz ve mağzalarımızla size en güvenlilir şekilde en kaliteli ürünü satmayı hedef alıp sizlerin gönüllerinde taht kuran firma olmak istiyoruz :)','HANGI AYAKKABIYI GIYMELIYIM?','images/haber2.jpg','Ocak 21, 2018','BU YILIN TRENDLERI','Mart 21, 2019','images/haber1.jpg','2019-05-10 14:00:48.357728','2019-05-10 14:00:48.357728');
INSERT INTO "home_pagedetail" VALUES (1,'MacroMan','MacroMan','MacroMan','images/1_QkjIlzS.jpg',1,'<p><img src="https://resimag.com/p1/84f73b9c0de.png" style="height:888px; width:975px" /></p>','<p>Boyner B&uuml;y&uuml;k Mağazacılık A.Ş. T&uuml;rkiye&#39;nin halka a&ccedil;ık gıda ve elektronik dışı en b&uuml;y&uuml;k perakende grubu Boyner Grup&rsquo;un amiral gemisi ve T&uuml;rkiye&rsquo;nin lider mağaza zinciri... 1981&rsquo;de &lsquo;&Ccedil;arşı&rsquo; tabelasıyla Bakırk&ouml;y&rsquo;de a&ccedil;ılan mağazasıyla faaliyetlerine başlayan Boyner, alışveriş d&uuml;nyasını yeniliklerle tanıştırarak, s&uuml;rekli b&uuml;y&uuml;mesini s&uuml;rd&uuml;rd&uuml;. 2013&rsquo;te YKM&rsquo;nin hisselerini alarak, sekt&ouml;rdeki konumuna g&uuml;&ccedil; kattı. Boyner bug&uuml;n &ccedil;ok katlı mağazaları, tek kategoride uzmanlaşmış konsept mağazaları Boyner Sports, YKM Sport, Outlet Mağazaları ve YKM Mağazaları ile 6 farklı mağazacılık konsepti ile T&uuml;rkiye&rsquo;nin 37 ilinde 117&nbsp;mağazası ile hizmet veriyor. Boyner, m&uuml;şterilerine kadın, erkek, &ccedil;ocuk, bebek, gen&ccedil; aktif spor giyimden ayakkabı ve aksesuara, kozmetikten ev dekorasyon &uuml;r&uuml;nlerine kadar farklı kategorideki pek &ccedil;ok yerli ve yabancı marka &uuml;r&uuml;n&uuml; bir arada sunuyor. Ayrıca kadın, erkek, &ccedil;ocuk, gen&ccedil; aktif spor giyim ve ayakkabı kategorilerinde House Of Camellia, Black Pepper, Penford, North Of Navy, Cotton Bar, T-Box, Limon Company, &nbsp;Mammaramma, Monster High, Barbie, Pink &amp; Orange, Funky Rocks, North Of Navy Kids, Limon Company Kids ile sadece Boyner ve YKM&rsquo;lere &ouml;zel markaları ile de d&uuml;nya moda markalarını m&uuml;şterileriyle buluşturuyor. Boyner ve YKM Mağazaları, t&uuml;m lifestyle&nbsp;kategorilerinde m&uuml;şterilerine doğru sezon, marka birliktelikleri, g&ouml;rsel sunum, servis ve m&uuml;kemmel alışveriş d&uuml;zeni ile y&uuml;ksek kaliteli milyonlarca &uuml;r&uuml;n sunarak m&uuml;şterilerinin keyifli alışveriş deneyimi yaşamaları i&ccedil;in hizmet veriyor.</p>

<p><img src="https://www.resimag.com/p1/faf26046c7.png" /></p>

<p>2015&rsquo;te &lsquo;T&uuml;rkiye&rsquo;nin en &ccedil;ok sevilen ve tercih edilen alışveriş markası olma&rsquo; vizyonuyla kapsamlı bir değişim s&uuml;recini başlatan Boyner, &uuml;r&uuml;n ve marka &ccedil;eşitliliğinden m&uuml;şteri deneyimine, tedarik s&uuml;re&ccedil;lerinden satış kanallarına kadar bir&ccedil;ok yeniliği hayata ge&ccedil;iriyor. Yenilik&ccedil;i kimliğiyle e-ticaret alanında da hızla b&uuml;y&uuml;yen Boyner, mağaza ve online alışverişi birleştiren &ldquo;all-line&rdquo; uygulamaları ile yeniliklere imza atıyor.</p>

<p><strong>BİR BAKIŞTA BOYNER B&Uuml;Y&Uuml;K MAĞAZACILIK</strong></p>

<p>&nbsp;</p>

<p>Boyner B&uuml;y&uuml;k Mağazacılık A.Ş. (&quot;Boyner&rdquo;) T&uuml;rkiye&#39;de gıda dışı perakende sekt&ouml;r&uuml;n&uuml;n &ouml;nde gelen gruplarından Boyner Grup&rsquo;un bir &uuml;yesi olarak 1981 yılında faaliyete başladı. İlk Boyner Mağazası, o zamanki adı olan &quot;&Ccedil;arşı&rdquo; tabelası altında Bakırk&ouml;y&#39;de a&ccedil;ıldı.</p>

<p>Ardından Ankara&rsquo;da Kızılay&rsquo;da ve İstanbul Sultanhamam&rsquo;da iki mağaza a&ccedil;ıldı. Bu d&ouml;nemde &Ccedil;arşı Mağazaları tek markalı indirim mağazası olarak &ccedil;alıştı ve kaliteli &uuml;r&uuml;nleri hesaplı fiyatlarla m&uuml;şterilerine sundu.</p>

<p>1985 yılı ile birlikte &Ccedil;arşı Mağazaları hizmet verdiği m&uuml;şteri kitlesini b&uuml;y&uuml;k mağazacılık anlayışına uygun yeniliklerle karşılamaya başladı. Bu anlayışın ilk &uuml;r&uuml;n&uuml; olan Altimod markalı &uuml;r&uuml;nler 1985 yılından itibaren mağazalarda m&uuml;şteri ile buluştu ve &ccedil;ok beğenildi. &Ccedil;arşı&rsquo;nın o g&uuml;nlerdeki hizmet anlayışı m&uuml;şterilerin isteklerini karşılarken m&uuml;şteri lehine ek değer yaratmak olarak tanımlandı. M&uuml;şteri mutluluğunu hedef alan bu anlayış, 1989 yılında T&uuml;rk perakendecilik sekt&ouml;r&uuml;nde bir devrim niteliği taşıyan &Ccedil;arşı Kredi Kartı&rsquo;nın doğmasına yol a&ccedil;tı.</p>

<p><img src="https://www.resimag.com/p1/88958e06c3.png" /></p>

<p><br />
<br />
1990 yılına gelindiğinde artık b&uuml;y&uuml;k mağazacılığın evrensel &uuml;retim ve pazarlama ilkeleriyle y&uuml;r&uuml;yen &ouml;nc&uuml; ve yenilik&ccedil;i mağazalar zincirinin başlangı&ccedil; noktasına gelinmişti. 1991 yılında 7000 metrekarelik alanda a&ccedil;ılan Maslak Mağazası, kadın, erkek, &ccedil;ocuk, ayakkabı, spor giyim ve ev gibi ayrı departmanları ile mağazacılık sekt&ouml;r&uuml;ne yepyeni bir anlayış getirdi.<br />
<br />
Maslak Mağazası&rsquo;nı, alışveriş merkezleri i&ccedil;inde ilk ana mağaza olan &Ccedil;arşı Capitol izledi. 1993 yılında a&ccedil;ılan &Ccedil;arşı Capitol Mağazası, alışveriş merkezi i&ccedil;inde de departmanlı mağazanın başarılı olabileceğinin &ouml;rneğiydi.<br />
<br />
&Ccedil;arşı B&uuml;y&uuml;k Mağazacılık A.Ş bu b&uuml;y&uuml;k mağazaların ardından bir b&uuml;y&uuml;k adım daha attı, bu da başarıyla sonu&ccedil;lanan halka a&ccedil;ılma programı oldu.<br />
<br />
1997 yılında halka a&ccedil;ık ve perakendecilik sekt&ouml;r&uuml;n&uuml;n liderliğine y&uuml;r&uuml;yen &Ccedil;arşı mağazalar zincirine Smart adlı outlet zinciri eklendi.</p>','<table border="1" cellpadding="1" cellspacing="1" style="width:500px">
	<tbody>
		<tr>
			<td>Tel</td>
			<td>0505 980 99 99</td>
		</tr>
		<tr>
			<td>Adres</td>
			<td>Karab&uuml;k</td>
		</tr>
		<tr>
			<td>&Uuml;lke</td>
			<td>T&uuml;rkiye</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>','2019-05-10 05:23:10.555188','2019-05-10 13:06:21.469609');
INSERT INTO "product_product" VALUES (6,'Takım Elbise 012593','Takım Elbise 012593','Takım Elbise 012593','images/1.jpg',1000.0,10,'Takım Elbise 012593','2019-05-09 23:42:12.225024','2019-05-09 23:42:12.225024',2,1);
INSERT INTO "product_product" VALUES (7,'Takım Elbise 013123293','Takım Elbise 013123293','Takım Elbise 013123293','images/2.jpg',2000.0,10,'Takım Elbise 013123293','2019-05-09 23:46:20.481155','2019-05-09 23:46:20.481155',2,1);
INSERT INTO "product_product" VALUES (8,'Takım Elbise A-1','Takım Elbise A-1','Takım Elbise A-1','images/3.jpg',3000.0,10,'Takım Elbise A-1','2019-05-09 23:46:39.401371','2019-05-09 23:46:39.401371',2,1);
INSERT INTO "product_product" VALUES (9,'Takım Elbise 013293B-2','Takım Elbise 013293B-2','Takım Elbise 013293B-2','images/4.jpg',4000.0,10,'Takım Elbise 013293B-2','2019-05-09 23:47:09.290979','2019-05-09 23:47:09.290979',2,1);
INSERT INTO "product_product" VALUES (10,'Takım Elbise 013293B-23','Takım Elbise 013293B-23','Takım Elbise 013293B-23','images/5.jpg',5000.0,10,'Takım Elbise 013293B-23','2019-05-09 23:47:33.011839','2019-05-09 23:47:33.011839',2,1);
INSERT INTO "product_product" VALUES (11,'Takım Elbise 013293B-23','Takım Elbise 013293B-23','Takım Elbise 013293B-23','images/5_COKrGoB.jpg',5000.0,10,'<p>Takım Elbise 013293B-23</p>','2019-05-09 23:47:33.093330','2019-05-14 11:06:29.946592',2,1);
INSERT INTO "django_session" VALUES ('5dcuihh2klzmrljls4dqg1006ujypcbr','YWI3YjJiOTRjOGQxZTc5YTg5MTVlYWNkMDJjYjUxODMxOTZiYjA5YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNzQxZDYxNTBlZGM1MzMxZGFjNmQ5YTc3NzI2OTQ3NDFmZTFmNjhmIn0=','2019-05-23 21:13:27.178551');
INSERT INTO "django_session" VALUES ('bpr73df317l1l6fuqicli0frw5ekzn69','YWI3YjJiOTRjOGQxZTc5YTg5MTVlYWNkMDJjYjUxODMxOTZiYjA5YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNzQxZDYxNTBlZGM1MzMxZGFjNmQ5YTc3NzI2OTQ3NDFmZTFmNjhmIn0=','2019-06-19 05:39:30.465466');
INSERT INTO "auth_user" VALUES (1,'pbkdf2_sha256$150000$ALDgd8Ox952u$6FMrBvKcFVBqI8HrMbi85n21uwpUdRQxKrVEXdH4ILk=','2019-06-05 05:39:30.453480',1,'yasin','','yasin@yasin.com',1,1,'2019-05-09 21:13:06.734021','');
INSERT INTO "auth_permission" VALUES (1,1,'add_category','Can add category');
INSERT INTO "auth_permission" VALUES (2,1,'change_category','Can change category');
INSERT INTO "auth_permission" VALUES (3,1,'delete_category','Can delete category');
INSERT INTO "auth_permission" VALUES (4,1,'view_category','Can view category');
INSERT INTO "auth_permission" VALUES (5,2,'add_product','Can add product');
INSERT INTO "auth_permission" VALUES (6,2,'change_product','Can change product');
INSERT INTO "auth_permission" VALUES (7,2,'delete_product','Can delete product');
INSERT INTO "auth_permission" VALUES (8,2,'view_product','Can view product');
INSERT INTO "auth_permission" VALUES (9,3,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES (10,3,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES (11,3,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES (12,3,'view_logentry','Can view log entry');
INSERT INTO "auth_permission" VALUES (13,4,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES (14,4,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES (15,4,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES (16,4,'view_permission','Can view permission');
INSERT INTO "auth_permission" VALUES (17,5,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES (18,5,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES (19,5,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES (20,5,'view_group','Can view group');
INSERT INTO "auth_permission" VALUES (21,6,'add_user','Can add user');
INSERT INTO "auth_permission" VALUES (22,6,'change_user','Can change user');
INSERT INTO "auth_permission" VALUES (23,6,'delete_user','Can delete user');
INSERT INTO "auth_permission" VALUES (24,6,'view_user','Can view user');
INSERT INTO "auth_permission" VALUES (25,7,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES (26,7,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES (27,7,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES (28,7,'view_contenttype','Can view content type');
INSERT INTO "auth_permission" VALUES (29,8,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES (30,8,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES (31,8,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES (32,8,'view_session','Can view session');
INSERT INTO "auth_permission" VALUES (33,9,'add_category','Can add category');
INSERT INTO "auth_permission" VALUES (34,9,'change_category','Can change category');
INSERT INTO "auth_permission" VALUES (35,9,'delete_category','Can delete category');
INSERT INTO "auth_permission" VALUES (36,9,'view_category','Can view category');
INSERT INTO "auth_permission" VALUES (37,10,'add_pagedetail','Can add page detail');
INSERT INTO "auth_permission" VALUES (38,10,'change_pagedetail','Can change page detail');
INSERT INTO "auth_permission" VALUES (39,10,'delete_pagedetail','Can delete page detail');
INSERT INTO "auth_permission" VALUES (40,10,'view_pagedetail','Can view page detail');
INSERT INTO "auth_permission" VALUES (41,11,'add_footer','Can add footer');
INSERT INTO "auth_permission" VALUES (42,11,'change_footer','Can change footer');
INSERT INTO "auth_permission" VALUES (43,11,'delete_footer','Can delete footer');
INSERT INTO "auth_permission" VALUES (44,11,'view_footer','Can view footer');
INSERT INTO "auth_permission" VALUES (45,12,'add_kampanya','Can add kampanya');
INSERT INTO "auth_permission" VALUES (46,12,'change_kampanya','Can change kampanya');
INSERT INTO "auth_permission" VALUES (47,12,'delete_kampanya','Can delete kampanya');
INSERT INTO "auth_permission" VALUES (48,12,'view_kampanya','Can view kampanya');
INSERT INTO "auth_permission" VALUES (49,13,'add_productimage','Can add product image');
INSERT INTO "auth_permission" VALUES (50,13,'change_productimage','Can change product image');
INSERT INTO "auth_permission" VALUES (51,13,'delete_productimage','Can delete product image');
INSERT INTO "auth_permission" VALUES (52,13,'view_productimage','Can view product image');
INSERT INTO "django_content_type" VALUES (1,'product','category');
INSERT INTO "django_content_type" VALUES (2,'product','product');
INSERT INTO "django_content_type" VALUES (3,'admin','logentry');
INSERT INTO "django_content_type" VALUES (4,'auth','permission');
INSERT INTO "django_content_type" VALUES (5,'auth','group');
INSERT INTO "django_content_type" VALUES (6,'auth','user');
INSERT INTO "django_content_type" VALUES (7,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES (8,'sessions','session');
INSERT INTO "django_content_type" VALUES (9,'home','category');
INSERT INTO "django_content_type" VALUES (10,'home','pagedetail');
INSERT INTO "django_content_type" VALUES (11,'home','footer');
INSERT INTO "django_content_type" VALUES (12,'home','kampanya');
INSERT INTO "django_content_type" VALUES (13,'product','productimage');
INSERT INTO "django_admin_log" VALUES (1,'2019-05-09 22:09:30.160783','1','Dış Giyim','[{"added": {}}]',1,1,1);
INSERT INTO "django_admin_log" VALUES (2,'2019-05-09 22:10:03.771674','2','Takım Elbise','[{"added": {}}]',1,1,1);
INSERT INTO "django_admin_log" VALUES (3,'2019-05-09 22:11:31.406804','1','Takım Elbise 012593','[{"added": {}}]',2,1,1);
INSERT INTO "django_admin_log" VALUES (4,'2019-05-09 23:13:36.014608','2','Takım Elbise 013293','[{"added": {}}]',2,1,1);
INSERT INTO "django_admin_log" VALUES (5,'2019-05-09 23:14:06.151042','3','Takım Elbise 012593123','[{"added": {}}]',2,1,1);
INSERT INTO "django_admin_log" VALUES (6,'2019-05-09 23:14:29.377833','4','Takım Elbise 013512593','[{"added": {}}]',2,1,1);
INSERT INTO "django_admin_log" VALUES (7,'2019-05-09 23:14:54.960726','5','Takım Elbise 096312593','[{"added": {}}]',2,1,1);
INSERT INTO "django_admin_log" VALUES (8,'2019-05-09 23:42:12.227022','6','Takım Elbise 012593','[{"added": {}}]',2,1,1);
INSERT INTO "django_admin_log" VALUES (9,'2019-05-09 23:46:20.483154','7','Takım Elbise 013123293','[{"added": {}}]',2,1,1);
INSERT INTO "django_admin_log" VALUES (10,'2019-05-09 23:46:39.402370','8','Takım Elbise A-1','[{"added": {}}]',2,1,1);
INSERT INTO "django_admin_log" VALUES (11,'2019-05-09 23:47:09.292979','9','Takım Elbise 013293B-2','[{"added": {}}]',2,1,1);
INSERT INTO "django_admin_log" VALUES (12,'2019-05-09 23:47:33.013851','10','Takım Elbise 013293B-23','[{"added": {}}]',2,1,1);
INSERT INTO "django_admin_log" VALUES (13,'2019-05-09 23:47:33.094331','11','Takım Elbise 013293B-23','[{"added": {}}]',2,1,1);
INSERT INTO "django_admin_log" VALUES (14,'2019-05-10 05:23:10.557188','1','MacroMan','[{"added": {}}]',10,1,1);
INSERT INTO "django_admin_log" VALUES (15,'2019-05-10 05:53:07.280611','1','MacroMan','[{"changed": {"fields": ["detailone"]}}]',10,1,2);
INSERT INTO "django_admin_log" VALUES (16,'2019-05-10 05:54:57.711228','1','MacroMan','[{"changed": {"fields": ["detailone", "detailtwo", "detailthree"]}}]',10,1,2);
INSERT INTO "django_admin_log" VALUES (17,'2019-05-10 13:00:18.982247','1','MacroMan','[{"changed": {"fields": ["detailtwo"]}}]',10,1,2);
INSERT INTO "django_admin_log" VALUES (18,'2019-05-10 13:01:17.754719','1','MacroMan','[{"changed": {"fields": ["detailtwo"]}}]',10,1,2);
INSERT INTO "django_admin_log" VALUES (19,'2019-05-10 13:01:17.826680','1','MacroMan','[]',10,1,2);
INSERT INTO "django_admin_log" VALUES (20,'2019-05-10 13:06:21.471594','1','MacroMan','[{"changed": {"fields": ["detailone"]}}]',10,1,2);
INSERT INTO "django_admin_log" VALUES (21,'2019-05-10 13:50:28.533624','1','Kampanya','[{"added": {}}]',12,1,1);
INSERT INTO "django_admin_log" VALUES (22,'2019-05-10 13:58:07.888823','1','Kampanya','[]',12,1,2);
INSERT INTO "django_admin_log" VALUES (23,'2019-05-10 14:00:48.359727','1','Footer','[{"added": {}}]',11,1,1);
INSERT INTO "django_admin_log" VALUES (24,'2019-05-14 10:56:39.990771','1','ProductImage object (1)','[{"added": {}}]',13,1,1);
INSERT INTO "django_admin_log" VALUES (25,'2019-05-14 10:56:46.313786','2','ProductImage object (2)','[{"added": {}}]',13,1,1);
INSERT INTO "django_admin_log" VALUES (26,'2019-05-14 10:56:54.020692','3','ProductImage object (3)','[{"added": {}}]',13,1,1);
INSERT INTO "django_admin_log" VALUES (27,'2019-05-14 11:06:29.954587','11','Takım Elbise 013293B-23','[{"changed": {"fields": ["detail"]}}, {"added": {"name": "product image", "object": "ProductImage object (4)"}}]',2,1,2);
INSERT INTO "django_admin_log" VALUES (28,'2019-05-14 12:39:36.476110','3','Dış Giyim -> Palto','[{"added": {}}]',1,1,1);
INSERT INTO "django_admin_log" VALUES (29,'2019-05-14 12:43:44.687976','4','Dış Giyim -> Kot Ceket','[{"added": {}}]',1,1,1);
INSERT INTO "django_admin_log" VALUES (30,'2019-05-14 12:50:28.478710','5','Dış Giyim -> Kot Ceket -> deneme','[{"added": {}}]',1,1,1);
INSERT INTO "django_admin_log" VALUES (31,'2019-05-14 12:55:53.370597','6','Dış Giyim->dsadsa','[{"added": {}}]',1,1,1);
INSERT INTO "django_admin_log" VALUES (32,'2019-05-15 01:59:45.347444','7','Dış Giyim->yeter','[{"added": {}}]',1,1,1);
INSERT INTO "django_admin_log" VALUES (33,'2019-05-15 02:07:45.856173','8','Dış Giyim->sadsa','[{"added": {}}]',1,1,1);
INSERT INTO "django_admin_log" VALUES (34,'2019-06-05 05:40:16.071729','7','Dış Giyim->yeter','',1,1,3);
INSERT INTO "django_admin_log" VALUES (35,'2019-06-05 05:40:21.226881','5','Dış Giyim->Kot Ceket->deneme','',1,1,3);
INSERT INTO "django_admin_log" VALUES (36,'2019-06-05 05:40:24.166884','6','Dış Giyim->dsadsa','',1,1,3);
INSERT INTO "django_admin_log" VALUES (37,'2019-06-05 05:40:26.992048','8','Dış Giyim->sadsa','',1,1,3);
INSERT INTO "django_migrations" VALUES (1,'contenttypes','0001_initial','2019-05-09 20:57:59.193376');
INSERT INTO "django_migrations" VALUES (2,'auth','0001_initial','2019-05-09 20:57:59.230343');
INSERT INTO "django_migrations" VALUES (3,'admin','0001_initial','2019-05-09 20:57:59.274948');
INSERT INTO "django_migrations" VALUES (4,'admin','0002_logentry_remove_auto_add','2019-05-09 20:57:59.297909');
INSERT INTO "django_migrations" VALUES (5,'admin','0003_logentry_add_action_flag_choices','2019-05-09 20:57:59.323223');
INSERT INTO "django_migrations" VALUES (6,'contenttypes','0002_remove_content_type_name','2019-05-09 20:57:59.354205');
INSERT INTO "django_migrations" VALUES (7,'auth','0002_alter_permission_name_max_length','2019-05-09 20:57:59.376193');
INSERT INTO "django_migrations" VALUES (8,'auth','0003_alter_user_email_max_length','2019-05-09 20:57:59.400189');
INSERT INTO "django_migrations" VALUES (9,'auth','0004_alter_user_username_opts','2019-05-09 20:57:59.427793');
INSERT INTO "django_migrations" VALUES (10,'auth','0005_alter_user_last_login_null','2019-05-09 20:57:59.449794');
INSERT INTO "django_migrations" VALUES (11,'auth','0006_require_contenttypes_0002','2019-05-09 20:57:59.466535');
INSERT INTO "django_migrations" VALUES (12,'auth','0007_alter_validators_add_error_messages','2019-05-09 20:57:59.491580');
INSERT INTO "django_migrations" VALUES (13,'auth','0008_alter_user_username_max_length','2019-05-09 20:57:59.513593');
INSERT INTO "django_migrations" VALUES (14,'auth','0009_alter_user_last_name_max_length','2019-05-09 20:57:59.533611');
INSERT INTO "django_migrations" VALUES (15,'auth','0010_alter_group_name_max_length','2019-05-09 20:57:59.560489');
INSERT INTO "django_migrations" VALUES (16,'auth','0011_update_proxy_permissions','2019-05-09 20:57:59.583456');
INSERT INTO "django_migrations" VALUES (17,'product','0001_initial','2019-05-09 20:57:59.605658');
INSERT INTO "django_migrations" VALUES (18,'sessions','0001_initial','2019-05-09 20:57:59.622696');
INSERT INTO "django_migrations" VALUES (19,'product','0002_auto_20190510_0426','2019-05-10 01:26:21.390246');
INSERT INTO "django_migrations" VALUES (20,'home','0001_initial','2019-05-10 05:12:09.470990');
INSERT INTO "django_migrations" VALUES (21,'home','0002_auto_20190510_0814','2019-05-10 05:14:30.819067');
INSERT INTO "django_migrations" VALUES (22,'home','0003_remove_pagedetail_parentid','2019-05-10 05:18:30.059165');
INSERT INTO "django_migrations" VALUES (23,'home','0004_footer_kampanya','2019-05-10 13:44:38.331275');
INSERT INTO "django_migrations" VALUES (24,'product','0003_productimage','2019-05-14 10:54:34.984987');
INSERT INTO "django_migrations" VALUES (25,'product','0004_auto_20190514_1536','2019-05-14 12:36:54.510730');
INSERT INTO "django_migrations" VALUES (26,'product','0005_remove_category_parentid','2019-05-14 12:43:02.174736');
INSERT INTO "django_migrations" VALUES (27,'product','0006_auto_20190514_1547','2019-05-14 12:48:03.348445');
INSERT INTO "django_migrations" VALUES (28,'product','0007_auto_20190514_1553','2019-05-14 12:53:19.371536');
CREATE INDEX IF NOT EXISTS "product_category_parent_id_f6860923" ON "product_category" (
	"parent_id"
);
CREATE INDEX IF NOT EXISTS "product_category_slug_e1f8ccc4" ON "product_category" (
	"slug"
);
CREATE UNIQUE INDEX IF NOT EXISTS "product_category_slug_parent_id_688dd2ae_uniq" ON "product_category" (
	"slug",
	"parent_id"
);
CREATE INDEX IF NOT EXISTS "product_productimage_product_id_544084bb" ON "product_productimage" (
	"product_id"
);
CREATE INDEX IF NOT EXISTS "product_product_category_id_0c725779" ON "product_product" (
	"category_id"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
COMMIT;
